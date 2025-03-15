Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B8418DB17
	for <regressions@lists.linux.dev>; Sat, 15 Mar 2025 13:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742044182; cv=none; b=j8TWtPyGeQJUEt3PygwnNRb3eoXHeibj76Ksf1agPIqvQ/8D7q1esrHJJmUM4p4aSHVzuFLapmGC/vvV0NIN67IDoTJeNGzfn9VbnGZwzP5CybZGCzcsf2HUxxQtwH78lGi4e/aBvrdrz/mSBiy/Ksa/txbx1qEX0dEdJYiFL0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742044182; c=relaxed/simple;
	bh=bSOJEQkqXt+LSKuOw8V8p8jZVz4JXQkgcJ1vGVHOKLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tYpKNmfjmFbH4zppX42uJExu4PFI5H42jeEmY2Fw+RfB4GeQSyUxBW36kjdtK2YbrbZriJYxnGerhfYsYu4q8I4P4oVEK1iMJs8npmVtF6bL+seExZbSx5xYg7E3mxiZG2zv9GmUM2Z136BxETfSHXnQcy/l3QFfWxlXp7i3srY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMOhYWOX; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMOhYWOX"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fecba90cc3so1384991a91.2
        for <regressions@lists.linux.dev>; Sat, 15 Mar 2025 06:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742044180; x=1742648980; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCEr2QMlkpQdx21zWej238O0NPpcHqzQZxdjc3/YkC8=;
        b=fMOhYWOXaxXPWQ594/ivKdLP7/pDbKnOTtvmw4nnpmCR33eEc/pZliug37RWxZBJZi
         KJZFaNvJlnsGM5GFYf8ARFrcUxfkGngw6dzzYdriwI73yeex5bkoWBFw2COIe72YQlSA
         Yh41oubrd73nn1BbpChavNN6KXge4pxQsU3EeZgJJoiJvOsw9flcsM6w7Uu9XdjCEDsf
         P3gIHG+VHE/gElKkqIiQ7xWnnG76jOyv39yBE+9Kr8nrHCWJTXAwCzEKDR/PCUEaGKV3
         jqLR7Dd11IaqXDZ7MZSUcQRtvxL9dEVL2xOKGcmjR9saLkTlidAu0UO0CHAUFdv0+4cp
         BuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742044180; x=1742648980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCEr2QMlkpQdx21zWej238O0NPpcHqzQZxdjc3/YkC8=;
        b=a1njCb5l98A2EQ07Q1xYBQGpl7KI2acSjlElNA9UiLEvnyfJkjVKWcaS9ItqvlqBPH
         wtTOe6yvrTQGDrIPcga5jPIEqJv6R5cQybCiE3wNPYgvcFa+8UXIIqxGnJ8Ujg8HDbqC
         Fkw29hJMSXMfoLeOxuNMmRUZ23yr0do26uubWCG/M7mu+bRC0cVIa9ssNwlSZj8J/ne1
         Pq6iz7kSq1RjWOEpdDJFtYgFE7AOo+4WUEWl16lpj03hKXFvz3KJhMLBKlWKkrBWgl4r
         rTtesjXCTg8xCGV8RBfJmTA6V7xSGESNrznL3YfArKZsdWdoAJJoL6Vaxms8+DCZNMqU
         1IdA==
X-Gm-Message-State: AOJu0YytarZLKWuXTKlt44anFOrD2cTiLNbvPSKgNme5WWCBB6X9nYIq
	bfLo9y5ZA6rmF2En41lXTJAiyAGD5wSvC4qGsDH0yXsUUIBQnsBG50L/o+vy0YW4hO3+TstSm+F
	SQwAlPRYffrZwih39Cxjr3Faxqvc=
X-Gm-Gg: ASbGnctZ0QyamRi9gBGpFLAwbU7aei6wqQzxtuiEm5hh/bHQYqvah9eS9ZSIDosnkEK
	MY0Doc8VkIbvHhM/+jnMxR1jsuo5IWHcWyojfm6fVtC/gsJUvXbkIeTDO/fSXz8VrerNwVlmdK2
	QQgwTpv1gI7A6PVT2juAq27h+u
X-Google-Smtp-Source: AGHT+IG4Q3HS9QuXzcT1o9irNJ60101QLiurtYJlc9/c1qkLqcNPBAWN5qEatCXb82jd3nw81T0Q6iKIEnHeeQdgHTk=
X-Received: by 2002:a17:90a:e18b:b0:2f4:4003:f3ea with SMTP id
 98e67ed59e1d1-30151d64f50mr8190483a91.33.1742044180462; Sat, 15 Mar 2025
 06:09:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAG8fp8QvH71Wi_y7b7tgFp7knK38rfrF7rRHh-gFKqeS0gxY6Q@mail.gmail.com>
 <3f4758be-df0e-44f3-b259-af02a2d7b3b3@intel.com> <CAG8fp8S92hXFxMKQtMBkGqk1sWGu7pdHYDowsYbmurt0BGjfww@mail.gmail.com>
 <09401d9f-6a5f-40d7-ac3c-e149ef57bcfd@intel.com>
In-Reply-To: <09401d9f-6a5f-40d7-ac3c-e149ef57bcfd@intel.com>
From: Akihiro Suda <suda.kyoto@gmail.com>
Date: Sat, 15 Mar 2025 22:09:29 +0900
X-Gm-Features: AQ5f1JoDURq8e8-8CdQokkuW8F7vxYx9c3PBA7sKIS1PWvfMJra4SMfuFYBRZgQ
Message-ID: <CAG8fp8R2HaU0XQDsnFG4CyF=XbqLV3sv=U7-52QKomDptQY1Nw@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] x86: kernel 6.12 crashes during
 get_xsave_addr_user on Apple Virtualization
To: Dave Hansen <dave.hansen@intel.com>
Cc: Linux Regressions <regressions@lists.linux.dev>, Linux x86 <x86@kernel.org>, 
	aruna.ramakrishna@oracle.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Which leads me back to thinking that doing nothing may be the best
> approach here.

There is a huge demand in the macOS community to run Linux virtual
machines without modifying the kernel cmdline.

Any chance to just merge "[PATCH] x86/pkeys: Disable PKU when
XFEATURE_PKRU is missing"?
(This revision checks the XCR0 flag, not the ACPI vendor string)
https://lore.kernel.org/regressions/20250314084818.2826-1-akihiro.suda.cz@h=
co.ntt.co.jp/T/#u

I have also sent a suggestion to Apple to either implement PKRU, or
drop OSPKE from cpuinfo, but it may take a while until they ship a
fix.
Also, some users do not want to update the host operating system.
So it would be nice to have a workaround in the Linux guests as well.

2025=E5=B9=B43=E6=9C=8815=E6=97=A5(=E5=9C=9F) 0:07 Dave Hansen <dave.hansen=
@intel.com>:
>
> On 3/13/25 23:22, Akihiro Suda wrote:
> >> The warning here seems to be because the kernel thinks protections key=
s
> >> is enabled (X86_FEATURE_OSPKE) but also thinks XSAVE management of
> >> protection keys is _dis_abled. That's a valid hardware configuration,
> >> but it's a configuration the kernel never expects to see.
> > Right.
> > The VM seems missing XSAVE feature 0x200: 'Protection Keys User
> > registers', while it has ospke in cpuinfo.
> > This configuration seems still weird, as both features seem missing on
> > the macOS host.
> > (See `physical-macos-host.txt`)
>
> Yeah, so the CPU is enumerating support for protection keys but missing
> XSAVE support for managing PKRU. We've envisioned the _reverse_
> situation before, but not this specific scenario.
>
> One option is to do nothing. Throw up our hands and declare the VMM so
> broken that it's silly to go chasing a fix.
>
> Another way to fix it is to throw this hunk in somewhere:
>
>         if (!fpu_kernel_cfg.max_features & XFEATURE_PKRU) {
>                 setup_clear_cpu_cap(X86_FEATURE_PKU);
>                 setup_clear_cpu_cap(X86_FEATURE_OSPKE);
>         }
>
> but that's PKU-specific.
>
> There are other features that would have similar issues if the VMM did
> something similar for them, like:
>
>         [XFEATURE_PASID]                        =3D X86_FEATURE_ENQCMD,
>         [XFEATURE_CET_USER]                     =3D X86_FEATURE_SHSTK,
>
> which kinda calls for a more generic solution like:
>
> diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
> index 0bab497c94369..a358d45c781ec 100644
> --- a/arch/x86/kernel/fpu/xstate.c
> +++ b/arch/x86/kernel/fpu/xstate.c
> @@ -800,6 +800,10 @@ void __init fpu__init_system_xstate(unsigned int
> legacy_size)
>                 /* Careful: X86_FEATURE_FPU is 0! */
>                 if ((i !=3D XFEATURE_FP && !cid) || !boot_cpu_has(cid))
>                         fpu_kernel_cfg.max_features &=3D ~BIT_ULL(i);
> +
> +               if (!(fpu_kernel_cfg.max_features & BIT_ULL(i)) &&
> +                   boot_cpu_has(cid))
> +                       setup_clear_cpu_cap(cid);
>         }
>
>         if (!cpu_feature_enabled(X86_FEATURE_XFD))
>
> Which leads me back to thinking that doing nothing may be the best
> approach here.
>
> Let me noodle on it a bit more.
