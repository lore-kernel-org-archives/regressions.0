Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFE22FAD
	for <regressions@lists.linux.dev>; Tue,  8 Jun 2021 08:51:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26BBF60234;
	Tue,  8 Jun 2021 08:51:17 +0000 (UTC)
Date: Tue, 8 Jun 2021 10:51:15 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	regressions@lists.linux.dev,
	Andrea Righi <andrea.righi@canonical.com>
Subject: Re: Regression when writing to /proc/<pid>/attr/
Message-ID: <20210608085115.tosijd5f7lrxsrka@wittgenstein>
References: <20210607142245.eikvyeacqwwu6dn3@wittgenstein>
 <202106071621.C11535A@keescook>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202106071621.C11535A@keescook>

On Mon, Jun 07, 2021 at 04:38:50PM -0700, Kees Cook wrote:
> On Mon, Jun 07, 2021 at 04:22:45PM +0200, Christian Brauner wrote:
> > Hey Linus,
> > hey Kees,
> > 
> > This morning I got a report about regressions when running containers
> > using lsm profiles when spawning a new process into a container. Andrea
> > bisected this to: bfb819ea20ce ("proc: Check /proc/$pid/attr/ writes
> > against file opener")
> 
> Aaagh.
> 
> > Spawning a new process into a running container is a bit messy due to
> > accumulated legacy cruft and here's one way we're currently doing it.
> > Parent process -> immediate process -> attached process: the
> > intermediate process is needed to attach to the container's namespaces
> > and then we fork so that the "attached process" is a proper member of
> > the pid namespace of the container, i.e. a child of PID 1 in the new pid
> > namespace.
> >
> > The IPC mechanism is:
> 
> In here, "initial" means "parent", "transient" means "intermediate"?
> 
> > 
> > /* 
> >  * IPC mechanism: (X is receiver)
> >  *   initial process        transient process   attached process
> >  *        X           <---  send pid of
> >  *                          attached proc,
> >  *                          then exit
> >  *    send 0 ------------------------------------>    X
> >  *                                              [do initialization]
> >  *        X  <------------------------------------  send 1
> >  *   [add to cgroup, ...]
> >  *    send 2 ------------------------------------>    X
> >  *						[set LXC_ATTACH_NO_NEW_PRIVS]
> >  *        X  <------------------------------------  send 3
> >  *   [open LSM label fd]
> 
> As in, "initial process" is opening "attached process"'s attr fd?

Yes.

> 
> >  *    send 4 ------------------------------------>    X
> >  *   						[set LSM label]
> 
> Does "initial" send the fd to "attached"?

Yes.

> 
> >  *   close socket                                 close socket
> >  *                                                run program
> >  */
> > 
> > With your fix Kees, the last step where the attached process writes its
> > own lsm profile fails with EPERM where it would succeed before. That
> > means v5.13 breaks all container users currently where it has worked
> > continuously before. :)
> 
> I can only understand this if the fd is passed to the writer, or the
> writer opens, changes creds, and then writes?

The fd is opened by the <initial process> which is the parent of the
<attached process>. (The <attached process> is created with CLONE_PARENT).

The <initial process> openes the lsm fd for the <attached process> (The
<attached process> may not have procfs mounted or may not be attached to
the mount namespace, lack privileges, seccomp filter etc.) and then
sends it to the <attached process> so it can write its own lsm policy.

> 
> > The LSM profile is written after we've become root in our new namespace
> > 
> > 	if (!lxc_drop_groups())
> > 		goto on_error;
> > 
> > 	if (options->namespaces & CLONE_NEWUSER)
> > 		if (!lxc_switch_uid_gid(ctx->setup_ns_uid, ctx->setup_ns_gid))
> > 			goto on_error;
> > 
> > 	if (attach_lsm(options) && ctx->lsm_label) {
> > 		/* Change into our new LSM profile. */
> > 		ret = ctx->lsm_ops->process_label_set_at(ctx->lsm_ops, fd_lsm, ctx->lsm_label, on_exec);
> > 		if (ret < 0)
> > 			goto on_error;
> > 
> > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > 
> > 		TRACE("Set %s LSM label to \"%s\"", ctx->lsm_ops->name, ctx->lsm_label);
> > 	}
> > 
> > So the effective ids of the process writing the lsm profile are
> > different from the ids of the process that opened the lsm fd in this
> > case.
> 
> I'm assuming the issue is the latter (open, drop privs, write). And
> I assume fsuid/fsgid has changed? (i.e. cred_fscmp() couldn't be used
> either?)

Yes, when the <attached process> set*id()s in the CLONE_NEWUSER case it
will change creds so the creds of the opener and the creds of the writer
don't match. And yes, it'll change fs*id as well, i.e. set*id() will
cause an fs*id change implicitly.

Christian
