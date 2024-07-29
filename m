Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1281474CF
	for <regressions@lists.linux.dev>; Mon, 29 Jul 2024 12:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722256555; cv=none; b=GYUQNRX0d6ViRSxwc12Jsdv7jadgkbk2lo8XiDXLvbdNfXn1A3VjzRSa8eUl0XMDAPYxmJMna25ttKie4U2+eTUTgLFnYzOzADkdzZaG2F0zrBlOcGaOmgTo2/7gEAt6GdWsezd9gwCPNNm4mqRr7oF5eeastce5oIF1Zftqkn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722256555; c=relaxed/simple;
	bh=hJ4yHT6MPu1pwPN3tX/Zx3Ck6OuV9IdbboeszxJnCQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZbxwRGEAVhouc1mjXkUz29Zmk+lEAeoq4UMjAWqx/MIbqEyIvd9sPh4ebxDrSbedUUN8nUubqB4rId4ZnDhRlSskWpQ6aKTQtPRSdRIxx0q0MjLveBLiJrqhz5snclDVS4IPTPZcVLo5Tbuyw7eQ+lxrFl5eMJQR+acgPZgGHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0I1U54lw; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0I1U54lw"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52ed741fe46so3562540e87.0
        for <regressions@lists.linux.dev>; Mon, 29 Jul 2024 05:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722256552; x=1722861352; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Huv68Y9tp9oaKlRzKXLO7qOGiKuAnxEpFcqEhnqL4Os=;
        b=0I1U54lwgmfWmjnL6jcOt6+EsrzfYCbDqnsWZir2/5cpg/qI0Y+YHP6DjzP0EZ3Zax
         mY7+B3ihGO7PDld2nRf0T10WMfHjCw/TGvOf2JJPcnHne2Cn7M9ZEEkcxAvW2Bo9ADeS
         Oqx0n507vVt6MmzC5YnC53d/cf7MXTX4uR8QwIfDpy6Gsc5fDgUS29YbtvK2d99RACup
         lMYg8N2SPQjy2DJjWbvKDGmFrBGek3OJNWG8szV4gNVDzlDxJCwKk4pqrCDyI8R+MmGc
         70hGauF48PlL0z/6H6Zd/D8glTGlQS856TVgILYA3tncuofrzXNooOEtO316UVNbtNj5
         bgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722256552; x=1722861352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Huv68Y9tp9oaKlRzKXLO7qOGiKuAnxEpFcqEhnqL4Os=;
        b=u8msiDEDeXyovctBhWnO/I9pqtlg8q00AXWS/HUWNEq2Gcrfn5GMij/SiOYFA2+9/j
         zeV4G/cErBNzvhjzUbd3nkosGGLvgFL9xQyyQSLiOtjSgjYXRX29ePwoNpEDvOVKqn/j
         6c8DrRRQPpVlBxm83Ik2qmAvs0JC3qbI769fWMhHCeGtUrk4tPH6N9lgZEf/abPqrw+8
         q7273rE/TgvHxZTHOQtNDfegWj0foXeun4UqUXlWEfT3x6XksbRxWNGARDn/Dz70tRrK
         Xf+Ae/zq/NEVfpafRhrt/YX0CUXVAjE06MPC4uA3UEc2n0dONxi/MwSmqtxdktjll9H0
         KVZw==
X-Forwarded-Encrypted: i=1; AJvYcCUiX88+gihFMvsZX7PXtue9Du7GiqIydYOkAd58ixeQa/UVeIl3DaaSOMtcx5ydjJREu47Fl4TAD1HBwMdZOp8dNgjtDm2V+pSNpII=
X-Gm-Message-State: AOJu0YyVvjA9i10z8JoxEZlzzueVYQNppyYw4xPjI+N/ut05ImBh4z/L
	U0hAtBuCdvMae4ybES9iZ2tgxBFTSqJXs8cuP4sUqa3Yfp8EgVKTwUaAlCPoXfoOL7LVQH0WytG
	8C6SGhIccH6V2AMMwZYNJlHghKWsozHkjAyDFYw==
X-Google-Smtp-Source: AGHT+IHbPY3EmAFT+z3ypCGly+i6vaPT4QcdzFtzNLARKgkO7m2L9wjuWBDFuGq2Od9gf4WKnsAtIMYfvmQCnEBfPAo=
X-Received: by 2002:a05:6512:2c0b:b0:52e:f99e:5dd1 with SMTP id
 2adb3069b0e04-5309b2c320fmr4419310e87.47.1722256551444; Mon, 29 Jul 2024
 05:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240729095542.21097-1-johan+linaro@kernel.org>
 <CAMRc=McuqEv1Sk9O6kn4aHo9wOfzskZS0z2QxzNM=q2N8XZ3zw@mail.gmail.com> <Zqduv66H2OczRgaH@hovoldconsulting.com>
In-Reply-To: <Zqduv66H2OczRgaH@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 29 Jul 2024 14:35:39 +0200
Message-ID: <CAMRc=MfEkPcKUNb7HbiNrqv+7q1n0wRD9sKQ8WrydoR4grao2A@mail.gmail.com>
Subject: Re: [PATCH] Revert "firmware: qcom: qseecom: convert to using the TZ allocator"
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Amirreza Zarrabi <quic_azarrabi@quicinc.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Elliot Berman <quic_eberman@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 12:28=E2=80=AFPM Johan Hovold <johan@kernel.org> wr=
ote:
>
> On Mon, Jul 29, 2024 at 12:03:55PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Jul 29, 2024 at 11:58=E2=80=AFAM Johan Hovold <johan+linaro@ker=
nel.org> wrote:
> > >
> > > This reverts commit 6612103ec35af6058bb85ab24dae28e119b3c055.
> > >
> > > Using the "TZ allocator" for qcseecom breaks efivars on machines like
> > > the Lenovo ThinkPad X13s and x1e80100 CRD:
> > >
> > >         qcom_scm firmware:scm: qseecom: scm call failed with error -2=
2
> > >
> > > Reverting to the 6.10 state makes qseecom work again.
> > >
> > > Fixes: 6612103ec35a ("firmware: qcom: qseecom: convert to using the T=
Z allocator")
> > > Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > > ---
> > > Cc: regressions@lists.linux.dev
> > >
> > > #regzbot introduced: 6612103ec35a
> >
> > How about at least giving me the chance to react to the report and fix
> > it instead of reverting it right away?
>
> Lots of folks have been running linux-next on Qualcomm machines for a
> month without reporting or fixing the issue. And v10 of the offending
> patch was apparently never even tested before being merged.
>
> I'm sure you'll have a few days to look at this before we revert.
>
> I'll be on holiday for a few weeks, but you have an X13s so you should
> be able to reproduce this yourself.
>
> > Are there any other messages about SHM bridge/SCM calls in the kernel l=
og?
>
> I've also seen this combo:
>
>         [    3.219296] qcom_scm firmware:scm: qseecom: scm call failed wi=
th error -22
>         [    3.227153] efivars: get_next_variable: status=3D8000000000000=
007
>
> But usually the first message is the only hint why efivars is completely
> broken.
>
> > Do you have QCOM_TZMEM_MODE_GENERIC=3Dy or QCOM_TZMEM_MODE_SHM_BRIDGE=
=3Dy
> > in your config? If the latter: can you try changing it to the former
> > and retest?
>
> I have the former in my config but have tested both, made no difference.
>
> > > It's a little frustrating to find that no-one tested this properly or
> > > even noticed the regression for the past month that this has been
> > > sitting in linux-next.
> >
> > I have tested many platforms and others have done the same but
> > unfortunately cannot possibly test every single use-case on every
> > platform. This is what next is for after all.
>
> I doubt this is specific to sc8280xp and x1e80100. Which platforms did
> you test qseecom and efivars on?
>
> > > Looks like Maximilian may have hit this with v9 too:
> > >
> > >         https://lore.kernel.org/lkml/CAMRc=3DMf_pvrh2VMfTVE-ZTypyO010=
p=3Dto-cd8Q745DzSDXLGFw@mail.gmail.com/
> > >
> > > even if there were further issues with that revision.
> >
> > This is a different issue that was fixed in a later iteration.
>
> The symptoms appear to be the same once you get past the locking splats:
>
>         [    2.507347] qcom_scm firmware:scm: qseecom: scm call failed wi=
th error -22
>         [    2.507813] efivars: get_next_variable: status=3D8000000000000=
007
>
> So it's possible that this never worked.
>
> Johan

How do you reproduce this on x1e?

Bart
