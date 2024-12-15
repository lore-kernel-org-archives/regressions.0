Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB54E186A
	for <regressions@lists.linux.dev>; Sun, 15 Dec 2024 11:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734262756; cv=none; b=kKTdUwIlQ3HLYdGvWpiPIUjiDOj3F9VB9O/CXtDl8JLb3aaG3W0Afzthr8sV4K5CtpwAlZ7fxrh9JTd42ttKAoZGUp977UGngSHc/zQRfBd7ussOUrxA4Wr5AjLLmHFT3G5LQSdcbrEfB31PI7E73wyudGWLsZdhtguLYTRKWsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734262756; c=relaxed/simple;
	bh=xALTCpd8jzW0oO9ZcLpdgxp5GqeJYahzrwm/Vk98pNY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hfsZ5bh+QVFmQWcOL62fan1+ihfKpdL8Ya75jwNICDyqyhN/bCJndYWg4NES57cdtYoTY89fl/R0LGh3Ax06FFOhkyygzBh2tNXmedf+NwP4nVVhrzvNuhurWD0iLsSkFuxPUyOeRViMSZ/Fyq+i6mzgXm72U6LATpgufHjV7vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhA+RzDt; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhA+RzDt"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso2818289f8f.0
        for <regressions@lists.linux.dev>; Sun, 15 Dec 2024 03:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734262752; x=1734867552; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xALTCpd8jzW0oO9ZcLpdgxp5GqeJYahzrwm/Vk98pNY=;
        b=NhA+RzDtbC5bl5wFwsGL9mWcQJZhUSoizh43JCOa6u3dRhgpzZYenZ0BkEGcb78j5E
         MPcwfN8pLAGF6a/WbuHX9553EOekpWlgpb4hgzgI2zRGrT2w2CYUDeEehAlr6WcbVQdp
         TkO79DSmV/wiZP805xErswa3DFMt6pJIrCXT02N3tOwjvr9hHnmrBe/SLZ7v0g48f9lC
         TtzCBo80K2LxPOH0GwYNZDHk4YsSPt/zI+Ee0bd6YD11qBJvEOG8oQqwi8Hy8DYet33Q
         aCJw+t7wp0a9Nda1SRYv5p/wPvStvptlAt8VxCodAz1ft9XbG2HEnhbwcnr6AgC44nV+
         Zs7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734262752; x=1734867552;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xALTCpd8jzW0oO9ZcLpdgxp5GqeJYahzrwm/Vk98pNY=;
        b=v3aBB+RVTubzhYZE8DFC4L0C4elFVhsyT2DH6iV2DRznf8Br+wYsw9bSver7AA7JwD
         +o5jBdY/Ln7OV+HrM5Fz8Jn0fWGKT8BtTKR3+dxShdAsp+y1yvYNp5DHoTADumyt6FoU
         pVJD3V3M5mczGpG9BT30Z8lblVErixnHwA1R7wuuD0t8v3XhkIlixxta/kmtL/F/kQUY
         8UZda9/hVSS4McPd3MCmxSku4qMbtceTO1IByf21b0BSUqTtdjefm+WiKO2rtelNuA5u
         1TQx+f/btPpwJm9GLsIsS4VVVFVxtUMxX9ReJ6fbhbQoCMQP4zNMt0yH2UFy/eeoW/0z
         5lrA==
X-Forwarded-Encrypted: i=1; AJvYcCUL+j2MUcaByiMeOvN9hJigE0/Jiha0d7B7p0+dUcJsS7ja/b5WzQnewk0z7iTZaXgKhgBQ1CJQJb/+yw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSs61vul8D2x65X9cGSbv7FB9/lgf7LKpVmaDYiYYjZdpAugPF
	FOoM3ootoaaukHwb32hfgzgGs+u1R0wzXuv9SliPFTiph0KCsk+o
X-Gm-Gg: ASbGncvUFj/oF/WnPQk3JkuxAtmZ4Cr8s5ZNzghq9Ci6oLmcoKyDdjXEQ8IfmfvcJlR
	71ETwGbN6wfXGYYtUx8y+3oMXePAVMFy1UHdAsamcddC3SeTiOO6f97yJrHiu16w4RxSxr0rkM3
	oL/+W4PywiIeIwrrDXUCs7r1JwbrlMmU+piIQZh8vXZgFPkCovL/8/mo/ikv5l5fFCSfY5dssg3
	pALdNq/hdGr3BhNVDK32FYoJw6yawp259fUANwO0KKNRqt8+kNigSpHZ3AjAK9o6L9MXPnzPnOh
	bgmIecXNtICsHqEfvHAIFHX6JY0=
X-Google-Smtp-Source: AGHT+IHCjjb2sJAgzXNsxbFtbUESnU4r2HWdLhNkKVc3bDDAlQfI1jI2mfRiPp/kKqOHOaY9q3fGmA==
X-Received: by 2002:a5d:47ac:0:b0:385:ef2f:9278 with SMTP id ffacd0b85a97d-38880ac5f92mr7767140f8f.2.1734262752015;
        Sun, 15 Dec 2024 03:39:12 -0800 (PST)
Received: from ?IPv6:2a02:168:6806:0:c726:52ac:a540:51aa? ([2a02:168:6806:0:c726:52ac:a540:51aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8012081sm5027268f8f.19.2024.12.15.03.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 03:39:11 -0800 (PST)
Message-ID: <ec61714eaa3d84498cd69dc673fb11996550a3ea.camel@gmail.com>
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
Date: Sun, 15 Dec 2024 12:39:10 +0100
In-Reply-To: <ofd5ru77wypfysflpblafbbdgrcmzztqwoewfjfuusrnbma4aw@y3oc3etutisi>
References: <20241104141924.18816-1-kabel@kernel.org>
	 <20241104141924.18816-13-kabel@kernel.org>
	 <87bjyv9ecb.fsf@BLaptop.bootlin.com>
	 <778f08f1774fcad5fcc39114dbb721793ebf95d6.camel@gmail.com>
	 <2iocrd4a7l4avfhqmobbexo7k4u2poidkvvj7lpqh7vp7mprkm@pfgytqnmt2si>
	 <ofd5ru77wypfysflpblafbbdgrcmzztqwoewfjfuusrnbma4aw@y3oc3etutisi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1-1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2024-12-05 at 13:42 +0100, Marek Beh=C3=BAn wrote:
> On Thu, Dec 05, 2024 at 01:38:10PM +0100, Marek Beh=C3=BAn wrote:
> >=20
> > This is because the patch went into 6.13 but the rest of the patches
> > did not, Lee wants to take them for 6.14 :-(
> >=20
> > Apply this series and it will work.
> >=20
> > https://lore.kernel.org/linux-leds/20241111100355.6978-1-kabel@kernel.o=
rg/T/
>=20
> Alternatively you can overcome this issue if you enable the
> turris-omnia-mcu driver in 6.13:
>=20
> =C2=A0 CONFIG_CZNIC_PLATFORMS=3Dy
> =C2=A0 CONFIG_TURRIS_OMNIA_MCU=3Dy/m
> (and also the subsequent options).
>=20
> Marek

Testing reveals:
I have to enable CONFIG_TURRIS_OMNIA_MCU_GPIO as well, to make the LEDS wor=
k again with v6.13-rc2.

So far, so good.

But the upcoming dependency in 6.14 will be on CONFIG_TURRIS_OMNIA_MCU, not=
 on CONFIG_TURRIS_OMNIA_MCU_GPIO.
Is this correct?

Best regards, Klaus

