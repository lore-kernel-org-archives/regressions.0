Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B74101E8
	for <regressions@lists.linux.dev>; Sun, 19 Nov 2023 13:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8GCzoOb"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1cc2fc281cdso24223215ad.0
        for <regressions@lists.linux.dev>; Sun, 19 Nov 2023 05:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700400279; x=1701005079; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+BRkKo1UDNyPwLET0kko4yMFYg9wtyizgbwaduapHpU=;
        b=e8GCzoObW1P49hzODl/yMWDPFa5TK7VhRy12Wf3PlA9Ko3ZUdOIbkBhQF854HpAKqc
         eVzubbaftODRWucOGiBV9Cf+6epgSr3pIEXB8TmGk5T5F1qOvqOdpg7XjbNqseSjXOIP
         VlakjI4hgOE+G07u0eG0XyIhLyJHdnfarbwzS0U0TA5stI0YJN0ad7Ggeg2yu33APL3l
         rXYzwRUTF+hveGad6N1KcSQTiA8qGc4meILtrzJOoSHWn+OOn3psjWai2pFiSdRbl71x
         KWQG7Rrc/SuUdhqtcM+t/h3BC9aaIWlU8qqAQH5rKEematUcATLjvDin6idMh0RIyl5k
         Kpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700400279; x=1701005079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BRkKo1UDNyPwLET0kko4yMFYg9wtyizgbwaduapHpU=;
        b=tCuHY6RIj2wtWMl3Kcvv9Fbnw6Zlrw1H324veHYu4Yp8I0JtBXZCGZIFrhWwifBrtR
         wKt+na9dGsNdVeTImUKdFQAq+UJyD9Q+wxcFWGKqPBK9wmrnvIIObD6o5PTZtZ4VrM8e
         jpieFUXoDsdCqPqBS8xmcIGPE5GRjkpN2i9axypZSphxa5HmCcJICfBrFq9aNZHTgb9L
         5UHTDuh0W/PZCqUVmhMneOta7O9CMRYbxC6XUBpkmdaGyXwmew90OjK1ZZXYn4D93TfX
         ZelwWEhDa++i0JcfQYjAXnvw0JEumbg5ED4XJXiGq8NtZY/ir26eZBkxbE9aAq6J7EDp
         gIZg==
X-Gm-Message-State: AOJu0YxUzBMJhuQuaHkABxG2R6w5snQBOkeNuDmXMTxUV502mI+8ELwg
	l0+GaCDBZx7yG6ENVbQTH7Q=
X-Google-Smtp-Source: AGHT+IH+GUySa5SoJL2NpO5wI6AD3djXnM6Z0QKKx43P1ujsH4FL99jFgWVrO0t4Qct9yRRYsyuIag==
X-Received: by 2002:a17:902:70c8:b0:1cc:ef37:664a with SMTP id l8-20020a17090270c800b001ccef37664amr2876743plt.31.1700400279063;
        Sun, 19 Nov 2023 05:24:39 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id n4-20020a1709026a8400b001c5dea67c26sm4292539plk.233.2023.11.19.05.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 05:24:38 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 3FFFF101D92E3; Sun, 19 Nov 2023 20:24:35 +0700 (WIB)
Date: Sun, 19 Nov 2023 20:24:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Dave Airlie <airlied@gmail.com>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Phillip Susi <phill@thesusis.net>, Luben Tuikov <luben.tuikov@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux AMDGPU <amd-gfx@lists.freedesktop.org>
Subject: Re: Radeon regression in 6.6 kernel
Message-ID: <ZVoMklvIVClr_IIH@archie.me>
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A17eLGPWZDe3T98X"
Content-Disposition: inline
In-Reply-To: <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>


--A17eLGPWZDe3T98X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 19, 2023 at 04:47:01PM +1000, Dave Airlie wrote:
> >
> > On 12.11.23 01:46, Phillip Susi wrote:
> > > I had been testing some things on a post 6.6-rc5 kernel for a week or
> > > two and then when I pulled to a post 6.6 release kernel, I found that
> > > system suspend was broken.  It seems that the radeon driver failed to
> > > suspend, leaving the display dead, the wayland display server hung, a=
nd
> > > the system still running.  I have been trying to bisect it for the la=
st
> > > few days and have only been able to narrow it down to the following 3
> > > commits:
> > >
> > > There are only 'skip'ped commits left to test.
> > > The first bad commit could be any of:
> > > 56e449603f0ac580700621a356d35d5716a62ce5
> > > c07bf1636f0005f9eb7956404490672286ea59d3
> > > b70438004a14f4d0f9890b3297cd66248728546c
> > > We cannot bisect more!
> >
> > Hmm, not a single reply from the amdgpu folks. Wondering how we can
> > encourage them to look into this.
> >
> > Phillip, reporting issues by mail should still work, but you might have
> > more luck here, as that's where the amdgpu afaics prefer to track bugs:
> > https://gitlab.freedesktop.org/drm/amd/-/issues
> >
> > When you file an issue there, please mention it here.
> >
> > Furthermore it might help if you could verify if 6.7-rc1 (or rc2, which
> > comes out later today) or 6.6.2-rc1 improve things.
>=20
> It would also be good to test if reverting any of these is possible or no=
t.
>=20

Hi Dave,

AFAIK commit c07bf1636f0005 ("MAINTAINERS: Update the GPU Scheduler email")
doesn't seem to do with this regression as it doesn't change any amdgpu code
that may introduce the regression.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--A17eLGPWZDe3T98X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVoMjwAKCRD2uYlJVVFO
o2QaAQC6Z6Oet9ctoQNb/3mlbO7qKOQNiQjysEw57sJGJ5fCrgD9EY2N+PxFc4ZM
7JJJBQvw63BIl4tWd1RfxzxM4knFaQw=
=1kus
-----END PGP SIGNATURE-----

--A17eLGPWZDe3T98X--
