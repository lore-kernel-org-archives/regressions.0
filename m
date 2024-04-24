Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB6316C86E
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 15:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713972725; cv=none; b=tfEU+1S1wShpWcQpIsgYj6DU4IIBMh28QvIG1yfLfjU3xfG5cBfvD5De8OW6xPsG9ktE1rnSuswEWXMSg25h/7NV5FpgvvdkUu4lgekNmCFcJkdcU4BKPm7u+iYR7vXbrhh/hDVgFglSzNn8hh+gaKi/EUuSvKlCtU7CBxx0ZAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713972725; c=relaxed/simple;
	bh=NnQoCXBLj0bhOfPX+zxQdzkBqr1tX55NskR0NFv3mGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVdmYDkaDjkLucmVg9aPFuUUhele/xnUOKzf0nAeXxnqDONPYow0Z2D5WhesRghOT3g9gpGCYtgPEb1+EsWAgfaTJuCTTFD2s+Gwh5pGDkkr6gSAc7gy7dxktAuhswAi0FXhmfz3q7c0ljWrtIKgXPqpiubmhXliwgxDLijd6nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfWNSIu7; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfWNSIu7"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2db101c11beso81192031fa.0
        for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 08:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713972722; x=1714577522; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnQoCXBLj0bhOfPX+zxQdzkBqr1tX55NskR0NFv3mGU=;
        b=CfWNSIu7SDyJWUA1fdRXZ5DY/LqzYTFkConcedQ1wJPdJ2XCWEPtrTb8/B+flUk15v
         eIqtHeW1pVioKQFEwls4yGFzbw0GTybg/IkRWMn2QQQ6mh7KdvBHVF64ijzZdH5TgjI+
         yzL6O1IybMx7Zep/C88fkCBjLIGVnQ/AZvOkaffufAwYG4AFc8Yq3Q8D6oGxDTnVxwVa
         i1A9WHAp02e6jo3Yv8ZKZRFSVE8GYrA5YTIU0QVfBD1AtinPBz8yhojX3dPBuQ3mvDE3
         FIRO4gxc2c6Hw6rwsg6xIuIyDyY6DQNAzLG3sXkKhINLuwTurIAIh/I2IdyKxRjWQ168
         OtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713972722; x=1714577522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnQoCXBLj0bhOfPX+zxQdzkBqr1tX55NskR0NFv3mGU=;
        b=AwcqY3dKn75MyCs3SXpELH3QduNJ1QSMdf0L6tO9b14/TFx+EJY0CE/5+NC6xwuK8X
         e86ksCiDYs3Q/hynlYj1/yWARoJDEvboX+AAxeMloBdfA50AFxlKQ/QlAFxcEIm4xWkR
         6fgrkBikr6GzPUZXu09BgGEpyUZISsoDYt0wwDxHN+O0973sbrPcU6IdckRRzfWbTSVB
         +5eAuG06bgaT1ak1q8HJIkMoWmpNwtze9I9QtzRFqJFtKe1bNzhDUL9voJXKmUIYrTuV
         f0lQhSEdnoflmSJzUL9zJaMwzD/KE8ktketzvTP9fIFPc4YcYBm0sMhG7pE0Aq9+ZdPi
         LJsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaqjQc+2VouJwc2IEZAtg88FY5YdLlSQEy7GvVGViseHly1L+fTF1EpR4wXZLo3Q12XJMwol17lQmwKdABreTypoc21S8XHTWSA2Q=
X-Gm-Message-State: AOJu0YzM2PpBQylWU5FjPLdhuK5F3IMBltceCdrBgkPNFybvOGrJcz/P
	vrzVvyFqJHUHN008tpjCBjmaNbq0C86N2iW2QN5LUZrE4M5uxXBvC673o0oiURmOvRGoJ7PnVJP
	D03drK1kvdOrstfA/pF4jqMkcF4Q=
X-Google-Smtp-Source: AGHT+IHnwHHW5tVswXPkLGEh1/BOU677aQMerwTFfgHTg/f/3mQeQ24592IXgVRWCuQ9qGvGFnpAjB5dwpByYoANZa8=
X-Received: by 2002:a05:651c:1043:b0:2d4:54f2:c409 with SMTP id
 x3-20020a05651c104300b002d454f2c409mr1806901ljm.38.1713972721626; Wed, 24 Apr
 2024 08:32:01 -0700 (PDT)
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
 <CACMJSeuWQE4t2KDCRP7n-DeHN9Ndn1bE_KCRc-X2kmM9L2i7_Q@mail.gmail.com>
 <38736db8-eec4-4ebd-b4c4-4b404cea6e42@quicinc.com> <CACMJSev8=gBCw9o-ur87fMMj9K=ZWY-ECzxZjyvERYQ8P=VS7A@mail.gmail.com>
 <CABBYNZ+PvZb6azHoXAbO2czqK2zQnZ1ddcKRb_YX-zGSVfy+KQ@mail.gmail.com>
 <CACMJSeue3kM-G1UvO0REEAJbhU9vOqbeEzy0Qny5udKLB97e8g@mail.gmail.com>
 <2805ad96-6383-45b3-9b68-66578461bb5f@quicinc.com> <CACMJSeuyumcmkO8pYiWk6Gccd7njpke23NdboYrxNZxHx6XjAQ@mail.gmail.com>
 <34091f3a-9711-445d-a369-540bcfc49b29@quicinc.com>
In-Reply-To: <34091f3a-9711-445d-a369-540bcfc49b29@quicinc.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 24 Apr 2024 11:31:48 -0400
Message-ID: <CABBYNZJ9tex_1E=PW8zwiNyq-nJgms5nHXwvinLRd2XDc_U7Xw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] Bluetooth: qca: Fix BT enable failure for QCA6390
To: quic_zijuhu <quic_zijuhu@quicinc.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Wren Turkal <wt@penguintechs.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, luiz.von.dentz@intel.com, 
	marcel@holtmann.org, linux-bluetooth@vger.kernel.org, 
	regressions@lists.linux.dev, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Quic_zijuhu,

On Wed, Apr 24, 2024 at 10:46=E2=80=AFAM quic_zijuhu <quic_zijuhu@quicinc.c=
om> wrote:
>
> On 4/24/2024 10:41 PM, Bartosz Golaszewski wrote:
> > On Wed, 24 Apr 2024 at 16:25, quic_zijuhu <quic_zijuhu@quicinc.com> wro=
te:
> >>
> >> On 4/24/2024 10:19 PM, Bartosz Golaszewski wrote:
> >>> On Wed, 24 Apr 2024 at 16:08, Luiz Augusto von Dentz
> >>> <luiz.dentz@gmail.com> wrote:
> >>>>
> >>>> Hi Bartosz,
> >>>>
> >>>> On Wed, Apr 24, 2024 at 10:00=E2=80=AFAM Bartosz Golaszewski
> >>>> <bartosz.golaszewski@linaro.org> wrote:
> >>>>>
> >>>>> On Wed, 24 Apr 2024 at 15:53, quic_zijuhu <quic_zijuhu@quicinc.com>=
 wrote:
> >>>>>>
> >>>>>>>>>
> >>>>>>>>> Please slow down here. Zijun's patch works and Bartosz's patch =
does not.
> >>>>>>>>> I don't think Zijun means any ill intent. I am replying to Bart=
osz's
> >>>>>>>>> patch right now.
> >>>>>>>>
> >>>>>>>> Ok, that is great feedback, so I might be picking up the Zijun v=
7 set
> >>>>>>>> if we don't find any major problems with it.
> >>>>>>>>
> >>>>>>>
> >>>>>>> Luiz,
> >>>>>>>
> >>>>>>> Please consider my alternative[1] also tested by Wren. Zijun's us=
age
> >>>>>>> of GPIO API is wrong.
> >>>>>>>
> >>>>>> why is it wrong ?
> >>>>>>
> >>>>>
> >>>>> I have already told you that at least three times. But whatever, le=
t
> >>>>> me repeat again: gpiod_get_optional() returns NULL if the given GPI=
O
> >>>>> is not assigned to the device in question OR a pointer to a valid G=
PIO
> >>>>> descriptor. Anything else returned by it is an error and the driver
> >>>>> must abort probe().
> >>>>
> >>>> Ok, but there are other fixes on top of it:
> >>>>
> >>>> https://patchwork.kernel.org/project/bluetooth/patch/1713932807-1961=
9-3-git-send-email-quic_zijuhu@quicinc.com/
> >>>>
> >>>> I guess that could go in but it would really help if you guys could
> >>>> work together so we don't have more competing solutions.
> >>>>
> >>>
> >>> These threads with their 7 patch versions from Zijun within 2 days or
> >>> so have become very chaotic. Let me summarize: there are two
> >>> regressions: one caused by my commit 6845667146a2 ("Bluetooth:
> >>> hci_qca: Fix NULL vs IS_ERR_OR_NULL check in qca_serdev_probe") and a
> >>> second caused by Krzysztof's commit 272970be3dab ("Bluetooth: hci_qca=
:
> >>> Fix driver shutdown on closed serdev"). The patch I linked here is ho=
w
> >>> I propose to fix my regression only. These fixes don't seem to
> >>> conflict with one another.
> >>>
> >> it is not conflict issue, from my perspective, you fix are wrong.
> >> do you see my patch change log?
> >>
> >>> We (Krzysztof and I) have provided feedback to Zijun but he refused t=
o
> >>> address it and instead kept on resending his patches every couple
> >>> hours. Zijun's patch 1/2 proposed to revert my commit 6845667146a2. I
> >>> disagreed and proposed a way forward by fixing the regression. This
> >>> fix was incorrect as pointed out by Wren, so I submitted v2 which
> >>> works.
> >>>
> >> v2 is not right from my point as i commented with your solution.
> >>
> >> you don't answer my questions commented within your solution.
> >>
> >> what is your question i don't answer?
> >>
> >>> Bartosz
> >>
> >
> > Luiz,
> >
> > This is an example of how Zijun will borrow any attempt at meaningful
> > communication under a heap of incomprehensible emails. Krzysztof has
> > already given up and I think I will stop too now. As the GPIO
> > maintainer I suggest you take my fix for this regression. I can't make
> > you though and I've already wasted way too much time on it. Your call.
> >
> how about GPIO maintainer? it is your change about GPIOs causes serious
> regression issue.
>
> i maybe send many mails. but dos it have any relevant my change's rightne=
ss.

Well you are not making it any better if you are still claiming the
maintainer doesn't know what doing when you should really be thanking
him for looking into this, now perhaps his changes doesn't address a
particular problem you are trying to solve nevertheless it is worth
incorporating his changes in your set and then have yours on top
without reverting his changes? Can you do that or there is something
fundamentally broken with that.

Everyone here probably have their own assignments, so you are getting
sort of _free_ consultancy, so please instead continue disputing what
we are suggesting at least try to incorporate the suggested changes,
we want to have it fixed properly so we don't have to keep receiving
the same changes over and over again which is a waste of everyone's
time, including yours.

--=20
Luiz Augusto von Dentz
