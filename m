Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53616296BAA
	for <regressions@lists.linux.dev>; Wed,  8 Oct 2025 01:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759887704; cv=none; b=rdhiyKlYsOrSDAaRZVitZHYnPniuBCNF6TfQJxidIcFAEcM2+gWm6y1kgtrtivQYpGeV2VBMSOc3QOiJ+eTekSVnLr26Di1kpvWKwu5knGYTUL/DZSRXptKnHkQ6Yh8wW1LTOm5gKwpQA0Pl8impFyqv8nZqGRR2CDe8iUX6Wao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759887704; c=relaxed/simple;
	bh=2d1Chcz0fALCnLCYlxrm+Gb5iqPnYg/zPWKHCApOPCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B1TzzdSjzlJtxelIpigULMUWuwxga7CBevXHImQeivS2IW0vtskho6aA6OydR1UtAaWCWpXLNl0dR36H0L3CKAKeX5eduuSIBhjs8VNfOofty8TAyCDpfajeoYhiWiXfr9IJE7dq2rB0VS4mXslEIBzvCFpyyWzsmXnHq82Lk6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJuALz4R; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJuALz4R"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-89019079fbeso1685718241.2
        for <regressions@lists.linux.dev>; Tue, 07 Oct 2025 18:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759887701; x=1760492501; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2d1Chcz0fALCnLCYlxrm+Gb5iqPnYg/zPWKHCApOPCA=;
        b=jJuALz4RyOBORwnn2byYsAEYE0IcFecT51kQ53XUXYwRJVi/f2i0KNC2mvESwSf81U
         zBQOUOK8UNS+lkCNNqMVEq9hjbv/YQvsqmrEo1CdG8xW8ouswfBNS2TCs8MDU6tT6UxT
         Za4gq8EWN9DHXOfKnbeIt+ijzxfwZC021J9/SbtGDmqXaV7PGvuvjeoYKrTBF6rie2iM
         uW1n+meJHFDiCQm0ZE5q2LZ8r/+6b2c1VLJveOu/FkQopBEQLWG3ptVlHR2f0+uOe0Cb
         y/uQfGeIJ3GtZkYJeUFX/Ee/7TZ+ePu2VhlVUjMb6cDo+6WpZs53/ECpBgpgC97laMpX
         yB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759887701; x=1760492501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2d1Chcz0fALCnLCYlxrm+Gb5iqPnYg/zPWKHCApOPCA=;
        b=KgE5i0NGPAkqKXyjSyJw033z1D0d1DD6RJebdglREaEXPLT3wiMSKOVv5IMf+5zDOT
         HNhUqUBWL07ye+6dHo1zIjHl3prDWFl8kaQhWWTk8sldNKTy5noKg1PmrbUdk9US05P9
         rpmupawN7AvRc6u+PlscvqgH1BQjMDfpxO8ZmHY0nxf75ny0gifzMpCfnsdMT8v+AFvv
         cmOF/ECV6qNMuc6Dgoj6Ti9BHkijiuuITPh+w3kMUV9gwV6BAnXG3h8MlRTdxCXHEqUc
         B5UxejLmg1FRmua2GxFU6Y/ifPHw+wedSooYEqPKUBlv2TSORGH7JBRTeXOk98h1bW0f
         Xcxg==
X-Forwarded-Encrypted: i=1; AJvYcCUF5JJGEJ5jg7e7Bf/DHC1OKv42JrVbwtCyHn5bEfpJUjZCv5vrWPUvG3qKhu01GsmNhwPYhBPOUl/lLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrD5fyJADEUW1TuUp+DoUe3bdAq9BHPF4+iUiAxIcjC5BfW0W+
	3adc3G2fRPf6uVODn6IC+jkH8XZ2gv4P4WIN8ZSxCwpZco+QhrU8P5TI2hLIf7/LUp92PhmXHnx
	DeunAVblfMNwGW7qdfvWXEAXUkZ60G+85okL3v9k=
X-Gm-Gg: ASbGncsfESEZt9eIV8OpnhXGJIhHtlT7HimUuI80xMfMe/MlFRTy/LBwyHwsLcdG1rY
	gVnLu9XvrUo5C7ajveL3xoM47Jqge8tmJiEj2wXAK4LmYrSHiz7vluC7q7nWhDk3I9eHH+Jkg8e
	dNPcdjmnLxGawdWMK8ixApCV0W5S5xcHYV608yfV1c39BQ29t2KX0Y0wGgVpk57rJGHH8kEaR5J
	O4gqjdgRmM/91WnRkRhoAGQNOaUZTQ=
X-Google-Smtp-Source: AGHT+IGCLzw8WrTFnL/ewjI/Iek6ECuNetgGdJHAkt6Ut0FaA9jDYls/J/bs7lN9TsiAMr5oerf2CaQVNXadJ1cFuYc=
X-Received: by 2002:a05:6102:290c:b0:522:255d:4d19 with SMTP id
 ada2fe7eead31-5d5e23b3488mr660405137.23.1759887700976; Tue, 07 Oct 2025
 18:41:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
 <20251007231709.6c16802e.michal.pecio@gmail.com> <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
 <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
In-Reply-To: <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
From: Arisa Snowbell <arisa.snowbell@gmail.com>
Date: Wed, 8 Oct 2025 03:41:30 +0200
X-Gm-Features: AS18NWAbL3rEdHwwOMOieX7OCd_BiXsywtAo1FCHES514GK3zV1v4o64ASieQXM
Message-ID: <CABpa4MC4rj+OY=Qv7=YwEHC6HbMu3qLEorjmopWEJ_XVhWZ+zA@mail.gmail.com>
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB merge
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I see the commit closes bug I had myself, when I have my USB audio DAC
connected, its print error message about no ports on hub but all USB
devices work fine.

My motherboard is MSI PRO X870-P WIFI.

Thanks, Arisa

On Wed, Oct 8, 2025 at 3:15=E2=80=AFAM Arisa Snowbell <arisa.snowbell@gmail=
.com> wrote:
>
> Hey, I am back from bisecting it.
>
> The bisect log:
>
> ```# bad: [e40b984b6c4ce3f80814f39f86f87b2a48f2e662] usb: vhci-hcd:
> Prevent suspending virtually attached devices
> # good: [8f5ae30d69d7543eee0d70083daf4de8fe15d585] Linux 6.17-rc1
> git bisect start 'e40b984b6c4c' '8f5ae30d69d7'
> # good: [e580beaf43d563aaf457f1c7f934002355ebfe7b] eth: mlx4: Fix
> IS_ERR() vs NULL check bug in mlx4_en_create_rx_ring
> git bisect good e580beaf43d563aaf457f1c7f934002355ebfe7b
> # good: [b7369eb7319d0cb94ad2ea5b5486e276339c595a] Merge tag
> 'locking-urgent-2025-09-07' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> git bisect good b7369eb7319d0cb94ad2ea5b5486e276339c595a
> # good: [965c995c9a4b395471ff48790a0155ee986ca405] Merge tag
> 'drm-fixes-2025-09-12' of https://gitlab.freedesktop.org/drm/kernel
> git bisect good 965c995c9a4b395471ff48790a0155ee986ca405
> # good: [82432bbfb9e83b7e81d04660fe129b99a29b2ac2] usb: typec: tipd:
> Handle mode transitions for CD321x
> git bisect good 82432bbfb9e83b7e81d04660fe129b99a29b2ac2
> # good: [79e8447ec66289745d1b38679b16dd6c654ff578] Merge tag
> 'phy-fix-6.17' of
> git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy
> git bisect good 79e8447ec66289745d1b38679b16dd6c654ff578
> # good: [ea6bb47fd6a4c5a332f9349c39bf7462e3e7a35b] thunderbolt: Update
> thunderbolt.h header file
> git bisect good ea6bb47fd6a4c5a332f9349c39bf7462e3e7a35b
> # good: [5db5025d32e5b0b4c13198b5570f33d92ae941d3] usb: host:
> xhci-rcar: Add Renesas RZ/G3E USB3 Host driver support
> git bisect good 5db5025d32e5b0b4c13198b5570f33d92ae941d3
> # good: [0ed023a88396088d4221c345a3911f553dd42598] usb: xhci: Update a
> comment about Stop Endpoint retries
> git bisect good 0ed023a88396088d4221c345a3911f553dd42598
> # bad: [a4e143636d5def935dd461539b67b61287a8dfef] usb: xhci: align
> PORTSC trace with one-based port numbering
> git bisect bad a4e143636d5def935dd461539b67b61287a8dfef
> # bad: [931e468764b22a587febf562e57249e95e84350d] usb: xhci: improve
> TR Dequeue Pointer mask
> git bisect bad 931e468764b22a587febf562e57249e95e84350d
> # bad: [719de070f764e079cdcb4ddeeb5b19b3ddddf9c1] usb: xhci-pci: add
> support for hosts with zero USB3 ports
> git bisect bad 719de070f764e079cdcb4ddeeb5b19b3ddddf9c1
> # first bad commit: [719de070f764e079cdcb4ddeeb5b19b3ddddf9c1] usb:
> xhci-pci: add support for hosts with zero USB3 ports
> ```
>
> The first bad commit seems to be
> [719de070f764e079cdcb4ddeeb5b19b3ddddf9c1] usb: xhci-pci: add support
> for hosts with zero USB3 ports. All USB-A devices stop being
> visible/detected.
>
> Thanks,
> Arisa
>
> On Wed, Oct 8, 2025 at 12:30=E2=80=AFAM Arisa Snowbell <arisa.snowbell@gm=
ail.com> wrote:
> >
> > Gonna try to bisect it, might take a while tho.
> >
> > Thanks,
> > Arisa
> >
> > On Tue, Oct 7, 2025 at 11:17=E2=80=AFPM Michal Pecio <michal.pecio@gmai=
l.com> wrote:
> > >
> > > On Tue, 7 Oct 2025 22:47:52 +0200, Arisa Snowbell wrote:
> > > > Hello,
> > > >
> > > > this is my first time here, so I hope I am doing everything correct=
ly,
> > > > if not - help would be appreciated.
> > > >
> > > > I found regression in the linux-mainline aka linuses branch, more
> > > > specifically in the recent USB merge (commit
> > > > c6006b8ca14dcc604567be99fc4863e6e11ab6e3).
> > > >
> > > > All my USB-C client -> USB-A host aka computer(probably all USB-A
> > > > devices but I don't have more to test) - devices are not detected w=
hen
> > > > I boot with this patch, I have to replug the device for it to even
> > > > show up in dmesg logs.
> > > > One device is mice and another one is audio DAC that also shows up =
as
> > > > hub in the dmesg normally.
> > > >
> > > > I reverted the USB merge and everything is fine again.
> > >
> > > Hi,
> > >
> > > Can you bisect the merged USB development branch?
> > >
> > > It looks like 8f5ae30d69d7 (v6.17-rc1) is likely good
> > > and e40b984b6c4c is the merged commit, should be bad.
> > >
> > > Regards,
> > > Michal
