Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974931CB53C
	for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 14:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728569638; cv=none; b=op6t2nTwfqDgufbUnTUDrSWJ7LihE3oN48MFe0piRdhiFuDQQHYSCDS02mGDgwaR7QMVcUSZ3jFMLmTBCbM+5k8ov0vD1bVFa+vj2J6wrwLveeZR1Q4nwVTSbtyyI/Agyy+knqUeEA36qOXz5nCsLDz2DICXpMCo925RCqyXOFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728569638; c=relaxed/simple;
	bh=v96PNN4MVU8BpK8vBy975YovAlUghAh49thgBno3qUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MPgYhC5klfDNepIJ26IVVWeXh1PI7wy/Tj4JDCzo+278k7UYaOWaK80boLgsdkZmgh7FIqn1ykvyKptQEvJVB+7VAm045ztZwFcmPd0nyEd+5dhpdYCQ9qCV6xL8JKFadddmbMOKdgP+dBSLWjZo2hIwFT04FFRAyQdJKCniPQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MX513y8d; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MX513y8d"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20b93887decso8806365ad.3
        for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 07:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728569636; x=1729174436; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DawD8n4X/r4xaXiJGTeAEfpBOv40vnqoSHm9Owz94ss=;
        b=MX513y8dux+IR4MFPlzWZZYLzjcWlAVRFnC0H3zoCqiNK5Mq8DS2usuV0/fU4VYp9w
         XCVl1JRTl9J3+vcGvv0BtHPr5jJlXL9qhQ5wOU7wJM6eGp2UCNZuadQjDvbGySg40m7I
         LKiwGQlNtpz9LHV5acL9t24hPsFR2Lcr1LMXpkqbTCWFeARtRZkh88QEuOljgVaoq7/e
         FhfUNUmkhllKNf6/506a00mGfPcq54AglwH1um2glBit4YtXwUHIgoj/h2SoWixYZE9V
         i+4LH5H07xP6KNN/PyXMpUZ2j7Xku+0DphD+AXDkJ9qb3fuK+akbj37VRv5dnC88otuK
         OBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728569636; x=1729174436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DawD8n4X/r4xaXiJGTeAEfpBOv40vnqoSHm9Owz94ss=;
        b=dK56SsnVikZTeGtZBCPkQ8DBdnvF2n5BH9WMel1EOCAyIbAKyIZaznI2zeeRrFR5/X
         6amJgHvYc48yiHH4MqlTdbZMIemhpuLDwC2NOIXJ8UKuBySN+EUagbhiCQ1iMKteOBLy
         u4kteOE1jNvvpSWFzvhuu8q8LjpyEZxmfVGHTVlYQRIhDXtIIVvF9+Wx6FHWrDoSNJ+w
         uaD28SULqy5GzXUSXANpJPwIst/x/nOVOWyXqv9NU1EmUqDbJv8GM+RrA9oUImtm9x0K
         b3HpI3eRfChqLN0RW0BCWKoX9T2S9FCJH4YCP32SX30DavEWZs4AXt8Ncc6YT4c4geIg
         9A3g==
X-Forwarded-Encrypted: i=1; AJvYcCXvPIjkqjyzrCVxkpVsYw2rSGsL3M8XRqUNLu/wM1af6ciYi0QMOVQRyclsBarmKjf546fag/dFVI2cCw==@lists.linux.dev
X-Gm-Message-State: AOJu0YygO5GGGTPzC2i6iUGeZoM5RLoEK18qRLHT3nyyxiXgb2obgGr4
	gwZVwlpWz0a7eWAJbeveW4zn92amzItczzyLvno1Tr2ZI6WiyIVTWpMDmRuT4+nsLk3ntxdQNCt
	vWkMId8cj6EAgV8Rcmvyl9N2w/0lGYSVyL15lwQ==
X-Google-Smtp-Source: AGHT+IH99waZBuY+BmuZLoXnqUMIgsfr9Dg8xvuA8Cec2W/RAxuOqyAufJdeE6Cmv/k4m+tI9LwHTSeCcz7iXHTzNXA=
X-Received: by 2002:a17:902:e811:b0:20b:b75d:e8c0 with SMTP id
 d9443c01a7336-20c6377c836mr102102855ad.45.1728569635812; Thu, 10 Oct 2024
 07:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241010074246.15725-1-johan+linaro@kernel.org>
 <CAA8EJpoiu2hwKWGMTeA=Kr+ZaPL=JJFq1qQOJhUnYz6-uTmHWw@mail.gmail.com>
 <ZweoZwz73GaVlnLB@hovoldconsulting.com> <CAA8EJprg0ip=ejFOzBe3iisKHX14w0BnAQUDPqzuPRX6d8fvRA@mail.gmail.com>
 <Zwe-DYZKQpLJgUtp@hovoldconsulting.com> <c84dd670-d417-4df7-b95f-c0fbc1703c2d@linaro.org>
 <ZwfVg89DAIE74KGB@hovoldconsulting.com> <jtxci47paynh3uuulwempryixgbdvcnx3fhtkru733s6rkip7l@jxoaaxdxvp3d>
 <Zwffi40TyaMZruHj@hovoldconsulting.com>
In-Reply-To: <Zwffi40TyaMZruHj@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 10 Oct 2024 17:13:44 +0300
Message-ID: <CAA8EJppWgcyzS14rY2TfX2UNR1iqKBo1=qxHAbwkbeXLrZ2MPw@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: mark pd-mapper as broken
To: Johan Hovold <johan@kernel.org>
Cc: neil.armstrong@linaro.org, Johan Hovold <johan+linaro@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Chris Lew <quic_clew@quicinc.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Oct 2024 at 17:07, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Oct 10, 2024 at 04:45:57PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Oct 10, 2024 at 03:24:19PM GMT, Johan Hovold wrote:
>
> > > Again, you may just be lucky, we have x1e users that also don't hit
> > > these issues due to how things are timed during boot in their setups.
> > >
> > > If there's some actual evidence that suggests that this is limited to
> > > x1e, then that would of course be a different matter, but I'm not aware
> > > of anything like that currently.
> >
> > Is there an evidence that it is broken on other platforms? I have been
> > daily driving the pd-mapper in my testing kernels for a long period of
> > time.
>
> Yes, Chris's analysis of the ECANCELED issue suggests that this is not
> SoC specific.

"When the firmware implements the glink channel this way...", etc.
Yes, it doesn't sound like being SoC-specific, but we don't know which
SoC use this implementation.

>
> Johan



-- 
With best wishes
Dmitry
