Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F501E51F6
	for <regressions@lists.linux.dev>; Tue, 29 Jul 2025 19:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753816214; cv=none; b=pS8Sz/oVdjndenqaSn2mNpZwisYAJZZv11qAvZSjMoMgYlwlV3/QBEEfM9mzDYd3F4jS4hoVoJBbUme41EnQA4Fg7moJEDCINE9zaykczJPvPDSgz5MoiVK5n9WfBf5r+0xRBZj8tVxytT9+2r535kirUbjrZHJty7rJIaMF6C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753816214; c=relaxed/simple;
	bh=gZh8ljut1hGoGNyKv+aXd2MxvgIj9E5doRM7TfIUD0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CmDAL1Fp88taOgqI2o2cuH5Hu9fE715ZervnBzwm18vmqgsDZzo7P78nwWoY3M6jFsmSOL0vlv/1P/wG6hnkXbubK3iWXoXo+rcTfJgfsN6ViUwJPfhaA2Cz7/lQeVyCdm17bQneyozXBfyuXuzGYENVf/n8swk1wGAJA4EhBO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lUnODA1q; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lUnODA1q"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso6187840e87.2
        for <regressions@lists.linux.dev>; Tue, 29 Jul 2025 12:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753816211; x=1754421011; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZh8ljut1hGoGNyKv+aXd2MxvgIj9E5doRM7TfIUD0w=;
        b=lUnODA1qMz0kcSTU01jOFzVH1rtTumtVJZiiiXdRqi6S72c1SeAinRdYJbsTO9W19/
         O/XkSHix3l3ajTP+/8RDp8EGLha19btOvL7k/uIPMQAipuTg+T3Ai3MnBS5lTTfUs69R
         iaY5QzoNAHSKwvIrGOWHITC0EXjOIN1beX2GBgrJkqjZdM0NBJhfDKLuOlpa/pHTSvyz
         lLh8wSde3g9oBjnAqQXg3kNT2GQr0OKiA+v38EmQ9H4VAabmUhl5n6P9trXyStrcpIgc
         YK4v1y4G+x32KCKEQAbWbVCIgIA7mfFZy5u9pYUNbk4I+O/qPFmo/EVcfakyKiOuAIoO
         PcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753816211; x=1754421011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZh8ljut1hGoGNyKv+aXd2MxvgIj9E5doRM7TfIUD0w=;
        b=GR3d9VZ1WU+GvR1udxczv90AOT8BjKMaDPSVAwRQ3o70jW+SjLaXYNE6Ss1dflxThp
         VR5b7wOgUxVDza8tcPLXMmXIBrdYgqn4clA+IvoO7xWuCAXwN3+wkTo6rnZxdFvMLhvr
         cRpFQwaqt6wYA0cuScgQ0gvxtQNXwP4L+aZgSfg5sIjlKUnnvadlzKCfmicO7BIB7b1g
         lvd1YRLZqh7epT6u9evpkZzau12p0Fl0CUIx7apptQ06BNv2899/SXGJFUfiQ/Limjq/
         QbMgAEHw0oJyyOrTE9XEvu0EmOxsM0+9ZUh+o/wiSwSVwYdAaFqh3oKq+KvpISAPAQNA
         VjGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEdwyXUK0R3/fZUpywlnwASI05RuhNQXyr7q8v290QRnSytczAoO8+lxqLnH35DRPOPKtMQ4zfdFB4Vg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9jVnpKjKpTOnV0vCFUYAwkIQw6YqpjW7SJR8Wv6CZbG9JN8Vz
	6fmi2mNiOqp6ebgzmYiNburU0ISjHLKbdqmwz9Wd52sBKfmIQP+nlgD3uduPmDztfltC2m6VXkS
	LCSHI3Xh1pLaYEt76DJz3O6qwRkdZTJxSlLLCOFy4tw==
X-Gm-Gg: ASbGnctG5+U31ebN+ASCGet6jlGJvp8HjfSzy9/TyXpTaATRa1tbIGtgDJvZekhIr5P
	3Ntm+PeRBLQyEjh12yZPqGl3Xg6qBVYfSNt2PKU8gjNYdyqr/cHfjzuY3WUwVopF0PtMGPv8bzN
	FOIi4Id9wNbAWelm8HQW0XAON1CeCBzCyKpX+xMSXv27cXVcifIE92nLUOCt/z2zsJExBcBvvud
	UM0AsOR7k3XGt8ns97lDOULWmu4ca0mhYPRgIA=
X-Google-Smtp-Source: AGHT+IFjLccy85WmcIVxX8iXMCVZgbVynIqh/fxN/Cv8LDdpotCFZGp7YpefT04NgGb7HLgC5E0eAwYQX1WWl4vrQhA=
X-Received: by 2002:a05:6512:3daa:b0:55b:5a31:51da with SMTP id
 2adb3069b0e04-55b7c0620a6mr193225e87.40.1753816210554; Tue, 29 Jul 2025
 12:10:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3367665.aeNJFYEL58@radijator> <13840884.uLZWGnKmhe@radijator>
In-Reply-To: <13840884.uLZWGnKmhe@radijator>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 29 Jul 2025 21:09:58 +0200
X-Gm-Features: Ac12FXzJ4Le_pN4OWiJEdYoeOUJ9EgHbsU3XKmT-FF7OdQllnVTNnKf4Hb8Q6Pw
Message-ID: <CAMRc=McizcAXjr9VNOQnga0P8HJ9aR+X7njnSPMb4Bc9GU7GiA@mail.gmail.com>
Subject: Re: [REGRESSION] samsung,coreprimevelte oops and lockup while probing SM5504
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, 
	Peng Fan <peng.fan@nxp.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, Karel Balej <balejk@matfyz.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 4:48=E2=80=AFPM Duje Mihanovi=C4=87 <duje@dujemihan=
ovic.xyz> wrote:
>
> Hello,
>
> Friendly ping on this issue. The issue still occurs on v6.16 and is still
> fixed by reverting commit 20117cf426b6. I have found that the root cause =
seems
> to be a bad pointer in gpio_chip->gpio_device.owner, but was not able to
> figure out why this happens nor why this only happens when the IRQ chip i=
s
> immutable. Is there anything else I can do to try and get this resolved?
>

Peng: could you please look into this? I don't have a better idea at
this time than to revert this commit otherwise.

Bart
