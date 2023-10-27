Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0AF4420
	for <regressions@lists.linux.dev>; Fri, 27 Oct 2023 13:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xr5FUnRL"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-409299277bbso9042975e9.2
        for <regressions@lists.linux.dev>; Fri, 27 Oct 2023 06:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698412456; x=1699017256; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y9FU4UMfqPLCxvyDv8DDhP0GwF/fTJfQUUDgXiQIovo=;
        b=xr5FUnRL6XtwE0xmnWGWprcenS3sl1fcStmPaQZTfdqqMOOJEvwGZKb2DdlJlUsgt2
         ES7OEnU0ssEEfFefErnGhDz0DPR3ACVB8f9PP2pddw48errhqd0gTcfrWkFGPSz7/FLQ
         n4frlrNpRFMoUIfDlFVDTHwTNjBn4jacl5QZ5O4hjsWz5TKABEUmSBE6cYe7HQQUWNed
         jQRBwGEotRhL6D2Ic/iPqzKefP9+z3TUNKrGyEOSo6Ts3zgm07Nga/htwb3UlAbNe6yK
         WTmsMA27ZvtKjm4fjTagwhJvUxSq0e9qI2Dh2QpZsFPI6P+4j6UGbYHmvgKQcNmFdeX1
         Lbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698412456; x=1699017256;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y9FU4UMfqPLCxvyDv8DDhP0GwF/fTJfQUUDgXiQIovo=;
        b=cxv9tfibECVqxKBtfYSqqxsb4aQRev2DUL8vKubNgJBoWbWCk4uWUpAzw8bKE96qEv
         e5jgMmTrid1a8nHkhLY0p5OISsAuEkfLqewbbR2E+tsjkdUK9/1znO2KX1vpgZZjjPMk
         2yuUF8gb9AwYmajoZdPnSIoN6wGit6r01+tCdkkF7GgRii4V3poDFc/t+MNhREp5T0TL
         wxHQjym8hu9KSm12n9OjFKnDeogcUBeT5b9XH94+GXPkBct/sNpUYGBqPqWdRpT5v75D
         AVU+i521MjvT0sAeRH9I3ua6chHai3kIwP9cSKYk4P+UZBeCChPVP3s/J3L8yAunCehe
         EpLg==
X-Gm-Message-State: AOJu0YynML0maR4T60Gmxd01ONxOtD/+lf27vFdnCKg2NEuyaABqkPxi
	eT6kg1uthx9QJT2Li+dQ/LSYVw==
X-Google-Smtp-Source: AGHT+IGOGBprN87Ha5ocLSpszBaqqcKWfRciNOH8gUGz9yPPK++UL0stLYDzS0BQFpfzScCRP5zGZg==
X-Received: by 2002:a05:600c:1f92:b0:405:959e:dc7c with SMTP id je18-20020a05600c1f9200b00405959edc7cmr2242338wmb.30.1698412455416;
        Fri, 27 Oct 2023 06:14:15 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id c18-20020a05600c0a5200b0040770ec2c19sm5075966wmq.10.2023.10.27.06.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 06:14:15 -0700 (PDT)
Message-ID: <689f677b84b484636b673b362b17a6501a056968.camel@linaro.org>
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
Date: Fri, 27 Oct 2023 14:14:14 +0100
In-Reply-To: <CAOssrKd-O1JKEPzvnM1VkQ0-oTpDv0RfY6B5oF5p63AtQ4HoqA@mail.gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4-1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2023-10-27 at 15:03 +0200, Miklos Szeredi wrote:

> Again, upstream and downstream.=C2=A0 There's a reason why some companies
> have upstream first policies: because it's less painful in the long
> run.=C2=A0 Android having decided to go ahead and add that patch is not m=
y
> problem, and I really really don't want to care.
>=20
> Having said all that, if there's a regression that someone reports
> for
> upstream flags (even on a vendor kernel), I'll just revert the patch
> right away.

The patch in question has broken all users that use the higher flags
and that don't use your version of libfuse, not just Android. You're
filtering them out now when you didn't at the time that those
('official) high flags were added. There are a couple more high flags
than just the one that Android added.


Cheers,
Andre'

