Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE98EA0
	for <regressions@lists.linux.dev>; Thu,  5 Oct 2023 00:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mSpSMRTe"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4063bfc6c03so37225e9.0
        for <regressions@lists.linux.dev>; Wed, 04 Oct 2023 17:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696466153; x=1697070953; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=891ROwzeVMGLL79Q7/ilOZGIERwi77Fn8nbYvewlZdY=;
        b=mSpSMRTelz6vN6rR3SShLw5vGgfCxGYeB5L/0MH3D1ATVT4y5hsisuGeEVK9HWicQl
         jfPM0dRgjDvHnpbyXpVIqbOkGhT7CU3gp3db154K5ylDe2DE78UuXlvz+Shf2YyIopXo
         bwLH73+2NiRT/aLeoEJR2H0Xem8GRVyre1/caS9xRxUj7baNYZhKLYIrdJf2wFMmKvYr
         KMKyqkA2B3tIKXMfLRfRWdpyKSes2Evmp0gIy2Jxg6m4qxxQ31nHMHLaXbclimdMvU1O
         n/SdJwPhQco/2MpoIOd3gF/relptcP+LwT1KzOC9hsoA9RTp1ZBTHBmNze/ZAO4io5Ti
         8hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696466153; x=1697070953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=891ROwzeVMGLL79Q7/ilOZGIERwi77Fn8nbYvewlZdY=;
        b=Qhy892FdmQuUQ2IRomYQ/Z09G+WJ/zkED7GF7EpHC7Q7SAYubHjb43lbjCLRJwWQqS
         /259QQJt222C242Ta3SwITJyRImhr+bjnaLif40w55GlnoUum3sa4U83mrpYPJCQJWZQ
         Tg/z6pKE0KmDuZGTq//A3++eKrPYfb06KO0uVffXr2E3/gjqSNpOUWr5SWcodwaDDeqw
         2cN2kAz8nSvcjp/lyaSJH2fgCr7oASvbyXSDVhmhw8qX4BWrhClwCtp02TTIZpDvT0+X
         UPKd8ZizsKCYXcLdMuKtUdgRZC5hbhYkQZoo0UoG2QXtohyu19mpTwcDYRaszh0jH8lB
         uw+w==
X-Gm-Message-State: AOJu0YxCEQ4R679m5SZgk5JfIJkAMq2NbowVzkmTGm86QmR2AzBfyZhi
	peePvbRBD2Ot5CQebCNGwGFQsI9aNmjPALgZJt5nUA==
X-Google-Smtp-Source: AGHT+IEi3YtWX+NJjBDdIeGM/BFonF8YLAMdDpxuuRw2lp4O/hWRzW60AsvY2Q9hZbgVZB7QO5qNM3fDEA51beFgFsc=
X-Received: by 2002:a05:600c:130f:b0:405:320a:44f9 with SMTP id
 j15-20020a05600c130f00b00405320a44f9mr25353wmf.5.1696466153330; Wed, 04 Oct
 2023 17:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231004005729.3943515-1-jefferymiller@google.com> <2023100418-clapping-driven-bc09@gregkh>
In-Reply-To: <2023100418-clapping-driven-bc09@gregkh>
From: Jeffery Miller <jefferymiller@google.com>
Date: Wed, 4 Oct 2023 19:35:42 -0500
Message-ID: <CAAzPG9NBi78mqdLRNCoye6uBaYWa8pM5UX6Jhxi0Vpgi3Ry-KQ@mail.gmail.com>
Subject: Re: [PATCH] Input: elantech - fix fast_reconnect callback in ps2 mode
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, regressions@lists.linux.dev, 
	benjamin.tissoires@redhat.com, linux@leemhuis.info, 
	Andrew Duggan <aduggan@synaptics.com>, Andrew Duggan <andrew@duggan.us>, loic.poulain@linaro.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 4, 2023 at 1:19=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> What commit id does this fix?  Should it also have a cc: stable tag?
>
A crash was observed after commit 92e24e0e57f7 ("Input: psmouse - add
delay when deactivating for SMBus mode") which
is not in stable.
I don't think so. The underlying issue was introduced in commit
8eb92e5c9133 ("Input: psmouse - add support for SMBus companions") but
wasn't causing a noticed problem.
