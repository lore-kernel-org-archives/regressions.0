Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4902122B5AD
	for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 16:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571365; cv=none; b=TEKU+uMfDzREHqTbdQ/gP/KwAzhjxZA+yjn2+K60tufGbrTcKKDkhktxI1pDR9nbFOl3HO4VngzTl6suirjInqSLfGUMhmvF9iqG+ASb4RWQndc5LEHs4t+hzHwc5A0x9rm8ASRY+YF4jqBhXvDPT5m7byxdpdTGzBfY4OOpEGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571365; c=relaxed/simple;
	bh=wTyh16gIsXOpmKxWomo5pL+6PuNstZOY3iV5Mc19Hbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TY/5F+HSLq9UyKuMcCAVDvg3T5mJZdQ4xJu3NJgakvIqaodEVL9qLikHjIF2fmrWCV1o+wJUdZuaqWP95My7oRj/w7yZKBPNbWk2jGC0BmZoxXgGp53fGSyppFKcqHDG9B6Mrm5F4fS48Hv9wrY3fQhL+LWjKfJ8OzIcWVcu58g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AWkPsV39; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AWkPsV39"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so2599463a12.1
        for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 08:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763571359; x=1764176159; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eD+YWMUVpJrK9KKDezI6svtkNq5y/cLTtamXj4+DoDo=;
        b=AWkPsV39NMGhCHaEvIppgyXzBuhEMAl+6oI2ANFKUApPnD+F98pxoJVZPwLz29Zht2
         YR5PrGro1X2ju7RH1d58rpxM3hmBHoaDoRNAx5Ue66zwQLu68cArCi202/CyJAJ0Cm6u
         Mktd0pppIWDvJQALjLaAlqi7uV7DsblHjOHZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763571359; x=1764176159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eD+YWMUVpJrK9KKDezI6svtkNq5y/cLTtamXj4+DoDo=;
        b=LoVL6epFzWQQz7NkdBO2DhACINPAUveLWUICTQ1dgMZ9al7jBRzv9oaKVM+OcxQqkw
         N90+jewvP1TEQLWm+snjCZNcJh6D3SIKuefxalHrnUXJDKuRHIiOTbrllvC2Ux+cbstA
         NHRFpjL96WurRtK2jiFKmG6Ra0KDaObpgJboEWhUUAnZw8FHxf/gm2Qs01TKYzTBeq+X
         pBdKVnzgJZquna8hRCk+sfZuACDYmI/Y2oiQ/mXBOY7fwyRVdOxh0C15aZbkcv9XhJ6E
         r2IFvPGpkWZ/T67jcb3L0u660cM4hXe5tq/sibrx/Xj/iIRJVOkIzEN4XSffsuTH75Xv
         kxSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjYY4DHrWeI9j9eYyUOetrt9xhVY3Hdk1KU6v7Kx3+z5c/mtWxoMsEyAlovT6U8mpF+S0Mk+QXLRjgGA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBTBPvOD7v08PpVrrVJLBLNVXs//mW6horQZqwc7QBzm38UsB4
	aiOGFXLwF+cppyEZFq240oArBHO+L8jIzMNIqcV7PBm7s9xn9gnOM8hb0S46z1MRGl0nlRoue9I
	8ATRK0sj8
X-Gm-Gg: ASbGncsYilZLwiICENRQPaYrEuyDDjqOAKCOGAKh4N4Gfn2/y1ZCMtAOj0CW9+MR+uz
	VZqKnDfIFrNppVFrNLujzJMwkrQ59T7HvebRDuKiHQKqoGPaJzKlRgBK0mQ1Og2Pq+7BFmyHi8C
	UsTuchXrKqilxDwHysi4DuOee59UqDM8Vl12DUlYKT9bAsv/tjOpODid3D9MU5EUio5H11b4KZN
	YaqMLd4/vECFvN8rXD9a1pBtPJM/QuN2IyIzbF+8rHviJh2t3lVEY/B90SR1O1mUHnZNivvnvNQ
	kxsCqEVWl6EBUceb1hiy0w1qHSSEd+fwIWoCje1GRzPII4AuOART5oH5esscvDXiKYp798gIxZ/
	3CBKAVxBnF9eISwS6BZOIHIdBSO8K4N+KqnjykgYa2FuZuNDQgkTM5OOOlBtrQ0xyGGFK1SjfFa
	8peuYmq6T72N3ZsyOrZBud1mpj1YN1tk6zDnP1aj0oMNlzRiWm+1hopw8OugIy
X-Google-Smtp-Source: AGHT+IGhLCJkH/edMTFwntSznUH5nbVEAkuWlZjV0Z+CPwJROxUetHxt3zq8wqcc0ySKKJEfHJrWeg==
X-Received: by 2002:a05:6402:2105:b0:640:9993:3cb8 with SMTP id 4fb4d7f45d1cf-645363c69d0mr29833a12.5.1763571358896;
        Wed, 19 Nov 2025 08:55:58 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6453642d32csm3996a12.21.2025.11.19.08.55.56
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 08:55:58 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so3915188f8f.2
        for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 08:55:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV22FNJ0EzLsdYkZ2mF1Vf6bH1ALnlTWpWlBdKAwrubh7rbigljWMFdffaD2DxsbjvqowKfRwq997dArw==@lists.linux.dev
X-Received: by 2002:a05:6000:288a:b0:42b:3cd2:e9ba with SMTP id
 ffacd0b85a97d-42b595a48b6mr19864079f8f.33.1763571356370; Wed, 19 Nov 2025
 08:55:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <jOB6zqCC3xjlPPJXwPYPb4MxHJOhxVgp380ayP7lYq-aT2iA5D8YCdMeCvq5Cp_ICZmqjpfgX8o9siQdlPu9DY4qgnL_zCjgqP23fXc-P4U=@proton.me>
 <1b59d3c2-1ed0-40df-a3ba-cca2316e866b@leemhuis.info> <a03739b9-3a54-4ecb-b55f-6aaa69da3fc6@leemhuis.info>
 <a380d061-479e-4713-bddd-1d6571ca7e86@leemhuis.info> <CAD=FV=Xt58+WGK_j_TvTxpUfXrm-=Cec1-oodkuf5xiDGrsKuA@mail.gmail.com>
 <T4YKnjuw-ZdA4uQjGVxQh-vqahAK_69kn20zfC_8R45iOxbdjo_tlIDwP5rTUyjn3NVUHYhG09VO2ryFtfLtgptBBhfXggFNAD2CVAwPcjU=@proton.me>
In-Reply-To: <T4YKnjuw-ZdA4uQjGVxQh-vqahAK_69kn20zfC_8R45iOxbdjo_tlIDwP5rTUyjn3NVUHYhG09VO2ryFtfLtgptBBhfXggFNAD2CVAwPcjU=@proton.me>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Nov 2025 08:55:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WDx-WcosBWf2yd3sLx5pEyjOgbs_Y5RBF=+b=0q3dBww@mail.gmail.com>
X-Gm-Features: AWmQ_blPC7GadakNs8qCnRJFHI35OugoB7NfCXE2CsfE_EvbaJt_UoALfZIaz0c
Message-ID: <CAD=FV=WDx-WcosBWf2yd3sLx5pEyjOgbs_Y5RBF=+b=0q3dBww@mail.gmail.com>
Subject: Re: [REGRESSION] Bluetooth adapter provided by `btusb` not recognized
 since v6.13.2
To: incogcyberpunk@proton.me
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, "marcel@holtmann.org" <marcel@holtmann.org>, 
	"luiz.dentz@gmail.com" <luiz.dentz@gmail.com>, 
	"linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, 
	"johan.hedberg@gmail.com" <johan.hedberg@gmail.com>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 19, 2025 at 12:05=E2=80=AFAM <incogcyberpunk@proton.me> wrote:
>
> I can confirm that reverting the commit `Bluetooth: btusb: mediatek: Add =
locks for usb_driver_claim_interface()` with the following commit details ,=
 solves this regression that has been present in both the stable and the ma=
inline kernels since 6.13.2
>
> Commit Details:
> - Title: Bluetooth: btusb: mediatek: Add locks for usb_driver_claim_inter=
face()
> - commit id: 4194766ec8756f4f654d595ae49962acbac49490
> - [ Upstream commit e9087e828827e5a5c85e124ce77503f2b81c3491 ]
> - Author: Douglas Anderson <dianders@chromium.org>
> - Date:   Wed Jan 15 19:36:36 2025 -0800
>
> Reverting the above mentioned commit and building the latest mainline ker=
nel without the trouble-causing commit fixes the issue and the bluetooth ad=
apter now is properly recognized and bluetooth works flawlessly.

Hopefully fixed by this commit:

https://lore.kernel.org/r/20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd817=
36649568a@changeid

Can you confirm and add your Tested-by in response to that patch if it work=
s?

-Doug
