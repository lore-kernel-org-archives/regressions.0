Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C9E1ACEBE
	for <regressions@lists.linux.dev>; Mon,  9 Dec 2024 13:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733750594; cv=none; b=ltqcCqZ1X74jI8sLlhgsgz6OWsKXshfLcWxIBG+UdogHL2D3WW/2qxnZynY4CLx3Q+lrWZ+tJELEnsFvPFm0U7G56B8nl8OdCr7E3Xqfj35w8A7/Ef63cBO/vRiDgdLXPI8gVNZm0YVLtrNlOL5TUAcGis4sq2nyVwqiwlfb2v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733750594; c=relaxed/simple;
	bh=04S6B0nJf9Hn+gzERCF/uMkmUx0R4j34PMLxCp3iOME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqLtS/TalFVQZy3llfAzTpBFPLbDFMBolL8Ap6zMwprEfJARS+kPmWGiZ99hQMVc3bY29wGaI/3kR1BUeHyOMPGKe/LbheaETQLSdqPXpXdOV1AjuNpIQBQITfF04A2gvVz5L8U8zREoWK6C2Nz8T/KedbTh/Q4B21BdvYCRezs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tndrhbw9; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tndrhbw9"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e399e3310so2382995e87.1
        for <regressions@lists.linux.dev>; Mon, 09 Dec 2024 05:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733750589; x=1734355389; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P1Q3KowuVs0mZ0rb0Ic9ZcrPzwsNDNKvHLsAlNmDHFg=;
        b=tndrhbw9bRAGDE0LkX7MohYn/rEQkP6DNp6Uhlpste3s/a7zZSGZi+pvSddryDOmfa
         q4OUoPtom6bH0wJEqpbXDcxl57tX8xQamK09qnRi2bzVAsk58ouwbdcPucSmzf23ahpZ
         2G+xxqVSaqc+JdrF6NfDsh2ELcRNO5lH090lgKXMpsDJgYEOBJsTjNBUUFV1ZCeU9QMY
         AfaKFlo8m7Ha4iwHsasmcmdC4cznYYxoxLGpcHGovBkD2mgjPReWfAcGKBIEToRQ9K1r
         VCHjo/GeGyFEVwr9caZgdbGxHbhggz3Ej+YP5AnKX0uIOaHSgJTKYY/IfgEPtjGZ6o6x
         PcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733750589; x=1734355389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1Q3KowuVs0mZ0rb0Ic9ZcrPzwsNDNKvHLsAlNmDHFg=;
        b=FGOpQKuKpAw84QnRThiJerivEOI+4DZFqae4kzZBLWpEHUb2baNVZbLx9crb4Woc//
         y4L8eVM5OldX7KBIDm0GPd73Ekaun3VEefzWzQBetQjKNcDLpHxrwuILgAY0YRj1jymz
         D7vn+CVvK0qtVUUqt70f4iFppcSW6zF/hSztlS8QshWFlIodGNmtfNmJ7Z2U/w4S2Uca
         oWZGSMeOnjE3f39gKbsAtrzIWv+jBeB6PK29tKs/yXR7QcehNchYOxaeQxm3/jox8MOy
         lYlvNJNyNym0T69gScRG0VR0L/H2pe4REAJ5QItTYFTwWOGdWYfdPVxte5YX2a3+Au+G
         2gQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdD2Yt3kqOSDTejZ0ttn5WI1up2WJWcIztiaQSiYK28YMWDEU1YgGBHVRBSylUH596pBZcztcMDKO5wg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgNzYns3X2z0Ug3BlXADLjdqjshpcQqeand6OyuEDgU2qYnPDr
	WvFpcj1CJ7r3IbjBfE/yFhDrrLG32KUSoHwOY88pF92RAlrGTNRmL/VFkCJXjXg=
X-Gm-Gg: ASbGncsZBV3by/9ny80QkMSj5xOhizeGq+GDrpy0XQj34KOW8o1zedg6F2gHcVpEILj
	/u820RfNknL/K3XpscYY6TaCXFJnM2wv+yBzMZlu1aL8SdK4haoFCA9oacB4IZ1TzDNIuAX2yq5
	diPk+bg4f25ikRJJL76Ui9Hg/IglNglTXZUWAzmoqRKcUtKtMXJ1WWtPxnyJ3DoE7Xqq27cAEQT
	kwcsF2EHhcWcjxTStZj31fVNykOY9KyTRT9BuYgZ9u5KOBthiTWDtssnJDoqPyc7t91voliKyvo
	AhTZFGf1131+A8+sqCesXZ+EAJRoDw==
X-Google-Smtp-Source: AGHT+IHzRS3kKeuBIaVbiSldvKszXqHDXCVoEU74JuhkpXf+Z7S09whtCDZ/ssVTFfacSGsQVfKscw==
X-Received: by 2002:a2e:a817:0:b0:302:17e7:e18a with SMTP id 38308e7fff4ca-30217e7e59cmr24900501fa.26.1733750589475;
        Mon, 09 Dec 2024 05:23:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3003b760a56sm8652811fa.18.2024.12.09.05.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 05:23:08 -0800 (PST)
Date: Mon, 9 Dec 2024 15:23:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Marek <jonathan@marek.ca>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: x1e80100: fix USB OTG
 regressions
Message-ID: <iw2c4fceyppf2w2gueevsqsz2z7hatbqo33vufx3veatprczu5@u4k3j2igy6ee>
References: <20241209111905.31017-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209111905.31017-1-johan+linaro@kernel.org>

On Mon, Dec 09, 2024 at 12:19:03PM +0100, Johan Hovold wrote:
> A recent change enabling OTG mode on the Lenovo ThinkPad T14s USB-C
> ports can break SuperSpeed device hotplugging.
> 
> Abel noticed that the corresponding commit for the CRD also triggers a
> hard reset during resume from suspend.
> 
> With retimer (and orientation detection) support not even merged yet,
> let's revert at least until we have stable host mode in mainline.
> 
> Note that Stephan and Dmitry have already identified other problems with
> the offending commits here:
> 
> 	https://lore.kernel.org/all/ZxZO6Prrm2ITUZMQ@linaro.org/
> 	https://lore.kernel.org/all/hw2pdof4ajadjsjrb44f2q4cz4yh5qcqz5d3l7gjt2koycqs3k@xx5xvd26uyef
> 
> Johan
> 
> 
> Changes in v2
>  - revert also the corresponding patch for the CRD which breaks suspend

As you are reverting two commits, please revert the third one too, it
breaks pmic-glink.

> 
> 
> Johan Hovold (2):
>   Revert "arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports"
>   Revert "arm64: dts: qcom: x1e80100-crd: enable otg on usb ports"
> 
>  .../boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts  |  8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts            | 12 ++++++++++++
>  2 files changed, 20 insertions(+)
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
