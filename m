Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EF87F1
	for <regressions@lists.linux.dev>; Fri, 13 Oct 2023 00:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9I82yb+"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3af65455e7cso951314b6e.1
        for <regressions@lists.linux.dev>; Thu, 12 Oct 2023 17:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697155454; x=1697760254; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oh67ucGuzIvE780j/LrVx5Elx34xcaAEoCizzJ+iHF8=;
        b=Z9I82yb+L24qw+ma3RfWZlKDLA+8ZnFM/GmsbHqknhMYOmN6kp3RssF117HuHRjzbK
         pSXKW4CpTx1gfCTCf9rRQ72F3qE6HFCGFXSjR38qy+k0rZyFfGA1n/bFi+4XUisjAYLA
         d4/QecqKb0bxHDAfJ8EUkVejbeE7c8/YQsuRAybOg6m1Pb37MA4KHH+v5VkPqv4lGW9W
         SXCIAp8AxZLrRfi8Ad2rkvbTaJ2cG5T9otnf55ob7af4VNyPzfvZhOBOxJAHRn/l7Qtm
         GWDvuV9jmeEU35IS2DKg2oUhFzb9K6IagTYVNBm1Ijkj1XQO+I0zKf5nYuvEbaEa4MAz
         kADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697155454; x=1697760254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oh67ucGuzIvE780j/LrVx5Elx34xcaAEoCizzJ+iHF8=;
        b=KbUAqrbjQ0Zec/72uVeYKE6fVGFwpbHkEL7dBu87Snp5mK19OcY++wvrNHx4tV2LGE
         cb4yLSR2wlo0NG5E9zivHPkbsARWCbTDwt+HLj75sS9OHPV5DSxkZKk2tEOQa7HAIDkT
         LfDUI+BXxOs4iLYM4oPyiC4c1GrZetQgkkXKuit/K6B4yItMAu7yzyLeXV7xxxc+jlYQ
         Mz+jZrUKMbPhb6cpn4s/LGXuhTd8taleXNXWJzCR78yqqiU3eQrGakjGEvobotjRw9FS
         XqGjK34b5Gex+AVNzeXLtE0gLlbs9jHeXh+3kUorvmhPl5D+twRmsVXWrnxTkUy012+k
         GVrw==
X-Gm-Message-State: AOJu0Ywc0fOH/j5ZJgaYaywfsBNr3wB309j5fhDUK9mqsfrpYifI+KAF
	shvzP81QxBhVcoYuc1JUQ2Y=
X-Google-Smtp-Source: AGHT+IEoD+6r6arnZjsqloxzLh2yK4Ao1EbLkqH70J3zGd6qS6Bha/trbmFxeZQVi0Pk+lVNP9d65w==
X-Received: by 2002:aca:1c18:0:b0:3ae:5c89:dcc2 with SMTP id c24-20020aca1c18000000b003ae5c89dcc2mr27713272oic.34.1697155454577;
        Thu, 12 Oct 2023 17:04:14 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id d9-20020a634f09000000b005aa800c149bsm196524pgb.39.2023.10.12.17.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 17:04:13 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 9E3208061F09; Fri, 13 Oct 2023 07:04:07 +0700 (WIB)
Date: Fri, 13 Oct 2023 07:04:07 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Loic Poulain <loic.poulain@linaro.org>,
	M Chetan Kumar <m.chetan.kumar@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux Intel Wireless WAN <linuxwwan@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: Re: Intel 7560 LTE Modem stops working after resuming from standby
Message-ID: <ZSiJdxjokD0P9wRc@debian.me>
References: <267abf02-4b60-4a2e-92cd-709e3da6f7d3@gmail.com>
 <CAMZdPi9RDSAsA8bCwN1f-4v3Ahqh8+eFLTArdyE5qZeocAMhtQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PP7bwyu6fGW3EUdk"
Content-Disposition: inline
In-Reply-To: <CAMZdPi9RDSAsA8bCwN1f-4v3Ahqh8+eFLTArdyE5qZeocAMhtQ@mail.gmail.com>


--PP7bwyu6fGW3EUdk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 06:54:11PM +0200, Loic Poulain wrote:
> Hi Chetan,
>=20
> On Thu, 12 Oct 2023 at 11:52, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> > I notice a regression report on Bugzilla [1]. Quoting from it:
> >
> > > I noticed a few days ago, after Fedora moved to Kernel 6.5, that my I=
ntel LTE Modem was not working anymore after resuming from standby.
> > >
> > > The journal listed this error message multiple times:
> > > kernel: iosm 0000:01:00.0: msg timeout
> > >
> > > It took me a while to determine the root cause of the problem, since =
the modem did not work either in the following warm reboots.
> > > Only a shutdown revived the modem.
> > >
> > > I did a bisection of the error and I was able to find the culprit:
> > >
> > > [e4f5073d53be6cec0c654fac98372047efb66947] net: wwan: iosm: enable ru=
ntime pm support for 7560
>=20
> Any quick fix for this issue? alternatively we will probably revert e4f50=
73d53.

Chetan can't be contacted as sending to his address bounces (error 550)
(had he left Intel?). Last message on LKML is this culprit patch [1].
Hence, revert for now.

Thanks.

[1]: https://lore.kernel.org/all/1b0829943267c30de27f271666cb7ce897f5b54a.1=
686218573.git.m.chetan.kumar@linux.intel.com/

--=20
An old man doll... just what I always wanted! - Clara

--PP7bwyu6fGW3EUdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZSiJcQAKCRD2uYlJVVFO
o3T4AQC2eZBwGIxvu1lYm3OWhuSJWAkmt205gwAEftFVbJMb4wD/eOyi70nh9Io+
kMI6SLXZyG8rleaKEg9MYV9rZ3LfCwk=
=dFVx
-----END PGP SIGNATURE-----

--PP7bwyu6fGW3EUdk--
