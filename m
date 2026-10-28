Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.189.121.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793209047;
	b=UGefDrt/node0/SSP8LDIJvjRRlidXh4aE+vYm1boeGEK9vt9ZPOtmsaewGerrhxjbkm
	 2mqfl2sTb4k3kboIszj5CHwSZrzl4IWp5aqqss29utaZtcdhuSuqTdjo1mu+yHmzw1I0+
	 ugqED61cTcblttcbDvJ+a7kRoGvb4BNFa5cbsccYgamkThjBh6fJ5uHuy33Ci6/5V6Vk7
	 wQqIyYHSaiQvD13hYXsoSZMAZoaJ6KTUIxd7r0Zf4Z5QhtOwzFWo5QOs4P4fVIotaeQxC
	 oOqfP5/jgBvk+ZwcBmKlzk6jXn2V2sOZL6PnwHIjstj6+Z+6MMjHEmJbNUj3tJaZq2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209047;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:MIME-Version;
	bh=D+E5f9szfVDKnVHCxdofpBpBimR9XEjRAg4gzouCl8c=;
	b=mbPS4xYvBZAfnI8XvG4Td3MgSNjdO6kbW1AqOlJS4FP45Bh77RSx02haTB3ot+7ctylG
	 R9OeBbLkrPLa+B7pAOiv2jhU9VEc0RdsD4F91U4zDGzwMof/UAB4Ei2/Pt5PbhJ1NrYOi
	 58YVQZ4P3vKYPc/YNUsXZrH0UROTqnC8s0cS9wBWnIAzkLVfgBUngIVtoXWP9oOzuvyLw
	 ybXZ74yJo1ycdQ8DLWhJTcm+ANLzvE0fbEg25xvKfWfMk+f4vxCfOCiUMSzkaOfXaO++n
	 y2CB9do/na5VnFuR7ThPMjoOtqFpvQoBbr4kVQtXSfyHyxUBDog9cWmm6Wl0xJTzlgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=itx.no;
	spf=pass smtp.mailfrom=itx.no;
	dkim=pass header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=hhlVuW3A;
	arc=none smtp.remote-ip=91.189.121.228
Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F0A60A262B
	for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 17:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06F0A60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=hhlVuW3A
Message-ID: <68f0450d47577dc4f83d32e5b0211c97ee8d24bd.camel@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1793209044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D+E5f9szfVDKnVHCxdofpBpBimR9XEjRAg4gzouCl8c=;
	b=hhlVuW3AcpCwM7iTuJnW8JGDeSpUmJjzVIYObgdZY7m6EUXXdbncuE5+dpzX006QdF9b4d
	9ca0jNtUX4m9QbCmmIDZ+XYvkleXPKoYFgNjnuDSwEApNXbMY60pdLNHwKZP9cq3f2c2Kh
	k8kE+cFJuNqEx+PMpq+zPqgjhifWe9A=
Subject: Re: [PATCH] sched/cputime: Don't warn when the tick period starts
 after idle exit
From: Stian Halseth <stian@itx.no>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Menzel
 <pmenzel@molgen.mpg.de>,  Thomas Gleixner <tglx@kernel.org>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,  regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Wed, 28 Oct 2026 18:37:22 +0100
In-Reply-To: <auIDNl9EUX4CzWzr@localhost.localdomain>
References: <bfe9b14a-6e65-41c5-b638-26f6e033788b@molgen.mpg.de>
	 <20261025100202.2584654-1-stian@itx.no>
	 <at-C_3rGi55L1v2X@localhost.localdomain>
	 <1e00b909b81c6195b3ad5aeda207d20cbedc3971.camel@itx.no>
	 <auDaMdhD2zGBLhDE@localhost.localdomain>
	 <bd9b6592bce4b8f2e802518bf2cad561af61e78e.camel@itx.no>
	 <auIDNl9EUX4CzWzr@localhost.localdomain>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-a3jHAuohABOcCIkgh4uO"
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0


--=-a3jHAuohABOcCIkgh4uO
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Frederic,

On Wed, 2026-10-28 at 15:14 +0100, Frederic Weisbecker wrote:
>=20
> So let me depict that:
>=20
> // clocksource =3D jiffies ?
> // clockevent =3D lapic ?
> tick_setup_device()
> =A0=A0 tick_next_period =3D ktime_get() // jiffies_to_nsecs(jiffies)
>=20
> tick_periodic()
> =A0=A0 tick_next_period +=3D TICK_NSECS
> =A0=A0 jiffies++ // ktime_get() =3D=3D tick_next_period
>=20
> // jiffies > tsc_early
> clocksource_select()
>=20
> tick_periodic()
> =A0=A0 //one tick has passed, so ktime_get() =3D=3D jiffies + 1

Here is where it goes wrong. One tick has passed in real time, but not
in ktime. The switch happened d after the last tick, jiffies never
counted that d, and the tsc only counts from the switch on, so here
ktime_get() =3D=3D jiffies + TICK_NSEC - d.

> =A0=A0 tick_next_period +=3D TICK_NSECS
> =A0=A0 jiffies++ // ktime_get() =3D=3D tick_next_period =3D=3D jiffies

So after this, tick_next_period =3D=3D ktime_get() + d.

The same thing as a diagram:

// jiffies -> tsc-early, d after the last tick
clocksource_select()
   ktime_get() =3D=3D last tick          // the d is not in there

tick_periodic()                      // TICK_NSEC after the last tick
   ktime_get() =3D=3D last tick + TICK_NSEC - d
   tick_next_period +=3D TICK_NSEC     // =3D=3D last tick + TICK_NSEC
   // tick_next_period =3D=3D ktime_get() + d

=46rom a measurement I did with a QEMU guest: at the switch both were
329532326. At the next tick ktime_get() was 331212239, 1.68 ms later,
so d was 2.32 ms, and tick_next_period became 333532326, 2.32 ms
ahead.

/Stian



--=-a3jHAuohABOcCIkgh4uO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTK1ph9OaYoND1R57zoeAEuJe36VgUCauIy0gAKCRDoeAEuJe36
VkNYAP9XvdCbPewvZN+Amteil8ZSilKqJlwP3sdH7AOqnHoT8AEA0gD9K98dWBrK
vPqcfK5ZOh4xDke24KdxeW0s+PX9tQw=
=5uKS
-----END PGP SIGNATURE-----

--=-a3jHAuohABOcCIkgh4uO--
