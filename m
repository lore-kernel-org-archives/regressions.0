Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA13D219E4
	for <regressions@lists.linux.dev>; Sun, 22 Sep 2024 20:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727036337; cv=none; b=RLO94Kxn+oZOGHhK9v2N6qZR31F7buArM3koTpifmZcUEeyCbFphzzEfFx9spPV1qggmjKnrCw+pIIdf+0QsbhV/Y6gxb/CB63QzSUyVQ9IbuqwaYQsXdtYUPrcSe53Y8Lr88TuGPSqVb+E4348LRECydKIGJ0xUT9+szM4ntDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727036337; c=relaxed/simple;
	bh=JQF2wHEOy39gPJQyE4jaQPvgH2PM4Ztu8cMFG4wT1eE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F57a81lR9z8ejamGL7x6mJwC2j6r0BAlmkPz0Sow0MsB9xpyRBUo1A/ZjDoFPhj4Cfc62eOnHblcKe+A4v0ATsn6pdXDHTOhP8QyTKZEYKZ2/pTHICBaxGW9VZZ3xPQe84cKIKlMsfQaTLfQtLtoZE83YkQB3osG5jaxYcEZOkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MLqdVf1V; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MLqdVf1V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727036334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JQF2wHEOy39gPJQyE4jaQPvgH2PM4Ztu8cMFG4wT1eE=;
	b=MLqdVf1VXNX0Yi/EcN4WghbNT/73UubMsL2HW4yuKooHW66HF+/rbPN7s8dYujN9rJ5lUU
	9zYloFrmKZWwciyOB4P9JlBaZj/fzNFzFFn6W7GkLiNf/2EMgdlgY6CTczbcXJsEND6RDs
	CDukqcxnA2yumBlu9ebeV4FxD1moZYo=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-z4jO26SfPGuLJlfD5sTN-g-1; Sun, 22 Sep 2024 16:18:53 -0400
X-MC-Unique: z4jO26SfPGuLJlfD5sTN-g-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-209dc9354c3so7923145ad.0
        for <regressions@lists.linux.dev>; Sun, 22 Sep 2024 13:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727036331; x=1727641131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQF2wHEOy39gPJQyE4jaQPvgH2PM4Ztu8cMFG4wT1eE=;
        b=kc7mKF8XEVUSG5NrwsyuT9PDmrDMAoeStGzOfO078yfmCUI8ELhQpZfCnSiGikluhe
         veyOkQk3nM9mwZEzVI8lIlsreiZac2UdQrGnmop6pnd27addW7Y0YvSRBnr6OC9wS/C1
         gJbQOtN3lDNffZzBP2Y55y5ewBN72Q7GiMToGIQpJatQpwEGXznlQWXprwCrANlzSMYa
         3u0FKWjDLgSvbzJFdZRPhwDgl8+Osh532KWdAK/zGAJaFh6bxku8hpTfW0VdBSIURzSj
         m1NsbtTHPgOTNcZyIZkv9dBhgy7sDQfykkb6ow+C3qHBQmIQT7GRNUvguK/JD8q5iZor
         wtiA==
X-Forwarded-Encrypted: i=1; AJvYcCU29bxbM3Kiqd9qNJ19cIUW28Cl2+3Rpt5l/NGqw2FtW2Rli3xAlEuQVXIWqFm/4w5qUhH5nxM1ySHuNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwTu0MSV8zHtxwnALi1j5IykDMCRXaTg9wVp/rsh/Zsa1CyTbD
	Qkuk8QkkI1MFnKq08Q2i/n2HK6gRlqirQ5VCoUtLmxf0osMqJhl4M1sM+FFnB/xlvI+esbxQW0S
	vWQk1rWNSrpwmSOdWO2G2B22vZKHrV1yxnBouH5EdC1g7r0JeFakye8gakIPuPraYWMg3aUDe3D
	mdYhawkJ0tiCzmZPxN4m0ch+kl0ZHgiKdKyFA=
X-Received: by 2002:a17:902:d549:b0:205:5284:e510 with SMTP id d9443c01a7336-208d756dc07mr148771915ad.1.1727036331389;
        Sun, 22 Sep 2024 13:18:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1/PhP8j7+j+MFBqwrJbSHRpRkk2jJTg3qLJwZrq/UPGBOPF6lufpAIxxmQ25p1qB/PrYpl8YbaxClD0c9gxY=
X-Received: by 2002:a17:902:d549:b0:205:5284:e510 with SMTP id
 d9443c01a7336-208d756dc07mr148771705ad.1.1727036330952; Sun, 22 Sep 2024
 13:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJD_bPJes4QhmXY5f63GHV9B9HFkSCoaZjk-qCT2NGS7Q9HODg@mail.gmail.com>
 <B2A62C7F-45BA-43E1-975F-5AF0197CD2C3@kernel.org>
In-Reply-To: <B2A62C7F-45BA-43E1-975F-5AF0197CD2C3@kernel.org>
From: Jason Montleon <jmontleo@redhat.com>
Date: Sun, 22 Sep 2024 16:18:39 -0400
Message-ID: <CAJD_bP+43=XXD7p3fRfDxCbj=_YedgVLv38XO4iOAw94a+4PHg@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Cannot boot Lichee Pi 4A with
 FORTIFY_SOURCE enabled
To: Kees Cook <kees@kernel.org>
Cc: linux-hardening@vger.kernel.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, linux-riscv@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 21, 2024 at 10:42=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
>
>
> On September 21, 2024 10:42:11 AM PDT, Jason Montleon <jmontleo@redhat.co=
m> wrote:
> >Starting with 6.11-rc1 I can no longer boot the Lichee Pi 4A with
> >FORTIFY_SOURCE enabled. This works on 6.10 up to at least 6.10.11.
> >However, with 6.11 I get no output at all from the kernel on the
> >serial console with FORTIFY_SOURCE enabled and the system never comes
> >online on network or otherwise as far as I can tell.
> >
> >I did a bisect which led to:
> >2003e483a81cc235e29f77da3f6b256cb4b348e7
> >fortify: Do not special-case 0-sized destinations
> >
> >If I revert this commit I can once again boot the Lichee Pi 4A with
> >FORTIFY_SOURCE enabled.
> >
>
> Thanks for the report! Are you able to catch what the error log shows? Th=
ere must be some 0-sized array that snuck by.
>
> Can you share your .config and compiler version?
>
Hi Kees,
Thank you for the quick reply! I am using the Fedora 40 packaged
version of gcc, gcc-14.1.1-1.fc40.riscv64.

I originally noticed this while testing a build of the Fedora RISC-V
.config on Fedora 40.
http://fedora.riscv.rocks:3000/rpms/kernel/src/branch/main-riscv64/kernel-r=
iscv64-fedora.config

When I noticed I could not boot this on the lpi4a I tried the
defconfig(arch/riscv/configs/defconfig), which worked. After merging
the configs a bit at a time I narrowed it down to FORTIFY_SOURCE=3Dy

To do the bisect I used the riscv defconfig, running make menuconfig
to turn on FORTIFY_SOURCE, and saving.
https://gist.github.com/jmontleon/9cdc778e9c9139296924d3f71b48067b

As far as logs, I am having a hard time gathering anything useful
because the boot fails so early. Normally with FORTIFY_SOURCE turned
on I get no output from the kernel at all.
https://gist.github.com/jmontleon/42167a7b6d71bb4db8b7ca7114893b86

With a config closer to the Fedora debug kernel config I got a bit
more, but it stopped booting here and doesn't seem much more useful.
https://gist.github.com/jmontleon/00426b3bff2c85a68370ca1fb5f968c7

If you have suggestions for getting more meaningful output I am happy to tr=
y.

The Fedora kernel config boots fine on the VisionFive 2, so I think it
is more specific to the hardware than RISC-V, maybe something T-Head
related if not specific to the Lichee Pi 4A. I was thinking because it
seems pretty hardware specific and failure is so early maybe it is due
to something in one of the THEAD errata or the patch function.

While trying some more things today I noticed if FORTIFY_SOURCE is
left unset and I also unset ERRATA_THEAD_MAE it similarly fails to
boot without output, so I think my idea is possible though I don't
have anything more concrete than that to back it up at the moment.

Thank you,
- Jason

> -Kees
>
> --
> Kees Cook
>

