Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DCDA49
	for <regressions@lists.linux.dev>; Sun, 10 Sep 2023 08:54:31 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1d4e0c2901bso2479571fac.0
        for <regressions@lists.linux.dev>; Sun, 10 Sep 2023 01:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694336070; x=1694940870; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5lgpH9+mYIZiTiSRi4aA6jYtZEqamFekNzmEa3uRVpo=;
        b=Q4xd7EtORH0+Re5SrlosyxsYFpbeqGjJgQpbP5xYKm2MF/bE4HPLkjSZH6Pum3enqs
         8C6KAlswVrYUXCsUnPVOPbtt7t05RL738Y6s4cKbX6JOofpzRnF47gV+0K8b7jCv6JDE
         9ScKAXdCLxKM4xwLPwOgxWOCbAYSOOMt+vIEAqI9rqhbUisWXkpbr8oyAtFOPgk/ZGqF
         yniQLhCi8YDRxb3o/12l4Eqcr3xZS8AZ3jIImirJHGqgvKvjTj125uISRz0275uLhLOf
         1ZPa84UYtXBfkt+MpzPhczzfjMT//SBJfdyGt0Igv3cjd1go+ym+HifNOlbv3AGYUAaY
         W24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694336070; x=1694940870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lgpH9+mYIZiTiSRi4aA6jYtZEqamFekNzmEa3uRVpo=;
        b=Nf5vPMl8q4PSx8g6pWx2NZLtgVjgYGzjd/ubyOxkH0SQhGlHpp6EMQ/YF3vFykPbsQ
         q5fn0yilj2iuxGFWikeaoYePF/Mr868MBbFTLL1uMwYRpPimwEZm8G1GUlp14M5Dv8iV
         /kJRKgYV5VmreOlIeN63tO5Zx1VNSF0X3k1w2z3SLRP+ueb3zqpVZGfy1whkeGRTDMal
         Y5u2/eazNozmlWuhrX9Ou0L23oq2pFjG2BJXz/RfDH8SD4UQQOwkMcMe90GRfGzsC0+T
         AJ+1/bwrdXSWcTr/9WxoZYiKnu2aCSNx3u8ES9gRfQp5aNcpQZbVn25yBa69IpdvOCH3
         eY2Q==
X-Gm-Message-State: AOJu0YxjpXGFj1PhPoyifB6PYz8h+VxBZmGEQSfnDzwoBmvBv2kHd42k
	fwoTp95SGEibXSsOqpwF5IU=
X-Google-Smtp-Source: AGHT+IFo0lXuVT4laYGMB6yJcUTqFaZMQzZR8Ia5MJVnJ73100N8fueG1wWvlVMiQqr/DMEjDeftmg==
X-Received: by 2002:a05:6870:c214:b0:1c8:d72a:d6b8 with SMTP id z20-20020a056870c21400b001c8d72ad6b8mr8286404oae.36.1694336070626;
        Sun, 10 Sep 2023 01:54:30 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c25500b001bb9f104328sm4270163plg.146.2023.09.10.01.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 01:54:30 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 41E948B25F93; Sun, 10 Sep 2023 15:54:28 +0700 (WIB)
Date: Sun, 10 Sep 2023 15:54:28 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Andres Salomon <dilinger@queued.net>,
	"Timur I. Davletshin" <timur.davletshin@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux AMD GEODE <linux-geode@lists.infradead.org>
Subject: Re: Fwd: AMD Geode LX hardware RNG driver produces regular patterns
 (geode-rng.c)
Message-ID: <ZP2ERFydER7pJprL@debian.me>
References: <9a28c2fc-d769-4802-a1f2-77ba2cb34d25@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ulctYQL3W5/kDSuY"
Content-Disposition: inline
In-Reply-To: <9a28c2fc-d769-4802-a1f2-77ba2cb34d25@gmail.com>


--ulctYQL3W5/kDSuY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 07, 2023 at 06:37:00PM +0700, Bagas Sanjaya wrote:
> #regzbot ^introduced: v4.14.267..v5.15.127
> #regzbot title: predictable urandom output on Alix 2d13
>=20

#regzbot fix: https://lore.kernel.org/lkml/20230910083418.8990-1-jonas.gors=
ki@gmail.com/

--=20
An old man doll... just what I always wanted! - Clara

--ulctYQL3W5/kDSuY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZP2EPwAKCRD2uYlJVVFO
ozp8AP97BdzdydMFXvDsCeRnXjJh+ZjSSO52H0t51A3rrvrtmwD+I+a3DQwcf00v
t9AfVXJJ+3iWZXZb6Mw31XNa6wPzQwU=
=CWvC
-----END PGP SIGNATURE-----

--ulctYQL3W5/kDSuY--
