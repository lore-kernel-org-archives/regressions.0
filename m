Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F04220B10
	for <regressions@lists.linux.dev>; Sun, 28 Jan 2024 12:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706444872; cv=none; b=ILIjKiVxOosaCEzj1Z+LsqFe48ntfGE0uuGnbFah7kvdoOms7BQxpl/wnw4dO4+oZs11UvbcFdq4v7kN4uuzvGiybYuz8fZ3E46yLkBJkhl/XoRcFZq8/q33OQ4wJjzMhKDkhTxd4wUOG+zDggTmNq8hQWwiDMwq7hNMBQLVfDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706444872; c=relaxed/simple;
	bh=RazE+jc+SID1Wz2okl+YhaUu42pguW2xXu+B0GsHDOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwHRJqQmXFEqhNpToaPbEZtN9KtHArgMgo2yXOXzg4Gd0s6FZ3P/ePooJyVQJnj79/oTuAbPWaoTwA74ZjiWJZOVagGH6OImOWUAJvhFXiH+TIUNIWru1NM9kYlHylF4YNbxtWMBIfP3dvTwOT6NQNsG0YFDFJnAs532uMFJAGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUtAcfur; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUtAcfur"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d8cec0f71aso2059565ad.1
        for <regressions@lists.linux.dev>; Sun, 28 Jan 2024 04:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706444870; x=1707049670; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f6A3+XdkKqU1Q3k8PxIHg8Ql7lOhl/fZYFw1hUekQ9U=;
        b=aUtAcfurokiqrK5XxdY/uy0h2DnarJfHDrJ/qnZ8uoNBxpZ2E92MMdNDuIFXtlbEt4
         FLW8ZDghlwJqd7XmhSJpFPAyP5eetS750FdXXU5SdAj2wZz3c18BUnFgaF8cPtGfEyCe
         4iDK97/vghAUaaTM0HCcwqk7crvoN1MfFfF6hJoB9idKfLpyV6X9/JOX+YWN2Ws9SJHq
         qd6FWd9EHbmBD6e2FZSCRwFj79kUKZ4SvvM9FUTi/XwMKHdvedDYul9dMmjz+JEv+KE4
         Tz4JiZ1i2TniPD/Sg0ejVExXhush9F8izxHnM2ac3UgL/zVqrEi8pu96KdW+telpzJ08
         yY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706444870; x=1707049670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6A3+XdkKqU1Q3k8PxIHg8Ql7lOhl/fZYFw1hUekQ9U=;
        b=rnMuWys8yljKAFAina8X9PY6WiRKv/NqMTOdCTakH4jVZ8UcB4NOT0yJSa6kNDySBv
         S76OX18EEW71WtZgzQnlmPfVzgMvtNQfOgryChE7pNioH4b3KEJmNjY8OWnyRqmSEtQ/
         KPviGbbcVESPqY9XGvcdic+RsyiR8zDOuzGvoHSgsLv3Kb90enMoHcFiRUtolUPK2xiw
         JuG4lRzvMti4eZv23WDPf+7+ADGsMgTrwdRfhVMzDsc6DsAz2qKzBkv00lpisDtxN4vc
         f3peK+v+0RlrXhF357O7qE326+9HcmSnScc4dt1zK0apm4KItLpvx7fGQ5G/yxAB2Rdb
         VNTQ==
X-Gm-Message-State: AOJu0YydgirCjVCcS/m2lNp2l7ZoU/pekuVkHF9iVM/2CI4qDcQZB1nI
	psJGYx32uQbqabXQPlrnvVWhIo8fcvcnpdQL6qht6GVP16cr+zyTcFM8y+ZxQi0=
X-Google-Smtp-Source: AGHT+IG1q/641b1QavA3wBgGsZom93VKUFtlhiyXKQo2Fnsfgaw1etUBlzUT0VPgje31Cfs9zdexSQ==
X-Received: by 2002:a17:902:b615:b0:1d7:2337:9ff4 with SMTP id b21-20020a170902b61500b001d723379ff4mr2600554pls.46.1706444870084;
        Sun, 28 Jan 2024 04:27:50 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id o10-20020a170902d4ca00b001d787672afcsm3584848plg.258.2024.01.28.04.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 04:27:49 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id D83B718550346; Sun, 28 Jan 2024 19:27:45 +0700 (WIB)
Date: Sun, 28 Jan 2024 19:27:45 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: More detailed text about bisecting Linux kernel regression --
 request for comments and help
Message-ID: <ZbZIQc91DRrTeMtZ@archie.me>
References: <c763e15e-e82e-49f8-a540-d211d18768a3@leemhuis.info>
 <ZbW5emVndDNZlPTg@archie.me>
 <a373a71c-f5b6-471b-b7d2-b1f21dc505ca@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QW2iM5aW2BJe83wI"
Content-Disposition: inline
In-Reply-To: <a373a71c-f5b6-471b-b7d2-b1f21dc505ca@leemhuis.info>


--QW2iM5aW2BJe83wI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 28, 2024 at 06:28:52AM +0100, Thorsten Leemhuis wrote:
> On 28.01.24 03:18, Bagas Sanjaya wrote:
> > On Wed, Jan 24, 2024 at 01:19:16PM +0100, Thorsten Leemhuis wrote:
> >> .. _bisectstart_bissbs:
> >>
> >> * Start the bisection and tell Git about the versions earlier
> >> established as 'good' and 'bad'::
> >>
> >>     cd ~/linux/
> >>     git bisect start
> >>     git bisect good v6.0
> >>     git bisect bad v6.1.5
> >=20
> > If stable release tag is supplied instead as "good" version instead (e.=
g.
> > v6.0.1), as in many regression cases, git will ask to test the merge ba=
se
> > instead, which is corresponding mainline release (in this case v6.0).
>=20
> That should not happen if people follow the guide, as this is avoided by
> an earlier step:
>=20
> "'"
> .. _rangecheck_bissbs:
>=20
> * Determine the kernel versions considered 'good' and 'bad' throughout
> this guide:
>=20
> [...]
>=20
>   * Some function stopped working when updating from 6.0.11 to 6.1.4?
> Then for the time being consider 'v6.0' as the last 'good' version and
> 'v6.1.4' as the 'bad' one. Note, it is at this point an assumption that
> 6.0 is fine that will be checked later.
>=20
> "'"
>=20

Oops, I didn't see that context above. Thanks anyway.

--=20
An old man doll... just what I always wanted! - Clara

--QW2iM5aW2BJe83wI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZbZIPAAKCRD2uYlJVVFO
o2AVAP94Vb9po75H476YPkW8Ab5KWGCdPe5GMFhjORBuZzA/VwD+N2tvHII2zzQS
Z/Pbfh53eCGsd7inrATn8J6SOemepwU=
=gE8H
-----END PGP SIGNATURE-----

--QW2iM5aW2BJe83wI--
