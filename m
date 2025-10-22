Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292CE312810
	for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 09:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761124622; cv=none; b=QpE2XRxkBm7W6LV09iM3etTGdCGPI6slO2uT5CFhODj5yVOGYyyGZtW/3StbMzTmkvenmo4IUP82J/tpj5aMz2IWpY9Rt/936eNrkt+4AKcD4CbYz75JIB2HR7FRic93fLt70NJH8K9mvqO6USPBUFMCboV6U1DsHTpsv6h1Ft0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761124622; c=relaxed/simple;
	bh=uT0LN1EUMQAZ1v7BvLjcq3iXoGtsuTlf5kkUSCJBu2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y5lkOhkd6WFfJJ/UfmxmV9uomo5I3dSX+Ib9HWMqZKPsPdcIsKL80jsQ916AqRhMqp4nph6Ltawys0hTX3FpyHuiFanqt4bXS3sXUApMY4qhgG3We6cOPnGDtAtAvplvD/inDD/4op3t/Wg8oOV/AfVOgl47JxErNQRNfHbtvsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=dZP2Pl0+; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dZP2Pl0+"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so8547185f8f.3
        for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 02:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1761124617; x=1761729417; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0d1OtznxSM+pdxcYthlznRVSRSBvTGMBZ9iBozHqpE0=;
        b=dZP2Pl0+3TqTbObBjz9i/f9yyOtYXqMmnm6rRD2jfEHT76NJ68BaBOoQUjIgNZ3zou
         coTCjLgAWNj+Wxf98Ce07JJZqBfktpQ45WY2DCFmyEmwmBlIKZoPi1c+/arVz3Rqbt3K
         YSk7AvXsTqbb599nLJMS1/BS2aAw4/l86rLqIWD5TysyqP0n2/jv1jzq5Yol3dLVqvN2
         hLUPIfI/b2/CTcYKaR0dd9/gP0D5DhEqy9vdDf0hKsUFDre75MzSf6hxXxyM3MqJ82tF
         RIC13KC1dQULaRKiHDN2wuVQ62POrpIExaQ+2UBAeOO/u+ZHyqz1pmuF4zHb1VIQouCg
         v1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761124617; x=1761729417;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0d1OtznxSM+pdxcYthlznRVSRSBvTGMBZ9iBozHqpE0=;
        b=rERJvwCq0YYerM/Mp9B7sqMsWWNogdlP451FyL0wc0sz67tF7Q++LXz7fUlvdjNxzA
         8s3hv61zZlvroKB5np5TD2f90BAPOeSfur59SrQ/88c/s7nH65u+L9qmD4TtHjfd75te
         s0SKE5+cHHYo4shtZJEsW4m6Y30KamQvwGDG5E73FGpUYdBJwmHVkjdF/llsWVwfzC4z
         Lw5fYQ8YOh09R6Q1DzIBs+Ib+tSt1B8CuazqfbegwhHCuyqj34mm/B8f1ZLaBz2u8c2/
         dyKIGm91Mcn1UZjCrxdMvf5MaL+KquJ9P24gjcExU667qkdYhICLnpcSA6L86T4fQdQ6
         /HKw==
X-Forwarded-Encrypted: i=1; AJvYcCWnSE9+exaumwNhh3nKuV8hd/QiMGX7oGBJCyCR/CdQgjGvo9Kqelcv+JXdVUuDpLVmmu700iT0IlL6IA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwM0BY5wQPRQWI24G2SNrhx6UlF+/h5mn3UkChMG7gsh3MksVzx
	rlWmXeGmcMgc8dqWRTMyM/f5co/OvkDQLiqjSD6v+33Y7bxl43JYxp0=
X-Gm-Gg: ASbGncu/qVzIkVkbKXR5JkQbk9vO2jJS+Da8paX6aevCrrz921Tqfjwhg+/e0ZNL8WL
	KXkS78V5cwSKJRtwH34b2Od8kgCql53TCwNlT68XI1r20m3JEDdUqUr0JoIPjKgGegsu7Ct1TxP
	s24j48C8pNMMXvvs5am4sIPgimF2jj2eZfSa+j2v66dYovAGFgXleImNickj6a2PxTGPcxCgLbH
	BSEy/kwB7r/MRQXvz/T5NPb7tiaHHDaZVTQ6sW7Cu++HJUK+G9uDxXjLG2O5urq5Q0Gk7kCnrAs
	/XAfXD0sWnzkOgf4ZFU1oUmCHrHHf0Tu2i3VwHDYThwQ8xZABJPa3M0s1F2mQcBI0JoW0ey0Ln0
	InISvqI10tj0fRyG+Irf1c4daLQhX3ddDVf4JUjU04MDWKMHfHuHE5wiMbKdWCq2uiW7ZvyaFXH
	ebnVR33IqAgsblUJOmsxU9g5gNWlmM+pXy53nGqDOWQUx04oHsv/nnxQz+41S3rA==
X-Google-Smtp-Source: AGHT+IHa35nbyTK6Dmlfdg41+HIA1hn/cBaTOnRlZDC5R3mjJeMyTqjZs96LilY2c+rKxD8zCB0KXg==
X-Received: by 2002:a05:6000:26ce:b0:3eb:5e99:cbb9 with SMTP id ffacd0b85a97d-42704d7eaa2mr12913918f8f.10.1761124616882;
        Wed, 22 Oct 2025 02:16:56 -0700 (PDT)
Received: from [192.168.1.3] (p5b057850.dip0.t-ipconnect.de. [91.5.120.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a0f88sm23394732f8f.7.2025.10.22.02.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 02:16:56 -0700 (PDT)
Message-ID: <5f8fba3b-2ee1-4a02-9b41-e6e1de1a507a@googlemail.com>
Date: Wed, 22 Oct 2025 11:16:56 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [REGRESSION][BISECTED] Screen goes blank with ASpeed AST2300 in
 6.18-rc2
Content-Language: de-DE
To: Thomas Zimmermann <tzimmermann@suse.de>, regressions@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 jfalempe@redhat.com, airlied@redhat.com, dianders@chromium.org,
 nbowler@draconx.ca, Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <20251014084743.18242-1-tzimmermann@suse.de>
 <a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com>
 <43992c88-3a3a-4855-9f46-27a7e5fdec2e@suse.de>
 <798ba37a-41d0-4953-b8f5-8fe6c00f8dd3@googlemail.com>
 <bf827c5c-c4dd-46f1-962d-3a8e2a0a7fdf@suse.de>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <bf827c5c-c4dd-46f1-962d-3a8e2a0a7fdf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 22.10.2025 um 11:11 schrieb Thomas Zimmermann:
> Hi
> 
> Am 22.10.25 um 10:08 schrieb Peter Schneider:
>>
>> Your patch applied cleanly against 6.18-rc2 and the kernel built fine, but unfortunately it did not solve the issue: 
>> my console screen stays blank after booting. This is regardless whether I do a soft reboot, press the reset button or 
>> power cycle and do a cold boot. They are all the same.
> 
> Just to be sure: you do see output at the early boot stages (BIOS, boot loader). It's at some later point during boot, 
> the driver loads and the display blanks out?

Yes, that's correct.

> There's another patch attached. does this make a difference?

Do I have to apply that against base 6.18-rc2 or against 6.18-rc2 + your previous patch?


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
