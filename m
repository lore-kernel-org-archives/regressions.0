Received: from r3-17.sinamail.sina.com.cn (r3-17.sinamail.sina.com.cn [202.108.3.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AF5C15C
	for <regressions@lists.linux.dev>; Tue, 15 Aug 2023 11:50:26 +0000 (UTC)
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([112.97.52.19])
	by sina.com (172.16.97.27) with ESMTP
	id 64DB65380000A43F; Tue, 15 Aug 2023 19:45:00 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 824581786931
From: Hillf Danton <hdanton@sina.com>
To: Tycho Andersen <tycho@tycho.pizza>
Cc: Miklos Szeredi <miklos@szeredi.hu>,
	=?iso-8859-1?Q?J=FCrg?= Billeter <j@bitron.ch>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] fuse: execve() fails with ETXTBSY due to async fuse_flush
Date: Tue, 15 Aug 2023 19:44:48 +0800
Message-Id: <20230815114448.1557-1-hdanton@sina.com>
In-Reply-To: <ZNqseD4hqHWmeF2w@tycho.pizza>
References: <4f66cded234462964899f2a661750d6798a57ec0.camel@bitron.ch> <CAJfpeguG4f4S-pq+_EXHxfB63mbof-VnaOy-7a-7seWLMj_xyQ@mail.gmail.com> <ZNozdrtKgTeTaMpX@tycho.pizza> <CAJfpegt6x_=F=mD8LEL4AZPbfCLGQrpurhtbDN4Ew50fd2ngqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 14 Aug 2023 16:36:40 -0600 Tycho Andersen <tycho@tycho.pizza>
> On Mon, Aug 14, 2023 at 04:35:56PM +0200, Miklos Szeredi wrote:
> > On Mon, 14 Aug 2023 at 16:00, Tycho Andersen <tycho@tycho.pizza> wrote:
> > 
> > > It seems like we really do need to wait here. I guess that means we
> > > need some kind of exit-proof wait?
> > 
> > Could you please recap the original problem?
> 
> Sure, the symptom is a deadlock, something like:
> 
> # cat /proc/1528591/stack
> [<0>] do_wait+0x156/0x2f0
> [<0>] kernel_wait4+0x8d/0x140
> [<0>] zap_pid_ns_processes+0x104/0x180
> [<0>] do_exit+0xa41/0xb80
> [<0>] do_group_exit+0x3a/0xa0
> [<0>] __x64_sys_exit_group+0x14/0x20
> [<0>] do_syscall_64+0x37/0xb0
> [<0>] entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> which is stuck waiting for:
> 
> # cat /proc/1544574/stack
> [<0>] request_wait_answer+0x12f/0x210
> [<0>] fuse_simple_request+0x109/0x2c0
> [<0>] fuse_flush+0x16f/0x1b0
> [<0>] filp_close+0x27/0x70
> [<0>] put_files_struct+0x6b/0xc0
> [<0>] do_exit+0x360/0xb80
> [<0>] do_group_exit+0x3a/0xa0
> [<0>] get_signal+0x140/0x870
> [<0>] arch_do_signal_or_restart+0xae/0x7c0
> [<0>] exit_to_user_mode_prepare+0x10f/0x1c0
> [<0>] syscall_exit_to_user_mode+0x26/0x40
> [<0>] do_syscall_64+0x46/0xb0
> [<0>] entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> I have a reproducer here:
> https://github.com/tych0/kernel-utils/blob/master/fuse2/Makefile#L7
> 
> The problem is that the second thread has called do_exit() ->
> exit_signals(), but then tries to request_wait_answer() which uses the
> core wait primitives that no longer get woken up from signals due to
> the code in exit_signals(). So when we try to exit the pid ns, the
> whole cleanup hangs.

Replacing 5a8bee63b1 ("fuse: in fuse_flush only wait if someone wants the
return code") with checking PF_EXITING in request_wait_answer() makes fix
or walkaround simpler.

Only for thoughts.

Hillf

+++ y/fs/fuse/dev.c
@@ -365,11 +365,12 @@ static void request_wait_answer(struct f
 {
 	struct fuse_conn *fc = req->fm->fc;
 	struct fuse_iqueue *fiq = &fc->iq;
-	int err;
+	int err = (current->flags & PF_EXITING) ? -EINTR : 0;
 
 	if (!fc->no_interrupt) {
 		/* Any signal may interrupt this */
-		err = wait_event_interruptible(req->waitq,
+		if (!err)
+			err = wait_event_interruptible(req->waitq,
 					test_bit(FR_FINISHED, &req->flags));
 		if (!err)
 			return;
@@ -383,7 +384,8 @@ static void request_wait_answer(struct f
 
 	if (!test_bit(FR_FORCE, &req->flags)) {
 		/* Only fatal signals may interrupt this */
-		err = wait_event_killable(req->waitq,
+		if (!err)
+			err = wait_event_killable(req->waitq,
 					test_bit(FR_FINISHED, &req->flags));
 		if (!err)
 			return;
@@ -400,6 +402,8 @@ static void request_wait_answer(struct f
 		spin_unlock(&fiq->lock);
 	}
 
+	if (err)
+		return;
 	/*
 	 * Either request is already in userspace, or it was forced.
 	 * Wait it out.
--
