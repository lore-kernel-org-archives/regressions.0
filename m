Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC411BC9FE
	for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 09:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728554162; cv=none; b=iojAfgEkG3dHwmkgJURq7/4QJ66/BiJRzKdgjmCUEodMMwbQkKz5GxSOXdNy87mZzxf/fr0uPHt/0TBZA/z/K0urHPgZBVURaVDX6Wo4e4O0LclcJ6gUf4GKmMcG2cacMO056NL2RbcWpyVouLhrOuZ3iP3FUOavlw2l31akM88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728554162; c=relaxed/simple;
	bh=XopSwLBUnKMXMFt2QF9TxC6ddo9IsvZRHm1kfbjdsR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NCpVsVX8teCoOxmWYOyhA72gmYY6JsRisq7Td6oEyI3mVwLtaJsKbadc7C4Ftf1IcJLJ0X/0PpG+9vEX83nHBWZk2Kg+rFDLphkDasiz3o7BQAet/XgaUufYZldF0gS6nKK+cAVSSBSDPby4ZRzWpg6yprnLC4w9MtW3BHtk7Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OXK6CQAa; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OXK6CQAa"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e232e260c2so6917507b3.0
        for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 02:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728554159; x=1729158959; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LOxBidp2LwpSxAPZkgwnhCDQ++zAlIni8FAvSy37V9Y=;
        b=OXK6CQAaJVlXuUovPFTwZdZ9uWcbJxFrn/XbdzsfrAkmFQICWV8sOU1/EBt/bkqDq/
         zMEpmgTKChRKI0U6YbLCTWsJ7mkvuEa2K9YslxxujVMqjqyXGhW4p2doydw0mbQCStFP
         TJ7ZApAdaH18w8p/5SmNrS2DeMWfVrAnng17txTFrV0P0y1Yy9T6R4bJ/t49daPEPTV+
         r1XHj37GnKsDMgsIBYBDT6j8Ikv2FIOm38op+QeW4+q2PXzF7e0vEJ/J+QAhR0A2DAxM
         +z/w/LdKt6zNPtC0Q2NogsVYsdqElpLJaEF0sw4/+w7FUkp3sCY0vhqdtZVAr7ef+w2h
         EBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728554159; x=1729158959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOxBidp2LwpSxAPZkgwnhCDQ++zAlIni8FAvSy37V9Y=;
        b=m3kRxIyHYaGXmz5DOMYNtqhq9VaA++fN1lYWx2aLjvG8PIKwz2VvbIg8An2nPVRgj+
         9Xyo9VbO9u8MWgOR2q4kqoclY4TDDtMYw/QsMEGB+N7f1H772wPDw9rNz4FACFs8alrs
         2F7DXCP1RQ8U70vcPB/ZszxUZ1SWnpIt7w/dC+G3qW7dKWsa0VpKYSYyQZQYss+nZF0t
         f1k5C9/4s33+xtX58En3tcW/hwnBg+OxYlzCBO75VaT9JbX/T2W9AMxAw9wwN/r2XppX
         vB6Y4nP+74OUplA4W5TPqCQADg9XWSwVd/aBavaiFXeRUh6B2hoJwpGV0zB1XtkGZ05W
         +rBg==
X-Forwarded-Encrypted: i=1; AJvYcCUUBbn7yZTW3M9Po6qxqOTrSRoF3A63aiALvUnp5efg+jNsL3rVsV0Z5xKnU2g3hwe6o1SWBOyIgZjYLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6OK+XS8LXxnoZtbi4QS6kqu1lQ+xR+Xyji1HzZP1Wv1iBDnqN
	xHXg96XJGikpsMGDVcvhI6eszpcvWwWqPis8Dd0fCxGhFMpsl5/grLrfree6v/vdgA4lb/it3Ng
	5NpHLP0hskVkNSKQAyUKASeVKRreyqOyZcVf8Xw==
X-Google-Smtp-Source: AGHT+IHQZs+aj47vmsFfuBifBBcYuqtrZOQCAYpL4cJf6+m/xMJish6M+co6AowbOJStpK58DqwxzTCpkJFzob0nWP4=
X-Received: by 2002:a05:690c:7690:b0:6e3:39b6:5370 with SMTP id
 00721157ae682-6e339b65672mr605897b3.24.1728554158835; Thu, 10 Oct 2024
 02:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241010074246.15725-1-johan+linaro@kernel.org>
In-Reply-To: <20241010074246.15725-1-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 10 Oct 2024 12:55:48 +0300
Message-ID: <CAA8EJpoiu2hwKWGMTeA=Kr+ZaPL=JJFq1qQOJhUnYz6-uTmHWw@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: mark pd-mapper as broken
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Chris Lew <quic_clew@quicinc.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Oct 2024 at 10:44, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> When using the in-kernel pd-mapper on x1e80100, client drivers often
> fail to communicate with the firmware during boot, which specifically
> breaks battery and USB-C altmode notifications. This has been observed
> to happen on almost every second boot (41%) but likely depends on probe
> order:
>
>     pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
>     pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
>
>     ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125
>
>     qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: failed to request power notifications
>
> In the same setup audio also fails to probe albeit much more rarely:
>
>     PDR: avs/audio get domain list txn wait failed: -110
>     PDR: service lookup for avs/audio failed: -110
>
> Chris Lew has provided an analysis and is working on a fix for the
> ECANCELED (125) errors, but it is not yet clear whether this will also
> address the audio regression.
>
> Even if this was first observed on x1e80100 there is currently no reason
> to believe that these issues are specific to that platform.
>
> Disable the in-kernel pd-mapper for now, and make sure to backport this
> to stable to prevent users and distros from migrating away from the
> user-space service.
>
> Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
> Cc: stable@vger.kernel.org      # 6.11
> Link: https://lore.kernel.org/lkml/Zqet8iInnDhnxkT9@hovoldconsulting.com/
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Please don't break what is working. pd_mapper is working on all
previous platforms. I suggest reverting commit bd6db1f1486e ("soc:
qcom: pd_mapper: Add X1E80100") instead.

> ---
>
> It's now been over two months since I reported this regression, and even
> if we seem to be making some progress on at least some of these issues I
> think we need disable the pd-mapper temporarily until the fixes are in
> place (e.g. to prevent distros from dropping the user-space service).
>
> Johan
>
>
> #regzbot introduced: 1ebcde047c54
>
>
>  drivers/soc/qcom/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 74b9121240f8..35ddab9338d4 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -78,6 +78,7 @@ config QCOM_PD_MAPPER
>         select QCOM_PDR_MSG
>         select AUXILIARY_BUS
>         depends on NET && QRTR && (ARCH_QCOM || COMPILE_TEST)
> +       depends on BROKEN
>         default QCOM_RPROC_COMMON
>         help
>           The Protection Domain Mapper maps registered services to the domains
> --
> 2.45.2
>


-- 
With best wishes
Dmitry
