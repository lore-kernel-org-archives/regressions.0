Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571A08F70
	for <regressions@lists.linux.dev>; Fri, 21 Oct 2022 12:43:01 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id ez6so2368191pjb.1
        for <regressions@lists.linux.dev>; Fri, 21 Oct 2022 05:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h0RDr7X8enYPRgtIijt6W6MecVFMwU1GrniMgEKKoSs=;
        b=jUcacOPaVFVEXRPxUx3iksnmpIM3r3xX24BY4Q4Ckg9tRwBdtjrm+Fqaa/QONVDk7f
         pHV8fLSVEITs0Xl05kSsHLjuXAzhUsvo4VbLGjzEZGHgxPSRlo4L+xf0RWz777X/f4vS
         JBG454DSCTP3b3UpMSF1NnqQxHOyQa5lBPmsX3eMAxcek8CJu5e89YhhMhnQPu4xlhxu
         ajAVbT93VmeGJ2zaEA8EJ4aYAztYe69BTnVEO6Y7xVI+1v1j1T2OnOCjd6NlVSwhk/lM
         5QPqxNugKgveF9Nx9PrK+13tu2QBMr4y3ido5IbTD6SACRHSRhBi5xbsIiouUrC5gsoU
         mUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0RDr7X8enYPRgtIijt6W6MecVFMwU1GrniMgEKKoSs=;
        b=LNcUflMSYlwpD5UOKcT38g3QfQue1isQxSUn2O3wGjgegHd7iU7TIgMoekY38mnz5C
         9no+7gTTqwka+9z4T1h+S+Rh6Q+jWHVFlZLw+1XVb9HtsWxUQGq2fO84gA1rTXngvwwW
         lAQ8InLJvZKrFhqUaODg3WyleVF171FlAsNDp0m+cCac+KmxmK6inMgulltYyuIJgrCn
         zXplsN9LPMoEVs7zAeOt8OwnWDL7PrxgyNfqkmmN3Yy2ZvH91OYttWjxbi2gQS/kgNNM
         EW05dfHKEgJIC5I1Fibam5SZJRrNxkZQHauo0J01asflT5Yhuw+q/a8Cp/YmHp2JvC/9
         hw+Q==
X-Gm-Message-State: ACrzQf0rtMhv55lUlhOh1/RxSwlgUXFTsgr4mncsWOZrC8tg2/IzWtVa
	1Y90z2zK76t48+NvDRCamRk=
X-Google-Smtp-Source: AMsMyM6fl7F8ZGP+lX5Ysz5l0bfjc0V1s9qkuHwWaw2QKSWmNosQe0hnoM4ogvqGeuV0kQxnpJM1cg==
X-Received: by 2002:a17:902:8e84:b0:178:71f2:113c with SMTP id bg4-20020a1709028e8400b0017871f2113cmr18900771plb.79.1666356180664;
        Fri, 21 Oct 2022 05:43:00 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-72.three.co.id. [180.214.233.72])
        by smtp.gmail.com with ESMTPSA id w62-20020a623041000000b00565c8634e55sm15144046pfw.135.2022.10.21.05.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 05:43:00 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 1B78D1004BB; Fri, 21 Oct 2022 19:42:55 +0700 (WIB)
Date: Fri, 21 Oct 2022 19:42:55 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	hsinyi@chromium.org, regressions@leemhuis.info,
	regressions@lists.linux.dev, dimitri.ledkov@canonical.com,
	michael.vogt@canonical.com, phillip.lougher@gmail.com,
	ogra@ubuntu.com, olivier.tilloy@canonical.com
Subject: Re: [0/3] squashfs: fix some regressions introduced in the readahead
 code
Message-ID: <Y1KTz7kTQqZNjwMe@debian.me>
References: <20221020223616.7571-1-phillip@squashfs.org.uk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xrLs7a11N8af3aPI"
Content-Disposition: inline
In-Reply-To: <20221020223616.7571-1-phillip@squashfs.org.uk>


--xrLs7a11N8af3aPI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 11:36:13PM +0100, Phillip Lougher wrote:
> Hi,
>=20
> This patch-set fixes 3 regressions introduced by the recent readahead cod=
e.
> The first regression is causing "snaps" to randomly fail after a couple of
> hours or days, which how the regression came to light.
>=20
> ----------------------------------------------------------------
> Phillip Lougher (3):
>       squashfs: fix read regression introduced in readahead code
>       squashfs: fix extending readahead beyond end of file
>       squashfs: fix buffer release race condition in readahead code
>=20
>  fs/squashfs/file.c       | 23 ++++++++++++++---------
>  fs/squashfs/page_actor.c |  3 +++
>  fs/squashfs/page_actor.h |  6 +++++-
>  3 files changed, 22 insertions(+), 10 deletions(-)

The regression goes away with this series, thanks.

For the series,

Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--xrLs7a11N8af3aPI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY1KTygAKCRD2uYlJVVFO
o4ugAP44cDAotKNStnaL01EGao1iGldQGIDkz/o+sDpup29RmwEA6RfZ8WgBU/c6
PCBgzzpacjDD+a1ePJS7FHZXJTQKBQ0=
=QLTt
-----END PGP SIGNATURE-----

--xrLs7a11N8af3aPI--
