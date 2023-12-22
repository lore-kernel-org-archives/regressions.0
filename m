Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1E7F9D6
	for <regressions@lists.linux.dev>; Fri, 22 Dec 2023 09:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NMVZEqPI"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d3e8a51e6bso13545895ad.3
        for <regressions@lists.linux.dev>; Fri, 22 Dec 2023 01:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703237709; x=1703842509; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wwPu6jjtuGsrJCEXn679QmZIcAlxcsMnJvedEVXZ1AU=;
        b=NMVZEqPImFvXGet0xT/aTTMeMrLCMk4PY2KDDDWmHuA5XI/DpTyw3+OSvb84jjohtL
         aOaha2lpgPTUkpqasAE4CvBYzpT3hWZBVenvJi80py9msErIamDLL93QqBfLglPVCTFh
         fuhje7fARa/ut4zOMiANbAmLkZV/B7Y8ZzvmpU0sIQOlyvAglQAodN9QiZa3kJCRmE3f
         eCppJ4cWocPvdWpy2GR5gJa/l/1YiiZVBy6Atf0QhV5FnNx+Rscfw3o7jh0UZn7oL8MC
         5UN0fhNMYXKMF/RHlQYIu13R5yKSdMsAp2W5KHJhtQtQXt26foSyvMgWRaHq5Q2jRcuq
         9Iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703237709; x=1703842509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwPu6jjtuGsrJCEXn679QmZIcAlxcsMnJvedEVXZ1AU=;
        b=Gdp2WkNcO8cEuZYn/nsKGe8wzA1tIgEtG/9qtz3M0TSAANJhz2dSxwUftCM4pbGhT+
         +FO6MDMdgrfxPwl7aGf7ageTOQRvchnwRI8Bc+hZurSgOWwlcHaDhjnlJldw4zipUfvm
         v/uLk2PjJyLuKMy+bVRddu9/Harv3ekdl/HsiqJjLgnyqNXt33akzBBLhNbLPlRYp7wI
         HMUKYWX7sN3C7CJa0BA6KuV9eDoc0sBU1OplpPiKo6pSJOD+frC6IqfXUOpCWQXEVPK2
         AUyv7IQvu7kUuF+Xbjfg7X4ijVagjx6sBkuF0h9qoYyE5SiBhA/E6c1667YH1vSpMm3H
         ZrgA==
X-Gm-Message-State: AOJu0YyDg9Vt+WZzovyPsD8jQRQMmdXyhrfvgATrnoKFks6pqLHmB8OP
	N4Dizn8klRF1KQL/HGSsIf8=
X-Google-Smtp-Source: AGHT+IGOqVOFAzemBdD47i50Yv4SnhOpn/HJacgaR7nR0TGc5qK7EjVKm+ZdkY4r9TiwFo0WCBbVEQ==
X-Received: by 2002:a17:902:d584:b0:1d3:62b9:838a with SMTP id k4-20020a170902d58400b001d362b9838amr1081319plh.132.1703237708854;
        Fri, 22 Dec 2023 01:35:08 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id g5-20020a170902868500b001d096757ac1sm2997245plo.47.2023.12.22.01.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 01:35:08 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 201151192C10C; Fri, 22 Dec 2023 16:35:04 +0700 (WIB)
Date: Fri, 22 Dec 2023 16:35:04 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Chris Rankin <rankincj@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Networking <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Yue Haibing <yuehaibing@huawei.com>,
	Leon Romanovsky <leon@kernel.org>,
	Qingfang DENG <qingfang.deng@siflower.com.cn>
Subject: Re: Does Linux still support UP?
Message-ID: <ZYVYSBKhc-uvO8_o@archie.me>
References: <CAK2bqVKCdaD6-PZi6gXhf=9CiKGhxQM_UHyKV_onzDPnhbAmvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BGJpeMhm1VRD5QR7"
Content-Disposition: inline
In-Reply-To: <CAK2bqVKCdaD6-PZi6gXhf=9CiKGhxQM_UHyKV_onzDPnhbAmvw@mail.gmail.com>


--BGJpeMhm1VRD5QR7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[also Cc: netdev folks and get_maintainer output for include/net/neighbour.=
h]

On Thu, Dec 21, 2023 at 11:12:34PM +0000, Chris Rankin wrote:
> Hi,
>=20
> I have an ancient i586 UP machine that happily runs vanilla Linux
> 6.4.16, but which locks up shortly after booting vanilla 6.5.0. The
> kernel *seems* to run into trouble as soon as the networking layer
> becomes busy. However, its SysRq-S/U/B sequence still seems to work as
> expected and so obviously *something* is still responding somewhere.
>=20
> This problem still exists in vanilla 6.6.8.
>=20
> FWIW I have raised this bug in bugzilla:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D218296
>=20

To be honest, you need to bisect. For reference, see
Documentation/admin-guide/bug-bisect.rst in the kernel sources.
Since you have problem with your old machine, you may want to compile
the kernel (which is a prerequisite for bisection) on faster machine,
then transfer the kernel image + modules into your old machine to
be installed there. Without bisection, no one will look into this
regression.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--BGJpeMhm1VRD5QR7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZYVYQgAKCRD2uYlJVVFO
ozJkAQCKyHu9R9zl9W8ZRbFK01mKcm88orrgBonnDmeisJzNAAD7BKlWE/dbnM/p
BujSYdzYOoj3yK4CuQ/N4D/7kUqCAg8=
=Pvek
-----END PGP SIGNATURE-----

--BGJpeMhm1VRD5QR7--
