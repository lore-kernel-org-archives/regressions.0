Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B22BA3F
	for <regressions@lists.linux.dev>; Thu,  9 Oct 2025 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760012210; cv=none; b=C4dS+IZsySBSIbBQbRurNtN/Ku3YJcd8X4G3juLU8Bfi8wCrdEG5+oQzPl4rsd1+jshgjn3HLz6mAVfpzvqrCaG4NYLuRpHe7X+aPeFuK40nDXM1h1dHFRgobl7Wz0XY0HPlP/bpd4xOF7mxCJnIfCRkUhVyQEYlxSTa6WsI4eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760012210; c=relaxed/simple;
	bh=ERzAXgXOZR7nhWHXRWiaHvI0m7/fpiSEFN6w/sNDYA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cBtW6B4TUhS98j7K2efxnbWNou8vwzMjzeZc+DUwcvaYhsIFxWOvS70EYQ5W7rS9bje+RUbtt/zggNQw1YZY7sbCSshM9Kh9Zp/xHWAYvnU4ZUlKVZ2FzI6GGME1+k+1awy5SPjs8ITxLp5ZygyVViFkSI5doydPQHGQ93aqfMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3r2dG1i; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3r2dG1i"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-54aa0792200so579045e0c.3
        for <regressions@lists.linux.dev>; Thu, 09 Oct 2025 05:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760012207; x=1760617007; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIzWNqPafaDiQy3O44j6iD26U8n5IpZZY5s3HIzTHMA=;
        b=P3r2dG1i8KvQU3YvHIdiweCSB520+wNMQ6UVh7iTOgapODo+BWbVczBqXxzSsvP+42
         QsgaSsHze7MaXSN1wnhuh2ZS1Z/UuvNW2+EvCogwPNv0gv0n4mc0wAvVrc5Nj3/nU21+
         JJ9BJnlAggaLFeG9LgfX6EJwRNy6GMfdZjOYuXn7TtAnSgG4Q8Kaql+plLqy3il2jmXG
         Brh9vLsjjntfBow2C9s1kVW1dbErK2Fc3fUrcPu2DgMkXd09OoxI9XO0EqrhX88SgWEj
         VqYnwjj7BjULbKcC+K6QYeVxnmBIIdbIqtttnmqOcO1nAsZ3dEBtFyT1vUAjWSI0cBQa
         grLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760012207; x=1760617007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIzWNqPafaDiQy3O44j6iD26U8n5IpZZY5s3HIzTHMA=;
        b=L3d+1oeopFHoeN5WIgho8olhbICXfZsZTmvUP5IIMc74XztPm4DI9LBb2XfC4XCXOY
         Mjfv0awGtBnChaTnpmLAgweXWQS4K23QD6x6t7BlkHzuTz457brjbBqwmag9DB/rNYov
         TyzZwbF5ZnwdHfQBkdIum/tF+gt1ajNsorap907dbrI5QZLjx6Qy1vyWwOoc2h4zZdpd
         scH0P6rwt2e9ejE2TtPBgVeewPNnPB7huVCT0TUqPK7mqST1bYjviDGxlUpHk3a5bvzF
         GlwUb/HR/h9zebuRq4DBVz5WKSRU+qslzpzWS9Plj6SHy6joCusTFr025gBQmw5dkVpz
         X0Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXZp7irYCKkPrLyIDEZ4RKAJMqtWt74PkFHisloG5FZjtGcKzQXjDVsAsTAvHmpxLCp/3KcHZGd1fLhPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQDXFSZnuBsTz0GXDRR/wMKi7TZ4qbYLljdNiBB9vtj6e1j3nD
	AHiKc2LrsYJebmibeC0cpj17vpuYYbn+4HpbAG/+Rk1PWRGJFF2mArerJ6LaklSlAtNibyUwymf
	3myR2grhJSw+KeZsRh5v7RCysc1LCG3bYloyylaE=
X-Gm-Gg: ASbGncv7d1E5sXdSHH8vlvVTv/G+FUUeengxtnMhncKXwUhZ5PZsNI1fS50+cujAG2G
	bu1mlFQ4HH+RXraKFLlw9n6wrmPdnTP2wJ0RJHLMm+d9mt3VGJuHGUF2+fCYVuVUo6FJSUoMDi9
	VwqRFkoBiZRNQ9s3rQJAbsoZcr5u4/eMj1Ti++8aUvQUZduG0/kJvbbblY/afA8YQqMbKz6zUd5
	6MVpW6kk7YvjwVJ3QuwW75BBQeu+e4=
X-Google-Smtp-Source: AGHT+IFIJ/9BZfp8gwr6xofJHTQ7MouFF6fCDUYp0FjoxURhrvvl+/ubhVW1jtJ8AV8/uUwMKeYNUzbWlwi3H3WNPD0=
X-Received: by 2002:a05:6122:e002:10b0:554:b928:6f with SMTP id
 71dfb90a1353d-554b9280175mr2336073e0c.0.1760012206811; Thu, 09 Oct 2025
 05:16:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
 <20251007231709.6c16802e.michal.pecio@gmail.com> <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
 <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
 <20251008082055.5646dadc.michal.pecio@gmail.com> <CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
 <20251008130532.49922d58.michal.pecio@gmail.com> <CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
 <20251008223406.13f16f19.michal.pecio@gmail.com> <CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
 <CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com> <20251009131444.2c221922.michal.pecio@gmail.com>
In-Reply-To: <20251009131444.2c221922.michal.pecio@gmail.com>
From: Arisa Snowbell <arisa.snowbell@gmail.com>
Date: Thu, 9 Oct 2025 14:16:35 +0200
X-Gm-Features: AS18NWAF31eFE1up9GiEj4RHhIbRq0YZZzBP_JFLGCWbxoH-A4-CI_XirfFeEvg
Message-ID: <CABpa4MC-pij0Fczh-mH3zc+Ey2ALX70OfxX=cG4om7R6WMdRBg@mail.gmail.com>
Subject: Re: [REGRESSION] [REPRO] USB-A devices not working on boot after
 recent USB merge
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev, 
	Niklas Neronin <niklas.neronin@linux.intel.com>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch fixes it

- Arisa

On Thu, Oct 9, 2025 at 1:14=E2=80=AFPM Michal Pecio <michal.pecio@gmail.com=
> wrote:
>
> On Thu, 9 Oct 2025 00:25:55 +0200, Arisa Snowbell wrote:
> > This is what I get when I use good kernel:
> >
> > kernel: xhci_hcd 0000:7a:00.0: xHCI Host Controller
> > kernel: xhci_hcd 0000:7a:00.0: new USB bus registered, assigned bus num=
ber 9
> > kernel: xhci_hcd 0000:7a:00.0: USB3 root hub has no ports
> > kernel: xhci_hcd 0000:7a:00.0: hcc params 0x0110ffc5 hci version 0x120
> > quirks 0x0000000200000010
> > kernel: xhci_hcd 0000:7a:00.0: xHCI Host Controller
> > kernel: xhci_hcd 0000:7a:00.0: new USB bus registered, assigned bus num=
ber 10
> > kernel: xhci_hcd 0000:7a:00.0: Host supports USB 3.0 SuperSpeed
> > kernel: usb usb9: New USB device found, idVendor=3D1d6b, idProduct=3D00=
02,
> > bcdDevice=3D 6.17
> > kernel: usb usb9: New USB device strings: Mfr=3D3, Product=3D2, SerialN=
umber=3D1
> > kernel: usb usb9: Product: xHCI Host Controller
> > kernel: usb usb9: Manufacturer: Linux
> > 6.17.0-1-mainline-12298-gf5bd2142c274 xhci-hcd
> > kernel: usb usb9: SerialNumber: 0000:7a:00.0
> > kernel: hub 9-0:1.0: USB hub found
> > kernel: hub 9-0:1.0: 1 port detected
> > kernel: usb usb10: We don't know the algorithms for LPM for this host,
> > disabling LPM.
> > kernel: usb usb10: New USB device found, idVendor=3D1d6b,
> > idProduct=3D0003, bcdDevice=3D 6.17
> > kernel: usb usb10: New USB device strings: Mfr=3D3, Product=3D2, Serial=
Number=3D1
> > kernel: usb usb10: Product: xHCI Host Controller
> > kernel: usb usb10: Manufacturer: Linux
> > 6.17.0-1-mainline-12298-gf5bd2142c274 xhci-hcd
> > kernel: usb usb10: SerialNumber: 0000:7a:00.0
> > kernel: hub 10-0:1.0: USB hub found
> > kernel: hub 10-0:1.0: config failed, hub doesn't have any ports! (err -=
19)
> >
> > where the 2.0 USB's work, mice is powered on, with the bad kernel the
> > mice doesn't even power the LED's on.
> > In the bad kernel its missing the New USB and all.
>
> Okay, thanks. I now see what's going on.
>
> I have successfully reproduced it on a normal controller by patching
> the driver to simply ignore any USB3 ports. With this patch, no root
> hubs are registered at all until I revert the "bad" commit.
>
> In my case it's an idiotic little problem:
>
> xhci_pci_common_probe()
> {
>         usb_hcd_pci_probe() {
>                 // allocate xhci
>                 xhci_run(xhci);
>         }
>
>         xhci->allow_single_roothub =3D 1;
> }
>
> The thing is that xhci_run() needs allow_single_roothub to already
> be set when it executes, but we can't do it before xhci is allocated.
> And some non-PCI drivers don't want it to be set.
>
> Can you check if this patch fixes things for you?
>
> It is obviously not a real solution, but it's good enough for xhci_pci
> and sufficient to check if no other problems remain in your case.
>
> ---
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 485ea7fc0433..354443316bfb 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1735,8 +1735,7 @@ static inline bool xhci_hcd_is_usb3(struct usb_hcd =
*hcd)
>
>  static inline bool xhci_has_one_roothub(struct xhci_hcd *xhci)
>  {
> -       return xhci->allow_single_roothub &&
> -              (!xhci->usb2_rhub.num_ports || !xhci->usb3_rhub.num_ports)=
;
> +       return (!xhci->usb2_rhub.num_ports || !xhci->usb3_rhub.num_ports)=
;
>  }
>
>  #define xhci_dbg(xhci, fmt, args...) \
>
