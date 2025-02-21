Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF48253326
	for <regressions@lists.linux.dev>; Fri, 21 Feb 2025 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740171225; cv=none; b=GCtfzv2JslfzPX7g2dC9h8ymVctigAgM8+6qWoJ7GoRthlf2/eRdaH+8hu4rPFWI9IgMXu3KfD5kkEY9H+3Kk+Gt6pyYGmHWJUkqsePipPz37T2tyamItjKZqM7TQubj4ujtlYIhuCpGxFO11h9rVju/2lFD3w+AR8+vPX0aOQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740171225; c=relaxed/simple;
	bh=dSU/Y3o79Oen+g1y/O2ttt6++fluDHaGys/I35lxh6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/bGSdtM0JSSwjudHXHWs9wXeWNNh1lUU2xCFE+tvMSbksQp+l4e3o9ChetrnxAajeyvSh4qnvqZNBBl29Iq8Lb0J5vAcPbQIXvtMLgVAxLqIH2x8SkvNWXNV2+jphLYjLGuNQwDzKqtctKx6TQm+XqaVmWSAivgyFUDQSMBFs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=H/GkxRf3; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="H/GkxRf3"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-545284eac3bso2469535e87.0
        for <regressions@lists.linux.dev>; Fri, 21 Feb 2025 12:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740171220; x=1740776020; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UITCx65oXgxoWzlkKQSoCgIUC5y2VPjQ1zm26AHbirA=;
        b=H/GkxRf38t5oGhTKkTSeQSRGOWZ9CYpjm7sc0YDbd2eAT9boi1DmlhBIRetTMEy4U4
         bGf3cXvZ02xllRcnEB8WxWbtAA/F0MTTYCWp9tvZUKP959etzh1xY8tP0ypAOsHfGxaS
         30+q5wh0lV8zya4u+l1nMsu1/FC6BKi00W5+fNlKWJJg4drv+6o8DANEij2xDfgrETw1
         oP79OncPHyNVk2HH/VVDp3YEb+Fb9KaRWir9Mj9FjatktUA35l0ln1ZGzFsy5lRvW6cg
         7TjfOJ/AR5LuYFVf+3xQ6mk3D1RSZlAO+RXxDHIv6DQ5MAzRBRv+CSmKcRp1Uig77Ohb
         qEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740171220; x=1740776020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UITCx65oXgxoWzlkKQSoCgIUC5y2VPjQ1zm26AHbirA=;
        b=rHLJtXoN6KqvuOZKebAmb+tXudiFB8BT4wyV+2IVpWz3OcjIbZIEltbUfCuQOHrkbV
         TzwLkgrCvs0kVlpH8++yudzKBVo7+XQ28TLrSZ6c6qLQDr3PGahCkrsRs1gpJxN0mt1v
         2n+Dq/+97iR8Ily07IpLC/tpywApAEoj38pmdbfdEM/xChq4OPpPTRzGqY9uSoJANh6x
         Od7SiQ7S6HFxiQmBUztYUUTsaknXunyCrGAUD3WpHSkCL6fBhjXu3CHDOiMPAMUC/ikY
         4ckn8SaJGYg6fivj9viUpA7hMU/qGX1+c4umFt0/SRwrfRXOFDh1t8INCAhLQmO1qHF4
         7uQA==
X-Forwarded-Encrypted: i=1; AJvYcCUGRV/pVNCdiFKHv+YrmzNsF8WVVf+uwdA/5mssB4CcduPMUJp+tOJfIVy5+L9wrtDX5ESA/U8i0v3k6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGxZcnNLpLwyoiqaD+8cdBvZEXRbzcBbBnEbT0REFtfJcxULuV
	mwKX2Ue9HiZ/vHA4guKHjAa5jXcAqPb1TnfDXkcN3fySu6ShMxQLY4sseQubeFSIq9YouprsxWy
	mz6HiKAUGtjjoZqhlJf2ARmPKkTNh6BxwJN9NRw==
X-Gm-Gg: ASbGncvAjD4DYwsRMyuP1Cn/Bn6LnjZYXZKsCvReSBN/ObuQ5/8ZtoO6sHmhfQRDifc
	51Ir5+bteDOgQ7dxDhVJgbgWBIWm4PdowL8uZYgVjLT8ZD15e2Hvw1OrB5VUzJAoGvafExKEL9/
	99cEwQ8C2fDj8ORi0R3UzrVcVkF26+HY0bMQzWB7M=
X-Google-Smtp-Source: AGHT+IHD/faqLIAxxrUSThF+7Z4ObfCPG5tjOZ5Cb1dKYqP7WiY8zwWQ1Hl9LkauFsK7X0DzVWW2HZxHARnzix6VVHM=
X-Received: by 2002:a05:6512:3f17:b0:545:a1a:556b with SMTP id
 2adb3069b0e04-54838d3e458mr1895563e87.0.1740171220459; Fri, 21 Feb 2025
 12:53:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9ded85ef-46f1-4682-aabd-531401b511e5@molgen.mpg.de>
In-Reply-To: <9ded85ef-46f1-4682-aabd-531401b511e5@molgen.mpg.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Feb 2025 21:53:28 +0100
X-Gm-Features: AWEUYZmvifQGO9hr4odqPIoAEg6jEmQa9XkbaEe-eZbr42YtXkTTJk53aPtcyJY
Message-ID: <CAMRc=McJpGMgaUDM2fHZUD7YMi2PBMcWhDWN8dU0MAr911BvXw@mail.gmail.com>
Subject: Re: Linux logs new warning `gpio gpiochip0: gpiochip_add_data_with_key:
 get_direction failed: -22`
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 9:40=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>
> Dear Bartosz,
>
>
> On the Intel Kaby Lake Dell XPS 13 9360, Linux 6.14-rc3+ with your
> commit 9d846b1aebbe (gpiolib: check the return value of
> gpio_chip::get_direction()) prints 52 new warnings:
>
>      $ dmesg
>      [=E2=80=A6]
>      [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0
> 06/02/2022
>      [=E2=80=A6]
>      [    5.148927] pci 0000:00:1d.0: PCI bridge to [bus 3c]
>      [    5.150955] gpio gpiochip0: gpiochip_add_data_with_key:
> get_direction failed: -22
>      [50 times the same]
>      [    5.151639] gpio gpiochip0: gpiochip_add_data_with_key:
> get_direction failed: -22
>      [    5.151768] ACPI: PCI: Interrupt link LNKA configured for IRQ 11
>      [=E2=80=A6]
>      $ lspci -nn -k -s 1d.0
>      00:1d.0 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI
> Express Root Port #9 [8086:9d18] (rev f1)
>         Subsystem: Dell Device [1028:075b]
>         Kernel driver in use: pcieport
>
> Judging from the commit messages, this is expected. But what should a
> user seeing this do now?
>
> Also, it probably should not be applied to the stable series, as people
> might monitor warnings and new warnings in stable series might be
> unexpected.
>
>
> Kind regards,
>
> Paul
>
>
> [1]:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D9d846b1aebbe488f245f1aa463802ff9c34cc078
>

Hi!

What GPIO driver is it using? It's likely that it's not using the
provider API correctly and this change uncovered it, I'd like to take
a look at it and fix it.

Bart
