Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2187C
	for <regressions@lists.linux.dev>; Mon, 29 May 2023 02:21:17 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-64d3fdcadb8so2028727b3a.3
        for <regressions@lists.linux.dev>; Sun, 28 May 2023 19:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685326877; x=1687918877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TOEnxgrrxri26dldYxLmWoJUt5x//Zlg4TwdS9dGdoI=;
        b=pOEp+2VwI45RYl7vSq4IkS5MFOcNXxZeWxAaVhZbey4KR7ZAazv/A91gDA/1FkaYr1
         ImqWliZTLkHDRC1E8EB2pPccr5XOGP3E1ivfdUcz+NGrYjh6P39WVFrrbJpP/jkw7NMI
         Rqr8SWp27qYp72gtOcAFMT+97oWHcpzHEn3TY6Xp7dQNa7dFK7NqzbIAC10x8Z2HPCSI
         mo1abbWQwAoc1UQtfFNUPPn9a//wEKNUrLYqKJGBmoIiF5FnYf5q1JzTRgfxOUO7xn2D
         feNRkqVFGyyeYhwepy+QwDqatCY3j8/V1fRpqi5dLMdMphHZiFilQP/SGqOivOCjoo6M
         mZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685326877; x=1687918877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOEnxgrrxri26dldYxLmWoJUt5x//Zlg4TwdS9dGdoI=;
        b=UBHfWAx+948CgTAcrnNsUBulMC501S1FhCOwa3GD3pMhnydEl8k9y23o1jCDAO863K
         BW34oJ+2IvYVDJj+RGQmOhEftBi7Yfe8DsXjB4GmhN5EBzC5sEZfsl82ssuVYL4UeLh0
         pDKAMXyUKvBqfLi4YECA2gPkqyIuQU7rq4B0eGGWBvKG1xcWncF7Kl4ePl913/etcNhh
         Vq1pCgLtJZEHnf7rfspo76fifKyVCUBY6RdanAKJp7Ya8n0XqwodUILe1nvSHywnWwYN
         WuL/rv9qY82KymY+OV9dIZ3tGGMKfQ+FcZqw7J/Ma+WWYoh93BSzcEMhu9pam9fkYKeq
         m9Tw==
X-Gm-Message-State: AC+VfDyKIHU9gCVSOVbnrjDS++boypXHvh0OgbmuP42Fj8C/qf7cy0a9
	l02A1jlOcmjjAlcmsGFG0Eo=
X-Google-Smtp-Source: ACHHUZ5Z0y7zoB17YloXZJuJ1Mepg6iFTuaulcJSfMLeMxnNe7a6TFBiFQ5W7hu7sHXCYbcYV6BEwA==
X-Received: by 2002:a05:6a20:8e05:b0:10b:f63f:27f with SMTP id y5-20020a056a208e0500b0010bf63f027fmr8213369pzj.60.1685326876732;
        Sun, 28 May 2023 19:21:16 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-34.three.co.id. [116.206.12.34])
        by smtp.gmail.com with ESMTPSA id f12-20020aa78b0c000000b0063afb08afeesm3113669pfd.67.2023.05.28.19.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 19:21:16 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 48B7A106A0B; Mon, 29 May 2023 09:21:12 +0700 (WIB)
Date: Mon, 29 May 2023 09:21:12 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: beld zhang <beldzhang@gmail.com>, stable@vger.kernel.org
Cc: Linux Regressions <regressions@lists.linux.dev>,
	Linux USB <linux-usb@vger.kernel.org>,
	Linux Input Devices <linux-input@vger.kernel.org>
Subject: Re: Fwd: 6.1.30: thunderbolt: Clear registers properly when auto
 clear isn't in use cause call trace after resume
Message-ID: <ZHQMGN-LAJk6vHjH@debian.me>
References: <CAG7aomXv2KV9es2RiGwguesRnUTda-XzmeE42m0=GdpJ2qMOcg@mail.gmail.com>
 <ZHKW5NeabmfhgLbY@debian.me>
 <261a70b7-a425-faed-8cd5-7fbf807bdef7@amd.com>
 <CAG7aomVVJyDpKjpZ=k=+9qKY5+13eFjcGPEWZ0T0+NTNfZWDfA@mail.gmail.com>
 <CAG7aomXP0JHmHytsv5cMsyHzee61BQnG3fc-Y+NLzum7H3DyHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ifHpYZTFasUnVXV+"
Content-Disposition: inline
In-Reply-To: <CAG7aomXP0JHmHytsv5cMsyHzee61BQnG3fc-Y+NLzum7H3DyHA@mail.gmail.com>


--ifHpYZTFasUnVXV+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 28, 2023 at 02:35:18PM -0400, beld zhang wrote:
> ---------- Forwarded message ---------
> From: beld zhang
> Date: Sun, May 28, 2023 at 2:07=E2=80=AFPM
> Subject: Re: 6.1.30: thunderbolt: Clear registers properly when auto
> clear isn't in use cause call trace after resume
> To: Mario Limonciello
>=20
> On Sun, May 28, 2023 at 8:55=E2=80=AFAM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
> >
> > This is specific resuming from s2idle, doesn't happen at boot?
> >
> > Does it happen with hot-plugging or hot-unplugging a TBT3 or USB4 dock =
too?
> >
> > In addition to checking mainline, can you please attach a full dmesg to
> > somewhere ephemeral like a kernel bugzilla with thunderbolt.dyndbg=3D'+=
p'
> > on the kernel command line set?
> >
>=20
> 6.4-rc4:
>     *) test 1~4 was done with usb hub with ethernet plugged-in
>         model: UE330, usb 3.0 3-port hub & GIgabit Ether adapter
>         a rapoo wireless mouse in one of the ports
>     1) no crash at boot
>         until [169.099024]
>     2) no crash after plug an extra usb dock
>         from [297.004691]
>     3) no crash after remove it
>         from [373.273511]
>     4) crash after suspend/resume: 2 call-stacks
>         from [438.356253]
>     5) removed that hub(only ac-power left): NO crash after resume
>         from [551.820333]
>     6) plug in the hub(no mouse): NO crash after resume
>         from [1250.256607]
>     7) put on mouse: CRASH after resume
>         from [1311.400963]
>         mouse model: Rapoo Wireless Optical Mouse 1620

Before suspend, is attaching your mouse not crashing your system?

>=20
> sorry I have no idea how to fill a proper bug report at kernel
> bugzilla, hope these shared links work.
> btw I have no TB devices to test.
>=20
> dmesg:
> https://drive.google.com/file/d/1bUWnV7q2ziM4tdTzmuGiVuvEzaLcdfKm/view?us=
p=3Dsharing
>=20
> config:
> https://drive.google.com/file/d/1It75_AV5tOzfkXXBAX5zAiZMoeJAe0Au/view?us=
p=3Dsharing

There is a functionality on Bugzilla to attach above files. Use it.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--ifHpYZTFasUnVXV+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZHQMFwAKCRD2uYlJVVFO
o2oZAQD4WEj7xFwvWRg8a+js048BS/G5uxkfbUwn1PtqjsOoyQD/aVX6452ePcjQ
9lz0zEcPxwgK7BmaRxhkbe7dSmzxAw0=
=DphI
-----END PGP SIGNATURE-----

--ifHpYZTFasUnVXV+--
