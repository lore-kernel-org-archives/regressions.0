Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81772331A7B
	for <regressions@lists.linux.dev>; Wed,  5 Aug 2026 04:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785905305; cv=none; b=dL85EUf+TsQg0mqu/CPt94Vt/E7csvo4n9xErZAF1mkUwGWe/8pODWSXnM0qooXua3e3l0rSDikYURqcIM7mqJ5zx6B/G4ZbV3kssgZqK7CourAEicbt8ExPG2UwzXHGjbGia/hGtv0is4hVQ25E9xLI2iLT0cygXcz7t51vTa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785905305; c=relaxed/simple;
	bh=6Dja9uktIHlytGxQ4Mfy9LyhfBwiNIxQgC7eDqSetaI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iB/3MW9Af0UzyQ/TeQTX00n/VyeFcPp3qeNYvixNcyAM7O3rZ/peJa7CYQz+lETjXJCU4uK17f5YGyOs6VF5hL78+JNyFO6uiWfosKMhD/pB8oKU46EFk9aVyEYAlZNIEdt2JiVxB1SpxX20uiCL0KH0ES1R83yPJ4cLgXQHiXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVGGb43/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVGGb43/"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fecbb7000so218344f8f.2
        for <regressions@lists.linux.dev>; Tue, 04 Aug 2026 21:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785905303; x=1786510103; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Dja9uktIHlytGxQ4Mfy9LyhfBwiNIxQgC7eDqSetaI=;
        b=cVGGb43/KT2mg8ubbYGBwZdGnW/qhIKdUwhPweJJgaqiqHIj5wsTOn3PFLLFbnBwEo
         NBtIHYf+wh2pv9Tzs4hhWKQJE6XuKcAGG1C2UHYatLOUKT/21Vb2sZESHVbr2IJ2OG5P
         2zYTtdzrTuP/uoIQMKcWmaH+Lkp173BeCp/E4r7bcGqvlcnlVDvhtIkgPgM1Eqv5DQNQ
         TE/kwwGPpl4FbU7RPhxKFWtPjjI/py7l1sjJmsdDuhsCU5yim9TKLUd+qNqROV6dhMSD
         uXk/GAhAbg7OPYHM+wMl6hmp+MsRpd11PugPv1wiRc4lYmc4A1ScRu20nw7rV+Q8hkfn
         fShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785905303; x=1786510103;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Dja9uktIHlytGxQ4Mfy9LyhfBwiNIxQgC7eDqSetaI=;
        b=dUXt+Df5J4CJVy09MrIqCWXQeosNpdzW+XrbcVb9OaWab1L7YTo9elV7+f/9CoCX6u
         kw5xDlGqaTjllf+8hCUbPdnc1McsX9+jwNTjpcSKX1RkR2jHf41oWiYeodgqb7Y2gUoO
         VrKf2RJ5dQQiF5t3FkF2e6UFgSQKZFIvkuV620Jh/mlwJugoWCzZJoLnxwHzSdj/XIvM
         +hI0QE59ab8szQAnS1u+s8E3xDv+5ZCdH3QPo8Ok6IYf3ZDGCxoyn7NOTtN1kRVOKw0Q
         ZVnZrEpcPpdX8hsGDmzpWNKt54KGUAFlr4EHOaFpSN223MWpS35Y7ZrrwtPGkfsNOAsB
         Catw==
X-Forwarded-Encrypted: i=1; AHgh+Rpt4bG4pS68ZqP1gVln4tvzE7C6R1aDDIhypqQ1yUHmNx/SI3GWuJb1vli0f29KCcFI8bZl5vbfyzqRTg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz12unUJd8fpQ66RvgeAT2Hk90tHy9Ih04GtcRDll4B8yh7/D7o
	W83Jgs153DiP0hgUFrWIybT++pB+jalM0zOTQvdwO2JpJE3Al1LEmuoB
X-Gm-Gg: AR+sD12k/L2Z45rYSyRmtUWR7QaPAf/OcjhoZspBKi6oo59yTlgwkvi/B0MZoYQxTgo
	ytspwpKSbqiAuGHM6Y44uOc1MPwV847npk6oupuyYfjBeR/E223T/P41QRBZUDaACPjY2+mKQdj
	0ydImj44k9Esr0kKSI8Ck+Nn0dJ7Y74Wz4p0ca7YmwZ/9nYsOElJvQk0MdFn3nJp/9WWUIz3slK
	ycyFsb96rK/gRBlj83PvJpE6qCrxfym/TfulNk3u4Zw1hXFfW7U731+G8ML1wNJjSy+SpFh1Zul
	z494ikHy3sGJ4/QDAljeprxkpFeQrw1UDvyhIhNj79MfHttWIBWkMCf2wC1f8PRmpP8ug569zY/
	q+3LRltiw+/tzTCMzyV1jP3y3ZzUaQakfHaB6x/GUrEMfrB0zsMLxxfT89xjOn/s3qmFrZ8R+4O
	cgTESC9D2pHpPSV0HqOiIMU00tDwEgKDilB7MrOygdowOPDlxFEW6L70w11CH39+d34ieg++gK
X-Received: by 2002:a05:600c:5251:b0:499:4dd6:3cc6 with SMTP id 5b1f17b1804b1-4994e73207amr32358695e9.5.1785905302689;
        Tue, 04 Aug 2026 21:48:22 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994f124135sm10989415e9.2.2026.08.04.21.48.21
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 04 Aug 2026 21:48:22 -0700 (PDT)
Date: Wed, 5 Aug 2026 06:48:18 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jamie Stephens <jamie.stephens@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, regressions@lists.linux.dev,
 gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
 linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [REGRESSION] CyberPower LE1000DG (0764:0501) USB HID regression
 on x86
Message-ID: <20260805064818.542210d6.michal.pecio@gmail.com>
In-Reply-To: <CABWMpWR7Law_vHdeAMsOcY28VBcvX2jYSqq2SpksJSiLFcXhuw@mail.gmail.com>
References: <CABWMpWQiSEKMkROgKZJ6nV8GXYgr7E=-SmsatQie4eK8b3F9Xw@mail.gmail.com>
	<CABWMpWR7Law_vHdeAMsOcY28VBcvX2jYSqq2SpksJSiLFcXhuw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 30 Jul 2026 15:28:02 -0400, Jamie Stephens wrote:
> Hi,
>=20
> Per the recommendation on Proxmox Bugzilla #7850, I=E2=80=99m reporting w=
hat
> appears to be a Linux USB/HID regression affecting a CyberPower
> LE1000DG UPS.
>
> Proxmox Bugzilla #7850: https://bugzilla.proxmox.com/show_bug.cgi?id=3D78=
50

So apparently you are running some Ubuntu-based distribution and
"The UPS works correctly with kernel 7.0.2-6-pve, but fails with kernels
7.0.14-5-pve and 7.0.14-6-pve". Also with "Ubuntu mainline 7.1.5".

If your distribution supplies such kernel packages, I would suggest
starting with narrowing it down to a single exact release, e.g.
"7.0.8-3-pve is the first broken one".

This will make bisecting faster, or maybe there will be few enough USB
and HID changes in this release that something will become obvious.

Regards,
Michal
