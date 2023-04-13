Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6445662F
	for <regressions@lists.linux.dev>; Thu, 13 Apr 2023 04:16:19 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id ke16so13680711plb.6
        for <regressions@lists.linux.dev>; Wed, 12 Apr 2023 21:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681359379; x=1683951379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IVdcMCSPC9IdbB1xsDX6nGCc2/KXvPpMpeLbbNIoZdo=;
        b=ixhStj/lXF2Wb6en9bP6aQn57tdm/ux1IsYvjHemNcm/wBViqRJNPuEFXppLu0E/t2
         uleZxtEXXiVc6dyJrKWpl7HpfdmkOHFAgl1OxRTbZ9Q+uEQ3+rVyduNe/a/fuE60UE+u
         uZ/5TJDBkch0aS5/uXkpo8XWmMdTS+k8mFJbyHuzacE+aTvFivhdrHEBeACfuvbLCdcI
         FI1AtMgnxjrvfF4uBfUxdHZ1TGJXpM+5KJo/9hjgwHT9FlG40e2G5kZ8sK/AhU17YP4/
         adlzlQoYHHsl6QaDPE+7Q4IShVTBtt0Zrr+XFGq5yuPWPKSNP1ctOj5El1Bglxox+aGA
         j3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681359379; x=1683951379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVdcMCSPC9IdbB1xsDX6nGCc2/KXvPpMpeLbbNIoZdo=;
        b=Uql0WRd0MKOKSP+ciQ+0XaMksW1ymSSScq0QSB2pf96V9By2JBZxf/6Q5I1XXwMcBb
         C02fvVFksIG4Zz+6GFS4jKHtjnDS2DDRj2Zbd8jnEp1rrSZ7N14qRaSvqQmmSU+kJTAF
         O6V9BYU5YiqZ4oAcwjRaUYyercsJLaK0Sc3q+sYGN8iqbS1UZbv6xP0KPOUZZXoUCruX
         aqsTbDVi2jKfQbS73808Q7Xx8SDUoJxvDmJ0x5J0Nu6iX9CW9XvYEoqNoDoqOgQ9icEb
         viVLtQNoQdGVTCBhqBvdsJFBdSfL25ZotE+iWo6pBxB0LaSmxQu8dSw8ZJUzY4GCADfZ
         EpQg==
X-Gm-Message-State: AAQBX9etQEdW6ifQyacP+Vz/8YuJnyA4To9Z/ohw++aiTqX7qbZG2aT8
	X3HcIgmUJedAr6MvhvtwICU=
X-Google-Smtp-Source: AKy350ZxVVjpIXli7JXsRewIfhWAjg80eCXA9xHAm4QsrsGgjV6RpllcsCD234fzfx934OmJduhV0g==
X-Received: by 2002:a05:6a20:c110:b0:d9:33a3:e7c5 with SMTP id bh16-20020a056a20c11000b000d933a3e7c5mr781664pzb.35.1681359378790;
        Wed, 12 Apr 2023 21:16:18 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-66.three.co.id. [180.214.233.66])
        by smtp.gmail.com with ESMTPSA id x47-20020a056a000bef00b0063418ea5032sm284183pfu.1.2023.04.12.21.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 21:16:18 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 70224106755; Thu, 13 Apr 2023 11:16:15 +0700 (WIB)
Date: Thu, 13 Apr 2023 11:16:15 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Intel GFX Mailing List <intel-gfx@lists.freedesktop.org>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
	Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
	Manasi Navare <manasi.d.navare@intel.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux regression tracking <regressions@leemhuis.info>
Subject: Re: Linux 6.2.1 hits a display driver bug (list_del corruption,
 ffff88811b4af298->next is NULL)
Message-ID: <ZDeCD5HuM7KJt4fu@debian.me>
References: <6feae796-db3f-1135-a607-cfefb0259788@gnuweeb.org>
 <ZAGqet3U8AMm4Uf1@debian.me>
 <ZAOTU5CRwdEC1lGH@biznet-home.integral.gnuweeb.org>
 <87v8jetaik.fsf@intel.com>
 <ZAXT1B1GTlmA78Ld@biznet-home.integral.gnuweeb.org>
 <ZDYw0vVg7Y1oExJL@debian.me>
 <ZDaPNx7WSKeMqgmj@biznet-home.integral.gnuweeb.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bhJLHQiEgQvFLfqm"
Content-Disposition: inline
In-Reply-To: <ZDaPNx7WSKeMqgmj@biznet-home.integral.gnuweeb.org>


--bhJLHQiEgQvFLfqm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2023 at 06:00:07PM +0700, Ammar Faizi wrote:
> On Wed, Apr 12, 2023 at 11:17:22AM +0700, Bagas Sanjaya wrote:
> > From gitlab issue above, I don't see any progress on bisection attempt.
> > Ammar, have you successfully boot Ubuntu 20.04 with v5.10 kernel and
> > test there?
>=20
> I am still using Ubuntu 22.04. Haven't tried 20.04. I'll arrange time
> for it this week.
>=20
> > Anyway, I'm adding this to regzbot (with tentative commit range):
> >=20
> > #regzbot introduced: v5.10..v5.15.103
> > #regzbot title: Linux 6.2.1 hits a display driver bug (list_del corrupt=
ion, ffff88811b4af298->next is NULL)
> > #regzbot link: https://gitlab.freedesktop.org/drm/intel/-/issues/8274
> >=20
> > (Also Cc: Thorsten)
>=20
> Not sure why you marked it as regression. I haven't even found the last
> good commit. It's possible that it's always broken since the beginning.
>=20

OK, marking this as inconclusive for now:

#regzbot inconclusive: Still on process on finding last known good commit

Thanks!

--=20
An old man doll... just what I always wanted! - Clara

--bhJLHQiEgQvFLfqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZDeCDwAKCRD2uYlJVVFO
oyDQAQCpRHiwWX5dI6Er50EYf4tUXS1tL3eFJnh7YP059N3xcgD/WqgxlPTZGAiH
sI/ZeNdqtFgb4R4FLXyRHG1gh18ugQA=
=US0W
-----END PGP SIGNATURE-----

--bhJLHQiEgQvFLfqm--
