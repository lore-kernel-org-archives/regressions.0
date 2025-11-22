Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCEC27B359
	for <regressions@lists.linux.dev>; Sat, 22 Nov 2025 16:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763830666; cv=none; b=COqBlwsnUgONBK8KbEl+0fLUkZzIoSPgLmVuMebt17mtjM0o5oLhcs1mTAOe0j7zFovHD2pPE19DyY4BxkkoEMVGufQA5yYAsP/mYItoO0uASAt9Dxg8JNUA7aheLlni/zHkhJECuLg/nEMnmKlI5MOvgJH3MumHBCwhZ8EVlHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763830666; c=relaxed/simple;
	bh=fs2lYtrZNV3KZp6UxTLBsAy379d9ku/fF4PuWVPTvRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+UpR+ZucftwLhY6vWoFwH8CEJ4w2THHOeNaGawUcY9gVMezPcuVfDXk/5h918vT3hXi/PdcGOJctkhTD59wUuiYtWlQTAjoQ8ICfhBp951bJABS5KrcvSlw7PPnq972aengFSUq25+Qd0tFmpEes/9QMCAuPDDghH4XxyfOdAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G94wuRM/; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G94wuRM/"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so4305026a12.2
        for <regressions@lists.linux.dev>; Sat, 22 Nov 2025 08:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763830663; x=1764435463; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OUGVg+qzpVBZ5O3rUCAbdonkufD8EHD+NzO79QMHoU=;
        b=G94wuRM/0W6aXnsCi95BLthnr2WLIWleAyC13IYHS20dyUlop9dGvkWeZiUpQRELRo
         ux+LlT5+2AjLbbKl3jgbfoxrdEnjwJ3lb9aID8IB2P+FXiml6k1fchGfPybcdMFw30IC
         OjrsqbO2AbPl4lnSUcb7NRr+H0AC04PTbrxKTRtim1ETr8zUPCBkFN8HaLTxkv6y21rE
         DjEew9nJEFcYyvNen+Y19/ADj+jb+uDt7cnc4bMY0wg4EbvvtbZ4ZWMl7xMOViYPeAJh
         KsYVcAJSeuGRBZ9IRiP18y7u986E31JDwKOdtQuOoZRJcNLJdjH58NRRLmWgptTPuncr
         hVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763830663; x=1764435463;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+OUGVg+qzpVBZ5O3rUCAbdonkufD8EHD+NzO79QMHoU=;
        b=Z3ItZ3wJdfiWI97woAI4YDzriiX03PV5eZhFwEh9AyFhqXuhad3gFGfEUCJf42k5wh
         vnfFL0FouziHI2uwkfKiIfpJgcYg5gtVXV+TA8+PJwbhsMI81gKF1rLZrvHS36z4BYVr
         kYBBOD4aVIWNZ9gRh/eKhlKoSknOmlQiCyL7KigiTqPIvCUYrgI+6BA8VMekzER0V9cU
         tlt5GaWvrPDZZRw9xPlFc4bLABXxnsEOoEPkRjYBANXPFGbw8rwp90kolgVrSnKDbifa
         Nvlsbe6MsySAplK97TihDF4pu1TZFH2V9BTG9Y+li0A+oY7AaXi541RdA5Eq0oJEUy6T
         yECQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdSGojTOnTWZfv4kEHlklCiy9Zy98tM9N1MUWE+TqygEdmBgl+TpluPNZvEYjEQPtl1RT9I+rSA2scXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRpkotGmGffN2yFOgtbxMv1yu+0lzLwgk5APT8l8mRQIdhv8/k
	7NzB+TgqA21O7n/FwbaPRyW0jbsiSYeLfScQEdMUdV2qROmeO+/hstjO
X-Gm-Gg: ASbGncuIVHYvGGzzwxYbu0+dRfjRdxCaCBe5YlF8Ee+cBriWxYTUwClLaVtF0aaOH2M
	Rz+RbhQmdEDqgUe3nTD245hYxbZrtX0oGU5jTEC0PLjsCUOkWM4E8MU7rCxIM0ayVe8JI+l1tmQ
	KXRHVkpoWtx6ivptXpDp7p7tZt3Ni89ArU3MdfjJAE6SU831b46F2vp4MBO3ibkcVRAHAKm2F91
	P7ws7A67ZOOYrnqtYyj70ZjcdqqsOVGrzU5UupZH61XiPq77gmCkx/hSuxR+dvYq8RSkSRG7b5s
	FsaAdj94FFm077hP6k6qlKWQForTWZ1nSglYf7HL0ynXBkPVKVZbvlCka7HBr8Ws/Gt/9zPJcvE
	qjy1+J3JLWqS0Y/w/7ZNzoOAO3dJuJuDY5a4esww+THdZ8kKvWU5z6ME9un92IugpIkk7ArFWnn
	/dFs/R9twgx0gfe8dR
X-Google-Smtp-Source: AGHT+IGQR2K+8oB9rl4LdszDdgZ1zAbDRGTLWKw8HJ6tmpfxZcxiuNPJ2kqkhKPL+e7MCjq3lfauqA==
X-Received: by 2002:a17:906:f58f:b0:b76:26bc:f95f with SMTP id a640c23a62f3a-b7671244c1amr573051266b.0.1763830662444;
        Sat, 22 Nov 2025 08:57:42 -0800 (PST)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7654ff3987sm782530866b.48.2025.11.22.08.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 08:57:41 -0800 (PST)
Date: Sat, 22 Nov 2025 19:57:41 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, piotr.oniszczuk@gmail.com,
	rtl8821cerfe2@gmail.com, stable@vger.kernel.org,
	regressions@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH rtw-next] wifi: rtw88: sdio: use indirect IO for device
 registers before power-on
Message-ID: <aSHrhbt29k6GJB8e@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
	piotr.oniszczuk@gmail.com, rtl8821cerfe2@gmail.com,
	stable@vger.kernel.org, regressions@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20250724004815.7043-1-pkshih@realtek.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250724004815.7043-1-pkshih@realtek.com>

Hi,

This patch was recently backported to stable kernels (v6.12.58) and it broke
wlan on PinePhone, that uses 8723cs SDIO chip. The same problem
appears of course on latest 6.18-rc6. Reverting this change resolves
the problem.

```
$ sudo dmesg | grep -i rtw88
[   24.940551] rtw88_8723cs mmc1:0001:1: WOW Firmware version 11.0.0, H2C version 0
[   24.953085] rtw88_8723cs mmc1:0001:1: Firmware version 11.0.0, H2C version 0
[   24.955892] rtw88_8723cs mmc1:0001:1: sdio read32 failed (0xf0): -110
[   24.973135] rtw88_8723cs mmc1:0001:1: sdio write8 failed (0x1c): -110
[   24.980673] rtw88_8723cs mmc1:0001:1: sdio read32 failed (0xf0): -110
...
[   25.446691] rtw88_8723cs mmc1:0001:1: sdio read8 failed (0x100): -110
[   25.453569] rtw88_8723cs mmc1:0001:1: mac power on failed
[   25.459077] rtw88_8723cs mmc1:0001:1: failed to power on mac
[   25.464841] rtw88_8723cs mmc1:0001:1: failed to setup chip efuse info
[   25.464856] rtw88_8723cs mmc1:0001:1: failed to setup chip information
[   25.478341] rtw88_8723cs mmc1:0001:1: probe with driver rtw88_8723cs failed with error -114
```

On 25-07-24 08:48, Ping-Ke Shih wrote:
> The register REG_SYS_CFG1 is used to determine chip basic information
> as arguments of following flows, such as download firmware and load PHY
> parameters, so driver read the value early (before power-on).
> 
> However, the direct IO is disallowed before power-on, or it causes wrong
> values, which driver recognizes a chip as a wrong type RF_1T1R, but
> actually RF_2T2R, causing driver warns:
> 
>   rtw88_8822cs mmc1:0001:1: unsupported rf path (1)
> 
> Fix it by using indirect IO before power-on.
> 
> Reported-by: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
> Closes: https://lore.kernel.org/linux-wireless/699C22B4-A3E3-4206-97D0-22AB3348EBF6@gmail.com/T/#t
> Suggested-by: Bitterblue Smith <rtl8821cerfe2@gmail.com>
> Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
> ---
>  drivers/net/wireless/realtek/rtw88/sdio.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/wireless/realtek/rtw88/sdio.c b/drivers/net/wireless/realtek/rtw88/sdio.c
> index cc2d4fef3587..99d7c629eac6 100644
> --- a/drivers/net/wireless/realtek/rtw88/sdio.c
> +++ b/drivers/net/wireless/realtek/rtw88/sdio.c
> @@ -144,6 +144,10 @@ static u32 rtw_sdio_to_io_address(struct rtw_dev *rtwdev, u32 addr,
>  
>  static bool rtw_sdio_use_direct_io(struct rtw_dev *rtwdev, u32 addr)
>  {
> +	if (!test_bit(RTW_FLAG_POWERON, rtwdev->flags) &&
> +	    !rtw_sdio_is_bus_addr(addr))
> +		return false;
> +
>  	return !rtw_sdio_is_sdio30_supported(rtwdev) ||
>  		rtw_sdio_is_bus_addr(addr);
>  }
> -- 
> 2.25.1
> 

-- 
Best regards,
Andrey Skvortsov
