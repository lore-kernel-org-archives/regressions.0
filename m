Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD44346FA0
	for <regressions@lists.linux.dev>; Tue,  6 Oct 2026 11:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.189.121.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286723; cv=none; b=Pqef3iG4jmpFEHLpqh3U99IwshHU4rlpPjbTL8m1MPLLJ0hUhn4g8pw5PuYkqv7SJt/WkcuuMSDMpgi1fY+/t69uuuCX1vu79uJ/EpcBvdYGS7Ah2L0obGxIGwTODIAjJUs/pSPqx4cXFT6RH+T4a88C3Yz6pWf1OIm8JoETBfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286723; c=relaxed/simple;
	bh=bpwXiLYMy1C9YaNTlOPiapR+LCEmQ1cY/6Va6pUCLvQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y8gDXD5HFIgP6wELtYFii5VNxTTbkIsI/7w1zbfIIToU0apuQOi/rGO16S06Zl07EgL4CEMmfEySNV8VvyQyyVery7vvQCZ65XkVWUl6RTNc1E1UGQeCJyAJcpX4GJ5uCBXhwLO2E5N3lE50fuepJtxLxeIAKQ5USYHIoiUqCis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no; spf=pass smtp.mailfrom=itx.no; dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b=SXFfQnVu; arc=none smtp.client-ip=91.189.121.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b="SXFfQnVu"
Message-ID: <eb598b667e74be1e54aadfd266af4435ee013e8a.camel@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1791286719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bpwXiLYMy1C9YaNTlOPiapR+LCEmQ1cY/6Va6pUCLvQ=;
	b=SXFfQnVu3C5qw7ftRs2BkjBoFpdhElh7spjqmwjFPjcCGTzgs7zxIMh0EDaIIaBMAaiHge
	dzqHdmNdU4tVWAFu4iEHDy8mT0IrNGO91SyBkm1GLCGrq6S+PfVoqwdEfdHqgE3FcLbR03
	PxGYS8Lghev0LvslLrsdQzcZXWF8fto=
Subject: Re: [PATCH v2] sched/cputime: Don't account idle time twice after
 dyntick-idle
From: Stian Halseth <stian@itx.no>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen
	 <anna-maria@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
	 <peterz@infradead.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Tue, 06 Oct 2026 13:38:38 +0200
In-Reply-To: <f9449162aaea3b43154c3981c50d9bd40340c2c0.camel@itx.no>
References: <20261005194010.168299-1-stian@itx.no>
	 <asTJQHcGzJmB9u33@localhost.localdomain>
	 <630a98619b9c5d04b01dd1c506d432d13f724218.camel@itx.no>
	 <asTWpV1xFQ4opyB7@localhost.localdomain>
	 <f9449162aaea3b43154c3981c50d9bd40340c2c0.camel@itx.no>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-JmipPCAzG8QhmldjCN+a"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-JmipPCAzG8QhmldjCN+a
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-10-06 at 13:19 +0200, Stian Halseth wrote:
> On Tue, 2026-10-06 at 13:08 +0200, Frederic Weisbecker wrote:
>=20
> > > Only with steal time, and that is older than the rework. I ran
> > > the
> > > same
> > > guest test on v7.1 and on ad5a9e14ec8b, the parent of
> > > cf6444c3e1bb7.
> > > Total CPU time per wall second on the loaded vCPU:
> > >=20
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 v7.1=A0=A0=A0 ad5a9e14ec8b=A0=A0 v2
> > > =A0 3.7 ms sleeps=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0.995=A0=A0 0.996=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 0.998
> > > =A0 pipe ping-pong=A0=A0=A0=A0=A0=A0=A0=A0=A0 0.997=A0=A0 0.996=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 1.000
> > > =A0 steal, sleep + spin=A0=A0=A0=A0 1.029=A0=A0 1.028=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 1.008
> > > =A0 steal, pipe ping-pong=A0=A0 1.338=A0=A0 1.341=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 1.001
> > >=20
> > > Without steal time nothing was counted twice before the rework.
> > > With
> > > steal time, v7.1 counted steal time during idle as both idle and
> > > steal
> > > time. The rework fixed most of that, and what is left with a busy
> > > spin
> > > after each wakeup is smaller than before.
> >=20
> > Ok and you haven't observed a real difference between your v1 and
> > v2,
> > right?
> >=20
> No, not in normal operation.=20
>=20
> It only made a difference with a test-only change that stops the tick
> on every idle entry. There v2 added to a pending overlap about 900
> times a second, which v1 lost.
>=20
> /Stian
>=20
IMO the pre-existing steal time issue is out of scope for this patch,
and would require a separate investigation, _if_ it's worth the time.

--=-JmipPCAzG8QhmldjCN+a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTK1ph9OaYoND1R57zoeAEuJe36VgUCasTdvgAKCRDoeAEuJe36
VhJkAQCe7Acr1ntD8/N2KSJKX4HG2fhUj9XV93ul1fQh2R6PrgEAvNCbfzVcDYUJ
M7aFZRR3byX3ovqJEL0Xc4R3wRZxOQM=
=EBSv
-----END PGP SIGNATURE-----

--=-JmipPCAzG8QhmldjCN+a--
