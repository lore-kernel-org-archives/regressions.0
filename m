Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6795B38F935
	for <regressions@lists.linux.dev>; Tue,  6 Oct 2026 11:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.189.121.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285604; cv=none; b=VU3CNRZxOO/QEiRaVjw2rOm7XB/1raSRNC39ffecRWhhDp9FMPhECZK+j6PsWlCcODpu9x69KSUcIerjdyTNPUSlYKA+n2eYvW5e8Ib4O/gBc6ItvWDm99AFVmfvhSyyTU3MngFNf4AAsHwosnj1O3svy865RDeBAANXVEDA5WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285604; c=relaxed/simple;
	bh=5GeN4NyIgiqjT3unzPCJfH1WVo/ZStkxIgI0YRdk5a8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fe2LdacYpIjqs4HMRZDUH+wuU4+VNpt5SNMK8sKvX4RR4tipUXdXZhMOpBoCF6EJg+lM2IrD5EG9dvqg08lizZ3oWF6dnxuWpmSGgkWSzNi6taDDBT50/Vz/4gHhuCwBtbRaFhp41eEO8U4j4r/LvfjW7ZU7yVwmYIila6NGjYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no; spf=pass smtp.mailfrom=itx.no; dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b=e0gg4MQp; arc=none smtp.client-ip=91.189.121.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b="e0gg4MQp"
Message-ID: <f9449162aaea3b43154c3981c50d9bd40340c2c0.camel@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1791285600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5GeN4NyIgiqjT3unzPCJfH1WVo/ZStkxIgI0YRdk5a8=;
	b=e0gg4MQp9pBgXdFMNtULx900JPBPmhoj3OQ8IHibo1M5o9nfE8+8dX+iQExKTuc0jFijwc
	j/rEAn18fEPiybfYsmXowMkiBa5EsLagElKisBN9mQ+SMzI9augo4pG25JO/LHUBzPZquU
	jUquMQYHJHNa5DHxBGsNY/g7rBo0IpE=
Subject: Re: [PATCH v2] sched/cputime: Don't account idle time twice after
 dyntick-idle
From: Stian Halseth <stian@itx.no>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen
	 <anna-maria@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
	 <peterz@infradead.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Tue, 06 Oct 2026 13:19:58 +0200
In-Reply-To: <asTWpV1xFQ4opyB7@localhost.localdomain>
References: <20261005194010.168299-1-stian@itx.no>
	 <asTJQHcGzJmB9u33@localhost.localdomain>
	 <630a98619b9c5d04b01dd1c506d432d13f724218.camel@itx.no>
	 <asTWpV1xFQ4opyB7@localhost.localdomain>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-lpvlzLQHz1C3ScxHyUW5"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-lpvlzLQHz1C3ScxHyUW5
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-10-06 at 13:08 +0200, Frederic Weisbecker wrote:

> > Only with steal time, and that is older than the rework. I ran the
> > same
> > guest test on v7.1 and on ad5a9e14ec8b, the parent of
> > cf6444c3e1bb7.
> > Total CPU time per wall second on the loaded vCPU:
> >=20
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 v7.1=A0=A0=A0 ad5a9e14ec8b=A0=A0 v2
> > =A0 3.7 ms sleeps=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0.995=A0=A0 0.996=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 0.998
> > =A0 pipe ping-pong=A0=A0=A0=A0=A0=A0=A0=A0=A0 0.997=A0=A0 0.996=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 1.000
> > =A0 steal, sleep + spin=A0=A0=A0=A0 1.029=A0=A0 1.028=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 1.008
> > =A0 steal, pipe ping-pong=A0=A0 1.338=A0=A0 1.341=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 1.001
> >=20
> > Without steal time nothing was counted twice before the rework.
> > With
> > steal time, v7.1 counted steal time during idle as both idle and
> > steal
> > time. The rework fixed most of that, and what is left with a busy
> > spin
> > after each wakeup is smaller than before.
>=20
> Ok and you haven't observed a real difference between your v1 and v2,
> right?
>=20
No, not in normal operation.=20

It only made a difference with a test-only change that stops the tick
on every idle entry. There v2 added to a pending overlap about 900
times a second, which v1 lost.

/Stian


--=-lpvlzLQHz1C3ScxHyUW5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTK1ph9OaYoND1R57zoeAEuJe36VgUCasTZXgAKCRDoeAEuJe36
ViyIAP0c38dOVGj+r+D7NqmS72u1aJFgqIw3CmjbiSSISOqqogD+M+pxEmSRLMVW
jpZh1e0kjy/yyp2J3/C+Z63nBAWu5go=
=eXTt
-----END PGP SIGNATURE-----

--=-lpvlzLQHz1C3ScxHyUW5--
