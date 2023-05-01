Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C9920F8
	for <regressions@lists.linux.dev>; Mon,  1 May 2023 12:50:48 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1aae5c2423dso16638215ad.3
        for <regressions@lists.linux.dev>; Mon, 01 May 2023 05:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682945448; x=1685537448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EwELIRKAHNm5iJVhYK2ZdBO1ZolCnrOqU0qcbC+0lwU=;
        b=T6t2ELZ5f4JYz9xB/8mCO7Jdnhli4M69GZtETvcJyky9QGHltdL/bcrDqLutJMRE89
         arMb05ulDD+57eul6j7Wl7gYfPS3e0UQX9R/lXGIcaXmlyR6JoyypUQ152E84eiDOR+l
         kqbM+wJOsFZrS2WABgdhY/2uEux96MWZU0PlF9yi8/kW5kJinTz9L9pg10YwalMAObuF
         PVEpEICcZnv6JuguTqAkrW0PXJiTi9tLY73vJ+T+8tE9dUGb8g2JBeTysjEN+dbslU0b
         pOeHwdB3UKiXR4IXRXbBgW7sAU40fi1I35//qWFON3t5ZvWYm2R6TdVlMIsKikocWDLp
         kRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682945448; x=1685537448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwELIRKAHNm5iJVhYK2ZdBO1ZolCnrOqU0qcbC+0lwU=;
        b=MHKXp1nHzU34IMXfNB6mauN5qzmnNb1Vb0VgH+9o33keB9r73mlRvq1ss6w8N7BW9w
         /mSU1sQ4dkq5JqOr4us3cAKFscysMDmcNTXyIplvD+1jOcx56+CAoCeJ/sRbmaiaoIQQ
         Tvhljp+2JaWKFhHG5m/3PgVXatsYKond6UXXv57eQGX9NqExy7JxMjIo8t2PkdLeVZK3
         vTdhDYq43FI8B1wrlL6nRZgtdrPkRgT8Hp8mqdo8tNJgpK02ayNBsrKiSL7QL7FPgKrd
         l3zt4PRnKn3QsxgKDsSvrppoe4rTjOy+KZvce1Az2FKu+ARAKrQV3htPpqNwSyYbbpxW
         CObA==
X-Gm-Message-State: AC+VfDwWZ0i3uVHMW7e9Xul8Ncx9tx9Cct4UDe4V069D31Ob8XkykmZe
	VFpd0IIdiBsCyLqoC71IoiMlx4XxRldusA==
X-Google-Smtp-Source: ACHHUZ7wz8w7qpe15Q1dZYqVc/oJ7rXHCQIKJ7OkHfP6Yd/pX/FlKcy8GGym+w/XycFcSpB6gLTRcw==
X-Received: by 2002:a17:903:18b:b0:1a5:167f:620f with SMTP id z11-20020a170903018b00b001a5167f620fmr13455068plg.15.1682945448226;
        Mon, 01 May 2023 05:50:48 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-68.three.co.id. [180.214.232.68])
        by smtp.gmail.com with ESMTPSA id gb9-20020a17090b060900b0024dee500736sm2648554pjb.57.2023.05.01.05.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:50:47 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 482DC106237; Mon,  1 May 2023 19:50:44 +0700 (WIB)
Date: Mon, 1 May 2023 19:50:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Acid Bong <acidbong@tilde.cafe>, regressions@lists.linux.dev
Cc: stable@vger.kernel.org, linux-acpi@vger.kernel.org,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [REGRESSION] Asus X541UAK hangs on suspend and poweroff (v6.1.6
 onward)
Message-ID: <ZE+1pKbfy1l/tTo6@debian.me>
References: <CRVU11I7JJWF.367PSO4YAQQEI@bong>
 <5f445dab-a152-bcaa-4462-1665998c3e2e@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o8j3sON65QrdRjDT"
Content-Disposition: inline
In-Reply-To: <5f445dab-a152-bcaa-4462-1665998c3e2e@gmail.com>


--o8j3sON65QrdRjDT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2023 at 02:51:47PM +0700, Bagas Sanjaya wrote:
> On 4/14/23 02:35, Acid Bong wrote:
> > The issue appeared when I was using pf-kernel with genpatches and
> > updated from 6.1-pf2 to 6.1-pf3 (corresponding to vanilla versions 6.1.3
> > -> 6.1.6). I used that fork until 6.2-pf2, but since then (early March)
> > moved to vanilla sources and started following the 6.1.y branch when it
> > was declared LTS. And the issue was present on all of them.
> >=20
> > The hang was last detected 3 days ago on 6.1.22 and today on 6.1.23.
> >=20
>=20
> Have you tried testing latest mainline to see if commits which are
> backported to 6.1.y cause your regression?
>=20

#regzbot poke

Acid Bong, have you successfully bisected to find the culprit commit?
How about swapping the hardware? I'm poking because the thread looks
stale for a while.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--o8j3sON65QrdRjDT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZE+1nwAKCRD2uYlJVVFO
o8f7AP0eyxbUWhfWrmZsy8qwszcvI3TYLD3Dt/xIRbiuZ8d7hQD+KOmcPzg4n8zf
S06EBMian+f5balo8uwcqvk6MomLXAo=
=iMRM
-----END PGP SIGNATURE-----

--o8j3sON65QrdRjDT--
