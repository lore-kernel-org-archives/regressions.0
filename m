Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9D2367
	for <regressions@lists.linux.dev>; Sat, 16 Sep 2023 00:05:13 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68fc9e0e22eso2262207b3a.1
        for <regressions@lists.linux.dev>; Fri, 15 Sep 2023 17:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694822713; x=1695427513; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uBFU91Ab8Ty50yBCscF+Su8H4xiggY1DMOJHupjwHzg=;
        b=Z1tBy35MKyud/YbGZoLLOGXsffoCrsJO1VNkThi92L7xvsqsFc0Amn+cATEVMfoaV0
         EyAUXL0wFYnLEYaU2AfQH4kYPZsQlELVHyxSw+L1OzyiR3zu7UZFxpgNCvlmrqJvZvSH
         W3+4lJnly14E2PSG65YlCmQzjiUrt9WbLkQ6fR595ieMXvtgoyeylz0sBlWTSjvLHVVr
         8L5uR4dl2nUxmIsCz9ULWCvjvUhdvfeao78T5WFKl4hHsV3ovX5E7XdO91jzwqiTk8H3
         Zp5M6fFHhX6N/WEyMUFFhnk95tQXjzsk4cKlaxLi9cQ/uiFmqspIs4lBZ+zJNZa6uCzk
         g1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694822713; x=1695427513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBFU91Ab8Ty50yBCscF+Su8H4xiggY1DMOJHupjwHzg=;
        b=UEnVYRRYY9Awte4L8hMhdvAyoPkor6in3QrBXHGWAkfdOYGHhFxCrOLg0IXs/O+drc
         FqSLU8Xe1jkScQX8RK9YX6rCWowZR3POYjbjqA/7Wx8MUKrTylTDvfFGC70yHHqV0dCK
         m2eGhB7q6A7cA+oWaYJ0EUM4VjpXVmi09jFQUp0w6X1cfxBtAsifDTxweVE5hMGYOs4j
         55Jc143e0uGEisGX/CgK+hmmazlKQLEVlcu+7dOLf6i2btEyNrI8p3DSyZSBzTkTfCxT
         bFJy+kpSrcPn39mAbQ7erN8pCEMrQd5TcgIFdH0oud7MKctsoZlASpQ56z0LVUCxbhem
         1RUg==
X-Gm-Message-State: AOJu0YzHk6RD8T6vkFUsp17zcFQsZk2hgkRLhSOoHOQfrqYiHxW+2ya9
	MdRy7FzTGAlOCmZKLSSNFSM=
X-Google-Smtp-Source: AGHT+IF0Gziwgjs8IBkPNW32gp0eqmvsqmMuvS0x7PTIdUhgCFb6Vt3ZXEPLS8yJVzATlvoLr0H0cw==
X-Received: by 2002:a05:6a00:1588:b0:68c:4e22:8f78 with SMTP id u8-20020a056a00158800b0068c4e228f78mr3528463pfk.25.1694822712935;
        Fri, 15 Sep 2023 17:05:12 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id c5-20020aa78805000000b0068ff6d21563sm3569946pfo.148.2023.09.15.17.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 17:05:11 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 33456811F023; Sat, 16 Sep 2023 07:05:07 +0700 (WIB)
Date: Sat, 16 Sep 2023 07:05:07 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, Tester47 <e598@gmx.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux TTY & Serial <linux-serial@vger.kernel.org>,
	Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: Fwd: Kernel 6.6-rc1 fails to reboot or shutdown Ryzen 5825U
Message-ID: <ZQTxM0JdyV8mpxbt@debian.me>
References: <2bc62c07-2195-e378-c057-f28e8d4a6034@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xh9/EH8MO3HbfOrP"
Content-Disposition: inline
In-Reply-To: <2bc62c07-2195-e378-c057-f28e8d4a6034@gmail.com>


--Xh9/EH8MO3HbfOrP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 02:03:00PM +0700, Bagas Sanjaya wrote:
> #regzbot introduced: v6.5..v6.6 https://bugzilla.kernel.org/show_bug.cgi?=
id=3D217905
> #regzbot title: shutdown/reboot hang on Ryzen 5825U (stuck on amdgpu init=
ialization)
>=20

Fixing up commit range:

#regzbot introduced: v6.5..v6.6-rc1

--=20
An old man doll... just what I always wanted! - Clara

--Xh9/EH8MO3HbfOrP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQTxLQAKCRD2uYlJVVFO
o8rgAPwIzBXYXKeK6pcEOYV2weLfbQUqgqPF2jOk3Ec5KM6KWQD/bUH8Sr/mt0Fy
cMDw3XSd1I3kgWf0GonS0cLKCV7tpQ0=
=kMdp
-----END PGP SIGNATURE-----

--Xh9/EH8MO3HbfOrP--
