Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC4A84DE4
	for <regressions@lists.linux.dev>; Mon, 29 Jul 2024 10:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722247450; cv=none; b=i2XE2bNctkWR/gP0A5Gh0QlKMzPJ+O1L7JSqLSHVaiG5fzcRtjZbWTkY7I0oMWLdmFrjz4dgvQNNYoNsp5XuhbJ0n6g0JtT137S/CAA5nKCqvo/QoEksmHVev+18Jk1Y0/p+pp5h8UwJecuftEfYAMbcj5dFajELdP1ZjJwkk5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722247450; c=relaxed/simple;
	bh=QgDh+hX2CfcVVZFKmfCfQ+4wGGlEPdOz/4DRO+xcBYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pt1hjApov7Oun+nFm0Pq3TXdTh2YiKp+gdJ1fHq7svFqB1u04SsPP1V2dYvbuxTi0YTkiRrfDYZcJLDO5lZIKk1fuUhE/w7xWrqDYe7UFnPbiywpu01oDC02fXzxBxk9RIV9S3Vi71fOwK1hdQbihQ37lquiUhaHuLM8GvRFsHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VuDANfbw; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VuDANfbw"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f136e23229so13166021fa.1
        for <regressions@lists.linux.dev>; Mon, 29 Jul 2024 03:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722247446; x=1722852246; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t23oL5r7qrH6VMZ6nqcOfP88iRYOauRT235fj9H/sb4=;
        b=VuDANfbw6Y6mB8EHeplBa6AKaDZo1G8OlbWIzlDQuKMjn6k6AIutUnY7Uv64wWXSqe
         kson3zGAyru7EWXtKvEST3GxeLTW6uaazpW5W3RTIqPLGyyDmHV7L52gnMBuGhwsXNAN
         ZLCdY5YfeH3B41QkjMxJ9l2o82wGlEDPJh26XnQJtRx7mLGbYbtgJ7fIss1Op3jjs++V
         TI/KeVXkcWb/pPsD4imSOR74hoxCB6OH9SKAbbW/zaATfifvddFMB0K0wdxdl0cFY83g
         ZFvnpyBCzip3bTGJUvLPDZ/O1ZgD4N2aQeNW4nRlr2L2Jpj+8jdQ1jq57AYBCwMjcTqZ
         4k+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722247446; x=1722852246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t23oL5r7qrH6VMZ6nqcOfP88iRYOauRT235fj9H/sb4=;
        b=gDWD6SO7QmhgN3MNIVJrkl2O5mIjO0cAHVhDzeOxNMMWt5dSCvcFnbh9gqHQRIAo4L
         kSfW0LmB6CuSeOyWgiWq5QPh/EBSfRjdbe7Y/KuNFvpfgiV17mN3GrBUMrDpHgMhlZZB
         SKQLbDZWFISdQmMFK9G1OtZwmSnS7/zpQGhLeWemkKvzEXKmOLeKej/im9Wxs0pYg3w5
         vrPJq3ge7VQBRgAtguSF4u3MxHgNf1x7yLxLObn5XQZYoUy1uI2LtWo6AZYDvlieOZE8
         l95JfZeuwQAv4gGFZJjyCAbXcD5ildj3o8crpSOQ+y7j98963lAgGzkzIMnn2yqWlf3O
         jmaw==
X-Forwarded-Encrypted: i=1; AJvYcCWwSUbR2jUMW5lpAOWae7UXb40bDJgPe+GcXdx3jCMlzfM7Go80aLjUXkzJ+zB1M8jrHkk59+YaFceSBfQprX0MQ+Jt9cGasjjdGT0=
X-Gm-Message-State: AOJu0Yx0Wqax6q6LmzDHktvzS1JtSm5V+b+85AF2Jf3eT69zn8qqIakX
	4q6EchQyeKaxOOgqipPhdCgLLyBvurpwmutvLF7tmB/74mEvPLXMtIbvm9xhNJ6VBt584Uk55w0
	mDXYAPCDiZJ3XZfeWFuMiBdrx2bCspkkKJTPEhQ==
X-Google-Smtp-Source: AGHT+IGq14q7ZB+CrHf7BL0wsC4WC1GH18TcWHVWGRmnWpnnGZoopVgB1sYJg+4GH1UMU/cFQxpVls2AeyCAqvBP318=
X-Received: by 2002:a2e:8057:0:b0:2ef:23a2:7efa with SMTP id
 38308e7fff4ca-2f12ee1b184mr45849721fa.27.1722247446521; Mon, 29 Jul 2024
 03:04:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240729095542.21097-1-johan+linaro@kernel.org>
In-Reply-To: <20240729095542.21097-1-johan+linaro@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 29 Jul 2024 12:03:55 +0200
Message-ID: <CAMRc=McuqEv1Sk9O6kn4aHo9wOfzskZS0z2QxzNM=q2N8XZ3zw@mail.gmail.com>
Subject: Re: [PATCH] Revert "firmware: qcom: qseecom: convert to using the TZ allocator"
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Amirreza Zarrabi <quic_azarrabi@quicinc.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Elliot Berman <quic_eberman@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 11:58=E2=80=AFAM Johan Hovold <johan+linaro@kernel.=
org> wrote:
>
> This reverts commit 6612103ec35af6058bb85ab24dae28e119b3c055.
>
> Using the "TZ allocator" for qcseecom breaks efivars on machines like
> the Lenovo ThinkPad X13s and x1e80100 CRD:
>
>         qcom_scm firmware:scm: qseecom: scm call failed with error -22
>
> Reverting to the 6.10 state makes qseecom work again.
>
> Fixes: 6612103ec35a ("firmware: qcom: qseecom: convert to using the TZ al=
locator")
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
> Cc: regressions@lists.linux.dev
>
> #regzbot introduced: 6612103ec35a
>

How about at least giving me the chance to react to the report and fix
it instead of reverting it right away?

Are there any other messages about SHM bridge/SCM calls in the kernel log?

Do you have QCOM_TZMEM_MODE_GENERIC=3Dy or QCOM_TZMEM_MODE_SHM_BRIDGE=3Dy
in your config? If the latter: can you try changing it to the former
and retest?

>
> It's a little frustrating to find that no-one tested this properly or
> even noticed the regression for the past month that this has been
> sitting in linux-next.
>

I have tested many platforms and others have done the same but
unfortunately cannot possibly test every single use-case on every
platform. This is what next is for after all.

> Looks like Maximilian may have hit this with v9 too:
>
>         https://lore.kernel.org/lkml/CAMRc=3DMf_pvrh2VMfTVE-ZTypyO010p=3D=
to-cd8Q745DzSDXLGFw@mail.gmail.com/
>
> even if there were further issues with that revision.

This is a different issue that was fixed in a later iteration.

>
> Johan
>

Bartosz
