Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002E415AABA
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 14:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713967229; cv=none; b=Clq1q8rBfeUOs3ZYJWZM220uL8IfSu20jwP0Vy+2PY6O29t2Zn58lYR9eE7f9UKWuwTFKNE0FGuQkPOeRQ9cMzbczkEg93fgyVEG1wECHMFqGgcfha7liH5Ul8oXk0CVNONT77f9Vrdr4SRz5I2ET/L9/4D13n6JOMjwkg/NOyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713967229; c=relaxed/simple;
	bh=MYOzFxs2llR0nkq7YUtvBmPawWdZDm6cWulC35wwveY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dGtFQRKyNMpTh5k6wylH1obEnrgsaX3M+5IfZpfsDo1cNJh2iwImeAdG+ZH3RmIquCB5XSk+wURGt8oVtF9KQ83PIMrJy41BP9wO3G6GvHNJWKNhpVTUGj8p5ZS/ZycN+V1BgTpNE1jImmXA75mm/tLNHKRG82iiplgo7r796ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y8A9dIeO; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y8A9dIeO"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dbed0710c74so6065503276.1
        for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 07:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713967227; x=1714572027; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MYOzFxs2llR0nkq7YUtvBmPawWdZDm6cWulC35wwveY=;
        b=Y8A9dIeOQqJo+COHKbLTEew6qPZUwnFVQGGJy8aoS0Y2vF3H5JAeOxXb/xm5YMq1bx
         Nl5hUnE4Cp9HpPdSzYc6ZTtSYIbwv1S9DeEED67modANVq5StWl7w97bjm1tyuwzoc7L
         B8H/Vya4U/HBaT4k4SCoUEml18VYTTbj/J9O7o0j16XPSysJVVdFj4fHFG1zRvRuFWBt
         I9M3QoZu6RS0OUWdDB37EzUeQx+2EZbzALp98zbSToA0r4/otjC3kNJicTLWHbUaT3QN
         Ggdz4517r25VCk6guQ9tx+RCb5p40BCh5m5SmR7Iq1cSPRKhZ7mfoxtwI4cE22pSuLZ9
         tgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713967227; x=1714572027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYOzFxs2llR0nkq7YUtvBmPawWdZDm6cWulC35wwveY=;
        b=VFHpfGiaA9YoEheSvRDQ7tLPWzk8fFuI0Gn7XJUOOuBLSytFLNwp+AIFSmLnGw7KPy
         gI8iqgYHoiQfrkrIow/qXrNWpfCoyOYwT0ZpfeqH3WVoE53WHW3xTDbZb4nfqZbK9Y9U
         +HrL7FQwA2jLi6plBUG/FFbV8N9+5PBPO1tYywKliK+/UFStb1Lr02tiLcPveeYjFkjH
         6CvsmHF7IPlqYZqBlYE1IPK09cx93YGlW0H3xyl5VnRQEl+huyGYyQ5LHcNdkPuzFVsP
         cD2iljPmjV5C1ZY4sTarcjj6Az2cbaXWqTtmrcSruGOL+wwxDq7ZcJzuZN1CiWBrJhC2
         VLIw==
X-Forwarded-Encrypted: i=1; AJvYcCWEvxEK8p3Ahd9iqmycrAj5UbbGh9PXhdllwYVnwp3st3mRWvrfsuN9+BpQsBr/tLfNqnuRsdRKm+82vG9wlRbGXSZMx6mxi/TOrkE=
X-Gm-Message-State: AOJu0YxMrfNFf2fzIabUe09n3ELKmo3kLPlNv2p1eH0ZmjYLfjeC3FLs
	HGtRSWHN0gnVGh41C3fjD6BFreQlcKxle8B1WCM3UTssjwnU+CDrSyv2SOnLbE0E5dfP4xXWadK
	E+hyB8qxb3UaXVmpkBEflsQwrHT+cWIbYUsosjg==
X-Google-Smtp-Source: AGHT+IHHYW0Tjimt0cnDpvMY/Me5aqWrTzcqLAji1jCHzJp5hhTGSX/HmO3cAaYrda7VrgDUxufgXWypZpjwA1W/ij8=
X-Received: by 2002:a25:c551:0:b0:dc7:4b0a:589 with SMTP id
 v78-20020a25c551000000b00dc74b0a0589mr3118312ybe.55.1713967226951; Wed, 24
 Apr 2024 07:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1713919602-5812-1-git-send-email-quic_zijuhu@quicinc.com>
 <1713919602-5812-2-git-send-email-quic_zijuhu@quicinc.com>
 <349b27a5-d2d3-46f1-b002-44f81e0cedef@linaro.org> <e8cd122d-e342-45c2-b078-a4ca2d8dcfff@quicinc.com>
 <dfe18768-f6da-4c60-880d-deeae3c3b04d@linaro.org> <8ae32009-5f5e-49a1-88a1-e330f0614f60@quicinc.com>
 <5e363318-c6e4-4874-8026-7940b434d583@linaro.org> <2020a858-c3d9-48a7-ad59-3691c6b98fb2@penguintechs.org>
 <CABBYNZJLCPaLTaFEfeTEn+2FpxLS8Z-W2kT1ry4jKB_W=XYNjA@mail.gmail.com>
 <CACMJSeuWQE4t2KDCRP7n-DeHN9Ndn1bE_KCRc-X2kmM9L2i7_Q@mail.gmail.com> <38736db8-eec4-4ebd-b4c4-4b404cea6e42@quicinc.com>
In-Reply-To: <38736db8-eec4-4ebd-b4c4-4b404cea6e42@quicinc.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 24 Apr 2024 16:00:16 +0200
Message-ID: <CACMJSev8=gBCw9o-ur87fMMj9K=ZWY-ECzxZjyvERYQ8P=VS7A@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] Bluetooth: qca: Fix BT enable failure for QCA6390
To: quic_zijuhu <quic_zijuhu@quicinc.com>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Wren Turkal <wt@penguintechs.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, luiz.von.dentz@intel.com, 
	marcel@holtmann.org, linux-bluetooth@vger.kernel.org, 
	regressions@lists.linux.dev, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Apr 2024 at 15:53, quic_zijuhu <quic_zijuhu@quicinc.com> wrote:
>
> >>>
> >>> Please slow down here. Zijun's patch works and Bartosz's patch does not.
> >>> I don't think Zijun means any ill intent. I am replying to Bartosz's
> >>> patch right now.
> >>
> >> Ok, that is great feedback, so I might be picking up the Zijun v7 set
> >> if we don't find any major problems with it.
> >>
> >
> > Luiz,
> >
> > Please consider my alternative[1] also tested by Wren. Zijun's usage
> > of GPIO API is wrong.
> >
> why is it wrong ?
>

I have already told you that at least three times. But whatever, let
me repeat again: gpiod_get_optional() returns NULL if the given GPIO
is not assigned to the device in question OR a pointer to a valid GPIO
descriptor. Anything else returned by it is an error and the driver
must abort probe().

Bart
