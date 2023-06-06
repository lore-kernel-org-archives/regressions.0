Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D527F
	for <regressions@lists.linux.dev>; Tue,  6 Jun 2023 01:36:01 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-390723f815fso3073982b6e.3
        for <regressions@lists.linux.dev>; Mon, 05 Jun 2023 18:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686015361; x=1688607361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XpR3P96jv7SCbbRT9L5gH5HvCTvECFvcY1akf5QQvZI=;
        b=ZgnMWNz7zw07iop91hw4lWFpbR/jj8HOAVd8tmOEFdyhyQFdn+zGX23B89n9IbVy9U
         kJemcIDDqBGZz//Mq5LC980MwTFBmQQcrkjyRdv+iTfj2qCYp7Kt9m7uAu7lTt56vhEO
         bJPFKRarCj0tSS5IJNCxgiGNoaGwCFjvDuh3iHbDg0QA1urjm14KAQDIxm4D26VhGEyH
         xH3PRchBfbdyBB8tD6hmgxvCFeOI1RcwdS2FFR6tRWhsuIpjq+ZKjxU8t48a1djVC+cw
         1Q2TAwm87bReqjiKnrTFqbhtlyosX7iR/tGfi05XUKXlkaMij1SqSrVG1AziMxSf4Qi3
         bjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686015361; x=1688607361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpR3P96jv7SCbbRT9L5gH5HvCTvECFvcY1akf5QQvZI=;
        b=hL8z+KiDYSnlgPE5MAsP5pJx/hZNCwtFYre5AzGlxztlO3LVL8u6XBCQXGh3QUfaho
         LdJEy/uSblo4SZ9c8MYEcXxFh9eCPOEbGuPWfZsxdV8gVbcL5d/J8OLiyS4sJE+M4wvv
         h7LDDCLqnqfxwEtWotUSR7QfJz/dPFzJVM539gFiCaHzz1DsiRuE3a5BuymWTZ7rC5gW
         WEINF3h9tU4gp6QVxcZvs9xDCseh95Qn4MEFaFQd9p7LSC3vh69JBM6fNzxdqtfLyNuT
         FZPrt7LHfg/4Qgjyz+NSD+x+c7bDOZS/lAwtYLDN8twPkkqRQwp/91+To1Azul/eEm/f
         Ju7Q==
X-Gm-Message-State: AC+VfDxXxL984Nn80BZqPpkRWkFPtUqznUlaHMJqur6u5ppTM+AGKHDg
	LuhhJ6vOh47ghBENlnmwPcw=
X-Google-Smtp-Source: ACHHUZ5oS6qs4j0ZcaYF5n2D3KQf9+yBhNSKgYie6iczVtetpf7zaE0ckCqefaWMmXgCdyVT5d6mTw==
X-Received: by 2002:aca:f1a:0:b0:39a:ca93:53d2 with SMTP id 26-20020aca0f1a000000b0039aca9353d2mr322736oip.10.1686015360840;
        Mon, 05 Jun 2023 18:36:00 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-36.three.co.id. [116.206.28.36])
        by smtp.gmail.com with ESMTPSA id 3-20020aa79243000000b0065a1b05193asm2549852pfp.185.2023.06.05.18.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 18:36:00 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 0C10E1069AF; Tue,  6 Jun 2023 08:35:56 +0700 (WIB)
Date: Tue, 6 Jun 2023 08:35:56 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Kernel Network Developers <netdev@vger.kernel.org>,
	Linux Real Time <linux-rt-users@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Paolo Abeni <pabeni@redhat.com>, SamW <proaudiomanuk@gmail.com>
Subject: Re: Fwd: commit 6e98b09da931a00bf4e0477d0fa52748bf28fcce suspect
 causing full system lockup
Message-ID: <ZH6NfCe-WbvukFsJ@debian.me>
References: <9f12c322-fb62-26f0-46d1-61936a419468@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NLJN2ITb1fArYsZS"
Content-Disposition: inline
In-Reply-To: <9f12c322-fb62-26f0-46d1-61936a419468@gmail.com>


--NLJN2ITb1fArYsZS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 02, 2023 at 09:27:48AM +0700, Bagas Sanjaya wrote:
> Anyway, I'm adding it to regzbot:
>=20
> #regzbot introduced: 6e98b09da931a0 https://bugzilla.kernel.org/show_bug.=
cgi?id=3D217519
> #regzbot title: Networking pull for v6.4 causes full system lockup on RTL=
8111/8168/8411
>=20

Closing as there is already a confirmed fix (see Bugzilla):

#regzbot resolved: d6c36cbc5e533f

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--NLJN2ITb1fArYsZS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZH6NdwAKCRD2uYlJVVFO
o+7tAP0a3YFgJGGHZy3B4JvneA+tB3lEMl8UXLMzavt/BnCnUQD9GbssiUMLtzBb
dC8nEXgn6KRFlEoGuT2zpF7hOzycJA0=
=KTvF
-----END PGP SIGNATURE-----

--NLJN2ITb1fArYsZS--
