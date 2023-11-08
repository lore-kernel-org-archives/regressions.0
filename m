Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D516712E59
	for <regressions@lists.linux.dev>; Wed,  8 Nov 2023 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FRHT+9W0"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c59a4dd14cso89683181fa.2
        for <regressions@lists.linux.dev>; Wed, 08 Nov 2023 02:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699439494; x=1700044294; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZZHOWVitV8fpPpTSt/LEY0mOQlvuP3Z+CJF3ZJjpjr0=;
        b=FRHT+9W0ROJHF3eI3/0lm8UerYuufYdZsuRVEJTcPUUIXGU/TCYkI48Yyyz1N5EAFI
         ZCu9LfF4kOgKBMQSiIcuZBBTNm+PQ+abfx2H4cNYrKa18i8vqqWl6k1Gxqg8tyl9XiMV
         7QyrrtHWgqx4GM4pcYvluQejgIr0JxaGBSqcaI0VsoPFN9m/Ozh+MrDeVp0Dvp3p17jF
         RdKN7gNUMaQICGu8w74dtsMOEFjms0Cw4TY25a+oJVQKLC0P+CkPfZ3GlFhfXktJUbBi
         SlLMYj9pSM1byeuGbj1SG812QDLT41k8GIKWxQbu9fSdCRtlJiQw7v9TMVCrw/3zJyAu
         C6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699439494; x=1700044294;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZZHOWVitV8fpPpTSt/LEY0mOQlvuP3Z+CJF3ZJjpjr0=;
        b=L4EhM55opYL9eN8w2AwMNK1Gnr1tjsWyXVKhP/J09DlMQIS0a5YL8xd3fAZOg5Bks0
         QHUI5blUzxgmJxJan0xePJMjJUb92FKTHe7RZlmK2wu8ht65c5iqJcoDSLSbL9c/IL/n
         3hjsqp2Vi0estNMudH0GuS+TyJ1bFrUUsergW/UjT564pUMy9oVUdHMeDrix2nTVq1IL
         /MR7WYfdOSWNvGj/4b/AUToBVbK9K8BPyeCB15aeo1cpCd8PFR4bXQEhiLPdQdIjmNsY
         1OM+hqlDmMABNAglzlBXbWg5829ArBBt9zE/lyDRr812g8z+wcBwwFmNI4tfFCyTLDqq
         W2BA==
X-Gm-Message-State: AOJu0YyerudIYmce5ZFmAFeERKVvr0C2PaAL0Y1LF21VrC3Gky7AIE4/
	XBavsUApV1J2kmdJo8A88AplS7BSnYCclK0TGSgDuzK9
X-Google-Smtp-Source: AGHT+IFGbhaVKFe4xCjLwT+C8qJk1HX078wZSs2uP1BZS21UHg0qYYDKYp+gYXHQ2/HXV4dQHz545Q==
X-Received: by 2002:a2e:9682:0:b0:2c5:1809:69ba with SMTP id q2-20020a2e9682000000b002c5180969bamr1256401lji.40.1699439493885;
        Wed, 08 Nov 2023 02:31:33 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id f14-20020a05600c154e00b004097881d7a8sm15887394wmg.0.2023.11.08.02.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:31:33 -0800 (PST)
Message-ID: <61be0ebb17ae0f01ea0e88a225cbfa07ff661060.camel@linaro.org>
Subject: Re: [PATCH v2] Revert "fuse: Apply flags2 only when userspace set
 the FUSE_INIT_EXT"
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>, Miklos
	Szeredi <mszeredi@redhat.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul
 Lawrence <paullawrence@google.com>,  Daniel Rosenberg <drosen@google.com>,
 Alessio Balsini <balsini@android.com>, Amir Goldstein <amir73il@gmail.com>,
 Bernd Schubert <bschubert@ddn.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Wed, 08 Nov 2023 10:31:31 +0000
In-Reply-To: <7df24b0e-ea98-4dc7-9e1b-dfc29d0fa1b1@leemhuis.info>
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
	 <afe378bf254f6c4ac73bb55be3fa7422f2da3f5f.camel@linaro.org>
	 <CAOssrKeJB7BZ7fA6Uqo6rHohybmgovc6rVwDeHbegvweSyZeeA@mail.gmail.com>
	 <7df24b0e-ea98-4dc7-9e1b-dfc29d0fa1b1@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4-1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Thorsten,

(sorry for the slow reply)

On Wed, 2023-11-01 at 13:36 +0100, Linux regression tracking (Thorsten
Leemhuis) wrote:
> I'm taken a bit back and forth here and it seems we are stuck again.
> So
> let me try again to hopefully clear things up a bit:
>=20
> Andr=C3=A9, could you please state
>=20
> * What practical use-case actually stopped working?

It's impossible to use a newer kernel together with an older user space
which is something that Android had been supporting for a long time.

> * What Linux kernel version actually worked for your (because if
> thing
> broke when you upgraded from a vendor kernel to a vanilla kernel than
> this does not qualify as regression IMHO)

We are using the Android kernel in all cases and Android applies
patches on top of Linus' tree, yes (as does everybody else). The
previous Android kernel worked, the current Android kernel doesn't
because of the patch in question.


I think Greg made some valid points before:
https://lore.kernel.org/all/2023102731-wobbly-glimpse-97f5@gregkh/
> I'm talking about a patch where you are changing the existing
> user/kernel api by filtering out values that you previously accepted.
> And it was done in a patch saying "this might break userspace", and
> guess what, it did!

I guess it boils down to an an agreement regarding Greg's previous
questions/points:
https://lore.kernel.org/all/2023102757-cornflake-pry-e788@gregkh/
> So because Android userspace is sending a flag value that is not in
> the upstream table, this breakage is ok?

and https://lore.kernel.org/all/2023102740-think-hatless-ab87@gregkh/=20
> now older Android userspace breaks with newer kernels because of this
> commit, which you all even agreed might happen here!
>
> So either you have a policy of "we only care about libfuse use cases
> for this api", or you don't, which is fine, just say so.  But that's
> not what the changelog says.

But I agree, it seems we're stuck and I'm not sure how to resolve this
either, Miklos has his points, Android has a different position.


Cheers,
Andre'

