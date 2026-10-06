Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6A33D9529
	for <regressions@lists.linux.dev>; Tue,  6 Oct 2026 10:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.189.121.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791283857; cv=none; b=GsXoELYNB4USb0oV1rsiLBX+HPFjIK7rvFvm//38tMpk0UvO89/EJNlkgezn5DQEpP13n9Ij13Sf5nQYRzZvXv4vrHqsGO8SuF+jj+HQuO0MDljf7NZ+0WEOpFeWPeN8n+QUiXyYRhKTiD9ffgvaxC5DUBmc5kfDSCH8KUfDmwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791283857; c=relaxed/simple;
	bh=pvzXmk7mQfAsSmorN8NiXAHB9NIAygUpSyo2wyTkSx0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iDjMaAa0oOv94h/BktRie6BT88+HnrTtRnNjm+LHnU203u40AEGNXBiHnOwFdR5Hq57wPzzobYzo91kNrKWubqodJQ0Cud5/2DaxsHSXwkdLoPrZja48LTo5JMIj4AiPk7DcJKCqSXNiXwsnZB3bbTJRTkGhhcqg5RG0WUo69WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no; spf=pass smtp.mailfrom=itx.no; dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b=UnLIYjDm; arc=none smtp.client-ip=91.189.121.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b="UnLIYjDm"
Message-ID: <630a98619b9c5d04b01dd1c506d432d13f724218.camel@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1791283853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+fcI1Y4pnV5fdHIY6WoVenrBh0y+HsqftYvDFB5JitI=;
	b=UnLIYjDmLlmRxjAGf69sXBLRdhC+l5oWAQsqrl/xv8HEXOxxEqdsNyJT46/vfz9+vk+ekL
	XuEcsUVn8phHYEeqxfMnWRji5faC/x89WtkomxUgOiPQn0txlyyy2Ert8tOP/R3ftkFuTq
	sX+GsNyOD/+BMaUu2lMsadKxNEyPTL0=
Subject: Re: [PATCH v2] sched/cputime: Don't account idle time twice after
 dyntick-idle
From: Stian Halseth <stian@itx.no>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen
	 <anna-maria@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
	 <peterz@infradead.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Tue, 06 Oct 2026 12:50:50 +0200
In-Reply-To: <asTJQHcGzJmB9u33@localhost.localdomain>
References: <20261005194010.168299-1-stian@itx.no>
	 <asTJQHcGzJmB9u33@localhost.localdomain>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-sBArerPzt/uBOVXySAe0"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-sBArerPzt/uBOVXySAe0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable


On Tue, 2026-10-06 at 12:11 +0200, Frederic Weisbecker wrote:
> Le Mon, Oct 05, 2026 at 09:40:10PM +0200, Stian Halseth a =E9crit :
> > On idle exit the dyntick-idle accounting accounts the time up to
> > now,
> > then the tick is restarted on its old period. The first tick
> > accounts a
> > whole TICK_NSEC to whatever runs, although the part of that period
> > before the idle exit has just been accounted as idle time, or with
> > IRQ_TIME_ACCOUNTING as IRQ time. That is up to a full tick per idle
> > exit, and /proc/stat reports more idle time than wall time.
> >=20
> > Record how much of the current tick period dyntick-idle has
> > accounted,
> > and leave it out of the tick that ends the period.
> >=20
> > Fixes: cf6444c3e1bb7 ("tick/sched: Unify idle cputime accounting")
> > Link:
> > https://lore.kernel.org/all/20261004142724.3896396-1-stian@itx.no/
> > Signed-off-by: Stian Halseth <stian@itx.no>
> > ---
> > v2:
> > - Keep the overlap per tick period, so that a second dyntick-idle
> > =A0=A0 period before the tick adds to it instead of replacing it
> > (Frederic)
> > - Read it through a helper in the NO_HZ_COMMON block, with a stub
> > in
> > =A0=A0 its #else, like kcpustat_field_dyntick(). IS_ENABLED() does not
> > build,
> > =A0=A0 as the field only exists with NO_HZ_COMMON. The helper is static
> > =A0=A0 inline, as there is no user with VIRT_CPU_ACCOUNTING_NATIVE.
> >=20
> > Frederic's case does not happen in my tests on its own. Since
> > f4c31b07b136 ("sched: idle: Consolidate the handling of two special
> > cases"), without a cpuidle driver or with a single state, the tick
> > is
> > only stopped after it woke up the idle loop, and that tick takes
> > the
> > overlap first. With a test-only change that stops the tick on every
> > idle entry, as a governor may, the guest added to a pending overlap
> > about 900 times a second under a pipe ping-pong between two CPUs.
> >=20
> > So it is not what is left with steal time. That is the same with
> > v2,
> > +0.7% to +1.4%, and only shows when the task also spins for 1 ms
> > after
> > each wakeup.
> >=20
> > Total CPU time per wall second on the loaded CPU, v2:
> >=20
> > =A0=A0 SPARC T7-1, HZ=3D100, busiest CPU*=A0=A0=A0=A0=A0=A0 1.0001
> > =A0=A0 SPARC T7-1, HZ=3D100, 3.7 ms sleeps=A0=A0=A0=A0=A0 1.0000
> > =A0=A0 SPARC T7-1, HZ=3D100, 25 ms sleeps=A0=A0=A0=A0=A0=A0 0.9998|
> > =A0=A0 SPARC T7-1, HZ=3D100, pipe ping-pong=A0=A0=A0=A0 1.0000
> > =A0=A0 x86_64 KVM guest, HZ=3D250, 3.7 ms=A0=A0=A0=A0=A0=A0 0.997=A0 (1=
.505 before)
> > =A0=A0 same guest, pipe ping-pong=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=
.000=A0 (1.152 before)
> > =A0=A0 same guest, 9 ms sleeps=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0.985
> >=20
> > =A0=A0 * under its normal load, about 90 tick stops/s
> >=20
> > The guest was tested as for v1, with and without
> > IRQ_TIME_ACCOUNTING,
> > with highres=3Doff, with steal time and with the forced restart path.
> > The
> > -1.5% with 9 ms sleeps is the late tick delivery described in v1.
>=20
> IIUC, there is still an excess of cputime accounted here sometimes,
> right?
> And that never happened before the patchset that rewrote the cputime
> idle
> accounting. Am I understanding correctly?
>=20
>=20
Only with steal time, and that is older than the rework. I ran the same
guest test on v7.1 and on ad5a9e14ec8b, the parent of cf6444c3e1bb7.
Total CPU time per wall second on the loaded vCPU:

                          v7.1    ad5a9e14ec8b   v2
  3.7 ms sleeps           0.995   0.996          0.998
  pipe ping-pong          0.997   0.996          1.000
  steal, sleep + spin     1.029   1.028          1.008
  steal, pipe ping-pong   1.338   1.341          1.001

Without steal time nothing was counted twice before the rework. With
steal time, v7.1 counted steal time during idle as both idle and steal
time. The rework fixed most of that, and what is left with a busy spin
after each wakeup is smaller than before.


/Stian

--=-sBArerPzt/uBOVXySAe0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTK1ph9OaYoND1R57zoeAEuJe36VgUCasTSigAKCRDoeAEuJe36
VrNrAQCx4btZmvlTlTYCgXYfxRsgi0I8ZienQXEWocbLru1htAEAyiL597IATu1s
UOrOF4XHLlTYt46UHer/C/EaLe9FEQE=
=oaz2
-----END PGP SIGNATURE-----

--=-sBArerPzt/uBOVXySAe0--
