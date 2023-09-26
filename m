Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF42637
	for <regressions@lists.linux.dev>; Tue, 26 Sep 2023 00:55:04 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3add83c9043so3880353b6e.2
        for <regressions@lists.linux.dev>; Mon, 25 Sep 2023 17:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695689704; x=1696294504; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0CXYLwtV6hI1Lwk84mbKyAHp+fTnm6/oOKkcYYEM0gg=;
        b=EtpxXDnQffpNTsewhfuHgj/XzJoT2zYYED/sON6+m7VMoUMFsanU1kj5XkUu2G33Q9
         JedynouCeJThCwsreVk83PDFyz71zWRAS+flmSBOCDmeLMSR7iNKwYycB3gb5BixF4M4
         w/fsV/fb/HgO1mlVOfPhtehK3QzZAEF0TQ36vJSUD2WabRU1WraVeiYpFULaJ84tbNEx
         tr1BVRaYCTB2rA/vYXeutTX6tWT6vOKYnSxH96f8VzTZDkPVXZGlAo7W54IKC1uzc5RW
         6NEPHVSRhOmggQbfnH/WM1igVzXAhwvX603jtVJHRL2v/vAbGNV5z6LsHHmqhgoJE4S8
         W4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695689704; x=1696294504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CXYLwtV6hI1Lwk84mbKyAHp+fTnm6/oOKkcYYEM0gg=;
        b=D7HgrZq627+2SDGG6QhL0l/MKLJm/ASeVlkgEsAffprgBR9hI59nrObtU+fmgfTkz9
         torwkDu+dQ2R2aHMbbPbTrq6cbOcSFaVoJ+w+ifj7ORosL58N7o/v/prAeMYp9LXzPna
         d47XbbS8Rr7upKW7ft/U7ErZ0nlDDgV+zo5qFUYtGYjVI0HxIih6STw7Efmo653NmKFQ
         ysx0XMoU2eJ+vW31Jt1eZ8HXogQoiQ+snfXAhABOxJcqbKYPhJXJxmB7iOPk4HU71i+n
         sAMKa5fTTnLGSk6nnz3NgjBVi05sBl/fQQy606jInDfHHFJiwpxgyeLclHjZ2UN4MUXx
         nsOA==
X-Gm-Message-State: AOJu0Yxf1TwOvH/hZqucyVfEEmaJyUa7DJVTVWZJAC8rB+Vi9UeL0GSP
	34y8XPrlM+zy0rjlWDexUR2KVwYNNNdNEg==
X-Google-Smtp-Source: AGHT+IGRPQKNCawBo+MIk51/Ou91oPvmW1z8tu8Kdu8Tn3tbO1vseAeAhM3xQggtwn7ms17BTXXKuA==
X-Received: by 2002:a05:6808:1a88:b0:3ae:e0d:1548 with SMTP id bm8-20020a0568081a8800b003ae0e0d1548mr7579294oib.15.1695689704020;
        Mon, 25 Sep 2023 17:55:04 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id h5-20020aa786c5000000b006889511ab14sm8654484pfo.37.2023.09.25.17.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 17:55:03 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id ABC7B8DABD81; Tue, 26 Sep 2023 07:55:00 +0700 (WIB)
Date: Tue, 26 Sep 2023 07:55:00 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Verot <verot.wrongdoer713@simplelogin.com>
Cc: Linux Input Devices <linux-input@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Stable <stable@vger.kernel.org>
Subject: Re: Fwd: Kernel 6.4.4 breaks Elan Touchpad 1206
Message-ID: <ZRIr5E2FAFVqhtmw@debian.me>
References: <42bc8e02-5ee0-f1c8-610e-e16391e54ee2@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H68YQ2lTD34t8/zF"
Content-Disposition: inline
In-Reply-To: <42bc8e02-5ee0-f1c8-610e-e16391e54ee2@gmail.com>


--H68YQ2lTD34t8/zF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 07:00:21AM +0700, Bagas Sanjaya wrote:
> Hi,
>=20
> I notice a regression report on Bugzilla [1]. Quoting from it:
>=20
> > Description:
> > When booting into Linux 6.4.4, system no longer recognizes touchpad inp=
ut (confirmed with xinput). On the lts release, 6.1.39, the input is still =
recognized.
> >=20
> > Additional info:
> > * package version(s): Linux 6.4.4, 6.1.39
> > * Device: ELAN1206:00 04F3:30F1 Touchpad
> >=20
> > Steps to reproduce:
> > - Install 6.4.4 with Elan Touchpad 1206
> > - Reboot
> >=20
> > The issue might be related to bisected commit id: 7b63a88bb62ba2ddf5fcd=
956be85fe46624628b9
> > This is the only recent commit related to Elantech drivers I've noticed=
 that may have broken the input.
>=20
> See Bugzilla for the full thread:
>=20
> To the reporter (Verot): Can you attach dmesg and lspci output?
>=20
> Anyway, I'm adding this regression to be tracked by regzbot:
>=20
> #regzbot introduced: 7b63a88bb62ba2 https://bugzilla.kernel.org/show_bug.=
cgi?id=3D217701
> #regzbot title: OOB protocol access fix breaks Elan Touchpad 1206
>=20
> Thanks.
>=20
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D217701
>=20

No reply from the reporter in regards to required bisection, thus:

#regzbot inconclusive: not bisected, reporter MIA

Sorry for inconvenience.

--=20
An old man doll... just what I always wanted! - Clara

--H68YQ2lTD34t8/zF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZRIr5AAKCRD2uYlJVVFO
o+6iAP98gFN37T7GtXeidZpgcd13kL448gj8ctLYAeJCo5rDLgEA4SxE9qTuQslN
rHvLTpJT8v9HsUWYqm0ApWfaI4nE9QA=
=7F3z
-----END PGP SIGNATURE-----

--H68YQ2lTD34t8/zF--
