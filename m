Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627414;
	b=VjeCjxWGgLwldmhDo64tdT+aiFCF/9tS2bzR5+fb28CeUAkEfe99+YLUQIF/dwafcryd
	 AYGixRUoqLdNHXIzXy3i5CxPALwUn+o5mvC7grqrUnN0tJODlQcYB7zcJZNMdAAUQl6Rr
	 QC6l8RO/Q69z3usxpDb+nHF6EOmL/fqetV2Fu43Sk5dGszjqWvpWYOH9Yx8JFqrrtyCvM
	 /zOgAWhYH8gesMy4SKVQXZBTYtVWiWCehQaF0XNDoBQXEZ/36szFJQfGOsWGe66sKmWlR
	 p/jYYFUwKdi2qg93jKtMEYUQ/MgK0/JlGL3FpPnx7C9cLgHs/OB4aXngTuB4CROTCpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627414;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=3a+9UrHFnp0GCYUcXwgUcuHkUgb2iyxD30t2rDDa9ak=;
	b=WWuS+4sgCBAtUKTOy2hpeYNeir8g+rkrNOAWXQWlhoir4hTYjUilsQl7S+b8fFmDtdAr
	 LrUY5ggR4sLKIT+NTxNdstlTbdE+PpF0VuZg/9UnVLfEBuvDKUB418QN/l+Mo/70i68zi
	 /Jf7SFxONV37FVluv9vZXDm01geHnHuY1Cr8R43kgRKEhFLTPOqQAzgfRDMKDluj7kWR7
	 0dgSeHEidd6uo3OA46Yp8V4daicgnqMd3KntewIaDc5fev73OxQkW7goWpaC1jMG8eCWg
	 3VoV9gHQMazTeoGNsgDDeOCeLRGyxHE3YV7TMXzo4L7h6yDHd2f3IiT318+G1DS36wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=F8ckFeaN;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BA8606A337
	for <regressions@lists.linux.dev>; Sat, 14 Nov 2026 03:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6BA8606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=F8ckFeaN
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso754740a91.3
        for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 19:36:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627413; x=1795232213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3a+9UrHFnp0GCYUcXwgUcuHkUgb2iyxD30t2rDDa9ak=;
        b=sjgoWa3WddjicXL9qtJ10J1hgy510nZqCqXtQ/TxqqqyhagsQSlZSRFU2OfCKj3ztZ
         QJ/N+55t1d7vDw+IqXgxOhr8xv0CaOvU6HP5Cvw3lzfdcpj6V0uH8MoJXAeExxBDNM4+
         96QJyF7qhnsm5f8BG5nTvC0FXJzgsMpYb7kPTHJaorYtyjVYEW7nxO3V2xXOWPM+JXTG
         dEvHVNiibxQlafOd7DQ2221cyrUuEVAbLQlZprGHRsjdxedq9dhi+STth3clS9eOZT7J
         UlFgKpgTAw+6F2xw0kZwW4jMY+ngY9Hux8JWCoCTV3Cq6gY9CTxxOuRVEfGqKFzYnuFd
         lNkg==
X-Forwarded-Encrypted: i=1; AL+hErGA4MkQFciAidqw3yglRr+vCbyPPWqL8JEL0Q6GEIgjxsnzBnBd/m4yfyxPX4oAk9c5NQwnCWzWYHBmyA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+cDawLaCI6uyqsrp3smwRySC5eJc21mHcd3R4NT6zyP2hlPPrb
	TZNFcpQvzj5eXS0NsoBJ4fF1O9Ik+3jtIYTQ51PYO1GfuFGxv+lSkIAZerVpgKZEpwcOFsghv7o
	PGuAk9TMWuDjVP0oXi1cdL/Rt8ygMEZ9KznyDQ5015V3lZqY3eYDTVhKsVa2hSb8xHF16yx+N6r
	PurrGsam5Zq7DzgvGfnQWnx5cb5wOsAJrdbznQOaWqu+i7MBGZ0LX/Vz50Ze+6rs6b1KFzCULlo
	fs1KufnIK4bUIj5ztkczzc=
X-Gm-Gg: AYBFou3MUMR2CCAEc02XLVKYBuYPjoYoHU0MTEON2DQW81H6nXYoE84rGJtE6XFyldH
	ijF46leBSj8YqKzHyEFImRq68BdEg2u2h2jIFLBylYhPzYraIZAbwTfTfA00mf2UW3J5/N9iJHN
	06ImABxay7QH8vOzSM2DZ9ztckermgA1cVOe2n183S18Xe/wxcD/0koNJqRS+35gkKFukO4Q7Kk
	9kMNBs8iPHnRuTE8gk7JfzZ0+tR1uEE8ZR0e1lLT6Bwi4htebM5BOEwnNVTb//L502iUEELanGd
	1Lq4xe0AeBdP/Pfu+9KXz6vOVPETsUJd+tnQEoH64f7y5lWjxyhpAROCjLI2DezG0HC91GynCII
	sC6VXXIkbz/a1qK13AkKZVmCOKyRGHzYhm72Bj8TeYpjkt9s0xLMvqIWEl5O5+p/VpPfmlOGNfi
	zhRyMipO4pAwUoRTDIclTgRufMjdp/PuWvr3Wscy9+
X-Received: by 2002:a17:90b:530b:b0:3b0:968f:fdee with SMTP id 98e67ed59e1d1-3b1b0b63d0emr4640327a91.55.1794627413195;
        Fri, 13 Nov 2026 19:36:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3fbf607sm2582914a91.4.2026.11.13.19.36.51
        for <regressions@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:36:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37549877380so2079536eec.0
        for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 19:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627410; x=1795232210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3a+9UrHFnp0GCYUcXwgUcuHkUgb2iyxD30t2rDDa9ak=;
        b=F8ckFeaNZhPzGGcCIPjtcGXTaRZrjY2+FjDM7mQeU6v/fnAjg5dtTtbOwyOEzJjoeu
         I56XHXeVHe2/zskLYT3Ep3Pe+T8USdT+SRsvd1GzakkPT4FGInN+t5YH8awZHdYhnDK8
         8B0wN8GVqbVkuTub8g9/NaSsHAToFIzCiWhOs=
X-Forwarded-Encrypted: i=1; AL+hErFs5cmkGvPgLWlkyPH0W1ADnUdLvtGu9LYgJYcg6QfZjydhcoL0lcZ7V3DHPJO2ggUw1pNPj+M+/m6Gyw==@lists.linux.dev
X-Received: by 2002:a05:7301:1506:b0:36d:394d:e690 with SMTP id 5a478bee46e88-37969089a16mr3722061eec.40.1794627410027;
        Fri, 13 Nov 2026 19:36:50 -0800 (PST)
X-Received: by 2002:a05:7301:1506:b0:36d:394d:e690 with SMTP id 5a478bee46e88-37969089a16mr3722036eec.40.1794627409340;
        Fri, 13 Nov 2026 19:36:49 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm11532824eec.6.2026.11.13.19.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:36:48 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Martin Wetterwald <martin@wetterwald.eu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>,
	Kees Cook <kees@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
Date: Fri, 13 Nov 2026 19:36:47 -0800
Message-ID: <20261114033647.876683-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022082927.59030-1-martin@wetterwald.eu>
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com> <20261022082927.59030-1-martin@wetterwald.eu>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 22 Oct 2026 10:29:24 +0200, Martin Wetterwald <martin@wetterwald.eu> wrote:
> Since 6.19-rc1, with CONFIG_BCM2835_VCHIQ=y and CONFIG_SND_BCM2835=y
> (both builtin), the sound cards bcm2835_headphones and bcm2835_hdmi are
> not detected anymore (vc4-hdmi is not affected).
> 
> dmesg shows:
> 
>   Driver 'bcm2835-audio' was unable to register with bus_type
>   'vchiq-bus' because the bus was not initialized.
> 
> Since the VCHIQ interface was moved out of staging, its bus is no longer
> guaranteed to be registered before its client drivers. bcm2835-audio,
> still in drivers/staging, registers at device_initcall level and now
> runs first.
> 
> Register the bus and the platform driver at subsys_initcall so the bus
> exists before any client driver, independently of link order. The
> platform driver probe already returns -EPROBE_DEFER while the firmware
> is not ready, so probing earlier is safe. When built as modules, this is
> equivalent to module_init() and nothing changes.
> 
> Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
> bcm2835-audio both builtin and both as modules.
> 
> Cc: stable@vger.kernel.org
> Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
> Reported-by: Martin Wetterwald <martin@wetterwald.eu>
> Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com/
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Tested-by: Gaston Gonzalez <gascoar@gmail.com> # Raspberry Pi Zero
> Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/fixes, thanks!
--
Florian
