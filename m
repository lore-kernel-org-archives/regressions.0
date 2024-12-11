Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768F6233690
	for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 13:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733925449; cv=none; b=IFwBxJqAPi9iqfkKnvDf7k38QNJItkq+YfidLVxL6SxGLfHARgOK2GMsdHUD8QJdw3pBWnrqN06k59LeTsqxc2AuMtzXuy5bWywA9Ui+c+3X8YCw2Ug4tDptDM6i5+RiVqeiC4xF3UA3sSxBs2LlUwBBIYw8Y3xlIyAT19KCnX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733925449; c=relaxed/simple;
	bh=JhwlRQCUlSido+cOopKgWGuxkf6VA5zfN500pz/rIjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pz7hYBrHsVLkYzMl4/3FPp7Tbn9Fw09xERuFZclQFu5Q/abB4l37L8367cNxVP3RXAi8Z3s7XNz9wj1OdeBEzYc1fphztijP9Jt/p/t/ZIx1+9x/Z38cCMJYKkDRbjZtHNy9bI+2dlJYN7eujt/RwNU9pFtYudawtnB+xixIIhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ShjSKmxz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ShjSKmxz"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso4274775e9.3
        for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 05:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733925446; x=1734530246; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O4+3IBZgQdDXFwyfmcTHMczi/2LVRqIwQiyJZ1onodg=;
        b=ShjSKmxzbwWpQGNGW5cB4QN4drAMPmtmOj1GnqLrno/WO9eKIol8fyHLOFPSd1d1Tp
         lsnt0Co7OU1wYlRNfjCxIxOMvqtwPOxJ31gYdM3JXWKwjSlCe97N+2vkEUjcqCBlmH7V
         S+PNRJXRSF6A9BtyOP7aanaDGyy+Kxq8UNijIJNq+whBiyl0erXJGyiCf8t5ZjqpAPvR
         o+rZ4o6p2tMkirKSKmvBDiWUKhe4UXCR+KqhGjE/V3yIVrWyD3Ae81qnDMxrnAgpE5y4
         HTrFOC48Ti+7S5a6ImFB1M7yCQCMzWhUw5Sz4OzcYZEnmMb8tXzFaQD08JflJQVepZB/
         qL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733925446; x=1734530246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4+3IBZgQdDXFwyfmcTHMczi/2LVRqIwQiyJZ1onodg=;
        b=XEeOaKO9OJQuxSuauEz9AJkEO6XjArJeLnhle0qKu+Zfo02l2kqp4cik3Bi5V3sR5y
         rSeUCvBWXDZ+GGicwf4jqDn+oOvCcL4EV00jkEhqwbo/8pjW5SmfNYx/4WCGBtWDehvy
         0OxD9WPGyyesWYbSdL+fEiPIw7qYZykxsA/37HW2rZ8TU19be54CXxyrKJ6B9FkquV7t
         w/0uYaI5nBrord/Hkhlx0dpc2j9LbKNaXwl7M+F/H08tBEXjysecP2qByeLr3gAALUSR
         567rsRqr8YOjXpswgZ8UkUVOudLvQuhlTS1hcIB7L19TgDVGCL7vWwoaLtsJ9rKsg/di
         6CHA==
X-Forwarded-Encrypted: i=1; AJvYcCXXBuKBYHUgSd6aqA21PXHqJ5Lc2zMdffxKJLEINj79Rwm2BdQT56tnfz8hkGM/k2Za8pdcOvUf0DrpgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXUI0h2FH5OujmihiaJhzcGGDCtUXmivoAKqAhTUJmoi/FfLHx
	zsufdEukOu0GguyuJy+HuF0u9Slb2lS4HOW6Gata2DztvZnCpEo03Ptk3Y0edeU=
X-Gm-Gg: ASbGncuGXlOZI4hi4W8DpjOtU/GoW6CdX9GnvtlTkyGSwPX0Ty2X1J2iiQsw5hbMKY7
	MY9XOGxDZ0QkUqM16HmjgAS1ZJyld+ST89rewtFlSn5pHIpMg9r42IhNhnjD9IHzILoG3Uqwfmw
	W8ajM4fMq4Dn0nAh9F5tHKLgrBelUl0q6OUeZxVSAbRf/K6yNP9htqhJ0j/1uuAtkUywcDy07YR
	IbGq6R3PIV2KVj0BiNwXwqnTky3+iTx1SZWLo18xpq4HamL1xnp
X-Google-Smtp-Source: AGHT+IGj6e56QapjjDkMGtxmigoFIildblF7J2AdVirl2LbBPSwWrReDkRoqBxNuZpY75ur5m0i4WQ==
X-Received: by 2002:a05:600c:b86:b0:434:f5c0:32b1 with SMTP id 5b1f17b1804b1-4361c3755afmr24750765e9.15.1733925444346;
        Wed, 11 Dec 2024 05:57:24 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824c8aadsm1332447f8f.60.2024.12.11.05.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 05:57:23 -0800 (PST)
Date: Wed, 11 Dec 2024 15:57:22 +0200
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
Subject: Re: [PATCH v3 3/3] Revert "arm64: dts: qcom: x1e80100: enable OTG on
 USB-C controllers"
Message-ID: <Z1maQhIyS1LVfDc6@linaro.org>
References: <20241210111444.26240-1-johan+linaro@kernel.org>
 <20241210111444.26240-4-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210111444.26240-4-johan+linaro@kernel.org>

On 24-12-10 12:14:44, Johan Hovold wrote:
> This reverts commit f042bc234c2e00764b8aa2c9e2f8177cdc63f664.
> 
> A recent change enabling role switching for the x1e80100 USB-C
> controllers breaks UCSI and DisplayPort Alternate Mode when the
> controllers are in host mode:
> 
> 	ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: PPM init failed, stop trying
> 
> As enabling OTG mode currently breaks SuperSpeed hotplug and suspend,
> and with retimer (and orientation detection) support not even merged
> yet, let's revert at least until we have stable host mode in mainline.
> 
> Fixes: f042bc234c2e ("arm64: dts: qcom: x1e80100: enable OTG on USB-C controllers")
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Link: https://lore.kernel.org/all/hw2pdof4ajadjsjrb44f2q4cz4yh5qcqz5d3l7gjt2koycqs3k@xx5xvd26uyef
> Link: https://lore.kernel.org/lkml/Z1gbyXk-SktGjL6-@hovoldconsulting.com/
> Cc: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 1740fdf7b1de..4c1e01605e87 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -4422,8 +4422,6 @@ usb_1_ss2_dwc3: usb@a000000 {
>  
>  				dma-coherent;
>  
> -				usb-role-switch;
> -
>  				ports {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> @@ -4677,8 +4675,6 @@ usb_1_ss0_dwc3: usb@a600000 {
>  
>  				dma-coherent;
>  
> -				usb-role-switch;
> -
>  				ports {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> @@ -4777,8 +4773,6 @@ usb_1_ss1_dwc3: usb@a800000 {
>  
>  				dma-coherent;
>  
> -				usb-role-switch;
> -
>  				ports {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> -- 
> 2.45.2
> 
