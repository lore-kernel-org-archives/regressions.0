Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22EA285CB8
	for <regressions@lists.linux.dev>; Mon,  5 Jan 2026 15:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626983; cv=none; b=bZdt046l8c83Y4I/rQ8CcNty7wl/AT/wmeIAOC6iz8Rc2ATF5HYsoHAulZBcXtUjWcnsFD0pJQNbDrupRe4kThRfZcbf+uHR9ZNBYoX1612wtl88n11Q7k8jrGR2HHIjZeOUeWWmf7mPlGI9f6FUcVqjaiiq6PFDijO2jCQo8sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626983; c=relaxed/simple;
	bh=wVFiwFCaN+6MmHP7qawZpv5epVl+edZbriJpg3foN/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tBk1belQE4TKCGt7yvHsVWYPLG3d0uU9ixJyPcI3shOxOAOu2OJxAwxE86VOue1c0VFsqj+dzE6sPyrIyl7MmHdvjiSvko8K+6jGwlV3/vXDstYjT1Xc055NceIvSEPzVOAj4OLMrBUO3L5qWQjc8GdFgcVcEFptq4K1fQPPGC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F9qg+5gQ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F9qg+5gQ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59445ee9738so11399742e87.3
        for <regressions@lists.linux.dev>; Mon, 05 Jan 2026 07:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767626980; x=1768231780; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wVFiwFCaN+6MmHP7qawZpv5epVl+edZbriJpg3foN/I=;
        b=F9qg+5gQsYO1qn9q+mfPBjKV1dx+TdGOJHa+RTZTnzhNz/9dTRNQDEs44fQq0/JCCm
         F8FiRc731feDQIThoGcfl7F/zPJ/voGtBU2AagWC1gJt0dlhQdQ44E8SkNk2nHR671ko
         Z1itA5uW2RuKyDq40519ZLvEmWC1vcF4ccMR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767626980; x=1768231780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVFiwFCaN+6MmHP7qawZpv5epVl+edZbriJpg3foN/I=;
        b=KkgrJ6Hiw2uHjeVHjisE3xJ7bCy4SgDTnpOtm23BSbHykp6SMrX6AbNClLTwQnBJoW
         +NEf3SHmGDkgEK4ezUO0dT5b+bp/sKo8EsSiKz3SAObPL/IciIRDK2E3j2/48PlddgYt
         BrNCUrX6AwHeN8pOCJhVq1clcAcX3vyCSAgflEMOEeNxLu9qVqoXzliE9/d2y2QDr67N
         NuSvmeUKqvrHd6oOpbGjWoOZnxl2tDZk6aFqKt+SAGB7qSHwYAn1WuPa2qO9uKw/t4kV
         YcStkR8GHkXnDGzR3F440alWW8bFnsKSvdwgtGPB6brb0pQbG+/KaNQLZHOOX2cmR58Q
         7ofQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlhlXb8+EJL7m+hcQpevPlNxGzS+ww5U5pWd4tv51qGZByGKlq0lwUjX1W8fwBMvFXpJ+S0mupTz45Xg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEwKPJ0ZccKE8bKtVb5SVuqpyxRSA1FrpQnFv3+ZWXD6+04BSb
	ah81fbm5pyTUsW5b2W9XZOgjGHuAwpJX6j4yVJGS056oZRC5rLbZVilPQ4QmUG26wv/32ncISgg
	cWVM3sQ==
X-Gm-Gg: AY/fxX62Q3GPFi/uHgJM/HGaRaW//DzrSptiX5j2EM0OCNVFPMcy5h9ppOBxuU//Cjc
	7y9a4eMS3O2TqTiUYhuctybhw4NHQ1jYHJWbWE793eSyFVpvHnAydCQhXecJ2HtGYPNF1ev7NQF
	kGISPKLokDfUFo6563ZTP12Ujq9Utsr1e2baIp24d2x6mwIBUC79g2uJRkX70DSlNJAupwxZTEF
	2gUDWzx0/4gZgqFW9s9wKU2d0sZulYjT/1IW5GwX2JQmJgSdAqwoAX4G1F4apxrmhJe+mNAIATF
	heklXOuuSykl3JeA73ma5qdf4pJF34M4ajhGJjoLOwRpFo1D/L2SpVicZVmL0MsLmSLJsVxsZxk
	3y/6qKLm6+CRNSyk3jNCyNpC/Cd9GdEXc36s5R+WgQzoCjppvEEdBUT50oM+OzZ6QbSY9A+drB0
	wQcZBo1EjVaCaoIrIEmuF7yaWTaMKKQEKgncyX8ydkN6KD30e9kXFreN0wGEbsHjI=
X-Google-Smtp-Source: AGHT+IGUFBmrgMhj+UM8gGeDx/h8gVycvxx5O3TaA+bOJDH8ALKh3OQAxsqW9Lhp7XhP6y+DsKK2rg==
X-Received: by 2002:a05:6512:1302:b0:59a:11b2:2bfc with SMTP id 2adb3069b0e04-59b6520ec68mr39750e87.1.1767626978345;
        Mon, 05 Jan 2026 07:29:38 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861fcccsm14413847e87.85.2026.01.05.07.29.36
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 07:29:37 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37b9d8122fdso189191fa.3
        for <regressions@lists.linux.dev>; Mon, 05 Jan 2026 07:29:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXphPzf9Q10g1Lvo5iXVmzIcHoGDfHtDif4tNup/hFViBPUWU/f4JpUk9uIp3owFSLeGnTpC5TYu4UqFA==@lists.linux.dev
X-Received: by 2002:a2e:a992:0:b0:382:aebc:1b82 with SMTP id
 38308e7fff4ca-382aebc1e8emr49592951fa.32.1767626976294; Mon, 05 Jan 2026
 07:29:36 -0800 (PST)
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
 <58a7c628-63dc-48f7-8a46-357ca2d7d500@ralfj.de>
In-Reply-To: <58a7c628-63dc-48f7-8a46-357ca2d7d500@ralfj.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 5 Jan 2026 16:29:24 +0100
X-Gmail-Original-Message-ID: <CANiDSCtX-RJrmfiK_rOqi870CK06_ONvnsvqWRZczBXY38eg0w@mail.gmail.com>
X-Gm-Features: AQt7F2qBQEC1VJODXlCb-m5Fcx4Bj5FjDghrxH2sodmPito6_a_megm_dzvXV14
Message-ID: <CANiDSCtX-RJrmfiK_rOqi870CK06_ONvnsvqWRZczBXY38eg0w@mail.gmail.com>
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD Pro
 Webcam shows flickering artifacts (sometimes)
To: Ralf Jung <post@ralfj.de>
Cc: Salvatore Bonaccorso <carnil@debian.org>, 1121718@bugs.debian.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, regressions@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ralf

Thanks for the bisect and the report.


The patch to remove noprod parameter has been queued for 6.20 :S so we
should look into a more permanent fix soon.

When you say zoom, do you mean the desktop version of zoom (
https://zoom.us/download?os=linux ) or the web version
I would assume that it is the zoom app, that is ignoring the "error"
flag from the frames and showing them to the users. Can you confirm
that? Hopefully we can reach zoom and they can fix it.


Now about the error flag. I have given a fast look at your usb trace
and have only seen 4 frames with "error bits" [1]. Can you add more
tracing?
Do something like:
rmmod uvcvideo
modprobe uvcvideo trace=0xffffffff

Then start zoom, trigger the error and share the content of your
dmesg. It should contain an explanation of why the driver thinks that
the frames are invalid.

Thanks!

[1] I used this filter in wireshark: usb.iso.data[1]!=0x0d &&
usb.iso.data[1]!=0x0c && usb.iso.data[1]!=0x0f &&
usb.iso.data[1]!=0x0e && usb.addr == "3.34.1"
