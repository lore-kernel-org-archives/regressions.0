Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C83622
	for <regressions@lists.linux.dev>; Tue, 21 Nov 2023 00:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N98DR437"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6b20a48522fso4006937b3a.1
        for <regressions@lists.linux.dev>; Mon, 20 Nov 2023 16:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700525942; x=1701130742; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SN/OohZNMCwJlJlSuuwQc5xuwem9Qdkr9XpRThmJm6I=;
        b=N98DR437griKXfE5SggPOfhYpaWTQmcdRij6ODIeTTnGrzdomNtFgkLoi2YZUiyeyz
         MS89+mF3HYtengpiEhwyJ3bKxE0SUqV9wsL0CBOktvdOdicE4FUGRRCBGp7tSTFv7LH0
         Zakd1IEkDW5l1pJH5SlbjpraQpE8EVQDI9Rv01T5UWpzq3NJ7VAafLOoW4ymRPPAxLbM
         Xlu3+GsU+CJl1aYR0FG1XuMxF5ANP5xjVU9C66I+M8xS1/amBTxbu+xNbauhfvQlZ3ZY
         Dm1Dm9tabF10Sw0p8vOLE29SviIqvCE2/ca2kls0HnS7TJ5SGjbPVbgpc7b/XdomWfwg
         YtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700525942; x=1701130742;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SN/OohZNMCwJlJlSuuwQc5xuwem9Qdkr9XpRThmJm6I=;
        b=wrZYoWqMftaE0YPt6QCs1ioGLJ18JHsfoJGnAPC1WIQ2rVRzhUdu0e58dtJ/BhQVBq
         uLMOwDs+CzvaW+WWLnEGmQOPgZk435M7HwbeIRkJZAy614nDDOV6trr864l6dojI7smm
         zaNUbRhh57dAPwh2WFiRO66uGAjnC8wYBrqqSY1o+5mrB4t/U5DIJ4jNyZM829CLQbue
         zyOcU0hTuaYDxa2boE+Ecl5lQCl0ki737chX7LO7VqmMPeOEBrnj1wBhRL6wZrw43+rN
         l2EWEZfyccnH436cxF7SFoySyyCMfv6vt0RG6BXXsoZas/2FKtHJJX5B/B66o3Aeedio
         ycng==
X-Gm-Message-State: AOJu0YwQ8yRmYvnKaUAsyhGrJigyK7BfvcW2tTujntUsPRwdfmoZCbCU
	ZbWZ6RQudB7tTzSgGTlqafg=
X-Google-Smtp-Source: AGHT+IEwiTItc6jyfJ/YFTqZl2gcdBXk7tva5FECSW3MZ4Bo6L/H0RYYCzvhc7pnxGZO2bVNVrOMtg==
X-Received: by 2002:a05:6a00:a88:b0:6c3:1b7d:dac9 with SMTP id b8-20020a056a000a8800b006c31b7ddac9mr7653602pfl.34.1700525942147;
        Mon, 20 Nov 2023 16:19:02 -0800 (PST)
Received: from localhost (203-219-179-16.tpgi.com.au. [203.219.179.16])
        by smtp.gmail.com with ESMTPSA id u2-20020a631402000000b005b4b70738e5sm6686508pgl.8.2023.11.20.16.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 16:19:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Nov 2023 10:18:52 +1000
Message-Id: <CX424SO03Y1Q.2YCS9G1C3IAOW@wheely>
To: "Timothy Pearson" <tpearson@raptorengineering.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>
Cc: "Jens Axboe" <axboe@kernel.dk>, "regressions"
 <regressions@lists.linux.dev>, "christophe leroy"
 <christophe.leroy@csgroup.eu>, "linuxppc-dev"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.15.2
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com> <877cmc7ve9.fsf@mail.lhotse> <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com>

On Tue Nov 21, 2023 at 2:45 AM AEST, Timothy Pearson wrote:
>
>
> ----- Original Message -----
> > From: "Michael Ellerman" <mpe@ellerman.id.au>
> > To: "Timothy Pearson" <tpearson@raptorengineering.com>, "Jens Axboe" <a=
xboe@kernel.dk>, "regressions"
> > <regressions@lists.linux.dev>, "npiggin" <npiggin@gmail.com>, "christop=
he leroy" <christophe.leroy@csgroup.eu>,
> > "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> > Sent: Monday, November 20, 2023 1:10:06 AM
> > Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altive=
c register  save
>
> > Hi Timothy,
> >=20
> > Great work debugging this. I think your fix is good, but I want to unde=
rstand it
> > a bit more to make sure I can explain why we haven't seen it outside of
> > io-uring.
> > If this can be triggered outside of io-uring then I have even more back=
porting
> > in my future :}
> >=20
> > Typically save_fpu() is called from __giveup_fpu() which saves the FP r=
egs and
> > also *turns off FP* in the tasks MSR, meaning the kernel will reload th=
e FP regs
> > from the thread struct before letting the task use FP again. So in that=
 case
> > save_fpu() is free to clobber fr0 because the FP regs no longer hold li=
ve values
> > for the task.
> >=20
> > There is another case though, which is the path via:
> >  copy_process()
> >    dup_task_struct()
> >      arch_dup_task_struct()
> >        flush_all_to_thread()
> >          save_all()
> >=20
> > That path saves the FP regs but leaves them live. That's meant as an
> > optimisation for a process that's using FP/VSX and then calls fork(), l=
eaving
> > the regs live means the parent process doesn't have to take a fault aft=
er the
> > fork to get its FP regs back.
> >=20
> > That path does clobber fr0, but fr0 is volatile across a syscall, and t=
he only
> > way to reach copy_process() from userspace is via a syscall. So in norm=
al usage
> > fr0 being clobbered across a syscall shouldn't cause data corruption.
> >=20
> > Even if we handle a signal on the return from the fork() syscall, the w=
orst that
> > happens is that the task's thread struct holds the clobbered fr0, but t=
he task
> > doesn't care (because fr0 is volatile across the syscall anyway).
> >=20
> > That path is something like:
> >=20
> > system_call_vectored_common()
> >  system_call_exception()
> >    sys_fork()
> >      kernel_clone()
> >        copy_process()
> >          dup_task_struct()
> >            arch_dup_task_struct()
> >              flush_all_to_thread()
> >                save_all()
> >                  if (tsk->thread.regs->msr & MSR_FP)
> >                    save_fpu()
> >                    # does not clear MSR_FP from regs->msr
> >  syscall_exit_prepare()
> >    interrupt_exit_user_prepare_main()
> >      do_notify_resume()
> >        get_signal()
> >        handle_rt_signal64()
> >          prepare_setup_sigcontext()
> >            flush_fp_to_thread()
> >              if (tsk->thread.regs->msr & MSR_FP)
> >                giveup_fpu()
> >                  __giveup_fpu
> >                    save_fpu()
> >                    # clobbered fr0 is saved, but task considers it vola=
tile
> >                    # across syscall anyway
> >=20
> >=20
> > But we now have a new path, because io-uring can call copy_process() vi=
a
> > create_io_thread() from the signal handling path. That's OK if the sign=
al is
> > handled as we return from a syscall, but it's not OK if the signal is h=
andled
> > due to some other interrupt.
> >=20
> > Which is:
> >=20
> > interrupt_return_srr_user()
> >  interrupt_exit_user_prepare()
> >    interrupt_exit_user_prepare_main()
> >      do_notify_resume()
> >        get_signal()
> >          task_work_run()
> >            create_worker_cb()
> >              create_io_worker()
> >                copy_process()
> >                  dup_task_struct()
> >                    arch_dup_task_struct()
> >                      flush_all_to_thread()
> >                        save_all()
> >                          if (tsk->thread.regs->msr & MSR_FP)
> >                            save_fpu()
> >                            # fr0 is clobbered and potentially live in u=
serspace
> >=20
> >=20
> > So tldr I think the corruption is only an issue since io-uring started =
doing
> > the clone via signal, which I think matches the observed timeline of th=
is bug
> > appearing.
>
> I agree the corruption really only started showing up in earnest on io_ur=
ing clone-via-signal, as this was confirmed several times in the course of =
debugging.  Bear in mind however that we have seen very, very rare crashes =
over several years in other tasks, and I am starting to think this bug migh=
t be the root cause (see below).
>
> Note as well that I may very well have a wrong call order in the commit m=
essage, since I was relying on a couple of WARN_ON() macros I inserted to c=
heck for a similar (but not identical) condition and didn't spend much time=
 getting new traces after identifying the root cause.
>
> I went back and grabbed some real world system-wide stack traces, since I=
 now know what to trigger on.  A typical example is:
>
> interrupt_return_srr_user()
>  interrupt_exit_user_prepare()
>   interrupt_exit_user_prepare_main()
>    schedule()
>     __schedule()
>      __switch_to()
>       giveup_all()
>        # tsk->thread.regs->msr MSR_FP is still set here
>        __giveup_fpu()
>         save_fpu()
>         # fr0 is clobbered and potentially live in userspace
>
> This indicates that the pending signal is not actually required, it simpl=
y makes triggering much more likely.  Both the pending signal and the _TIF_=
NEED_RESCHED paths give up control and end up in the same overall position =
of trigging down-call routines that assume the FPU state is valid.

That seems probably true, but that's on the other side of the equation,
I think? Because __giveup_fpu does clear MSR[FP] before any context
switch or return to user is possile.

*After* we have clobbered fr0 without clearing MSR_FP from the user msr,
then yes any context switch or return to user will cause uerspace to
next run with a clobbered fr0. But getting to that fr0/msr state
requires the flush_all_to_thread(), and that needs to be called in a
path where user fr0 must not be clobbered. I don't see one other than
io-uring yet.

[ KVM via kvmppc_save_user_regs() (which is basically the same as
flush_all_to_thread()) can do it. Not via the fr0 clobber in save_fpu,
because this is called via a VCPU run ioctl, but KVM will later clobber
all FP/VEC registers via running guest code. So we clobber non-volatile
regs as well. This wouldn't be causing random corruption and crashes
though, only possibly bugs in code that runs KVM guests. ]

Thanks,
Nick

>
> perl and bash seem to be affected to some degree, though current builds d=
on't use enough VSX instructions rapidly enough to cause crashes with any s=
ignificant probability.  That said, over many years of running POWER at dat=
acenter scale I have seen enough random bash/perl crashes in the logs to re=
cognize the pattern; I think this has been a low-grade issue for a long tim=
e, but with an infantismally small chance of happening it was seen as rando=
m noise / hardware issues / other rare bugs in various programs.

