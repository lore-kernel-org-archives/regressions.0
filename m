Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22CF34A764
	for <regressions@lists.linux.dev>; Tue, 20 Jan 2026 13:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916833; cv=none; b=S82DVvyhHSN4LY5esqpmnEgxXbngYpsj/otJ4YEVmZNHEi8kn+eVBz2g0x2xW39uPXR1m+R4N3CaqWvCPtqh+N6Qosn070ACUmgz6dM8lTAgcS+k2fbsV+2HXqWQT801Uzfknf0iFusOtogSIh2usRbmff1YXu4G2WUcEsRaVsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916833; c=relaxed/simple;
	bh=WPYbjVjLawIbah5O6LiY/VJ2RpFkbC5QbU6UUNHbYIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=moHUY7mehnoHXFmxqw/rRBoBwexsEfpGaxDnwyl+MbsECQOBS9YX9sLanp4ouPAC1nCLLNVog2CUM7/C6HbmJy5sihtXdVcA9lLh523+0hq6dCQnewV6Qsma9mTngfbJsgbT+yGMJGztsToxyZVU3xDU9UYhX10Mnw7MdrueqT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZivBMS17; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZivBMS17"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38307233c98so451991fa.2
        for <regressions@lists.linux.dev>; Tue, 20 Jan 2026 05:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768916829; x=1769521629; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WPYbjVjLawIbah5O6LiY/VJ2RpFkbC5QbU6UUNHbYIE=;
        b=ZivBMS17OuMtrbItEyllbZnu1oXqsfzrtDaYqGgp/8Fl0iY8aescLZuSaz8VGV0hnL
         +2D0isKABMtRPKf1njhN7E9orDGBTcvWEVrQDzZkhCIEFT2H4F9J+e2XJ2nzKGZCUFVj
         UI699vpq2hid0fGLZ9/odwwvjgeoHni78Vx7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916829; x=1769521629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPYbjVjLawIbah5O6LiY/VJ2RpFkbC5QbU6UUNHbYIE=;
        b=SiQSkvTORli//6V08x2NKGxhlooCLBj5py2gskh8rGNUPaOk4mzgzWwpfLP05F9Rnk
         keqa+I7FvfJcT5pbbkDm1IGlnIAAEa+77U/k9yH9GZEG8vP37XVF1z7ON/li5PopaVpg
         mKDb+jP50rob35wL4gQQ7oA0aBRy9HWKaaGJAP+j+objDN4AEYmPRnmhEzgM/vqH16E3
         FFBjRp9jr9+1Ff6AF8a+Tpe0m4kkV9WsQqGXJpwK2uEN6lGsiwcrAUoHaE/bTQT5xjGz
         j5raglFm2xS20sLmf0oMDu6oTjDK1iEXtvBftBI8vX7odyvq77lNMBKaudZ72qDvt5jv
         ZVOg==
X-Forwarded-Encrypted: i=1; AJvYcCVO3SBbqswv362eTwSpeI9VnarEoWIpjUv1/Dny7BfjM7u99R+s86kCX4ULU7/AuaZuNHSVsX8FgfclRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6LyugB1C/c19coDNxbcMjd6jV3PG/ynOIwtVqP/suKaWye3cg
	7BsAnmD7+ggBja61HBIPfIh3D1MHF7R3w0lvOF3rkaJwUpnwr1efy7CheDpbM74GnkSsQ/zlusx
	1nrg=
X-Gm-Gg: AZuq6aKMHWyfoX34ipNKEBEfo2hvfdGGDFKXCrm33g66TE53gQVC4BobA/MiINNLAEu
	M/jchfJvwfm9aTn2qAetLGm8fOkT4iOHzOgxzY0Sm7tqrT1lBTjFeqzE4ADTkvB2SD8TjGaQvuy
	5z3xUonfn7qDXOnbcZsvTjHPqBoYqLSF/Y0hhFusQVn/Z83s3EHCFVX1w4TlSP3JdNhEx07ffij
	vjmScdOAgBdt4SGLtjy+QQdE82SCvAzrLyxFIUQyMxYOS2Vum6sn+2x+ScDBlQqToEITjzpBr6q
	QVpSO3GBf/+AYHtDxnRta99pqZhgEs7Spgiw5ZKbT99uQ9l+SfeY3FfOo+bS6FDyxG2GOrJQkgn
	c9yNAXjL0wBEDV/fzMALhqlz63YLOInizRUKphGbhCy6jeOfCAtA2O5Zmo8YSBqgy225Zb8g9dF
	Ig3xCvKsGJOLcDVEIjtJUTzpGT4ySriPTqu0X1QTo+37S5+1qk
X-Received: by 2002:a05:6512:3ca7:b0:59b:83fb:45df with SMTP id 2adb3069b0e04-59baeeec7bamr5079036e87.47.1768916829368;
        Tue, 20 Jan 2026 05:47:09 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf34f2b2sm4178745e87.34.2026.01.20.05.47.08
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 05:47:08 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b7073f61dso6617594e87.2
        for <regressions@lists.linux.dev>; Tue, 20 Jan 2026 05:47:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNLJvTUDJ2B4adm1PC6axzOIU+MpVKNE7CFS96dVYqeExLZS5rCi9RV+gSV2yAJBwIXbGK3mmnwYoWzQ==@lists.linux.dev
X-Received: by 2002:ac2:5b5a:0:b0:59b:b039:963 with SMTP id
 2adb3069b0e04-59bb03909bcmr3524309e87.0.1768916827368; Tue, 20 Jan 2026
 05:47:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aS8YBLEPwF0-NtJO@eldamar.lan> <ba9a132e-6296-451f-8351-4045c0b72d6c@ralfj.de>
 <4rnbopkefvp6h3dwttj4h7cexehqtbuzzz4gatnebdnjzdy2li@bupytpnlk2xh>
 <2ed13f74-8de3-4caf-8972-26dd5a31e9fc@ralfj.de> <uboug5ectzm4s32yfgopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr>
 <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <0490a39a-28d9-4925-a162-5e4d498be257@ralfj.de> <aVfPmZ8rUm3Vf7pT@eldamar.lan>
 <58a7c628-63dc-48f7-8a46-357ca2d7d500@ralfj.de> <CANiDSCtX-RJrmfiK_rOqi870CK06_ONvnsvqWRZczBXY38eg0w@mail.gmail.com>
 <dc4c95e6-d19d-414a-a7ae-401dacbaebfd@ralfj.de> <CANiDSCuse+=+MrDUFc_Sd1zXvtY9TDrX0GF6bs2_w34b03Djkw@mail.gmail.com>
In-Reply-To: <CANiDSCuse+=+MrDUFc_Sd1zXvtY9TDrX0GF6bs2_w34b03Djkw@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 20 Jan 2026 14:46:54 +0100
X-Gmail-Original-Message-ID: <CANiDSCt8KFH7d6cc4zTpf10F4G=O6vmZiSj5pPC0q+_e90Cjpw@mail.gmail.com>
X-Gm-Features: AZwV_QhcJhsYEtASQyqTvxfiHpPRR1t_hSZ4owuCB13wEH8SWQ5tKj9_SmrJt0I
Message-ID: <CANiDSCt8KFH7d6cc4zTpf10F4G=O6vmZiSj5pPC0q+_e90Cjpw@mail.gmail.com>
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD Pro
 Webcam shows flickering artifacts (sometimes)
To: Ralf Jung <post@ralfj.de>
Cc: Salvatore Bonaccorso <carnil@debian.org>, 1121718@bugs.debian.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, regressions@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Another update

Zoom has notified that they plan to land this even earlier. In 6.7.5

Ralf, if you could confirm that it works/doesn't when zoom is released
I will be very grateful.

Thanks :)
