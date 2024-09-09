Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935F61AD9D5
	for <regressions@lists.linux.dev>; Mon,  9 Sep 2024 09:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725872737; cv=none; b=hMov1ZVcbG+OIjs+03z3vB6trJj3N+/dPaISg7jK+pgUDKPZycxJvj/2HLNomQoau4GnN7Z5tRCkEcMfb7thV0fwc11hI8zdW+gw/v89mXTOOjqJ9MMlvbW99EAlcoYOGAQRxgsB0ul/v4ZHb25rcUskYqsHyBKUQk8plCyCGpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725872737; c=relaxed/simple;
	bh=BB3/H5ySqRyu6/77CobU02zoSYGnRaT8/VTpD8q1nkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJ0w/nrufCn79pxNwkxb1bJWfMgEV9nIaBZSsngWn5MtbiwjOIBkS9QFViZBk5l+gqphJvQKHpYPzQ0PNi0Ey3SobRNjj8/vm9+aGzxFjiBXM4SQXMjrsfRi9CYRAtTLjQiCSRXXsQkBpNtJRsud5qIrVMy8XAnaWpb9AYbgH5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tmsE0XZd; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tmsE0XZd"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e1a90780f6dso4257286276.0
        for <regressions@lists.linux.dev>; Mon, 09 Sep 2024 02:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725872734; x=1726477534; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j2t8R4xfnSC9w9Cn08xrD7PLm+PTwWMORf6NFYOH81c=;
        b=tmsE0XZdtwN7X2nulsPC9yNjZbNNaOb6z5JSu3R63fHDShx/0/gAOF0gTEJTZMIAii
         Rq1e3ruxj82rBKMreaaBc5ar7Up724PdBUaII707w15AGywK4wO6xERvIJGfDSvdfSJV
         UZ1vHXdvx5Avx8N8LhsR4lDRvLnAD086hvxlOIuNuzBPdWRIkcwcNfSG2AQ0b5NEDuFc
         9tL7Waa+DQvRZeg2KYXwId6A1c9umnbgYJ+Gx30SXWe3Pt5EyW92E+jS6Rr6ztlvJ2W4
         HUZGZkldz8RPcL2/BEf0d9gwISMmxZc+mdOO9Zds+7+zcAdBbtGdHN8d6XLO899UDIFP
         wYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725872734; x=1726477534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2t8R4xfnSC9w9Cn08xrD7PLm+PTwWMORf6NFYOH81c=;
        b=G/EFEp/4bIYdIfpiewogTtSlkvg4uA5OdZSU/JsJYzORM+hl7cAArAIv5FLGcM3CRt
         W33sOWwm6Muzu7RBARy7nFrV+4pi11Y5FjFZ5v4JaAcDAnaTsjfxCM11CWAmEY3hytU6
         5+M0HbHhWuJvaZHry3hdNuugwvw/RRgRyeGiOC2e1PudXAIxQCH7Hcpexn4aWtjxOqgY
         0CwZbWtBsDK2bSPzfgOGCGYREoN53FlwJNmbf2NnGK2TfkX8/OcNcHDbRiEL5qhA9UWS
         C4cXJGlWlRzFRqV+v5ND6IEIlGj648IekuBzzm7Eaqt7j+mdv2X+pXuxVwd5YNcf6anB
         u3Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUlHu49gG9cB2SybBS1E7CRzmU+LGOpcjTozhuf4tvfvz6Ere5n8O2y+vI3feTkLuFnTXfmPS+cmkTykg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVPk4pCCt0Y1/GmBgVCnL+WUoJ3kItAioL9eJenlVHFVzjcfNc
	n9fOjG+WhzxjuRShGvrtb3mIcurHBkKJJwC0c8/gtCpXhxpPOw/BhIZm+8BEElI1f2z/XGJ37Yu
	gEFshTpnVMsFqpjNRSY3TPzRy5hwZu1W+89whRg==
X-Google-Smtp-Source: AGHT+IG0rmU+PJ1sUsI9xaYzlyO0fuHlZgEClWUHvIo++2qG8J7dLhkan6PH1kB/kHCDTDrPTR3yTt3ldtPN97UpiV0=
X-Received: by 2002:a05:690c:d1a:b0:6db:2753:cd9c with SMTP id
 00721157ae682-6db45273f36mr119317517b3.44.1725872734530; Mon, 09 Sep 2024
 02:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com>
 <CACMJSes4cnCNUHiZUr4CF-K2c8-1VYzuh=T8JDi_erqfShkuZA@mail.gmail.com>
 <1f889bba-0c89-45db-b360-b21d6bba7772@gmail.com> <68b0476f-dfa1-44cb-a01a-f4afbaaa98e5@gmail.com>
 <vtdrxh57zxpu6xktzehcpx7hkaqclg5kya5jojrbkmo76yswxx@libmc5evobkb>
In-Reply-To: <vtdrxh57zxpu6xktzehcpx7hkaqclg5kya5jojrbkmo76yswxx@libmc5evobkb>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 9 Sep 2024 11:05:23 +0200
Message-ID: <CACMJSeuONLsWy3rQnLsOxm-Qqgcmd67XNhCMPvTd=UtgYoPfzg@mail.gmail.com>
Subject: Re: [REGRESSION] firmware: qcom: scm: smc: switch to using the SCM allocator
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rudraksha Gupta <guptarud@gmail.com>, regressions@lists.linux.dev, brgl@bgdev.pl, 
	andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, robimarko@gmail.com, 
	quic_gurus@quicinc.com, luzmaximilian@gmail.com, catalin.marinas@arm.com, 
	will@kernel.org, srinivas.kandagatla@linaro.org, arnd@arndb.de, 
	quic_eberman@quicinc.com, elder@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com, ahalaney@redhat.com, 
	quic_djaggi@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Sept 2024 at 11:57, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, Sep 07, 2024 at 01:49:02AM GMT, Rudraksha Gupta wrote:
> > > Looks like qcom_scm_get_tzmem_pool() returns NULL. Not sure how this
> > > happens. Can you confirm that the QCom SCM driver probed correctly?
> >
> > Thanks for looking into this! Please let me know how I can help!
> >
> >
> > I've been building the driver into the kernel I believe. Here's the relevant
> > line in the config:
> >
> > $ rg -i "scm"
> > samsung/expressatt/linux.defconfig
> > 1615:# CONFIG_ARM_SCMI_PROTOCOL is not set
> > 1627:CONFIG_QCOM_SCM=y
> > 1628:# CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT is not set
> >
> >
> > It seems like the scm driver is being probed:
> >
> > ~ # dmesg | grep scm
> > [    0.066438] qcom_scm: convention: smc legacy
> > [    0.362543] bus: 'platform': add driver qcom_scm
>
> The scm driver is added, but it is not probed as there is no SCM node in
> DT. I'll send and RFT patch to add it. However the issue still persists:
> the driver should not crash if there is no SCM device on a system.
> qcom_scm_*_alloc should fall back if there is no SCM.
>

Ugh, so some SCM calls seem to expect that they can get called without
the SCM driver. It's not very intuitive, I would expect that the
driver must be up for SCM to work at all.

I think we should fall back to using kzalloc() in such cases as
there's no struct device to use with the DMA alloc APIs. I'll prepare
a patch.

Bart
