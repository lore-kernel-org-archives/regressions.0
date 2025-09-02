Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40BE2F60A7
	for <regressions@lists.linux.dev>; Tue,  2 Sep 2025 10:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756810559; cv=none; b=VgopyXxHzSB3ln3Fvr7agd8kngMLNYgxYxyKkX/QkleP8tA8q7MSHywRGx75wOYF0Z9YG84C8UBeb/LWtXU2XOPD2PyDm71M05ugItY/5DxKcW1OluA2TIMY+ZWKStlHiDjgWAXg+Qmrj3EBsffQlxg3IAaVH5MoKwJnfngZmMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756810559; c=relaxed/simple;
	bh=/yv6wfMBCGauFEEG8NIOdTF35ZEmcQyAzbZ0UEyxGqM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k1Hld37Snl1g6sdHGQsv7rR2DgJNRVFAWp5fTIR7BbyFs8+ahTJRUNSg+Fz3Ajyf98BHP21TkqCYRRy3gkpYsmXLc7wtkNM39SWeby+X29S6JaNB74RKecCrEQYN+JU9RxEJubL/diJC91kiuKeex8ip6c/c3FQ+HA9EG8jlktU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jt8cXDKl; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jt8cXDKl"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f7ad815ceso2198271e87.3
        for <regressions@lists.linux.dev>; Tue, 02 Sep 2025 03:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756810556; x=1757415356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4z3tt/EVCscRadpcGAdkkLAF52cp5gwcdFwhvouaew=;
        b=jt8cXDKlzBZ8TbANoJF2dRR1cW7XkrTMNCqlXzxo6Kpd7y9TXS1XLhVLJ849zaeTbt
         aV5dSizJX0JNDF4K4kID2vNTLoUzMgDAxVtbT6YYTjaQoRhXJMR80sFMcFfg/nIQ2lDp
         FAIG1w4PVZaaOnmoB7gFCqE0eSOQY6Nr9C/kVCaWRRGIbR3SIN9IYfTbjW/xzrkVVYG2
         //nnwK1DLH/Ap0iixHt8KF7Vh+b+XahMpKo4HhuZjQEXISi/5aXHfJMCSA94eN7el8mI
         cLx1MxpbwZjAus0OtSW2Ccy6GfGKg1kB3FEsPDIl2g/9LbrMubtVSoTa9cNU9IBd3d4b
         eRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756810556; x=1757415356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4z3tt/EVCscRadpcGAdkkLAF52cp5gwcdFwhvouaew=;
        b=mjDfe2GF3Q6Mq6LVyOFlmTf9W8lHHeuK/gyMJwPaE9oe1Ybs5pl2iDvITherPfv9zC
         /8D9Yy3CHQhtCVivYmjwIfWDfLGWWvEOeY5y6bqCPgdIpCtCsTn6Pc7Y+URK6pc/5xee
         Idp5ZbmGz6JCJaxt00uyKOOn3ez9u4V+ODKOEW5e2J6/Kz64dO2GePxxD8hPbbdaldWE
         3x2PJ4aY3J+PaBshknDRKTlXZTiaNne3xdpHOLVWBnVePQ7GgtmyxuLHrLV1SsN+RKGh
         fw9/jqpPMZoawKDecoz3QLTmLo6lreZRq57nn8d3D3xDt77XaCnuLFa8l16Cj4RFnSiE
         Z9nw==
X-Forwarded-Encrypted: i=1; AJvYcCWRVtSY5cmSGK7xWGVrWcyDPtAeRoIkyRknRt7bN1n2ezM4V5PrVSINKulPRt4RIleoqDIl2EIXQMEhOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDalD4Gwnp21Fl/wOW6FTSug55R4YSxU6yFnHjHa9VobGFcyqk
	77PCTM51UmjayWX381voyqpRN2EAiDOLO+CaoR7+ydj29pDqAdcJ20L0
X-Gm-Gg: ASbGncv/EKKcv8MiLD2CZKRAmjP1eBD0ijITmgM72tWsAfZMdltchSRBCWdG3n5pJOY
	vDUWcPhWB/+r/x0aJuacN/NsOEcHOv3mGy1H/NK3zV/bxSYb5V9Sw7RFuvpCk5bSASI1jNeoUj2
	PhK5rzNvqeACk9vdocldQQhfUB3V/LYTgFLkhgrcMlfvkrMg0uCxlVnyQ4mEovTPsdE6ijEqYOa
	CEF6y9MsEOpTIrER0jE1atWyrZJUwBcAh7Gkwmy2y139Cshxj1Z91Utg4xUejz4kAwq8lyaGFnz
	dcWBxuDWftaWQdQ/9OoP2SOg2G/9ZDw7WCodJPyfNv7Rk1XGP/nrG5BmWaHZMF4o0krfEarmeSL
	aKYmSrS+sXU6u8NucKtNIVL4TOf0GDJUD7SHh/zlEzIqGPg==
X-Google-Smtp-Source: AGHT+IGFRu3XuFoSm3+DreztlNP5a2guSHIu9vPQibD3J7e0m7KGfv6NGgjaA6PXiAIVw8hDKcXQzw==
X-Received: by 2002:a2e:b889:0:b0:336:8228:29f7 with SMTP id 38308e7fff4ca-336caad86acmr35778241fa.27.1756810555583;
        Tue, 02 Sep 2025 03:55:55 -0700 (PDT)
Received: from foxbook (bey208.neoplus.adsl.tpnet.pl. [83.28.36.208])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-560826d1188sm603738e87.31.2025.09.02.03.55.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 02 Sep 2025 03:55:54 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:55:49 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: David Wang <00107082@163.com>, WeitaoWang-oc@zhaoxin.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 surenb@google.com, kent.overstreet@linux.dev
Subject: Re: [PATCH] usb: xhci: Fix xhci_free_virt_devices_depth_first()
Message-ID: <20250902125549.03f22bcf.michal.pecio@gmail.com>
In-Reply-To: <6042295b-8dad-4816-8505-b9b6c6f6049d@linux.intel.com>
References: <20250829181354.4450-1-00107082@163.com>
	<20250830114828.3dd8ed56.michal.pecio@gmail.com>
	<5051e27a.2ba3.198fa7b5f31.Coremail.00107082@163.com>
	<f9476552-a6dc-4f1c-91da-b15c8f0d9844@linux.intel.com>
	<20250902093017.13d6c666.michal.pecio@gmail.com>
	<446082a4.7dbe.199098cd654.Coremail.00107082@163.com>
	<20250902104630.6a9f088a.michal.pecio@gmail.com>
	<20250902110730.723a48a0.michal.pecio@gmail.com>
	<6042295b-8dad-4816-8505-b9b6c6f6049d@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Sep 2025 13:13:12 +0300, Mathias Nyman wrote:
> On 2.9.2025 12.07, Micha=C5=82 Pecio wrote:
> > On Tue, 2 Sep 2025 10:46:30 +0200, Micha=C5=82 Pecio wrote: =20
> >> On Tue, 2 Sep 2025 16:30:48 +0800 (CST), David Wang wrote: =20
> >>> About the change from "<" to "<=3D", I did not observe any difference=
 on my system. Is it because my system does not use up all slots? =20
> >>
> >> This too, you would need to fiddle with devices (or connect enough
> >> of them) to reach Slot ID 255 (probably the highest on most systems),
> >> depending on the xHCI controller and its ID allocation policy. =20
> >=20
> > This made me wonder what those policies are. I'm too lazy for thorough
> > testing, but I plugged and unplugged the same device a few times.
> >=20
> > Most HCs kept assigning ID 1, so they likely always pick the lowest.
> >=20
> > My AMD chipset, two ASMedia USB 3.1 controllers and a Fresco FL1100
> > kept assigning sequentially increasing IDs, so I suppose I could pump
> > it up near the top, connect two high speed hubs and trigger this bug.
> >  =20
> >> But also as explained, this bug doesn't make things go boom just yet.
> >>
> >> Except if combined with your bug in an obscure edge case:
> >>
> >> 1. A high speed hub has slot ID HCS_MAX_SLOTS-1 and some TT children.
> >> 2. Another high speed hub has slot ID HCS_MAX_SLOTS.
> >> 3. We start with freeing the second hub.
> >> 4. The loop is entered and leaves vdev pointing at the first hub.
> >> 5. The first hub is freed instead of the second one.
> >> 6. Then its children are freed and UAF its tt_info. =20
>=20
> I'm not sure I follow the above.
>=20
> I agree that changing the "<" to "<=3D" makes sense, but fortunately for =
us there shouldn't be any
> issue with current implementation as xhci_free_virt_devices_depth_first()=
 is called with highest possible
> slot_id value first:
>=20
> in xhci-memm.c:
>   for (i =3D HCS_MAX_SLOTS(xhci->hcs_params1); i > 0; i--)
>                  xhci_free_virt_devices_depth_first(xhci, i);
>=20
> if HCS_MAX_SLOTS slot_id is a hs-hub then all its children have slot_id <=
 HCS_MAX_SLOTS,
> and loop works fine.

The loop works fine, but it exists with vdev pointing at MAX_SLOTS-1
due to off by one and then this happens:

	xhci_free_virt_device(xhci, vdev, slot_id);

which means:

	xhci_free_virt_device(xhci, xhci->devs[MAX_SLOTS-1], MAX_SLOTS);

If MAX_SLOTS-1 is a high speed hub, it will be freed right now, without
freeing its children first.

And whatever this device is, it will be freed without nulling
xhci->devs[MAX_SLOTS-1], which might cause other UAF later (not sure).

I think it's possible, though I haven't tried actually triggering it.
The problem didn't exist before this recent patch.
