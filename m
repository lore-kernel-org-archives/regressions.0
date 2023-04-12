Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077B3160
	for <regressions@lists.linux.dev>; Wed, 12 Apr 2023 04:39:14 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id nh20-20020a17090b365400b0024496d637e1so15658515pjb.5
        for <regressions@lists.linux.dev>; Tue, 11 Apr 2023 21:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681274354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hg/XP5sKYDgnAPOMMCae6T1KeTCwQrPJq98nZ6iULMU=;
        b=aFqejViQnW3VS6d3xtobLnzm+JYEMqILzwVF8T2pQKDaHt39vCq2beZUcpq8ocTsaY
         klEXZ3RR35fpQ36oycNOjbrLZ9cI5W856Auok9XNux9GwJMHXexMc0QzFUqemwE50V5t
         1QmmzVvbq/3r8Qq/M5n461ptzZrh/e4JWfyWR5qmDBsfFZqldyBvBnAzFpO1USfnDCyy
         F7cw9Jr9NloTQ81GSGarq+mXWv+IgTp2zuGPQxQ/rpmO3Gb1152jvS4bTAwiFLJJaNpa
         tQggdXk29y1k4YJ7fYYZzOSnPzqGGISF42Cxo6bQ//ZyZTmJSEmJNOW+JBUe7LxwkKar
         nPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681274354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hg/XP5sKYDgnAPOMMCae6T1KeTCwQrPJq98nZ6iULMU=;
        b=RyLtdYkGVt1BWIh+2PsVEAr3EUPG9FM6qfcUlzEpJauqeGd1bJO3/Be2gUAQWNuS81
         g1XYq2R9eSonBtAo1F0hubeU2HcjiMii546LnIJiEmFwnqGYReFkSzpoSISxBty+AlOM
         hU38pA+qGPp1sPnHP2OhXOPPLPgmWvMYqbg+yTEysJNx322xCNQ+0UvUkbGHArJ59fy9
         mijy//9hRoKb16Y/VXvYwOIndHoYydarQ2iaBIzYmQNY1/wkkTmWjVInAwLXj2lC4/Y1
         urcG406y+p0Kx9ypesWysta8b/Y8++hWmBCKQL+7N01DpaL7rWBfU+xOe2o7RnytGdHj
         fXaA==
X-Gm-Message-State: AAQBX9dXywVCb6jT0XEC8CvTOTPfNtjudJza5zs54xUU2v34e93+r9XI
	32d6qAt8AP7D2MA9l43v348=
X-Google-Smtp-Source: AKy350YKR+vh60PQXq/Dk12P/OqVe8F9pyetN8YHZUTYKAUOYQnE379GIA0nBFfh0On7+sh7uZs56Q==
X-Received: by 2002:a05:6a20:a613:b0:e3:763d:91e3 with SMTP id bb19-20020a056a20a61300b000e3763d91e3mr4582155pzb.49.1681274354289;
        Tue, 11 Apr 2023 21:39:14 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-89.three.co.id. [180.214.233.89])
        by smtp.gmail.com with ESMTPSA id b8-20020aa78108000000b0062d7c0dc4f4sm10564407pfi.80.2023.04.11.21.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 21:39:13 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id CE12D1068E5; Wed, 12 Apr 2023 11:39:10 +0700 (WIB)
Date: Wed, 12 Apr 2023 11:39:10 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Youssef Aly <youssefaswad@gmail.com>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Daniel Dadap <ddadap@nvidia.com>, Hans de Goede <hdegoede@redhat.com>,
	Iris <pawel.js@protonmail.com>
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
Message-ID: <ZDY17mx7Q89Zdq9W@debian.me>
References: <Y8hZglIA/R3w62Qn@ddadap-lakeline.nvidia.com>
 <ZdaFcP7zsR4NSv_w-G0DfY5irnJ4Z06rkleLAcYtDYynFKzs7mzYvKBi0fNnd7RnT2sN49NvdafY09Sr45vbCLC4p_bfQ3bj_gHf9LomIyw=@protonmail.com>
 <CAKsK3AnyP-ZXBhRzUsCa0+AVbd3hGxqfvoeQEvpihGqFEzM61A@mail.gmail.com>
 <Y8hue7X63tHpDBZR@lenny>
 <cf34615b-a23c-4e3c-5180-f285be514f34@leemhuis.info>
 <CAKsK3AndZCBGaiJbQMMo9i9Gg5BHuLpvVY2tTAJWrbJ-RETZAQ@mail.gmail.com>
 <Y+/NzXqrgapfi/PY@ddadap-lakeline.nvidia.com>
 <FF98666D-72C9-47D5-85CE-9E679CABC01F@gmail.com>
 <d4b47946-0dbb-9a52-fde5-595c7a181d97@leemhuis.info>
 <CAKsK3AmdWGceDyotCA-5J6r_=-+pA5rxgxYa1E0xTk8pR7Oapw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z1Ti+rSOPuevMqgK"
Content-Disposition: inline
In-Reply-To: <CAKsK3AmdWGceDyotCA-5J6r_=-+pA5rxgxYa1E0xTk8pR7Oapw@mail.gmail.com>


--Z1Ti+rSOPuevMqgK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 13, 2023 at 05:20:32PM +0200, Youssef Aly wrote:
> I  just tried 6.3-rc1, still the same.
>=20

Thanks for the update. I'm telling regzbot on this:

#regzbot introduced: v6.1..v6.3-rc1

PS: Youssef, when replying to public mailing list (like here and LKML),
don't top-post; reply inline with appropriate context instead.
I have to trim the context as a result.

--=20
An old man doll... just what I always wanted! - Clara

--Z1Ti+rSOPuevMqgK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZDY16gAKCRD2uYlJVVFO
o0y3AQCtREYx9qFuwU7vifAsX1P2r/UPYI4vUg49qPlVVLfp3wD/a6iOH+2LFAp7
UsNBTaymkyLi9UwYH0Hiats7OyUJ5wE=
=d5Jb
-----END PGP SIGNATURE-----

--Z1Ti+rSOPuevMqgK--
