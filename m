Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F3830F92
	for <regressions@lists.linux.dev>; Sat,  9 Sep 2023 05:36:20 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-573449a364fso1696926eaf.1
        for <regressions@lists.linux.dev>; Fri, 08 Sep 2023 22:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694237779; x=1694842579; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T9QdRpHmKF7Dl0phviBz7WSuqViIRbheRKqXILmxCEw=;
        b=qSkKCvSGlxdDLRT7VyP2Mh+8HA9vmW2VbJPgUWj/AJbRYm2//1LXBZBcuwNOsaPjGT
         qudkNRquLuXHm92JN/j6grdbLMQCypqw/DrOgy1TWvmEG8sZDqQubaZq66RY86ZUJo7B
         lIxHg/PPZ9IML11nF+/otxo2AaUMMwxLFQGOkzTg78Q3Pp8CvpQo0ApamWmpRuz1ZMnU
         rr1kCy4X/B5rwE0WunRFjUafOZfFYWzP/JBYbY9ZnEW9mNFD6kyzkuRpsjNC36Dw5+9d
         W/FiqolscdqKd4hkWLgsKyPxlD4GpNLov4E1RaWbNJhv4uez7cnaSZisTe7uTQt8FCNs
         LHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694237779; x=1694842579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9QdRpHmKF7Dl0phviBz7WSuqViIRbheRKqXILmxCEw=;
        b=LU/pN44z35UgRVqU14WJaghoHyrwLwhTHTIKwtkBMR2RYEdhALOgpQQ6ZrdPuEcn7c
         4zS2ie1IqoadJJJ4oGDfUf+GgYDG9vANthfd3w6EFz1pocE8Onw9sLnhQYgaqXCTg6qI
         31gn5ReEO+VEZIiSPGSxX9w6eWqt+RD0asdttzl270duBVL93RVKJ+lC2R0Gnlviv/HN
         wvc0iKvSZi6dJCRUFT+P6cveQ1D1H9iVhO/RvSe0XCQDqr98Q7Il7TxSVVHhytT/w5ko
         dtJLRKMelgXT5Zblw6ebNucAhjcPl31vcILxqU5Plnf2hYMe13rt4CQnWfNlews1fTZC
         ArGw==
X-Gm-Message-State: AOJu0YwoDlDL60+BvaivJniJVsdpepxem7hAG6/U0eMOKphAlnBjlRCo
	kQ+tWJXPxLvFvccFbjP9vsg=
X-Google-Smtp-Source: AGHT+IFsBaaCIIBHfXy6K9EBhaseuwvlm/ZF7VeyFi6SRkSkOxHCXNBxcjku48ptQPAr+1Rdzbe1Sg==
X-Received: by 2002:a05:6870:fb8a:b0:1bb:6cca:3468 with SMTP id kv10-20020a056870fb8a00b001bb6cca3468mr4623544oab.47.1694237779496;
        Fri, 08 Sep 2023 22:36:19 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a01d900b0026b46ad94c9sm2312333pjd.24.2023.09.08.22.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 22:36:18 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 165109A5D464; Sat,  9 Sep 2023 12:36:14 +0700 (WIB)
Date: Sat, 9 Sep 2023 12:36:14 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
	shenlinghai@163.com, Jens Axboe <axboe@fb.com>,
	Sagi Grimberg <sagi@grimberg.me>, dwmw2@infradead.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux NVMe <linux-nvme@lists.infradead.org>
Subject: Re: Fwd: Ubuntu 22.04, "nvme list" will hang for 60 seconds after
 "nvme subsystem-reset"
Message-ID: <ZPwETorRO60QGen6@debian.me>
References: <8edde583-2b5f-2332-e59a-f1f4688b9e40@gmail.com>
 <d7290782-bf72-3a65-26fa-b58e75bcae2c@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NwbKn5UmL+2AYyp/"
Content-Disposition: inline
In-Reply-To: <d7290782-bf72-3a65-26fa-b58e75bcae2c@leemhuis.info>


--NwbKn5UmL+2AYyp/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 07, 2023 at 12:30:30PM +0200, Thorsten Leemhuis wrote:
> >> root:~# uname -a
> >> Linux dapu-Star-Lake 5.19.0-46-generic #47~22.04.1-Ubuntu SMP PREEMPT_=
DYNAMIC Wed Jun 21 15:35:31 UTC 2 x86_64 x86_64 x86_64 GNU/Linux
>=20
> Bagas, please don't forward reports to the developers (and also don't
> add them to the regression tracking) if the report is about a problem
> with a vendor kernel that is known or likely to be patched[1].
> Developers otherwise will just start to ignore your mails, as you are
> wasting their time.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--NwbKn5UmL+2AYyp/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZPwETgAKCRD2uYlJVVFO
o2JTAQCJLs9Rku/9XRes2BQ/A134vw5Uq14Ob4IgfIZtAQclqQD+P+WKjV56tT5N
6XJnoVyWpHG3yHNHWtMHvwS0QKpfoAY=
=Pizn
-----END PGP SIGNATURE-----

--NwbKn5UmL+2AYyp/--
