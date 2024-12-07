Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A2F1552FA
	for <regressions@lists.linux.dev>; Sat,  7 Dec 2024 21:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733608148; cv=none; b=qKjEgWK22nMO3IwT0vykfqSz0KWpxyVWAaoHFV4UCzfRcisZpKUBVFemeoI75Iq73uvqh+bSLRfGnYY27FYI43641c127qs+Bp5AZFU2/bZFGs4S3/f3wQ9xkOBWqXoBIGfQA3ejJ/h5Old4TNcYWeDkS/8B3yseDlDHpGZJA8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733608148; c=relaxed/simple;
	bh=XP3j1/4hGEAC2iNDIke1mBk6kVbZ+dv9A+GBgBQwQy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEU8gFx8I2tYWQlwD9RDEEsTPkGub1zCrq3JS/MKNoUU4y+WGVLpj7LCDaSq3v8voPFGWy3OQHdbkKFCY+/evPzfw2CTdWYrwWQ+P7b6G2XVqM0x4qm1OMbVEJFWCen3P3cmyglDPr1PnK9WDrdYgyzYP3CjaknH4A9X3PvIAHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FukmEAgX; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FukmEAgX"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434e9716feaso3445415e9.3
        for <regressions@lists.linux.dev>; Sat, 07 Dec 2024 13:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733608144; x=1734212944; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wsfew4ZFMeZbleew2kyM9F4xOEfh/La2iijlA6czpC8=;
        b=FukmEAgXblu9vZGThEpbwpSRw6+4PXuNOR0Q0Bt+52sClaS9W2uI5JbF393Qwxkb+u
         BHFQG4UCxpwCZ5o6IY+N3gQOUqS7LrbXCrpzrIp3I8SXesfjyCgu+xtdiexj2KYDpNFv
         mrI5Y8An42RdJH8dNbMGHk2ypLwHJIlFn9kw0CKkr0n2CRdJ3NABMdgSHweWEUFWy96t
         80HrgHDFDl+76+4gCoJsq0D0P1riam3SoB0lyULcdCMpyoeEtWGpmE8PfErhLa6iO/qi
         TJVJ4wzlUpSu6DxmXuW/TrPCFW8qheXZn2ZtOBkmTLhcd7vzk6YEcRf0DE07OIjwXXPI
         1a1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733608144; x=1734212944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wsfew4ZFMeZbleew2kyM9F4xOEfh/La2iijlA6czpC8=;
        b=BkyKxaywesZW/qF5enzAF3H42zRSPfs+PKWtTNPjZzq8Sz6qdOSKabCtrS7wRz8BSZ
         CGAY7sUvHs4M8xzHa+Vtskpa9zv681bbwj+0IQ7PYD5epsSLRx840X9hYTkJt2feCzgF
         XtUphh1GDjDDJAHhhL0LiLZZXL2ys9MFv4gjCODBX1PB20yUtBHsk0ttIm5mcqWYGmTb
         ukN6zCL8HLbU2wrLgROY0PLPef6/SALH8YlTxqFKbfSaDWmasV5ikqzH/xXBstgp78eH
         fqt1JVab4xY1WHTMia2ZTbcZUjsnqoj9b8D5tEbe8znpO1TukUPjcNPBAYX+e36LiU6r
         u61g==
X-Forwarded-Encrypted: i=1; AJvYcCX4AS22jnTfWKvk7UxhMm8u40yh1/jEjs/sTPCLpCRBOZrdo8LzrqtUXrCeUEPp9XmsFxpopm68zM0YAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJaaNGouwk4Ntb4jicUYVBpz34DEodivqAH/JhmPYfQrWCdihY
	jopdZjdCTvWg4jvLnhKcGKKVsGc95zC0a45XeuwKre8BZVKvKQ4ZT4JvxBidwwY=
X-Gm-Gg: ASbGnctOm1/2qS6BFCGUX3WkMd3YCmp22hB253dV33Kvs2e6KmdGoc5l+ey6brf/91b
	Qctf35vr3RXlXNIEheKCySFwSEUiCQcAwIMgfKbA6WIt/EW6chc5uX8s9xigkBhCsWjx4JhuozP
	IzOzQJ0LT60E0R6toVV8lTZ5DIb1rzQlVgGXxL6wiPDmMZ6QCzdv4Rj0yGbdkimhUYM3yGNqOAh
	txWTvhy4DQ2Vvvq7LoMuGGHSwcQ/plK/EH2yQ/nX86prMC+
X-Google-Smtp-Source: AGHT+IH+ko/7VIODrYwfCnjU0zGn4D+6rRMhVzbvM2RWWXIDLkbwi9KP0/YKC1XI4EiPxhf0nmocBw==
X-Received: by 2002:a05:6000:709:b0:385:dd10:215d with SMTP id ffacd0b85a97d-3862b3d3554mr5627621f8f.44.1733608143816;
        Sat, 07 Dec 2024 13:49:03 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862de365f0sm5026157f8f.3.2024.12.07.13.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 13:49:02 -0800 (PST)
Date: Sat, 7 Dec 2024 23:49:00 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH] Revert "arm64: dts: qcom: x1e78100-t14s: enable otg on
 usb-c ports"
Message-ID: <Z1TCzEj05Anzwcc6@linaro.org>
References: <20241206172402.20724-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206172402.20724-1-johan+linaro@kernel.org>

On 24-12-06 18:24:02, Johan Hovold wrote:
> This reverts commit 1a48dd7b9ac809d1bd0fd2fef509abba83433846.
> 
> A recent change enabling OTG mode on the Lenovo ThinkPad T14s USB-C
> ports can break SuperSpeed device hotplugging. The host controller is
> enumerated, but the device is not:
> 
> 	xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
> 	xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned bus number 3
> 	xhci-hcd xhci-hcd.5.auto: hcc params 0x0110ffc5 hci version 0x110 quirks 0x000080a000000810
> 	xhci-hcd xhci-hcd.5.auto: irq 247, io mem 0x0a800000
> 	xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
> 	xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned bus number 4
> 	xhci-hcd xhci-hcd.5.auto: Host supports USB 3.1 Enhanced SuperSpeed
> 	hub 3-0:1.0: USB hub found
> 	hub 3-0:1.0: 1 port detected
> 	hub 4-0:1.0: USB hub found
> 	hub 4-0:1.0: 1 port detected
> 
> Once this happens on either of the two ports, no amount of disconnecting
> and reconnecting makes the SuperSpeed device be enumerated, while
> FullSpeed device enumeration still works.
> 
> With retimer (and orientation detection) support not even merged yet,
> let's revert at least until we have stable host mode in mainline.
> 
> Fixes: 1a48dd7b9ac8 ("arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports")
> Cc: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> 
> I have not been able to reproduce this on the (third port of) the CRD,
> but I hit this constantly with the T14s so let's start with reverting
> there.
> 
> Note that Stephan has already identified another problem with the
> offending commit here:
> 
> 	https://lore.kernel.org/all/ZxZO6Prrm2ITUZMQ@linaro.org/
> 
> Johan
> 
> 
> #regzbot introduced: 1a48dd7b9ac8
> 
> 
> 
>  .../arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> index 5a4a72a030d4..b4b6260c670c 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> @@ -1515,6 +1515,10 @@ &usb_1_ss0 {
>  	status = "okay";
>  };
>  
> +&usb_1_ss0_dwc3 {
> +	dr_mode = "host";
> +};
> +
>  &usb_1_ss0_dwc3_hs {
>  	remote-endpoint = <&pmic_glink_ss0_hs_in>;
>  };
> @@ -1543,6 +1547,10 @@ &usb_1_ss1 {
>  	status = "okay";
>  };
>  
> +&usb_1_ss1_dwc3 {
> +	dr_mode = "host";
> +};
> +
>  &usb_1_ss1_dwc3_hs {
>  	remote-endpoint = <&pmic_glink_ss1_hs_in>;
>  };
> -- 
> 2.45.2
> 
