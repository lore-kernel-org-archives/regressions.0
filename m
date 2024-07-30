Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855B318D4D7
	for <regressions@lists.linux.dev>; Tue, 30 Jul 2024 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722340305; cv=none; b=OWPIhIHhShZ20H8fJHIImKE+R27qA1g5omhJmp+bikZF6BAHDJHwZfaiiiaQPw8n6agWgI/+G2xqvR3sx6rnaCB0ftsAAEcuE4CmQI4TCFkzW517WH3fui+NACtP4s7uS6ArBlYH2h8bHuVOod7QoSplK8hpF/9RCBSIZCJuXDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722340305; c=relaxed/simple;
	bh=/LxOA/sf8jUq2ce1URddnOWOpBaWlE7GJFwaYB1FXgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3dEam2kqQmdtY4wznW85SisIWifQBqSMrTImU8LlhvwkKy8BuVTNV3qq4Hbi5mR0aWMtrwIguE/Yq2apx2mnXyEybmoG/AsHINeWA9j0wSO8GmpZuph0bou6qhb2+f9cq7POfsJLX42++eC/FgM3Z5YOwkRBRhn98NbX4hkots=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hZYBWgnL; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hZYBWgnL"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ef2d7d8854so56633581fa.0
        for <regressions@lists.linux.dev>; Tue, 30 Jul 2024 04:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722340302; x=1722945102; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mj9g02teE95oWkxud71FxjRcOnjoY1sRk9LiH0FRY4s=;
        b=hZYBWgnL8x42wCcf5oDbCZVd1Bf4kBKe6qDpWCaWdZvaWnKLC65vvwdwMawx5lAz+t
         qx1cOcghJGe5WkMaN8lJ3OqolNu4Rp8Ygy2GDckJC0zbqr/YnD/ydc1bB9RkavZ3vr8S
         lkRUvTt7jU4b3Da05JNdS4ew85TDM7GIwAb869Q59X19myM4hYQC/vGKnm3SjpZZxeQg
         PLRLrx2lNyFQpW8m8HW3pfV0nackoclGi0CjZlKZjYclOsP4oDuwR9wAJZA+BDpbOAUM
         r7HXYBfYoWn79kw9DMycRdF82dVJBlE8YmjsK+v84RFQxLIHbaJs4Xyn5QSKEi+6pTEi
         ccGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722340302; x=1722945102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mj9g02teE95oWkxud71FxjRcOnjoY1sRk9LiH0FRY4s=;
        b=P9W9iPAoji1N9u3xP90xuzzL3rlSn9lzu8vhY2ZXhfHuHQW+rf+zqJI1LqO0xpiXdO
         N7YeC6lKVKrYVsgejnyingRnBs/iStielQVdJSQFOz5Bz+9G7QfDb+zaKmCsYDYet6Ck
         dSCoCjgTcjHX5FgibTdcUclDgH0G6O/Sa3isHE1r7dKtnn7a9ootzFgFeovTQefSfFEd
         6hBkbkQVqJD5qwVwfLtNlRsVqezXTuEGyf8PLnMaFDZ+dl9yMB5L+EDS3WfmWzKj2YlB
         z6N63fKWGIDt7a8ArQUlSRAQIeNER8yATQx/PNR6psW+KMyHxOxCOS37VZORh4Nwl430
         dqjA==
X-Forwarded-Encrypted: i=1; AJvYcCWPlKOBBWC2+30siYHbmjqH/nWY2ML7JLU5b1fpMSdp9jOmiSMaKnuHlQwNtZNGuDHhYDgwZUqyaasHaAzCe2/h/rKXg/yZEpJjXJQ=
X-Gm-Message-State: AOJu0Ywiu0DFpcC/MqAjyuKSGrvaBNpzwMYq/BkjwYH/xaKxrNu6tb33
	8Zt8WV8oQnptYvrNENpZ/F58Ba7ip4XGGNPapU+bijC5ypyaecA29rWj0HkuRt4FrQCBU4LC+pA
	7hLD4X94clGWAzFfz5uefosQ2Gs/SulBADRHBzA==
X-Google-Smtp-Source: AGHT+IGKbiw+jL9QwWM+pv2VMutUmDfrKG8cwt2tgt9Gcf3IMi7/XSU9egzEdXOKkg8uxDSXz6DRPDTvLA5vScLpLBk=
X-Received: by 2002:a05:651c:1541:b0:2ef:2d3d:3cc3 with SMTP id
 38308e7fff4ca-2f12ebc95b8mr81065521fa.4.1722340301491; Tue, 30 Jul 2024
 04:51:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240729095542.21097-1-johan+linaro@kernel.org>
 <CAMRc=McuqEv1Sk9O6kn4aHo9wOfzskZS0z2QxzNM=q2N8XZ3zw@mail.gmail.com>
 <Zqduv66H2OczRgaH@hovoldconsulting.com> <CAMRc=MfEkPcKUNb7HbiNrqv+7q1n0wRD9sKQ8WrydoR4grao2A@mail.gmail.com>
 <ZqeP7CqEoC5iWAdL@hovoldconsulting.com> <CAMRc=MecyZU6DBWjg7vtohhxtVoaOR6jCRHdEiAKinqvmEtDyQ@mail.gmail.com>
In-Reply-To: <CAMRc=MecyZU6DBWjg7vtohhxtVoaOR6jCRHdEiAKinqvmEtDyQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 30 Jul 2024 13:51:30 +0200
Message-ID: <CAMRc=Mcwe0nV=pgfk=Wezq5eopJiZZii=BZ162QknT0t1Uf9Rw@mail.gmail.com>
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

On Tue, Jul 30, 2024 at 1:35=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Mon, Jul 29, 2024 at 2:49=E2=80=AFPM Johan Hovold <johan@kernel.org> w=
rote:
> >
> > On Mon, Jul 29, 2024 at 02:35:39PM +0200, Bartosz Golaszewski wrote:
> > > > > On Mon, Jul 29, 2024 at 11:58=E2=80=AFAM Johan Hovold <johan+lina=
ro@kernel.org> wrote:
> > > > > >
> > > > > > This reverts commit 6612103ec35af6058bb85ab24dae28e119b3c055.
> > > > > >
> > > > > > Using the "TZ allocator" for qcseecom breaks efivars on machine=
s like
> > > > > > the Lenovo ThinkPad X13s and x1e80100 CRD:
> > > > > >
> > > > > >         qcom_scm firmware:scm: qseecom: scm call failed with er=
ror -22
> >
> > > How do you reproduce this on x1e?
> >
> > Just boot 6.11-rc1 and you should see the above error (and there are no
> > variables under /sys/firmware/efi/efivars/).
> >
> > Johan
>
> I'm trying to figure out what the difference is with and without
> tzmem. Surprisingly the physical address passed down to the SCM call
> is actually the same in both cases.
>
> I figured that maybe using different struct device for the underlying
> dma_alloc_coherent() would be the culprit but I checked and no.
>
> I'm still on it.
>
> Bart

Nevermind, I found the culprit. I will send a fix proposal shortly.

Bart
