Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6E6481CD
	for <regressions@lists.linux.dev>; Wed, 29 Jan 2025 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738157222; cv=none; b=J/BFte/jZdi0bCoweOegfZuo15v58oQI8KjqjX0f1eelcxdH7i5QueQUjslpZHRALFyCQ6zFneXcZyW4ofgGFPQDQs6Lgk0+mTH/b9nagOMgac3PolYkESBarvASity4rcrh02K9+CvLpir8QDb6KLBYaSjQ8ziLzoO2L7R+cJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738157222; c=relaxed/simple;
	bh=vTDINCiRBxaekMrOb6BZs/h+YziYyScq3RpLY4pL2KA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fz3e1xQQCVaKkjpQJaUSvMAlSkq95e4MbudwbweHOU3kZB8YjeC57zUnJcTloN7GxBwVthnlgnGIiO7poWRm6R6+i/2j79sYLRz3qSCn2B/nlZv0Eg4lMtVrs+ctNbEER2sdQpIEqqFCVT4XSl/SW/s6ztK8cNHq/WSmpEskoWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz; spf=pass smtp.mailfrom=sairon.cz; dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b=Zw5InfOI; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sairon.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b="Zw5InfOI"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab2c9b8aecaso1229552066b.0
        for <regressions@lists.linux.dev>; Wed, 29 Jan 2025 05:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sairon.cz; s=google; t=1738157218; x=1738762018; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P1AbvNPaQMoifFQQCiC1bN6VMg84HcFyt/hG9Cu0Az8=;
        b=Zw5InfOIvgXlooUp94lCVq82vVpPe9RoDkXlg7lL2Xa2LgPZ8GsHK3p/xL3/tdxBn+
         csVGcYn54Kx3N0oBgx11EpH2P7TbaO/RivVNbQg3E0C9tbTPyIfZH9hnRjLygeaiPJc9
         Rp7ymtMBex/KuvgXgaw59DOKnPXa0NPp0xXCbAd+YCmzsgpRellffvxDaUSZcHlQG9Y7
         mDUjhE3yvN4JH0R3oKetqs7RMsDtJeIWbQP+HMzcLbd9eYuUaHW3ZqbW4vYKjcQFSlFh
         7jiGjEP8L3su82UZWcPm88XPu/TkJvhqHlt8Oh/WH32rjMcM4eut+XfUuexpbTnVThT3
         yCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738157218; x=1738762018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P1AbvNPaQMoifFQQCiC1bN6VMg84HcFyt/hG9Cu0Az8=;
        b=D3RmWnHt0OYzLX/D7JjbqY+bQrlUCgZEEsI5cwDA9dXcRMkOVGv25jEc7XOml0vdUt
         MmG9yp1pJ3uFpWIsWjBhUreeIhe1ugWkkaEyW4bcTwNshEvGpHcDsXOBfU0JZ2qGX6A0
         t4q1J6MJvOuZo281HxVsFmv6HdYgiag3UCRQiYVcKmXr3FexQEl6Y+R4cwtJtk08QXC9
         wlFVtjquI+cDLloaHjOWix6XRBesbFEyQohBuyCvExnUJz8fsa7EJaECAPOYzjYqRqS3
         XDyz9CSI3wDsXE2hnBx84iQO1p3/XolNGqckADw58vZxU6nvGdgg8BtLuA3qH9eksIm7
         BcIg==
X-Forwarded-Encrypted: i=1; AJvYcCXztdyxROVACozulKcU1d+eDZmEDSI5niEagNwUxh+LHDZzUp7pGUmkUqFujrvC1h8qa5lOwwyOZFzwaw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCQsisqF9C4ew/ep3MgmvlcB9IOd+NUe5h61eVJGXBYbzoT3ol
	yO+zSjT+N/1I5jyzo4niVLUw3KYgjg2PljVJCztf0wKNV2k2+2Uw7Yd/bdauy1k=
X-Gm-Gg: ASbGnctzOz7JIHCwBDa1dt2gQwYBGt+oTKVwTAgaZgNNG3TqHja33ExZbOSHsx1qZZ5
	DBSvpJcHZyUKOAogAUCQrx+3g9IJo1wHxhrhnzFRaQFp/oBOlyWaNxv8EE8XJCYzFxpqlsfRPYD
	NyDpFiaZ/nkf0SDGwDATlyifagl7ZHmaWaNHBnY5T8fPLZb2Dh4iY01ThveGlAB5yMhNBdrTa8c
	QCAAk7NWy3RAXd6wuuSuWbZrCHPa+B0vuivBU2AdrcAEYB7I8tsORSRDeS59Okj03IOhEoUnqx6
	cQSPI4X30BbcDESS8pjG+UaOjK0XPSX4QssjYlijjA96zjkm/A==
X-Google-Smtp-Source: AGHT+IHJI8bqFau56cRcwoE0ggaS89AYsius0QpW1N4tIMlpH+cDPPATglA+S92Nicn+VDCPHuzmMQ==
X-Received: by 2002:a17:906:1853:b0:ab6:dd6b:c337 with SMTP id a640c23a62f3a-ab6dd6bc372mr10177766b.10.1738157216178;
        Wed, 29 Jan 2025 05:26:56 -0800 (PST)
Received: from [192.168.127.42] (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760fbb59sm969084066b.132.2025.01.29.05.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 05:26:55 -0800 (PST)
Message-ID: <91993fed-6398-4362-8c62-87beb9ade32b@sairon.cz>
Date: Wed, 29 Jan 2025 14:27:05 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [REGRESSION] USB 3 and PCIe broken on rk356x due to missing phy reset
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: FUKAUMI Naoki <naoki@radxa.com>,
 Michael Zimmermann <sigmaepsilon92@gmail.com>,
 Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, regressions@lists.linux.dev
References: <20241230154211.711515682@linuxfoundation.org>
 <20241230154212.527901746@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
In-Reply-To: <20241230154212.527901746@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Greg, everyone,

unfortunately, this patch introduced a regression on rk356x boards, as 
the current DTS is missing the reset names. This was pointed out in 6.12 
series by Chukun Pan [1], it applies here as well. Real world examples 
of breakages are M.2 NVMe on ODROID-M1S [2] and USB 3 ports on ODROID-M1 
[3]. This patch shouldn't have been applied without the device tree 
change or extra fallback code, as suggested in the discussion for 
Chukun's original commits [4]. Version 6.6.74 is still affected by the bug.

Regards,
Jan

[1] 
https://lore.kernel.org/stable/20241231021010.17792-1-amadeus@jmu.edu.cn/
[2] https://github.com/home-assistant/operating-system/issues/3837
[3] https://github.com/home-assistant/operating-system/issues/3841
[4] https://lore.kernel.org/all/20250103033016.79544-1-amadeus@jmu.edu.cn/

#regzbot introduced: v6.6.68..v6.6.69

On 30. 12. 24 16:42, Greg Kroah-Hartman wrote:
> 6.6-stable review patch.  If anyone has any objections, please let me know.
> 
> ------------------
> 
> From: Chukun Pan <amadeus@jmu.edu.cn>
> 
> commit fbcbffbac994aca1264e3c14da96ac9bfd90466e upstream.
> 
> Currently, the USB port via combophy on the RK3528/RK3588 SoC is broken.
> 
>    usb usb8-port1: Cannot enable. Maybe the USB cable is bad?
> 
> This is due to the combphy of RK3528/RK3588 SoC has multiple resets, but
> only "phy resets" need assert and deassert, "apb resets" don't need.
> So change the driver to only match the phy resets, which is also what
> the vendor kernel does.
> 
> Fixes: 7160820d742a ("phy: rockchip: add naneng combo phy for RK3568")
> Cc: FUKAUMI Naoki <naoki@radxa.com>
> Cc: Michael Zimmermann <sigmaepsilon92@gmail.com>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: FUKAUMI Naoki <naoki@radxa.com>
> Link: https://lore.kernel.org/r/20241122073006.99309-2-amadeus@jmu.edu.cn
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>   drivers/phy/rockchip/phy-rockchip-naneng-combphy.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> @@ -309,7 +309,7 @@ static int rockchip_combphy_parse_dt(str
>   
>   	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
>   
> -	priv->phy_rst = devm_reset_control_array_get_exclusive(dev);
> +	priv->phy_rst = devm_reset_control_get(dev, "phy");
>   	if (IS_ERR(priv->phy_rst))
>   		return dev_err_probe(dev, PTR_ERR(priv->phy_rst), "failed to get phy reset\n");
>   
> 
> 
> 

