Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F02315AABA
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 13:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713966733; cv=none; b=nUzhUGHtk4ySjB/brK8+NiUmPU2xs7w5t1fZ/QDDiGtoZHpArvrpLYF3X3LJCBeRU5qntvqyupqlEXchQavVb5IjPtjjl57yoOohl0k5JVNeve+FaEUOaFf5DOv3jr5YKEjQnYKX7lfAm+IA5H3LGdWO64L9iBJaHdrnlFBz67I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713966733; c=relaxed/simple;
	bh=VdzoU7XoFrllSZVKXg5eoQOzir2X+S3Z7WiLGU4rHC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijY7p+Hw4lAl83De9GtRuBAj6uLp+u59AciZF5W8g4l0EOrdXYoGXIYIp0p++S5ygM6RgYcpYwMfI1hdDFRG2+p6Fvitel1xUW3iPqhEdy6p5VBM1TJxcNpmR0ItMF29fc5dRaQyLdLnVcFazujvzKi0Rqd2g6JfRm0X8Qg6kr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y9+nHyEP; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y9+nHyEP"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-de46da8ced2so6816829276.0
        for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 06:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713966731; x=1714571531; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzADXOfIhmd+aXHGQmNMC68KitnsoHs9qk0EvLy4dSo=;
        b=Y9+nHyEPjdZQ+p2HuOuJ/tOujGldGGnpuvLDhbun1PHk6wRyYX3vdDsWCwR+aw9Lyv
         ZtfEBHzEEZfeLrbxQXF6G5vwCVFYBCcsmu6EgCyuKvPHLM8s+m1OsEk2eXl3tG2fhYGx
         /sYe9QkYnlDbyEWECObgitYPGHqI2uFGc/NeZceiPiiUjWLQIT/7lKC9EL6hRVO1Edm0
         D/2JUw6Rrp6QcQazqQvvKFkrrIk7m+TxU1MFmia00IjQF/CuLQM/RNy6wlj8jhSFC9Yh
         QNNSshMCGqXEMCkrhf9xe53g4aPKEE8+qsR1qFdRP6gc7OalhB8sGGfrIY5xVAq2xfXq
         rzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713966731; x=1714571531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xzADXOfIhmd+aXHGQmNMC68KitnsoHs9qk0EvLy4dSo=;
        b=k1bcauPaNCum/HjrZNZZA23oSZJXzx4soYbOAFlFrEhtx6UdGpoD//RCMr4nq9YhC3
         0rU44Seq6d5U3XkNkb5FUy4k1xM3pSWc69MOdh23EvNQsL58jth2BG/7kDggG42g5Gr+
         QSBq12YeW4LOKmjXb1+ZeoePBmIHFMCAw6Yijuv3xxZ8O/C+B55o8jPYJq5hLwBnYF0i
         +APu5IBkkbgsuD5M93PNMTgog/7UJOx4FYdlyjqaRpyOmc3lEWgp+cTc1CEe2sVjxCbI
         xDleGLITTQM995zGkBn+sVC0cWz/YmkaelZp+XwKdejinjp3fk7fYFx3wngaopzuVNOt
         tsEA==
X-Forwarded-Encrypted: i=1; AJvYcCVSzxzIMlJuNLqe22YAST9FfvwMDE4f8qvK++mN4DqNHG/nDnB1PV6zNJmoTFdrMI3BJm8yocCDgo5Sr52m8QKiMLo6gFpT4bQcAWk=
X-Gm-Message-State: AOJu0Ywxl+gMrqp3K52ee4fnUwwL2HoxLKrJjenR+o0KvJKiAcmhnz1x
	l5PYmbTfdvR+JVjEcgCZKrT/LxpZ2x8yAZy98NKm0769I71huDxFwpnrBB+5naNnUY6p52Fnaes
	+1ALSgbWkV9DY/3nmzFtX+lLJH5ljyLaTrbBVKQ==
X-Google-Smtp-Source: AGHT+IGJLVldlCF5ArUWeqphR5eku+39uqREoBlWKHhqFaMPw9N8KGWMdE1PsgT0a73JlFV5wLUN/qCb3QDqUr6Y6Gk=
X-Received: by 2002:a25:7903:0:b0:de5:5037:8861 with SMTP id
 u3-20020a257903000000b00de550378861mr2656924ybc.48.1713966731284; Wed, 24 Apr
 2024 06:52:11 -0700 (PDT)
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
In-Reply-To: <CABBYNZJLCPaLTaFEfeTEn+2FpxLS8Z-W2kT1ry4jKB_W=XYNjA@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 24 Apr 2024 15:52:00 +0200
Message-ID: <CACMJSeuWQE4t2KDCRP7n-DeHN9Ndn1bE_KCRc-X2kmM9L2i7_Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] Bluetooth: qca: Fix BT enable failure for QCA6390
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Wren Turkal <wt@penguintechs.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, quic_zijuhu <quic_zijuhu@quicinc.com>, 
	luiz.von.dentz@intel.com, marcel@holtmann.org, 
	linux-bluetooth@vger.kernel.org, regressions@lists.linux.dev, 
	kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 24 Apr 2024 at 15:49, Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Wren,
>
> On Wed, Apr 24, 2024 at 1:04=E2=80=AFAM Wren Turkal <wt@penguintechs.org>=
 wrote:
> >
> > On 4/23/24 9:31 PM, Krzysztof Kozlowski wrote:
> > > On 24/04/2024 06:18, quic_zijuhu wrote:
> > >> On 4/24/2024 12:10 PM, Krzysztof Kozlowski wrote:
> > >>> On 24/04/2024 06:07, quic_zijuhu wrote:
> > >>>> On 4/24/2024 12:06 PM, Krzysztof Kozlowski wrote:
> > >>>>> On 24/04/2024 02:46, Zijun Hu wrote:
> > >>>>>> Commit 56d074d26c58 ("Bluetooth: hci_qca: don't use IS_ERR_OR_NU=
LL()
> > >>>>>> with gpiod_get_optional()") will cause below serious regression =
issue:
> > >>>>>>
> > >>>>>> BT can't be enabled any more after below steps:
> > >>>>>> cold boot -> enable BT -> disable BT -> BT enable failure
> > >>>>>> if property enable-gpios is not configured within DT|ACPI for QC=
A6390.
> > >>>>>>
> > >>>>>> The commit wrongly changes flag @power_ctrl_enabled set logic fo=
r this
> > >>>>>> case as shown by its below code applet and causes this serious i=
ssue.
> > >>>>>> qcadev->bt_en =3D devm_gpiod_get_optional(&serdev->dev, "enable"=
,
> > >>>>>>                                                 GPIOD_OUT_LOW);
> > >>>>>> - if (IS_ERR_OR_NULL(qcadev->bt_en)) {
> > >>>>>> + if (IS_ERR(qcadev->bt_en)) {
> > >>>>>>          dev_warn(&serdev->dev, "failed to acquire enable gpio\n=
");
> > >>>>>>  power_ctrl_enabled =3D false;
> > >>>>>>    }
> > >>>>>>
> > >>>>>> Fixed by reverting the mentioned commit for QCA6390.
> > >>>>>>
> > >>>>>> Fixes: 56d074d26c58 ("Bluetooth: hci_qca: don't use IS_ERR_OR_NU=
LL() with gpiod_get_optional()")
> > >>>>>> Reported-by: Wren Turkal <wt@penguintechs.org>
> > >>>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218726
> > >>>>>> Link: https://lore.kernel.org/linux-bluetooth/ea20bb9b-6b60-47fc=
-ae42-5eed918ad7b4@quicinc.com/T/#m73d6a71d2f454bb03588c66f3ef7912274d37c6f
> > >>>>>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> > >>>>>> Tested-by: Wren Turkal <wt@penguintechs.org>
> > >>>>>
> > >>>>> No, Bartosz' patch should go.
> > >>>>>
> > >>>> what is Bartosz' patch.
> > >>>
> > >>> Srsly? You were Cc'ed on it. How many upstream patches on upstream
> > >>> mailing lists do you receive that you lost track of them?
> > >>>
> > >> Bartosz' patch have basic serious mistook and logic error and have n=
o
> > >> any help for QCA6390, and it is not suitable regarding DTS usage.
> > >
> > > Really? Why you did not respond with comments then? Considering how
> > > imprecise and vague you are in describing real issues, I have doubts =
in
> > > your judgment here as well.
> >
> > Please slow down here. Zijun's patch works and Bartosz's patch does not=
.
> > I don't think Zijun means any ill intent. I am replying to Bartosz's
> > patch right now.
>
> Ok, that is great feedback, so I might be picking up the Zijun v7 set
> if we don't find any major problems with it.
>

Luiz,

Please consider my alternative[1] also tested by Wren. Zijun's usage
of GPIO API is wrong.

Bart

[1] https://lore.kernel.org/linux-bluetooth/CAMRc=3DMfJ1v3pAB+Wvu1ahJAUvDfk=
3OsN5nieA-EYgTXPwMzqyg@mail.gmail.com/T/#mbf94795476d21df0a24441470ce02def9=
d2970a7
