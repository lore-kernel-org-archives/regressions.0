Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5DD187340
	for <regressions@lists.linux.dev>; Tue, 30 Jul 2024 11:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722339343; cv=none; b=HLYDfb/PT87I1DzhHvJSr9k8QBiuNueFCDZ6gHn1X3vChN90FrNaOzSK4WpNKbx5YKQDawgSQLfAvzSLuGlwPYzj/JJfdnBap0jDkc2vOacVjPrsQqucX9bhUkvietLWPUnNsnM0e/mSkSLvnrvnRR64NRmPuvCN2qNpY7VwKu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722339343; c=relaxed/simple;
	bh=SzNw+nJT8xnyHFJk4AFqUzJHF3dVziOgXld+vZg41KI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sw48KPLGeg86t7L6+DfTs5FbDU9A/mhL61zGHuqasbQnCg9L2Tb8fIbcKsWZdvI8voaz80KC5pl4oR3EjjILwEX6lB47R+RKB0uvAZxIVfGS8ifY53pJRyjA6EjH+Fe+LQEuoimiYIiuNXCd01MXYM/ouQuS237kVbzd+hQKEIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IIO6Lx/1; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IIO6Lx/1"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f149845d81so4682391fa.0
        for <regressions@lists.linux.dev>; Tue, 30 Jul 2024 04:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722339340; x=1722944140; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACWV171VokTXiOyHIrE7ejnV5EZjVW2CRSKDS5Os8P8=;
        b=IIO6Lx/1fIJZqpSfz82m4jTKdCtjfqQEjzSGDxpBhoPbbRRc8C9JYNfD88xQHXFYFO
         d3q6zWlXHZk7PE+cIt/JWZKTb1XHNi3WE0Zj+JhNmKmziO9LsyKTL0Hpgv0uJWQqEKzp
         hhpN7qhAPOejeA9x+6wpaATeTgQPilzQ0wRmFEeksQAl9UsAS8fNblD0qxZUHyshbacq
         UYOcK+8CEdfwd5RM13NAjYRXCjx9kVFFxX34eWXKniiItjfnAYphyUswiQBAA5GBS10k
         u6J3nEKPkMh0hOQx6wAXzPty1xq81TuWdLjcMd6/f4IMYiOZBAGQGHGn+BY2mKRtkz6N
         fbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722339340; x=1722944140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACWV171VokTXiOyHIrE7ejnV5EZjVW2CRSKDS5Os8P8=;
        b=oJZ5LLlKOhs1ulDuJ9+bLvGsnfUlC5keVTUHLBhW5YJxPUCvsFMzIlK9fB/QMu/bAW
         8kDRPmekMIxtcYULYN9O6n2TBgxaemeGjeSPEghF/UrUOhSEwfo8tx7rNuCgDgFsTtJW
         NF5HU8yLNE3+pMRBLwh1vhkNtqQNSX0jb0nUpQ7djBel69T4+4ISxhjen3IHBqH5+YLD
         yOOom9YNwOLPuCPgmUIFg05cmpLujGp/owhp+HRe5DzMsGD6a/huo7/1acrCKBG1vbgQ
         zVDPsicSkzqGy4FLwTnwmQ9Lzjn7l01kTIqQnN3zW5Y6LZhqe1cyFRJIOBVYpHyLBgj8
         w1mA==
X-Forwarded-Encrypted: i=1; AJvYcCUj3zD7xQGuC/mhM9WOS7/HNxKr42a0WazfGClzBK2EIDJ2kmTrC+6aeumeOZOsvfvIstQ+I9/iidQDaconS2HDb4KhFiIE4VJkZj8=
X-Gm-Message-State: AOJu0Yy62oai6YpkQWsGs9NKd/wuwjsemtywv51rzg+oZovCA004yjAQ
	tXr0H+XrAhxdPPvBZZlIFqr2+jWJ/fB72dZhJ1tiZ9PD7K108gr7owoDZeZD+J7NJyee4vTWAMi
	RgdYDhRqr3gp3IH5NEoBx0z+Il35UbQJj21GxFg==
X-Google-Smtp-Source: AGHT+IEdPXeLx5lLnsguxewxdMk+52p9t22OEqveNu0n933FvEZ3rr94X4Jj0LIrany5Lo1tS7gOYw/F7T/7oGv7pRI=
X-Received: by 2002:a2e:730b:0:b0:2ef:2ed2:25b1 with SMTP id
 38308e7fff4ca-2f12ee192bfmr71795571fa.20.1722339340222; Tue, 30 Jul 2024
 04:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240729095542.21097-1-johan+linaro@kernel.org>
 <CAMRc=McuqEv1Sk9O6kn4aHo9wOfzskZS0z2QxzNM=q2N8XZ3zw@mail.gmail.com>
 <Zqduv66H2OczRgaH@hovoldconsulting.com> <CAMRc=MfEkPcKUNb7HbiNrqv+7q1n0wRD9sKQ8WrydoR4grao2A@mail.gmail.com>
 <ZqeP7CqEoC5iWAdL@hovoldconsulting.com>
In-Reply-To: <ZqeP7CqEoC5iWAdL@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 30 Jul 2024 13:35:28 +0200
Message-ID: <CAMRc=MecyZU6DBWjg7vtohhxtVoaOR6jCRHdEiAKinqvmEtDyQ@mail.gmail.com>
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

On Mon, Jul 29, 2024 at 2:49=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Mon, Jul 29, 2024 at 02:35:39PM +0200, Bartosz Golaszewski wrote:
> > > > On Mon, Jul 29, 2024 at 11:58=E2=80=AFAM Johan Hovold <johan+linaro=
@kernel.org> wrote:
> > > > >
> > > > > This reverts commit 6612103ec35af6058bb85ab24dae28e119b3c055.
> > > > >
> > > > > Using the "TZ allocator" for qcseecom breaks efivars on machines =
like
> > > > > the Lenovo ThinkPad X13s and x1e80100 CRD:
> > > > >
> > > > >         qcom_scm firmware:scm: qseecom: scm call failed with erro=
r -22
>
> > How do you reproduce this on x1e?
>
> Just boot 6.11-rc1 and you should see the above error (and there are no
> variables under /sys/firmware/efi/efivars/).
>
> Johan

I'm trying to figure out what the difference is with and without
tzmem. Surprisingly the physical address passed down to the SCM call
is actually the same in both cases.

I figured that maybe using different struct device for the underlying
dma_alloc_coherent() would be the culprit but I checked and no.

I'm still on it.

Bart
