Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9AE1103
	for <regressions@lists.linux.dev>; Sun, 19 Nov 2023 06:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhB3oNcJ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9bf86b77a2aso455190466b.0
        for <regressions@lists.linux.dev>; Sat, 18 Nov 2023 22:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700376433; x=1700981233; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sWWstq9VEzb+u3ForlZQdBiFb99f3/DYp4agyqbW5EU=;
        b=RhB3oNcJ6IU8pwB2nMAxH2gY/u5Jui6VwRtJnGCfhA0YreWN7TfIgh6dK+w+KYfEXE
         hEMfu9EYC+D1Wv57UzpD4Gn8wwphxS9taOhqZsmAEIPVLbdkTA3h5fEDeFydq/O02KYc
         fDbP6Wx2kNjwVGb6WzuB+DL1Fn45deNofUTtt7wB81rcRr97dQ6Had227MUJlUQYJwy8
         vi2cLGFV0ATmARCjYP9weASrFCWvsbBTbX+3+Jd5Nca5EiZCWBgxMLauauYt6pxhd5XO
         R/0bSmRQw4xRdoXkxqrmp6sTaX+hu5bEYJdGYYxmu+UDtimpx6oiJxq+Epown7O8Z6dh
         cZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700376433; x=1700981233;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWWstq9VEzb+u3ForlZQdBiFb99f3/DYp4agyqbW5EU=;
        b=n/Q+LzectSpll/G3HlzMOr67RDG256b52NRmsBIAhFnkFsOXy48fLAnOhUV8XwwRJN
         l2DGfjR3Tj0ykOzP33W4mWI3POFJrxH2OnN8S+QzMizbO95Mkzd9WoVSg2QqrFSGUh36
         g8kHfRL2IHOz8ICeIIdzrLZr4cgeU/qJicddQKd0hLgKsEIDDO25eRBh7reTKcOXAhn1
         vNCFWgzLWIxef447nvMLE/mNtQBi3hukusYthrrfc891GXAy9UusBwIdrfGgieT6NLsT
         w/npuPt85OzubUtFBX4UyXmSzytgzNlp0OB3+PyZ4QupRSfxvINi/DcQZkJcgPlAGIsB
         3b0Q==
X-Gm-Message-State: AOJu0Yz3EiSWPkptlGwCN7J520fURgVa/NV7KMigE674ojCvaFn+6XQ8
	wXLhRjalgeEub079xFFJ64e+oPTcm8Izg9Zjz+//lVX4eO4+NA==
X-Google-Smtp-Source: AGHT+IFLNYwN5aPDqVp9nauy22AjSvZ5hVHdqJZuBwEFqmr6KS+jP04ZULl0PxzMF602oe1DOWARDCaSrSEte4v5yec=
X-Received: by 2002:a17:907:7283:b0:9f7:b6c2:cd3b with SMTP id
 dt3-20020a170907728300b009f7b6c2cd3bmr2888671ejc.5.1700376433186; Sat, 18 Nov
 2023 22:47:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87edgv4x3i.fsf@vps.thesusis.net> <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
In-Reply-To: <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
From: Dave Airlie <airlied@gmail.com>
Date: Sun, 19 Nov 2023 16:47:01 +1000
Message-ID: <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Phillip Susi <phill@thesusis.net>, Luben Tuikov <luben.tuikov@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

>
> On 12.11.23 01:46, Phillip Susi wrote:
> > I had been testing some things on a post 6.6-rc5 kernel for a week or
> > two and then when I pulled to a post 6.6 release kernel, I found that
> > system suspend was broken.  It seems that the radeon driver failed to
> > suspend, leaving the display dead, the wayland display server hung, and
> > the system still running.  I have been trying to bisect it for the last
> > few days and have only been able to narrow it down to the following 3
> > commits:
> >
> > There are only 'skip'ped commits left to test.
> > The first bad commit could be any of:
> > 56e449603f0ac580700621a356d35d5716a62ce5
> > c07bf1636f0005f9eb7956404490672286ea59d3
> > b70438004a14f4d0f9890b3297cd66248728546c
> > We cannot bisect more!
>
> Hmm, not a single reply from the amdgpu folks. Wondering how we can
> encourage them to look into this.
>
> Phillip, reporting issues by mail should still work, but you might have
> more luck here, as that's where the amdgpu afaics prefer to track bugs:
> https://gitlab.freedesktop.org/drm/amd/-/issues
>
> When you file an issue there, please mention it here.
>
> Furthermore it might help if you could verify if 6.7-rc1 (or rc2, which
> comes out later today) or 6.6.2-rc1 improve things.

It would also be good to test if reverting any of these is possible or not.

File the gitlab issue and we should poke amd a but more to take a look.

Dave.
