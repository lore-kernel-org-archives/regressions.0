Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.189.121.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793127959;
	b=hOnktNOoAzVlaqB5qLTrH27qYW0NAbnU83JMjaNCqajHuxt4WaxcJ/iGSMbMtTdW/0UK
	 87RgdajLTPbEXPBY+388EsUxNegF9neARS/Z0r6P4fGhXBCz/38fcws+0MQlOFk2ulkqw
	 PDBxPldJHSIKM+HhF6xznSxh8j6YxABnaifaIc/lbmfGwvJowjzUGanIkvr5dVgeW1j8t
	 0wGss09dI4tEaYy8/jGLxyfy83yze9E5WqcVvFKsMgVFd2r3pIsjMPF439K/4jxPxxUzv
	 5xIPzAsRXVGFbFVVxjvumxmuJhfH+ZAiduycMXMZjyPmMfwQK42tB3uvQmVfoIl2BWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793127959;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:MIME-Version;
	bh=MYPTpHuTNuu4dEBpl/csG5iOwQPMJ8PZegnCvEYcbx0=;
	b=Ki17yP2TuQwSxTaqqhKaGcmV13DjxB1Z6lrAdk2IJcGoEp0HpEL6g9YNCJOOYCqh2F7R
	 f4h3GJfr0LBUcNRe7UdCR94GOq1B3mT/2hnrrog3s2zRUshi/bNWBXTpRuYDHNVdyt8Bf
	 OSsaaqZaIR8gDjozupsD6O6hUEIwEhfNU22ThWZokfle8In1YHB5aZDuPcWnhoftuHvzd
	 9KsBpYQzzT9VYt/Ot66CBUrU44oPnLULIAM5wHqw+2iC25KHRCk8HC0jyg9LsjK7U9KVW
	 YYWDe0xczpLlG4jyB2/JL2KPkYZi7OdxOXTzgZH3rdAWaMJvXGCaz/FemZd+TMfEvzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=itx.no;
	spf=pass smtp.mailfrom=itx.no;
	dkim=pass header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b="DI0XNS/t";
	arc=none smtp.remote-ip=91.189.121.228
Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2944E606A31F
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 19:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2944E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=DI0XNS/t
Message-ID: <bd9b6592bce4b8f2e802518bf2cad561af61e78e.camel@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1793127950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MYPTpHuTNuu4dEBpl/csG5iOwQPMJ8PZegnCvEYcbx0=;
	b=DI0XNS/t62uG8V+EZIsB1JN/Hd7vsct42Wg7Yg2iUnWOabCyd3zg9BJGs+aNf1JYP2vUaA
	270G8pfsjq4SFbxlJyyiAJ1Ten5mF6klpuQEDuInn3jfVhJ4Z8Dy5j6UUXmSuH7mamF4Nr
	zq/eUUP2TG8ZTUI4VmVFl9/QBJcTD2Y=
Subject: Re: [PATCH] sched/cputime: Don't warn when the tick period starts
 after idle exit
From: Stian Halseth <stian@itx.no>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Menzel
 <pmenzel@molgen.mpg.de>,  Thomas Gleixner <tglx@kernel.org>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,  regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Tue, 27 Oct 2026 20:05:49 +0100
In-Reply-To: <auDaMdhD2zGBLhDE@localhost.localdomain>
References: <bfe9b14a-6e65-41c5-b638-26f6e033788b@molgen.mpg.de>
	 <20261025100202.2584654-1-stian@itx.no>
	 <at-C_3rGi55L1v2X@localhost.localdomain>
	 <1e00b909b81c6195b3ad5aeda207d20cbedc3971.camel@itx.no>
	 <auDaMdhD2zGBLhDE@localhost.localdomain>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-oiCYC83f+cLXHYrEn5UX"
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0


--=-oiCYC83f+cLXHYrEn5UX
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Frederic,

On Tue, 2026-10-27 at 18:06 +0100, Frederic Weisbecker wrote:

> Ok let me try to picture this:
>=20
> Initially, jiffies or tsc-early, not sure, is the clocksource:
>=20
> - tick_setup_device() sets tick_next_period to ktime_get()
> - tick_periodic() adds TICK_NSEC to tick_next_period right before updatin=
g=20
> jiffies. So as you said tick_next_period =3D=3D ktime_get()
> - Note last_tick is not involved in that mode
>=20
> Then later on boot comes a oneshot device:

The clocksource is initially jiffies, and I believe there is a step missing
before the oneshot switch: the clocksource switch, while the tick is still
periodic.

Please let me know where I lose you, or if/when you disagree with
my analysis.=A0Not sure if you're more confused about my attempt of an
explanation, or by what's really happening ;)

Here we go...=20

The oneshot switch can only happen inside a tick, so at the earliest
in the first tick after the clocksource switch. In the guest it came=A0
0.7s later since tsc-early waits for the watchdog in the guest.

So...for a while tick_periodic() runs on tsc-early. ktime now moves
between ticks too, but the next tick still adds a full TICK_NSEC, so
tick_next_period gets ahead of ktime_get() by the part of the period
that had passed at the switch. Still here? :)

In the guest that was measured at 2.3ms. With a periodic lapic it
stays that way, with the TSC deadline timer the following tick is
programmed from ktime again so it is gone, but in Paul's case the
oneshot switch happens in that first tick after the clocksource
switch, so it is still there.

Then finally tick_init_jiffy_update() aligns it upwards. It is not
tick aligned to start with since ktime starts at the sched_clock boot
offset, so that can add most of another tick, and that becomes the
first expiry of the sched timer.

hrtimer_forward_now() doesn't touch it since it is already in the
future. In the guest it ended up 4.66 ms after now at HZ=3D250, and
tick_do_update_jiffies64() returns early until now gets there.

>=20
> last_tick actually gets its first value when the tick is stopped for the
> first time in tick_nohz_stop_tick() and is set to the next tick that won'=
t
> happen.

Yes, that expiry. A stop in the first 0.66 ms saves it as last_tick,
and kcpustat_dyntick_stop() then has last_tick - TICK_NSEC still in
the future. I never caught the stop itself in the guest, but Paul's
registers show now 235623102 and tick_start 236000000.



/Stian

--=-oiCYC83f+cLXHYrEn5UX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTK1ph9OaYoND1R57zoeAEuJe36VgUCauD2DQAKCRDoeAEuJe36
VswuAP99h4ej/4Ex/kSVFi3bhDVsqfeLqgvnE6sO5SRPPHQ6mQD/Vg68zXdEi6ps
hLHn13doRT+dtmdwZYbTdJ/big/brQk=
=xPD+
-----END PGP SIGNATURE-----

--=-oiCYC83f+cLXHYrEn5UX--
