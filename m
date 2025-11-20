Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEBD36B07D
	for <regressions@lists.linux.dev>; Thu, 20 Nov 2025 17:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658818; cv=none; b=fRqNOOftKbnB7Ew+5SIyqTZRGPbnPzEVHYSvOc2LSOMQ45FriW86kH7j5e7vtBpFdgaU0RUBVwOfnJlojj3IprXaPxB+FIQYir7iQKez75JT0W1B8fIqFX9KYthTmZ7ThPeFdL4blZulh2mPmjinpykDf8Vx8I8S6Sun/Me5v2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658818; c=relaxed/simple;
	bh=dA+X3frohUmiN42sQXCsXtWK/UJo0Tcfbir9/CzOXlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8u6V7nTbGfi68LLMVBHsD1u7yjWK71Cudp71gsrF/l6lwXXy2uLUmXLw86ngFgUMYRqWVeK0zIkKc3DtnepuXI3SK6WHf61zm2MO9s0owwADmCWQdwm8xRxrNcrCB20D2fX0C2Koa8AaAtwus54zG58LYXCwE7ptLhE12cCPss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WIlPABj7; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WIlPABj7"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b7291af7190so172272566b.3
        for <regressions@lists.linux.dev>; Thu, 20 Nov 2025 09:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763658801; x=1764263601; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71+jWtBg7d1iYRAZRUfunCs8pFBPFzAnVW06bSqsOgk=;
        b=WIlPABj76g2/ym+yihcMBeET+MwAZqR+HZYWnN0IFpSct4AmyECUbyJtvGDx82/3pn
         sX1YPPsCPIfK0pkGKxevnKkbegk0Eet6NTs9vB4qUdx3lNMhUEx6sZ4nBI1m6eKJ0ac8
         aruAvMDei9/rnDl0zDvY38/lkh+Lzb2Wto68A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763658801; x=1764263601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=71+jWtBg7d1iYRAZRUfunCs8pFBPFzAnVW06bSqsOgk=;
        b=QUEklMYbahZx3kKX6TAC9DxRcIl37VUN4wZUAV/3s6OYuf5gkesIAuq9D18A63dzrF
         g2OSZitnLF/ZEIYLUy5VopU6Sv2PE7VBGwnz0DHxAGAMJqgwCEJGGyJ1WPopqqxbyqOq
         cGZAXCdGTmJxGfJ4Chtz5FnI4/bH7Ou35U0ex80op5C8F6KvAzDDc5Ln7YjtW4p9UgSq
         jYd0ECcoeaD/Vk67vQAjTCAQgsC2pGqTXMJo0zdk5miU6af+BJyPmuf40D7dPiDjHPHS
         gZyz7hLWr6zHYhBoQg0FFTUkn0J8u4Zo2ilaFPXpoGKyq5H174XvUE9Ia8esKpxRBOii
         cT+w==
X-Forwarded-Encrypted: i=1; AJvYcCVlzWM5hXLB6p2a6K9oNaUt3nh9D/a1IgB5dbhmBKizNRwAPiWEb50SyVwMHM8YV+9FjaAgRiKvhwNl2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfRzGKl9f3h3XnPsUQLXrvXHqCjYnw5rnSYlZXuJH+dmkE137o
	zN0MXBlgwpZl8zHqEPUSlO0W7bSfob+yacXDmlQsVPLCvide7zGwYPWlsWuXY1BASBLOjVtxLLs
	FakvpnNEL
X-Gm-Gg: ASbGncvrYSXsBqPGCRLydYmT+JDhVtwylKbHLb9JB5bTu6OmD4achvkWAuMIRHISGAB
	PUqTOq9/T5tNYMbnKFOl4XrcOFw5nIWPprOiWD15Dd0QTlK8UyI8UfqQFnTPQ0JFAe+CSD//Ca/
	jK6OR1Lby50wJt7ZsxQ/i1BnfuvJ/rR11c7/4ZMqCDxlfUfL6AgDev1PMGy9nbjW5U6cMddyjam
	YH9ngC5b+Y66WJD3z2zYUHRvC5e52SDrmieO1UX/i8sVWns5zOLopZ/cVAfKKHVQ0/eCtcoeTXR
	QiiwJqCxaWgKudGX2+8/1zCYDUL6yjwgxiXfDpTygUsfVqNXLutXT21aPxIWuQmklhoqBe5hOxU
	+KIm20TteyPHASOBBFdKMqF6j8iPZFkNIkAg/EEoO7pcipcnE18JFSnxCac+g0GKipuKbJC38SW
	Ep+5dxLXZN8PWA/Ikh/5BflAjj7JSzOVNk0Wgt1nLxVoW56DnMNeWJm1aQNG0d
X-Google-Smtp-Source: AGHT+IHt+Z5ciQDwH6RUkihOGaaEkFwWwJQZQxprU5X3MvrN1TEomLGSpKp2qIj5sgWtjcv7Ql7rwQ==
X-Received: by 2002:a17:907:3d87:b0:b5c:753a:e022 with SMTP id a640c23a62f3a-b76588b14b8mr335111966b.29.1763658801331;
        Thu, 20 Nov 2025 09:13:21 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536443784sm2485479a12.28.2025.11.20.09.13.19
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 09:13:19 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b73161849e1so299559566b.2
        for <regressions@lists.linux.dev>; Thu, 20 Nov 2025 09:13:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+uWca07y2CMAsSQ+mxie37uDNb6zkLm/fGNi3FmoNKq/FsTEPGQWdsU73P1Gws0Bf/m2kR3fymPSQBA==@lists.linux.dev
X-Received: by 2002:a17:907:84a:b0:b72:5e29:5084 with SMTP id
 a640c23a62f3a-b765869343emr280912466b.4.1763658799257; Thu, 20 Nov 2025
 09:13:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251120081227.v3.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
 <be1cbae6-f868-4939-a1c1-fd66e2c6b23e@molgen.mpg.de>
In-Reply-To: <be1cbae6-f868-4939-a1c1-fd66e2c6b23e@molgen.mpg.de>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Nov 2025 09:13:07 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W1D7ksbS-q1c6cHQSxx3=Z5yfC8duiBGh8S01NhLPLUg@mail.gmail.com>
X-Gm-Features: AWmQ_bk3aT3ZuUmLknvARxMmblGOEsNctHWpwZyyDwMRW7H291WIp2zvCdFNcjo
Message-ID: <CAD=FV=W1D7ksbS-q1c6cHQSxx3=Z5yfC8duiBGh8S01NhLPLUg@mail.gmail.com>
Subject: Re: [PATCH v3] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf()
 NULL deref
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev, 
	incogcyberpunk@proton.me, johan.hedberg@gmail.com, sean.wang@mediatek.com, 
	stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 20, 2025 at 9:04=E2=80=AFAM Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>
> > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> > index fcc62e2fb641..683ac02e964b 100644
> > --- a/drivers/bluetooth/btusb.c
> > +++ b/drivers/bluetooth/btusb.c
> > @@ -2751,6 +2751,11 @@ static void btusb_mtk_claim_iso_intf(struct btus=
b_data *data)
> >       if (!btmtk_data)
> >               return;
> >
> > +     if (!btmtk_data->isopkt_intf) {
> > +             bt_dev_err(data->hdev, "Can't claim NULL iso interface");
>
> As an error is printed now,

An error was also printed before commit e9087e828827 ("Bluetooth:
btusb: mediatek: Add locks for usb_driver_claim_interface()") too, it
was just a different error message. Previously the NULL would have
been noticed by usb_driver_claim_interface(), which would have
returned -ENODEV. That error would have been noticed and the message
printed would have been:

Failed to claim iso interface: -19

So that error is merely changed into:

Can't claim NULL iso interface

> what should be done about? Do drivers need
> fixing? Is it broken hardware?

Personally, I have no idea. I was mostly trying to get the regression
fixed and, after looking at the code, I was convinced that this would
get us back to working at least as well as we did before commit
e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for
usb_driver_claim_interface()"), plus we'd still have the device_lock()
in place to avoid the problems I noticed earlier. It sounds as if,
even with the error printed, things were working well enough for
IncogCyberpunk.

If someone wants to analyze how / why `btmtk_data->isopkt_intf` would
be NULL in this case and if we should do something better to handle
it, I'd certainly support it!


> > +             return;
> > +     }
> > +
> >       /*
> >        * The function usb_driver_claim_interface() is documented to nee=
d
> >        * locks held if it's not called from a probe routine. The code h=
ere
>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>

Thanks!

-Doug
