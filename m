Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B499A1CFA4
	for <regressions@lists.linux.dev>; Mon, 20 Nov 2023 14:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YODVhvvG"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6be1bc5aa1cso4555231b3a.3
        for <regressions@lists.linux.dev>; Mon, 20 Nov 2023 06:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700490767; x=1701095567; darn=lists.linux.dev;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOAw/zIXi+FzqKMdgI/+L4kTZrAvZjggV29StY6YtLY=;
        b=YODVhvvGCa539MiX1qBCBHa7B4XuRHYQjv4mHu8mKuO+9oWCWhUcaRD/3I8smWNlbT
         HrlsodXXpM7/dpuQMji7gsoPPNWImOSliA64nGRi480RPabqS/yR5kLNNPckI/dk9g0A
         hDDDblYiOyyNMoH0+YadobdgDe4d3/rBVduYpa/fm15zYv5p3hiESogJKBowiLDitIwL
         opan/pL03dyOIt9LB2+1lJASy1XwxXC1NWd5eIjV7lzAlCoJXC3bblvb6VmtcJ185N56
         RxfE0+ez7NpUU8WM/YmnsWXenrWnUHZcUSVT/SuQBb66elCmS2hPczMkBDP+QJjmrqBV
         53OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700490767; x=1701095567;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QOAw/zIXi+FzqKMdgI/+L4kTZrAvZjggV29StY6YtLY=;
        b=DwFjpD94NAxLy3dyc9821K46qq/C/J0KfZaMMsWz4+OvyEYBQcDkUkAoXAHVQtPQGM
         l4e7K2aPqd8ayMfRlBAxI1trbG6YEJyj3o0z7ImI7wn80N1ZA72KBO80QNwFpMY1GqZ7
         0pyGX3za46T+LcPFcPFopCfWhFQUxePwJ2ds9K/Yh1P/nEVR6NwNz4C8cUIvX/OqZqp7
         qz3lbPyCUu9H7Y8hrRnKLrMwx9Vfyt82f0ZM4MSFxq66/kADtuJ1kgnFD6Vb2ZZuciWC
         g5uf9dQig59VhJZtp0VRk15TFMbdY2ihGACqZIwh1UvWF5MTfoKErMLTxKUZyh+J39U0
         R7mg==
X-Gm-Message-State: AOJu0Ywo6EsQqHsR9n1Xgr7DIoJiequ3yKpristPOfcX67Ub7aSKQzk1
	75sP2Bvfx/8dr59OHcsqmCM=
X-Google-Smtp-Source: AGHT+IGdeEZV2XQ+nc4vhI5XzXjHXChhGZStVVXQjtYg/l4PkwhfHO3JhrNH8tPkGoBPevInZ86rig==
X-Received: by 2002:a05:6a21:6da1:b0:187:2fda:79d8 with SMTP id wl33-20020a056a216da100b001872fda79d8mr9599308pzb.57.1700490766815;
        Mon, 20 Nov 2023 06:32:46 -0800 (PST)
Received: from localhost (203-219-179-16.tpgi.com.au. [203.219.179.16])
        by smtp.gmail.com with ESMTPSA id du7-20020a056a002b4700b006cbb44f9108sm1064457pfb.170.2023.11.20.06.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 06:32:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Nov 2023 00:32:41 +1000
Message-Id: <CX3PNZ6WVZT2.1FF3ZLUTDCX6R@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Michael Ellerman" <mpe@ellerman.id.au>, "Timothy Pearson"
 <tpearson@raptorengineering.com>, "Jens Axboe" <axboe@kernel.dk>,
 "regressions" <regressions@lists.linux.dev>, "christophe leroy"
 <christophe.leroy@csgroup.eu>, "linuxppc-dev"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
X-Mailer: aerc 0.15.2
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com> <877cmc7ve9.fsf@mail.lhotse>
In-Reply-To: <877cmc7ve9.fsf@mail.lhotse>

Yeah, awesome.

On Mon Nov 20, 2023 at 5:10 PM AEST, Michael Ellerman wrote:
> Hi Timothy,
>
> Great work debugging this. I think your fix is good, but I want to unders=
tand it
> a bit more to make sure I can explain why we haven't seen it outside of i=
o-uring.

Analysis seems right to me.

Probably the best minimal fix. But I wonder if we should just use the
one path for saving/flushing/giving up, just use giveup instead of
save?

KVM looks odd too, and actually gets this wrong. In a way that's not
fixed by Timothy's patch, because it's just not restoring userspace
registers at all. Fortunately QEMU isn't in the habit of using non
volatile FP/VEC registers over a VCPU ioctl, but there's no reason it
couldn't do since GCC/LLVM can easily use them. KVM really wants to be
using giveup.

Thanks,
Nick

> If this can be triggered outside of io-uring then I have even more backpo=
rting
> in my future :}
>
> Typically save_fpu() is called from __giveup_fpu() which saves the FP reg=
s and
> also *turns off FP* in the tasks MSR, meaning the kernel will reload the =
FP regs
> from the thread struct before letting the task use FP again. So in that c=
ase
> save_fpu() is free to clobber fr0 because the FP regs no longer hold live=
 values
> for the task.
>
> There is another case though, which is the path via:
>   copy_process()
>     dup_task_struct()
>       arch_dup_task_struct()
>         flush_all_to_thread()
>           save_all()
>
> That path saves the FP regs but leaves them live. That's meant as an
> optimisation for a process that's using FP/VSX and then calls fork(), lea=
ving
> the regs live means the parent process doesn't have to take a fault after=
 the
> fork to get its FP regs back.
>
> That path does clobber fr0, but fr0 is volatile across a syscall, and the=
 only
> way to reach copy_process() from userspace is via a syscall. So in normal=
 usage
> fr0 being clobbered across a syscall shouldn't cause data corruption.
>
> Even if we handle a signal on the return from the fork() syscall, the wor=
st that
> happens is that the task's thread struct holds the clobbered fr0, but the=
 task
> doesn't care (because fr0 is volatile across the syscall anyway).
>
> That path is something like:
>
> system_call_vectored_common()
>   system_call_exception()
>     sys_fork()
>       kernel_clone()
>         copy_process()
>           dup_task_struct()
>             arch_dup_task_struct()
>               flush_all_to_thread()
>                 save_all()
>                   if (tsk->thread.regs->msr & MSR_FP)
>                     save_fpu()
>                     # does not clear MSR_FP from regs->msr
>   syscall_exit_prepare()
>     interrupt_exit_user_prepare_main()
>       do_notify_resume()
>         get_signal()
>         handle_rt_signal64()
>           prepare_setup_sigcontext()
>             flush_fp_to_thread()
>               if (tsk->thread.regs->msr & MSR_FP)
>                 giveup_fpu()
>                   __giveup_fpu
>                     save_fpu()
>                     # clobbered fr0 is saved, but task considers it volat=
ile
>                     # across syscall anyway
>
>
> But we now have a new path, because io-uring can call copy_process() via
> create_io_thread() from the signal handling path. That's OK if the signal=
 is
> handled as we return from a syscall, but it's not OK if the signal is han=
dled
> due to some other interrupt.
>
> Which is:
>
> interrupt_return_srr_user()
>   interrupt_exit_user_prepare()
>     interrupt_exit_user_prepare_main()
>       do_notify_resume()
>         get_signal()
>           task_work_run()
>             create_worker_cb()
>               create_io_worker()
>                 copy_process()
>                   dup_task_struct()
>                     arch_dup_task_struct()
>                       flush_all_to_thread()
>                         save_all()
>                           if (tsk->thread.regs->msr & MSR_FP)
>                             save_fpu()
>                             # fr0 is clobbered and potentially live in us=
erspace
>
>
> So tldr I think the corruption is only an issue since io-uring started do=
ing
> the clone via signal, which I think matches the observed timeline of this=
 bug
> appearing.
>
> Gotta run home, will have a closer look at the actual patch later on.
>
> cheers
>
>
> Timothy Pearson <tpearson@raptorengineering.com> writes:
> > During floating point and vector save to thread data fr0/vs0 are clobbe=
red
> > by the FPSCR/VSCR store routine.  This leads to userspace register corr=
uption
> > and application data corruption / crash under the following rare condit=
ion:
> >
> >  * A userspace thread is executing with VSX/FP mode enabled
> >  * The userspace thread is making active use of fr0 and/or vs0
> >  * An IPI is taken in kernel mode, forcing the userspace thread to resc=
hedule
> >  * The userspace thread is interrupted by the IPI before accessing data=
 it
> >    previously stored in fr0/vs0
> >  * The thread being switched in by the IPI has a pending signal
> >
> > If these exact criteria are met, then the following sequence happens:
> >
> >  * The existing thread FP storage is still valid before the IPI, due to=
 a
> >    prior call to save_fpu() or store_fp_state().  Note that the current
> >    fr0/vs0 registers have been clobbered, so the FP/VSX state in regist=
ers
> >    is now invalid pending a call to restore_fp()/restore_altivec().
> >  * IPI -- FP/VSX register state remains invalid
> >  * interrupt_exit_user_prepare_main() calls do_notify_resume(),
> >    due to the pending signal
> >  * do_notify_resume() eventually calls save_fpu() via giveup_fpu(), whi=
ch
> >    merrily reads and saves the invalid FP/VSX state to thread local sto=
rage.
> >  * interrupt_exit_user_prepare_main() calls restore_math(), writing the=
 invalid
> >    FP/VSX state back to registers.
> >  * Execution is released to userspace, and the application crashes or c=
orrupts
> >    data.
> >
> > Without the pending signal, do_notify_resume() is never called, therefo=
re the
> > invalid register state does't matter as it is overwritten nearly immedi=
ately
> > by interrupt_exit_user_prepare_main() calling restore_math() before ret=
urn
> > to userspace.
> >
> > Restore fr0/vs0 after FPSCR/VSCR store has completed for both the fp an=
d
> > altivec register save paths.
> >
> > Tested under QEMU in kvm mode, running on a Talos II workstation with d=
ual
> > POWER9 DD2.2 CPUs.
> >
> > Closes: https://lore.kernel.org/all/480932026.45576726.1699374859845.Ja=
vaMail.zimbra@raptorengineeringinc.com/
> > Closes: https://lore.kernel.org/linuxppc-dev/480221078.47953493.1700206=
777956.JavaMail.zimbra@raptorengineeringinc.com/
> > Tested-by: Timothy Pearson <tpearson@raptorengineering.com>
> > Tested-by: Jens Axboe <axboe@kernel.dk>
> > Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> > ---
> >  arch/powerpc/kernel/fpu.S    | 13 +++++++++++++
> >  arch/powerpc/kernel/vector.S |  2 ++
> >  2 files changed, 15 insertions(+)
> >
> > diff --git a/arch/powerpc/kernel/fpu.S b/arch/powerpc/kernel/fpu.S
> > index 6a9acfb690c9..2f8f3f93cbb6 100644
> > --- a/arch/powerpc/kernel/fpu.S
> > +++ b/arch/powerpc/kernel/fpu.S
> > @@ -23,6 +23,15 @@
> >  #include <asm/feature-fixups.h>
> > =20
> >  #ifdef CONFIG_VSX
> > +#define __REST_1FPVSR(n,c,base)						\
> > +BEGIN_FTR_SECTION							\
> > +	b	2f;							\
> > +END_FTR_SECTION_IFSET(CPU_FTR_VSX);					\
> > +	REST_FPR(n,base);						\
> > +	b	3f;							\
> > +2:	REST_VSR(n,c,base);						\
> > +3:
> > +
> >  #define __REST_32FPVSRS(n,c,base)					\
> >  BEGIN_FTR_SECTION							\
> >  	b	2f;							\
> > @@ -41,9 +50,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX);					\
> >  2:	SAVE_32VSRS(n,c,base);						\
> >  3:
> >  #else
> > +#define __REST_1FPVSR(n,b,base)		REST_FPR(n, base)
> >  #define __REST_32FPVSRS(n,b,base)	REST_32FPRS(n, base)
> >  #define __SAVE_32FPVSRS(n,b,base)	SAVE_32FPRS(n, base)
> >  #endif
> > +#define REST_1FPVSR(n,c,base)   __REST_1FPVSR(n,__REG_##c,__REG_##base=
)
> >  #define REST_32FPVSRS(n,c,base) __REST_32FPVSRS(n,__REG_##c,__REG_##ba=
se)
> >  #define SAVE_32FPVSRS(n,c,base) __SAVE_32FPVSRS(n,__REG_##c,__REG_##ba=
se)
> > =20
> > @@ -67,6 +78,7 @@ _GLOBAL(store_fp_state)
> >  	SAVE_32FPVSRS(0, R4, R3)
> >  	mffs	fr0
> >  	stfd	fr0,FPSTATE_FPSCR(r3)
> > +	REST_1FPVSR(0, R4, R3)
> >  	blr
> >  EXPORT_SYMBOL(store_fp_state)
> > =20
> > @@ -138,4 +150,5 @@ _GLOBAL(save_fpu)
> >  2:	SAVE_32FPVSRS(0, R4, R6)
> >  	mffs	fr0
> >  	stfd	fr0,FPSTATE_FPSCR(r6)
> > +	REST_1FPVSR(0, R4, R6)
> >  	blr
> > diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.=
S
> > index 4094e4c4c77a..80b3f6e476b6 100644
> > --- a/arch/powerpc/kernel/vector.S
> > +++ b/arch/powerpc/kernel/vector.S
> > @@ -33,6 +33,7 @@ _GLOBAL(store_vr_state)
> >  	mfvscr	v0
> >  	li	r4, VRSTATE_VSCR
> >  	stvx	v0, r4, r3
> > +	lvx	v0, 0, r3
> >  	blr
> >  EXPORT_SYMBOL(store_vr_state)
> > =20
> > @@ -109,6 +110,7 @@ _GLOBAL(save_altivec)
> >  	mfvscr	v0
> >  	li	r4,VRSTATE_VSCR
> >  	stvx	v0,r4,r7
> > +	lvx	v0,0,r7
> >  	blr
> > =20
> >  #ifdef CONFIG_VSX
> > --=20
> > 2.39.2

