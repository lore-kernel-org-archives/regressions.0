Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256944;
	b=JcWILZbHn2udRD5Ha5M0stT1/OKotgJynLt1Gq7sRqc+Gp9XvGSYiakT4kjhO65//ibA
	 VuY0p2Mwprif2e3HSjazOhmJQ+KD80Tc0a+ovemOa/+izjDJXPlg1KQBxBd6WnOE3gEgY
	 kOumhtAtxzM2N9VGUsOLHSs1HjRydDaoJ6oqzkgkUiA82uitFRkdWDRGJzNRXY2CL5cRW
	 aTXwxNN2sHJe95I60hFHzlTqbC2VDXFkBYC/CZD/L/3vvFtqrRFjSSgwJPZdACxvOYfKt
	 QCYouAZGjsxfl6FTUWWxy0V0q+5QJTYo8oPGHudDLKF8lOqeyUReMk01L/zF0qECCNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UOhqmpD4X7Kw07Ng1ggleQiy306bjRMLXhpTJKa1eDA=;
	b=yPEztHHMym08m19ddrflIPosKwXFc6SYKcTbDMX7VMPa9CzqAfhtBuzSWjP3LfUmAiaU
	 eL5zBtgkDjwF11ZV5lJANMxaIsyVYpQNVIC2nRx4hskqRuc9Bvsc6qUH8ArlVMd4Vthxz
	 /IQ4se5ydruSLJJ52X8zEWzx9oAx4Rvi8yH+i5DVePkYgU0Ps0CnGOW2aNMAgFkLbOsNr
	 2+wPEE4ZN1+MhkopuaQaLTyGPhsEiRPH5SKKUqpVP8cvc66H2d3Shu/J2yv20/OXghXXY
	 Rbgz62KQtPj0wisIW7aXj/yeVdEZ+uR/dQruDl7rlGIP3aGf8X2RcPDIXr3Gf7xiyhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ymcWRidY;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809BA606A31E
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 06:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 809BA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ymcWRidY
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so13356935e9.3
        for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 23:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793256943; x=1793861743; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOhqmpD4X7Kw07Ng1ggleQiy306bjRMLXhpTJKa1eDA=;
        b=ymcWRidY4yYzBVqnsHcEfeAY+SVPAIIlBZIwp8BFbdn+yPyDGQAQMvYs+Lf5W8RRu0
         FRFxuQqhOu2OpA4BCergOIutfZzYGtsNDatZos6c8UzFZeKB8wYJfdVdUh0HyP1kxKsr
         awe8n9lFoWOXaPuf3z6eYyEmbGAs7DAo85ZA8IYVi51viSDAiex5Hw2r1wiyXusi2cHr
         TQPRFtJpM2ix/SYvSkvAxJhilL+ekbgYZk7Bjh9yWGLug36L0dLmFSOhwnrAFnsHszhT
         NlwfUpawM2QvI1vuOhOCO5vwJvqea91UU3NEfsIX5jLEY9l+rQixW/o7LCgjND2JEfj3
         P5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793256943; x=1793861743;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOhqmpD4X7Kw07Ng1ggleQiy306bjRMLXhpTJKa1eDA=;
        b=OTUfui9mohsgevq8FXpx4cIoILAgjb+BzPrO1KeVdbzYDp9x07bj1horsOjUHxSYOW
         tPSpED7qF47siZBypBwB/nABwXFjTAbKOj2wjjOrX5MuJQg9Z+uNVwIQtmVW9DRSmWDw
         GIPxVIYhVbYgIYjIqIA8AyQ6qX85QP13P9jYrnz4I8Wm0hdXcHoHGSbnujlFrJF0fNfz
         y9y6Ka+fFBW23JMae6Jd34Rs4xGKkjSu1AEo3QDCJxaIxCiWxguWTM/57i6EqxZbC2h8
         bR2avmcXxExfLHQsQ/snH4ag9dM7r44DbXQPhCQhp7oWZ+cMIvXWvQKA9oB9b1f6O8V3
         H68g==
X-Forwarded-Encrypted: i=1; AKwUvBzU9L16gKkIUXp+cmQKZsmfSxfFzD8Qa+ElbBYrXd80aamR9AFvUvcaiKxwVLli1t4S2Ya3tqJm+xx6Cg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJs3mDeDOrPVkps1feYsvOyXweRUTwYP/2HYVfLQVlKIpccvPp1
	v26OA2baTZe4uZ/QUaR6U3ODwolSnCx+fQllrFG0OCi0Y+LFl2w3+lKM
X-Gm-Gg: AYBFou02vPX8citLbkI+yLSgkIy1QPRzf/cXk9XUgQhIm55eexNNQZDar6uGop1+XKY
	f+iEKFmUAvhwEdH5tiMQb6/C9dhn2YmwdlwG6rcyYQSZ8donekapELZxrG1MlxG/bjhzWhMgwe8
	ssVT1GwfSKC+kdVQmTHqxxwNWctXFPFUisnIq6KbTX44Tik6SLMoaI8Z3b5n30vCh9vi7znmjSd
	wkNOSJVxrmN35dIrbV3J0rlRXkOSg6k0+3WgWsO/s6rNdaDAJLoTgljo+swow9JOXzahz6S3UPz
	Q6qBPCvT7igZP8o0a0kpFLqfBURXCs++/+GrQVVqW85ngKG6DRqeI5vMODzj4GAAq1IJ15DhF6n
	fo4ty4eZeZOH4LrpHlgwvwuiNKX8dU3o2fEOhL0rsZqbyE3/oq151WTD+2Wz4JwMoL0dhLk7G++
	JZN0sKtFvmgOB3ojj1ZbX/kOfauNL7GtoXx9/bQCeEfvr6zBmAK1RTxMNt+SAtDaCavI3otl9wa
	OVyxifgiXNSpaWlAfQ/8yHqkWVtWj1LByLebqCwF8M2C5gRtEEvqERclZU2Ubf8iWvEyWXI6eIo
	ysXpNWaCr6me3oTsl0iv5PF44I3hbgdjOQpwF1GilRev1ol7HBAQA4eQ7k5NLviwXpKqmLZulkD
	/Ddg0T9AiDQ==
X-Received: by 2002:a05:600c:34d6:b0:4a1:d675:b031 with SMTP id 5b1f17b1804b1-4a9660b54e8mr101112445e9.6.1793256942680;
        Wed, 28 Oct 2026 23:55:42 -0700 (PDT)
Received: from [192.168.68.70] (host-87-10-175-32.retail.telecomitalia.it. [87.10.175.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a930a63eb3sm87590825e9.1.2026.10.28.23.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 23:55:42 -0700 (PDT)
Message-ID: <2a1eb85c-8a30-4594-bdad-8a1dec17b141@gmail.com>
Date: Thu, 29 Oct 2026 07:55:41 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu
 information
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>,
 Frank Li <Frank.Li@nxp.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
 <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
 <auJWI1bqt4kX70pZ@lizhi-Precision-Tower-5810>
 <auJjlYWf2JCa22Ai@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <auJjlYWf2JCa22Ai@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/28/26 22:05, Frank Li wrote:
> Does it only impact superspeed? High speed work?

No, it's not even enumerated, on the Dev board.

> 
> Thank you report this problem. Suppose below patch should fix this problem.
> 
> I have not time to test it today.
> 
> 
> Frank

Tested, it doesn't help.

xhci-hcd.1.auto has no fwnode, so platform_dma_configure() never calls
of_dma_configure() and the new code in of_iommu_configure() is never
reached.

Emanuele
