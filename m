Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AF61382
	for <regressions@lists.linux.dev>; Thu, 23 Nov 2023 01:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUJlk2OD"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-280260db156so349738a91.2
        for <regressions@lists.linux.dev>; Wed, 22 Nov 2023 17:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700702311; x=1701307111; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HRDfm5lmN9oWHrfQ6RGbONVD1D7o4JaIn9KZ+LQPA/I=;
        b=bUJlk2ODFbJHknoFFanXYKTbIla7RigSQH0Jkp17wt68S9Pbj5RA21atJkkZWPzeF3
         BAlniIv/onuZ6H2i4Z/6xufc13x0Gi8SqNXEClLvrQt5vFgumJTQJXRelKA0NfLaNVCq
         4366Z5QikNJY78wAqMOTf/3c9R59cjJBdmxSEdZgnIFR5Ku9HH5eXK36NJdSh5JW4cb8
         ULLi/4FlGodLNyXpbu2TURit41uBiekOKfAfw6kHsrhR2lLs4FOcpgzrzkmy4zVKJop+
         qc9PaO+RW59nM663Bbw9UeoXESZLVeBWwjlN7qy4+kaYpj33WreJpT3eQUYh30Sl4zoE
         qT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700702311; x=1701307111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRDfm5lmN9oWHrfQ6RGbONVD1D7o4JaIn9KZ+LQPA/I=;
        b=udYSebwcfcdGju7cQ/Zu3Ra01PW5d5h5w+BCBIa2pCMBFtzhkGEXfwyKOx4zWQHcpi
         fQ+L3EiJ8PzGhLHjR47Dl5Igk8px87jMPsGIwQBPjolVLUx4AMWneAfy/cGEPScz1BAc
         z26FMF1Ulu+RBm83YTPi5nWuwGVkjaxJ82zXbkL3SNIOpS0FXGNlliioTfuIOixh6i6k
         1R2FS98Sqsv179cjbiPDecqIUMar6A+DtxAU07D8Yw23n37gNoNfPb0ZJGsav0LqGzHK
         wRPAhIwjpD4pXUrVGd1K+4XDevbapbWobSDrfhw2KQfV189fMkvLKkv8RI5O/B23OB+3
         ODlA==
X-Gm-Message-State: AOJu0Yylp9YK4sHml38p4AZPow67mkLAXTHJNaU/fKFoEvEemgMUsnXN
	6Ttc3lDZkWJ3/nAp4z40nF8=
X-Google-Smtp-Source: AGHT+IGiPmnbiCr8qnLgZAg5BZ3NCj3W2Rf9JG7Dmc59vfKQewrzihV4UcH7z/Y6mGAULjLnD3YGLQ==
X-Received: by 2002:a17:90b:390e:b0:285:24bd:d8bb with SMTP id ob14-20020a17090b390e00b0028524bdd8bbmr4493019pjb.36.1700702311225;
        Wed, 22 Nov 2023 17:18:31 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id a16-20020a170902ecd000b001cf5d59c739sm44126plh.271.2023.11.22.17.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 17:18:30 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 4BED510207143; Thu, 23 Nov 2023 08:18:26 +0700 (WIB)
Date: Thu, 23 Nov 2023 08:18:26 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Chun Ng <chunn@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Regressions <regressions@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Ankita Garg <ankitag@nvidia.com>
Subject: Re: [REGRESSION]: mmap performance regression starting with k-6.1
Message-ID: <ZV6oYmVYsyYizvgg@archie.me>
References: <PH7PR12MB7937B0DF19E7E8539703D0E3D6BAA@PH7PR12MB7937.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oBSe3tCHKA7p0yt4"
Content-Disposition: inline
In-Reply-To: <PH7PR12MB7937B0DF19E7E8539703D0E3D6BAA@PH7PR12MB7937.namprd12.prod.outlook.com>


--oBSe3tCHKA7p0yt4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 08:03:19PM +0000, Chun Ng wrote:
> Hi,
>=20
> Recently I observed there is performance regression on system call mmap(.=
=2E). I tried both vanilla kernels and Raspberry Pi kernels on a Raspberry =
Pi 4 box and the results are pretty consistent among them.
>=20
> Bisection showed that the regression starts from k-6.1, and the latest va=
nilla k-6.7 is still showing the same regression.
>=20
> The test program calls mmap/munmap for a 4K page with MAP_ANON and MAP_PR=
IVATE flags, and ftrace is used to measure the time spent on the do_mmap(..=
) call.=C2=A0 Measured time of a sample run with different vanilla kernel v=
ersions are:
> k-5.10 and k-6.0: ~157us
> k-6.1: ~194us
> k-6.7: ~214us
> Results are pretty consistent across multiple runs with a small percentag=
e variance.=C2=A0 Ftrace shows that latency of mmap_region(...) has increas=
ed since k-6.1.=C2=A0=C2=A0An application that makes frequent mmap(..) call=
s the accumulated extra latency is very noticeable.=20

Did you mean that v6.0 doesn't have this regression?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--oBSe3tCHKA7p0yt4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZV6oXwAKCRD2uYlJVVFO
o3C7AP4snmZptoM1ihlFeB/5xpLDHZSoqPN2u/eqYYB2SY8R2gEAi5WXVXAcjnzt
x6LuHUALRKh0Ndw9CLixARM1Duf1hws=
=zXF1
-----END PGP SIGNATURE-----

--oBSe3tCHKA7p0yt4--
