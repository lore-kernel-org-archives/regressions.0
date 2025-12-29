Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3C31E572F
	for <regressions@lists.linux.dev>; Mon, 29 Dec 2025 06:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766989425; cv=none; b=hW12Z8fylh1CJ/xTMzmzwCeGr9h3e5wOI1PDWtgwMo2TzAPp6hiGJWbJOk9fiq+7RSWzfI+gdGljx/QH1XZQ4cDYv613c8Tx6PW6Gd1qWZ6j+ubtlpcA250xbBLzVZQ3sKe9OvWR212RZv1+H68c88O3OLJmaNUska3Lb/8huTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766989425; c=relaxed/simple;
	bh=oV+WRA3ZacmArlLWT8m/P6MeXzyTFX8AmtEdU6Ou7D8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PW8TRGx/zSI+XdvCGxjTUF+co2KQyP2KFQSUYA+aHeKHnvsA6ZRZFJ0FrRHaAVnKxH7y+mOjY7RSJWYFRqEt8JdEXZMMSNHNg5lyVj62Zm9xKEbrWuLDwQt6biW82V8OM6XLzLNJjMxZ8F/qwV5rWleWfi77bahUXZjw8Lq2qaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NB8rczyc; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NB8rczyc"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64b8123c333so12856839a12.3
        for <regressions@lists.linux.dev>; Sun, 28 Dec 2025 22:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766989422; x=1767594222; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aVL5o9etEvDEw4GCw782FCEjMjzJiOjORVzywYUp33Q=;
        b=NB8rczycY0hrHaqdsWjV6GMWDPE23R8OeGrfFele7sdIBfFrZ55W8vgJHjF8rUYU1h
         CcBbOcGQpiwol2krSsbhaFeU5cf6FEi1NQ6nAV7EM6QNjfJ4xbVAA/kFhcjFE0rsOzDw
         X4PhxQ4ja3Xn8CLF36s4ebJN+U2hfaaWmzJbXNZAWZUTdVq/p91dTukYEThYzQPzE7pl
         AntwkUXlPGS2sxypLHNiGEsKTi8kdQi8MPXSD19QaV459Asj9v1YcB9ZvVR4alVGHnht
         OQVw3DgewQyO2v7B6Ebb6fi/NOIDakd7W6Fpe8jE6KSbZLeiTD0kRKEgm23o+DyDqdWw
         fxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766989422; x=1767594222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVL5o9etEvDEw4GCw782FCEjMjzJiOjORVzywYUp33Q=;
        b=tVLQZGbKOl/U+A67wYLve73akvjeZin2+hW8/FIWM2WOIo5IhZlwEOljffnIqWg4fH
         EYw6tLZ1AqI3eYlSOawLPqYQorTdstNI/pWjqLyMvv/tHdRTYzYImcbXs8n1DdizC5WR
         R3Nrp1f8mync7BAuANQL8VCajkI735BXzAO88H0ty9TXNwK08vAat9RzmvVBeXVP4y0R
         jbCn9wRofkM+5Dt+Z3qIkl0FyL/DWDKGM4Gs/LH6xJ1CEttFWoxIGX7x5ZumIMHTW68z
         bDz+tfrxvrWxBHFwKMKVAgwIxsdu2k/IU/9KLebHZb9ChVUpH1PgvpUv45TlgGf21CqG
         6UiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzYPiydGy3Ok1UCVJKyLvFHhmbLHf38M8y/qL7gozhvqgMj6cL5h3bDkAnnUo5i4rXKokr0qCZ3GRYnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrZ0CufGTB57JZBY4o+Sk7oZ2XBdQAXS6loMdBdaBm49CEhcSV
	bidfoffZ/wVbxf1npem0kyNZ6bSUszWyRtZ2+NC04vwlrscdy5E5mgq4F8nED4ljaQk3mYDfedR
	nJmLMdKiUP+RMi1UsFf/8mDjh1S2mLUk=
X-Gm-Gg: AY/fxX4Bf4+EnBbHPKIUZmqxWA9jup5HBejeO/KLVVOgxeZ2UZSLJs0/+xQsM+ds7Oi
	+mpICANe/qk7b0ZLYRDRh5UFXiyaJgYEbBSq9GUHzI810/bDSfYeAm/VhXUwlfcUxANsBTuWj2W
	hXwYyjtzKWgmm8Hg3auvXmAFMPXntCUwPT1TjJKe3R4+P96GfN8prCqVScIFcb/DVIpwovfpusg
	ubNwW1BfGXLz2efRo5Vjp6Dzj1SNWyQwsaNdmdFcvYf8JuafaBBR7XNWivpzMi+BY0aAjkGOp3c
	VL/6tIlEo87zRicS3duHhJYtNUndTF1aXLy2wcHXAh+XUb8CyTtxvIxp0a4ZCHWMnsjXw+a5+Ba
	2nDMydCoza6w1E1HHEk73vrA4V6PmYYXCFkQP
X-Google-Smtp-Source: AGHT+IHGXgFAPy7tVkgnwA41s4AgldQYo0aFCH9VwT9EvkGa9nCQXrDP5r3FMHnuWkn0I5+yBFW3JKI/pxyzqI31OxM=
X-Received: by 2002:a05:6402:520c:b0:64d:46f:343 with SMTP id
 4fb4d7f45d1cf-64d046f075bmr24640582a12.12.1766989422180; Sun, 28 Dec 2025
 22:23:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aUKOlj-RvTYlrpiS@rock.grzadka>
In-Reply-To: <aUKOlj-RvTYlrpiS@rock.grzadka>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Mon, 29 Dec 2025 06:23:30 +0000
X-Gm-Features: AQt7F2pl8ovOP2mKwlewPdztkW7R3HoZhXPXXEstOkK3A_3P2xbr7lX2E5qFy1k
Message-ID: <CALeDE9OzCzbhKmc61Kgbmzr67oJnjZMjsO6yYbkXujzA-OuO+A@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] wifi broken on pinebook pro
To: Jan Palus <jpalus@fastmail.com>
Cc: linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Dec 2025 at 11:26, Jan Palus <jpalus@fastmail.com> wrote:
>
> WiFi no longer works on Pinebook Pro after upgrade to kernel 6.18. It
> appears firmware fails to load:
>
> ...
> mmc_host mmc0: card is non-removable.
> mmc_host mmc0: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
> Bluetooth: hci0: BCM: features 0x0f
> Bluetooth: hci0: BCM4345C5 Ampak_CL1 UART 37.4 MHz BT 5.0 [Version: Version: 0039.0089]
> Bluetooth: hci0: BCM4345C5 (003.006.006) build 0089
> mmc_host mmc0: Bus speed (slot 0) = 148500000Hz (slot req 150000000Hz, actual 148500000HZ div = 0)
> dwmmc_rockchip fe310000.mmc: Successfully tuned phase to 55
> mmc0: new UHS-I speed SDR104 SDIO card at address 0001
> brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43456-sdio for chip BCM4345/9
> usbcore: registered new interface driver brcmfmac
> brcmfmac mmc0:0001:1: Direct firmware load for brcm/brcmfmac43456-sdio.pine64,pinebook-pro.bin failed with error -2
> brcmfmac: brcmf_sdio_bus_rxctl: resumed on timeout
> ieee80211 phy0: brcmf_bus_started: failed: -110
> ieee80211 phy0: brcmf_attach: dongle is not responding: err=-110
> brcmfmac: brcmf_sdio_firmware_callback: brcmf_attach failed
>
> compared to 6.17 instead of last 4 lines with errors there's single one
> with info about loaded firmware:
>
> brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/9 wl0: May 14 2020 17:26:08 version 7.84.17.1 (r871554) FWID 01-3d9e1d87
>
> Bisected to:
>
> 6d54d935062e2d4a7d3f779ceb9eeff108d0535d is the first new commit
> commit 6d54d935062e2d4a7d3f779ceb9eeff108d0535d (HEAD)
> Author: Peter Robinson <pbrobinson@gmail.com>
> Date:   Wed Aug 27 16:30:37 2025
>
>     arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro
>
>     Update the wake-up pin and associated interupt details for the
>     Pinebook Pro WiFi module.
>
>     Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>     Link: https://lore.kernel.org/r/20250827143040.1644867-1-pbrobinson@gmail.com
>     Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>
>  arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
>
> With this commit reverted on top of 6.18.1 wireless connection works
> fine.
>
> Not sure what could be relevant but:
> - it's an early model, I think second batch, delivered end of 2019

Is it the Synoptics or the Cypress/Infineon module? What firmware are you using?

> - mainline uboot 2025.10 is used
>
>
> #regzbot introduced: 6d54d93506
