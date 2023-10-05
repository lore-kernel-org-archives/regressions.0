Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA9B7F
	for <regressions@lists.linux.dev>; Thu,  5 Oct 2023 00:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="De+hQJkm"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50348c54439so1123e87.1
        for <regressions@lists.linux.dev>; Wed, 04 Oct 2023 17:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696464816; x=1697069616; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRF+vIlJA3ZehEMRKa/evOkO3sf/u/GsKZC4fdcnalA=;
        b=De+hQJkm5JXNFot1/mgwmpIFQiqm2G7qf+LWh8NLMqhVOzx7z7dBTiWj9xsRs+YtKf
         8CzMkk7rT+4ZovhKU0uY1Npx0eE9kCbM37s3lXC6EBiX/RcFxGQlWobCDLHKKRU4gONk
         M9cME0e73YdqJtb5uuPTbTwkj/gkbbanqEH0derRIGZQAlpDCWqwTpNuiJTLYLh20kYk
         aVsUo9iQb9NzrGgO5By6H0mHDo531fyq7b3z9Rz8EYup3sa2DK1nPbWiCQ5OuamJU+rb
         rA6YViwBTTiLTqiI4MmZk0KPtnk4bU0MTv7tdxdiJZBr8TGCbgsBMcfpN6dZjfwOLKFf
         33cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696464816; x=1697069616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRF+vIlJA3ZehEMRKa/evOkO3sf/u/GsKZC4fdcnalA=;
        b=qGwZD1n8pA3jok6CWYRCuBne0Nj1h497N3i7QCUbc7FkirDSceva4n2FFT1ly9oEzW
         AoFs72hyR0Y2VQt6a2p3dWO+Na6xv5WRMLgj+IZqpsxBq6KHB6BZiAKm1XAbPjkbqfrv
         T7ulgwiM+c/MNpLeHxisFjp6ldW+CFyW6a0oZ1YGzCClAsuNxUtjAAMOnWta12kBZgm3
         y07FqaJq/1BiedEo5gZZtc6VrPgE2idSZC2TXHRY5AjZEv4My88RwfOHHn1jAMX3GdqI
         mQNVCZvWnpG3xZl7G2BZbNEI2EjBSbO5iHA/eEEviYeAWiRIOosoKRqto9V+asL8AgAA
         g+uw==
X-Gm-Message-State: AOJu0YwlZ6755qJPH2HSal7rWUlmgwP8rdA34QThmSstHJ2y/Pe4N8TA
	yoY62OQVfF3jS2VAi56NmCHyyKypST0saP2xsMIkYw==
X-Google-Smtp-Source: AGHT+IG24SY+AmaIc+GhrEz329Y4vBmKjCMcDq+rUUT0zgxupE8c2rrSkXUVRsTg1cVaRBl7z6gixwGZa6VYIoacwHE=
X-Received: by 2002:ac2:5d67:0:b0:502:932e:2e36 with SMTP id
 h7-20020ac25d67000000b00502932e2e36mr31850lft.2.1696464816245; Wed, 04 Oct
 2023 17:13:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231004005729.3943515-1-jefferymiller@google.com> <ZR1yUFJ8a9Zt606N@penguin>
In-Reply-To: <ZR1yUFJ8a9Zt606N@penguin>
From: Jeffery Miller <jefferymiller@google.com>
Date: Wed, 4 Oct 2023 19:13:24 -0500
Message-ID: <CAAzPG9Pp6mHfEziJiUuhDRmkKMfiiPD6axtfAMaCJcEAcuQPiA@mail.gmail.com>
Subject: Re: [PATCH] Input: elantech - fix fast_reconnect callback in ps2 mode
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: regressions@lists.linux.dev, benjamin.tissoires@redhat.com, 
	linux@leemhuis.info, Andrew Duggan <aduggan@synaptics.com>, 
	Andrew Duggan <andrew@duggan.us>, loic.poulain@linaro.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry,

On Wed, Oct 4, 2023 at 9:11=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> In fact, now that I think about it more, we should rework the original
> patch that added the delay, so that we do not wait these 30 msec in the
> "fast" reconnect handler. It turns out your original approach was
> better, but we should not be using retries, but rather the existing
> reset_delay_ms already defined in rmi platform data. I would appreciate
> if you try the draft patch at the end of this email (to be applied after
> reverting your original one adding the delay in psmouse-smbus.c).

I tested the draft patch and it works. I did revert the previous delay
patch while testing it.

>
> I think we need a similar change in synaptics.c as that one also can
> fall back to PS/2 mode.
>
Ah, good point, yes it does appear this needs to be done as well.
I have tested and will post an new version of the patch to include
the fix in synaptics.c as well.

Thanks,
Jeff
