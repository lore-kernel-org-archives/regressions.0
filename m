Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670DD6FA6
	for <regressions@lists.linux.dev>; Thu,  2 Nov 2023 08:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4JwprP/"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5b980391d7cso468890a12.0
        for <regressions@lists.linux.dev>; Thu, 02 Nov 2023 01:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698912314; x=1699517114; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qm047SCnALoyYPhnGrJPWTE0UoF+m8QEisH8xFHbuwA=;
        b=k4JwprP//5K8ZAAnLYLAROQrIBIqHVXJqNrE2/3Cg9Yws8vQFGhG1qVZMYkZ3Wti4I
         CZpcdoH1XIHJdg2mND+yqQXe7xTqTj9iXTYCRVR4FoTaB1oZGxrYU8RjSyFfMzhryA9x
         n9mUf89R2YGmEdmPCMcQ1OxZDIouPRAu0dKxTonLCKzlxZ1TIG4Vr70XOS8gbJatswl9
         zbb9I7dZG44RCYt7X84d9FUikVFktGRVZMG/7HyuedWSgp3EW5i5oZ4As9Lpl0Goysm9
         y+oEvUeUOSklhAxR54wNRzq5jBBcGV52HgncsLjPMqjnTMl4UWRMGZtDp7L/TZdUrzw1
         N4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698912314; x=1699517114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qm047SCnALoyYPhnGrJPWTE0UoF+m8QEisH8xFHbuwA=;
        b=k/j849rhwLLF3b2sXDuCN+uHKjGIjqlQRFOX0JDfDs+lNlT8JGvboveuTGuT4qsDbJ
         iJcXMgUsCdXoDFoDTFu5TtKt6u5ZVBZ9Y4mRZH9sHdptjGQtr5ZEnjB45wlXGkYBEmTl
         7advQbrTanxoSGogVOf0G7pJ62qwaCiFfVBtjolJldEzhRZbe7IrBossqrYyszyJI1VI
         d6Qm9gZaTkmfMs59lyBXvRTTLAyiTI3humuBEQee+BXm7il5bW7qLfEVAtKJaoWU/xjf
         j5ccHCtaxgqot2T8VtoHjlKvYCxsht92UBWv3rktv/MSjlK9ZNQFSR+hhh4s3Dc1/zwn
         2CfA==
X-Gm-Message-State: AOJu0YyHpIemmfmLeBeff77RWIEsK3ldXDReI21h+EgY/6QkqvQeryVx
	x2hBxLcpe3umQuxZ4hIwNjM=
X-Google-Smtp-Source: AGHT+IFIL6VIw66cK4zpLiHDgDf8OIP34pUNG8oTkJtXAdQZP0h9DhMj83aCFzRYsJSB7uHCcpIhXA==
X-Received: by 2002:a17:902:f682:b0:1cc:7d96:3fe7 with SMTP id l2-20020a170902f68200b001cc7d963fe7mr4181116plg.28.1698912314313;
        Thu, 02 Nov 2023 01:05:14 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id g10-20020a170902740a00b001c9bc811d59sm2484716pll.307.2023.11.02.01.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 01:05:13 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 32F169201A25; Thu,  2 Nov 2023 15:05:09 +0700 (WIB)
Date: Thu, 2 Nov 2023 15:05:08 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Huang Rui <ray.huang@amd.com>, Meng Li <li.meng@amd.com>,
	Perry Yuan <Perry.Yuan@amd.com>, Mateusz Guzik <mjguzik@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Michele Della Guardia <micheledellaguardia@yahoo.it>,
	Linux Power Management <linux-pm@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: Fwd: Abnormal battery drain with kernel 6.5 (Ryzen 5500u)
Message-ID: <ZUNYNEnGC8cm6ALH@debian.me>
References: <bede02c1-ef90-8e30-aa8b-e6fae49a8ccf@gmail.com>
 <ZPql6tqBCnXJh64J@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bFrQyoCjDpyscnAV"
Content-Disposition: inline
In-Reply-To: <ZPql6tqBCnXJh64J@amd.com>


--bFrQyoCjDpyscnAV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 08, 2023 at 12:41:14PM +0800, Huang Rui wrote:
> On Fri, Sep 01, 2023 at 05:42:22PM +0800, Bagas Sanjaya wrote:
> > Hi,
> >=20
> > I notice a regression report on Bugzilla [1] that have been already han=
dled
> > there. Quoting from it:
> >=20
> > > After switching from 6.4.x kernel to 6.5 I experienced an abnormal ba=
ttery drain since my laptop is actually never idle.
> > > I accepted default CPUfreq to schedutil and AMD Processor P-State mod=
e is 3 (active).=20
> > >=20
> > > I expected a different behaviour, but am I missing something?
> > > In my boot configuration I had "amd_pstate.shared_mem=3D1" and tried =
to remove this switch, but did not affect my power consuption.
> > >=20
> > > Is there something changed from 6.4.x to 6.5 that requires a differen=
t configuration to get an optimal power consumption?
> > >=20
> > > Thanks a lot for your attention
> >=20
> > See Bugzilla for the full thread.
> >=20
> > Anyway, I'm adding it to regzbot:
> >=20
> > #regzbot introduced: v6.4..v6.5 https://bugzilla.kernel.org/show_bug.cg=
i?id=3D217853
> >=20
>=20
> + Meng Li/Perry,
>=20
> May we know which CPU type are you using? Try "lscpu"?
>=20

Sorry for the replying just now.

The reporter (on Bugzilla) had bisected to commit c8afaa1b0f8bc9 ("locking:
remove spin_lock_prefetch"). Telling regzbot:

#regzbot introduced: c8afaa1b0f8bc9
#regzbot title: spin_lock_prefetch() removal causes abnormal battery drain =
on Ryzen 5500u

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--bFrQyoCjDpyscnAV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZUNYLwAKCRD2uYlJVVFO
owZYAQDsb6Cd0wndv9wWOxPcE7C6GSlUhC+p6Vc2i0w7Ge2crwD9FjZVdMAnD7jZ
aptnxPSv+I+4kMDvo/d32CBDN4MTXww=
=xS7j
-----END PGP SIGNATURE-----

--bFrQyoCjDpyscnAV--
