Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094EB620
	for <regressions@lists.linux.dev>; Wed, 25 Oct 2023 00:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhspAG8t"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1ca74e77aecso2536575ad.1
        for <regressions@lists.linux.dev>; Tue, 24 Oct 2023 17:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698195398; x=1698800198; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=idCmePkmuapOmhTFu8C7IFO+GDsYxAan7/9IMTzaD9M=;
        b=OhspAG8tTKqyvutn4VyDjK3aMmwmksGHjnDAsiXdw+uuwkzTWxyfzibfz9BtXTlRJ4
         hDci4ok4vEOrsp9Jcn8YM6i76XIo7xrhWH3uGsLMreUY65FcIBvMyMdWvJYvfLJyxwYm
         /0DuNS8G3v/8K9cePWxg6s3BloaTUOqM8bJ/+FJR1G43bbFOuXXTa8VNYPCEWmVgVMKF
         Q+iylnjsxXxEJDJekJMcagMFFnQTfq5lLP0PX3HIvZbc2WJyzJYJcY72RdNjz+8LEQO9
         FZotBpfnP0a7OMQBm97SLb5H08GuDYzSqMRiw61RUKqRe4yLbFBP75bZFoUaWqLIYfc0
         QKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698195398; x=1698800198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idCmePkmuapOmhTFu8C7IFO+GDsYxAan7/9IMTzaD9M=;
        b=jI3umyse4buvxpAdZQtjbBf/SjckZFBAZppIA5biCwJJ+h0waOQtBiEWjizSFKIO1a
         ENjV/Wk86ExdodxC6vzOXSgELwu2HNDFwQuJxER62JXG9RjAT1HzJAOL2t1R1M3zT6V5
         yHtRJ/NQLXteHFRRDmQHFbK/PeYvZ3pnKcHefzlF1Jw6gciFaoLPi40rinXDb59k/Lwe
         QBHkYmhIJnGxOfk8dgF+rPkuq8p7rHoknudEhaHf2DEkR6BiEvLFRHGaBzv6vcHe6zYt
         NX4L+sRF4rBx1NdNxW0XjQ18uvD5VjCBXhvDW2tdSUgD2FERtBGHqUjohL3TQ806Ogeb
         dnUA==
X-Gm-Message-State: AOJu0YwAQy1ZzRgF6xnJzkEBovfTcRxiOdxMqnC2SmtLlb7kFSlxJquP
	SgfPsz/EsMLdZ5dTNm4sle0=
X-Google-Smtp-Source: AGHT+IGJgyhZvs/DxUdMPw6LHhjYzSVzjI+gdVIZdAFLgzhN4L4CKfQAIgUW6oEW7DPYNUXPlg8zzA==
X-Received: by 2002:a17:903:6cc:b0:1c3:868f:5958 with SMTP id kj12-20020a17090306cc00b001c3868f5958mr17419062plb.20.1698195397893;
        Tue, 24 Oct 2023 17:56:37 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id e17-20020a17090301d100b001b898595be7sm7917360plh.291.2023.10.24.17.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 17:56:37 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id C6D39819CFF3; Wed, 25 Oct 2023 07:56:34 +0700 (WIB)
Date: Wed, 25 Oct 2023 07:56:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Vladimir Smelhaus <vl.sm@email.cz>,
	Linux Netfilter <netfilter@vger.kernel.org>, coreteam@netfilter.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Subject: Re: Flowtables ignore timeout settings in recent kernels
Message-ID: <ZThnwhWD308vrkUP@debian.me>
References: <ughg4v$130b$1@ciao.gmane.io>
 <ZSyBtn8cplLWoNn-@debian.me>
 <ZTglADWVBgKxKOIC@calendula>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cM5L7aeMb6NeOAH/"
Content-Disposition: inline
In-Reply-To: <ZTglADWVBgKxKOIC@calendula>


--cM5L7aeMb6NeOAH/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 10:11:44PM +0200, Pablo Neira Ayuso wrote:
> On Mon, Oct 16, 2023 at 07:20:06AM +0700, Bagas Sanjaya wrote:
> > On Sun, Oct 15, 2023 at 09:56:14PM +0200, Vladimir Smelhaus wrote:
> > > Netfilter ignores the timeout settings for a flowtable
> > >=20
> > > # sysctl -a -r flowtable
> > > net.netfilter.nf_flowtable_tcp_timeout =3D 30
> > > net.netfilter.nf_flowtable_udp_timeout =3D 30
> > >=20
> > > Situation. A long udp connection (tunnel) with some data flowing thro=
ugh a
> > > router. The connection is sent to a flowtable on the router. It's a f=
ew
> > > packets per second, more here and there, a pause here and there, and =
so on
> > > over and over. The pauses are minimal and are also limited by the tun=
nel
> > > settings to be no longer than 25 seconds. Everything is satisfying to=
 make
> > > the connection last continuously in the flowtable and not reappear in
> > > forward. However, the connection keeps dropping out of the flowtable.=
 It
> > > stays in the flowtable (offloaded) for a second at most and then it is
> > > kicked out, back to forward.
> > >=20
> > > In an attached test script you can see counters that should be zero b=
ut are not. If I watch the normal packet flow on a particular router, I can=
 see packets in the conntrack table that should be OFFLOAD as ASSURED.
> > >=20
> > > Tested in kernel 6.5.6. In an old(er) kernel 5.10 it works as expecte=
d.
> > >=20
> >=20
> > Then please perform bisection to find a culprit that introduces your
> > regression (see Documentation/admin-guide/bug-bisect.rst in the kernel
> > sources for reference). Also, it'd been great if you also post the
> > reproducer script inline (within your email) instead, as some MUAs
> > (like mutt that I'm using now) may ignore the attachment.
> >=20
> > Anyway, thanks for the regression report. I'm adding it to regzbot:
> >=20
> > #regzbot ^introduced: v5.10..v6.5
>=20
> Fix here:
>=20
> https://patchwork.ozlabs.org/project/netfilter-devel/patch/20231024193815=
=2E1987-1-pablo@netfilter.org/
>=20
> it is a bug from Jun 2023, regression was introduced in the v6.5
> development cycle.
>=20

Telling regzbot:

#regzbot fix: netfilter: nf_flow_table: GC pushes back packets to classic p=
ath

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--cM5L7aeMb6NeOAH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZThnvgAKCRD2uYlJVVFO
o8J0AQD7MDH2zNbKZM6ZlcvUYRSmRK0rvX6lR+6/MFllgRlZnAEA7GV4EePorg3E
0xZhimBiax8M/oW2TAW86qCo9VyAegY=
=3CKf
-----END PGP SIGNATURE-----

--cM5L7aeMb6NeOAH/--
