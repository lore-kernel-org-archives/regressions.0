Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DB3268FC6
	for <regressions@lists.linux.dev>; Tue, 25 Feb 2025 12:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740487110; cv=none; b=tWIM74zW9b1NT5I+MPt9Dxym2ZjzmpnOIV+Q79NKGSPvchSZOSerYE+bX8UVA+ZDpvIn7y6RA38yixJJ1OzQ/eoiUYVWM8Sw8+JD2+GJsDHlWZPmITcqkTW40wiFc6B6mOPzX4g+IO3cetmYYtkQa8hjZpLDpqXIYvve/wsZ8ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740487110; c=relaxed/simple;
	bh=EpWE3gjVBJ5xUE4k7WndhezmqHaz9BrJsMPrqvdpJ3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W+EVcOJUtzJoeA+C8AcbDWE0HM8DuJsRXa8mntZxiZZrdVs/aEB4rubF7/EB3MrDaWmcrJYoHAQkFMY5aPMVFvEmvn8Ix1vadwAs1dQ6QbEQhmnB0lfQFHnxDt3Z1NIZIotrbpPdWh31kPSs+b6UwNzcY2tOLVzpLW2DW8gHugM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XCtHT+EO; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XCtHT+EO"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6f4b266d333so40170047b3.2
        for <regressions@lists.linux.dev>; Tue, 25 Feb 2025 04:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740487108; x=1741091908; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EpWE3gjVBJ5xUE4k7WndhezmqHaz9BrJsMPrqvdpJ3M=;
        b=XCtHT+EOI1zio3sOKeglDsl6VidWWUP3Ci96lPuIgg2kCMFSKu1qwK2f9wAf7SwKxR
         NtgguU4Pc4UOr0uu4P12dvLgQN9l93l96VEXBVTd0pr7EskBW2bsEQZeQD+Ao1zcFYd4
         rEs2/29KA1EgFKT1YR+qN8paZY/Y6vT5b08Cl/I6EP+AS+8/2LoZmQA9hDag1IzmjycK
         gi5lGY+CU+7QXeI1LP/HQrCiwgNN4tULGWfY2hg5wG7WYNucXeUvzPOP7E12J03d1Q+i
         TzrouktPyAVQK8JoAOC7vGjaibKUaIlS4j8/4jyeiz3LdMNo9VDheRquwAUvgdB1uAdN
         xVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740487108; x=1741091908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpWE3gjVBJ5xUE4k7WndhezmqHaz9BrJsMPrqvdpJ3M=;
        b=egqebILoK3xuIj79Cwx+8RZyuFyOw+ISujyd3amoixLP0WMFWTx9unwhKv8G8VZ1jQ
         o3q/4GseDJVXOCW8G5xt/ea2w5J1wsFCilTj65NNEUAwJ8YpNBvzM60Ju3r3ief2z3db
         uqWFSUKchBm3o7UvuX5O+PhdsInlRjcDIGS7NUujnZRUbfOpEInDkW66yWRTb37IJAs8
         13D7HGy3ZuSlvGp8Mk776JByUJQsApicirCugpjrHk0s2uhgdnVOOU9I83a0Zqb3v4y4
         MQNVutDbc+HZrj/l8Y+J4Sg4e6Kmt3yqAaCCIZoxmU3/pNdRfq/ZjmTkLUJscgkUJL/i
         0XFg==
X-Forwarded-Encrypted: i=1; AJvYcCWE40GAYD4bDNLGfnowQFMM7+HSxrt99aiKQPvwPehuVfHbQ1VNXZ18EoQ7URtMBDQuOkpyWY+QTzvvbA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj0xiL4DmaCaAFgT67Ck2Q58FST8b4jLE+yb0PX1AtmtDf9lMi
	E412hGyBp8Fz0ahmsLRijHa/72IkEvJOmsz3tNSvM6/E57CZBQQI0izzJm9mn3pqGVTz7cu8vF1
	jmIU1RJNNqVwQrugSnyUOW5l3HYX1cpiUfpKFFQ==
X-Gm-Gg: ASbGncvAD9rsu3MstZXtTsiTEIDwV/81KB/xN7AoocJIsleMazQccqYSD7WrJyKPWQo
	T3/dzpwNq5vCWSRbBiT7a1ITaJwRi4QoNN7n1YySL+jKsTkQjEQHnGuBkfN2dPcz5W9gYleE1ik
	8Uz1HzB8WYl1dC2D/yBZWOqLAl7JC/cx02d2NCXCM=
X-Google-Smtp-Source: AGHT+IFyDNIAPgd41Z9hN8WY7F9O5edD1E2SsUN53aJDVwGNWFZanw4Cp0tNkMynd41Y2r08hXuQygXqpmPDqz1VtwY=
X-Received: by 2002:a05:690c:3812:b0:6ef:6a71:aa55 with SMTP id
 00721157ae682-6fbcc40591fmr149119927b3.0.1740487107791; Tue, 25 Feb 2025
 04:38:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACo-S-3CDuZpEeJBbP9_f21aRb4B8Vdj784f3J0NPPs+hu0mfA@mail.gmail.com>
 <016580ec-2b16-4ac5-a724-5e26419538fa@sirena.org.uk>
In-Reply-To: <016580ec-2b16-4ac5-a724-5e26419538fa@sirena.org.uk>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 25 Feb 2025 13:38:16 +0100
X-Gm-Features: AWEUYZlURBTUMr0ps6EeRxIAB_Iy4Z3r1peJUlH2NjFzT2HqZwh75HnLeZ-B5JY
Message-ID: <CACMJSetpE0CrNkYN92R1=MFqb_QAxX27PPFAetKAqr-_m3YN=g@mail.gmail.com>
Subject: Re: [REGRESSION] next/master: (boot) WARNING at drivers/gpio/gpiolib.c:349
 gpiochip_get_direction+0xc8/...
To: Mark Brown <broonie@kernel.org>
Cc: kernelci-results@groups.io, bot@kernelci.org, 
	Linus Walleij <linus.walleij@linaro.org>, regressions@lists.linux.dev, gus@collabora.com, 
	laura.nao@collabora.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Feb 2025 at 13:28, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Feb 25, 2025 at 01:55:08AM -0800, KernelCI bot wrote:
>
> > New boot regression found on next/master:
>
> Looks like more platforms which need fixups for the return value of
> get_direction():
>

Yeah, I just proposed to revert it for gpiochip_add_data():
https://lore.kernel.org/all/20250225-retval-fixes-v1-1-078c4c98517a@linaro.org/

Bartosz
