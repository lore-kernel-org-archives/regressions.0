Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BE75225
	for <regressions@lists.linux.dev>; Tue, 21 Nov 2023 14:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbOB6bmt"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1ce5e65ba37so29424925ad.1
        for <regressions@lists.linux.dev>; Tue, 21 Nov 2023 06:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700575248; x=1701180048; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/2dGcwu67FKQ/Ka/5ZkDOtzfjiNTfRATRxkZ5/mYoKE=;
        b=NbOB6bmtqzPbny5aTQpyqq/s5kYetSBfrUJFW7I7jcyh3eHPO5M0CIyGbW0fL6Fd63
         D+N810pRibpZtvsp5olPoHEzw4/N43NAEFthcCRFQN5LL9JSUASPZmy6TGtLSvjzqu67
         S+qbHb8kvBTDXec6NM3WLkRB7dpZhFEgR3vFr7aZK1dpNoNBfGyxj8WgY00yGb0co9RP
         c2A6lRIs9cevK8RTkPZeNrpXC34bRWz22J8+/jtXnguExAjtVsN8bILJZRJMbSHHHEVp
         QlS/YVuJGUDTvp7b5yffPayxp+yr/oFBgexuTpi84bsEnBVPR1Zk78Xcd6vEcc6JI3tG
         C8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700575248; x=1701180048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2dGcwu67FKQ/Ka/5ZkDOtzfjiNTfRATRxkZ5/mYoKE=;
        b=xJvVQgueX1ISxD4x33jJFVH6kLpvxD5HIdG+L+7AWCa4tj7wnDuBE+w8TmgI8vz+hG
         7+IvWh+DuuBqJcoOrfxAZpEEll+7inNZVY2zeJxjeW6+af8ijjac4fNmlUheGP8Lo9Px
         SbW3R6uThDrHPQuOqOSQ7ObIgn3wGAnpkNDRFH4GyCiwRMElcT1/VaP0bsi8xC0tlqvp
         5eNUFh09sX1saMFWl6Td7/0/C2HqDadvBZLZuurqhJdieLndLfldVahdsYFgc1wdzK7M
         9QTdKCE4I2+U5/pJK9jpsUDEMQVCTNv4mjuLvvHPwkbVabK16pWo73VVvNVqUaG3jCiZ
         RvnA==
X-Gm-Message-State: AOJu0YxI42XlBKOOLXIYLJXgD+m+E7j31MUIv7E9cvPLwbsRC6ey5ruF
	HJG1THYldSYFKjgRxfQV9zk=
X-Google-Smtp-Source: AGHT+IHJMBPSeuQVESg2RPRg3hnTS57SbAq141fBC+lbUG4MZoynluX2BB8P548ssmsvmMnhRUqtsQ==
X-Received: by 2002:a17:902:edc7:b0:1cf:58dc:9c83 with SMTP id q7-20020a170902edc700b001cf58dc9c83mr2943569plk.31.1700575247737;
        Tue, 21 Nov 2023 06:00:47 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902e88d00b001ce5b9ce4fesm7967136plg.50.2023.11.21.06.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 06:00:47 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 230C910207143; Tue, 21 Nov 2023 21:00:44 +0700 (WIB)
Date: Tue, 21 Nov 2023 21:00:43 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Input Devices <linux-input@vger.kernel.org>
Cc: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>,
	Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jkosina@suse.cz>,
	LinuxCat <masch77.linuxcat@gmail.com>,
	Marcelo <mmbossoni@gmail.com>, Takashi Iwai <tiwai@suse.de>,
	Hans de Goede <hdegoede@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: Fwd: Logitech G915 Wireless Keyboard acts weird on 6.6.0
Message-ID: <ZVy4C9z99DbwEBBu@archie.me>
References: <6929ebbf-f2e0-4cd4-addc-1e33ecf3277f@gmail.com>
 <ZVyr-of1X4RudpWG@archie.me>
 <0e10112a-7560-4dd8-8a03-5fdfc838168f@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H3NzUQqbCh1SScdV"
Content-Disposition: inline
In-Reply-To: <0e10112a-7560-4dd8-8a03-5fdfc838168f@leemhuis.info>


--H3NzUQqbCh1SScdV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 02:53:17PM +0100, Linux regression tracking (Thorst=
en Leemhuis) wrote:
> On 21.11.23 14:09, Bagas Sanjaya wrote:
> > On Thu, Nov 02, 2023 at 09:11:42PM +0700, Bagas Sanjaya wrote:
> > <snip>...
> > There's no reply from culprit author nor linux-input people (did they
> > miss this regression?).
>=20
> I guess part of the problem is that Bastien got reassigned and might not
> care about the kernel anymore.
>=20
> Another part of it is that Jiri was CCed, but Benjamin was not.
>=20
> Ideally of course Mavroudis Chatzilazaridis, the culprit's author would
> look into this, but from a quick search on lore it looks like Mavroudis
> is not a regular kernel contributor and thus might not even know how we
> expect situations like this to be handled.
>=20
> > And on Bugzilla, other reporters replied that
> > reverting the culprit fixed the regression.
>=20
> From Takashi's comments like
> https://bugzilla.kernel.org/show_bug.cgi?id=3D218094#c33 it sounds like
> this can be fixed by resolving another regression as discussed earlier
> today here:
> https://lore.kernel.org/all/87edgjo2kr.wl-tiwai@suse.de/
>=20
> I think that might be the better solution, but Takashi, Hans, or the
> input people will know best.
>=20
> > FYI, there's similar Bugzilla report on [1].
> > [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D218172
>=20
> Not sure, that might be a different problem, guess Hans is the best to
> judge.
>=20
> > Also Cc'ed Linus.
>=20
> Linus can speak for himself, but I guess he gets enough mail already.
> I'd say in a situation like this it thus might best to not CC him;
> instead poke me when things apparently are not handled well, then we
> together can decide if it's worth bringing Linus in.

Thanks for the pro tip!

--=20
An old man doll... just what I always wanted! - Clara

--H3NzUQqbCh1SScdV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVy4CwAKCRD2uYlJVVFO
o6hwAQDJwHW1nvf9+9kCcFRLJXSQ035uhng/tqDMeN57360x4gEA6NvguDVyHdk6
F83qBtIantqdUnoyFGSPPq5jZj1f5gc=
=QE4O
-----END PGP SIGNATURE-----

--H3NzUQqbCh1SScdV--
