Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47070332EC1
	for <regressions@lists.linux.dev>; Sat, 26 Sep 2026 11:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790423568; cv=none; b=E5TCpQ2g+nBMBUhKZw6IUIHYSb59kUenTFeCrvzXOs//GrOgtWMnOXOzupzTO/rP+0HQxXOuSq+w8qbVFnFaT+RXKlnesf98usgnITs42QUszb2zgGe7diJyivLXRAstC8PqEka3axGx68WL6cGEF2vsm8JKR15L1hS0uerciW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790423568; c=relaxed/simple;
	bh=LNGo9Lk6YmczPhmSAhIOAoe3rGeQtCB78blB4lGK4ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kylZY8kxu6FF362FahgoPZvBtGkSIRST3F6RWMhbYgtpFU7FnFaqh91KCPbBegXuPvMq4ifYkN7g1yHFAU8G+NqhX2yL81RT4RMQeVE3a+IQDK4M4LuOYN/JD4hHi8JoN+gnjrRlQykgtnc3DglNN28TJXB4QP5d71G8/6ac3xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSKAU2t5; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSKAU2t5"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aaf10bf094so1748748a12.2
        for <regressions@lists.linux.dev>; Sat, 26 Sep 2026 04:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790423565; x=1791028365; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jOZJQtJF+6fvMtqVqH7Ln6MjEBTAkHYNteQQULMHp44=;
        b=HSKAU2t5xc2MuEsNgTnWVuYDKg78nepHxYvA2T5l2UfMkUlmeifr2PH5ZQQ/hEEpMS
         udArl+qbWXLO+8BaOAZbNHNQL4BvDvQXQ6jkmCyUpPc9WF36TspNIPciJ1dYTrfftW8q
         /38nGThMDZvoYlanBbwHTtozwRF8c/5/P0tOpisJlQ5TCj5XAHgLvPVtKCJ+LWutpxHW
         98s1GbPHSETNmxvS5KkFXT3mLvhCXH1hDAWTjYrhztWmdfH0c43VXkTPgIsNDS2qrUm9
         AYGEEn2Y1vQvlS3YqwQuP930YXduh+ncLiVNw8ZhCDOtW7j9jXekyhCaolOyLZIHF4X8
         +jtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790423565; x=1791028365;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOZJQtJF+6fvMtqVqH7Ln6MjEBTAkHYNteQQULMHp44=;
        b=GHeH5q8DjBYJHbcGykPbu6w2eptngasuF7zKY0DUIJxhsOkjngH2Hlf3a+J/7vURtu
         wvTue3fhWrItb11fmQ1ESrsCVhOuuxAsn0yu6ETRvmO/d7/yWh74lRHTMA9rLz4jhjib
         nOS3ErGSX5FZ69exYLrdkK3rpdp8HNSwretOVJ+qxB3wn0i2S1STfplvoFNOU9J2GcyK
         uKkj1iItmPiHQdtTLbUFnyQxoEZ+Vjrg8YaHmB6G/0FvH01ggayw7f9hLzhZV0htKIk4
         cV8Qp1h0xxCWPGvYXorf4iV3obdEojHqHQqrpeXDvFmSZEiXh6rfCfaVY8SSJa1wXpH3
         Xwog==
X-Forwarded-Encrypted: i=1; AKwUvBwcP9MRa4vmStKvEf1pHOfDQtC+M9+TCd9r4ICpnv6Vt4CGJgQRc4bZX1Ph25ZxSI3JS362LuFsf4zq6Q==@lists.linux.dev
X-Gm-Message-State: AFuF++kNCMFt+WvmNwxveCOVy+1NMmASETkCholbzNBFSDIYPBNOZR2d
	q5GKXOqH42Rx+Wd5ukdiF6J4ALGfK55o9tCpsKWhSIgKeICNDFA1t33m
X-Gm-Gg: AYBFou13lElY4VXR3Kr+O/wg1OZ7vuUpJMmy8Aj2PZB3wi0Fj8xLTrSwFpky2pQfAal
	n7/T0th/QXCZGJ01NgO+4AYUUakfornvtGjQUhu/B6HyvysgB1NdOzREVME/adb86+aFAmDEizt
	drv5NHXPxcXoESg+N9PS1KskRBRSHSW7SmfwU2UjJ8USw4WatSuFiKjAb1cLOf7mNn5SrBGFJv6
	SPkr2rKVfGSMJ3PFJKhoGq+OYN3Tlsm8gBqmwhafasuaJhfELFiDi2ymzPeW0V/KuHz6QXxgJD/
	S6587xAkqsLbp+tzb5JNwzp6HDewRskVnJY3wRR5tYQKF5CX7lfsIwhA/Ps5Ggtx+rz6YGWgp/V
	TasCQWIR+Xkm3Hr8d1DM9x7r7N+xNLQZz7jX+iH9B4F1gvAhAXFIilBeihMH/0ck8UJGrhKRqOF
	bVQQ75BhtvhNPfa11xqYZMLW/gE1FYBZU8v5GGKmOt55nLMbkEe+N4LQ+vb1UQcMD00Rm9cy1Jd
	lA792NrAzsoG/q93XSvKkLYiN9vZbje3FI4aNRw/L4=
X-Received: by 2002:a05:6402:21d8:b0:6aa:734b:1a2e with SMTP id 4fb4d7f45d1cf-6aac9090952mr6404194a12.40.1790423565326;
        Sat, 26 Sep 2026 04:52:45 -0700 (PDT)
Received: from fedora.localnet (81-224-151-184-no600.tbcn.telia.com. [81.224.151.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ab5be57b13sm414448a12.33.2026.09.26.04.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:52:42 -0700 (PDT)
From: Erik =?UTF-8?B?SMOla2Fuc3Nvbg==?= <erikhakan@gmail.com>
To: Roman Stingler <roman.stingler@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, johannes.goede@oss.qualcomm.com
Cc: Lovekesh Solanki <lovekeshsolanki00@gmail.com>,
 Filipe Lains <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
Subject:
 Re: [PATCH] HID: logitech-hidpp: do not overwrite the device's hi-res wheel
 mode
Date: Sat, 26 Sep 2026 13:52:40 +0200
Message-ID: <407JHeAkQjaIVOP3-Y7zGg@gmail.com>
In-Reply-To: <9acaeb9e-551d-474a-9c3e-9be5f667297f@oss.qualcomm.com>
References:
 <20260923181203.422097-1-roman.stingler@gmail.com>
 <9acaeb9e-551d-474a-9c3e-9be5f667297f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi!

I just wanted to point out that the original patch has been reverted due the 
issues caused so this patch can't be applied currently, but I'm working on a 
new approach that I hope will fix everything.

On Friday, 25 September 2026 11:50:59 Central European Summer Time 
johannes.goede@oss.qualcomm.com wrote:
> So in so far as this is a solution at all, it really should be
> limited to Bolt devices only. Although I wonder what switching
> Bolt devices to the hidpp driver wins us after this patch?
> Do they still gain any meaningful functionality from the switch
> to the hidpp driver?

Mainly it's getting device information such as battery and connection status, 
but also, theoretically supporting multiple Bolt devices that have different 
capabilities and settings. E.g. two different mice, one with high resolution, 
one without, or two identical mice but one with invert enabled and one 
without, etc. Unlikely scenarios, but at least theoretically possible.
And same for keyboards, it enables separation by device of any Logitech-
proprietary signals coming through the receiver, as well as optionally e.g. 
media keys and brightness, etc.

Cheers
Erik



