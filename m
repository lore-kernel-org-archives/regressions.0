Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9E12F5321
	for <regressions@lists.linux.dev>; Mon, 24 Nov 2025 23:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764025717; cv=none; b=rJWc9D5rSr9OR6iyhoTxz4hbMfN+Sj7Kmhi8Hdov6Im8+r7L5Rr2l+QBf3uBen755sADUSbhcq4uLODpeHnQoXbfcgyVOfIlVF6ObuFuIEeorid8n0f75asBmdlPtTSgXsieO78izRA8VnqqTlEB+RDpIj6tBYTiVLy3AJ8rp98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764025717; c=relaxed/simple;
	bh=bka4Ok+xY/vHf8rj5t8CVxoP4nJIrCSCQdt2nklsCog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QI12LTIihIIC0U/QTE6KKdQGNGmCF/6VDrUQ4qgt8AVB6009ULB55EUy4uzSozs0s6jwSmwiArg3nLLFKWpcVGc8xvhOmrlrDr/S0Hjlcdltv6JLKX3iT2OyoQIpP/dkzTACFVGbS8diQGm0lRco4rzhPK9Kx0Q4AxQH7TKabDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pw6D5PTO; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pw6D5PTO"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so6714470a12.0
        for <regressions@lists.linux.dev>; Mon, 24 Nov 2025 15:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764025713; x=1764630513; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/WHGJKwl1pNV1oMFP/7W/iGcAIvgG1g+5RGn0OeZ18=;
        b=Pw6D5PTOaHpJbitRLAsfmWOrcvcRnb8o+EWhfuYgrpZSVonqim7lW+LTr9YJL9B89H
         UBP25+Ocoa1PZ14FS1qMlcI2i31flwlYYjbXI0chzaMt7jd5Ni6qVjsQhl1a8wworV0P
         GboDppJt+z3s9Nvk641aT4kJhsUFZ0YZ/QCVCVE4ou9fhpjLQTKXLHtmaShn8QSr9rNF
         pqCUMpvJQMWU6bJ0nB8LDaCVLYKBqJdy1gF0JhxmG+NEUJn/qS9ScQPZxj02Pwr1ALdm
         z3psMphMyditTV8n4gtRgASJzR7UGFQT6KeyUPnp6wgt5klcVQ7ViByMUKl9s5qWT16w
         SC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764025713; x=1764630513;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/WHGJKwl1pNV1oMFP/7W/iGcAIvgG1g+5RGn0OeZ18=;
        b=e3wKtKAoNgjHwB1dXSNLpBAarJPC9h6CUjWCnK74LHVF+fknmcjV0CglXniBn5WIXM
         kTz8OrpcVkcen/uv7uB/cKQeb5SpPrfY1RvX1nJSXDYqP2iL++MDAxUJbqAfVKa8M1hg
         5QOV1zl0gzWawfE5VYut8NUAAVD/DiyYmk9a8scGtJsaKqISgJOfJwoMuojRZDEqkQpx
         YGTiBWQ/lMU3JXxIDQmCiVzzGa+6PnFMZeyqy/x0z8RHGEyKs0/IUxOmh4BgNyNrwNG/
         TshiCTfln0G0DIYT7yEEAFauHEOGVmRWUwdLU4tgfwzPo8syeD4Z7+pU+R6pnKdyUpze
         Jt9A==
X-Forwarded-Encrypted: i=1; AJvYcCXVI1Jj3eiLSsnHhkArJn7F2r+2aOKZEL2/RJ7J9Qq+gRU/gvy7XVfT9UJ8KOC1d42Pfa9y5TQTA8m/wA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwioZ/eNxjiy9mG83fy+7qg3TKTAleXWehW5Eq0rc4zSgX6BlmS
	aYGieHVKzCB8hsd1VZ/dPVYfcvHqDWKoYkLjVLr9cqRduOkfTUNPCAy+uqwanA==
X-Gm-Gg: ASbGncuxk5hAqjwC2Ftfv2J6tbQoRebS0bDP8FiXJvdkWGsufGsxRKFpZegI/WN2q1T
	mIMUrkOAGmc/KbYNF9yV0tYnaptHHc1/Kk2sEcliR4MTVLntj6Xd8FUVahKSxMnj7/BYYlIovLO
	L0OjLg2K+TdgM6dtPiReu2UHXOgV2NC6a8gifI3i07CIJXEYpHSKg9fS5u+RaM3fl8re1Tpgc64
	Gbjj6H/oh5DiIdgGF+AmMLYQKtH2OJM5IQWGTuevgMUea4QSQVIfPDl/UZOEV8VxDR+piIzejp0
	dxFZ7cgsa7fpg6bdZFRzoOAR9d/SXIGS66T1/GAoP7xcJiWYf2OqlVUmcWI488/fYgEKfH233Tf
	nIEwgaBcUXOcZlVkU9jTxaez29iKJdwAW2CEQUlBExgzoLnt5kQ8ncvpUb6WuodOhPatEt53PXn
	/bjZ24c8mQLcnJ36me
X-Google-Smtp-Source: AGHT+IGGQZRvEPE+V692/ByODBIStowiEq4wuN3gXmgZ+FT8xM6RPK+LS1vzrQ+0Ru/xT8SeNfVF0w==
X-Received: by 2002:a05:6402:51c7:b0:643:c8b:8d30 with SMTP id 4fb4d7f45d1cf-645546a3a94mr12871488a12.30.1764025712967;
        Mon, 24 Nov 2025 15:08:32 -0800 (PST)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-645363c56a4sm13295513a12.15.2025.11.24.15.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 15:08:32 -0800 (PST)
Date: Tue, 25 Nov 2025 02:08:31 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"piotr.oniszczuk@gmail.com" <piotr.oniszczuk@gmail.com>,
	"rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH rtw-next] wifi: rtw88: sdio: use indirect IO for device
 registers before power-on
Message-ID: <aSTlb1TEwNaFbdFf@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Ping-Ke Shih <pkshih@realtek.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"piotr.oniszczuk@gmail.com" <piotr.oniszczuk@gmail.com>,
	"rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20250724004815.7043-1-pkshih@realtek.com>
 <aSHrhbt29k6GJB8e@skv.local>
 <4562797ed9514344b562f7a8e58e6988@realtek.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4562797ed9514344b562f7a8e58e6988@realtek.com>

On 25-11-24 08:16, Ping-Ke Shih wrote:
> Andrey Skvortsov <andrej.skvortzov@gmail.com> wrote:
> > Hi,
> > 
> > This patch was recently backported to stable kernels (v6.12.58) and it broke
> > wlan on PinePhone, that uses 8723cs SDIO chip. The same problem
> > appears of course on latest 6.18-rc6. Reverting this change resolves
> > the problem.
> > 
> > ```
> > $ sudo dmesg | grep -i rtw88
> > [   24.940551] rtw88_8723cs mmc1:0001:1: WOW Firmware version 11.0.0, H2C version 0
> > [   24.953085] rtw88_8723cs mmc1:0001:1: Firmware version 11.0.0, H2C version 0
> > [   24.955892] rtw88_8723cs mmc1:0001:1: sdio read32 failed (0xf0): -110
I see it fails with timeout on the first operation to read chip version.

> > [   24.973135] rtw88_8723cs mmc1:0001:1: sdio write8 failed (0x1c): -110
> > [   24.980673] rtw88_8723cs mmc1:0001:1: sdio read32 failed (0xf0): -110
> > ...
> > [   25.446691] rtw88_8723cs mmc1:0001:1: sdio read8 failed (0x100): -110
> > [   25.453569] rtw88_8723cs mmc1:0001:1: mac power on failed
> > [   25.459077] rtw88_8723cs mmc1:0001:1: failed to power on mac
> > [   25.464841] rtw88_8723cs mmc1:0001:1: failed to setup chip efuse info
> > [   25.464856] rtw88_8723cs mmc1:0001:1: failed to setup chip information
> > [   25.478341] rtw88_8723cs mmc1:0001:1: probe with driver rtw88_8723cs failed with error -114
> > ```
> > 
> 
> Check original link of this patch [1] that 8822cs read incorrect from 0xf0
> resulting in "rtw88_8822cs mmc1:0001:1: unsupported rf path (1)".
Sorry, I haven't meant, that this patch should be reverted. I see,
that it solves real problem. I've meant, that patch caused this
regression was identified and it was confirmed by reverting it.

> I wonder if we can add additional checking rule of chip ID, like:

I've tried suggested change and wlan is recognized again.

> 
> --- a/drivers/net/wireless/realtek/rtw88/sdio.c
> +++ b/drivers/net/wireless/realtek/rtw88/sdio.c
> @@ -144,8 +144,10 @@ static u32 rtw_sdio_to_io_address(struct rtw_dev *rtwdev, u32 addr,
> 
>  static bool rtw_sdio_use_direct_io(struct rtw_dev *rtwdev, u32 addr)
>  {
> +       bool might_indirect_under_power_off = rtwdev->chip->id != RTW_CHIP_TYPE_8703B;
> +
>         if (!test_bit(RTW_FLAG_POWERON, rtwdev->flags) &&
> -           !rtw_sdio_is_bus_addr(addr))
> +           !rtw_sdio_is_bus_addr(addr) && might_indirect_under_power_off)
>                 return false;
> 
>         return !rtw_sdio_is_sdio30_supported(rtwdev) ||
> 
> [1] https://lore.kernel.org/linux-wireless/699C22B4-A3E3-4206-97D0-22AB3348EBF6@gmail.com/T/#t
> 

-- 
Best regards,
Andrey Skvortsov
