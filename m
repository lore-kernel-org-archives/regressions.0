Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896382;
	b=Q49J8cKetz5peD11LRtwIo8E8leA9Sgjil5ZksDxl9nvuTizLTAZ8nNwMXXB9Dgum8CB
	 09wSTbCAW32h+eWzJeZ8D/PC3jdj4lmCjlOfTAC3WZTsjcztWlcHD3lySVVpyTFL+wYQy
	 TKzz8ZRGpwcs06InHvCBXqOQ3iJvQuNA0Wqjv3iNQEBprVr2ywAkVzUynlctD2Lra9OfR
	 pn3ZqxuMDIGwe7sIvNtG4FBxj14s3FuUIaQIA07biiz1jddYI7L4dvsTcai1m+x3UE5co
	 FYlrtUb4TZi9x5uJ1UzU0XnDnJY7JXVLx65KMPw4+EG6iRhAPTsm0/sDcRhhsMbHl8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XUXEvm+x/520Y7mG6qCOQoTpy/YNPEI1fZRb82iDonQ=;
	b=hNsTlTMVJJ3Rg+jSvSYgPkRMdEFPqnnJwffaf0wCWcVg1NMSj2qi/wmYlbv3FnsBrral
	 ArFcZymoL4Gsoclcfw+W3Uq4g1gZtU6j473HlaR1MRb9th3NlgEdFugLbXjRJOBb2x6Ia
	 OclHxG0+i6mgWqHhU6LZfEztIFWfFMTTEgY9Wr9YYJ/Y4Hd9emP/2Fkotu/tVnPLrtosv
	 qOzK31SbjVwKeLa15UdAPCD/9THULeSK/a7QDppzw2Of7GV/HBgimafynsSxnrLw+FUq7
	 LNW3IfkxwJfaJjeRIvoZl1/wIyVKcagEHk+Ac9wUYQGsY4ZvBEmiXSVkPhTi/zJBeTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=debian.org;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="x/baAa4G";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DB260A262F
	for <regressions@lists.linux.dev>; Thu,  5 Nov 2026 16:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0DB260A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x/baAa4G
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a210470b49so16109425e9.2
        for <regressions@lists.linux.dev>; Thu, 05 Nov 2026 08:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793896380; x=1794501180; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XUXEvm+x/520Y7mG6qCOQoTpy/YNPEI1fZRb82iDonQ=;
        b=x/baAa4G3CxTcD5dB7gEEZSj0ygXLSIvlQDBNahqBUUcSD44OoiiNpA8jTt3EQ2LRr
         487+GXeXooXPmxLyj7f1k+iTi0/RyCse/sJcVkb0QtJ+5LV6/3E+XaoiUpZlPIY/hx1C
         0b9DuSBXiZj2/qPluVOOj+0B1daYIXVNAhCDnT//g7GNwFtX2Bi8azJdoJ/42kibq+d5
         rmQECrruYehZA3/oayfO9lywVauj3JIcvIZYHH+r75LFZJZnkZVGH1Kn48L9wGi8hYqm
         wGKYJkJtaMOulX22jyPaVPEGWPimsXM85TAaxeU7WHEcVNz7IFo2Rw7OEN4J5ewJG2HE
         n0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896380; x=1794501180;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUXEvm+x/520Y7mG6qCOQoTpy/YNPEI1fZRb82iDonQ=;
        b=1kJew6qtNIeOgNwKLij3aQ+GpDIJhZLsmMZ6ck5xg1y/BIFIby9lOgNOi0Yr7laCzx
         7tXyHD9qdqee6Z8bpNR5RAoSIe+z6Ezrxas7eibCE5cKfSCCC6W7L2MU/3NdecCcKXmr
         FdAJdPHmUC/cDE0Ddx7+xm9VHHziULDPanEMsL7mgoq0T6IUAHLIejhojerKNGq5uwp1
         sfL5HOXwXpnRur1v33qL98mJ8Xdqz/Tjirs3xJNq9TDl4FqXHrB77AmXhwZ7QuQ357Gc
         bsiOoDDOk99XGc5l7knJSy/RjcnCysBEIO8zD7cMPZG23FkdknODeMMubFIedVBV7Ksj
         Hbvg==
X-Forwarded-Encrypted: i=1; AKwUvBwiPRU/KJCyuzoJCGw5oTMQ0B3/vSrrh+xMT/LtzWIsx2TqBtGijFKSIo7E9UKkTwkU4GYN65AmZmH6IA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/e6pER2PeccN4jcEHtTnJTPGkfFItGZnPfR7DRKx8tj5XCVHP6
	8mdC1Gf8nAtIzlfEuruh8erDCIFnEvxSzESgsNBqCnMZy+LRl3pZ+BLU
X-Gm-Gg: AYBFou0pHlyISlH9O7mNwtpUbe3GD7tAOrkPyWouPl4p2JVUVoVYLN7+rpihuWzIv/H
	qT5qi90sKOHsZqohXaehFG1n9AqtS32kgeX3OTgbW9RQloSLoyhvwTv7+LUwte62cx6MDWcCQrX
	dKN1QwQokG3TQpZpAAXC5E7bZi2oeGfAG7IX+9zeVKv0zMTPR9JztAnxeoFCzPP3oiVC1O/uMeu
	kyE3rw+ZsxGbef9gF5sKO+FJgz7vlFdj511lttQPsYU61VV2UBKw3Luga/p8KSo4AAoDyLTdbct
	goojy/2x9oZpIawRTkgfTI5mp9qBnwbYrb3uypOBTMEQ5BFRaR04UQlU4iGjoHTMQFhtVFa8yzM
	yrnVFEnvhyTiJnwNIqXSsnv0omVCXdvtcQwAl7bFUPui3Q4Z+7TtKf+FlQ8T4/6bN2/ZnhRavvO
	VyPgYmj/6ROF0wBj4LH3c5qnLh+8j08UdBj5pv9wJ1AgmZffVOppihBa8MCiO9utoOl2psxV5lg
	0kviamtWLH/pbTxdoK3Iw3UWfJwXn6S0Dh6z3PS0TE/yqEeGBMtyQfD4u5EDxmqE5kv1lPUWFdD
	30LXjxOfDAn9mQvYfbmMmRU0w2ndIx8iNeMbjnUM+9ywDlSVMESuviHfhNBXaTA=
X-Received: by 2002:a05:600c:a41:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4ac150b2136mr409947835e9.4.1793896379969;
        Thu, 05 Nov 2026 08:32:59 -0800 (PST)
Received: from eldamar.lan (c-82-192-247-196.customer.ggaweb.ch. [82.192.247.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22f4sm125983355e9.13.2026.11.05.08.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:32:58 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id F032ADC02C5; Thu, 05 Nov 2026 17:32:57 +0100 (CET)
Date: Thu, 5 Nov 2026 17:32:57 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Sasha Levin <sashal@kernel.org>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"eadavis@qq.com" <eadavis@qq.com>, "tiwai@suse.de" <tiwai@suse.de>,
	The Darkbird <thedarkbird@protonmail.com>, benh@debian.org
Subject: Re: [REGRESSION 6.12.y] Please backport 70b4db7d2581 ("ALSA:
 usb-audio: Use the right limit for PCM OOB check")
Message-ID: <auyvuXTfDDGcCTZN@eldamar.lan>
References: <shfaXkZCI7FtyNr5tS4kCC_d5E4uQFhc0MtwJa2CQFXpNMfSw7Ub6urwWpGrcoRnHuoneJEi9mLwtnvVImMhz1Hb25iwNJxx8GZZsDCV_HE=@protonmail.com>
 <2026-11-04-1-daily-reply-0005-re-usb-audio-oob-612@kernel.org>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026-11-04-1-daily-reply-0005-re-usb-audio-oob-612@kernel.org>

Hi Sasha,

On Wed, Nov 04, 2026 at 10:03:14AM -0500, Sasha Levin wrote:
> On 2026-11-03, The Darkbird <thedarkbird@protonmail.com> wrote:
> > Please backport the following upstream commit to 6.12.y:
> >
> >   70b4db7d2581 ("ALSA: usb-audio: Use the right limit for PCM OOB check")
> 
> Queued for 6.12, thanks.

The commit ef5749ef8b30 ("ALSA: usb-audio: Prevent excessive number
of frames") introducing the issue was as well backported down to
6.1.191 and 6.6.160 additionall yto the found 6.12.114.

Should thus 70b4db7d2581 ("ALSA: usb-audio: Use the right limit for
PCM OOB check") be queued as well for 6.6.y and 6.1.y?

Regards,
Salvatore
