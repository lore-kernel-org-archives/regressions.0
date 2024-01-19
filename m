Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C6F4A3C
	for <regressions@lists.linux.dev>; Fri, 19 Jan 2024 06:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705647542; cv=none; b=rph+yZN+30qLLfiMNvva5ws23cXsxedXDdxng+q7t9gOISDbpXOphtXsPlRj8wS0A57fYB3t6ORYHNkmdmJatbXb8Waab7ydWCEncvHjjUNsCI3shpPbENDEhm3HbC+Y/9k8szZE5Ktk2OldKeyLuNNkZ7hrNilR31i3MOKUZP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705647542; c=relaxed/simple;
	bh=hogej2Hq/Ar9DF2BDUWIkWyiEHi3+d77JUjEQDh5/MU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVPpLAjTKzCUhIrg0LbRNuAWZkiE70HTjTNsgFIcS7nINwEkQjRPHzy2+tx2zTgvOHqNJ64r8SH7upiV5eParke46asB+k4mz3DUmyjM3ntTGAWt6a7ckHj2S5DVJN32j1lGlWcMkfzXw4hcu8Qb4XcFLrILOflasbR3KfXCrrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0SVJ2Ga; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0SVJ2Ga"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d5f1e0e32eso2811985ad.3
        for <regressions@lists.linux.dev>; Thu, 18 Jan 2024 22:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705647540; x=1706252340; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hogej2Hq/Ar9DF2BDUWIkWyiEHi3+d77JUjEQDh5/MU=;
        b=T0SVJ2GawcccKRZY+QaxHYR5RHzSVW/lcmsQUJcE9UJ6J31TxUKpHqzbppF2U9SPvs
         gG00yBtQVyaS/thYYO6HjncdKtkE01e1FBeHPBnQAEdshtku8NOYDl0GAj/r/sGOeNtV
         N4tB6Z5uWCA9MYkQM25AG4R9DhEWDmaCfN7yiAFa82LrQYXUCH/XWSWxqVmUQNfjyCIs
         WUS+CqHQ0uvU+89+PW5nIT5uHjYtlMg+MFUDwSt0fPQIV6n0kwbI6QbUIN2NEybp39Qh
         f9/TRBLA4ms/N8EY3vEjUcYcSkkfSEQrkvCSfZYK6kZc7i7dnOyE/GnfyIKl81ML8VKT
         LOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705647540; x=1706252340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hogej2Hq/Ar9DF2BDUWIkWyiEHi3+d77JUjEQDh5/MU=;
        b=u1BLeoB6p2UcgW23pVeqM8xwJoHq7TjFfVriLFLrPQSyv9sjCsODiSrQtU1/olq2cZ
         b8AHQgNH6PEu8qndO85hz+a/+lKPSfJyuldwa7EoAn76Ds7aBM7bVWtqaHFzFq6Tnq9x
         FBs10/xl33dVyayUblWRK55fFp42NIBgvQNTIbyVdy0Hi0ylsSo3/8lPHkCDmJ8PhMrz
         9o2zGEMV5Z4Yne6vw8WAxu7FsacouC20ambGNrpexX9ZYmNx5FPSF09dDGtVOPwthvaT
         UAhe2AdnXgBboc27Bw6mX4wqlW9FjpnXNA9rBamJYGgqUSt9lQcy/aXG0dE9PTd2hpg9
         QwPw==
X-Gm-Message-State: AOJu0Yz4raKEu5TnQ0mXukbE6q25rxqXGAtS6tfzt5ipfPwTXbHm6016
	/xh0ANmdzvpRqD0y1Cric+gE7EB8tJX73S5BnHqDI0+p2eIe98ZD
X-Google-Smtp-Source: AGHT+IHJixHYo3krLzziz+R41+iMji7GYGWIRRNcbflClYK6OAWpT5zGOMdo53Qx2VNmbGi2ULd9tw==
X-Received: by 2002:a17:902:7c94:b0:1d4:3d04:cdd with SMTP id y20-20020a1709027c9400b001d43d040cddmr1795857pll.32.1705647540466;
        Thu, 18 Jan 2024 22:59:00 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id kq11-20020a170903284b00b001d6efcefadfsm2370127plb.202.2024.01.18.22.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 22:58:59 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id D0B251854A1A0; Fri, 19 Jan 2024 13:58:52 +0700 (WIB)
Date: Fri, 19 Jan 2024 13:58:52 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gowtham <trgowtham123@gmail.com>,
	Linux btrfs <linux-btrfs@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>
Subject: Re: Disk write deterioration in 5.x kernel
Message-ID: <ZaodrO8QjCqSXPHe@archie.me>
References: <CA+XNQ=j6re4bhRDUebzPLDvMtZecqtx+GRRPgpd9apss+vOaBg@mail.gmail.com>
 <CA+XNQ=hGxYsMAo6Gc+Up5QctbWjkER17uK97YXWc9uyx_7+3uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W9V2F+uscCUe8eop"
Content-Disposition: inline
In-Reply-To: <CA+XNQ=hGxYsMAo6Gc+Up5QctbWjkER17uK97YXWc9uyx_7+3uw@mail.gmail.com>


--W9V2F+uscCUe8eop
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[also Cc: btrfs maintainers]

On Fri, Jan 19, 2024 at 09:37:50AM +0530, Gowtham wrote:
> Hi
>=20
> Is there anything I can collect to debug what is the problem in the new k=
ernel?
>=20

Please don't top-post, reply inline with appropriate context instead.

Since you have regression w.r.t. old LTS kernel (v5.4.y), can you check
current mainline (v6.7) to confirm or deny the regression? If the
regression still happens there, can you perform bisection (see
Documentation/admin-guide/bug-bisect.rst in the kernel sources for details)?

Also, it is also helpful to list SSD devices that you've tested.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--W9V2F+uscCUe8eop
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZaodqAAKCRD2uYlJVVFO
oznlAPsGd2k4lotRybEZil8Cr95NHCC5FGqwT4eW7L0FIBO0fwEAq6D/v+fULtZx
aM0klFefbcFQsJK+aywrUR+bbsgMVwM=
=RXeF
-----END PGP SIGNATURE-----

--W9V2F+uscCUe8eop--
