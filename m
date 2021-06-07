Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF30129CA
	for <regressions@lists.linux.dev>; Mon,  7 Jun 2021 14:22:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7200760FEF;
	Mon,  7 Jun 2021 14:22:49 +0000 (UTC)
Date: Mon, 7 Jun 2021 16:22:45 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: regressions@lists.linux.dev, Andrea Righi <andrea.righi@canonical.com>
Subject: Regression when writing to /proc/<pid>/attr/
Message-ID: <20210607142245.eikvyeacqwwu6dn3@wittgenstein>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hey Linus,
hey Kees,

This morning I got a report about regressions when running containers
using lsm profiles when spawning a new process into a container. Andrea
bisected this to: bfb819ea20ce ("proc: Check /proc/$pid/attr/ writes
against file opener")

Spawning a new process into a running container is a bit messy due to
accumulated legacy cruft and here's one way we're currently doing it.
Parent process -> immediate process -> attached process: the
intermediate process is needed to attach to the container's namespaces
and then we fork so that the "attached process" is a proper member of
the pid namespace of the container, i.e. a child of PID 1 in the new pid
namespace.

The IPC mechanism is:

/* 
 * IPC mechanism: (X is receiver)
 *   initial process        transient process   attached process
 *        X           <---  send pid of
 *                          attached proc,
 *                          then exit
 *    send 0 ------------------------------------>    X
 *                                              [do initialization]
 *        X  <------------------------------------  send 1
 *   [add to cgroup, ...]
 *    send 2 ------------------------------------>    X
 *						[set LXC_ATTACH_NO_NEW_PRIVS]
 *        X  <------------------------------------  send 3
 *   [open LSM label fd]
 *    send 4 ------------------------------------>    X
 *   						[set LSM label]
 *   close socket                                 close socket
 *                                                run program
 */

With your fix Kees, the last step where the attached process writes its
own lsm profile fails with EPERM where it would succeed before. That
means v5.13 breaks all container users currently where it has worked
continuously before. :)

The LSM profile is written after we've become root in our new namespace

	if (!lxc_drop_groups())
		goto on_error;

	if (options->namespaces & CLONE_NEWUSER)
		if (!lxc_switch_uid_gid(ctx->setup_ns_uid, ctx->setup_ns_gid))
			goto on_error;

	if (attach_lsm(options) && ctx->lsm_label) {
		/* Change into our new LSM profile. */
		ret = ctx->lsm_ops->process_label_set_at(ctx->lsm_ops, fd_lsm, ctx->lsm_label, on_exec);
		if (ret < 0)
			goto on_error;

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

		TRACE("Set %s LSM label to \"%s\"", ctx->lsm_ops->name, ctx->lsm_label);
	}

So the effective ids of the process writing the lsm profile are
different from the ids of the process that opened the lsm fd in this
case.

Christian
