Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7632185BD
	for <regressions@lists.linux.dev>; Wed, 16 Apr 2025 08:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792618; cv=none; b=ESp/IN3FK1LXHjM4zAWqgvhjzPMhgLdt/hcNSlRvRFHgBoK3spO+p6642NsgSlb8DhQ7d+XosZt4DcieFJMb8GqRXjOr+VU5T8ngBHnVec7WpRPIg8LdxBlJoHFV24xKBUlRa8hU+ABEYPyArq8AFDCqjHNsOYJSq3BklRgzmkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792618; c=relaxed/simple;
	bh=DXCImHbhgaHYD5NXAki2E5LHyVFHbeqj7RL6q2PIT+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/DlIvzbbmrMXnbnRknxS3mwCIzIcdzw8990xhlE02nieOAlsaQvkFs35W56EvPYbdkFGrWLT0gPcqhAwK+YYZnCFEZYPqaEprTS2OYhQBEvOPBlQ8E5qjIKYH0TQoLjd+UqqAWcGb8oNZrx0wan1BJhK02rpVrg9Gy5LTSaDBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kLFdvI2G; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kLFdvI2G"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5499614d3d2so7305140e87.3
        for <regressions@lists.linux.dev>; Wed, 16 Apr 2025 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744792615; x=1745397415; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXCImHbhgaHYD5NXAki2E5LHyVFHbeqj7RL6q2PIT+U=;
        b=kLFdvI2GvvOS3wS2dr9KsRbf9tscITq4oA/YJ2dWlfRhPY659floxPLPgd+bLlduEL
         FOqrMhEosuwweqc+19ke/VSUwv55gQgX/SiqenuNFmec0nOBWZGML3+8dqaD6efxktsH
         nKaBFGn+94SJSJm4M7u4hd+n2mxMyua5dNJ/l8Iiz34UrQKXgVNjUATDfmPMGf6Rtqnt
         vrWbelTpnErzWxVwpN244S+XnEpSAdlFkgahLOFta483Y4jHWM1RxcxiDtn3jDR/pE+H
         UJJ5lw9xt2UQ4e6Rr+Rf3Yn1yvLzEhBYSX4tF/YRCZRED3i9lwUaeZrD5c3aU1PN71sI
         fRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792615; x=1745397415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXCImHbhgaHYD5NXAki2E5LHyVFHbeqj7RL6q2PIT+U=;
        b=P6YAFH4JojTFVIpwKjpQwLD7b+5jt502RYR+aaaMm7llOyA4hz3RD5w1F1ZggUiftl
         5FfTDUXgyr6NspmzNqlKikFdatcTqq26s+YVoGRrE4JxUh444lTgmtWgOHOSgBic6dNg
         WsWI8G8Pn3mlehbtliXb5mYRxVgmrw9JSKPdzGPQlaQqOckS5fVmUuXo8I8bRHHL1h7R
         5+62fmLJ3T2MgRFVj3+9rBh3eHqzf1wAlid4Bi9NfRuxkkTRi3SPu240OHFb2GzEh1zL
         h3TsZ1yID+uJ4JYnEStPHirVIIPC2Wk33jLBhzARH4MCELXIOCt2Ec3hZBEpEUjXsZPI
         3B2A==
X-Forwarded-Encrypted: i=1; AJvYcCWutQPe20RVu0POOUIPyXvHa8+EEQDaSbBTUGjNqsHAP2yJsNKvLHO4DdyNZwmEJIVFAWWmPslwR9GgTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhZQGANHVL3EfWmQTWjB2wNZKIPgvUnO/llLixZxWGC8tAJajJ
	YAVY5afZ01/Bx5FOoPfjYoUQdt1wzSuSjnuxhn+yl0LxWu/+VUCE3bVeTMokHSejBzeUc+pMUxk
	bDU236AWA/ejUVVKJphYiEIQwBIO7Jmbbydo9rA==
X-Gm-Gg: ASbGncuC6SM+f4PHT4PPmsI+fIvWK2sQNpH77tTJbqJjBvVgBuho/XaAGfTjTyxD+0i
	v63d96OvzsQ18pXoOGr+KRKg2+yoo1o3hi7jfO22gldkkeV99xm5BcPg74uKPKf4QEOhztEE88i
	66xjfPHl+RC8eJVVp8Frh+VWjOCpszzOWE
X-Google-Smtp-Source: AGHT+IFnTyulj/0oGbeIikzilFJSE7sEuMb0JSQLD2qCkdI3QvGlZH639PCmqr2wKnbHsJXFbiOa8zKp3Mk8GGtQ/fo=
X-Received: by 2002:a05:6512:3d02:b0:549:5802:b32d with SMTP id
 2adb3069b0e04-54d64a7ae44mr362901e87.3.1744792614952; Wed, 16 Apr 2025
 01:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250322035307.4811-1-ot_chhao.chang@mediatek.com>
 <20250322035307.4811-2-ot_chhao.chang@mediatek.com> <43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoakqzd4wdi3df6y@w7ycd3k5ezvn>
In-Reply-To: <43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoakqzd4wdi3df6y@w7ycd3k5ezvn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:36:42 +0200
X-Gm-Features: ATxdqUG40hdym0n5Q2fxGBsUSS0OPVO8ybbpsBi47RVMjHapZZipAk2JRY_FG-A
Message-ID: <CACRpkdbhGJhmNhoS-rqWEtqvH=D_2Q2+djaXWmyEu3o8UEcaZQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] pinctrl: mediatek: Add EINT support for multiple addresses
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Hao Chang <ot_chhao.chang@mediatek.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 4:57=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:

> this patch became commit 3ef9f710efcb in v6.15-rc1. It breaks booting a
> mt8365-evk.
>
> With earlycon it's possible to see a null pointer exception:

Argh, does this patch fix it:
https://lore.kernel.org/all/20250415112339.2385454-1-wenst@chromium.org/

I have applied that one for fixes.

Yours,
Linus Walleij
