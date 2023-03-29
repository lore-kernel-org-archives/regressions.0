Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54191865
	for <regressions@lists.linux.dev>; Wed, 29 Mar 2023 08:40:48 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id h14so8816226pgj.7
        for <regressions@lists.linux.dev>; Wed, 29 Mar 2023 01:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680079248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T4nFg4zKMGojw1a9EUgiYrx0HzwuMwAbekbAVn3z66s=;
        b=V4fUz5/MNZNeW1jMG5OcBY4Tpy3nx8pejz1mjjui8TMA8VFc8VTH90eQvkJxcjRK+q
         qGiV1pS07CiLbAP1AaqcNcR+CoYmiHz3aZBc6RmMTnufrnZ6yrYnW4l/SIZ90x2tR/yq
         qqU6ywlIXlm77nooDOXfDuoT3iClb8PMr6I1sD5GBrc4Q6n7UX12trb5um9753Y5CujO
         +tDQgOFl8OCqHAMWEKeuPO39s8ChLyRfjgHKDCOX05VAKhPocYKkTbV8Op1lo6XSMZdX
         lWPnb20TOnLVjnx/2CNWpkIL6ykc6HjvCCGA1S2Efsb6Jw5jbbX3GUMSCnZf1kBiJS/e
         Ik1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680079248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4nFg4zKMGojw1a9EUgiYrx0HzwuMwAbekbAVn3z66s=;
        b=13x8+uCDN6+LOuAcYTk3hQaSHJF+VxaFLcJWGQFYftBQ2Pf4AEbU7wN0TAwqqy0WdH
         tOmB3Z/xVBzm7Z7KbxF7TccN4ZMojjHEywx7RqGeWf5ynXrZCzHQDIo+xp9nEbUcsLAu
         yGnYNFKM3Pqmqcgr3dur/i2T8nOA9Y+PRfm0SXgaQ1ol/LQPGREdiHuaR6s1bo90+T/b
         HHyqWLgAr20iSKNYz9pntlkt7zINJGxKQRno6KDUjVOBzY//WRiU2Yai0+jBAfoVm4AP
         DY9m+6ZmIhuQ8wW7+Wq6t56SkCkrzy9DUXvy4mGoiso6D+a2b2Mi9Jig1mYa8Dt1iKQ5
         t//Q==
X-Gm-Message-State: AAQBX9ftvTzPlOXuGHrBjrfv2h3LCCMF45cVTrBgzTtmtuCLLkgwrIVu
	OOjf+K/mAbyEQIop9DXJbCqPnqomTsw=
X-Google-Smtp-Source: AKy350ZeSdakn87GYUZYeIzq/R0++5i4nskJlkhQzoG11bTfiOXNzxI+PTUP/mlACh8Rh4Eqqw7oCA==
X-Received: by 2002:a62:5254:0:b0:626:286d:b701 with SMTP id g81-20020a625254000000b00626286db701mr17920670pfb.20.1680079247947;
        Wed, 29 Mar 2023 01:40:47 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-15.three.co.id. [116.206.28.15])
        by smtp.gmail.com with ESMTPSA id a25-20020a62e219000000b00590ede84b1csm23173046pfi.147.2023.03.29.01.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:40:47 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 8D8D4106705; Wed, 29 Mar 2023 15:40:44 +0700 (WIB)
Date: Wed, 29 Mar 2023 15:40:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>, Takashi Iwai <tiwai@suse.de>
Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>, netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Intel-wired-lan] [REGRESSION] e1000e probe/link detection fails
 since 6.2 kernel
Message-ID: <ZCP5jOTNypwG4xK6@debian.me>
References: <87jzz13v7i.wl-tiwai@suse.de>
 <652a9a96-f499-f31f-2a55-3c80b6ac9c75@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cyVgV9qP40t8gPzM"
Content-Disposition: inline
In-Reply-To: <652a9a96-f499-f31f-2a55-3c80b6ac9c75@molgen.mpg.de>


--cyVgV9qP40t8gPzM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 04:39:01PM +0200, Paul Menzel wrote:
> Does openSUSE Tumbleweed make it easy to bisect the regression at least on
> =E2=80=9Crc level=E2=80=9D? It be great if narrow it more down, so we kno=
w it for example
> regressed in 6.2-rc7.
>=20

Alternatively, can you do bisection using kernel sources from Linus's
tree (git required)?

--=20
An old man doll... just what I always wanted! - Clara

--cyVgV9qP40t8gPzM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZCP5hgAKCRD2uYlJVVFO
oyl2AP4j+bMThihDAhQDsVmg3q4Dgn/R1Tm/T9ALIQekbXtkvwD+IWh8158WgO5h
qOc7nN3lZwaB/V+HxGXv7L6aRMBQ3A4=
=4fBA
-----END PGP SIGNATURE-----

--cyVgV9qP40t8gPzM--
