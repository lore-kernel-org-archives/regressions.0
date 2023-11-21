Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9AB1F93F
	for <regressions@lists.linux.dev>; Tue, 21 Nov 2023 07:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKmSLfR4"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6b7f0170d7bso5005424b3a.2
        for <regressions@lists.linux.dev>; Mon, 20 Nov 2023 23:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700553376; x=1701158176; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPkROMmbes+NoTwBo6+myJWaj5ksNAqKHgxIe4KqEts=;
        b=LKmSLfR47lLAtMMfh3qSG001q4w6rRYZgaK2YDUxFyod53vu/JVbvPQPbrzhG9f2t8
         Hl2Xxcdz19MKrMve0LQpR3S/jYHmmPoVp2W1goS0bWe4QjIXtbf4IxiWrNwqGWBP+iuy
         cYnHwptbp+yj2UeK67mb79X7Fh7P6HZpCGOOBUg+H13e64FBT4nk6uM+N2JyD1J8KPVE
         vp7YBMCi/fDi+Sn7Pi9WNOTHfKggV5GaSfR25kNAoe+1sfxFlCKhEkCg387Wbqkzfh6s
         1SA1sYi+XZ8r8j2LuGb8l5mWHmy++Uq4XKey+7BbCaV56/X80JmXhAfSsq/vve3hmYTO
         sP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700553376; x=1701158176;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xPkROMmbes+NoTwBo6+myJWaj5ksNAqKHgxIe4KqEts=;
        b=Q7URxyNj7Tw7rWYeVR3mDW7Srnq1JpNqN8SSPgzwGAK9YFVlI707/F2bvp3wS1TXpj
         y5K68wZHxDG2TA/+Q1L3s61PXzX86JZ6oc5PM1HI0lRs+0U5EP/KLV/t2dwLPMk+sAlC
         kTky1CyDvIdZKqcQ3pqV0zXE3kF0g1imvUKJvX+fOuGgnQw6L80PoMutth+YLR7IsnjQ
         XBqZa3YLtFkfwBz5vPwDSwYCirse9/mtR8sI1Rbb96w308zry1C2DZyGVKYaA7XURaJg
         Fi/4MX0yb5hAhuKxFUavJBcB5QKzzkDZkwm35p6HOWTDJxL6yQLci15iBZI8tmBr9i+G
         C4rg==
X-Gm-Message-State: AOJu0Yxn+sOBv+0klhNE86CBDZ1R/c94LfA4k+WJKMcxtLToEfubuL4m
	c0fcWRttIZaUW4iFtHvMXrc=
X-Google-Smtp-Source: AGHT+IGOCLqAMv/TBcLtTqQ5OkM/wL3HZhsfigdHGhc8FOL3f0xgpNEsonSURDAai5Ll61v7nVXwZg==
X-Received: by 2002:a05:6a20:8f14:b0:18a:e86f:f246 with SMTP id b20-20020a056a208f1400b0018ae86ff246mr990692pzk.10.1700553376311;
        Mon, 20 Nov 2023 23:56:16 -0800 (PST)
Received: from localhost (203-219-179-16.tpgi.com.au. [203.219.179.16])
        by smtp.gmail.com with ESMTPSA id ju4-20020a170903428400b001cc3875e658sm7340245plb.303.2023.11.20.23.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 23:56:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Nov 2023 17:56:10 +1000
Message-Id: <CX4BUXJD624S.2U2UZ9M6H198U@wheely>
Cc: "Jens Axboe" <axboe@kernel.dk>, "regressions"
 <regressions@lists.linux.dev>, "christophe leroy"
 <christophe.leroy@csgroup.eu>, "linuxppc-dev"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Timothy Pearson" <tpearson@raptorengineering.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.15.2
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com> <877cmc7ve9.fsf@mail.lhotse> <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com> <874jhg6lkn.fsf@mail.lhotse> <608737213.48890358.1700529837699.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <608737213.48890358.1700529837699.JavaMail.zimbra@raptorengineeringinc.com>

On Tue Nov 21, 2023 at 11:23 AM AEST, Timothy Pearson wrote:
>
>
> ----- Original Message -----
> > From: "Michael Ellerman" <mpe@ellerman.id.au>
> > To: "Timothy Pearson" <tpearson@raptorengineering.com>
> > Cc: "Jens Axboe" <axboe@kernel.dk>, "regressions" <regressions@lists.li=
nux.dev>, "npiggin" <npiggin@gmail.com>,
> > "christophe leroy" <christophe.leroy@csgroup.eu>, "linuxppc-dev" <linux=
ppc-dev@lists.ozlabs.org>
> > Sent: Monday, November 20, 2023 5:39:52 PM
> > Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altive=
c register  save
>
> > Timothy Pearson <tpearson@raptorengineering.com> writes:
> >> ----- Original Message -----
> >>> From: "Michael Ellerman" <mpe@ellerman.id.au>
> > ...
> >>>=20
> >>> But we now have a new path, because io-uring can call copy_process() =
via
> >>> create_io_thread() from the signal handling path. That's OK if the si=
gnal is
> >>> handled as we return from a syscall, but it's not OK if the signal is=
 handled
> >>> due to some other interrupt.
> >>>=20
> >>> Which is:
> >>>=20
> >>> interrupt_return_srr_user()
> >>>  interrupt_exit_user_prepare()
> >>>    interrupt_exit_user_prepare_main()
> >>>      do_notify_resume()
> >>>        get_signal()
> >>>          task_work_run()
> >>>            create_worker_cb()
> >>>              create_io_worker()
> >>>                copy_process()
> >>>                  dup_task_struct()
> >>>                    arch_dup_task_struct()
> >>>                      flush_all_to_thread()
> >>>                        save_all()
> >>>                          if (tsk->thread.regs->msr & MSR_FP)
> >>>                            save_fpu()
> >>>                            # fr0 is clobbered and potentially live in=
 userspace
> >>>=20
> >>>=20
> >>> So tldr I think the corruption is only an issue since io-uring starte=
d doing
> >>> the clone via signal, which I think matches the observed timeline of =
this bug
> >>> appearing.
> >>
> >> I agree the corruption really only started showing up in earnest on
> >> io_uring clone-via-signal, as this was confirmed several times in the
> >> course of debugging.
> >=20
> > Thanks.
> >=20
> >> Note as well that I may very well have a wrong call order in the
> >> commit message, since I was relying on a couple of WARN_ON() macros I
> >> inserted to check for a similar (but not identical) condition and
> >> didn't spend much time getting new traces after identifying the root
> >> cause.
> >=20
> > Yep no worries. I'll reword it to incorporate the full path from my mai=
l.
> >=20
> >> I went back and grabbed some real world system-wide stack traces, sinc=
e I now
> >> know what to trigger on.  A typical example is:
> >>
> >> interrupt_return_srr_user()
> >>  interrupt_exit_user_prepare()
> >>   interrupt_exit_user_prepare_main()
> >>    schedule()
> >>     __schedule()
> >>      __switch_to()
> >>       giveup_all()
> >>        # tsk->thread.regs->msr MSR_FP is still set here
> >>        __giveup_fpu()
> >>         save_fpu()
> >>         # fr0 is clobbered and potentially live in userspace
> >=20
> > fr0 is not live there.
> >=20
> > __giveup_fpu() does roughly:
> >=20
> >	msr =3D tsk->thread.regs->msr;
> >	msr &=3D ~(MSR_FP|MSR_FE0|MSR_FE1);
> >        msr &=3D ~MSR_VSX;
> >	tsk->thread.regs =3D msr;
> >=20
> > ie. it clears the FP etc. bits from the task's MSR. That means the FP
> > state will be reloaded from the thread struct before the task is run ag=
ain.
> >=20
> > Also on that path we're switching to another task, so we'll be reloadin=
g
> > the other task's FP state before returning to userspace.
> >=20
> > So I don't see any bug there.
>
> Yeah, you're right.  I was trying to get traces while doing something els=
e, and didn't think that all the way through, sorry. :)  It's not going to =
be super easy to get a real trace (I was triggering the WARN_ON() from of f=
r0 getting set to to FPSCR), so let's just assume it's mainly the path you =
manually found above and update the commit message accordingly.
>
> > There's only two places that call save_fpu() and skip the giveup logic,
> > which is save_all() and kvmppc_save_user_regs().
>
> Now that's interesting as well, since it might explain some issues I've s=
een for years on a specific QEMU workload.  Once this is backported to stab=
le I'll need to get the kernels updated on those boxes and see if the issue=
s disappear...

KVM issue is actually slightly different. You need this (lightly
verified to solve issue so far).

---

From c12fbed0e12207058282a2411da59b43b1f96c49 Mon Sep 17 00:00:00 2001
From: Nicholas Piggin <npiggin@gmail.com>
Date: Tue, 21 Nov 2023 17:03:55 +1000
Subject: [PATCH] KVM: PPC: Book3S HV: Fix KVM_RUN ioctl clobbering FP/VEC
 registers

Before running a guest, the host process's FP/VEC registers are saved
away like a context switch or a kernel use of those regs. The guest
FP/VEC registers can then be loaded as needed. The host process
registers would be restored lazily when it uses FP/VEC again.

KVM HV did not do this correctly. The registers are saved in the
thread struct, but the FP/VEC/VSX bits remain enabled in the user
MSR, leading the kernel to think they are still valid. Even after
they are clobbered by guest registers. This leads to the host
process getting guest FP/VEC register values.

KVM must be invoked by ioctl in this path, and almost certainly that
means a C call to a wrapper function, but that still leaves real
possibility of corruption in for non-volatile registers to cause
problems for QEMU process.
---
 arch/powerpc/kernel/process.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 392404688cec..9452a54d356c 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1198,11 +1198,11 @@ void kvmppc_save_user_regs(void)
=20
 	usermsr =3D current->thread.regs->msr;
=20
+	/* Caller has enabled FP/VEC/VSX/TM in MSR */
 	if (usermsr & MSR_FP)
-		save_fpu(current);
-
+		__giveup_fpu(current);
 	if (usermsr & MSR_VEC)
-		save_altivec(current);
+		__giveup_altivec(current);
=20
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	if (usermsr & MSR_TM) {
--=20
2.42.0

