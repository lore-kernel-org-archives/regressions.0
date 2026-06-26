Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46F73E1D05
	for <regressions@lists.linux.dev>; Fri, 26 Jun 2026 13:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782482041; cv=none; b=KmPqIvFpcMQFnIG/tdmohiuQoYNl/pSgT5CrUCywnK4dIzY7NmemJNBRwnwQdhE5vddVr0eVJ2nk/8zL3WLavf6YldZY6eKVlJGtyPm1bDGspsVJTHJeYdIVIbVLJ+Wlg85/tZTol6BA6wbggHzsXbIrg3RTnVJ1oXOYMFaS/1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782482041; c=relaxed/simple;
	bh=Ymg67ountFGp5KFG5LV3HpbomYh4sLi7Sd3XabQzjvo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hjOZkyJQVSfyKWcZxZRhu0v2/WhUg3CshXzYLR6cQWJex0XevbEyshv6cpOSt9Q5OLwcN5wbtFahqGJd4hKQB5NAx33oLKe6L4IZjvJHTxDqnoyv54Tu1CEMS62Y26YcseDUv11Xe1NzJxC4xhK5J+aQ3hPMQc1owux8esbvY2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRWfl1t7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRWfl1t7"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so9862915e9.1
        for <regressions@lists.linux.dev>; Fri, 26 Jun 2026 06:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782482038; x=1783086838; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POFjX2Hf+49RKb0BHhcjZkT/UVCjs6ACVOPFKwDMwD0=;
        b=nRWfl1t7k+r8T8ID1Oa+m/d4gYAasm/zJXMIk8LkqL0E9MHLc2HV2l6RHrvM6KdRtt
         gCjPCJrcmy+GC2hiBzJCplR/RLcqc/bEG9Jc3+zJOmWVcjxIc5FbtSCx2ow2Axx/E+yl
         fFWELwg6AnFDWx2gXt1+jSb5Li2rjQ2JQD3Fjmq8qs9COU6LTNL71wf5k86Kr/A+ACPh
         h0LzXpx3LNkcY8cFCKFwqL5zJbKlCkmx1Bj0vQOVZb3gb4i1QmAgKhTF2gXjfHKfCzKU
         MCgSDBOaHj8APD5adop/yns5C4LpThnfLwPipAqrsr/3a0SkrUhMRTFfr4Gxg8LLwi0d
         Bm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782482038; x=1783086838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=POFjX2Hf+49RKb0BHhcjZkT/UVCjs6ACVOPFKwDMwD0=;
        b=NdQlIDM0fA3hGvvJ33j3k2RVqUQAzfwB+z/Kz0FUB7aeAq/WZGt/5JalTZy5yW6dqg
         WzdEwcuvjIaCg7h+fZaMmIOTO2Oi419Tj+lFo/UlRhRWNXytSjSuSM+Xqb868JcdKqL+
         hWob+jOOL6Gejen6+dmFK+j5eMYrzcMPHuujmDXr8xyt23In2V62DHTRsJ/F5hvF7mm6
         oPGqt/qn5Otg9PIt3woEaCUpdoMgzX+09VMRx/3ZWs0yAITooV7zi2Mwryu5jNA2kmcQ
         OpBWacMUGnhWsCwoFDWaD7aQDBIWWhuF0J8Yd4kqryb6aEtWvkqgP4RsV+/z3qIBaCCe
         njXg==
X-Forwarded-Encrypted: i=1; AFNElJ9P7WCbLY4Uh14qPKad15a6GOxRg7B9Mzzb9DoDwcNQYs7DnAT1fy9yQBjqC7yX4h2Q3nuV2AUSj/pmjg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ22vO9wH/lXjkV4kGjg2y4wrgohA6ioIO/6BlQDib0h4nZYWI
	ILj5pt15Gb3T8kgurFIj2zIHiUT9Wa53w1FmlqmV84zw3gCXSOre7jT/
X-Gm-Gg: AfdE7ck6W++Cdilsq1UWyv4qqO/pck1XYXsVMVW4hWswlnUUHIWMbHmk1P+vNTii1zm
	IULVwR3ASvzb8LCIgr9DYA352aPZ3EPKihOmy/lCcc/PfuwTNXieJ5DTySQ0LbzhizvKgKXMgN0
	VPqVu8wdnUibZxUy/DuuWouWJMR2FleSsqDG9uTB9ExpYE/X3o+BLGFWCyzgZxegHqEIU5rVe8v
	zzlPCQQM64/KTCqadmYBCT52+VKEdwJQdI+4TMDKT993uIoA8m4a0gPPDDQDYewdhQMXq5QntED
	yZ3ypUYc+5V6VcozUYJsPCjX+430G/69bH9M0MpIHKgEQYASRImEGe5ZciVRBJ+KWxHRt1f+iKI
	AjJWC1gP2fR06TtQGUXcXxI7sDT1TZWJaakhGIMkHzSj4ejfzIG8UIENNuCtheXbfVKbaGI36im
	mAHx43mfKnVE12YQZgEOYEruN5l0B1ONuxC3IaCJ/D/WMAaJXH7w==
X-Received: by 2002:a05:600c:3593:b0:492:6cd0:41b2 with SMTP id 5b1f17b1804b1-4926cd04404mr30657765e9.32.1782482038008;
        Fri, 26 Jun 2026 06:53:58 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c00a34esm34262945e9.0.2026.06.26.06.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 06:53:57 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:53:56 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: slipher <slipher@protonmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Kees Cook <kees@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>
Subject: Re: [REGRESSION] 32-bit ARM's BKPT instruction no longer works
Message-ID: <20260626145356.4183d8c5@pumpkin>
In-Reply-To: <CAD++jL=YJGFf+9o8KV+OO_61EL+_z3b7P+eLK=6=r+GOuJiWAg@mail.gmail.com>
References: <kJqktbpLphg_Pk5I5SPptgTLjl3E3eq5mN5UzCslyFj7Q1Irp-wDid4mj5eQVd2iZtRGXgeZd8goq195EkXdjyt864YMc8mVb2B9NGH91NQ=@protonmail.com>
	<CAD++jL=YJGFf+9o8KV+OO_61EL+_z3b7P+eLK=6=r+GOuJiWAg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Jun 2026 14:53:56 +0200
Linus Walleij <linusw@kernel.org> wrote:

> [Adding Nathan and Kees so we can figure out how best to deal with this]
>=20
> On Sun, Jun 21, 2026 at 9:15=E2=80=AFPM slipher <slipher@protonmail.com> =
wrote:
>=20
> > Consider the C program for 32-bit ARM architectures:
> >
> >
> > int main() {
> >         __asm__ __volatile__ ("BKPT");
> >         return 0;
> > }
> >
> > Expected behavior is that this raises SIGTRAP. Since Linux 6.10 this no
> > longer happens; instead execution perpetually resumes at the same
> > instruction, using 100% of CPU. It does not matter whether GDB is
> > attached. I have tested with an armv7l CPU, but I imagine any other
> > variants with the BKPT instruction would be equally affected.
> >
> > I believe the culprit to be commit
> > c3f89986fde7bb9ccc86a901bf28e1f7d69fc3b3 "ARM: 9391/2: hw_breakpoint:
> > Handle CFI breakpoints".  The commit defines the method-of-entry code 3
> > as "ARM_ENTRY_CFI_BREAKPOINT", but this is the code used for any BKPT
> > instruction - see
> > https://developer.arm.com/documentation/ddi0379/a/Debug-Register-Refere=
nce/Control-and-status-registers/Debug-Status-and-Control-Register--DSCR-?l=
ang=3Den
> > "Method of Debug Entry (MOE), bits [5:2]". If the CFI option is disabled
> > in the kernel config,  hw_breakpoint_pending() returns 0 indicating the
> > breakpoint was handled, but takes no action. So breakpoints cannot be
> > used by user-space code, regardless of how CONFIG_CFI is set. The blog
> > post
> > https://www.jwhitham.org/2015/04/the-mystery-of-fifteen-millisecond.html
> > gives a nice overview of the control flow in older, working kernels. =20
>=20
> Does simply reverting the patch solve the issue?
>=20
> > The following Systemtap script can be used to demonstrate that the
> > ARM_ENTRY_CFI_BREAKPOINT path is used, when running the above C program=
. =20
>=20
> Yeah it's definitely that one causing it.
>=20
> I sent the naive solution to it, and before anyone point it out: no it do=
es
> not allow custom breakpoints to be mixed with kernel CFI, but it
> probably makes legacy systems work on newer kernels since they
> probably don't select CFI.
> https://lore.kernel.org/linux-arm-kernel/20260626-arm32-cfi-bug-v1-1-a467=
b5050c0b@kernel.org/T/#u
>=20
> I understand that this is not solving everything.

I'm confused.
Why would building a kernel with CFI (to check kernel indirect calls)
change the behaviour of executing anything in userspace?

If userspace is compiled with CFI and gets an equivalent fail then you'd
(probably) want a fatal signal - but isn't that entirely unrelated to
the kernel code.
Do those checks even need kernel support? I know shadow stacks do.

	David

>=20
> If it is under all circumstances unacceptable to be able to construct
> a userspace which will change the user-facing behaviour of BKPT,
> I think we need to revert CFI breakpoint handling, back put the patch,
> disable CFI on ARM and wait for the compiler(s) to start behaving
> differently on ARM.
>=20
> CFI folks: any ideas on what we could do instead of BKPT
> when we hit a CFI snag? Any ideas from other architectures?
>=20
> Yours,
> Linus Walleij
>=20

