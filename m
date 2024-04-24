Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA6415D5A3
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 14:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713967380; cv=none; b=ZogtQ/qpq8vUrNghXa/InDlnDQvpUHQehQ6W4mdF08etPabPihUZjy/+qBghHQL6zACWpZrvorwXzPoh/up1Gu+RW2h1zsCKwNSMj6envEUkHd2MdZb9V+ZQWGaOkxcqh9gqY5sN8zb1m223wI8BshQneNASNNT+ZAYmTS+Y1c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713967380; c=relaxed/simple;
	bh=T3dsrVXvM1BzpCdkc7fICVJHK0ny7JNkxS2SkwBDyiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQZ3yp2NvS0W45fRN5yXusUa1qCs633x8uYxrVZcbfo3bgan1iEOizBA46gjmOQSyfoZgoiVek8Xb+Kyg4dhx1xNI9Gb/J227odomRrg1v+8RI78pN5BuF8fxxfGHdpb0xYEGm9CJU1TKnuoaNGTzPpOUtwXglH/4lJKwBFnXmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nH9rt3Kf; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nH9rt3Kf"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d8b2389e73so83736511fa.3
        for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 07:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713967374; x=1714572174; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rzo5Rc1BtV9rx2z4n0U4/4xN9Y5TF6zpjFkVOhcV8BY=;
        b=nH9rt3Kf1SdpUJ4AdbNXh3YqE+FPKsR61Sv01nNUYH3Z1B2POJC0PJkRtBTROYQDda
         lgiEoxeHddNfJE1LN7KOcnMY7g3sgPABgBDVTL12ffCX8mMnZn9MkX0mB2NGjCT23eUi
         MQNsNAwGBPeI77Yj1a0GOaigkGTczKADjZgB89zmzMcQtG+rdVZTzl39tPZkkkVPbIxz
         5V8+ew7GAHGxJg5h5V/CQ9gkVHrKczcCFnklgwwPqPiniBYRunISkxzCUwVTY6uo89Gl
         3LacV0EqCGWQRrsIaeMI/jB6y8Z9Kkbc0wQQIe1+eEfR4k8LOcypzOj0HYrd012m9IBG
         ufAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713967374; x=1714572174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rzo5Rc1BtV9rx2z4n0U4/4xN9Y5TF6zpjFkVOhcV8BY=;
        b=w9j8zbFjLRnl5HdAMX9QjFzvQqw/HeEScAclBFnpXb5ygFUBS6Njb/aMzB0a+hQtCK
         njXjJvdHyy7ahQelRr5rE1VTKbvBmWjTlIeoxvd0LiX/rx/NRjFnF5Nz+4ibph07WmNf
         UdbVx8yb6PoKPwBYyfgVnl6xoYMJJ1H5vSp7tJi/j0mwc/2qrfSTUHqsxnY2AVr54wNh
         uwrX7PDzuA9YycUSsCyl+og9RPl4ETglszOJLJf9tnLyjqtvlHXGqv8JHWXFZ2XGUt+S
         qtkSs+M1eUoqsvuIecUuiIGP5Tb87Jgtigj4vhln5+GBHYeh12jZp6oSvQU9B9qn/97l
         myzw==
X-Forwarded-Encrypted: i=1; AJvYcCUufCh9CqUNQ6BQvSKjEzD9KBS8P9VOqhVkNx+AVjENzSQ2jllFQuBFG4rTfZm4+9wYkORv0Th0KzGiOoVhYEOpLAZs1dU/JhYXGlo=
X-Gm-Message-State: AOJu0YydBIovf1t6Rpz8PFMh04FZmLb8gOcdPkmBzd0cJpB8O4xdnNuY
	8DnD7mlbOfgWBsh1COhhjV24YzqfbYA9Z2XTSTsOXnSVG7uAZW3mDrxCdsVLjRLx1yUYAES0/uC
	3PFIkGxYRXx4VIip+Tmm8Duz+7uo=
X-Google-Smtp-Source: AGHT+IGGWhiCP32oDBI+bfuJqIEUZrp4Qg6QUVTcbWqcN86p8P+m/Fq+VM54Yc1MDire/bBiZZeV7WZjgbs0XliijJc=
X-Received: by 2002:a05:651c:1046:b0:2d8:6561:72ca with SMTP id
 x6-20020a05651c104600b002d8656172camr1623297ljm.19.1713967373471; Wed, 24 Apr
 2024 07:02:53 -0700 (PDT)
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
 <CABBYNZJLCPaLTaFEfeTEn+2FpxLS8Z-W2kT1ry4jKB_W=XYNjA@mail.gmail.com> <CACMJSeuWQE4t2KDCRP7n-DeHN9Ndn1bE_KCRc-X2kmM9L2i7_Q@mail.gmail.com>
In-Reply-To: <CACMJSeuWQE4t2KDCRP7n-DeHN9Ndn1bE_KCRc-X2kmM9L2i7_Q@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 24 Apr 2024 10:02:40 -0400
Message-ID: <CABBYNZLBx4yYy4V2H1jQErXi=UaQLFRbox3FkxHFNCf8Zj0+RA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] Bluetooth: qca: Fix BT enable failure for QCA6390
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Wren Turkal <wt@penguintechs.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, quic_zijuhu <quic_zijuhu@quicinc.com>, 
	luiz.von.dentz@intel.com, marcel@holtmann.org, 
	linux-bluetooth@vger.kernel.org, regressions@lists.linux.dev, 
	kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Wed, Apr 24, 2024 at 9:52=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:
>
> On Wed, 24 Apr 2024 at 15:49, Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
> >
> > Hi Wren,
> >
> > On Wed, Apr 24, 2024 at 1:04=E2=80=AFAM Wren Turkal <wt@penguintechs.or=
g> wrote:
> > >
> > > On 4/23/24 9:31 PM, Krzysztof Kozlowski wrote:
> > > > On 24/04/2024 06:18, quic_zijuhu wrote:
> > > >> On 4/24/2024 12:10 PM, Krzysztof Kozlowski wrote:
> > > >>> On 24/04/2024 06:07, quic_zijuhu wrote:
> > > >>>> On 4/24/2024 12:06 PM, Krzysztof Kozlowski wrote:
> > > >>>>> On 24/04/2024 02:46, Zijun Hu wrote:
> > > >>>>>> Commit 56d074d26c58 ("Bluetooth: hci_qca: don't use IS_ERR_OR_=
NULL()
> > > >>>>>> with gpiod_get_optional()") will cause below serious regressio=
n issue:
> > > >>>>>>
> > > >>>>>> BT can't be enabled any more after below steps:
> > > >>>>>> cold boot -> enable BT -> disable BT -> BT enable failure
> > > >>>>>> if property enable-gpios is not configured within DT|ACPI for =
QCA6390.
> > > >>>>>>
> > > >>>>>> The commit wrongly changes flag @power_ctrl_enabled set logic =
for this
> > > >>>>>> case as shown by its below code applet and causes this serious=
 issue.
> > > >>>>>> qcadev->bt_en =3D devm_gpiod_get_optional(&serdev->dev, "enabl=
e",
> > > >>>>>>                                                 GPIOD_OUT_LOW)=
;
> > > >>>>>> - if (IS_ERR_OR_NULL(qcadev->bt_en)) {
> > > >>>>>> + if (IS_ERR(qcadev->bt_en)) {
> > > >>>>>>          dev_warn(&serdev->dev, "failed to acquire enable gpio=
\n");
> > > >>>>>>  power_ctrl_enabled =3D false;
> > > >>>>>>    }
> > > >>>>>>
> > > >>>>>> Fixed by reverting the mentioned commit for QCA6390.
> > > >>>>>>
> > > >>>>>> Fixes: 56d074d26c58 ("Bluetooth: hci_qca: don't use IS_ERR_OR_=
NULL() with gpiod_get_optional()")
> > > >>>>>> Reported-by: Wren Turkal <wt@penguintechs.org>
> > > >>>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218726
> > > >>>>>> Link: https://lore.kernel.org/linux-bluetooth/ea20bb9b-6b60-47=
fc-ae42-5eed918ad7b4@quicinc.com/T/#m73d6a71d2f454bb03588c66f3ef7912274d37c=
6f
> > > >>>>>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> > > >>>>>> Tested-by: Wren Turkal <wt@penguintechs.org>
> > > >>>>>
> > > >>>>> No, Bartosz' patch should go.
> > > >>>>>
> > > >>>> what is Bartosz' patch.
> > > >>>
> > > >>> Srsly? You were Cc'ed on it. How many upstream patches on upstrea=
m
> > > >>> mailing lists do you receive that you lost track of them?
> > > >>>
> > > >> Bartosz' patch have basic serious mistook and logic error and have=
 no
> > > >> any help for QCA6390, and it is not suitable regarding DTS usage.
> > > >
> > > > Really? Why you did not respond with comments then? Considering how
> > > > imprecise and vague you are in describing real issues, I have doubt=
s in
> > > > your judgment here as well.
> > >
> > > Please slow down here. Zijun's patch works and Bartosz's patch does n=
ot.
> > > I don't think Zijun means any ill intent. I am replying to Bartosz's
> > > patch right now.
> >
> > Ok, that is great feedback, so I might be picking up the Zijun v7 set
> > if we don't find any major problems with it.
> >
>
> Luiz,
>
> Please consider my alternative[1] also tested by Wren. Zijun's usage
> of GPIO API is wrong.
>
> Bart
>
> [1] https://lore.kernel.org/linux-bluetooth/CAMRc=3DMfJ1v3pAB+Wvu1ahJAUvD=
fk3OsN5nieA-EYgTXPwMzqyg@mail.gmail.com/T/#mbf94795476d21df0a24441470ce02de=
f9d2970a7

@Wren Turkal How did you test this, what patches did you have?

--=20
Luiz Augusto von Dentz
