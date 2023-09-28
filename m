Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A131A34CC3
	for <regressions@lists.linux.dev>; Thu, 28 Sep 2023 11:01:16 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-277564f049dso6205306a91.1
        for <regressions@lists.linux.dev>; Thu, 28 Sep 2023 04:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695898876; x=1696503676; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pYKgXq+vaQtmifoFDQlFohY9tqK1T0ZxxWc8ChkHqI8=;
        b=MjQT4oW4+3KvINIyaOxae/idnhC+7C41FRZfDgRRoqLt6NOHZVT+YsN/mGXHzjDcCn
         K/mEn/8mRk8DX4XUbPwXg6Swv+hB2zEfnSpekIBKaPE5UUdz5ASLN40AxSZtldvjXWZ6
         ePisKcsYMzMdKYvFHiBj4fa2LUHATePxUgIRHpBEXMZ5HaKuCsrVmp5TnU/qMKbXcqtV
         o9mx7gG2c5lQawRWXwORGL1eLvDNtj42WVGaYRLKEX7EAROB8RLXRhyOIBruoEQHxyBE
         RxdpCQe7jyW3DDwo9S/brQ/6Tpu3k+FNn8qvClwLkLU8SqZLecYSxifXG6XVVPUhlftm
         Yelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695898876; x=1696503676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYKgXq+vaQtmifoFDQlFohY9tqK1T0ZxxWc8ChkHqI8=;
        b=SxOOChMdzvDsdHAsnNZXufJhE+ZjfhUAq+WR7Q3yMFCb1ZChydZyAwaLo6kSEPPvL9
         zvaqxoJsBGF0ZnPVGQoVaITidJAgBfeiaqfK4CIiNmYzrAKWp7ved28McuRTTrCtKfit
         S53X7lqlEQWylQQd7I3+N2p4xuHt2FdUlUKmViebGaETvdMfedbCfIec49uWIWydt/xE
         ZSbICyxydqhiUpg4KgXDhGB2RF6xfoUkLCTDOc1hHMR9mo05cxbK4bD2EQMwAbaP3fv1
         +FEFTXX+qksaYHyKe1iR78awihN+SgixIw+pczY5+TBYU/r6Jc8GOt2+zfdEOAhq+HCm
         J2EQ==
X-Gm-Message-State: AOJu0YyJAda32viXApdXfiU/c3e/XnKF8IUPbNmbg3ufW9NpwmFMmjPv
	zbjIN30GuA12ZVjq/PkUSbs=
X-Google-Smtp-Source: AGHT+IGKmFLibatR4FFYGrusi8XPJ90Q0s0r/+1WccPyk/ovA3NHe2CD/0pMaNvfcLvXft2FoVz+Yw==
X-Received: by 2002:a17:90a:e2c9:b0:271:9237:a07f with SMTP id fr9-20020a17090ae2c900b002719237a07fmr771526pjb.32.1695898875805;
        Thu, 28 Sep 2023 04:01:15 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id jg19-20020a17090326d300b001b3bf8001a9sm10961499plb.48.2023.09.28.04.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:01:15 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 3074E8222029; Thu, 28 Sep 2023 18:01:11 +0700 (WIB)
Date: Thu, 28 Sep 2023 18:01:11 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Victor Fries985 <freeze0985@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, Daniel Micay <danielmicay@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: kmalloc memory leak over time.
Message-ID: <ZRVc9tjrED_2mWe0@debian.me>
References: <4f01f302-9d59-4146-b7ff-0478c4bd94b1@gmail.com>
 <CAAU1TwEFpEMkWMN3kJj-uOJtEK1X0kvBX7NjQ1djduZaP+AR-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GeqDmjNMxRAUW/Iq"
Content-Disposition: inline
In-Reply-To: <CAAU1TwEFpEMkWMN3kJj-uOJtEK1X0kvBX7NjQ1djduZaP+AR-g@mail.gmail.com>


--GeqDmjNMxRAUW/Iq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 03:09:05PM +0530, Victor Fries985 wrote:
> Hi, the regression started from 6.5.3, i failed to mention it in bugzilla.
>=20
> Original I made ticket on linux-zen, thinking it was their problem. But it
> turned out to be problem from normal linux itself.
>=20

Please don't top-post; reply inline with appropriate context instead. This
allows readers to easily follow conversation flow.

Anyway, does v6.5 mainline tag (not the stable tree) also have this
regression?

--=20
An old man doll... just what I always wanted! - Clara

--GeqDmjNMxRAUW/Iq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZRVc9gAKCRD2uYlJVVFO
o0Y+AP9DW2gKFs6akR5UINM1DXr27W2z/r7K8GlADHMEfUofAAD+I6eEJaTRo247
Qyz7yHo5jba27NQN5/U3+OMLhOI8XAE=
=pRi+
-----END PGP SIGNATURE-----

--GeqDmjNMxRAUW/Iq--
