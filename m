Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346BC163
	for <regressions@lists.linux.dev>; Mon, 16 Oct 2023 00:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+dcuAjT"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6b497c8575aso2211398b3a.1
        for <regressions@lists.linux.dev>; Sun, 15 Oct 2023 17:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697415612; x=1698020412; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J7+oJHozaJp3ARwDpXhkbVM/mB5nFnC7YhE1nMQs+T4=;
        b=S+dcuAjTO+kLoXLMZVQRGs6i7Bmzwg+hYChZNd8EK9Xo9GhUp7+5GKUEX9VCjFXVVQ
         cnRXYDPk7KEqv9veV3Ojj53fERSuhe8FQ9psYYnuln3j0k3Jq6L3o8kyvwOqZ18DYqp2
         XZGAggSLu8FdR4s4rP+pYjhKcMwkEZjLqLf6Lqi90FsCsClxZHf9EjQgICgm/+MJJV42
         CKiQZ+f1n35di0sUgb8orkbdXKH3X9g7sE9zQAW51Gdhz6+Gt8itizsNmur35abDBhFL
         wNw6piSr1sC/797Nxwh4RaDEMG0v4s/brRAJmtWh8A2keeCa4JFGGDoGmARO+DLwQV8x
         6Sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697415612; x=1698020412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7+oJHozaJp3ARwDpXhkbVM/mB5nFnC7YhE1nMQs+T4=;
        b=BktPORcmxUzAwOu7oJTohfvheSJ+IMlg0ufpnD0Cuibm0+xKLJ+cnJg8dseH2YVjT5
         kPcB84kWkPxYFc/XpO8XHwrPqDx3pcKjxI8mpn5HX6yykjrXkoykSEJDSNd5OJGrniHL
         AYY1175KPULGURskdcD2QB6v1J3yS4D4jjB5xOqPb/WfJ3vpNGEjV9duDhnFbCjtpQHI
         bC0DvMfY82CwtAMgCp04cBxhvreTFPbzn2L79HvNGPj2fTkR2klsnjJp7Pmh0PoZ8fem
         bRU6IIfToaywizjxhLVy0ST7YTZap+0Rqs2GhlKZLMRVyeci6tP8KeBYywC1dTNA7CN+
         XWCA==
X-Gm-Message-State: AOJu0Ywm/ksO7WcZxz+95ACVVTaPGxst9CWJAcnS/UcwjLklPhzn2IsV
	oi/sqBqh1SwXIXZMvj0LEQ4=
X-Google-Smtp-Source: AGHT+IH2laczeXL+VN9BrWY3NVZ8iTr+4c1jER2bvqsu4716PkKX0BkrL3EJtryJWJwyVs5iZp4OAg==
X-Received: by 2002:a05:6a20:7f95:b0:140:3aa:e2ce with SMTP id d21-20020a056a207f9500b0014003aae2cemr43344864pzj.42.1697415612184;
        Sun, 15 Oct 2023 17:20:12 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id x6-20020a170902ec8600b001c44c8d857esm7208939plg.120.2023.10.15.17.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 17:20:11 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 3520A801B59F; Mon, 16 Oct 2023 07:20:07 +0700 (WIB)
Date: Mon, 16 Oct 2023 07:20:06 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Vladimir Smelhaus <vl.sm@email.cz>,
	Linux Netfilter <netfilter@vger.kernel.org>, coreteam@netfilter.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Subject: Re: Flowtables ignore timeout settings in recent kernels
Message-ID: <ZSyBtn8cplLWoNn-@debian.me>
References: <ughg4v$130b$1@ciao.gmane.io>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N2rAuLPZGqdFV0iZ"
Content-Disposition: inline
In-Reply-To: <ughg4v$130b$1@ciao.gmane.io>


--N2rAuLPZGqdFV0iZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 15, 2023 at 09:56:14PM +0200, Vladimir Smelhaus wrote:
> Netfilter ignores the timeout settings for a flowtable
>=20
> # sysctl -a -r flowtable
> net.netfilter.nf_flowtable_tcp_timeout =3D 30
> net.netfilter.nf_flowtable_udp_timeout =3D 30
>=20
> Situation. A long udp connection (tunnel) with some data flowing through a
> router. The connection is sent to a flowtable on the router. It's a few
> packets per second, more here and there, a pause here and there, and so on
> over and over. The pauses are minimal and are also limited by the tunnel
> settings to be no longer than 25 seconds. Everything is satisfying to make
> the connection last continuously in the flowtable and not reappear in
> forward. However, the connection keeps dropping out of the flowtable. It
> stays in the flowtable (offloaded) for a second at most and then it is
> kicked out, back to forward.
>=20
> In an attached test script you can see counters that should be zero but a=
re not. If I watch the normal packet flow on a particular router, I can see=
 packets in the conntrack table that should be OFFLOAD as ASSURED.
>=20
> Tested in kernel 6.5.6. In an old(er) kernel 5.10 it works as expected.
>=20

Then please perform bisection to find a culprit that introduces your
regression (see Documentation/admin-guide/bug-bisect.rst in the kernel
sources for reference). Also, it'd been great if you also post the
reproducer script inline (within your email) instead, as some MUAs
(like mutt that I'm using now) may ignore the attachment.

Anyway, thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: v5.10..v6.5

--=20
An old man doll... just what I always wanted! - Clara

--N2rAuLPZGqdFV0iZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZSyBsAAKCRD2uYlJVVFO
oxD9AQDAp/pXr+d44wTxEyg9copCJnaEVKIixfFsamXwbWpI/QD/W2ZAb9J8yPcv
V/en2pgBB1CgZDhm7JzlxcWUrsKROwM=
=u4d8
-----END PGP SIGNATURE-----

--N2rAuLPZGqdFV0iZ--
