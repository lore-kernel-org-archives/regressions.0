Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB66D523C
	for <regressions@lists.linux.dev>; Sun, 28 Jan 2024 02:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706408321; cv=none; b=oBWHG69HB5x8LyN0WGAMxJ1KLdqFwcPTLsmbno3lq/byM67UZ+tdEs9s0cC6yL/Y2SyMO9Rd4TNep9pvg34nUa+BxL5DFPfxUyqD2Fs3i9+yAyfgTVAaqaIGhlxFyasr8puUjIOwqo9km09UYS903M4gv4cxcMZZBTa9TzB1B+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706408321; c=relaxed/simple;
	bh=26YGlgSUeQwTXup9PHvb6iEOzNbarNhzu6L8VCS/7Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8+KyRtVHzg2E9sk+ZZQ8X9RNG4wUGKGOiADFWr+QPORf87cORgfSM8oNRegBMd1hi74TGXxInDdX5ypdDIWCH6zx2SzjimrlFCtd8tdDpopoYc3ANg60UuVKzWpu3+9+xLEF7ciJCQFuIPJffiOjeTukbemOhZIErGskL8ekmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hq+rS/qk; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hq+rS/qk"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6e0af93fdaaso1447238a34.3
        for <regressions@lists.linux.dev>; Sat, 27 Jan 2024 18:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706408319; x=1707013119; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LX4mqVYij6KEkFtWInw51O9XUMFwiWF+hZ3Lbcz68b4=;
        b=hq+rS/qk+uWaT7krX5E/ppVdcASaQXnolg/7nYBO7fARkrOaISY9meMpbKE9sg7wxI
         91HZ0WWAUMOVfr4WJd3D6AP1QfNZgybU7a5tHj8jWN2YEztXz1JLC3LLyL/HNPnTloIo
         90sBVOH0IO6gaFoeB+ggw+D5ryFoZnCl0x1NDHWSnreLuA6KcwH+7mmKXmJvcQtmvR33
         tP+T8LqXYMApJ1QHfjTicWkG1qJ+ZX3RLwx+RdbZs1YNhoHIH2zVM+5HP1AzNAFgeIjL
         HW+q+GSq1G394+NDAkUCJNND28iigYMKeUQtDsFNhUbEs3g4c+rJnHw3KapBTKQp/gNL
         pmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706408319; x=1707013119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LX4mqVYij6KEkFtWInw51O9XUMFwiWF+hZ3Lbcz68b4=;
        b=ZRf7OS9tLs3dstYEFSjBjN27bw5QzQENCTlWwMp5RV8sTmRO5dqntL60ODN9UBD2O0
         AyJIhiuwfZicubjK/DEJXxDHy3I3/ljOQneuvXL/dWX587rHaWAgtyhY4S3rnKOiNDAy
         CbtGj2FeQObC0FMID1HLS1aMniZl5NZaMu0LSyMZkzucqo5BqCC+7WhNrNi5UqWMv8DV
         qJRlo7aXrw66Y63xq5Svgh8vsLttrhYNtio1nWQNCTCChbQXfOpqhOKy2Nj6aU72MeMf
         Qd7q7Wg62bj6GsYzAbWFYaWp7cjD2j3CzH/tiWf02wJJcsBmZpZxbCeKZ79N+aDGl3Wr
         V6aw==
X-Gm-Message-State: AOJu0YyclonzJRdzEwfNRbGRCzFgf5G9w5FMfkUwrQdb/gNQpRlB0lsG
	fniqnI7hzvCmGHpaDxRQYVpvOc6qFT4BL7wX5El/8xMdyKhZx168
X-Google-Smtp-Source: AGHT+IGcixK/L0BwSGtpQKvqwR9URrR4xk6sq2YDEJNjTNIpW1x3LobwCStd9u4g6gLFEQr0FmgszA==
X-Received: by 2002:a05:6830:619:b0:6dd:e810:3ab9 with SMTP id w25-20020a056830061900b006dde8103ab9mr3151539oti.4.1706408318659;
        Sat, 27 Jan 2024 18:18:38 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id k1-20020a634b41000000b005b7dd356f75sm3513189pgl.32.2024.01.27.18.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 18:18:38 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id C372318523300; Sun, 28 Jan 2024 09:18:34 +0700 (WIB)
Date: Sun, 28 Jan 2024 09:18:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: More detailed text about bisecting Linux kernel regression --
 request for comments and help
Message-ID: <ZbW5emVndDNZlPTg@archie.me>
References: <c763e15e-e82e-49f8-a540-d211d18768a3@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q5Ak87mt+ZHiI+QT"
Content-Disposition: inline
In-Reply-To: <c763e15e-e82e-49f8-a540-d211d18768a3@leemhuis.info>


--Q5Ak87mt+ZHiI+QT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 01:19:16PM +0100, Thorsten Leemhuis wrote:
> .. _bisectstart_bissbs:
>=20
> * Start the bisection and tell Git about the versions earlier
> established as 'good' and 'bad'::
>=20
>     cd ~/linux/
>     git bisect start
>     git bisect good v6.0
>     git bisect bad v6.1.5

If stable release tag is supplied instead as "good" version instead (e.g.
v6.0.1), as in many regression cases, git will ask to test the merge base
instead, which is corresponding mainline release (in this case v6.0).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--Q5Ak87mt+ZHiI+QT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZbW5egAKCRD2uYlJVVFO
o5DeAQDTPa/eTL2vmdlMXx5dd/SS6WEDl3lfwEv9dC1T2bZFLwD/XGGr0HikyNc7
hYOttmeJADRT8PIX/8b8PdVtP0V1KQQ=
=98El
-----END PGP SIGNATURE-----

--Q5Ak87mt+ZHiI+QT--
