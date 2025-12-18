Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC83D30F545
	for <regressions@lists.linux.dev>; Thu, 18 Dec 2025 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766049409; cv=none; b=DbcI2kulYwbP8bnx5j0qsggvuuh/JE1/ZbAy8bhkac6MyhFGRbYlWlSRSfg1vD93Rq2yjE/wHhS10AaAIb+h9oXU3CFM3SvwxLO1Vq+sdv7+sSkCrsQPRxOLHVISXrsr6ijwMJvMCYc4eE07v92JxwoSmje4WaMARLkTKjxbY9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766049409; c=relaxed/simple;
	bh=vYZbbFUvlVpSsiqPRvz46UCgB7m82P10unKkVl0giKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqOLnSvEGP4GqScpaMSNjP8IHKe8DJEOeWa0oVX4ORbwxJap9MKkqzdIZfFkP1S3fctmkFbYfRJVQHr1o/2eUmdkAFsyKXqF03ybavsYEW5p0M7+Lf1sBVPNxd9D4VizfFQnyFsWT6sLLygrPvb4WuyxslotCqnh2T/paieyoNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xfPOVqqI; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xfPOVqqI"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so205608f8f.3
        for <regressions@lists.linux.dev>; Thu, 18 Dec 2025 01:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766049405; x=1766654205; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vYZbbFUvlVpSsiqPRvz46UCgB7m82P10unKkVl0giKY=;
        b=xfPOVqqIzjiskX7b2XAj21Cxk3o8D7DQP5bQovy6TZAhuiG8BnFvEh4rbl4u1dzEb/
         T7zJUgpIRv/3khzzx08+SlnHpuYht8lmKKpjH1VQHnc4LOs3acp4xhGSnYpiC1XisKw2
         qjndbZ17oJTkXN893Uqe7asJVfcgv8N7ZDvEy3hdj8T/Y9L72b0udIBtqngKbVNmomuC
         Uze/358KGGAccQkpuzkmwee/snWutjLwZVrk+kJXfwvlhVPURm92VdNP5Nd+LU3HOewU
         Z9FzX2baYJS7uMril9mMqAzLNF5nSzlq+RSDFDgS+krxFYC213Xr7//jijjvYSJsPFLX
         1d6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766049405; x=1766654205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYZbbFUvlVpSsiqPRvz46UCgB7m82P10unKkVl0giKY=;
        b=tPZSRGJIEpNSyWNKhGhB18CPhklp4aWCG5QCiVjWFinoV2wgOvgM6Ii/T0i9RJ/kG9
         grgyNrGNVUJQaiWxxpJSVwosEOyyyVanO8ZVCwL2iF2dbmZJQHACfC2+QAb82Jkwbjsf
         16Dnic2i2FKHF4591qLCs+qXcQoRPqiQERIhYgl7qw6Ik5ZseJhp/4cfy+SD9L24ER0A
         mpvL7X/4xjnP+DHRxz4ws3lkkL+2v2EPH17wgOA9RzqKaJXaLXxqEfT4Xi1YKKQwHCwH
         DtjfKCx3aEoLsk/8UoAYj0hQcIWR3UYYdrTTJTLTH6TW0FLG9BDCwSCinovu5b/oJ/sT
         p25A==
X-Forwarded-Encrypted: i=1; AJvYcCUjVZbcKh38Fwfd53xUv8Hwm6MdRlL1lmRrxIBRevQh4fqyVafnvvbbDURjHAAldDQzKkO8OsenLSjOVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5t++mFzb81Ni0Ie+4BRL3NFQEso5Zvw3smgDFerEnVd4DnX0y
	mmWFUxkhlwtkj/0osNaeBSlNBkIa8x3fdY8mcixu8taN30NnHBHi6MHMOt61NhMHZIo=
X-Gm-Gg: AY/fxX6k4bfomS5HlUXhiqtgr9+UtGtERub88Okxs1SYnNgEA269ek15tmJ9xrfw5Gl
	ZhtI+FmsiVm8D6U8OE4qx1J/1HTZ6F5rwVe9qAJKZHlcfFALJvDxaz2ZRxtDPlsJE0W4kWtBUtB
	Vl3PxcMax8TAW213oj+Yh4uGbXt/eoyafXCsAnq56B6h2DJCqeu1knbwt6f08gAaTRwkan2TxUA
	+bbeHds83XZCdG40SY0Ob6rHLDA/U8G5cxLAHv+bVXwv1q5ZZVud2uOrrP4B3vgmO7eoDwT6wAc
	eQqAO71hIvsHOxkpdi8M1HMHLOtcqTj76s6QPMHAVqM4DXXI+gq2pB/T0ZZKCViutGMOXU47m8t
	10MJDd+52utFzMztYhqHNGnLGA7zf3SmMtsNit935VM3JowjWlHyK806xqzayAPbe5baEwDzsQo
	TajuuFBqbLsvviSKwVLF5BADA0OT41haf2/mC3kp0h9b/UiKc+m8OJ05FkPC6DNIMueoGCw9uu5
	mI=
X-Google-Smtp-Source: AGHT+IE1ZtVtmsW0XDuTlbIlAELUShpo4wwDXMX7hL2TWZYOYCqLZrKE2HHcWtjhi0JlpymHYTw9QA==
X-Received: by 2002:a05:6000:4312:b0:431:c2:c632 with SMTP id ffacd0b85a97d-43100c2cad9mr13569637f8f.57.1766049405004;
        Thu, 18 Dec 2025 01:16:45 -0800 (PST)
Received: from localhost (p200300f65f006608d060da4a6607fcf5.dip0.t-ipconnect.de. [2003:f6:5f00:6608:d060:da4a:6607:fcf5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43244934b09sm3878800f8f.9.2025.12.18.01.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 01:16:44 -0800 (PST)
Date: Thu, 18 Dec 2025 10:16:43 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: 1121718@bugs.debian.org, Salvatore Bonaccorso <carnil@debian.org>, 
	Ralf Jung <post@ralfj.de>, linux-media@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD
 Pro Webcam shows flickering artifacts (sometimes)
Message-ID: <uboug5ectzm4s32yfgopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr>
References: <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <aS8YBLEPwF0-NtJO@eldamar.lan>
 <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <ba9a132e-6296-451f-8351-4045c0b72d6c@ralfj.de>
 <4rnbopkefvp6h3dwttj4h7cexehqtbuzzz4gatnebdnjzdy2li@bupytpnlk2xh>
 <2ed13f74-8de3-4caf-8972-26dd5a31e9fc@ralfj.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jgpnwklzoocih2fo"
Content-Disposition: inline
In-Reply-To: <2ed13f74-8de3-4caf-8972-26dd5a31e9fc@ralfj.de>


--jgpnwklzoocih2fo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD
 Pro Webcam shows flickering artifacts (sometimes)
MIME-Version: 1.0

Control: forwarded -1 https://lore.kernel.org/linux-media/uboug5ectzm4s32yf=
gopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr

Hello Mauro,

On Wed, Dec 17, 2025 at 02:05:41PM +0100, Ralf Jung wrote:
> By trying out various snapshot kernels, I now got it nailed down to a sin=
gle
> major version bump:
>=20
> 6.13.11-1~exp1 is still good.
> 6.14.6-1~exp1 has the problem.

there is a Debian user (Ralf Jung, on Cc:) who experiences a regression
with his Logitech webcam. Sometimes when he participates in a video call
the image starts flickering when someone else enters the call. Ralf
captured USB traffic and provided it to the bug report (link below). The
problem doesn't reproduce reliably, so it's not completely bisected
(though Ralf might try over the christmas holidays).

Does this ring a bell?=20

For the full details see https://bugs.debian.org/1121718

Best regards
Uwe

#regzbot introduced: v6.13..v6.14.6

--jgpnwklzoocih2fo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlDxnkACgkQj4D7WH0S
/k6TLwgAtPBJqWCst7Q8F3qIsEKpTaaMWliqjrFDM76JOHst3e29MHw/xZHdUtuR
VF7nUiEXlSLZFYbsW5heQH/6XWN1tFQAB8U707Wc95wXMJVdfFqkcq0/Z9l1ZgPG
oZINvKt0DBQMWaMBWRNEmRKB5Y/JoyZYV1ByMyyQktU8fVhQR8d33jeJSD3w8aZI
xNMOJxbyH/Xk5jcuy6CNbPmDWOZdZQZZP3XybPJUDY22CAKaRt76QuuMt7YlFjmU
gnedyhj7ySlx8KWRDYmK5BuRDKl47V0gYPg2fp4/GsUSHLf8qm4aedZHIUcwoSCu
ryY3SjOEg8RyQkMnp1n4iUAi+2qLaw==
=HZGT
-----END PGP SIGNATURE-----

--jgpnwklzoocih2fo--
