Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05F2145350
	for <regressions@lists.linux.dev>; Thu, 16 May 2024 11:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715858202; cv=none; b=sQIdUGJDd7prj28M/j3AW9ro/76zEPfpmJ+qYvVbfBndXip+TM5YMmPXtTofvrwQg01DPafNkTKl9TjFAmtkvFXJPcnOSy9PoZV/jgrXUfuC2cLE7T6FF9d5doSBbmKzd30kh910ko/DSt0A2k+bCVIX8em33WTWHdUj75Kz7aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715858202; c=relaxed/simple;
	bh=pZsguINlLPkEncHOmNf8Wba0AvdIfuAVaGM1L5yr1zQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sD4x5lClrS4/C5APqzibHjCcvNbW3ieFpmWKT/J1SNhpqNu6sCNH5ViuzG1V65/X3o7YC210OT5BB07oeBfn2lHhbWixDAyFzZ8XfsFiaIOOEi99Qc/YE5CZ8qhxI+igeihuMhdveSuLhfpl4pTIrFImICwCfs59G5zlcF2vKdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQ/ETUHn; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQ/ETUHn"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6f0e2612303so20259a34.2
        for <regressions@lists.linux.dev>; Thu, 16 May 2024 04:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858200; x=1716463000; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pZsguINlLPkEncHOmNf8Wba0AvdIfuAVaGM1L5yr1zQ=;
        b=dQ/ETUHnIzZvOyfgUZ3WhZwpocFLzLmb8FQcqADjxWUDC6F2948iWgn7Ld8+qPJIRH
         Fggc4HTci+yye3lx9AROcXlgxfkHK5yEkNMGpkpEwiPIqr3z+2hvPLvnTGHY9a5sNgZM
         OuJ2J30+aYJA0fwxLjCUN+By5h3uaINGDZ+OIzkMxoRzw98rVeZKTdWwCQHU9yomeFqD
         lNYJJSnIrqqN1gLYoOrhXYbO9dK5WNvA0TP/nmb8wDhkn9LB87iXtXaDOICCLLibo0FK
         o3/gn/8kVpD5J4ScC5RdXzKeQyp80vOXTrFrCLRoanMZxENCBOCZj98I31inLb/ozBa5
         GIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858200; x=1716463000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZsguINlLPkEncHOmNf8Wba0AvdIfuAVaGM1L5yr1zQ=;
        b=whhgQCpn00cwVMiOhvQol51cYqjV0fNDDpUXX3eBNdUGg13okPxubihML7cbEC3AoR
         E9jT6knRhLMltOT0e8RDZ5nXbzKALFt/8WEMz22ubWHcNaQ0hpuHsZ9QZ6WrVYVsLrhD
         tag9XcKJRjhb2R7mjo5ntoYFAizhS9AwBoATPQheU0VU/46KcJFPGDy6I8eaqbZPMYFK
         bV0nHTX3fJSwMFQB6W4758/J3xzp7vAS9e2PFrOFq8Dn9UZRkjeLr82wTYb5D2MgNwlB
         /acYqG5WLFRfcL1DHs6VfKuC1ie75meth4gCJeE8rjotJnO7DOZ/OsA3hM4DPjzqyi9F
         OaiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwK5Pxck4eKvMmIG3+pAMVOeUgO7Pgo+jgxT3xDI5LDd5yxIlQb0xe/l5Zhj6Y0ScbjhaDJDLe+aeuPLixcFeWmI1qlegx4r1Ssdc=
X-Gm-Message-State: AOJu0YxgcdixIo9dCYTjxglk353qKITMVRjlO3hepibNG2d6cDX7qz5F
	m2MohXwuuv/EsVTCVJwR0BZmFzfA/aaHBawtnzuZq0EtrKeFlD3Sjc2gmQ==
X-Google-Smtp-Source: AGHT+IEkWYNm7i+9UVZyC2lJFBmC4Z7ZCyva+6Nw/6thz6kOPdcfQFv5Ci6Eya3Y/q5TDevz7+Fixg==
X-Received: by 2002:a05:6871:e491:b0:23b:dd9b:79cc with SMTP id 586e51a60fabf-24172a43127mr21990419fac.2.1715858199641;
        Thu, 16 May 2024 04:16:39 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f67ed10e79sm1484699b3a.45.2024.05.16.04.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:16:39 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id B2AD318320670; Thu, 16 May 2024 18:16:36 +0700 (WIB)
Date: Thu, 16 May 2024 18:16:36 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: SATA ACPI SECURITY FREEZE LOCK (regression?)
Message-ID: <ZkXrFDwHS1a5pTnx@archie.me>
References: <ZkL0EIESAleNhVqr@archie.me>
 <ef803d3c-14c3-47ef-91d7-4ca498519bf0@leemhuis.info>
 <453b71cd-7fa4-49ad-a2dd-35f63ea79979@gmail.com>
 <d4caa0a0-2487-493c-a498-c6eca7483fde@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vskj2gWZFC9chZq4"
Content-Disposition: inline
In-Reply-To: <d4caa0a0-2487-493c-a498-c6eca7483fde@leemhuis.info>


--Vskj2gWZFC9chZq4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 12:19:24PM +0200, Thorsten Leemhuis wrote:
> On 16.05.24 12:07, Bagas Sanjaya wrote:
> > On 5/16/24 16:56, Linux regression tracking (Thorsten Leemhuis) wrote:
> >> On 14.05.24 07:18, Bagas Sanjaya wrote:
> >>>
> >>> doru iorgulescu <doru.iorgulescu1@gmail.com> dumped repeated SATA err=
or
> >>> messages on Bugzilla (https://bugzilla.kernel.org/show_bug.cgi?id=3D2=
18832):
> >>
> >> Thx. I wonder if this is a problem at all. Acted in bugzilla for now.
> >>
> >> BTW: you did not reply to my question yesterday: why did you start for
> >> forwarding bugzilla tickets yourself again? I thought we agreed to let
> >> me handle that.
> >=20
> > I'm just wondering there and see what bugs I can forward to mailing lis=
ts
> > (of course with relevant maintainers Cc'ed).
>=20
> Please leave that to me for now, as we agreed on a while ago. We tried
> that already and that made some people upset and annoyed about
> regression tracking, which I really want to avoid.
>=20
> If you are unhappy with how I handle things, just tell me.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--Vskj2gWZFC9chZq4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZkXrEAAKCRD2uYlJVVFO
o+2+AQCEz1UnmGNKtzh3UjNV/iFysAHfs/htkNal7Bnw05alHQD+K/QBbW1sf574
q+p5I894MThogO4fkrhTcciLusokng0=
=hJDV
-----END PGP SIGNATURE-----

--Vskj2gWZFC9chZq4--
