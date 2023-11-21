Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F3580E
	for <regressions@lists.linux.dev>; Tue, 21 Nov 2023 00:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmzsotnG"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1cc921a4632so43645565ad.1
        for <regressions@lists.linux.dev>; Mon, 20 Nov 2023 16:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700526467; x=1701131267; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBBoxetyuP8PrY6LsK5WuxZzMVjegd6dnnywtdG7bfU=;
        b=UmzsotnGrNFrtXBF0xigdYCzhAFnwO58/gsvdW5KCwTupYxA5hDZii7u+F9jare8nI
         tqFm6FHnmtu7VfZLVlWleOpcX/aOUzRzO1Qy0paseUfioo//rPfh0tnGt/7YbfAWJiXk
         y7TfAhEi8BHV/WP6F3OjwFRXgsjCoh3xeBGP0AEgJ2Uqcm5LH1vOXN84t+h/rH8IjzTQ
         p5/eN4cwiZobH19DZYoBV9rWK39cik++7Vt1ar+fbrjjhrcOjHcIj+U03d651qvxE3lp
         dOVfiW7GhI2dkyuj/ScL7O2fEnKqGKjx4KKbhJgTIirFQ7YA/W/YItS1RC3UKlnPVcJw
         DqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700526467; x=1701131267;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iBBoxetyuP8PrY6LsK5WuxZzMVjegd6dnnywtdG7bfU=;
        b=kgnDLYQ0F7cPDj3oHsIFDz+cl03cHucc33d50nqhh3kuQs/7GtZLSfdhbFo1v00TNk
         A1hYbuTXH/Kcsx/tzD8SIQlj4pipcqsbCAemsIRlg4iS1n2+X0jCVe+7trOCt4Xbjxgm
         eXnx8anzu859NmVUou5UoSMu1kpstoudk83UeMp2BB3hGSgxstgmn/1/EEqcVmeypLf/
         3uPosqcuFBRauPpy3AAF159O6CEE3Hs8tIZLDaBIsotf3n3EZQ2rnsVnGiNYMkzCdgy4
         0Qm3ecUq6/E5jYpcC32oxpCOyogj0cOp0GwtoCZ4C2IZZx7paQrD7sLcxZGXPGmUJTBw
         UyIg==
X-Gm-Message-State: AOJu0YyRQS2FFYdy5/OBv7N1skoPvapyas7/tHawsxteapbDoQ4ul95h
	azIDEAUVHaaI4YJP74YacTo=
X-Google-Smtp-Source: AGHT+IFoYSJbDqHLP+0BSTHPGDvO48jUdvK/tcby/7LrxEO3V1tLJBZIrFf+1ZwK7zquv11qJF1hng==
X-Received: by 2002:a17:903:2292:b0:1cf:595b:eabb with SMTP id b18-20020a170903229200b001cf595beabbmr7608979plh.27.1700526467327;
        Mon, 20 Nov 2023 16:27:47 -0800 (PST)
Received: from localhost (203-219-179-16.tpgi.com.au. [203.219.179.16])
        by smtp.gmail.com with ESMTPSA id 20-20020a170902ee5400b001c724732058sm6690340plo.235.2023.11.20.16.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 16:27:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Nov 2023 10:27:41 +1000
Message-Id: <CX42BJRGTS20.1ENG3JZ0N2UX5@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Michael Ellerman" <mpe@ellerman.id.au>, "Timothy Pearson"
 <tpearson@raptorengineering.com>
Cc: "Jens Axboe" <axboe@kernel.dk>, "regressions"
 <regressions@lists.linux.dev>, "christophe leroy"
 <christophe.leroy@csgroup.eu>, "linuxppc-dev"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
X-Mailer: aerc 0.15.2
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com> <877cmc7ve9.fsf@mail.lhotse> <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com> <874jhg6lkn.fsf@mail.lhotse>
In-Reply-To: <874jhg6lkn.fsf@mail.lhotse>

On Tue Nov 21, 2023 at 9:39 AM AEST, Michael Ellerman wrote:
> Timothy Pearson <tpearson@raptorengineering.com> writes:
> > ----- Original Message -----
> >> From: "Michael Ellerman" <mpe@ellerman.id.au>
> ...
> >>=20
> >> But we now have a new path, because io-uring can call copy_process() v=
ia
> >> create_io_thread() from the signal handling path. That's OK if the sig=
nal is
> >> handled as we return from a syscall, but it's not OK if the signal is =
handled
> >> due to some other interrupt.
> >>=20
> >> Which is:
> >>=20
> >> interrupt_return_srr_user()
> >>  interrupt_exit_user_prepare()
> >>    interrupt_exit_user_prepare_main()
> >>      do_notify_resume()
> >>        get_signal()
> >>          task_work_run()
> >>            create_worker_cb()
> >>              create_io_worker()
> >>                copy_process()
> >>                  dup_task_struct()
> >>                    arch_dup_task_struct()
> >>                      flush_all_to_thread()
> >>                        save_all()
> >>                          if (tsk->thread.regs->msr & MSR_FP)
> >>                            save_fpu()
> >>                            # fr0 is clobbered and potentially live in =
userspace
> >>=20
> >>=20
> >> So tldr I think the corruption is only an issue since io-uring started=
 doing
> >> the clone via signal, which I think matches the observed timeline of t=
his bug
> >> appearing.
> >
> > I agree the corruption really only started showing up in earnest on
> > io_uring clone-via-signal, as this was confirmed several times in the
> > course of debugging.
>
> Thanks.
>
> > Note as well that I may very well have a wrong call order in the
> > commit message, since I was relying on a couple of WARN_ON() macros I
> > inserted to check for a similar (but not identical) condition and
> > didn't spend much time getting new traces after identifying the root
> > cause.
>
> Yep no worries. I'll reword it to incorporate the full path from my mail.
>
> > I went back and grabbed some real world system-wide stack traces, since=
 I now know what to trigger on.  A typical example is:
> >
> > interrupt_return_srr_user()
> >  interrupt_exit_user_prepare()
> >   interrupt_exit_user_prepare_main()
> >    schedule()
> >     __schedule()
> >      __switch_to()
> >       giveup_all()
> >        # tsk->thread.regs->msr MSR_FP is still set here
> >        __giveup_fpu()
> >         save_fpu()
> >         # fr0 is clobbered and potentially live in userspace
>
> fr0 is not live there.
>
> __giveup_fpu() does roughly:
>
> 	msr =3D tsk->thread.regs->msr;
> 	msr &=3D ~(MSR_FP|MSR_FE0|MSR_FE1);
>         msr &=3D ~MSR_VSX;
> 	tsk->thread.regs =3D msr;
>
> ie. it clears the FP etc. bits from the task's MSR. That means the FP
> state will be reloaded from the thread struct before the task is run agai=
n.
>
> Also on that path we're switching to another task, so we'll be reloading
> the other task's FP state before returning to userspace.
>
> So I don't see any bug there.
>
> There's only two places that call save_fpu() and skip the giveup logic,
> which is save_all() and kvmppc_save_user_regs().
>
> save_all() is only called via clone() so I think that's unable to
> actually cause visible register corruption as I described in my previous
> mail.
>
> I thought the KVM case was similar, as it's called via an ioctl, but
> I'll have to talk to Nick as his mail indicates otherwise.

Yeah it can, because later on it runs the guest and that will clobber
other regs. I reproduced fr14 corruption in the host easily with KVM
selftests.

It should just do a "giveup" on FP/VEC (as it does with TM).

Thanks,
Nick
