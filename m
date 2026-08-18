Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDD6394797
	for <regressions@lists.linux.dev>; Tue, 18 Aug 2026 16:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787069961; cv=pass; b=VVSAKUFIjjbl7ufzF4QcuUJp/3U8PnAZF8q9Rs1G6G95RxhDpGYBv1bo8IVqRSNcPzNW+BSAzPmbJqMuXsJtGm3i1ftd0GECGk9ttavm5wTT+oPnRrAR3p3G4zQlRnxGnPFC1QsY9hsCjsGi4kq3SPDgKHXf9/R0mJe2Uvjxz/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787069961; c=relaxed/simple;
	bh=Luwmf/h3uMWVEcZL4WGlRAmQ/Ykfbnw1Rxv4VkXypeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hE6/J6AgeIioBzQjEj/6j4OtXnrieKQZdjNlBEjSj8jjQ4bwMMlZqQte01mlJMehl4UiK7mD9W3Fo/tHKzTN3ZedyOX28cpdNgb4DS6Xao/ghVBDNyYR4gVlBAL1oxYAcvZ1DzQ51yjHCsrWkmiMFreh5mOwQzIT1fqoPP+XCSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tYrXDeWL; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tYrXDeWL"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495590dde14so336135e9.0
        for <regressions@lists.linux.dev>; Tue, 18 Aug 2026 09:19:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787069957; cv=none;
        d=google.com; s=arc-20260327;
        b=IV8UrB3O6kmBhTSZk76z3k36cT8PvNTiGr79fZvwDs1I5LD6I01qv0Zb+f4dKQnyU6
         ovW5Sooix/1ok77W+Mtm0gviNfqbv1CVfxxr6zMuciaK/50JLAlCU9NQTu9s+64optls
         lNULFHeze2c3bp2A/rR9uLH8r/AnJM4+TBDlx0iMHgoYknmHZviR/lPf9TtMsVdkxw4S
         58ngAA8iuc6XC5NUzZhkV3yw7SRyaNy+uPb8VjkVNMvyG232/E7bxNMqA8gAJsXc9yw4
         bDHH/U3d2s5WT2ATWydDOAuZThp6EXkizJdP8FujMqlGfg/FdOKbzy60kxDUTxX7x9UD
         rgig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4cCYfaTW+Xm7KzVKnTbBSnOXTWiHki0P9YtWKmlB9XY=;
        fh=st2FNTW4newMgGjzPhpDOKENdSPGwe5KwVwJdbWcZp4=;
        b=m53niZshrBjbMHY28b3VajyhxoxJ91YoYeO26UsGtp1AnVBTBNGf+Jsr1lQFqPfEXz
         Cv3EhYOlle/eZGqXme26fwv9z+iaez/7rWQLB0i1GVO/0yApTeR/+dSipF1oHOA2pU8n
         KL+7mFKth0hA0iqd4NJ38gNcKfdk+XMBp6w1YeauhK4cj8N2qGv6y8FZ/PDvs7ZRKtYe
         r51QR+hiza3EtZVxySXZL7q+0eDfkYI9IRp3JSfKwhs1NUNV/a3/RLX+Be5ceqE2leNI
         rlw1bJd4BIrSGiYCzzzMz0eHLVnIo6NY4QdjZm8woNl3Egcj3eQtEk4MouzDQalrsymi
         GNBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787069957; x=1787674757; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4cCYfaTW+Xm7KzVKnTbBSnOXTWiHki0P9YtWKmlB9XY=;
        b=tYrXDeWLeSrZ5TY9D1bp3dpr4aL8c7YcoNhh2KNshjs28wRY3RxU6Klw/gJbsUDKT2
         9N695YpA5G+xrLbkZnKK9aq56LzfFxkEG1LLK/TDUPI68A0zrl3Ya1Lb61Vm2WXIfBnr
         zwHbQv2GjN5dFPcJLCO5l4xGLYU15JOBxfuD/7wYPxP9Dvk94pL3RVz5Wb7pB3mebGhU
         ArjZ0Vtbeij1nX+xmivDv3jkn1yh9x+n/f2nKI4Thfj/Ljmp1AxyXxPUMQUe9XS9mAVh
         lC+0+7Uk0Rb2M57rfgCd1WY72/+C/Rcp51DprLRovH7cTyKXD5YpRHXm8t3jqqq5iI8w
         jFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787069957; x=1787674757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4cCYfaTW+Xm7KzVKnTbBSnOXTWiHki0P9YtWKmlB9XY=;
        b=SIUetHPfqBk7OqoeHq+voUpdG1FCBZwbP/fXpMTETBbR50586mpmkX0jVfIwnZnx60
         6+xxArSvXWszi9GtIODBtVaQ+sfwqtYhvb/gUke3sqyeVHITNqqjaCMNQNQRYB/x1RSa
         jjVEUudhluLynW9DyygD3fjm4ZaRwDmO4F7gqU/u+Sj8WwQ8KIEOzVaRmdopySTBGrt/
         9h6GTNuKHCw/DvfMw6kRj5sjmesSMsH7J1f5p3nK/XgFBvNyzpweWk9wD1dxq2iI5eG9
         LheAMOjFKanHznP7z1BD+n4GpCg6d75X/7n3IAi0HnYInA1nKyauufZwrjoUlbmibozI
         /e9g==
X-Forwarded-Encrypted: i=1; AHgh+RpwdNizQFs9OpApI5KAqBvPwb3jLm9XYQTj08RhQP5SlN1ToZ5aPYRU4fjf4xg8S6NEUNMkhK5Si8jU1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyants4Orktic0/bsYUyfoZVzDzqE2W/R/hl5cAourOBICw4340
	s574jNZffsCnB0Y7GgSC2KpK8qUK2nf09EX6FZEDU+WU1psvhIo+2KSrPh7GoExVhd/H5cC0IhF
	CFsBQ7ucbhZETbTbbZ9wypYlfcqtAPABjnoSOR6U/
X-Gm-Gg: AR+sD11JN6TIvGP8UXHUjCvB1laW9mnDLvlU7GMoDZuOgMMFxnflcQzFEWH6fIQhw1I
	ueoI+RQZ7AmhDPFOJi+JHQxpmptfErxGUGWSe3BvZ0C0Ntu5WPB6VCuOYS0fAiLpfSIKxUy4mFL
	0IEfSKDUVZAVbp+XF3uxzqAsVGX41+893nEyNND65KEEsXsy5DOOmUA+L4AlWnTLN/Z48TkwslT
	WJhhX2sOLgovikbZo31PE2bzrB4+zyKqpEaVKjniQxqtZ7SsenuIsxFpLGzQDEcq0qNtMG2bYKW
	czbYVFZ1iujy6z72CzUWA+5WnM0Jvrh20BDMDqCR149uUdNiJRGxeykhZhWjNO/vVZu2g6hlJvX
	k3HiqLTdM+o8D37hROcqz1MoLMua6Luiyqc5LQjm4dWZW2hXlQTBQX17buohUXEN46Co=
X-Received: by 2002:a05:600c:848e:b0:499:7024:9d4a with SMTP id
 5b1f17b1804b1-4999fb2ec1cmr179077065e9.8.1787069956525; Tue, 18 Aug 2026
 09:19:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <178701474442.5156.12765087253678603047@kernelci.org> <c9ba4aeb-a288-4597-b13a-9da55666f96a@leemhuis.info>
In-Reply-To: <c9ba4aeb-a288-4597-b13a-9da55666f96a@leemhuis.info>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 18 Aug 2026 09:19:04 -0700
X-Gm-Features: AcwNN1UVkATS-7eRkbr97TwvxPmdiSnbkKPpC1B5mCbDBU5hC9Z2uIP6SnylR5A
Message-ID: <CAKwvOdkcCnhM-395QVriu3hnjmtX1H-3i_1tU5Jpb1Ybr2Q77g@mail.gmail.com>
Subject: Re: [REGRESSION] mainline/master: (build) in arch/arm/kernel/entry-common.o
 (/tmp/kci/linux/scripts/Makefile...
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Nathan Chancellor <nathan@kernel.org>, regressions@lists.linux.dev, laura.nao@collabora.com, 
	shreeya.patel@collabora.com, broonie@kernel.org, kernelci-results@groups.io, 
	kernelci@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Ard

On Mon, Aug 17, 2026 at 11:00=E2=80=AFPM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 8/18/26 02:59, KernelCI bot wrote:
> > New build issue found on mainline/master:
> >
> > ---
> >  in arch/arm/kernel/entry-common.o (/tmp/kci/linux/scripts/Makefile.bui=
ld:435) [logspec:kbuild,kbuild.compiler]
> > ---
> >
> > Log excerpt:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>
> Missing for some reason. See below for one, grabbed it from
> https://d.kernelci.org/log-viewer?itemId=3Dmaestro%3A6a838f2962f33761c0d6=
680b&type=3Dbuild&url=3Dhttps%3A%2F%2Ffiles.kernelci.org%2Fkbuild-clang-21-=
arm-allmodconfig-6a838f2962f33761c0d6680b%2Fbuild.log.gz
>
> Nathan, Nick, do you still care about clang problems like this?

Yes, from the logs, it looks like ARCH=3Darm allmodconfig with clang-21
(perhaps, there's a funny warning about the compiler version in the
logs).

> And do
> you by chance know what's wrong here?
>
> """
> <instantiation>:2:11: error: out of range pc-relative fixup value
>  ldr r10, =3D__per_cpu_offset
>           ^
> <instantiation>:2:11: error: out of range pc-relative fixup value
>  ldr tsk, =3D__current
>           ^
> <instantiation>:2:11: error: out of range pc-relative fixup value
>  ldr tsk, =3D__current
>           ^

Smells like the same problem that was addressed by
commit 5fe41793bc78 ("ARM: 9176/1: avoid literal references in inline assem=
bly")

What tree was being tested? 5fe41793bc78 landed in v5.18-rc1. Whatever
was being tested is probably missing that patch.

> make[5]: *** [/tmp/kci/linux/scripts/Makefile.build:435:
> arch/arm/kernel/entry-common.o] Error 1
> make[5]: Target 'arch/arm/kernel/' not remade because of errors.
> make[4]: *** [/tmp/kci/linux/scripts/Makefile.build:549:
> arch/arm/kernel] Error 2
> make[4]: Target 'arch/arm/' not remade because of errors.
> make[3]: *** [/tmp/kci/linux/scripts/Makefile.build:549: arch/arm] Error =
2
> make[3]: Target './' not remade because of errors.
> make[2]: *** [/tmp/kci/linux/Makefile:2187: .] Error 2
> make[2]: Target '__all' not remade because of errors.
> make[1]: *** [/tmp/kci/linux/Makefile:248: __sub-make] Error 2
> make[1]: Target '__all' not remade because of errors.
> make: *** [Makefile:248: __sub-make] Error 2
> make: Target '__all' not remade because of errors.
> """
> Ciao, Thorsten
>
>
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >
> > When fixing this issue, please attribute this report according to the
> > patch submission rules:
> >
> > Reported-by: kernelci.org bot <bot@kernelci.org>
> > Link: https://lore.kernel.org/all/178701474442.5156.1276508725367860304=
7@kernelci.org/
> >
> > For complete logs and details about the environment used, see the issue
> > on the KernelCI dashboard:
> >
> > - dashboard: https://d.kernelci.org/i/maestro:5d5ba40a9374919c6038ec3e5=
0f54dbe70a37c03
> > - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git
> > - commit HEAD:  ff68e5f557f69a08fdcfa4ce8b1b809d63bd4f45
> >
> > # Builds where the incident occurred:
> >
> > ## defconfig+allmodconfig+CONFIG_FRAME_WARN=3D2048 on (arm):
> > - compiler: clang-21
> > - config: None
> > - dashboard: https://d.kernelci.org/build/maestro:6a838f2962f33761c0d66=
80b
> >
> > #regzbot introduced: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f..ff68e5f5=
57f69a08fdcfa4ce8b1b809d63bd4f45
> > #regzbot link: https://d.kernelci.org/i/maestro:5d5ba40a9374919c6038ec3=
e50f54dbe70a37c03
> >
> > #kernelci issue maestro:5d5ba40a9374919c6038ec3e50f54dbe70a37c03
> >
> > --
> > This is an experimental report format. Please send feedback in!
> > Talk to us at kernelci@lists.linux.dev
> >
> > Made with love by the KernelCI team - https://kernelci.org
> >
>


--=20
Thanks,
~Nick Desaulniers
