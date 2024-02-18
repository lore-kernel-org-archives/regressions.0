Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E4B63407
	for <regressions@lists.linux.dev>; Sun, 18 Feb 2024 13:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708263116; cv=none; b=ZKiU8aX7BL6nxx/DL4p48gTDhRCXNSRi9oyBeTc4ch8/6Mu5xlb9ltGHU4zT/ByxcZWCfSrtq/26X7tJNlasMXEytO6N5CGd2veXF5d9m8dWX1nWz0dh298rz3+ryPcjiBpLa/3moVY3Z55OARPbf054Vy7dsybD5vbQzen1F9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708263116; c=relaxed/simple;
	bh=yrIY/yf8AjHcs9KAgzzhFa0TbucMdW+AXlq+QCL55I8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QW1Bg+uEpgFpP3PyB/4tO7z1ykc7rCkJlrBUNu0EvUEQRmfXztGvwN0rVvOHS7SlkVtWKpLYVyGORRQtQwDk4XupdtJqRLsqZijFf4U0uOdsZZlAAOOMBrM4K7U6OmVAq5e+3vnqcB4DLGpFjcTLl0E8ktayd+F9QhTXAAxP8aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R7ZE+UmJ; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R7ZE+UmJ"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so3578624276.2
        for <regressions@lists.linux.dev>; Sun, 18 Feb 2024 05:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708263114; x=1708867914; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLZq4hHi1AwzI9ptRmrUPgmKE8tZxkSC9vVEZHcAwl4=;
        b=R7ZE+UmJEBwgozzTPVHhM23a71n5gMnaoZXpAB3Ykl8Sj2qM8qT5DET0iuODi69aTB
         3O5l9dU8sbPAHqqx/RzbCunWSZe6KsHXQDv3DjGrHNbtvuPBB7Eg0TR669oBB2+S5bAW
         gZ/4x4Xb0Q5ocgNmLNJXmoaNYHK1eMzwt7PrczNoQjKZdIYUVUECissyhbiCizSF8bkk
         TOKIES2Q7HrjW+f9q2lmG+PUwvwZHFpVcym5aq7edwWUwL7GtdPj6gsxW26PbGguG7CE
         /xCBU2Flh78hb9I52pEgDq9kWsYoK1np68FqrARM4f1QL7t667EnQhXwuTQi4M62zhzz
         wLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708263114; x=1708867914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLZq4hHi1AwzI9ptRmrUPgmKE8tZxkSC9vVEZHcAwl4=;
        b=xGoIg7zHFw0vRoSrMKrQHpGsQzRS7NRSZsL0hHT0OrvHK0sWL569bvOgXj8aKeW8mH
         sm3yZgN5O2XCCthz8yzYzBcsTcM9CfXniwM4uPHvYM4k/tJuvlu8JxdN9ftUye49wkjg
         vZbHIGCDffAKdaSG/G6pRg3vqRCwQ1L4D3ruaTRXnAQibGatuiiRSBGgjHWC8s57h/Th
         KFfCgam6mvFJAlgIgSvaDAp40GEF4aqZ5SzW6wKTPfqyF7L2Y9RhFOy9j55NwC4GF7Bd
         LJZb6JMXuTJ6fBSD8EZ2uRgME72mOy8o8hMWcF23j2pOxnVjeTqIMe8NLQMIV03ucZ2H
         o1Ow==
X-Forwarded-Encrypted: i=1; AJvYcCX3LHj+CQdVQYVfF4MNO1WGLTgHVMvvNeA6jNMT91ACEgeaNWmtO8ZSlfCuU+y0Ni9VfZpfDv5YV0DY/7xdewH4ksoL4yBqAYL6ygg=
X-Gm-Message-State: AOJu0Yy4ZnpMyZIFcvZJh/tCPK2sMEoPhoAsG6R7lmdwpycsa/sJdU5V
	TQDpszn2tL7VycRD+G303HuMbDt71iYF3378vzddP7pgtZOJ7bN46wDK/QQyZAidqUfr7fdSEUX
	9xYzwwl/sfmVfuCY2lQz6AyYlbWNBRJRofr/+vQ==
X-Google-Smtp-Source: AGHT+IFtJWbUMAlmCDvHbnQtv8DWuSpS+RMOGtTOdZUEacxd/aOjFJ8Dzacfw8W4vpnWE8jAyB0bBS5+Jh+puyW8WEk=
X-Received: by 2002:a25:8404:0:b0:dbe:4f15:b5cf with SMTP id
 u4-20020a258404000000b00dbe4f15b5cfmr9384502ybk.15.1708263114193; Sun, 18 Feb
 2024 05:31:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231207213048.1377147-1-cwabbott0@gmail.com> <85581fad-da8f-4550-a1c8-8f2996425dcd@lausen.nl>
In-Reply-To: <85581fad-da8f-4550-a1c8-8f2996425dcd@lausen.nl>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 18 Feb 2024 15:31:43 +0200
Message-ID: <CAA8EJpoqS856N8w3ZxdhQ0TUVP2u5K8qCjG=qLQPnHXGH9NyNg@mail.gmail.com>
Subject: Re: [REGRESSION] sc7180-trogdor-lazor image corruption regression for
 USB-C DP Alt Mode ([PATCH 0/2] Add param for the highest bank bit)
To: Leonard Lausen <leonard@lausen.nl>
Cc: Connor Abbott <cwabbott0@gmail.com>, freedreno@lists.freedesktop.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 18 Feb 2024 at 03:17, Leonard Lausen <leonard@lausen.nl> wrote:
>
> Hi Connor,
>
> unfortunately, your series https://patchwork.freedesktop.org/series/12752=
9/ has introduced a regression for external displays connected through USB-=
C DP Alt Mode, at least on sc7180-trogdor-lazor devices. Do you think it's =
possible to  fix this before the 6.8 release or would it be better to rever=
t the series? I'm happy to help testing any fixes. The issue is also tracke=
d at https://gitlab.freedesktop.org/drm/msm/-/issues/49.
>
> Thank you
> Leonard
>
> #regzbot introduced: 8814455a0e54ca353b4b0ad5105569d3fdb945cc

#regzbot monitor https://gitlab.freedesktop.org/drm/msm/-/issues/49


--=20
With best wishes
Dmitry
