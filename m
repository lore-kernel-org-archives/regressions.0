Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C274536D50A
	for <regressions@lists.linux.dev>; Sun, 15 Mar 2026 14:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773586412; cv=pass; b=eIj8sF5dlUPwXi9DL0hIDcsav5O5PanEkKNGRq6VSQieDmROyyjJwv9tfauAVBSm/vZWEyGMJpekDYIayxa03mzJhBNHUVQ1KK+e3j/MAOXGN5ljKdv4pSzvIue/JRBMb22mNWCbu6SkEpyGnprMVUczejQqmDYMCT6opeu/O7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773586412; c=relaxed/simple;
	bh=l8Sb2uRoA+XhZwSNbJ7+xKsuwPFHT9pjWHWnlZbawG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h8r2YWLGzTfODppnNPy7GDyDc9dJc/erjjhsblmWKIX1ZH0H0wMcNrivifo/brxlWKfXYFt4QMFYdBZ/vlc1eejWsKqjSyiXhDTdRHCuwGjTuNvUahMgnk93VDXsGbEn04NNCRn31F1k4p1gvuhye6mltlCJ/Xe5hRSDUZt2l7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPTNjZSt; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPTNjZSt"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b97bc26eb68so2382866b.0
        for <regressions@lists.linux.dev>; Sun, 15 Mar 2026 07:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773586409; cv=none;
        d=google.com; s=arc-20240605;
        b=bVVCcjpJwi7PaB9O8dP+uHwT9ohiFuMTbbzqZOa8Ltk7QfIdLVgXS7PmDWPsD18fkP
         ZLQsF7WVRoKEl2a+Ym9nSTeInE2Fp9QjqH62t+KO/CGT/a4azxTsh/fYVDjJTLlf0/E5
         i80It2w6AshDhcZq4OdtYt+b6BZOt1zg1hZgSicE7CHTipQuiYPOwAp72lWTXPn++8cM
         AwP+Devq1kigIgFm+KIzIOrz5kjyuVtN0d3oZG6sAVhqkkcz3YVCC6fZhrn7CZQCsjHy
         UH9X9/nvU7vf07LKc/If2vCo2KOXN3phdJH4ATRrwiEEi6HcVwngw1u1ilknGoUPQ7OE
         qr0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T4CJCRlVmNcmaaBkWvC+xv0ht0aAw3516GPBlPoEz/U=;
        fh=5ntRBfAY/d66yYK3wxgZOBDWrlKvzl0/ZRTus+nBVQU=;
        b=GFNj7TrlTV9sMlZSM2cZvUMSdEpz/z12GQ8v5TFSwnxdb0ptx7uHSynveb0ynj3EGE
         Nzs7QPZ8o5/JKKF43/IuNGku4h9pxFwrsf14YLkDusTjvNrWKutsrDu63rxOWBucFTj7
         4mN7hmS4z/ejfElNr4tQcvJoHYhfb0jmOs2gefPP0tRs2iANcjf4+ZZgzRF9Kv6G9PAv
         G0nt/7f7Ynu/HaZyyTbzJbIyYjgegb8ZNtommN0KAx8qktgnCbvSYJQ/fbQgaB5Em/YY
         kz83Gk0TwTxHPBZqBdjVu6xgQ7bWOKhXzo4QzmS7gUKTXWq3t7KFRauBM2Ev+zUoUYLx
         OkOg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773586409; x=1774191209; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4CJCRlVmNcmaaBkWvC+xv0ht0aAw3516GPBlPoEz/U=;
        b=EPTNjZSt1oX+GKTYpKr7OqgReNiIJEvrcOrdDwHpAm/aU8bpaFXJWjbcDNGQRc8dAQ
         pGfrcMd5QnYpeB2Ako9hj1nGoeELOecRwM6SXfBdVbnRIVr+1HXqsC8GkPxzGhWNZZDi
         X9lPIgbOVwOufQspKjwnhlfBWdNPVf7FRJ7JKvE4w83f/1C8VI7W40ycjYwh9YOVDwLu
         bfdP7BNqFZ7hY7fOG6YHbYs63JUQSrNL8xWPNOcwrNzg3cHiYra8zSinCTLpdKZ9DavA
         ogdE9IJG11hWfrqi7ja8Y2MNXnLeuVefIlwjjX5HrFC/1oE4AiOSUlTViTKKyCoB8Vni
         El5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773586409; x=1774191209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T4CJCRlVmNcmaaBkWvC+xv0ht0aAw3516GPBlPoEz/U=;
        b=lFsZlB0aFpbPWzQI4WDc+Uk7lFaYgqpwXOwVcaDBxDh2i+1dmFX8RKbfWy/D8TlFjY
         2uIAXD2u49ck+HUEgVbPIOIcZiWI0kriE3sVHRh6y4u0JBH6hLhjVu8TGay4WKp4QUXs
         WdGqW6omk/w6mSBwdzvZTJ5d2GuORMfNhxkjB84vFx1SgPTPqw53cXGWF3pUhDKawavL
         LHWwMJTpGO+NbIVI8iSgsORsUhwGR0UTF9RETtHe2jGELbLU76T2UOPR3bp5xwMZXdZi
         qfZ0NER5wBZdzF5cQAyaLyhdV1YevxSokW5OBFB422mFQn9u/qWSE7fmooT3peCi0T1f
         XO4w==
X-Forwarded-Encrypted: i=1; AJvYcCXT6vfZvgBN0+vim9dQ9bwaqD1TeFU3ybqjuQMmXvbm8HoflsAlHl+ZwQ2wIYSleFptrXRevlr4pH04ag==@lists.linux.dev
X-Gm-Message-State: AOJu0YwD6Ye07hs5ChYnOjdZzWY0Pbj8CDHLyq3rFlXSEOKAtwW1FLA7
	WznCWi2ovLUH1KPEbsn5pmVgUcuiP4jT0OqijJWFJo85x/j7Z6wMLJfFNruH5MqwBbxNYP2yoxK
	0JJN5WLiRu8cm3wNIfDSlkStKQM1XDeU=
X-Gm-Gg: ATEYQzwRLMaPegT+AjiX26c/S7GVT3PUFL65fjQfOw+s7oc2cKJv28ytsk4eaUu4MN1
	HdHo575o06VpVzY7qHW7pa8cpuSApRya1RbLaF8OjRNeWvt4LkglfIcCG+1zZ8Lj9TPh7MNgLIb
	S/g3wk8JDexbGdXFQk16530ZxjxS5DRoUjdJjGT6Y/5oEiVois80Ua7CHZzEbh/4G84d5T08YNd
	z1/Gwtv56+cfsjZk9PgD3YREuT4fo3FRHb1kv4GwNWJ4T8K0geosw8/9paCfzAkazYH34tuDqnI
	0F7Os+E=
X-Received: by 2002:a05:6402:13c7:b0:665:ea0:3aeb with SMTP id
 4fb4d7f45d1cf-6650ea03c0fmr549081a12.1.1773586409038; Sun, 15 Mar 2026
 07:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6ba903ad-9897-42bb-8c2d-337385cc3746@molgen.mpg.de>
 <db387081-345f-423a-a0ff-e13f3bec2d51@molgen.mpg.de> <CADVatmM_mRnkDX=hpUjbyKkZnGynxJfRSujGxm2LaWWMEL_2ew@mail.gmail.com>
 <ef9223ee-0a4e-468c-bfd0-0cf190d262f1@molgen.mpg.de> <aVgjpWaIRkerdgCa@eldamar.lan>
 <49cdd663-bcbd-48b4-ac38-77ce94ef0c8d@molgen.mpg.de> <aVj-mz8vaw53TWtX@debian>
 <abX53NWDsG8oW7H6@monoceros>
In-Reply-To: <abX53NWDsG8oW7H6@monoceros>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sun, 15 Mar 2026 14:52:52 +0000
X-Gm-Features: AaiRm50qoW5875jVMg8blrX-fMQiTqfJs8s9vRfUb-tlNoJDYMwZIeq1FVYugT8
Message-ID: <CADVatmPm5Xs1W-f-u34bXs1ok=8zyySGSSZk0KKy5dWXZLXQZg@mail.gmail.com>
Subject: Re: BUG: kernel NULL pointer dereference, address: 0000000000000000
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@debian.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Salvatore Bonaccorso <carnil@debian.org>, 
	Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, regressions@lists.linux.dev, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	benh@debian.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 15 Mar 2026 at 00:37, Uwe Kleine-K=C3=B6nig <ukleinek@debian.org> w=
rote:
>
> On Sat, Jan 03, 2026 at 11:33:47AM +0000, Sudip Mukherjee wrote:
> > On Sat, Jan 03, 2026 at 12:01:19PM +0600, Paul Menzel wrote:
> > > Dear Salvatore,
> > >
> > >
> > > Thank you for the follow-up.

<snip>

>
> There are several backtraces, I looked at two of them and both trap at
> an address that corresponds to:
>
>         /*
>          * This has to be run as last thing since init_state may need oth=
er
>          * pardevice fields. -arca
>          */
> ->      port->ops->init_state(par_dev, par_dev->state);
>         if (!test_and_set_bit(PARPORT_DEVPROC_REGISTERED, &port->devflags=
)) {
>                 port->proc_device =3D par_dev;
>                 parport_device_proc_register(par_dev);
>         }
>
>
> in parport_register_dev_model(). However the trapping machine code
> doesn't match the kernel modules of the respective kernels, so that's a
> bit strange and I'm unable to tell which of the pointer dereferences
> there results in the NULL pointer exception.
>
> Maybe this is also an instance of the hardware disappearing? At least
> port->ops and pardev are non-NULL earlier in that function and all
> static initialisations of a struct parport_operations have an
> init_state() callback.

Thanks for confirming. That is also my understanding that the
underlying hardware disappeared and mentioned that in my first reply
at https://lore.kernel.org/lkml/CADVatmM_mRnkDX=3DhpUjbyKkZnGynxJfRSujGxm2L=
aWWMEL_2ew@mail.gmail.com/#t


--=20
Regards
Sudip
