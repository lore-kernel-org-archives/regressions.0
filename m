Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A2D3A450C
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 10:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787566970; cv=pass; b=QIWPnUdIMXa9Z0aBQZBQE8PNUFwFYnrCS//5W9VQV15LMiK8A4Um9WVaTDKr0iIay+rtspjfKFt4r7RUcFdN7I7z9hPcsmbI8rpvQJxGu0OismqNa5Ec6+DxZgxnL/aIkiKawPLzNCe6CZKa7XYe0PCbuWfDdyXHdNfnaarXWnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787566970; c=relaxed/simple;
	bh=aOpkQ+8+Z+0tSHTjR67YONoD+vAE++lX8zuwi7ZlRIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uy4coXLPNJ5t4Qr0JaD6h+n22fWScgvYojT8OH584alfyXJaPzF5LhpN/J3iZtKvnobbKh+nngCwC4hPSn6IRIvHErP3H3c/X6GIxFepoafA3XT4YVZYeLJNl8JMdAXSOrUWee5uAk4cZtJ4aPTXSBMyNCUMdWyHllrNWbfvFUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isomorphic-ai.com; spf=pass smtp.mailfrom=isomorphic-ai.com; dkim=pass (2048-bit key) header.d=isomorphic-ai.com header.i=@isomorphic-ai.com header.b=C6ns0Rn9; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isomorphic-ai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isomorphic-ai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isomorphic-ai.com header.i=@isomorphic-ai.com header.b="C6ns0Rn9"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c197eaaab00so544133966b.0
        for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 03:22:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787566966; cv=none;
        d=google.com; s=arc-20260327;
        b=iFePg8ExcRXzX6G0j1dKqVv9ojzjCQ72+MZKWQKCOIk6fb5jURKZuFZQuFoAshzHt5
         IOhHxOApJcTqQ+r1AV9MaQSJI1SnOZyvzqWYghU2dw35NQoiahbUrcSslQ8sYNjYjv6j
         4Mw2Pk19v3N+5/jsMMQpas56OeKzqTtPg75/U5JbIYKgkjcv8QMO44H1XzD1/2Is53kH
         DTRz1LOP8BR1hNDueJ75AN3W89lnSudVEzOQoGNudLtvSZ6RVKXnml2cqocx/HU04/Kb
         iwK+8FwsdMcU0XoU8Fa/zW8lQJlFAc+HRWOwxREiwOAVB7C9mPNbPQC49zKoEvwYWrG+
         9RpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dLNIue6LBcWvdxKP8M6jQZTbwZKO04v0RDZAqcIK23g=;
        fh=/GBF22sFCo+Mb56r+P9CgshALFWKZ14FwQOATU5iHf8=;
        b=f4Uzzd2nabgMUl535On+kwaDMB/m3GnqNLGc28xJ1bPNGIrEp3Opv5NRa+sz4GvtBp
         dN/IiW3Dk50x34UHD3Dsyo+9QUjUbFZ/MgpJj/vXtcwnu69wit9Fs4wmKiIFDsOOF8Tm
         paA/jEr/raTDi1JHPPjpyNLvu52QMESDroXkAFCTROIaBP2piG2kGzr9XbDFjmZHI5Z1
         XYeAtDonlWjP7m1theokCiMxV3aJv5lFVFhsA9f24hSVBaCYyZCw6MAfEI2ntMLrZSxi
         QVrW+u2tX1C3Ov5ScpxXH2jMH0Pcb9vKsJpxqlK7KmJcqprXGkhiinC+nVqA5dxhAW3Y
         otiQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isomorphic-ai.com; s=google; t=1787566966; x=1788171766; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dLNIue6LBcWvdxKP8M6jQZTbwZKO04v0RDZAqcIK23g=;
        b=C6ns0Rn9XeAKJpKyj9il+lwVY4BVoZglgymQ5uG64EJAV4+mNnd5WdQz2vEcFphVpq
         fb4c/mQeq7fBztBR9lgfMY0NWwamv/RMxUiu2Ga329DWfX3JRIaf22mE4XxErJtLXCXB
         h8093jN1pXbw6COIs1iagKSK2DVAII90pbtzGX8tgvereLJkFPhrDt9jrwDSQ48SyZ8e
         9G/a050Sg9rZXvAJFqDOf2W+B3EEhdvRha0VS8JId+bdxwtWPy5VF14/5EjZddG6eWTe
         5ToCCBqpc+jgznkNF1WUrBv5vy/bf7lS1LNF1BEsR8zAG869wfWDqziVpJwTBkCFcqbE
         JbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787566966; x=1788171766;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dLNIue6LBcWvdxKP8M6jQZTbwZKO04v0RDZAqcIK23g=;
        b=a9ArKAfWsumELEn9nSPo48a+RpfU4ZuZWiTN8mrmY9Ce6nS6Oh8bTFlxZmIK81G0tZ
         xeqrse92kRBdRYcn83iDX0CtRRYqSxQNtoDr84AmadumDap/PPbuBFrB4Gk5APf2tSLW
         u/e5qycw4M/8zEdxEUrh/jPri1+PmzpNhB/hCRETN2OQO8JZ6VJA5prjnDMwgUbNMsDq
         4eD3qLGOVeQ5ODTJdy2gfGf5f2k/AM4z6aEJNiQIRyvSsAjuKcfIW8LsTtoFyNBFic3o
         F/qTKDlnogwVcInQIVPj16R13AGEox9LHSGecuiPkbyV/1Bl32VexGyyNRyvh5EQ0f7J
         fNUA==
X-Forwarded-Encrypted: i=1; AHgh+RpfsbX9g8rrI+O2fsa3S5mryyXXnzoFMYs8vPgJOUQhLINj4T4+B18AacVoNiduDQxw5JcQyT4WPP70sA==@lists.linux.dev
X-Gm-Message-State: AFuF++mm1qQuPumQjAX04Y7fa4ipsDKVPQeCI/rFCnuWR61t+ELY5HjA
	xTnDwvjjAVbLAmp5/1KqoE5Po+PVFMj+8WY+up3BFGBdN0pi3CjVJNgyfvBY+BrvEPSGQ67YXxU
	0qefWyxaSAcpu9CgyLlAJgkopNrjkX5n+c7w+kmqOvg==
X-Gm-Gg: AR+sD12mmAD3DGsxUQSI9jfgms9FqjTpUshpr9/iPGsvGObVcoT8Y97mUpLNQFeDmlG
	K8uaHi925Is4Syd2rHxJNmhe8WseF6UMoNgrueCG5Oid3yeTXske0bLblkZXcjoGtafxqTQsfZo
	f/3BudY/B4y9KB+ZAYFq84kbZ/bpAJI0L2TlJ9O1f1udcXzAnnJhhbZ75JSKpyErKRKD8Mo5iUD
	qxOUD5tLKnublIDkJ9Z7+iWq9oHiYWTF4lII2YYtgRQQzA6VcDcsg3LEzA+GPqa3JEfgC+Kn+bg
	F94gd8DMzJkJT6MtLYhD5ikh4AYP3JYdiBt9Q2O+IU/y5rd2PSp0DEo7FqArQ7XBNnfavF22GHr
	wCfvTn9kyLuJEmMiiKGZQqOuFY+8vJMECHpUMPstRJWrVSR4xEuCvusEJZ34TbEMPnJnzs7oOlA
	UAtP2u1YIXbFknV7lnI4wh2yio+/ecg8tt2Zykl5aEjN4=
X-Received: by 2002:a17:906:fe03:b0:c16:242a:472f with SMTP id
 a640c23a62f3a-c246b4af7e1mr3239881966b.23.1787566965457; Mon, 24 Aug 2026
 03:22:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260823201521.2576344-1-fabian@isomorphic-ai.com>
 <a02b160a-874f-491c-987b-4d7eb0d35a9f@leemhuis.info> <20260824092300-3e9a9d58-b273-421b-a4bf-5609ccb9ab49@linutronix.de>
In-Reply-To: <20260824092300-3e9a9d58-b273-421b-a4bf-5609ccb9ab49@linutronix.de>
From: Fabian Franz <fabian@isomorphic-ai.com>
Date: Mon, 24 Aug 2026 11:22:33 +0100
X-Gm-Features: AcwNN1UVFKjEcez8IB5zIpYrL6ue944P2BsTb4hcS9g6xutOt-_NDFHFLV7W5QI
Message-ID: <CAKbYdNEK0TUy+W5g_yGuP-JCC9CQwmeO0q95rYhcebZYB9vLUw@mail.gmail.com>
Subject: Re: [PATCH REGRESSION] um: Fix cpu_feature_enabled() build breakage
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Nikolay Borisov <nik.borisov@suse.com>, "Xin Li (Intel)" <xin@zytor.com>, 
	Ingo Molnar <mingo@kernel.org>, Claude Fable 5 <noreply@anthropic.com>, linux-um@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Thanks for this pointer.
>
> > https://lore.kernel.org/all/20260819-uml-timex-fix-v1-1-f690b514fc9f@li=
nutronix.de/
>
> Indeed, both our fixes seem to be for the same breakage.
>
> Personally I prefer my patch, as it reverts the specific change which
> introduced the breakage into the tree. Franz' change does not look incorr=
ect
> but is a larger change and should go through a regular release cycle.

I also prefer your patch. It is much simpler and doesn't require
changing the cpu flags at all.

However, getting the minimal patch for um in ASAP would also be good,
as a broken master is not nice for development.

Thanks,
Fabian

>
> > Ciao, Thorsten
> > > Two independent breakages meet here:
> > >
> > >  1. cpu_feature_enabled() and this_cpu_has() still test
> > >     DISABLED_MASK_BIT_SET()/REQUIRED_MASK_BIT_SET().  Those used to
> > >     come from <asm/disabled-features.h>/<asm/required-features.h> via
> > >     <asm/cpufeatures.h>, but since commit 8f97566c8a81
> > >     ("x86/cpufeatures: Remove {disabled,required}-features.h") they
> > >     live in the generated <asm/cpufeaturemasks.h>, which only the
> > >     arch/x86 archprepare rule generates.  ARCH=3Dum never generates n=
or
> > >     includes it, so the references have been dangling since then.
> > >
> > >  2. The _static_cpu_has() macro expands to itself.  Commit
> > >     3eaa50e1e255 ("x86/cpu: Hide and rename static_cpu_has()") rename=
d
> > >     the inline function _static_cpu_has() -> __static_cpu_has() and
> > >     the macro static_cpu_has() -> _static_cpu_has(), but in the UML
> > >     header the macro's out-of-line branch kept calling
> > >     _static_cpu_has(), which now names the macro itself and is left
> > >     unexpanded by the preprocessor.
> > >
> > > Fix the macro to call __static_cpu_has(), as the x86 header does, and
> > > drop the mask based short-circuits from cpu_feature_enabled() and
> > > this_cpu_has().  UML has no compile-time feature masking to express:
> > > capabilities are copied from the host's CPUID at boot, see commit
> > > d8fb32f4790f ("um: Add support for host CPU flags and alignment"),
> > > and generating cpufeaturemasks.h from a UML .config would wrongly
> > > mark features disabled simply because the gating CONFIG_X86_* symbols
> > > do not exist for ARCH=3Dum.
> > >
> > > Fixes: 3eaa50e1e255 ("x86/cpu: Hide and rename static_cpu_has()")
> > > Fixes: 8f97566c8a81 ("x86/cpufeatures: Remove {disabled,required}-fea=
tures.h")
> > > Signed-off-by: Fabian Franz <fabian@isomorphic-ai.com>
> > > Assisted-By: Claude Fable 5 <noreply@anthropic.com>
> > > ---
> > >  arch/um/include/asm/cpufeature.h | 8 +++-----
> > >  1 file changed, 3 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/arch/um/include/asm/cpufeature.h b/arch/um/include/asm/c=
pufeature.h
> > > index f7770083c0a4..20b2c7ead62e 100644
> > > --- a/arch/um/include/asm/cpufeature.h
> > > +++ b/arch/um/include/asm/cpufeature.h
> > > @@ -37,8 +37,7 @@ extern const char * const x86_bug_flags[NBUGINTS*32=
];
> > >      test_cpu_cap(c, bit)
> > >
> > >  #define this_cpu_has(bit)                                          \
> > > -   (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
> > > -    x86_this_cpu_test_bit(bit, cpu_info.x86_capability))
> > > +    x86_this_cpu_test_bit(bit, cpu_info.x86_capability)
> > >
> > >  /*
> > >   * This macro is for detection of features which need kernel
> > > @@ -48,8 +47,7 @@ extern const char * const x86_bug_flags[NBUGINTS*32=
];
> > >   * supporting a possible guest feature where host support for it
> > >   * is not relevant.
> > >   */
> > > -#define cpu_feature_enabled(bit)   \
> > > -   (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : _s=
tatic_cpu_has(bit))
> > > +#define cpu_feature_enabled(bit)   _static_cpu_has(bit)
> > >
> > >  #define boot_cpu_has(bit)  cpu_has(&boot_cpu_data, bit)
> > >
> > > @@ -112,7 +110,7 @@ static __always_inline bool __static_cpu_has(u16 =
bit)
> > >  (                                                          \
> > >     __builtin_constant_p(boot_cpu_has(bit)) ?               \
> > >             boot_cpu_has(bit) :                             \
> > > -           _static_cpu_has(bit)                            \
> > > +           __static_cpu_has(bit)                           \
> > >  )
> > >
> > >  #define cpu_has_bug(c, bit)                cpu_has(c, (bit))
> > >
> > > --
> > > 2.43.0
> > >
> > > Every ARCH=3Dum build has failed since the 7.3 merge window.
> > >
> > > #regzbot introduced: 3ed403bbc967
> > >
> > > Steps to reproduce on master:
> > >
> > > make ARCH=3Dum O=3D/tmp/um-build defconfig
> > > make ARCH=3Dum O=3D/tmp/um-build -j$(nproc)
> > >
> > > fails with:
> > >
> > > /home/ubuntu/projects/linux/arch/x86/include/asm/tsc.h: In function =
=E2=80=98get_cycles=E2=80=99:
> > > /home/ubuntu/projects/linux/arch/um/include/asm/cpufeature.h:52:39: e=
rror: implicit declaration of function =E2=80=98DISABLED_MASK_BIT_SET=E2=80=
=99 [-Werror=3Dimplicit-function-declaration]
> > >    52 |         (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(b=
it) ? 0 : _static_cpu_has(bit))
> > >       |                                       ^~~~~~~~~~~~~~~~~~~~~
> > > /home/ubuntu/projects/linux/arch/x86/include/asm/tsc.h:79:14: note: i=
n expansion of macro =E2=80=98cpu_feature_enabled=E2=80=99
> > >    79 |         if (!cpu_feature_enabled(X86_FEATURE_TSC))
> > >       |              ^~~~~~~~~~~~~~~~~~~
> > > /home/ubuntu/projects/linux/arch/um/include/asm/cpufeature.h:115:17: =
error: implicit declaration of function =E2=80=98_static_cpu_has=E2=80=99; =
did you mean =E2=80=98__static_cpu_has=E2=80=99? [-Werror=3Dimplicit-functi=
on-declaration]
> > >   115 |                 _static_cpu_has(bit)                         =
   \
> > >       |                 ^~~~~~~~~~~~~~~
> > > /home/ubuntu/projects/linux/arch/um/include/asm/cpufeature.h:52:72: n=
ote: in expansion of macro =E2=80=98_static_cpu_has=E2=80=99
> > >    52 | builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : _=
static_cpu_has(bit))
> > >       |                                                             ^=
~~~~~~~~~~~~~~
> > >
> > > If this is known please disregard. I am also not 100% sure if this is=
 the right fix or if it's better to bring back the macros to um.
> > >
> > > In any case it would be good for um to build again on the master bran=
ch out of the box.
>
