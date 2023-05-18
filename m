Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCCA23C8A
	for <regressions@lists.linux.dev>; Thu, 18 May 2023 13:31:26 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-253570deb8dso925323a91.1
        for <regressions@lists.linux.dev>; Thu, 18 May 2023 06:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684416686; x=1687008686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=07jbkWZvVWjpNcKjxaXoMx/wlMgnDj/DjSx7DmqYFT8=;
        b=lzpDaJAXMALSOUcCHSZtsWI12iYitCMms76PC56TCFywRRfHP1N5L6XZE6NeF4PaMu
         nBUihCwtYHfjTDrzNznS/atSsJYSiHiGx4wL+yNWWsLr8P6BcW1vljTvxt8FuE4VMRw5
         eX18NtgpssDdkdsR5UPI9Fnv9Qcnp8ixsuU41+AzfWVt+GgDW8p4owawNuHv4GmVyZbG
         zlud1ijZwULP4ZxeFyRLk+gIKlTvqIkkFSDKDuVRVvfnDKL3nlTTTVoG3DFCDhTdTwFI
         LKDYWpOVsUQMrpM6rnwdBvK7JQdsUNQnJwZN2m/f50nj7xB0WZZyUTlaG1LLIA1ozF2H
         nRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684416686; x=1687008686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07jbkWZvVWjpNcKjxaXoMx/wlMgnDj/DjSx7DmqYFT8=;
        b=b0R3cHlKvSov7Pgn7e+4R755AEkoz1Ji92kXMLwaP5Ej3GWxcjrnSelKUDtlM1ZHVU
         7ioUKofANIZ8jS2UdnwHfUQi5OoFLpZY0mhWg0mH5nyvM0nSH64Ya2dSEzd7TpCnjZYr
         wMqZB9m0pcGkAK3btnZDqgnVgGUTX/V+m8OHdZm2Ha+YA/e2v2fOuBowbt8kZ0K0zSfb
         YcRCSMRcg/C76f654RuaIDMCykBB6pXg0rlskKCbF3aiw+mKVPP5qKcg03zJv8+AHmrV
         nijFArSfTA+dwOrEM3jrYo2+pBhxZLSDzps4J0oAGodrpcxHvDLWHOWoQfNRZ6t8D1ue
         lbpg==
X-Gm-Message-State: AC+VfDzwB39cy77qjK8FSsPPD7rvK3SGCVfa2uCFdVLnpUoF0DqF30zW
	IvcXdI8lPLxmk2fLiLJNXdD5rC2bxaA=
X-Google-Smtp-Source: ACHHUZ6Rg39C5s3A5szjjXrbwt9+lrhInJP56naXUPdn570zbNmxeD3burzDiugaUyMp+7pNS5at4Q==
X-Received: by 2002:a17:90a:ba8a:b0:252:b14a:55c2 with SMTP id t10-20020a17090aba8a00b00252b14a55c2mr2560424pjr.9.1684416686127;
        Thu, 18 May 2023 06:31:26 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-78.three.co.id. [180.214.233.78])
        by smtp.gmail.com with ESMTPSA id u11-20020a63f64b000000b00513cc8c9597sm1213765pgj.10.2023.05.18.06.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 06:31:25 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 0AED1105431; Thu, 18 May 2023 20:31:21 +0700 (WIB)
Date: Thu, 18 May 2023 20:31:21 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: =?utf-8?B?w4lyaWM=?= Brunet <eric.brunet@ens.fr>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
	jouni.hogander@intel.com, jani.nikula@intel.com,
	gregkh@linuxfoundation.org
Subject: Re: Regression on drm/i915, with bisected commit
Message-ID: <ZGYoqbhkxkCg9m7d@debian.me>
References: <3236901.44csPzL39Z@skaro>
 <ZGU56n66OAe0DqN3@intel.com>
 <5681706.DvuYhMxLoT@skaro>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EoPTFpm/moMAQdNP"
Content-Disposition: inline
In-Reply-To: <5681706.DvuYhMxLoT@skaro>


--EoPTFpm/moMAQdNP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 10:14:30AM +0200, =C3=89ric Brunet wrote:
> Le mercredi 17 mai 2023, 22:32:42 CEST Ville Syrj=C3=A4l=C3=A4 a =C3=A9cr=
it :
> > On Tue, May 16, 2023 at 03:04:53PM +0200, =C3=89ric Brunet wrote:
> > > Hello all,
> > >=20
> > > I have a HP Elite x360 1049 G9 2-in-1 notebook running fedora 38 with=
 an
> > > Adler Lake intel video card.
> > >=20
> > > After upgrading to kernel 6.2.13 (as packaged by fedora), I started s=
eeing
> > > severe video glitches made of random pixels in a vertical band occupy=
ing
> > > about 20% of my screen, on the right. The glitches would happen both =
with
> > > X.org and wayland.
> >=20
> > Please file a bug at https://gitlab.freedesktop.org/drm/intel/issues/new
> > boot with "log_buf_len=3D4M drm.debug=3D0xe" passed to kernel cmdline, =
and
> > attach the resulting dmesg to the bug.
>=20
> Thank you for your answer, I have just opened the issue as requested.
>=20
> https://gitlab.freedesktop.org/drm/intel/-/issues/8480
>=20

Thanks for the ticket link. Now telling regzbot (and updating the
culprit since you also mention the mainline commit that I assume to
be the culprit [please verify if it is indeed the case]):

#regzbot introduced: e1c71f8f918047
#regzbot link: https://gitlab.freedesktop.org/drm/intel/-/issues/8480

--=20
An old man doll... just what I always wanted! - Clara

--EoPTFpm/moMAQdNP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZGYopAAKCRD2uYlJVVFO
o8G8APwJFW+7qatzqJqrpNTFfK9bpbBnUHaHoPoNI1Tyx0MpYwEAlnopo9cQ2Zxe
70ZgR4r8JbUANNEcYs8gkToi/+ClAQs=
=J/5J
-----END PGP SIGNATURE-----

--EoPTFpm/moMAQdNP--
