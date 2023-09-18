Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30CE749D
	for <regressions@lists.linux.dev>; Mon, 18 Sep 2023 07:40:22 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68fba57030fso3565337b3a.3
        for <regressions@lists.linux.dev>; Mon, 18 Sep 2023 00:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695022822; x=1695627622; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jYE1PmwGI48qu45rnC2t2CT34fWKqdW5IxOG5V0vDZU=;
        b=PCsHhyOXzRWeTp4lT+e8omlY23gMgQMqQtmEMt9SUwRJ0+pYCh6RKEQSN6f1+hFNb+
         e7cvtPVPKJf0XwY7h/g6q2T24RpVaRC6C0dAAnejPybCc9onrmywcXK5Spp/imMrwBeK
         u1q+gj8Z5FKjk0LN0rbVL8hZ6Ds9Rs3ghz2jCFxGuoQZWyjPfbv3skIhgEpGNalUz59A
         RARyCzZaxcL7zrdDGWM/EjuZz7f7hBxhw46wPazvogIdXiZaym+9bJ72gQj1q58o5AoO
         D9lxig/0DFYebKwsNfOVI6HMMLq1jYEg2GuzvA0j5pyPVLel+eI7A3anJC4SVXZmw2+l
         wlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695022822; x=1695627622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYE1PmwGI48qu45rnC2t2CT34fWKqdW5IxOG5V0vDZU=;
        b=OzD9cvAK5unwC81jekf2e0FoqjlSUETSGRumfz56SR29+C+4yXGJHFMDc6Eri4Uzc2
         3QnMo0BDRNEtVG8p34Kysl5Y+HmYhjpHNsH5zOeOoGmYKiooXrQVfJxFPuEnabrOvGHe
         UZxgcsrHj4oL85P2T8v0oKRsbXBIh63apTUbPwKsT1YtLDBVk2klzSk7jy4Fd6SkwwQx
         CVia1QiNEQdVl+BfHb0bdyg/Ts5t8x+sYireTOhtPO0l/g22+qJ0q8rdn9VUWRO+jzff
         dAnku2Qbg3aLDC5D372Z/hkKj6meB8JV+TqDioCoe4hHs2bD/nEx/14bZedCHkoG0vZZ
         hpVg==
X-Gm-Message-State: AOJu0YxA8kwCGOgKQqqCcsKzZqx5IUS59hVz3O01x2ZXPCJP+9+J5HU+
	fHFmPenHxvYOCzXKKzszIvw=
X-Google-Smtp-Source: AGHT+IFBY9iVIRBuVg6dN+6n28kVZBaQ3QpU3pvyd80I1f86lsgh4AzZzEITsYThn6COBiwc+ysWdg==
X-Received: by 2002:a05:6a21:3e0b:b0:156:e1ce:d4a1 with SMTP id bk11-20020a056a213e0b00b00156e1ced4a1mr6476863pzc.9.1695022821893;
        Mon, 18 Sep 2023 00:40:21 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id k7-20020aa792c7000000b0068be3489b0dsm6827221pfa.172.2023.09.18.00.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 00:40:21 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 941E480D9E27; Mon, 18 Sep 2023 14:40:18 +0700 (WIB)
Date: Mon, 18 Sep 2023 14:40:18 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jaak Ristioja <jaak@ristioja.ee>, dri-devel@lists.freedesktop.org
Cc: Huacai Chen <chenhuacai@kernel.org>, javierm@redhat.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad
 L570
Message-ID: <ZQf-4r1K1Dx_LQ5t@debian.me>
References: <7c50e051-eba2-09fc-da9f-023d592de457@ristioja.ee>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t9fjxRqYgtt2EzW7"
Content-Disposition: inline
In-Reply-To: <7c50e051-eba2-09fc-da9f-023d592de457@ristioja.ee>


--t9fjxRqYgtt2EzW7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 03:02:26PM +0300, Jaak Ristioja wrote:
> Hello,
>=20
> Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (Integrated Intel HD
> Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U) results in a blank scr=
een
> after boot until the display manager starts... if it does start at all.
> Using the nomodeset kernel parameter seems to be a workaround.
>=20
> I've bisected this to commit 60aebc9559492cea6a9625f514a8041717e3a2e4
> ("drivers/firmware: Move sysfb_init() from device_initcall to
> subsys_initcall_sync").
>=20

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: 60aebc9559492c

--=20
An old man doll... just what I always wanted! - Clara

--t9fjxRqYgtt2EzW7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQf+4QAKCRD2uYlJVVFO
o1LjAQCyinSeRmWO5M3jxuESwFV9c/eJAgHm+YsA35cHfR8mBwEAsDAhYG4Bnm8h
/2YyuCaC0lYoTEIdf+2AEN/OKWxH9QA=
=hSUf
-----END PGP SIGNATURE-----

--t9fjxRqYgtt2EzW7--
