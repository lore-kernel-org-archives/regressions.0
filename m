Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124333FC5D1
	for <regressions@lists.linux.dev>; Fri, 26 Jun 2026 16:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491761; cv=none; b=QBUAxbEohXSktXlbkA9RxlEOeCrfjDxtIXw7q5X0QN8GJeVWwjrTlfzanpzyPG7VHi7bYZPXz/f/VYPLxQ0Xb3WfbLEc6+A8TRq9fMUvKeLXhHZ3B6OxZwOxN5UD+GrR3sBUJGCncIdog6ESbRem5CeGBNJI4r8S6BEoLsRpcRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491761; c=relaxed/simple;
	bh=jfKMfNtA0m2tzWAAaJhQh72SwYzYGPRTh1/ufIvgsvY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LTjPbAVWENcrrt4cXfoKnsGREjAy0de7RXf+CDNVWqumI/4/dHRGTlbcbw41BcFmT+DRw7fQy7ot7YDVMWd3ZkfP6XyIsodQkKGWWYV4I8Zk3+9cC2lJoT9jYML1/IG1IoXKtioUpkRHnBOeW0v4mAdj25HYlo3lZuFUtpyADas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CrZlfxy6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrZlfxy6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49270f771c9so636665e9.0
        for <regressions@lists.linux.dev>; Fri, 26 Jun 2026 09:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782491758; x=1783096558; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+4pZ54hLA2erkBLlLpycb2Ho8SVAKzZfrHin6zD0vY=;
        b=CrZlfxy6cUjRkeyCSm+IW2zeBwNUEVtYFzdHZmtMUWtsRK+uML/vBH4xWKmiXG+fPs
         64bfcvY+3LMhNFnWvOlLz3LuhHTSnajcttzRQ39jNRPvl9S7woRrkwDGusItGs0IuqnP
         v1qnzgNb0C8JDOuQF/wAgv3haG5F4w+4ioN0iyHEfJA3wSWg1bVXrWZ2hCOW4IYXGD7o
         sxdyL6ThIIPWwUFiYZSxvgKGU2ulAmsamOecfSMUP6P3Nx3xemPd8c2JnxMac8h4Jj0m
         p5wRwXpWHvP4DZ6Rsxo3M2kq75crULHjn8aaUp3ofD22LinsMOel+n18eWvveQfY9DjN
         xcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782491758; x=1783096558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l+4pZ54hLA2erkBLlLpycb2Ho8SVAKzZfrHin6zD0vY=;
        b=Y5ceCDJCX+KuRNo//q3QlsWYbaP6wrQsltX6JJmebkqmRWyXhMh8lEiphy8qaTGEMk
         JswKAWfew84RsD49JH25l9Wbc8AuGOIi4hNQv8S7nXJmyZ+hNslTMNHMqsp1M3nL+wtU
         6RNRZr46jgWWqjMD50SZMWEfipYaM3h6d1W0aW9sNNzk7fgwgHBiX92KUzs1p6sQOqQB
         HtthsPuU2CaYaSFebXHBJ+AK9vrL8al41MTVCICDEDqk27kqDQC4vDhoCEKY6CVDTXZk
         VCx7A69BTa1Wc7C/ukOxXbC12ifeuqlMud53OGKUS2skjSquOR9WpTH52CT/txuYA3Zw
         YDjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+AGJzVKADbkzzUVhJ8IPC5Ap65LvSkoQfTYjyj6avmIgtVyURYPpM7R64tgkFoioTgxSC5slLgP4397Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKTb/md29hszATb3lZSw2XuCZgwDrQdK/auQfsY3aVa/LGD2jC
	jg3vODx9huf/sZW96hfSlHMGoNqJBAYUTNKiUfqR1FpuDCZquhljwixe
X-Gm-Gg: AfdE7cmBUS2fRiCUzcBRqVOOmldj2tpLrXtMQ+lapEthAdyHvFCdrS3HToLIlme8CKb
	3w11337agRm/TqcwiwfVzZS09rJJyGq4D6z+Hv6I5tNYwALmmbB6xnLDehD/Y4eubNzQujRz6GM
	dWlYqMwm9+ZZD6uyOwHFwPEHvEZa5MUles0ff6jwAkwGYuqhuObOPyHpVRdhWDXewT1QHfg8KIm
	4njsc6gEPltj8pAdSjZnwvx+ZZ8yNXf0XrBcGTDx2g/DxZHy1ERAsK3V+m6iGg/dohO/WX/f74y
	c+3CUBL+2gbleLsdtb+1p+6ueT7SCUIjfK71ORY4TJrya8y3Ovo2X4ZhiXWVBdAlPNlbRXDc+WW
	OXmT4F+MDmMIJED91Yli2I+/5ZXc5cJ9ewGLPYJes3tVrPM+MBUPS+fsBSztb4b3XNTTjPdoPkz
	JJGakYrJtWWsg0UHxVP5hD4slLiIdiskWwQITPR7hhI34+EImw3bmZdeBoFtUx
X-Received: by 2002:a05:600d:6452:10b0:492:1e36:85dc with SMTP id 5b1f17b1804b1-4926689ac37mr92438895e9.36.1782491758352;
        Fri, 26 Jun 2026 09:35:58 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268ffe204sm92361655e9.7.2026.06.26.09.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:35:57 -0700 (PDT)
Date: Fri, 26 Jun 2026 17:35:56 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Linus Walleij <linusw@kernel.org>, slipher <slipher@protonmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, Sami
 Tolvanen <samitolvanen@google.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>, "linus.walleij@linaro.org"
 <linus.walleij@linaro.org>
Subject: Re: [REGRESSION] 32-bit ARM's BKPT instruction no longer works
Message-ID: <20260626173556.0535ffe5@pumpkin>
In-Reply-To: <aj6c2gW6h7xNwGnh@shell.armlinux.org.uk>
References: <kJqktbpLphg_Pk5I5SPptgTLjl3E3eq5mN5UzCslyFj7Q1Irp-wDid4mj5eQVd2iZtRGXgeZd8goq195EkXdjyt864YMc8mVb2B9NGH91NQ=@protonmail.com>
	<CAD++jL=YJGFf+9o8KV+OO_61EL+_z3b7P+eLK=6=r+GOuJiWAg@mail.gmail.com>
	<20260626145356.4183d8c5@pumpkin>
	<aj6c2gW6h7xNwGnh@shell.armlinux.org.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Jun 2026 16:38:02 +0100
Russell King <linux@armlinux.org.uk> wrote:

> On Fri, Jun 26, 2026 at 02:53:56PM +0100, David Laight wrote:
> > On Fri, 26 Jun 2026 14:53:56 +0200
> > Linus Walleij <linusw@kernel.org> wrote:
> >  =20
> > > [Adding Nathan and Kees so we can figure out how best to deal with th=
is]
> > >=20
> > > On Sun, Jun 21, 2026 at 9:15=E2=80=AFPM slipher <slipher@protonmail.c=
om> wrote:
> > >  =20
> > > > Consider the C program for 32-bit ARM architectures:
> > > >
> > > >
> > > > int main() {
> > > >         __asm__ __volatile__ ("BKPT");
> > > >         return 0;
> > > > }
> > > >
> > > > Expected behavior is that this raises SIGTRAP. Since Linux 6.10 thi=
s no
> > > > longer happens; instead execution perpetually resumes at the same
> > > > instruction, using 100% of CPU. It does not matter whether GDB is
> > > > attached. I have tested with an armv7l CPU, but I imagine any other
> > > > variants with the BKPT instruction would be equally affected.
> > > >
> > > > I believe the culprit to be commit
> > > > c3f89986fde7bb9ccc86a901bf28e1f7d69fc3b3 "ARM: 9391/2: hw_breakpoin=
t:
> > > > Handle CFI breakpoints".  The commit defines the method-of-entry co=
de 3
> > > > as "ARM_ENTRY_CFI_BREAKPOINT", but this is the code used for any BK=
PT
> > > > instruction - see
> > > > https://developer.arm.com/documentation/ddi0379/a/Debug-Register-Re=
ference/Control-and-status-registers/Debug-Status-and-Control-Register--DSC=
R-?lang=3Den
> > > > "Method of Debug Entry (MOE), bits [5:2]". If the CFI option is dis=
abled
> > > > in the kernel config,  hw_breakpoint_pending() returns 0 indicating=
 the
> > > > breakpoint was handled, but takes no action. So breakpoints cannot =
be
> > > > used by user-space code, regardless of how CONFIG_CFI is set. The b=
log
> > > > post
> > > > https://www.jwhitham.org/2015/04/the-mystery-of-fifteen-millisecond=
.html
> > > > gives a nice overview of the control flow in older, working kernels=
.   =20
> > >=20
> > > Does simply reverting the patch solve the issue?
> > >  =20
> > > > The following Systemtap script can be used to demonstrate that the
> > > > ARM_ENTRY_CFI_BREAKPOINT path is used, when running the above C pro=
gram.   =20
> > >=20
> > > Yeah it's definitely that one causing it.
> > >=20
> > > I sent the naive solution to it, and before anyone point it out: no i=
t does
> > > not allow custom breakpoints to be mixed with kernel CFI, but it
> > > probably makes legacy systems work on newer kernels since they
> > > probably don't select CFI.
> > > https://lore.kernel.org/linux-arm-kernel/20260626-arm32-cfi-bug-v1-1-=
a467b5050c0b@kernel.org/T/#u
> > >=20
> > > I understand that this is not solving everything. =20
> >=20
> > I'm confused.
> > Why would building a kernel with CFI (to check kernel indirect calls)
> > change the behaviour of executing anything in userspace?
> >=20
> > If userspace is compiled with CFI and gets an equivalent fail then you'd
> > (probably) want a fatal signal - but isn't that entirely unrelated to
> > the kernel code.
> > Do those checks even need kernel support? I know shadow stacks do. =20
>=20
> CFI generates instructions that can check the type of the function
> against the caller. It appears that on 32-bit ARM, Clang close that,
> in the case of a mismatch, it would cause a BKPT instruction to be
> executed.
>=20
> Linus' code in commit c3f89986fde7 ("ARM: 9391/2: hw_breakpoint:
> Handle CFI breakpoints") added code to handle this BKPT use.
>=20
> However, we now have a regression reported as a result of that commit
> where there is a userspace program that has explicit BKPT instructions
> encoded within it, and the program relies on the kernel behaviour that
> was introduced in f81ef4a920c8 ("ARM: 6356/1: hw-breakpoint: add ARM
> backend for the hw-breakpoint framework") in 2.6.37 - and this "new"
> behaviour is conditional on CONFIG_PERF_EVENTS being enabled - where
> it raises a SIGTRAP.
>=20
> Prior to this commit, or whenever CONFIG_PERF_EVENTS is disabled, the
> kernel will raise a SIGBUS instead.
>=20
> Both SIGTRAP and SIGBUS are "forced" signals - the kernel will force
> them to be delivered to the program irrespective of whether the program
> has blocked or ignored these signals, since this is the kernel trying
> to save the system (because it doesn't know how to handle it.)
>=20
> Moreover, BKPT was only introduced around the ARMv5TE era, and the
> FSR code for it was only added in later architecture reference manuals,
> changing an existing FSR code from an implementation defined "Terminal
> Exception" to an architecturally defined "Debug Exception".
>=20
> Support for this "Debug Exception" was only added with patch 6356/1,
> but that did not handle the BKPT instruction. Linus' commit above
> (9391/1) added support for the CFI case, but meant that userspace
> would now spin on a BKPT instruction rather than force a signal,
> thereby causing the regression.
>=20
> We can't fix BKPT handling - this userspace program relies on the fact
> that the kernel doesn't handle this instruction (for example, it relies
> on the PC not being advanced) and advancing the PC by one instruction
> after a SIGTRAP handler returns may not be the correct way to handle
> it anyway. Consider BKPT being used as an "assert" type context, where
> the compiler doesn't expect execution to continue, and a literal pool
> following the instruction.
>=20
> We are now stuck with the sorry state that BKPT is, and as I have said
> many times now, BKPT should be avoided - it's an utter trainwreck. The
> only sensible use that BKPT has is with a hardware debugger that traps
> the BKPT entry into debug mode (a special hardware debugger mode that
> the CPU enters which software can't see).
>=20

I'd probably forgotten a bit in the middle of that.
(Possibly backing up the pc.)
I guess it would need a flag in an elf header/section to set the behaviour
on a per program basis (horrid).

	David

