Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79FB53A5
	for <regressions@lists.linux.dev>; Tue,  4 Jul 2023 10:08:08 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1b8033987baso32731915ad.0
        for <regressions@lists.linux.dev>; Tue, 04 Jul 2023 03:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688465288; x=1691057288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kj5iTnd4XrbTcGUhAZ1A3+xLyNhXL02LkhESUrLEfRI=;
        b=jYFheuDe4HqaHcTu5VNmtmjsiTlz7W/JIM2oFx+fBc7PkW9W1LBF2FA+ujpbmz50Jm
         NtjoMMauh9jXzfrNHnZU4oNPPeAJH8LO2ePOhxVOANURLh34GSAZ4u+LJ/61/Kn2tMvv
         Us5BrYMn7rPsoWQFxVygaoMGRPYfwUuoUXGT9kHw3Psa3yo1KbXVbDvtv5KIgmICi60A
         FYLNYLBEaTJs8M8ncKm7xkmP6KYWK91x72GG2ilbvA8pCOmoFGeqbMsoh1DnCSWCjAJD
         awWPJrqHSOt9ohCF+yERhIuYAJ0ApBqZL22Ss/wOGCeJxw/YGYxk6oBsdaqzynOktkv2
         qqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688465288; x=1691057288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kj5iTnd4XrbTcGUhAZ1A3+xLyNhXL02LkhESUrLEfRI=;
        b=V1PAKmKWqGP4mYPmx2iO8iGB0Sy/cq9yRBGRa3kDRWj2zW65wUtwV8igwyFA3YGFrW
         pcLmORlW+KKDBV5MK2j40e8A7MNT5BBOUT12h8/U07hln+1qMnErzKECxq+S1fuMST3b
         eu0m/NorhACjKdx8S4dbjfbDpj0aT/lkbNYjNAKQ0mFs6O4n+lGJCdyToP7JeeAsocVR
         w/Ewn435c1RV78Fr5677oMS/ckIPswzzJNy4wcpwVUqjoinwL03IpIyOLx8xy2kuczmJ
         nun3wRjUiWzxdz76gWLxf8s2XgBaZmCHN4n02A2BLvepZHDrrZ+e27CUXn4o8qTWgc5L
         51WQ==
X-Gm-Message-State: AC+VfDyuZXvCa5Uzo+RdJ6PLuUlaxim7KBhKhJAwGYObOC4V7FZxaAoW
	4pvaoZ/dsMEKr8lCEirCaPUYJiZ1vyMYJLry
X-Google-Smtp-Source: ACHHUZ4ieWeLUHEN9C48rp0MjAw1QldePHFT3ZrkcfriEkN0druFLb3QpLdBPSexoBxm0lfXG8SMGA==
X-Received: by 2002:a17:902:c244:b0:1b8:1d4b:f5f9 with SMTP id 4-20020a170902c24400b001b81d4bf5f9mr22709394plg.18.1688465287744;
        Tue, 04 Jul 2023 03:08:07 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id k19-20020a170902ba9300b001ab39cd875csm16866150pls.133.2023.07.04.03.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 03:08:06 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 088038057648; Tue,  4 Jul 2023 17:08:03 +0700 (WIB)
Date: Tue, 4 Jul 2023 17:08:03 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: Fwd: RCU stalls with wireguard over bonding over igb on Linux
 6.3.0+
Message-ID: <ZKPvg/CUdfiGt6pW@debian.me>
References: <e5b76a4f-81ae-5b09-535f-114149be5069@gmail.com>
 <79196679-fb65-e5ad-e836-2c43447cfacd@gmail.com>
 <10f2a5ee-91e2-1241-9e3b-932c493e61b6@leemhuis.info>
 <CAHmME9onMWdJVUerf86V0kpmNKByt+VC=SUfys+GFryGq1ziHQ@mail.gmail.com>
 <ZKIlibX5wCgWlonq@debian.me>
 <ZKIt5vyc_HunicuZ@zx2c4.com>
 <493448c9-7a76-532b-0f06-adf6b806ef5b@leemhuis.info>
 <ZKK2d/2aKoH1RVaN@zx2c4.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m8iyiyRyFE3wlSv/"
Content-Disposition: inline
In-Reply-To: <ZKK2d/2aKoH1RVaN@zx2c4.com>


--m8iyiyRyFE3wlSv/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 03, 2023 at 01:52:23PM +0200, Jason A. Donenfeld wrote:
> On Mon, Jul 03, 2023 at 07:18:32AM +0200, Linux regression tracking (Thor=
sten Leemhuis) wrote:
> >=20
> >=20
> > On 03.07.23 04:09, Jason A. Donenfeld wrote:
> > > On Mon, Jul 03, 2023 at 08:34:01AM +0700, Bagas Sanjaya wrote:
> > >> On Sun, Jul 02, 2023 at 03:46:38PM +0200, Jason A. Donenfeld wrote:
> > >>> I've got an overdue patch that I still need to submit to netdev, wh=
ich
> > >>> I suspect might actually fix this.
> > >>>
> > >>> Can you let me know if
> > >>> https://git.zx2c4.com/wireguard-linux/patch/?id=3D54d5e4329efe0d1db=
a8b4a58720d29493926bed0
> > >>> solves the problem?
> > >>
> > >> The reporter on Bugzilla [1] said it fixed the regression, so telling
> > >> regzbot:
> > >>
> > >> #regzbot fix: 54d5e4329efe0d
> > >=20
> > > That's not correct.
> >=20
> > Yeah, the gitsha will only work when it's stable.
> >=20
> > > I tend to send patches to netdev@, not pulls, so the
> > > commit is going to be different. Just leave this alone for a bit and
> > > tidy things up once everything hits the main trees.
> >=20
> > Kinda right, but otoh this makes things this slightly annoying bit
> > harder for regression tracking. But as the patch subject rarely changes,
> > this can usually be avoided by using:
> >=20
> > #regzbot fix: wireguard: queueing: use saner cpu selection wrapping
>=20
> Here's the final sha:
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=
=3D7387943fa35516f6f8017a3b0e9ce48a3bef9faa

OK, thanks for the appropriate sha! And I'm sorry for all noises
and inconveniences during tracking this regression.

--=20
An old man doll... just what I always wanted! - Clara

--m8iyiyRyFE3wlSv/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZKPvfgAKCRD2uYlJVVFO
o14XAP9hbHZkgh2Q4AJ6zjLla0LAacGNaJooBpBNBlxAwcIH9wEAsZ8XJbFvNlDQ
fuXL8qe078kB9sjE9lsyZo3GpvbFwgs=
=G3qF
-----END PGP SIGNATURE-----

--m8iyiyRyFE3wlSv/--
