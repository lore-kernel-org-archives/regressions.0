Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A90220627E
	for <regressions@lists.linux.dev>; Mon, 16 Dec 2024 17:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734371169; cv=none; b=eP6Ef+3d5v/YttKdbtDhYkz2FTf+qzh5UGh0Yd/Csp8Vu5f2ggmIJu0PeZX7IZOMya4seRZXS6UAml1KSQ9xXz/5rxYSiLsNGqfGN6VTN6JedYKyktEVWqJsmMDHHa2SEcSmbivQEQZRe+YxlBMYc9T4j63DyVMSESlG3SdXV6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734371169; c=relaxed/simple;
	bh=LDxIv1E3Cfi6mUhdbKPkPLS8LWB9TYypt4l83RYATcY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q/G6Flm2J6MMgf738N+BWGbMjcPZa2Sxcy4QapHa1sR/NLCYj+api6ihr8xJ8jj3HW7d6FM/cSzPqV7Hb2sm54Too3u0usG4JGIvGW/9JD06W4n4tXu0bryutcgVt3cqafBpO6mU3P8+/EnGuIqTRXoqjJPt/LmOR8bYpWp77FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEZoO+Tp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEZoO+Tp"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso43299605e9.0
        for <regressions@lists.linux.dev>; Mon, 16 Dec 2024 09:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734371166; x=1734975966; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LDxIv1E3Cfi6mUhdbKPkPLS8LWB9TYypt4l83RYATcY=;
        b=XEZoO+TptzHQo0qYsUOIpUIBBnEDPHTfuw2ILwfeIeaD5KJgl4luQUKNPO8G8mVaDX
         1yWMTuk+9tS9tBMDRpoTHCaYgcGPYHGZGf0t9XJ4I4rPPUEuy7GvhQEvk0/qD00V5YUE
         vs7Uho7B/xT5iPr2dXRmsYPd4mf1z0AQoeOC9pkcYTa/4WpyCWOC0G00c+fo+c/3EVC/
         nKP9FuKB7MIry5fFB3RqqzvFMMGFboiIIVKg6B8ayvpwdxxlojg0yTCIQ/s9f+GTIT4C
         LM5Deu3QiAlfBlh7vnbaYvdhXyrpB0CGf4HKezvGO+lpzr8tSGpH7V2zm3ma4FJOcB6/
         2UkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371166; x=1734975966;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LDxIv1E3Cfi6mUhdbKPkPLS8LWB9TYypt4l83RYATcY=;
        b=ISiVABWYHBsMug+qKMYidlLX3rgYdGLb2thV7tR63P/N+nehDDdZN5xGGuit13sx1y
         aFmKyw5FYogadxSOOgvW/9SOlIw+p3UmGOHl/Mh2b1ZGGYkdQolbdOFwvTsSO4sYQifY
         WB+iI8X1Z2CTUqw4mmNzAaD0mmnX0RyUh4B4j0EI3qyameahWCSKXIJy/5Otx/14lB83
         AMERrjDtV/ow3PE7nLyuxs+xwpaQ1YWMF0alyZcx/Dnxunm0Uv53edcBJFVchKVI2j1z
         86qZ3rMYdLYebS16ctl0DFjgqWfq7+iiOHitb4Bg4j/k8P5PlQrOws0WI14y7OfbUCka
         MM1w==
X-Forwarded-Encrypted: i=1; AJvYcCXQKZDEtQHtnxuTxte9sZz86ScLMkUGN72NqU9JL3Ze8I7VEK7esDBhqLcFO4QyhAUHPnSZuogcPOyTLw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIVT/8gZ+DkzG27KTKyv3Ja9ohiIdHv9jAAEgr6yFV2DxXWSdT
	PU7qHdt7I0aGhQp2pZ80TNMZ3nnR1deoary4tDpXNltSCfnudvz1
X-Gm-Gg: ASbGncsem3dFrnLVdecRqtSQeEp28Zf98LNLAcEFzpfR33fgcm8yxuk/ssPAfLSCnS0
	65zSXYLugcgy3SDVb1eUIR4Nt4ajqxiKGJm1hiuXZlmBOb5hm2KjnAZcRaH9K+4Cag6P0SX+kpn
	CvU8OOjBVE5f6jNChF5o0uPIJ/9B7PC0KvtUPSbo58ECirI/90xa/+/VdqcYXp6u1k728AOpUEv
	r8h2ZYWWvUMdFmMGH3B7KSbgbCjyOcLG5Mzbz6qLiChILVvg4Jdq7Ca5mxcUo/Hd+IW67hL6BVW
	+5fy10QYdgQreHb0iqTahKh8efw=
X-Google-Smtp-Source: AGHT+IGBJ/riXVZwoF0GRkipPWTNb3OBIdWhOHkRurhkAMxRMKmBaoGRuVMikgREKTp4489NMTgdUA==
X-Received: by 2002:a5d:6d87:0:b0:385:e94d:b152 with SMTP id ffacd0b85a97d-3889ad37d1fmr11079777f8f.54.1734371165558;
        Mon, 16 Dec 2024 09:46:05 -0800 (PST)
Received: from ?IPv6:2a02:168:6806:0:fc42:464d:ef2d:52a3? ([2a02:168:6806:0:fc42:464d:ef2d:52a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80608e3sm8635591f8f.103.2024.12.16.09.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:46:04 -0800 (PST)
Message-ID: <2f870913fcbf89043b6cfe26d32f9ae6d45cddd2.camel@gmail.com>
Subject: Re: [PATCH leds v5 12/12] ARM: dts: turris-omnia: Add global LED
 brightness change interrupt
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Marek =?ISO-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Lee Jones
 <lee@kernel.org>, 	regressions@lists.linux.dev, Pavel Machek
 <pavel@ucw.cz>, 	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 soc@kernel.org, 	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de
 Goede	 <hdegoede@redhat.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, 	devicetree@vger.kernel.org
Date: Mon, 16 Dec 2024 18:46:04 +0100
In-Reply-To: <6gxg466bl7tbyfq5yoenpw5t3vcfcyywv3jydwwwiqik2pzqsv@3g4gk6m62mdk>
References: <20241104141924.18816-1-kabel@kernel.org>
	 <20241104141924.18816-13-kabel@kernel.org>
	 <87bjyv9ecb.fsf@BLaptop.bootlin.com>
	 <778f08f1774fcad5fcc39114dbb721793ebf95d6.camel@gmail.com>
	 <2iocrd4a7l4avfhqmobbexo7k4u2poidkvvj7lpqh7vp7mprkm@pfgytqnmt2si>
	 <ofd5ru77wypfysflpblafbbdgrcmzztqwoewfjfuusrnbma4aw@y3oc3etutisi>
	 <ec61714eaa3d84498cd69dc673fb11996550a3ea.camel@gmail.com>
	 <6gxg466bl7tbyfq5yoenpw5t3vcfcyywv3jydwwwiqik2pzqsv@3g4gk6m62mdk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2024-12-15 at 22:26 +0100, Marek Beh=C3=BAn wrote:
> On Sun, Dec 15, 2024 at 12:39:10PM +0100, Klaus Kudielka wrote:
> > Testing reveals:
> > I have to enable CONFIG_TURRIS_OMNIA_MCU_GPIO as well, to make the LEDS=
 work again with v6.13-rc2.
> >=20
> > So far, so good.
> >=20
> > But the upcoming dependency in 6.14 will be on CONFIG_TURRIS_OMNIA_MCU,=
 not on CONFIG_TURRIS_OMNIA_MCU_GPIO.
> > Is this correct?
>=20
> On both, see the first added line at
> =C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/commi=
t/?h=3Dfor-leds-next&id=3Dd82e09d62b3bdbfa9dac2daf3c3c071b6a79d2aa

Indeed, sorry for missing that. So, I'd say:

#regzbot fix: d82e09d62b3bdbfa9dac2daf3c3c071b6a79d2aa

and we leave 6.13 as it is.

Klaus
