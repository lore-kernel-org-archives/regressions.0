Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C64D48124B
	for <regressions@lists.linux.dev>; Thu,  2 Jul 2026 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782999801; cv=none; b=EBLl/8dMWGaCuNG5MYa/jRs52FU5ZJLx20rgwzEDGUIuhLzH4dvf2+PaKKAIHUylkQpSXgUT216QgfYE4RmbTy16rRPukpKInoKnra6qWT0UBZ2BE6CTT9hZL/oqWdCWqbENn4tViV/HJQmyFwTKKqwKLJ5cp8a2HZuyp087w0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782999801; c=relaxed/simple;
	bh=059Sgpkvr19sHrayqn7EdTrqkcsNUSuKUfN+RnozI38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivTglPjPE0tNxnOiqVnMzAriAMQueYXW4WJJ6BziHgGcKHui81IxVGmeYb7XlTOUrBY2XK1rJSTamUeITYZLS+22Yh5roSXhPaxsTlKRSLlKTi3h+UC87rfRInt0VJff5b2V1gNnTDeeXayx+CGcF51kae3NXIsm07TMb5PjPgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SCJwb2o/; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SCJwb2o/"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-471eee9b7d5so457504f8f.0
        for <regressions@lists.linux.dev>; Thu, 02 Jul 2026 06:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782999797; x=1783604597; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ipKugtGaRqiVpTyYozYE/djPPJyYvvmbarq5DjbNW4=;
        b=SCJwb2o/fVJHH4nO1boQovuIXbcloCluScn2fFkqUdffHmtw/K85YUdUrfMPccF0AS
         pTi+6+k0B2RdNYd3fiWXEEoK9E3wmxfOm0G/MNT9BuCS4VYlXHBK5nrJg850In6crOVT
         eRzC1zW0TdcDcxbyqsH0/sDD5yDdTayJpQcQZrScVXmazHL3rqUN38q5opCsiXET20v1
         h4gY39LdFhTu2Q4a6MqSk651kdT+oKFXFCFj7usfajpd9o7QW7z4WVXPFHcWPXNBQFGV
         KzBKVS5NzjUctYEpDWolFtZy+lih7vH+xBeb+bdmRqh/lE9o6oE0ENssyV5mZECT9FJj
         JPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782999797; x=1783604597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ipKugtGaRqiVpTyYozYE/djPPJyYvvmbarq5DjbNW4=;
        b=LhoXIlGx11jjirLC19uxpTzKtutRLIcZgssAZiawHGUItjfvDYGvQUpR9Uy0Yya/9E
         fy1t0U90Ne+MLoP2ZPrHIhXI5MZfyDgSG2o03YPOkufoDclcxmw+5w6LML/gRwQ575In
         +uKt8OiYhtdGGcHh7upGM4+FtxZVTkkCACH9++kuaQhBQR+B3GqcAElGYZ0CDjSNHNpo
         SLtW1aycZFS3vHx5XhfJ+jWenjQAm4GheoHjo7foMApu5HEpXN30rSSdtuyRTbrfy/Ce
         8x0XZcca0f5vNkC4n2J5yYY/u2CWZ0z5BsYO//50xXts35DqJknLrHqTAxkTKOdgkh+i
         L73g==
X-Forwarded-Encrypted: i=1; AHgh+RpN7pbJwBZ7xH5YdERFfBigQj8knwkclcwHv4wvJQjp/9VzE7F/LwysWPF5m6Ibqb/Fiz4Z/lrCGtITfg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEEgRRa9YubwnzqDEOPvNlH5m4hI6reco7NLARpsHUxyISLgS6
	qoBI2CnZuw41I8TO8upjX9cJdW8i6/9A2PgE7SpUPiKMas9tAoLvnAJPCDLSlgFkEQE=
X-Gm-Gg: AfdE7ckhHppGY4ZiMYL92NmzQlixy7bfixadf8OGGMXyESt5kskyPIKwcp8tFPVFyED
	1OmHNMM5sDWYoFZpbonHi6tvRKJNMMy3s8ZSycN4Tpp0WS6CY7JItytQ9L6ufQXuSDkLVukjVdc
	GzWrS45GVeCTyGLLEanYH5v+II1m4IvBb3sl5frKttd3F6erIUgfLqAyB/LSIw7KEaO5qhPw9M5
	4H05ocEtEow4V3Ms4sVOt18DClnZFnRcG7TGnAg/mXc6tS1ARtsaGg2FPp0o3YMnlde+/hp0P/o
	KMl5efYiddrLetpitT2GBSbBB4LP0hmUhWDEizuFShj48VWzCuli8wZIEQOwRqmaevO+KjiK0ld
	R8HSI2hn08cx4OlTumEucOVgzH8jH+VWvFzoqlaTAVgkaNJ+kxanyCKkd51HRDCtOFdqM9Kn4tD
	crKZc3Vyg9UiPwB5ZeqSqACSyvROPe0qIL/38/buRNBF+Qncs5N2HyLgwWVvQtln/sQIj/dzNCa
	88c
X-Received: by 2002:a05:6000:290e:b0:462:e086:35f with SMTP id ffacd0b85a97d-477588e7d35mr9467489f8f.21.1782999797471;
        Thu, 02 Jul 2026 06:43:17 -0700 (PDT)
Received: from localhost (p200300f65f47db04bdb9899c6dd79ae8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:bdb9:899c:6dd7:9ae8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477db3dbb01sm9190047f8f.1.2026.07.02.06.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 06:43:16 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:43:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Steven Rostedt <rostedt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	John Ogness <john.ogness@linutronix.de>, Thomas Gleixner <tglx@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Julia Lawall <julia.lawall@inria.fr>, 
	Yury Norov <yury.norov@gmail.com>, regressions@lists.linux.dev
Subject: Re: [PATCH v3 2/2] tracing: Remove trace_printk.h from kernel.h
Message-ID: <akZpICZ0pGqspV2u@monoceros>
References: <20260624081806.120105649@kernel.org>
 <20260624081948.301578807@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eimzpvi5zp6g4d27"
Content-Disposition: inline
In-Reply-To: <20260624081948.301578807@kernel.org>


--eimzpvi5zp6g4d27
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/2] tracing: Remove trace_printk.h from kernel.h
MIME-Version: 1.0

Hello,

On Wed, Jun 24, 2026 at 04:18:08AM -0400, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
>=20
> There have been complaints about trace_printk.h causing more build time
> for being in kernel.h. Move it out of kernel.h and place it in the headers
> and C files that use it.
>=20
> Link: https://lore.kernel.org/all/CAHk-=3DwikCBeVFjVXiY4o-oepdbjAoir5+TcA=
gtL12c4u1TpZLQ@mail.gmail.com/
>=20
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>

This patch became commit 9cbc3d9806d3 ("tracing: Remove trace_printk.h
=66rom kernel.h") that currently is in next via

	https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trac=
e/fixes

=2E

It creates a build regression for an ARCH=3Darc allmodconfig build:

	  CC      lib/test_context-analysis.o
	In file included from include/linux/local_lock_internal.h:8,
			 from include/linux/local_lock.h:5,
			 from lib/test_context-analysis.c:9:
	include/linux/local_lock_internal.h: In function =E2=80=98local_lock_acqui=
re=E2=80=99:
	include/linux/lockdep.h:541:87: error: =E2=80=98_THIS_IP_=E2=80=99 undecla=
red (first use in this function)
	  541 | l)                     lock_acquire_exclusive(l, 0, 0, NULL, _THIS=
_IP_)
	      |                                                              ^~~~~=
~~~~
	include/linux/lockdep.h:509:88: note: in definition of macro =E2=80=98lock=
_acquire_exclusive=E2=80=99
	  509 | re_exclusive(l, s, t, n, i)           lock_acquire(l, s, t, 0, 1, =
n, i)
	      |                                                                   =
   ^
	include/linux/local_lock_internal.h:46:9: note: in expansion of macro =E2=
=80=98lock_map_acquire=E2=80=99
	   46 |         lock_map_acquire(&l->dep_map);
	      |         ^~~~~~~~~~~~~~~~
	include/linux/lockdep.h:541:87: note: each undeclared identifier is report=
ed only once for each function it appears in
	  541 | l)                     lock_acquire_exclusive(l, 0, 0, NULL, _THIS=
_IP_)
	      |                                                              ^~~~~=
~~~~
	include/linux/lockdep.h:509:88: note: in definition of macro =E2=80=98lock=
_acquire_exclusive=E2=80=99
	  509 | re_exclusive(l, s, t, n, i)           lock_acquire(l, s, t, 0, 1, =
n, i)
	      |                                                                   =
   ^
	include/linux/local_lock_internal.h:46:9: note: in expansion of macro =E2=
=80=98lock_map_acquire=E2=80=99
	   46 |         lock_map_acquire(&l->dep_map);
	      |         ^~~~~~~~~~~~~~~~
	include/linux/local_lock_internal.h: In function =E2=80=98local_trylock_ac=
quire=E2=80=99:
	include/linux/lockdep.h:542:87: error: =E2=80=98_THIS_IP_=E2=80=99 undecla=
red (first use in this function)
	  542 | try(l)                 lock_acquire_exclusive(l, 0, 1, NULL, _THIS=
_IP_)
	      |                                                              ^~~~~=
~~~~
	include/linux/lockdep.h:509:88: note: in definition of macro =E2=80=98lock=
_acquire_exclusive=E2=80=99
	  509 | re_exclusive(l, s, t, n, i)           lock_acquire(l, s, t, 0, 1, =
n, i)
	      |                                                                   =
   ^
	include/linux/local_lock_internal.h:53:9: note: in expansion of macro =E2=
=80=98lock_map_acquire_try=E2=80=99
	   53 |         lock_map_acquire_try(&l->dep_map);
	      |         ^~~~~~~~~~~~~~~~~~~~
	include/linux/local_lock_internal.h: In function =E2=80=98local_lock_relea=
se=E2=80=99:
	include/linux/lockdep.h:545:65: error: =E2=80=98_THIS_IP_=E2=80=99 undecla=
red (first use in this function)
	  545 | fine lock_map_release(l)                     lock_release(l, _THIS=
_IP_)
	      |                                                              ^~~~~=
~~~~
	include/linux/local_lock_internal.h:62:9: note: in expansion of macro =E2=
=80=98lock_map_release=E2=80=99
	   62 |         lock_map_release(&l->dep_map);
	      |         ^~~~~~~~~~~~~~~~
	make[5]: *** [scripts/Makefile.build:289: lib/test_context-analysis.o] Err=
or 1
	make[4]: *** [scripts/Makefile.build:549: lib] Error 2
	make[3]: *** [Makefile:2184: .] Error 2
	make[2]: *** [Makefile:372: __build_one_by_one] Error 2
	make[1]: *** [Makefile:248: __sub-make] Error 2
	make[1]: Leaving directory '/home/uwe/work/kbuild/arc'
	make: *** [Makefile:248: __sub-make] Error 2

#regzbot introduced: 9cbc3d9806d3

Best regards
Uwe

--eimzpvi5zp6g4d27
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpGau8ACgkQj4D7WH0S
/k60mQf8DafTZ+RrM8iDR9Rps1Uq1SVO0/K+QKgsTcIoZGtz/2p/6sUenHyWfzyk
I0/CaOrCjB6uJW7Qtf9LLr094QwXlcyDxLKJWXZzPSFAPM3rLSnmKXC7OL8o8Wo+
RFZ3o6CSwUUogCviA79eH5Ld6GgN6KOjpeTqF1mmvVPoiXlw379FNgXblkHKFLJ3
HOfVuexp5xg+K2i1N9DSPk7UbfF/jIbKBMHSvF1pU12vjiq3/fVd0uuW5SjULP5h
3qmQwZt9/jbLZgpHYBMp38wQcEB300pjw+mJ2Wpirxi21/vgQB/bcUg7J6gpLh02
F4Me2/KLpnQSUNOSpFmstcg5Potmvg==
=oLO5
-----END PGP SIGNATURE-----

--eimzpvi5zp6g4d27--
