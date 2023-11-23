Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C62D17D1
	for <regressions@lists.linux.dev>; Thu, 23 Nov 2023 05:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAg6+A0v"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5c27ee9c36bso355475a12.1
        for <regressions@lists.linux.dev>; Wed, 22 Nov 2023 21:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700716065; x=1701320865; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yY1sQyyb1uhz9MfrFnoGi87QF1jG7op21D45vYKRwfA=;
        b=GAg6+A0vrHg9ccuGEHN1jlxO5CkDDZCeeTfq6fx7bUDdH9HRq4so5cM0tR17/NLPhe
         uMSUeLhD9YLyroETg+eC9DdoVxMFTVmMeiqzDrXq5RSupDm4/Cz2NAIQ2mVGf9VmDoaG
         2kntPQ1jXlMCURRHGwuiYHfGdGihS8q1xIs7TaOAiYp/Du1mYKMBJwBm7SsmUXeElnCQ
         OvBrQqypi+BFk4G/i9GCKyqqVsquVlKqBObEyIloRfWpcS+MmeeSqFc5Cba/gWILcwIQ
         fiu+QVn5OmHf8mTG/UX/ywOGrIJ93vW095RL5vhBYKnWxY+/5u+pcJ1kEvWA1Smi7tU3
         Wilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700716065; x=1701320865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yY1sQyyb1uhz9MfrFnoGi87QF1jG7op21D45vYKRwfA=;
        b=DOVixHCYTsFeVdXXijQZfu2Ep32NTFOP8xo7VsEb9CWW4vDNY3uMpYSN+lLC7nBTSn
         X7yQNO/aQSCrQAJ07EJFUzYZcMVIWaV5nKW6d++wKys+DEd+YgiC2Y5tXjCubZUVdW1d
         wADfFXcBFcCHXDuMH2xMY1uiuNuSm3giO8gCsbI/Niz/MCtQYIHBBtkccJ/lyNK+r+Nk
         /OcS1sEKY865JZ0tAS5I1nNde4RGiqrs6AX7g0IeglCiBK1EQ8DRYlbGh54zFlFWo5/w
         DBi9PS1PllpYSxuBCrTrIAkxC7SFFQgowkrer4fQiDpfs2JwjQfst05A9AD9Gyc9XmQn
         /Q/w==
X-Gm-Message-State: AOJu0YwaXafO5lg52mwkRIfT+lm1g9VCdGEg3c3dpMVb32T86kHez+T8
	P4TFxM7HLgG10pyQKBoR2zU=
X-Google-Smtp-Source: AGHT+IFz/3lXGWiwZTSBkr7qB201/vdd5nMWHrqRynwT5rXxDA/xIdUgmfyt7Xq43WHYUvn3g18qgA==
X-Received: by 2002:a05:6a21:3008:b0:187:a119:908f with SMTP id yd8-20020a056a21300800b00187a119908fmr4115371pzb.3.1700716064558;
        Wed, 22 Nov 2023 21:07:44 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id i15-20020a17090a2acf00b002839679c23dsm432002pjg.13.2023.11.22.21.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 21:07:44 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id CE5B010207143; Thu, 23 Nov 2023 12:07:40 +0700 (WIB)
Date: Thu, 23 Nov 2023 12:07:40 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Chun Ng <chunn@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Regressions <regressions@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Ankita Garg <ankitag@nvidia.com>
Subject: Re: [REGRESSION]: mmap performance regression starting with k-6.1
Message-ID: <ZV7eHE2Fxb75oRpG@archie.me>
References: <PH7PR12MB7937B0DF19E7E8539703D0E3D6BAA@PH7PR12MB7937.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KIdW2yF7ZM5mmI7P"
Content-Disposition: inline
In-Reply-To: <PH7PR12MB7937B0DF19E7E8539703D0E3D6BAA@PH7PR12MB7937.namprd12.prod.outlook.com>


--KIdW2yF7ZM5mmI7P
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
>=20
> Please find the ftrace results and kernel config files in this folder:
> https://drive.google.com/drive/folders/1qy8YTBqxu8Gdbs7IigYbSd4FXldId5sd?=
usp=3Ddrive_link
>=20
> The test program can be found in here:
> https://drive.google.com/file/d/1tG6_BbQMCHwfKebvAIAg_xqbM_lpPcuM/view?us=
p=3Dsharing
>=20
> Info on the testing environment:
> cpufreq_governor: performance
> Test machine: Raspberry Pi 4, 8GB DDR
> SCHED_FIFO with priority 99 for running the test program
>=20
> Vanilla kernels are not tainted. However on k-6.0 and k-6.7, I have to pa=
tch the drivers/clk/bcm/clk-raspberrypi.c file with the version in Raspberr=
y Pi kernel tree for the CPU frequency governor to work.
>=20

The next step is to find the commit that introduces your regression with
`git bisect`. If you haven't done so, see
Documentation/admin-guide/bug-bisect.rst for instructions.

Anyway, I'm adding this regression to regzbot:

#regzbot ^introduced: v6.0..v6.1

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--KIdW2yF7ZM5mmI7P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZV7eGAAKCRD2uYlJVVFO
o72FAQCK5rdafR/mKJWt3KzyR6K08xDUXWyyIuqjKnddfzjV1gD/RNJ2SAAIHKWN
re/3qbV0011KdIQjaBsiuk0g/iTkaAA=
=/6zc
-----END PGP SIGNATURE-----

--KIdW2yF7ZM5mmI7P--
