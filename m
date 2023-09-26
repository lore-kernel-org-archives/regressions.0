Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D664F36B
	for <regressions@lists.linux.dev>; Tue, 26 Sep 2023 00:49:39 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-573e67cc6eeso4931128a12.2
        for <regressions@lists.linux.dev>; Mon, 25 Sep 2023 17:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695689379; x=1696294179; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JqABUg4Xa7t7luyvOxZ/d67MGJaTAXsL+8PXX+Bo8IQ=;
        b=im7D1r1ow0x55z5dtQtpQcRrV7L13rQNoLhTjnjzXl72o80+RAKPXKEUqcVvjUYQVq
         QDDFqZ2yy+vnKjrjDRIMlweaAvqC4eXZxpD5NMx+gTPdjSqHG+V3bFFVRpkUzdZaAmXE
         ixlQcVZ1Fs175E9QtOcyaUboPZ+k76Vfsvpx1ey42Y05SyeQan32f9RbXXQ2vOoUzyrH
         T8PSvlTdI4rnaZXcmk5x4FCcWAveS8q6HYnMjVHWhuHQ0PcsD3/rwmJ2vA5bLt1Dl9vU
         z8wxG/NebUgFHfkfk1GAjjtaaHSdiQIz0kz/7mKgH38+PAech/6RrcKmS6hKyUsbn1OA
         PBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695689379; x=1696294179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqABUg4Xa7t7luyvOxZ/d67MGJaTAXsL+8PXX+Bo8IQ=;
        b=RsHGqY451shnYjhHtAOWgs7B9rF311qjjpx6cmeY/1mUEuoaWQV8bKfrvMKdqUleQf
         G3j8vWvkDsvwwPt46OhEiKqHPvUqKQUS6+44WsnqWeHnhhO0eGwV62WBfwQZ6I3U5a4T
         +7v6mShEppZawRzp7C/6E0B2a/qt/8sonbTUYreTsc5v/4SevKIsBK0h8WL2QMMUYvYY
         WKm2K8desIyIZAufUD0U1wPXsKAO+uliYPWDa/edhRlFfA0Fu8AIsplewCbhqFLcKg0w
         6V9o6CKdbaCK914Qq5R9F7Fg1mbi/RC5/ZjatF8xxgRT2rBG1gIxAgc/73Gncdg4Mfip
         wr4w==
X-Gm-Message-State: AOJu0YylRDz2OEE/kMx2fJ1ntHLw4VZ8S8Vcbt7KEDQD7XXBLETxTdAB
	Z9/xgkrtvRX6kJhxya6X5A8=
X-Google-Smtp-Source: AGHT+IF2fdCU386NjzNRFdfoWXHJ5nCCt8hffaO7qUJ6NGt1OWpSqbq34clR6isrcu4YMrpDCIO54Q==
X-Received: by 2002:a05:6a20:9704:b0:15d:42d5:6cc1 with SMTP id hr4-20020a056a20970400b0015d42d56cc1mr5813780pzc.33.1695689378885;
        Mon, 25 Sep 2023 17:49:38 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id l13-20020a170902f68d00b001b54d064a4bsm9529216plg.259.2023.09.25.17.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 17:49:38 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id C539380696DC; Tue, 26 Sep 2023 07:49:35 +0700 (WIB)
Date: Tue, 26 Sep 2023 07:49:35 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>, greg@greg.net.au
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Network File System <linux-nfs@vger.kernel.org>
Subject: Re: Fwd: kernel 6.4/6.5 nfs 4.1 unresponsive
Message-ID: <ZRIqn6zmc4jEimwj@debian.me>
References: <d9255749-bf1e-c498-ace6-048d36fa962f@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UccGjiI+YGKADNfL"
Content-Disposition: inline
In-Reply-To: <d9255749-bf1e-c498-ace6-048d36fa962f@gmail.com>


--UccGjiI+YGKADNfL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 06:14:03PM +0700, Bagas Sanjaya wrote:
> #regzbot introduced: v6.3..v6.4 https://bugzilla.kernel.org/show_bug.cgi?=
id=3D217815
> #regzbot title: nfs server not responding loop on Synology NAS devices
>=20

The reporter replied on Bugzilla that this regression is caused by out-of-t=
ree
i40 driver, so:

#regzbot invalid: out-of-tree module regression

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--UccGjiI+YGKADNfL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZRIqnwAKCRD2uYlJVVFO
oxqWAQDU673SqON3sxt5Uzny90pqdeRMG9m6KOEk5JtlxLeU+gD9EHzplPl2ghuX
TPFJVnPZukADvFovkU/y3agd8Ahr4wA=
=BzE9
-----END PGP SIGNATURE-----

--UccGjiI+YGKADNfL--
