Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4181C861F
	for <regressions@lists.linux.dev>; Wed,  2 Apr 2025 19:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743621166; cv=none; b=gxC0iQID2CDsZ2kVp5sPll3k+0W8RqAsKUg6RA86ul5ZucIlinB17suCY7ngCXOTYvZ3Tr0bYwXutjRl5Wc1AiMqUrNSW+LNcrFVtHOlhxq8jCAQ+GZS2zzBwyR1ixo1iv3jxOzXtYXHrcon4diVTR+Fi+Yb69Ot/AVaayaTwTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743621166; c=relaxed/simple;
	bh=aK3VBx6NA3jZwfdsrWRY2dRnu0FqhUszgGEOWyV+h3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QnOh8ujwU3URH9qxqWwDzyLqzl2iObP6h2vHDqcBbEr2a7hW4PkyAxOU/dOB4dD5VAwCaVxipqFBQt/KacPsZyucSy8OF3pwf5P/8jYHSi3Z/UqfT89ICcZNAuwdhr0mMJmAYYIxXiH1Cx/uhOMoIbLbw9UlTNeTGGWRVQSXepc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fj4eAvTt; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fj4eAvTt"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-525b44ec88aso84711e0c.3
        for <regressions@lists.linux.dev>; Wed, 02 Apr 2025 12:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743621164; x=1744225964; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufQZbME7cCWTlfUFUJg7J87wZvmjwZWF7BNQvB4L4UM=;
        b=Fj4eAvTtScoBakHKB/mN/GRk5YjlfvbMIHyJE0h7xuOMR9+Afx5liY7ILMls+vxgXS
         RaRjusWQVPnxoxkvr3IQcWjztwsL9ZQFNkeGF4AdVjRAmPmj7rKCsPharA7QYHBomChM
         ShN8WaTTFb4F0vIqSi/ld6Hlx6rxf3SNFxh2MX0f+waJ4Qv8D2fqrmqUa8VWBGDDte6J
         lXmcAfTyLkxP3SIPeAlhuBnnKZLaVs+DjU6lSCaAaj/dwiCK8SZVtTMSrMUjg719MNWS
         Z877xP4VBJTV9VxfDgJv3kagV3qnmzc7Wp3dNEXfRhF0OP0BjJjAhVTX1oOF4B/oe/BJ
         2Z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743621164; x=1744225964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufQZbME7cCWTlfUFUJg7J87wZvmjwZWF7BNQvB4L4UM=;
        b=ecfglYcgoBM1feMvjmMvvV3cnKWDzl9yzabMGCp7JHbDMPJMyI+3P3IU+vuilDEF6e
         xYs49VieiIkX+Qs7Bk2rqBKHoqct/kwMBIrbq1pnyv+wthQwF/4SKJdkkZa8jnTeeAFj
         Wxk+dU4m80UMyeFtJWws5h0vKp4FLRXx41YRHetFFQ3RzOYNHMSi1sb8pj+Eb9IUD6o0
         5n6omnqVYn0XAnqAd6KN4dwO1Ji5rVRH6qInmWpA0wPTsAZbzAFo+VeoLgwLP6un4KUM
         HLly1eIN3URTr6innx/4Z3AR3ShGXMzYPVyKnlkKNs/IyoYg39E4N9HudVRvePhb2XA8
         /4jg==
X-Forwarded-Encrypted: i=1; AJvYcCUrEY9oSgM3deffXUhpdwtfsoFkLWeH4jnBFmg5R3FBdnVvyLnijJLnLxeQSYpHCXXNP65rbqh2dt3Dig==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZJVcgRfkEcapt2E291VlURjWQb61yjjP7VMGPXIDs5qlYLVYN
	PU5UVM4asUV8C7hIP9lN2A8ZlTmJ9SifKSaYZ9Ef4iGFKnbuJCmcqCUCve699VGsxhqP6812Etj
	kSYEFVImtwUpn6sSRNofuCuCGaFM+pgNbU7IzCA==
X-Gm-Gg: ASbGnctNQXLN3fFpFBFlapFiOCvTqqzmKVG2DcJN0jYjRMzlZm8nHKctrz/i/OsGZOp
	Gr3QKy54noaPM/ZjSwg+6U2BGVKWHNxU8qPeeN0i2tZVPQdJR6EAEOoPhU+xFJ93vL7CmMgfjVe
	XyC4bQnLj2oSz0dTkKAd/tWwoDELTAXN7/1zHrKfPEFvSFSqRaHCZQa30VhGQ=
X-Google-Smtp-Source: AGHT+IHwLcsi3BX8Jz57ZZBx4yNh0gsPGUL4LlIBXdD4VmESoE42IUlvk+9eP+LcFYoQddReWmd77wMhRr7Yoibb+IA=
X-Received: by 2002:a05:6122:a07:b0:518:a261:adca with SMTP id
 71dfb90a1353d-5261d4759bcmr11728250e0c.8.1743621163716; Wed, 02 Apr 2025
 12:12:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250313135003.836600-1-rppt@kernel.org> <20250313135003.836600-11-rppt@kernel.org>
 <20250402140521-bf9b3743-094e-4097-a189-10cdf1db9255@linutronix.de>
 <Z-0xrWyff9-9bJRf@kernel.org> <20250402145330-3ff21a6b-fb03-4bc8-8178-51a535582c6f@linutronix.de>
 <20250402181842-f25872a1-00f7-4a8f-ae6d-3927899ee3a6@linutronix.de>
In-Reply-To: <20250402181842-f25872a1-00f7-4a8f-ae6d-3927899ee3a6@linutronix.de>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 3 Apr 2025 00:42:32 +0530
X-Gm-Features: ATxdqUEPLfNJB2FSv1nTGKqf_ZE3BXsv2R3C6KxSgMELRNHzW7jhhAvjwROmbyc
Message-ID: <CA+G9fYuM3XR3yMD9qwubGUYTFazpCAzK4kBw33Lagsw2HBQfhA@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] arch, mm: set high_memory in free_area_init()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, 
	"David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Apr 2025 at 22:01, Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> On Wed, Apr 02, 2025 at 03:07:51PM +0200, Thomas Wei=C3=9Fschuh wrote:
> > On Wed, Apr 02, 2025 at 03:46:37PM +0300, Mike Rapoport wrote:
> > > On Wed, Apr 02, 2025 at 02:19:01PM +0200, Thomas Wei=C3=9Fschuh wrote=
:
> > > > (drop all the non-x86 and non-mm recipients)
> > > >
> > > > On Thu, Mar 13, 2025 at 03:50:00PM +0200, Mike Rapoport wrote:
> > > > > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > > > >
> > > > > high_memory defines upper bound on the directly mapped memory.
> > > > > This bound is defined by the beginning of ZONE_HIGHMEM when a sys=
tem has
> > > > > high memory and by the end of memory otherwise.
> > > > >
> > > > > All this is known to generic memory management initialization cod=
e that
> > > > > can set high_memory while initializing core mm structures.
> > > > >
> > > > > Add a generic calculation of high_memory to free_area_init() and =
remove
> > > > > per-architecture calculation except for the architectures that se=
t and
> > > > > use high_memory earlier than that.
> > > >
> > > > This change (in mainline as commit e120d1bc12da ("arch, mm: set hig=
h_memory in free_area_init()")
> > > > breaks booting i386 on QEMU for me (and others [0]).
> > > > The boot just hangs without output.
> > > >
> > > > It's easily reproducible with kunit:
> > > > ./tools/testing/kunit/kunit.py run --arch i386
> > > >
> > > > See below for the specific problematic hunk.
> > > >
> > > > [0] https://lore.kernel.org/lkml/CA+G9fYtdXHVuirs3v6at3UoKNH5keuq0t=
pcvpz0tJFT4toLG4g@mail.gmail.com/
> > > >
> > > >
> > > > > diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
> > > > > index 6d2f8cb9451e..801b659ead0c 100644
> > > > > --- a/arch/x86/mm/init_32.c
> > > > > +++ b/arch/x86/mm/init_32.c
> > > > > @@ -643,9 +643,6 @@ void __init initmem_init(void)
> > > > >                 highstart_pfn =3D max_low_pfn;
> > > > >         printk(KERN_NOTICE "%ldMB HIGHMEM available.\n",
> > > > >                 pages_to_mb(highend_pfn - highstart_pfn));
> > > > > -       high_memory =3D (void *) __va(highstart_pfn * PAGE_SIZE -=
 1) + 1;
> > > > > -#else
> > > > > -       high_memory =3D (void *) __va(max_low_pfn * PAGE_SIZE - 1=
) + 1;
> > > > >  #endif
> > > >
> > > > Reverting this hunk fixes the issue for me.
> > >
> > > This is already done by d893aca973c3 ("x86/mm: restore early initiali=
zation
> > > of high_memory for 32-bits").
> >
> > Thanks. Of course I only noticed this shortly after sending my mail.
> > But this usecase is indeed broken on mainline.
> > Some further bisecting lead to the mm merge commit being broken, while =
both its
> > parents work. That lead the bisection astray.
> > eb0ece16027f ("Merge tag 'mm-stable-2025-03-30-16-52' of git://git.kern=
el.org/pub/scm/linux/kernel/git/akpm/mm")
> >
> > As unlikely as it sounds, it's reproducible. I'll investigate a bit.
>
> The issue is fixed with the following diff:

I have applied this patch,

>
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 284154445409..8cd95f60015d 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -2165,7 +2165,8 @@ static unsigned long __init __free_memory_core(phys=
_addr_t start,
>                                  phys_addr_t end)
>  {
>         unsigned long start_pfn =3D PFN_UP(start);
> -       unsigned long end_pfn =3D PFN_DOWN(end);
> +       unsigned long end_pfn =3D min_t(unsigned long,
> +                                     PFN_DOWN(end), max_low_pfn);
>
>         if (start_pfn >=3D end_pfn)
>                 return 0;
>
>
> Background:
>
> This reverts part of commit 6faea3422e3b ("arch, mm: streamline HIGHMEM f=
reeing")
> which is the direct child of the partially reverted
> commit e120d1bc12da ("arch, mm: set high_memory in free_area_init()").
> The assumptions the former commit became invalid with the partial revert =
the latter.
>
> This bug only triggers when CONFIG_HIGHMEM=3Dn. When mm was branched from=
 mainline
> the i386 configuration generated by kunit ended up with CONFIG_HIGHMEM=3D=
y.
> With some recent changes in mainline the kunit configuration switched to
> CONFIG_HIGHMEM=3Dn, triggering this specific reproducer only when mm got =
merged
> into mainline again.
>
> New kunit reproducer:
> ./tools/testing/kunit/kunit.py run --arch i386 example --timeout 10 --kco=
nfig_add CONFIG_HIGHMEM=3Dn
>
> Does this sound reasonable?  If so I'll send a patch tomorrow.
>
> @Naresh, could you test this, too?

I have applied the proposed fix patch and tested.
The boot test and LTP smoke test pass.

Links:
 - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/naresh/tests/2vBZg=
uDGiZclS394TDRdwW61twC

>
>
> Thomas
