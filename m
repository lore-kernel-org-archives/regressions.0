Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E58315D5A5
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 13:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713966563; cv=none; b=lKG7dA/qZ2Ek0CFJLkfJ+uhyhSt2amMspww1yzz7NSdqKmVm3zet8hQtR0eOMlcywUJJyFknaopMOt7oABPm6+GK87wT0C5MCYwTVDaxNjKfHm2hjkluzl9BMA8XEYpqy5nAlyru0YNi3FIKWlKf6LvR8YflHMzrBoSK7Gh2jSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713966563; c=relaxed/simple;
	bh=MhZBQBp84TPByg54trWqck4iqHKnX8KYkagDZZlGwb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTkqrCRUkgQRthQOU9sy0vvO1Mqqtz+/B68trgfwXsmdz3330FYSFHhOaiFvbG9cEKBpEBCOiry6+e7DUnpxw7+lZIbdf5FBY4vEQl07hMcfm5cFT2qk23rlypcF2B93CUvNn6io4oQuxyYrjvJdPAWiJSOtV6dAeH5sFGANU34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nE2brdfh; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nE2brdfh"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d88a869ce6so96547471fa.3
        for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 06:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713966559; x=1714571359; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sF1JQ44Dat+BvhpKfJnSWpswqIUZ9E20D3rBpoIixw=;
        b=nE2brdfhSpTv1D1awoRpXhwVCAm20pg1orcagi6NfxJIM5QNlxjsbQi3TuApZLpyJu
         upPBfzNnfNA6Gn4MRnFkOl/H6EjOdziXi+93SAy0m29E1lhuCRaBXERn45Xf7c1h9ONB
         tINhv7wk7Uv2PWIoxNmLSzg72fxANBysF2HHccMpyqK2dze9r2HuIxc2rs3DBd9E5kiB
         vNj36gLR/T3M1a40ftGYVuFp/y1bwymsjsHnNGK1hMt4IjhiN9ZYc2CLTwl39zVD0lS7
         GXVEGdcOyg70RY4564ShUZ3P0Yw98IgkH7WK6HbttmBuSAcSxlurnfc86Wp5pJvfTXkB
         PuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713966559; x=1714571359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sF1JQ44Dat+BvhpKfJnSWpswqIUZ9E20D3rBpoIixw=;
        b=EqQSf63saPe+PdzKGndqo8FfChE7gdzdm4+qfjqyb054sD5J675aAuphx+jQoBB8rs
         kiXuDGCRSYK8QPvP30QVGZeNMcyZzlM+CpX1e+skwQECGTfqW/Yu2CaRI74L8w30GAvW
         nbojZcJucfxZzGuig87I4YWT1h7AqEyrNEe6qqfAqCe5OyKsPK0LvxllmvcRPg4r9xNl
         UzHPd3jxqRRf9SNBzb+hFa7XEVV1L1gbJ1IIcEqco0ZDkZpvw+R64WiWUCi6JQB8Mj+J
         MrMVInwyz8e0lk41gYQKLAON2I9IPKMV8Nc9Fmvl/ficB5JsTwTf1mX2vW4vRFasWsJS
         R8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT0lvlBDuFJ65tWA1AiCmNuMu5VLBaWqXWf5+vkxA/fHPpn4q4Viys91AB2xoq4tDAL6UnHGBTd7BOLQnAeEws/GlYCLxBLcRGvsU=
X-Gm-Message-State: AOJu0YwkRm8PKb93vp1U2sF5hiSzC8LB4rnSx7YIPpYqq8doNSdjOBk4
	00GMQtuAKf8KbWRPSqTZFdHIJmiA/IMpRamC4XYhGTpPu29FRp2KTb9MbJimGvaz4tU86aG++12
	o6P/3p9R83/AFl0EB6jbEH8IjyNQ=
X-Google-Smtp-Source: AGHT+IEDioyNmr/d1jAk6wQ/bYJdnZTM8LraRWD7zfqK5QkJ9zy9UuJ2gb36ysaSir4RfZUVbWY+IMdNyjT0kJ4qfw0=
X-Received: by 2002:a2e:960c:0:b0:2d6:d351:78ae with SMTP id
 v12-20020a2e960c000000b002d6d35178aemr1561268ljh.29.1713966558892; Wed, 24
 Apr 2024 06:49:18 -0700 (PDT)
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
In-Reply-To: <2020a858-c3d9-48a7-ad59-3691c6b98fb2@penguintechs.org>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 24 Apr 2024 09:49:05 -0400
Message-ID: <CABBYNZJLCPaLTaFEfeTEn+2FpxLS8Z-W2kT1ry4jKB_W=XYNjA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] Bluetooth: qca: Fix BT enable failure for QCA6390
To: Wren Turkal <wt@penguintechs.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, quic_zijuhu <quic_zijuhu@quicinc.com>, 
	luiz.von.dentz@intel.com, marcel@holtmann.org, 
	linux-bluetooth@vger.kernel.org, bartosz.golaszewski@linaro.org, 
	regressions@lists.linux.dev, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wren,

On Wed, Apr 24, 2024 at 1:04=E2=80=AFAM Wren Turkal <wt@penguintechs.org> w=
rote:
>
> On 4/23/24 9:31 PM, Krzysztof Kozlowski wrote:
> > On 24/04/2024 06:18, quic_zijuhu wrote:
> >> On 4/24/2024 12:10 PM, Krzysztof Kozlowski wrote:
> >>> On 24/04/2024 06:07, quic_zijuhu wrote:
> >>>> On 4/24/2024 12:06 PM, Krzysztof Kozlowski wrote:
> >>>>> On 24/04/2024 02:46, Zijun Hu wrote:
> >>>>>> Commit 56d074d26c58 ("Bluetooth: hci_qca: don't use IS_ERR_OR_NULL=
()
> >>>>>> with gpiod_get_optional()") will cause below serious regression is=
sue:
> >>>>>>
> >>>>>> BT can't be enabled any more after below steps:
> >>>>>> cold boot -> enable BT -> disable BT -> BT enable failure
> >>>>>> if property enable-gpios is not configured within DT|ACPI for QCA6=
390.
> >>>>>>
> >>>>>> The commit wrongly changes flag @power_ctrl_enabled set logic for =
this
> >>>>>> case as shown by its below code applet and causes this serious iss=
ue.
> >>>>>> qcadev->bt_en =3D devm_gpiod_get_optional(&serdev->dev, "enable",
> >>>>>>                                                 GPIOD_OUT_LOW);
> >>>>>> - if (IS_ERR_OR_NULL(qcadev->bt_en)) {
> >>>>>> + if (IS_ERR(qcadev->bt_en)) {
> >>>>>>          dev_warn(&serdev->dev, "failed to acquire enable gpio\n")=
;
> >>>>>>  power_ctrl_enabled =3D false;
> >>>>>>    }
> >>>>>>
> >>>>>> Fixed by reverting the mentioned commit for QCA6390.
> >>>>>>
> >>>>>> Fixes: 56d074d26c58 ("Bluetooth: hci_qca: don't use IS_ERR_OR_NULL=
() with gpiod_get_optional()")
> >>>>>> Reported-by: Wren Turkal <wt@penguintechs.org>
> >>>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218726
> >>>>>> Link: https://lore.kernel.org/linux-bluetooth/ea20bb9b-6b60-47fc-a=
e42-5eed918ad7b4@quicinc.com/T/#m73d6a71d2f454bb03588c66f3ef7912274d37c6f
> >>>>>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> >>>>>> Tested-by: Wren Turkal <wt@penguintechs.org>
> >>>>>
> >>>>> No, Bartosz' patch should go.
> >>>>>
> >>>> what is Bartosz' patch.
> >>>
> >>> Srsly? You were Cc'ed on it. How many upstream patches on upstream
> >>> mailing lists do you receive that you lost track of them?
> >>>
> >> Bartosz' patch have basic serious mistook and logic error and have no
> >> any help for QCA6390, and it is not suitable regarding DTS usage.
> >
> > Really? Why you did not respond with comments then? Considering how
> > imprecise and vague you are in describing real issues, I have doubts in
> > your judgment here as well.
>
> Please slow down here. Zijun's patch works and Bartosz's patch does not.
> I don't think Zijun means any ill intent. I am replying to Bartosz's
> patch right now.

Ok, that is great feedback, so I might be picking up the Zijun v7 set
if we don't find any major problems with it.

> >
> > Best regards,
> > Krzysztof
> >
>
> --
> You're more amazing than you think!



--=20
Luiz Augusto von Dentz
