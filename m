Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792928058;
	b=pwWKV2eYAmxc2AF+hVz+HOhhIurp0epbZtiL27vfHIMtXQAgNPkB9F3jy4Ub0EH7gU3F
	 cpUJ2TiFSJisKs0p0sTh84QFAlgWiXBnt7ZIGtb+E3//Z9sbmIcnncMWALNoPydLUb1tt
	 b76bAojK53CwfwLyPwgGDCYUzVF1k5s5UQghzi/X1tZQW9gB1R8Mo2hw4hyaWUqDDxEiN
	 403bh376iy86j6QOHAQzceOZaXDSYxj9hFxLdpWeKzSLvbdactrgTlFQwQux8zR9HsnLl
	 19XFwkY3aLOpThvh8NF4Ahj9SpHNWowhglGzH9CcqDg86lD6Zu9dT/7pvJoKwUlqB2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792928058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=41RAX7MgRXoDWB++MDi19DObLArHcqUImXX3BQuhLqI=;
	b=wDLCsgTyj7Xvtj6kghjRwbHU+gOvD7YwM+nr+Unm6L8sn0jiVNC+43VUQ8BaB+mv23On
	 /YICd9gBuTE1j06bsS/5xozHC+OxTPAyXdu9qJAv5L39AEOIqkkzqmd++Gv+E7VCBh7lA
	 p/zGtywU2Jrr0/8GvJkp4AQCCs+HUtkig4rwQTEBFHOGuUnqabmPDqW7x+CGbX/87w9Zg
	 zyFAFFaLMC62A/u/Zp8p02xuw7s+axtHn/A2sfkp7zjujwRAVyelZN5M4uHqs4s3PPn/Y
	 qzs9DGhX4PjyOFQLkxO5C+l+TwG+rmlT/xzcN2B7QMA16ZV2i5YRsX7wdHXtpA3D/cA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="TbRob5/k";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B37606A31B
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 11:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41B37606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TbRob5/k
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8ac4806e210so15918637b3.1
        for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 04:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792928052; cv=none;
        d=google.com; s=arc-20260327;
        b=pDmEwp6q0doQzJhTDOMZpaTocZx4YltkGHDaP9yrqLMTd7Dq7sF5al/lnwnPRxbgRH
         g2KmHKR4Cc8oFowdPQSxVTF9fZQIbRN+FCjphHdZKZFrJSQVdIT9cFTtvJz5uMJ+Qj+m
         uyJUQ2LMmkGq5bUmCAvf75d7ufn215STvy4HcGp6moVwulZTLc8QpeHLZpeX6onCmGem
         RWDIlOTJ1g2BY0UzyvKr5oTMAEpLmjRky6aqTV8GK7jpjdbRT/rWPFCIRseJ71R9f9+X
         cVnnyj/hB0s7I150rtAwtH209RjLt7A+BTt6sicYxRoCRakauMZUJdbsKffIngSXWOMB
         3B4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=41RAX7MgRXoDWB++MDi19DObLArHcqUImXX3BQuhLqI=;
        fh=w/1G4h4qs/PNfQVnc1O/b5K0lOOJHfZ92TC0jiBVvcc=;
        b=Nr6Kq9dot9kfZA12xbHw5ZcJt6eqUi7d+oHPXZcInB6a8JC/lMBsudsVB9vxZRanyX
         uRohQ0eNaMx/EqSSLKQ2Lt3YkP0rYVnu5Wc9ich6zr5yYgm2ivMvqoDz8kRtFsZQeC20
         DKjqqO+N4d64hg2dWNSYU7W46XLLSZlxUsbP9e6gF/YHKYJNKh9c5YIaFipKQ8L42azQ
         P5nRgGZ7tcTH+JsyicP7b14g6GsZ9bxYpYHAbXeEXnexHXDFkT8HC092yTeyYTiUln19
         DJ3o5dmUS5h1YmvyT+v5Pi0eccNALhkl9h2kBxBsgnJANL8pjbqxXNIwbchQqRJ8dk8N
         mSWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792928052; x=1793532852; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=41RAX7MgRXoDWB++MDi19DObLArHcqUImXX3BQuhLqI=;
        b=TbRob5/kp1nvwMWNroN9VjTLXPy8uEeApjJNRi4FUdk0j/3tCCvkLkMUFXCE+BytGl
         D7yVivDXmEJB1x2uicnEDojwG+Va7eYD4r3AAStOw52ep6YP2KB7c07Ta9VXI0kwXv39
         mhrfIbjVbl5LcJnQT5DBF8J9oDLuYeIecexflABqTfd6E4FGo8xYE5LOnl+rmdnbepLd
         JtIirWbUMEmO+WW2BaHud2uWgaV+a4Herz+cC5UzvDLUr/xO9MJKBKpd43ftrY6flX54
         qyffbWlYz2BYEDILAASlWC7xfgnSRm9jHohKHCUEUEC6Q/Upn6qVLdT27MxfRZuN4f0H
         D2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792928052; x=1793532852;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41RAX7MgRXoDWB++MDi19DObLArHcqUImXX3BQuhLqI=;
        b=RjX2spJ1GsGppKxBtoyrz0qKEmiaL8mdPQ050i29rTqNpTFq+zHhtcpO3dFXjxAXsx
         R/9/OA7ZQZVtuJq+JUSg15IOleNaBYcldvLWqbFK5ipr4USVoQpXLKgHvf3h0h2fGLjF
         2qmSpWRcT+na4EK0hxr1rnhQfsG0DIaG41B1oPE6x2uCTXc4Ey8nJOArkn/3oJLPeRUt
         JhsTNzPjav1xjMpBruyiIaT8RuTBsRDt60DIoVz7ZUZFI4dwz4MLscdWT7Dhmmz83ecO
         jZLUGdYlOfU9Wk/U7Rlz1RgVSNwtoCwf64yyJXoWIVY+OYBO/q9vS6rjAqQhPC+PhdLb
         UkLQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2nKARjaX9eSupprFaIWC5pS/TJYyi83LkBlIS7lLnG15RP00O0KVpF7erX/aU+nq14Xy3QuIRgbFuYA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKkKqvacscxnXAyt31D/nLgABCAgxn2OZuF9v8mgCxMgcCaQ+nb
	XyJSWhIAZ9z4VY1m5/0idNUX5m5granezDlg7TW4b6wJU7FbaPw2aJ4oiXEhn20ZY6CjnttP46U
	2JcqYvpM5sGdcw0HOG+Wmmd5m2N7scFU=
X-Gm-Gg: AYBFou2UIOGaRTIPZRwrQQgrm3/Cj6HyTJlDD4JTaGDywqNy1FULO4fM8bsWvf3/vNI
	VMdUrIl9aRspzi0jDw2FY+qtwdp+GtTWIzRUWf+2+1OUWmnui0muZxaxa1af3RX06jBTARNu5UC
	jhutnm/GApEq/+NUNd0zWNFYdPq8U10Vjxyv6I/GK3QjR6jjh0z/FVFPwS28RNHELxZGJ6X4sxL
	/W0tc+/SLglhlyOqBWJEC4ZIWMya4bVxV3QAuYG3s7Xt32KtffeYg+QuMCar2kqRgymdfpOI7jL
	xlghLAnSzHrKzShWrfgrK9oXcceM28953xGB1baYuKbJ/bkUGetyNd/PqtzwZrQC9dDf67LW2Uy
	AgF46hEqUUDUDIeKrgNrj1PEbVjz2OgY3PVwp4z5Z24iQToeS1ZJZRrssR+xxo9J9UHO2de8GNg
	/SeGFhpkvFqHnQ3TRz
X-Received: by 2002:a53:d209:0:b0:679:c916:46f8 with SMTP id
 956f58d0204a3-67a4543dad9mr1944040d50.64.1792928052316; Sun, 25 Oct 2026
 04:34:12 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAJOGg3x1KWjXrMpXoCDEMAV10i4Utk8E+hoJx7UW6Lr3uDkbEA@mail.gmail.com>
 <e46ea453-5a56-4009-8b33-900166345905@gmx.de>
In-Reply-To: <e46ea453-5a56-4009-8b33-900166345905@gmx.de>
From: Julien <julien82453@gmail.com>
Date: Sun, 25 Oct 2026 12:34:00 +0100
X-Gm-Features: AclHuK-6yDmRDYnA6QItL78V10sOajvI8R4QtWENajW4D3u6F8oIBfkKhlNG-ic
Message-ID: <CAJOGg3zRpJeaoZh=bSqcH7w4exu1Dvcwi73WRBEO0sfbFrpqKA@mail.gmail.com>
Subject: Re: [REGRESSION] hp_bioscfg causes boot failure on model HP Laptop 15-bs1xx
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, regressions@lists.linux.dev, 
	jorge.lopez2@hp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The same thing. The system hangs as soon as I load the module. I think
it is a firmware quirk. I'll try to dig more in the next days.

On Sat, Oct 24, 2026 at 6:01=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 22.10.26 um 16:29 schrieb Julien:
> > Since commit 467d4afc6caa ("platform/x86: hp-bioscfg: Fix automatic
> > module loading"), the hp_bioscfg module is automatically loaded on HP
> > Laptop 15-bs1xx.
> >
> > This module causes the system to hang during boot. Blacklisting
> > hp_bioscfg allows the laptop to boot successfully.
> >
> > Sometimes the screen will go black but there is no kernel panic
> > screen. When I get to see logs, there are no messages related to
> > hp-bioscfg. I suspect the system crashes before it can display them
> > because on a normal boot the next message I would see is "Module
> > hp_bioscfg is blacklisted".
> >
> > I think the hp_bioscfg module should be disable on this hp model until
> > a fix can be found.
> >
> > #regzbot introduced: 467d4afc6caa
> >
>
> What happens when you load the module manually after booting the system?
> Does dmesg contains any interesting messages in this case?
>
> Thanks,
> Armin Wolf
