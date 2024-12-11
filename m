Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2835D381AA
	for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 13:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733925464; cv=none; b=ID2F7hJijz8CB+aOzFQ+Q8OhyCa6R8dXosf2CEaYz7z+sYELnS4Qu2gMo5fTHQjM656AoPcxrLNa5+1INtCd7Mql/CnCLbrs+lg1CF30lEFWjAhnfDdnabjuR7liNXnqNRc03xor2jJHqrrgN5g3uihwWcIjmN0FV/CI1AmB8lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733925464; c=relaxed/simple;
	bh=VDR/LFkNhR6c+K0FS5fF1XjxZAJmm0jHxt2NQS8CF3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8fpLuWm0Pyr6oCIlfVOj6T8Bq4JfhrL21SUHt18rzdYwyxHqe/RCmqJtSFpH+0/8KXNSnDX0nxnyOe8Yg2OY/iSUrNo8edcKcNrGjatd6BvekXmm1H7Htuan2F3HekqE54WyhDq3hV/X6Dr+7ydNRkZ7HsEL14TfHnZf2jETXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iDsoGdtU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iDsoGdtU"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso4353915e9.1
        for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 05:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733925460; x=1734530260; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mwRyufZV4Hv4BKUozZCvb8TTCpopa4m9EKT2fS3FdAQ=;
        b=iDsoGdtUvUqX3y137d1Kt4/FadtpFYICM687Aiq/cXT16KI/4MpEKLx86VPWQVjEmz
         2X4FhZMQgTEaTP6qrUouK10DFMJBeNw2GCnPHhC5yKhz547OBeL8kYfPl/LniyMGpDUo
         X9fIIEiZTTgZ3sD0Eiv1RTWrqVhKi8Sw3P9XV2ju6+zjMKIkefKbjuD/30vZcrgGBTcC
         0JzDT2N+lH5xnmE5TIAo0oneQw8RpboSKYqe6ZLUa/V1yVhdYagt25sqeSBb7fLGn/tO
         coS7l/OtBt29GEv69MY/aAiVpaBxraFzaTKtXS0WSaw1zk3KpZjyYbZOiKmJafvHcne6
         eczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733925460; x=1734530260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwRyufZV4Hv4BKUozZCvb8TTCpopa4m9EKT2fS3FdAQ=;
        b=oKgtfA27UGw81zyEX8aPL2B7mDTpz/lAqZd6JUvesfhyFP0qES3gYSxCOcd72OVxm6
         4SGoZimRW62OsWGdFR1Y7uSc+C/AlqS0rRfAF5eLJT/RQok0V15FXJIMc7ZBWxB+lfHZ
         jX8mN3hZjeHAzTu5wEKbCKOW9PFdkGwZJbqwMp84X+vGRZ14mihJEXZu9gQMFckeSGoT
         A9vtj8XBGy5VsdqmM2PdA1NV76YDmpxUV3L6me8HYcK08K0HFq7GJiRepNA2qDjw7M2e
         2i7TZAoF9v/xtIM6lkxqLJAh+0bafVFHyskCcyUHLME32NrcoLZZy9j15eeWDb79DT4h
         qTww==
X-Forwarded-Encrypted: i=1; AJvYcCWIYnXlEp7FbK/MZK7k880gao4H60PQIVRsGYBju79VKwqHyeHYlq1HQSHD1uXgInfQsApeI9USDvj9fA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw7g2g/G2LQSmrLSboLJUglaUqCntYvKk1DG8q9Oa92Xx/A8S5
	hmQ67o816YHjQDUhUSaglIGkVUq2anVTZ1KTMd9uunYjfu+TD42/mwYaSIhPEMI=
X-Gm-Gg: ASbGnctcIZdF0iuIJS6TgVH7V1HVAS4t24fdQDF/i8Uy9j5gnzZoVpNdRWU6YGHH+Dt
	sPFLgiZ2XEu2tCWPtSsmPlrKfis5dlBdknaPu1DdefM/ExgKv69P90rN+gf4K/k7Lr56+7OUx7F
	lBmlYoGQDlXCCp1YEBeJhO6lV9JAxd3r7a3P7XmMeMLav2MeXdaFc1+dSEvoW1GKtyGWbAGRPix
	9XbSjkFogdh1Eba4AL2J+Wq8fi6rQ+sO9Kvk8/elHsbPtzv52Tw
X-Google-Smtp-Source: AGHT+IHHGvcjsAaWoQmNtBBOZEdx4io9usowsti1WQThV36SDH9Hnc+lVGaPEvltgGcV3XhTkCAoMw==
X-Received: by 2002:a05:600c:1616:b0:436:185f:dfae with SMTP id 5b1f17b1804b1-4361c5a3918mr21096715e9.6.1733925460593;
        Wed, 11 Dec 2024 05:57:40 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4a31sm1355432f8f.30.2024.12.11.05.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 05:57:40 -0800 (PST)
Date: Wed, 11 Dec 2024 15:57:38 +0200
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
Subject: Re: [PATCH v3 2/3] Revert "arm64: dts: qcom: x1e80100-crd: enable
 otg on usb ports"
Message-ID: <Z1maUvW26Cl/VXLr@linaro.org>
References: <20241210111444.26240-1-johan+linaro@kernel.org>
 <20241210111444.26240-3-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210111444.26240-3-johan+linaro@kernel.org>

On 24-12-10 12:14:43, Johan Hovold wrote:
> This reverts commit 2dd3250191bcfe93b0c9da46624af830310400a7.
> 
> A recent change enabling OTG mode on the x1e81000 CRD breaks suspend.
> Specifically, the device hard resets during resume if suspended with all
> controllers in device mode (i.e. no USB device connected).
> 
> The corresponding change on the T14s also led to SuperSpeed hotplugs not
> being detected.
> 
> With retimer (and orientation detection) support not even merged yet,
> let's revert at least until we have stable host mode in mainline.
> 
> Fixes: 2dd3250191bc ("arm64: dts: qcom: x1e80100-crd: enable otg on usb ports")
> Reported-by: Abel Vesa <abel.vesa@linaro.org>
> Cc: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> index 199f6b42aa11..66360390ae7d 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> @@ -1840,6 +1840,10 @@ &usb_1_ss0 {
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
> @@ -1868,6 +1872,10 @@ &usb_1_ss1 {
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
> @@ -1896,6 +1904,10 @@ &usb_1_ss2 {
>  	status = "okay";
>  };
>  
> +&usb_1_ss2_dwc3 {
> +	dr_mode = "host";
> +};
> +
>  &usb_1_ss2_dwc3_hs {
>  	remote-endpoint = <&pmic_glink_ss2_hs_in>;
>  };
> -- 
> 2.45.2
> 
