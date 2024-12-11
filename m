Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F5B2336BF
	for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 13:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733925477; cv=none; b=KTsGZLbUrACBcuCbCDWrx9oPmNpOXaSbmwQfSYekjOocwTDaBSUWXbjcFJnLmAfJ1pj7Waqil2TmPIPbpM+lJuuVGvH3WPwafNwbe/tNAhijkQYOOd06k4qq7FMlNUMGt6gg47VxfngbXl51tPjsTmjZFftUiKmInT59pJAbUkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733925477; c=relaxed/simple;
	bh=zhm5/qneWDtFKip5gZc5Ug51qbj4ZyGlCNuuB0VT+aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHXN4XwJiBHH3F7hlYJ+4eC0vXqpKxByODIP5ZP6MKGXKfttjzLZVuFpA9KBCrrwJNFt8cQKWtORpO7ggVn2By2Njo2X0PNZICQ3ApWQnwJspelH09eIq7G7ZykrKWxe6UV1oePcGlqOuE2cGRfD+aH0/fTo/xmm6XED4GFXqKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y7QxoAYQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y7QxoAYQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434ab938e37so44128345e9.0
        for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 05:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733925473; x=1734530273; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n+Nq0JPihsIDotmBgK7j9oUK4hXd8/xtAenPkWmVRYY=;
        b=y7QxoAYQHb0DrMrP8azfSSN2p0deBgc33zUc8JAW6YGDEGbrmd7nw181D/xa8LaSyu
         LUmm4ZAJAIj5LhLKzKCrMFDvmqh8rbkWQRPMoVjGk9xCsqVJKHJvAQ6B47EPDMXOJDtf
         dFSqpCD7fP6LYHt9QxfRjz4QY3fP0dgGQI81tI+alkto9oUqTzWXz0DKKbSVRLGYCTNE
         tNIig1Lo7BuGFCn2hT7A6Iu35XGA47mYqfrT80Fcjhg7/YsjTUB/M1Z/PoPH8+gisApk
         SezpaVteAy+ymuLsAfp6KG0XC2pTgEexwRbMuuXF1IlP/3oweMvSWEMRFJVrwoBLoS5l
         Wm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733925473; x=1734530273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+Nq0JPihsIDotmBgK7j9oUK4hXd8/xtAenPkWmVRYY=;
        b=i+iEpxnIsPBmlgeVfG1qf4y8cXmVK/WhrG2Gy7AoO0tV5nT/bBCODMnma4zj20xmsA
         D7fpuTnbdNAT4ac47QKV22pG34ZTGkmxkmq9ypRER3jeXFaE1HUl/yJZE+idyHRsDy6g
         sLQrQJM59OE2DQp+Zt6yQFjZkrvZkVHvQqJtmJIgCHVWu9pUozIDEzgXqgreZ5fUrUbB
         akHdokpkcmYqitWnPJC6GLEDfz8QLMCZX/GN68ExmHRjwlF3h9fIGvrXY1bZw224sAk7
         uLqQ7GXwh0/f9IIDrvPRdIT8juJev7NjpYQS7e0B4SyaM2G0BPDDZyllVaAzo3gHX8G5
         kRvw==
X-Forwarded-Encrypted: i=1; AJvYcCWRX4Qw/ukjH4gvJ8SHTk7rFQW4LIGWr8+AAHHCYBJnf5Z+6QajUI9YK4ltSq4Z0IcsLH094oGdkEgXmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPua50XPlqafQxZ1DaliDluiZCgkH2PcXKqx8B+AnCZHTMYYCI
	dOn8BeMDRNEgfswVLRG6UvkTHnWVGokTMElQZmh5IljZynKT7X+nUoP4m0RdyIc=
X-Gm-Gg: ASbGncsHWJSlcfWH+K5APq/F3PTSmtI2Viu2WDupDAOLfJ9lTML5XAWyqbJa7HMYi2e
	vUKkOVBXSgC44AU2Tv6+qcqfSbH3OsGV8o7o2ap4/gpZXuRBDPeT9rNmmfslVL7+rpMLBYWSvrK
	30pIshMEDGTF4siJBWeXFMQ7mjV4j8mwBbeFG29y42dPMT+Eg1dMVCvZ81dq0c1VDJy+oNH2775
	LqDIhyCi0/43zwTCRtL/R4RrNNFZ/eAGNu/zKDqD7GdA+3nG+5L
X-Google-Smtp-Source: AGHT+IGJCYJTlBedjQm+GK+uiVv40a+NR20VpMjki58l34sVua7BTMisnr0pAsT6vjoKEaDgR/Mj5Q==
X-Received: by 2002:a05:600c:35c9:b0:434:a929:42bb with SMTP id 5b1f17b1804b1-4361c3a336dmr23180715e9.18.1733925473454;
        Wed, 11 Dec 2024 05:57:53 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43621ebf8e8sm1879635e9.32.2024.12.11.05.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 05:57:52 -0800 (PST)
Date: Wed, 11 Dec 2024 15:57:50 +0200
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
Subject: Re: [PATCH v3 1/3] Revert "arm64: dts: qcom: x1e78100-t14s: enable
 otg on usb-c ports"
Message-ID: <Z1maXuaVQiO3vGM6@linaro.org>
References: <20241210111444.26240-1-johan+linaro@kernel.org>
 <20241210111444.26240-2-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210111444.26240-2-johan+linaro@kernel.org>

On 24-12-10 12:14:42, Johan Hovold wrote:
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
