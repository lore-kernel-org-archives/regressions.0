Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B9920316
	for <regressions@lists.linux.dev>; Fri, 27 Oct 2023 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z1P7Sgp3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40806e4106dso12429835e9.1
        for <regressions@lists.linux.dev>; Fri, 27 Oct 2023 06:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698413943; x=1699018743; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/rNM3qG+7ShmUtIGpCjGm6Sq06g6NUkhuZrSKUSc88Q=;
        b=Z1P7Sgp34BeedtynvzLhbjOaYTq2KmOHC4Q7U82mHHCSIUApHoSZjq2zQhgA5d/zsJ
         K04xQ2cJGv7d6Ez/hMWrkQY/kSdM1sursm3jSUPGL2vRgnDSenjv7b+EBAZmAxY284t/
         P/mT6Gdo7uhZRzdkiKFvw9usSB8hZhIp5yB72e8J9CtwrQkbyumZVKB5hC/LO8WIExdd
         YUuzEoVdANo5Xy0YT0kbPFXajZ0vy+vB1WUNiL7Gb0WN5Mmy16mUO3XbfIwWQTegeBnm
         FPe74QCJPbit9fyOHjxkCtAUAGiQn3mFGnHEAkW9Q64KTI/9LN/2loIKTYCf3+a/05yh
         5lcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698413943; x=1699018743;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/rNM3qG+7ShmUtIGpCjGm6Sq06g6NUkhuZrSKUSc88Q=;
        b=fCguIWY7+4mPqhUg0rsSrq7+31PbulFol5cislvoQJv0EBtg1pgsTNRBn4e07gPOlj
         lVj/cKmTTisS6MDGduKHgTXsR7BgHWyU1ObAymNs5B9gzGj06i4ax3XSSZ5NKGhDIWKz
         S5Wt/tvfofXy00NwvguePUImzT4+F8ZFNLI+AxaPjHBhMhD19arleiFS+6bF7n6oyIdj
         JWCH3NOHdeYtG8bHxJq5STw30BU4cMd1pMEbAxHdchKNmJBZl/erOFrkG+P23/2ZGSov
         RtcD0Gm0vgpT94UvcXWGSQ0yxKPR28AHPQ9Y2xVRJkybpvMxlaUgHZQzR7Vb1aaVgeX0
         JAdQ==
X-Gm-Message-State: AOJu0YxVjNqBcVdyeYcaAk146/I03O+weUtuTi5VsRLltGvYLfIZdR9D
	QRSDmXHUJyIE3lodH1AX3rIMEg==
X-Google-Smtp-Source: AGHT+IGPIu+YxmBlnsCsqhU175AiGCa+jaIaQUU0rJVU2/20+2pO7GItM1hbViSEZ86YUnftB9p/lg==
X-Received: by 2002:a05:600c:3b03:b0:3fe:d67d:5040 with SMTP id m3-20020a05600c3b0300b003fed67d5040mr7041851wms.5.1698413942830;
        Fri, 27 Oct 2023 06:39:02 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id z12-20020a5d640c000000b0032da35baf7bsm1775442wru.113.2023.10.27.06.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 06:39:02 -0700 (PDT)
Message-ID: <afe378bf254f6c4ac73bb55be3fa7422f2da3f5f.camel@linaro.org>
Subject: Re: [PATCH v2] Revert "fuse: Apply flags2 only when userspace set
 the FUSE_INIT_EXT"
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul
 Lawrence <paullawrence@google.com>,  Daniel Rosenberg <drosen@google.com>,
 Alessio Balsini <balsini@android.com>, Amir Goldstein <amir73il@gmail.com>,
 Bernd Schubert <bschubert@ddn.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Fri, 27 Oct 2023 14:39:01 +0100
In-Reply-To: <CAOssrKfP+t-cy322ujizQofgZkPZsBu1H4+zfbWNEFCmTsXwug@mail.gmail.com>
References: <717fd97a-6d14-4dc9-808c-d752d718fb80@ddn.com>
	 <4b0b46f29955956916765d8d615f96849c8ce3f7.camel@linaro.org>
	 <fa3510f3-d3cc-45d2-b38e-e8717e2a9f83@ddn.com>
	 <1b03f355170333f20ee20e47c5f355dc73d3a91c.camel@linaro.org>
	 <9afc3152-5448-42eb-a7f4-4167fc8bc589@ddn.com>
	 <5cd87a64-c506-46f2-9fed-ac8a74658631@ddn.com>
	 <8ae8ce4d-6323-4160-848a-5e94895ae60e@leemhuis.info>
	 <CAOssrKdvy9qTGSwwPVqYLAYYEk0jbqhGg4Lz=jEff7U58O4Yqw@mail.gmail.com>
	 <2023102731-wobbly-glimpse-97f5@gregkh>
	 <CAOssrKfNkMmHB2oHHO8gWbzDX27vS--e9dZoh_Mjv-17mSUTBw@mail.gmail.com>
	 <2023102740-think-hatless-ab87@gregkh>
	 <CAOssrKd-O1JKEPzvnM1VkQ0-oTpDv0RfY6B5oF5p63AtQ4HoqA@mail.gmail.com>
	 <689f677b84b484636b673b362b17a6501a056968.camel@linaro.org>
	 <CAOssrKfP+t-cy322ujizQofgZkPZsBu1H4+zfbWNEFCmTsXwug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4-1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2023-10-27 at 15:24 +0200, Miklos Szeredi wrote:
> On Fri, Oct 27, 2023 at 3:14=E2=80=AFPM Andr=C3=A9 Draszik
> <andre.draszik@linaro.org> wrote:
>=20
> > The patch in question has broken all users that use the higher
> > flags
> > and that don't use your version of libfuse, not just Android.
> > You're
> > filtering them out now when you didn't at the time that those
> > ('official) high flags were added. There are a couple more high
> > flags
> > than just the one that Android added.
>=20
> Okay.=C2=A0 Where are all those users?

That's not the point. The point is the kernel<->user API has rendered
them too non-working.

> =C2=A0 Why haven't they reported this?

Again, not the point. If I was to ask my crystal ball, Android is
trying to track the upstream kernel closely, others might not and might
not have bumped into this issue yet. Still, not the point.


Cheers,
A.

