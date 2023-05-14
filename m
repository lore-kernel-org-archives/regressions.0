Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA58F185D
	for <regressions@lists.linux.dev>; Sun, 14 May 2023 05:41:12 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1aad5245571so79117455ad.1
        for <regressions@lists.linux.dev>; Sat, 13 May 2023 22:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684042872; x=1686634872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IDGVt0VPDcGTdRBoTV540d8tlzGaz7p6PdWLogPPAyo=;
        b=gFBsMNifmQp9JIa8Klq4CpGhCZYHz33bVpYypgMz+jyX/f6eO6dM9O3H3Ur3VacGcp
         dWYRLuNmHa36kZaf3UShvgMIbWsBLP818yXwPZ/f6xpjmOIeaNZ69G+5jNOO4z0WtX44
         i70bEgs1X2/XZzWbhbucKBBSZAkisGkxlwlJH8/Dtj1ovZRsL1UWjgWV+KEdOweAaEgS
         mR//WznLNMyKED41Vx9gtlW2xr6hkDXYIAZgt12rO5X+yQWBG6j2/kQX49UBQ6tE7zp9
         6acbnNfAeHVnsh+tW3jgkLQzEymALYUMIk2BW8khmsIANq1mMLJl1tgdZE1apU5rYu4c
         F+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684042872; x=1686634872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDGVt0VPDcGTdRBoTV540d8tlzGaz7p6PdWLogPPAyo=;
        b=U3M4KUK1myl4iu7bIJrZgXts4f9XfX4L0xE6zKb+4AiaqGXX1rlZP9owsmvfkgxT9p
         eW78uSwiPQYNbbbWSFRHT2Yi53FCz9BDNRVFj4qH9l2Bf38v8cJY2BzK0glAPsnJwinM
         +NouXNZJ1Z2oEmMdBRISvu86zGVMcDtreo3HWRl5UbsAR6zmkbV3C3GODHzRok37HSF4
         tSYEs/F5Tg39HZqh5cKXIEr+K9aShQYDGmZToCPiZ5RT8R1zVSlXrF2oWh+EvVQtmFv4
         tfZDs4pnQaTrx574fI+V3Qd4xxZk/M6S1qkFMD0kVa9DE1p0V9v+Oa4U7Rfol3nh//uq
         UROg==
X-Gm-Message-State: AC+VfDyqbmjy0pYa+6II6JIiltB5e/RQ16iWRDzG7ECsee/6TN/zXq3m
	xI4eXqxNhVImuQdN/aZYWh0=
X-Google-Smtp-Source: ACHHUZ5CGCegi81Qify9CvlVpbTxzT8VAb2w5CvKNm/+u1sp7WkfS+0YAZwNxICkTliDGj1W78QhLQ==
X-Received: by 2002:a17:903:54a:b0:1a8:18ae:1b36 with SMTP id jo10-20020a170903054a00b001a818ae1b36mr27045464plb.18.1684042872000;
        Sat, 13 May 2023 22:41:12 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-71.three.co.id. [180.214.232.71])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902a40a00b001acae9734c0sm4706845plq.266.2023.05.13.22.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 22:41:11 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 483961068F3; Sun, 14 May 2023 12:41:06 +0700 (WIB)
Date: Sun, 14 May 2023 12:41:05 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Joseph C. Sible" <josephcsible@gmail.com>, regressions@lists.linux.dev
Cc: kailang@realtek.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
Message-ID: <ZGB0cVVI7OgaJU6t@debian.me>
References: <bug-217440-225600@https.bugzilla.kernel.org/>
 <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8XX5bEJKjbAtICQ4"
Content-Disposition: inline
In-Reply-To: <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>


--8XX5bEJKjbAtICQ4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 13, 2023 at 03:52:53PM -0400, Joseph C. Sible wrote:
> On an HP 15z-fc000 laptop that uses Realtek ALC236 for sound, once the sy=
stem
> is warm booted ("reboot" from within Linux), sound stops working complete=
ly and
> the device doesn't even show up anymore. Once this happens, the only way =
to get
> it to come back is to cold boot ("poweroff" from within Linux, wait for i=
t to
> turn completely off, and turn it back on with the physical power button).=
 In
> particular, once you boot from a "bad" kernel, no number of warm boots wi=
th
> "good" kernels will ever bring sound back.

Can you attach dmesg messages so that we can know what exactly the error
is?

>=20
> I bisected this to commit 5aec989, which first appeared in 5.15-rc6. In
> addition, I confirmed by doing a custom build of 6.3.2 with reverts of bo=
th
> f30741c (just to avoid a conflict) and 5aec989, which works correctly for=
 me.

Note: when you refer commits, write at least 12 first characters of the
commit's hash. You may want to set `core.abbrev=3D12` in your
`~/.gitconfig`. Also the canonical commit reference is
`--pretty=3Dformat:%h (\"%s\")`.

And remember: when replying, don't top-post; reply inline with
appropriate context instead.

Anyway, I'm fixing up the title:

#regzbot title: Realtek ALC236 unrecognized on reboot

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--8XX5bEJKjbAtICQ4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZGB0bAAKCRD2uYlJVVFO
o1hEAQDXt2gGeCFUztxgePc09xdG10X7dIku2mCPwiSgw15SZAEAgMPt04I1v1c1
4gDr+jnM3a3nNlxhPoHiPrNH7KIcGwA=
=ACa/
-----END PGP SIGNATURE-----

--8XX5bEJKjbAtICQ4--
