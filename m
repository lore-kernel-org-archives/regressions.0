Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E832D7F
	for <regressions@lists.linux.dev>; Wed, 13 Sep 2023 00:28:37 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-68fb85afef4so2671411b3a.1
        for <regressions@lists.linux.dev>; Tue, 12 Sep 2023 17:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694564917; x=1695169717; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vhVRggmduCOuF925CMHCHBXtEyOEK3orQpWlelUcV6E=;
        b=H/MW0X1Sj70XJoDHeijszIeJU0BaOThdVc4H1iQLluh1A4iDtlUlCLnHlsfkueUgmL
         3erFZMmMXg6FkyrMw13H/J5NAByUzQyzYxbRxOYrk/9Hmk8ezIW2AsmJW9Iw743ZXjM8
         RSggesgW3mjEUsCFwqKv3j5DDPqKosQ8RcjduYLmpjWS9+jAG96pQt7QqcCWr3DRVRMT
         HhY33haP0858w63F4Zk5tC6DOuYGpJoOrjKeaVfK8mCRZRIaK350KmENohDVsYVxnuvW
         ggPJltzq2QTn8oEt2A3SyMaySuX3KVL4ZDJCHDp1lQp/7GheW1VWu7ph4vFxlwRw1q/h
         0ukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694564917; x=1695169717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhVRggmduCOuF925CMHCHBXtEyOEK3orQpWlelUcV6E=;
        b=hDf+dUgoJr3iy6p595TJuvoOnjTr4GWeA/3+b8/d3kRlLqAQwKADPoChssCfl9LWOI
         hPEtZog0G1u9kBwPRfIlNc5q3Hqb2p/D+u5BSNI12RW86kV1rBREyX3LFT2z8F5lHC40
         cAq6XXfvUN/l6HOp6flmx63Q0WylXP4RYd3Zvsh9hJFI9MEsNJ6PuFNiQXOXkFjml9Vu
         56Ag7VdA47RWXoBFHAnfh4yfJcASkc1Pvan0GKIhbH8FsT3wLUjMUTRYTlIR7bD7ol/w
         dBA5JkGqJEDlQareJK71tNyyWpdcoATt5JapYr6XfvXa554e8QwesmoiW/1AcxlCRSF4
         Xaqw==
X-Gm-Message-State: AOJu0YzH0YTIOyFpXk3wlY5SdSPub0yJD1100o3gRz/4Ex2fZAkSBUS+
	/XOpUs6aVKeA+qnlEy6sA3I=
X-Google-Smtp-Source: AGHT+IEBZnQLXEt0KIbDgCMgCEh4GuL17Auf1WF5BNJZ8qXAnnanaFv1TrLKJDks+1AinRVyeTf32Q==
X-Received: by 2002:a05:6a00:178c:b0:68e:482b:5a9d with SMTP id s12-20020a056a00178c00b0068e482b5a9dmr1592567pfg.8.1694564917147;
        Tue, 12 Sep 2023 17:28:37 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id cl8-20020a056a0032c800b0068fb783d0c6sm5234168pfb.141.2023.09.12.17.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 17:28:36 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id DEF7383061BF; Wed, 13 Sep 2023 07:25:54 +0700 (WIB)
Date: Wed, 13 Sep 2023 07:25:54 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
	Linux PARISC <linux-parisc@vger.kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: Possible 6.5 regression: Huge values for "commited memory"
Message-ID: <ZQEBkjSgdXSOMq3t@debian.me>
References: <1694366957@msgid.manchmal.in-ulm.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z/ZVDhp9NzC+/dQk"
Content-Disposition: inline
In-Reply-To: <1694366957@msgid.manchmal.in-ulm.de>


--z/ZVDhp9NzC+/dQk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 10, 2023 at 07:48:23PM +0200, Christoph Biedl wrote:
> Hello,
>=20
> For the time being, just an observation: I monitor various parameters on
> my systems, and among them is "Committed memory", the Committed_AS value
> in /proc/meminfo.
>=20
> Since upgrading to the 6.5.x series, I noticed the value there grows way
> higher values then previously in hppa, even if the machine is idle.
> Values seem to rise up to around 1.6 Gbyte, long-term average is rather
> 200-300 Mbyte. Also, I cannot see any memory hogs in top. The workload
> hasn't changed in months.

Upgrading from what version?

Also, can you describe your setup? And what is the value of `Committed_AS`
on the kernel before you upgrade? (Hint: paste full /proc/meminfo from
both old and new kernel.)

>=20
> To sum it up, I reckon something went wrong in the memory usage
> accounting. Is this already on radar, or should I start bisecting? That
> might take a lot of time, though.
>=20

You can certainly do bisection (see Documentation/admin-guide/bug-bisect.rst
in the kernel sources for how to do that).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--z/ZVDhp9NzC+/dQk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQEBjQAKCRD2uYlJVVFO
o8oPAQCr9xeAJQEx9/dp7rTccFhd5ag5yJt8QisGJVRhdwx9EgD9HuyG6/uCcvwy
gP90l2jBVPt1HLUeUt6BY7VMcLZvPwg=
=C/3F
-----END PGP SIGNATURE-----

--z/ZVDhp9NzC+/dQk--
