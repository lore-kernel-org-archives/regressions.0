Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B52381B10
	for <regressions@lists.linux.dev>; Mon, 21 Sep 2026 10:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985293; cv=pass; b=R8PEePI/GUpDPFQL2M+rUTBiS7bNDcWh+/igKvRpcKCWC5D/qJkXEjgMprM7Cn0WogFIx86ENrsWmepNNRKEGCm2ZXbJdeKpyRqFgEMzvm4cBEVRNUEcYvl9mpESClHaHZCmGz25J09ROvl1mOZ1ytAnoNgSMsZr9ftRtydGqGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985293; c=relaxed/simple;
	bh=VIvwkAam9zTpoSK3o3ogyb7G3ggXPl8fp+Nj5qRGxdI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=l5G7IEX2FGUH/6SqeqynLCVldXfPTXx9ubcT/8YLGqcUjYZBQunDwjcFKw8X0w4tDffekMbYzys5fz3BkbjsC2KPMzO2on0JzOLhpyTx6UhAfJNLUy5FpIeLTr58wSij2Lxq8aTS+9UwtEUa6o8vf3egXeutwvmAfGbddi0lPr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu; spf=pass smtp.mailfrom=wetterwald.eu; dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b=sMtbriWx; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b="sMtbriWx"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a59fa3112cso24060111fa.3
        for <regressions@lists.linux.dev>; Mon, 21 Sep 2026 03:08:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789985288; cv=none;
        d=google.com; s=arc-20260327;
        b=gG3bJk7BEEK+XOcaZRpYu+RLZeS9MRYrtWohknQXEv2SwVBj/e0lMFbEZLrmzv2K8+
         xnLefqub+3oWB94XJoHgJrS5dxL3a3GxwVietjhMZovrpTdPjqik3ZLT5laKF5TtjEyP
         Tt5ACeJLB40bqVu5LsWKXy8j9ho4XtvJDX2srvnJ9sXWHsAUKpTKfoObOxp+YjKzysIm
         gHIYzEFsxK1E0GaK6z+3wQF3eU43XBMPCM5Sm0YK25DsW1RFiYFHweYgSw9PHa+D6avL
         KwkQxX8ENpF6mvYM7kTDNRPtybs02Dg4tOHQbdDWoP333i+PMvcbFWiYVRGByjRORE1o
         1/jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ckZuYoeTTPMvdxoAoxaz030ABxaViXfjKjKNmd00MIU=;
        fh=O1Vyf2CaPkSaD5dJSK5N2Qnk9HTL4KWlsE8tPgMUuKc=;
        b=Qz/kEe4kbarhBfwdJcEf2LVkfZo4Svv0MtsgWKtS+dx48Bu6ZlZ7/l4FCloauwlsw/
         QTwStj2FJqmh5DrcIix3vkRMnL7cOIeSiCVcC5SkJ21Wa/3jv1iMa4f2ofgCnzMF5491
         BfWmeMXhUIa/zO/3FfLbJAhiZCRsN93B7rUyIXttyz62hWRjyZD97nhwMXBW3b0ZwShy
         ufSYEgm++NCFbiR4d9M48CKzJS6kK/OOWADCXnDWMCx85RzofjVCMXpi/l6efQe0hfHU
         j/xBf3//C7sncqnqqUgKiE9EvyF+UKBq9IP9BVwBZtIu21PLAe1H9F/YcOTisibiueGR
         i+Kw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1789985288; x=1790590088; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ckZuYoeTTPMvdxoAoxaz030ABxaViXfjKjKNmd00MIU=;
        b=sMtbriWxI/cVKNAxgA/I6nbKymmzljj9qhHHvfTpY9r1CQFMF9KmkHJDsUbqaXWnIL
         AgdzJv4pOYLrduA9Qp1/9fabk9T5APqbOq9F2k+DzPNO4g8ppvgFRjJhTWOUytYR2WWX
         8M4lvVrv9n7wkWHWTLoBBbAXE4T9RiYbomS+AUOCLeeMPlDTn4zOv011o+J9LJE7cMJK
         FABUpe/idO5vRjVB0OdVQLXST0ZCvVpFvgFBzsUblhPH/X6ZBYeL7adMcfd6+/lzwi3A
         mzOep7w4P2IG3PZ8rEPAejsQJrTie3RyGYvBvm3VJcx7nRYH5Pz6ABbl3RT/LyL7Wpxm
         8Uyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789985288; x=1790590088;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ckZuYoeTTPMvdxoAoxaz030ABxaViXfjKjKNmd00MIU=;
        b=hD3g9q5Jy4w7FI0tfMHE5SkLCr0N0u1wnJjdb9E7BgF9VCfS42PuigkfAbbNjqfE1M
         /AM9pZWmW8duuJ5P4sWVWNP4BHXVrE/QnVlGjFwtp17x4WNebsNDOdruqV2e9mbF+n/P
         jFwjHFZuc2T+yHh2baw3ME7BbHwNzMjd3kYOtKgbo+oyMuiZBUlD0UWAUXzB963QTbzN
         qk2QN/tFz0J+Dkan1zsIu7vI3K/7j5+CtFJeoDPiimJAa1gSHWIFDyr2gdPjB/72Yzbk
         tF+F2YCt5ssBNWYMP05+IhDq45DbC1ZwGTrvcf1fU3yV77a9YfcP5QKMc8XinVUzwz6m
         uyww==
X-Forwarded-Encrypted: i=1; AKwUvBzit6TPpQcs3bsroncHS4UqJEgnyh4ucfmDXg0pAEvXOKlMM+d5W0xX/q8BBZCB2lcS5V5jj0SWZNAk2Q==@lists.linux.dev
X-Gm-Message-State: AFuF++me5gWYaF7SVfvGw1wRJa4SqI+Y28LySBcf7DlHrT4KAg13yU6Q
	GC+XNYuZp+8HrqfMiO5pEop5uPRfZS0j2Xat5gNHWzujosRkj77C+SOq9tKaW03EwOmdFzYUMbN
	IImGZdXQ61DrSf7Qr5Ri0vk79+YcIiUOeKU7Dj1bksw==
X-Gm-Gg: AYBFou29DI8IP977pWr0KRM0vUr1j+jXyHQDSvJmZLyHhRzBuAKTofFlaW8n8o2xLJi
	P0PrU9t/MJFg0yGw58R+tS5hmY1f7ksryZv/lSuT7/zQ8t6OQWgItFPNXmoyPnih4WKGiiCtJ/p
	2muZ26vXb8cZIEiCF46b3F2/5PN9bOq7KCdPP393LIgtMNhhjEo5+5VsYQKjYn3rZHnUjh7q7Hr
	tLXnvnREz7R/N+G/3bo68lyhGYWqWLt8qisUdcUWz2LGmU9Ds73J/uLtI0PiH+CAHiPCEJxyzdf
	mCYyWv9FhVD7blc/QeL25DcfyQTSFmHtkOq7Xr2YVj2qjzq9RVfw76qNfXnQ+HXgmrDoGkn61NW
	q+PBE+LetQDk=
X-Received: by 2002:a05:651c:1443:b0:3a1:f671:b2ee with SMTP id
 38308e7fff4ca-3a5fbe5b98emr24185481fa.8.1789985288242; Mon, 21 Sep 2026
 03:08:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Mon, 21 Sep 2026 12:07:56 +0200
X-Gm-Features: AcwNN1W58pSJb1Gm5FiYd6G15BwFUBJt5i6mO7kwx-kG9sYBZhWnHxQTgaZWe90
Message-ID: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
Subject: [REGRESSION] bcm2835-audio fails to register on vchiq-bus in
 monolithic kernels since 6.19 (VCHIQ destaging?)
To: florian.fainelli@broadcom.com, gregkh@linuxfoundation.org, 
	jai.luthra@ideasonboard.com
Cc: uajain@igalia.com, Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

After moving from 6.18.52 to 6.19 (still present in 7.2.6), the bcm2835
Headphones sound card no longer appears on my Raspberry Pi 3 Model B Rev 1.2
(arm64). 6.18.52 works with the exact same userspace.

dmesg shows:

  Driver 'bcm2835-audio' was unable to register with bus_type 'vchiq-bus'
  because the bus was not initialized.

and /proc/asound/cards reports "--- no soundcards ---".

My kernel is monolithic (no module support), with:

  CONFIG_BCM2835_VCHIQ=y
  CONFIG_SND_BCM2835=y
  CONFIG_BCM2835_VCHIQ_MMAL is not set
  CONFIG_VCHIQ_CDEV is not set

Analysis: both drivers are built in and use module_init(), i.e. the same
initcall level (6), so they run in link order.
vchiq_driver_init() registers vchiq_bus_type, and bcm2835_alsa_driver_init()
registers a driver on that bus, so VCHIQ must run first. In 6.18 it does, but
in 6.19 the order is reversed.
System.map (same initcall level, lower address runs first):

  6.18: vchiq_driver_init            ffff800080646704
        bcm2835_alsa_driver_init     ffff800080646708

  6.19: bcm2835_alsa_driver_init     ffff800080646698
        vchiq_driver_init            ffff80008064669c

In 6.18 both drivers lived under drivers/staging/vc04_services/. In 6.19 the
VCHIQ interface lives in drivers/platform/raspberrypi/, while bcm2835-audio
stayed in drivers/staging/. drivers/Makefile links staging/ before platform/
(line 154/155 in v6.19), which matches the flipped order.

After boot the bus does exist (/sys/bus/vchiq-bus is present); it is only
registered after the audio driver has already failed. Without module support
there is no way to retry.

My suspect is this commit:

  aa125180c673881f88b528600b57865dc158b3a7
  ("platform/raspberrypi: Destage VCHIQ interface")

I could not bisect to a single commit, but what I know for sure is: v6.18.52
works, v6.19 and v7.2.6 fail, and the initcall ordering above explains the
failure.

#regzbot introduced: v6.18..v6.19

Possible fixes I can think of, none tested yet: register the bus earlier (e.g.
postcore_initcall or subsys_initcall for the bus registration in the VCHIQ
interface), or defer the bcm2835-audio registration to a later initcall level.

I'm happy to test patches and I can do it on 1B rev 2, 1B+, 2B, 3B and 4B if
necessary.

Thanks!
Martin
