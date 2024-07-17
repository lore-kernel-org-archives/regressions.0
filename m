Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D6D558BA
	for <regressions@lists.linux.dev>; Wed, 17 Jul 2024 22:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721254535; cv=none; b=b1UUiyueodOCg/Ttg4fT3DuJq0Z6kDJS4wBuhV9GcDsVVWei/a7WVPMM+aAQQLXVALDmosg+ZUDb2UwQ0Cj6gvK72hvkIVVTh4VXj4jRq2z27vrQBbeJs0T+84cxu//pmmSRUKp9e/mr0A3p8nQVagK051jfHgc7Tt975g2541g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721254535; c=relaxed/simple;
	bh=iqBWdnCWVVGjxsKJHYFJ10ygsTLaTiTXo//SBjsxAE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nlb5VSWa5SRfnUIHtmCSWTM7RFLF0fMivjIypvwa7oLu7lIxKexFAZ9LQiGA4dtxeURyxFnEga4qXOmFuglbzJSImWYq7mm1eTzLWbZtHg92QEcdaZssj/w+VGJ2m4HuGYHqWNZyj61psfmLOu2rzKdkUL5pkp10hGtdyrwJSq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cub6CPSH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cub6CPSH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC79C2BD10
	for <regressions@lists.linux.dev>; Wed, 17 Jul 2024 22:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721254535;
	bh=iqBWdnCWVVGjxsKJHYFJ10ygsTLaTiTXo//SBjsxAE4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cub6CPSHniJx3TJQaxyfEE/GYn0y38zEiLsaPo4DC2z7G+WoshibxkmZC7/kJIpB5
	 yA5unh2IghV0CtO5Qk/2P/ZQu2PqrpHNJS7nAYhWYlMvltCVzKu9oJnQa4sb/JYYMU
	 oE4Irez6L4XAqKViwgZNO9S1bjuMW8d0KviSq5Rp8xvhVgVdXAGhWVS35H7nTftcad
	 8HmePaeFPID5s79h0tnbZTCFlVk2vhsf8ys8ldSTZdxOXnNKVSyJFC2kgq37EWfPe3
	 91FFbkuoeZrztHoOVocw3gIDmcRqKwbe8RlC9D1ZDh1NcZMahcBkdHa9NvKerCEp5C
	 /ZhfW62ifoQcw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eecd2c6432so3193001fa.3
        for <regressions@lists.linux.dev>; Wed, 17 Jul 2024 15:15:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4dm6aXFu6NQw09en+9aFPZAXa4buihxFrupczTlFkUpcv+sodh+FbACzUC76dwTLCaGZD323Us4ZOEIMI1XXRgHljDHfcRh5QXb4=
X-Gm-Message-State: AOJu0YwCavsyLRjSw99ExpVAgylBzZrg7Q1wtW91SVbwWq9HJVbhmLi2
	8m5eLixsd1E2E5XWdthvkHeXFH+k3ffyRIIoODpdjtHMVEiOs2Taepbgfljm0aQkMLJ64DsGCH1
	V2liZD4J9Ez/dH6n9cVpGcUPV3So=
X-Google-Smtp-Source: AGHT+IEU6ZQrYMuYJ/9M1fmYRSJPnE25AZqLH+OZwIxNyWA9mXOujQZS5A5SYe9auV31g7kZ1FwU+rC3LylCPl5OGkI=
X-Received: by 2002:a2e:82d6:0:b0:2ee:4d37:91df with SMTP id
 38308e7fff4ca-2ef05c9c8femr5090041fa.27.1721254533653; Wed, 17 Jul 2024
 15:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <172096653882.8.16813493378478071178.379356753@simplelogin.com>
 <CAMj1kXG9AjvChj9O6LR+2bFVUoa225phaXndYvQ_f4X4bKioaw@mail.gmail.com> <172125357072.7.13007674265724826216.382402450@simplelogin.com>
In-Reply-To: <172125357072.7.13007674265724826216.382402450@simplelogin.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 17 Jul 2024 15:15:22 -0700
X-Gmail-Original-Message-ID: <CAMj1kXGYicoxQGsv=3uM2bgs99aXxPMFUwib5bTVa6U6OSxzUg@mail.gmail.com>
Message-ID: <CAMj1kXGYicoxQGsv=3uM2bgs99aXxPMFUwib5bTVa6U6OSxzUg@mail.gmail.com>
Subject: Re: [REGRESSION] linux 6.6.18 and later fails to boot with "initramfs
 unpacking failed: invalid magic at start of compressed archive"
To: mavrix#kernel@simplelogin.com
Cc: Radek Podgorny <radek@podgorny.cz>, regressions@lists.linux.dev, 
	regressions@leemhuis.info, Christian Heusel <christian@heusel.eu>
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jul 2024 at 14:59, <mavrix#kernel@simplelogin.com> wrote:
>
> On 7/17/24 5:55 PM, Ard Biesheuvel - ardb at kernel.org wrote:
> > Does it make any difference if you boot with 'nokaslr' on the command line?
> >
> > Another thing you might try is applying the hunk below, to try and see
> > whether the placement of boot_params in the binary is causing the
> > issue.
> >
> > I can also provide a partial backport of the offending patch, to
> > figure out whether it is the allocation that triggers the issue, or
> > the way the boot_params data structure is populated.
> >
> >
> >
> > --- a/arch/x86/boot/compressed/vmlinux.lds.S
> > +++ b/arch/x86/boot/compressed/vmlinux.lds.S
> > @@ -55,8 +55,7 @@ SECTIONS
> >          . = ALIGN(L1_CACHE_BYTES);
> >          .bss : {
> >                  _bss = . ;
> > -               *(.bss)
> > -               *(.bss.*)
> > +               *(SORT_BY_ALIGNMENT(.bss*))
> >                  *(COMMON)
> >                  . = ALIGN(8);   /* For convenience during zeroing */
> >                  _ebss = .;
> >
>
> On 7/17/24 7:16 PM, Ard Biesheuvel - ardb at kernel.org wrote:
> > Please also share your kernel build config and the output of
> >
> > hexdump -C /sys/firmware/efi/efivars/MemoryOverwriteRequestControl-e20939be-32d4-41be-a150-897f85d49829
>
> - nokaslr does not make a difference; it will still not boot
> - linux 6.10 with the partial revert applied, as provided by*@loqs on the Arch forum thread, does not work either - the requested
> hexdump is: *00000000  07 00 00 00 00                                    |.....|
> 00000005
>

Thanks for testing.

Please try the partial reverts in the following message

https://lore.kernel.org/all/a99a831a-8ad5-4cb0-bff9-be637311f771@podgorny.cz/T/#mc9943f4fc27c2f4637d697a4d23e37d2c334d076

and determine which of the two returns your system to a working state.
