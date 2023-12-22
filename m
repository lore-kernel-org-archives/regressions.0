Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8694199A4
	for <regressions@lists.linux.dev>; Fri, 22 Dec 2023 13:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RewM/vpf"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d3e8a51e6bso14958415ad.3
        for <regressions@lists.linux.dev>; Fri, 22 Dec 2023 05:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703251381; x=1703856181; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aYxof2/rTBfFuSZEZhakbi3xLEy7HENc6qarIC+O1fw=;
        b=RewM/vpfQxX1acMtglrT7GmT+DPApxAndXBIEyLevmN6kHCquOr+y3O4icMPGldqfe
         zCAI9p/1EYUbynVEdtgGlh/0fPhI+oX5NahHstW5o6M9xmPSQcPyy4nKCVFVuzSzm7/p
         vrYPf/TdfpfBIdrwcPzBeJ3+i9qSQZ3FHxYFsE0RC4LXKj4g+ZXKyMQDxstNYhPw2O8P
         JBH+5ZlqpGMM8PXUtozVEDkxNjJOsDT7IS3W0llPsyNj0ydRW+cNgL7sLiVzQc2gwn7N
         9uNJGjRDb12jRloPAD+VIkyJXFXG2B5ABxXYAKMc2XCJZBIxOLXfnyB2U577b5d6X4ZS
         WW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703251381; x=1703856181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYxof2/rTBfFuSZEZhakbi3xLEy7HENc6qarIC+O1fw=;
        b=aVq/Nl5MXEDLMl3LIfT7vG0EEh6fh90wyChjw6/YIiDSmO7GcIVSiAg1r+8yVm/oAh
         81vRiN9ENSQX15LxcteqorY/2SVDscUnl5xtcleQgDLcZEstlbWF5G6eyN4IRltweNow
         klO8WdZYW3M1Kx1t9KqMf2Q18JV3inho+N5y7eyeY6Im+HPZvk26v0hlfZqLzJJTG3eN
         GFt8GJKbawvznR2hrZQsccqEXM166PrbUQspJBFkDZHq0GNMSqZUxTrIG6zBArOFLT4e
         HvMw734eBGYTQ0rIVJx1gT/e4Xk+pvMjXpZWUens1gCrsNbOJ/cyoh7gOMJDGwnCGCE+
         o5GQ==
X-Gm-Message-State: AOJu0Yzuh7CdKfkNf4JNLUXaBrMax/QgwlZBXTshiU3VqqbhlCjVs8PZ
	8oASEIfroiMh8nBhJkHVUts=
X-Google-Smtp-Source: AGHT+IFY3LdkSyu7KV8Q3eOvxgBVMkcej97B64oi77ewLqhVFu+FPFkbdufWDS/BiO5IR/VhOeo+tQ==
X-Received: by 2002:a17:902:6844:b0:1d3:eb97:9446 with SMTP id f4-20020a170902684400b001d3eb979446mr1208172pln.9.1703251381180;
        Fri, 22 Dec 2023 05:23:01 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902748900b001d3e13dc9c4sm3434304pll.162.2023.12.22.05.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 05:23:00 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 854B51024D744; Fri, 22 Dec 2023 20:22:55 +0700 (WIB)
Date: Fri, 22 Dec 2023 20:22:55 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Dan Moulding <dan@danm.net>
Cc: Alex Henrie <alexhenrie24@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] net/ipv6/addrconf: Temporary addresses with short
 lifetimes generating when they shouldn't, causing applications to fail
Message-ID: <ZYWNr_4P-je2uVDe@archie.me>
References: <20231221231115.12402-1-dan@danm.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vni8xhQwWxIq5ZfM"
Content-Disposition: inline
In-Reply-To: <20231221231115.12402-1-dan@danm.net>


--Vni8xhQwWxIq5ZfM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 04:10:57PM -0700, Dan Moulding wrote:
> I started running v6.7-rc5 on a desktop and began having problems
> where Chromium would frequently fail to load pages and give an
> "ERR_NETWORK_CHANGED" message instead. I also noticed instability in
> avahi-daemon (it would stop resolving local names and/or consume 100%
> CPU). Eventually I discovered that what is happening is that new
> temporary IPv6 addresses for a ULA address are being generated once
> every second, with very short preferred lifetimes (and I had an
> interface with thousands of such temporary addresses). I also found
> that it seems to be triggered when one of the devices on the network
> sends a router advertisement with a prefix that has a preferred
> lifetime of 0 (presumably it's sending that because it wants to
> deprecate that prefix).
>=20
> I bisected it to commit 629df6701c8a ("net: ipv6/addrconf: clamp
> preferred_lft to the minimum required"). Upon reviewing that change, I
> see that it has changed when generation of temporary addresses will be
> allowed. I believe that change might have inadvertently caused the
> kernel to violate RFC 4941 and might need to be reverted.

Can you verify that by actually reverting 629df6701c8a91 on top of net
tree?

--=20
An old man doll... just what I always wanted! - Clara

--Vni8xhQwWxIq5ZfM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZYWNrAAKCRD2uYlJVVFO
oxAMAP9lltebRi7sgtxnXr9tOtoEH00eLNEKjA5Xx/oeq4m7cQD+PrCMNymm/dwF
wf9vH36BMIISVma6/Mlh804YTHD2DgQ=
=H5nD
-----END PGP SIGNATURE-----

--Vni8xhQwWxIq5ZfM--
