Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD8B2E9EB9
	for <regressions@lists.linux.dev>; Tue,  2 Sep 2025 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756804059; cv=none; b=Eqb7n7EMC5MgUxkDfArHwbgND05sjZFzivOigzWB6tcWVTrOUdrVP3JIwsueqg1lgEkfdVHCqBHeF098L+Gw7Pm1R4YBiv+H31g3nRqf4LdgJaioVwJjQeN8i4VBZykK8elkDmypx0akEJyqNIxKN2dblKrqVHPToBDS7kaN4MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756804059; c=relaxed/simple;
	bh=e00OUdT1mnCF6eVI0EFyPvJzgm4igqdrftik66PJbew=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fivyX/CZzzGgIORJ4RVPzEXdRxXl9w58lOu0XMJK/CEkTWGnqePlu+gjPMtIKGLqXCDPa4QwXWjwUD3WeTFc9JMitfXNPk6Z1tDyPBdjuQmc1MTyIqePVz3qBFO3r7um01AbcPWmlXNhF04lRx7oEFo9gWHbTs1RG6DibrislEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dk4rdEVM; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dk4rdEVM"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-336cdca667aso21206651fa.0
        for <regressions@lists.linux.dev>; Tue, 02 Sep 2025 02:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756804055; x=1757408855; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e00OUdT1mnCF6eVI0EFyPvJzgm4igqdrftik66PJbew=;
        b=dk4rdEVMMF0tnsOX9dkoanFquf4EmffDPgV/GBMbeWyxKvxvmT7bBoym7QemYtu+7d
         aZcsI5EMxBBUrqGPlvrZGsJSw1dEJqm/B1ievc/jRnCJ4t3AiIwUCH2+Fp4j7iV5oeh/
         9SOtJAGW03HPiUqDYqqQc1pRD/wsgMvc6erUeCzOEzZcs9E971sFQUSQ/wOJNTcF4PSH
         E7N9HssptHsNQ8NI8l2NwEemDDJrDa8wXR5wZhwhIFLjw/DNe8h3tZdnMdiLTKxj3P8g
         BHAvlnHaH3cE0rkwAedlbuUTXdiNGExG/dKJiL4j4eqqOPt7e2st+pHtRbRflp+9m0j1
         ftIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756804055; x=1757408855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e00OUdT1mnCF6eVI0EFyPvJzgm4igqdrftik66PJbew=;
        b=OOLHJhovqnKIK3+ksFxZUYxGXG3HftBt0taAiChplr+n9XJCAuDLEl3aXj9dmRHRgV
         cQPk2GYklm/8FjtHss+HTZwCrrNhvmsrnAoyjmzFuWunyoDIiu3QBSTDo+z0upxOdRiU
         y9BKJGGbXtZXwrcY+mVhAqAhV+7YeU1+BwFp/xryHm3TM3kv94E/JkHtUOwGtNMj5tNA
         4gnQ8SrN5tF0SpxKQFzNDEgNLk6WwydYj3zcC1uJ22guqFB6Vn7XzfHmS30MMbklR2Ov
         /nIZbSxOrw72slk+FhykK+KN6SrTS8w2FCt7kDueiS/43fP/HDyNWfcM9nR8Pc1tLF0f
         06rg==
X-Forwarded-Encrypted: i=1; AJvYcCVOxj3nBww3/qnXFrNGzIahM/oyoeipsP7mAtOh0Dzh1/xXMoMkczxcKvvvazXvPN/blLdSa5ifrH/Q9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/JHWHPJ3tXs61pPcvETWE06dazJKBhJPu320XvLGz5M3DLjJ9
	7vwOFLiIUfQ1t4WS8eng4kDqfb+BH43e4ZjGTnT7xYeq7CVlYOrGh5/W
X-Gm-Gg: ASbGnctv5b67XSUbwPGRlrz1jcj/2S67/e8MpAO+wZt2yock3ZTKLSqyaQKOFShKbGo
	YS1QMs7lziOoevkcKWb+iKOqDYzTg4ttV0TvOCEFv9I2IpLFRHqMcwhmxoHMP9HQafbbx4OeH5O
	ZRRDonVGA0S9sjoNtBAYO1GgmocSG1l5GfC34rreCYgIkju8bEmx5KQ3oGD1/Wbjs6GfPiTeHPX
	WyvuarKiS38RcCN83vuTNMd7/fJijsumVeBg6vgADeGhmC2N4ZZMRIqZkMFAiOFbWui3AWprtau
	Qs5QM2SsOknhG33T05Z60ReGYy8dLbzHd0MqGDe4Nk5rC9cEIaRzPoDf1v4I9AbU70U81OQZ1wm
	5+okogA9Z/YPoAT24KXs7elSn1O8LXxBa1Jg=
X-Google-Smtp-Source: AGHT+IHD58ilwmPkhIhYFUWS4Wih4aWkYtPscZqFvQLCpLtyUtPO/FiEvUW/jiZcpPFZj0WebPje1g==
X-Received: by 2002:a05:651c:50e:b0:336:8267:c1fa with SMTP id 38308e7fff4ca-336ca9b696emr26732971fa.19.1756804055195;
        Tue, 02 Sep 2025 02:07:35 -0700 (PDT)
Received: from foxbook (bey208.neoplus.adsl.tpnet.pl. [83.28.36.208])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-560827a020dsm530210e87.118.2025.09.02.02.07.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 02 Sep 2025 02:07:34 -0700 (PDT)
Date: Tue, 2 Sep 2025 11:07:30 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: "David Wang" <00107082@163.com>
Cc: "Mathias Nyman" <mathias.nyman@linux.intel.com>,
 WeitaoWang-oc@zhaoxin.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, surenb@google.com, kent.overstreet@linux.dev
Subject: Re: [PATCH] usb: xhci: Fix xhci_free_virt_devices_depth_first()
Message-ID: <20250902110730.723a48a0.michal.pecio@gmail.com>
In-Reply-To: <20250902104630.6a9f088a.michal.pecio@gmail.com>
References: <20250829181354.4450-1-00107082@163.com>
	<20250830114828.3dd8ed56.michal.pecio@gmail.com>
	<5051e27a.2ba3.198fa7b5f31.Coremail.00107082@163.com>
	<f9476552-a6dc-4f1c-91da-b15c8f0d9844@linux.intel.com>
	<20250902093017.13d6c666.michal.pecio@gmail.com>
	<446082a4.7dbe.199098cd654.Coremail.00107082@163.com>
	<20250902104630.6a9f088a.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Sep 2025 10:46:30 +0200, Micha=C5=82 Pecio wrote:
> On Tue, 2 Sep 2025 16:30:48 +0800 (CST), David Wang wrote:
> > About the change from "<" to "<=3D", I did not observe any difference o=
n my system. Is it because my system does not use up all slots? =20
>=20
> This too, you would need to fiddle with devices (or connect enough
> of them) to reach Slot ID 255 (probably the highest on most systems),
> depending on the xHCI controller and its ID allocation policy.

This made me wonder what those policies are. I'm too lazy for thorough
testing, but I plugged and unplugged the same device a few times.

Most HCs kept assigning ID 1, so they likely always pick the lowest.

My AMD chipset, two ASMedia USB 3.1 controllers and a Fresco FL1100
kept assigning sequentially increasing IDs, so I suppose I could pump
it up near the top, connect two high speed hubs and trigger this bug.

> But also as explained, this bug doesn't make things go boom just yet.
>=20
> Except if combined with your bug in an obscure edge case:
>=20
> 1. A high speed hub has slot ID HCS_MAX_SLOTS-1 and some TT children.
> 2. Another high speed hub has slot ID HCS_MAX_SLOTS.
> 3. We start with freeing the second hub.
> 4. The loop is entered and leaves vdev pointing at the first hub.
> 5. The first hub is freed instead of the second one.
> 6. Then its children are freed and UAF its tt_info.
