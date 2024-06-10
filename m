Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D11014884F
	for <regressions@lists.linux.dev>; Mon, 10 Jun 2024 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718028189; cv=none; b=BQP56PCCfL5JDEkekeQNdUeSVzvP1LZVjSWFZMeRAIMQ6yav6RM8r2zKobwXYeUVWe2V3s26pjLvleSDiqH1suj28JsACdoq/cBI67eT7FjHxt/zMjzpb5zGxdSGgtOO8Wf2Nwcm/pJ/YpGaSjkOvsV66x4bbDpjHwkkV0aK0O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718028189; c=relaxed/simple;
	bh=vs+RdkwtIQLASJx6uSQRNm6oe/+uQlNUtvN9mBaJLRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpjflRJRRjzjl/bvwjDO+Hf97Pm3SJHvrXtxhmgiodmOzCCffQ/9iVnqIyvEX07BQcMP7ZV6da33GoiCRqNLXsrqLSQegsZD5DkDfrrfoCCTTXQy6rlcC1rOXfYNnKe34r5SpiESRp2sZhzvGKPjoGv7VmhFg/8xw3j8UDmkRj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7M1SFxJ; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7M1SFxJ"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eae5b2ddd8so24598611fa.0
        for <regressions@lists.linux.dev>; Mon, 10 Jun 2024 07:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718028186; x=1718632986; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vs+RdkwtIQLASJx6uSQRNm6oe/+uQlNUtvN9mBaJLRA=;
        b=X7M1SFxJ7N4qlikXBTIoudSnruxiLLWLdkrXMmnjo0gkZacWtAtKUGvqroobgnhyCV
         nufyURrLYajq5xdSuNk4j4FemlC2ktA6+CuidEq232S1pK0H7FAy85vIw6Yk/iFzIMKL
         Tjm+yFfm1ovg7BTXU3hSaEvemAkXU7k/l+FXElm34Ov66yKlS4NoKZBsnYV5RC56jomt
         86AVGRVYsKlQVTbToXe9AOA0yx5mHMrc1NEIKoSMjy9i9dhxdnQivdV+x/w3nBO+1YSh
         CvKNMt4P7IMElboTOEqVOoeqNWhdT17fH4oyBx2++a7MaEdS8eCZYk+LB4M0zUfGTaAQ
         kyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718028186; x=1718632986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vs+RdkwtIQLASJx6uSQRNm6oe/+uQlNUtvN9mBaJLRA=;
        b=GPTKekyX7GaHvMmmuZlBy/nxOqUjYWj1j8DH2jQQBbBP4wqtJadkbGEkgTC1LSEtO+
         PtPrxpgBuWrhbSX0VQd1OZ4ArztgG6W1zUII9kAYEhzKaL8HWbdy8R2bHyAq93Ip2Pu9
         C3BH/m4LfyRdxIVRbZfzZyStwxwefMSia7Y2qyDn9QYABpq6/He8nyEffGDxeBBG97S6
         CfdQPOn/7SFaPMiEHAqPHr7zPdq515L2013yX1TZpAdhBTqfiGjWNjrxVzmAgEntHST6
         UvtXLZZbiKBrDucHy6M2C4PuJos5B9drtN0gqhJ5OvlBi19Pl2dxH9VDGZYoVKmVXhpJ
         w//g==
X-Forwarded-Encrypted: i=1; AJvYcCXq1oxVvsFhcVwtlB9s6JyT13WlZcksIUpgQGdySB5Mu6Ab8n2/jzTSrPc5KQaqiLkO8RCMYY0HTAFMC1tAUsedtw60m36pMJ4IcOA=
X-Gm-Message-State: AOJu0Yy6iWM+oez2yfrUuQmYI9hqqX8TslK01WNLb24tGi7LceDYNsAs
	eA2InHiFBAoQmqtjLcFiv2D5MIN+dN+COUGNTw0mx5lI8T1wpYmaPGmRGqBUVw5+sW72hNmyGMm
	orG19lPRlzZpNhtFVML/TLZze2Es=
X-Google-Smtp-Source: AGHT+IEyVtLS1ZtDhsBER19IZggAVJyeuIf55Qo2irey9UJcbDThkM+mxsYGcrRvwbFhbmMl7Pp4GQE8WMd0fybY3xA=
X-Received: by 2002:a05:651c:1546:b0:2eb:ec23:fe6 with SMTP id
 38308e7fff4ca-2ebec23103emr6495311fa.11.1718028185344; Mon, 10 Jun 2024
 07:03:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1715866294-1549-1-git-send-email-quic_zijuhu@quicinc.com>
 <7927abbe-3395-4a53-9eed-7b4204d57df5@linaro.org> <29333872-4ff2-4f4e-8166-4c847c7605c1@163.com>
 <5df56d58-309a-4ff1-9a41-818a3f114bbb@linaro.org> <0618805b-2f7a-473d-b9fb-aea39a1ef659@163.com>
 <3d27add1-782c-4c19-9d84-d0074113c7a2@linaro.org> <fc035bd7-c9e3-458f-b419-f4ac50322d02@163.com>
 <caa701f8-0d2d-4052-9e55-2b755b172c56@163.com> <eca0655a-260e-45d3-bb4d-7de6519ac148@linaro.org>
In-Reply-To: <eca0655a-260e-45d3-bb4d-7de6519ac148@linaro.org>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 10 Jun 2024 10:02:52 -0400
Message-ID: <CABBYNZKx15mrTgvE6bSvxn6YVv=jJKj7jHu1UXVFrtvffHQa9Q@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: qca: Fix BT enable failure again for
 QCA6390 after warm reboot
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lk Sii <lk_sii@163.com>, Zijun Hu <quic_zijuhu@quicinc.com>, luiz.von.dentz@intel.com, 
	marcel@holtmann.org, linux-bluetooth@vger.kernel.org, wt@penguintechs.org, 
	regressions@lists.linux.dev, pmenzel@molgen.mpg.de, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Mon, Jun 10, 2024 at 9:24=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/06/2024 15:17, Lk Sii wrote:
> >>>>> Why Zijun cannot provide answer on which kernel was it tested? Why =
the
> >>>>> hardware cannot be mentioned?
> >>>>>
> >>>> i believe zijun never perform any tests for these two issues as
> >>>> explained above.
> >>>
> >>> yeah, and that was worrying me.
> >>>
> >> Only RB5 has QCA6390 *embedded* among DTS of mainline kernel, but we
> >> can't have a RB5 to test.
> >>
> >> Don't worry about due to below points:
> >> 1) Reporter have tested it with her machine
> >> 2) issue B and relevant fix is obvious after discussion.
> >>
> > I believe we have had too much discussion for this simple change.
> > @Krzysztof
> > do you have any other concerns?
>
> No, nothing from me.

Ok, but I guess since you didn't sign off that means you are still
unconvinced that this should be applied? I could try pushing it to
bluetooth-next to check if it blows up on the next merge window, but
it is not that nice to have things completely untested, as far
upstream goes, being pushed that way.

--=20
Luiz Augusto von Dentz
