Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.189.121.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792916025;
	b=nQezM9KIYECOCSVG3n8whg8a1Vl4hHLE/QS8SDl5qhXaLqk7Bc1McQhwXbBZAolTgL9A
	 TFK6Cc3/DZfvBFUpCuerGj+78JIKwUyfvG7E2f+xFCxJ9r40v7EGmDO161BeI5N9ew6IV
	 /x1gpYgSL/pBbXT5QRRjgXCo+w/9oevQOLJUmjrEdSAPcLHzIQ5zlpu+J/1P8DeM9J96z
	 MLS5AHKyqi1hPDY7Ft7lif8VNOQNzPy0C9BUUp6Hz+jxXiCzkNWBirPZx5en9Cvwu4LzC
	 LYIaKpmT1pa1IuBZiKwE/2DxTRV0LKsQfGp1Q6XOEYAbKm0CooFgK1FuHQiqhbZoKOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792916025;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:MIME-Version;
	bh=EKyPeaxDN5KkkiMtpzosRjM1dGahqBT+/A8ey72yYsM=;
	b=IfDPLptGYwgzPEYNZ4GXeVVZmTqzrI8T8U4XFURzFgAEeyhyQ4FWRokf5gSmnWjg9kGI
	 83Vn6IVQPZX3eRT1nXd3sIJ3aYnUqKFwqQArtd7at1Vg+z6vEyHfBykTTS9iHxUT5v6Hy
	 Z7Jso2e8bWa6W3ddMJUPoTwLyo3rFC8oIBupHCGz4L6yveVohBQek6F7JcR7TOSdVGTCk
	 0wEN/K0inmvLOswxG4t98mVoO5kHjO6ED2e/LueUgIuF/0DqKuHaOSlvnVQmkIuopuRdg
	 JVqx/8LVMGYzlpzAdKPpNyTdRSNRO/llhyx0UYSc4qe/s8al7uCJENVC/reiXFq0Keg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=itx.no;
	spf=pass smtp.mailfrom=itx.no;
	dkim=pass header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=mpHpmLKt;
	arc=none smtp.remote-ip=91.189.121.228
Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9CE606A31A
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 08:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A9CE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=mpHpmLKt
Message-ID: <f18f9548127bbc132e254195d532d0447883d0df.camel@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1792916015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EKyPeaxDN5KkkiMtpzosRjM1dGahqBT+/A8ey72yYsM=;
	b=mpHpmLKtfUYngs2u5aGFdd2Vuvbj9ForenHZMhaaTK8Wd8S6bBsIMSURN1CL+UkcC5nWDL
	0yazXsiOL52l5e9NiabzpkHDQTMyRMLJZ2JgcaPd1haTNmZSQsYD0doGB8hQdlTRR+uNrn
	19qIh7hpeCYs3x+mg2LpUJroky9Wg/0=
Subject: Re: WARNING: kernel/sched/cputime.c:481 at
 kcpustat_dyntick_stop+0x8b/0xa0, CPU#0: swapper/0/0 (was: [PATCH v3]
 sched/cputime: Don't account idle time twice after dyntick-idle)
From: Stian Halseth <stian@itx.no>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>,  Anna-Maria Behnsen <anna-maria@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Sun, 25 Oct 2026 09:13:34 +0100
In-Reply-To: <bfe9b14a-6e65-41c5-b638-26f6e033788b@molgen.mpg.de>
References: <20261007142950.547604-1-stian@itx.no>
	 <bfe9b14a-6e65-41c5-b638-26f6e033788b@molgen.mpg.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-8XBARo2aAwhejeO4wymt"
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0


--=-8XBARo2aAwhejeO4wymt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Sun, 2026-10-25 at 08:27 +0100, Paul Menzel wrote:
>=20
> On a Dell XPS 13 9360 (Intel Kaby Lake, 4 CPUs), Linus=E2=80=99 master fr=
om
> the 7.4 merge window, warned once during boot (of five boots having
> your change included), in the first idle period of CPU 0:

Thanks for the report. I believe the warning _is_ the bug here, and
that the accounting itself is correct.

Currently running tests on a follow up patch, suggesting to remove
WARN_ON_ONCE, with a comment explaining why.

Once tests are done, I'll finish writing up the commit message which
explains my reasoning in detail. Should follow shortly.

/Stian


--=-8XBARo2aAwhejeO4wymt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTK1ph9OaYoND1R57zoeAEuJe36VgUCat26LgAKCRDoeAEuJe36
VrAbAQC19We8l643k08zZUDFsT/IUjYFUG0kCWRvV/btl80NNgD+LKGhV/5e1Akv
kyMMdGZ0X3eI4Fp3plX3OyJihMmbSgQ=
=uPfL
-----END PGP SIGNATURE-----

--=-8XBARo2aAwhejeO4wymt--
