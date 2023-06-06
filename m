Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474A1361
	for <regressions@lists.linux.dev>; Tue,  6 Jun 2023 02:36:45 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-256a41d3e81so4769650a91.1
        for <regressions@lists.linux.dev>; Mon, 05 Jun 2023 19:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686019005; x=1688611005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=forzF7x9ap1s3sdBeXdIPn+wCjalJOzafD/pj6NI2Fw=;
        b=kOMx0UElNi84z3O0qQZ2mHwe8w7eb7/owU5M5V5n0lu66ExmjY8u66ku+lSaux59Mq
         wXP9OxaAFfdD5tPl544z6U+7FL+nWwHmE0jdYSI9JngVF3P4fqCGrJB//zE43cfLAhNt
         e9WQJkxjuw+ip5g54xJLKNdzi7TtjD7zOu2p+73t7JcphCUTxB3rmRk9BNVj1KGcTnvy
         60tYRexKPckhPU0gWkk91jw9yOQpQkDG3ItR+mvEdCcBdiiQLle4BLW5vKApXl6Qd0U1
         gdruDyKsVvgNRPQiDsZoN8x/WXz/gpdLMaYtQMgvzMUkvKXmr1986FbOV02ysJmElWzz
         skJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686019005; x=1688611005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=forzF7x9ap1s3sdBeXdIPn+wCjalJOzafD/pj6NI2Fw=;
        b=fV2D3+T0bQQPug2+ez6et88vrcY+NN31O+aJMky6XS1P5igQb8Ley7GBYhn1TzxBZO
         DwhB4WDYfXOw3epJPx7trx3e+KcFOCEMbgPAgNQzzUgDtY0QffkCRAhWpEI94YB0rNA5
         JSMxd3nAUsw8rHbny9n7MxoTl/NlL5LL9NQjQTA4OhDX5TgPry0PKkKdWkm9Jk1AWA3H
         4dNSruQaMn+0xrvhoIlWAWltjY5KfQwqovxHmHrTu05oYdXOv29e1G4rv4PkfQ/0v/GK
         9Vcu7oFtrOjJl9GsvRZsUI3rnecHnsl+ynDgG05mC852eOoxYf1zv7sp99gGA7veCmbA
         05cQ==
X-Gm-Message-State: AC+VfDzh1WOoBa65OtP2VIvpYHlubPm6bqJ8TNGdupKwfJGeyJ4kW6Xq
	45UO+/PulgXJ0sUhIl4KllU=
X-Google-Smtp-Source: ACHHUZ4SZCnx+FzAyFclv7fZhrBmmdhun7a2MFnH6JMBAalLr543sknoipxj2SMTfTz/A8xx6IW17A==
X-Received: by 2002:a17:90b:788:b0:256:544a:74c9 with SMTP id l8-20020a17090b078800b00256544a74c9mr535481pjz.25.1686019005262;
        Mon, 05 Jun 2023 19:36:45 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-36.three.co.id. [116.206.28.36])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a34c600b00256471db12bsm6893567pjf.8.2023.06.05.19.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 19:36:44 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 101AB1069FD; Tue,  6 Jun 2023 09:36:40 +0700 (WIB)
Date: Tue, 6 Jun 2023 09:36:40 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Malte Starostik <malte@starostik.de>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: basavaraj.natikar@amd.com, linux-input@vger.kernel.org,
	linux@hexchain.org, regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: amd_sfh driver causes kernel oops during boot
Message-ID: <ZH6buB8TcMd5aT_1@debian.me>
References: <ZG3ipauL9FTnQJiC@debian.me>
 <3250319.ancTxkQ2z5@zen>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CUrTcfzVaW+dVdl5"
Content-Disposition: inline
In-Reply-To: <3250319.ancTxkQ2z5@zen>


--CUrTcfzVaW+dVdl5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2023 at 01:24:25PM +0200, Malte Starostik wrote:
> Hello,
>=20
> chiming in here as I'm experiencing what looks like the exact same issue,=
 also=20
> on a Lenovo Z13 notebook, also on Arch:
> Oops during startup in task udev-worker followed by udev-worker blocking =
all=20
> attempts to suspend or cleanly shutdown/reboot the machine - in fact I fi=
rst=20
> noticed because the machine surprised with repeatedly running out of batt=
ery=20
> after it had supposedly been in standby but couldn't. Only then I noticed=
 the=20
> error on boot.
>=20
> bisect result:
> 904e28c6de083fa4834cdbd0026470ddc30676fc is the first bad commit
> commit 904e28c6de083fa4834cdbd0026470ddc30676fc
> Merge: a738688177dc 2f7f4efb9411
> Author: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Date:   Wed Feb 22 10:44:31 2023 +0100
>=20
>     Merge branch 'for-6.3/hid-bpf' into for-linus

Hmm, seems like bad bisect (bisected to HID-BPF which IMO isn't related
to amd_sfh). Can you repeat the bisection?

Anyway, tl;dr:

> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>=20
> A: No.
> Q: Should I include quotations after my reply?
>=20
> http://daringfireball.net/2007/07/on_top

And telling regzbot:

#regzbot introduced: 904e28c6de083f
#regzbot title: HID-BPF feature causes amd_sfh kernel oops during boot and =
suspend/reboot

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--CUrTcfzVaW+dVdl5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZH6bswAKCRD2uYlJVVFO
o2xDAP9An3ggMkqbJ3oROKgX0EvakxIZ71rfdE5jiwCJL0qbkQD/UOdP+fyrj4hL
jjftmyl+chnthfoPbYDIWG8939UFqgc=
=3GF2
-----END PGP SIGNATURE-----

--CUrTcfzVaW+dVdl5--
