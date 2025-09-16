Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964363016EF
	for <regressions@lists.linux.dev>; Tue, 16 Sep 2025 16:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041545; cv=none; b=JiZ5FIxKZ1Czb6nPoqTo/wh0jIKgSZ6qNM8CX1OUGjs3jZ0nj5ARwK9WVGVfuEwFZA/SdpFaoxUSdifTXFYkacMjDZVKFzx8QPubTTp1QjwgmMOXqkxUC4MTCa2Z+j8Y0QQy0eOqgRJ5pa4XmAHoOf7XA30i4JsC1xnxkvS6CXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041545; c=relaxed/simple;
	bh=8AESY8DFg+P8p5pZuaMkvp80UwJ/QTg4ZdEEHu0ICgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i89YbB9dW3Ar8vk7WAPI513mkVOOIB0Ju6UZWDRinsUWexBAsCDmLscdSvgFDtu8ywNOgiYxW9o+J9Yoz8jrHa8Jqe559lFZDe1349Rn9mP3vPtIlQoDEc1O/uzKq6dajZVlJbfrc5kfBmCXbN6l2ZW0Nwd2gVLQh0JWLWKf5f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=xv9WvgMP; arc=none smtp.client-ip=217.72.192.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="xv9WvgMP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1758041525; x=1758646325; i=christian@heusel.eu;
	bh=D5WjKsYzC/8TQ4xzES5ykkMKYMccrsD0qleFS2sZfIY=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=xv9WvgMPWaCEHovGzShWvVS6pe7uOcR92qGsVbHvf0y9u+wYqOHy5eYEgwc+LzGv
	 fjRrr827TY5LkiA99qLJs+n6PKM4zDAVnyzgMqQAEWIhwVGrtwlFckp60icNIgDaD
	 K12ijjZkcDN3DT+meOiMXvkDPuRy2YdbEpR+7f1OzgaARyp7IxVyROUN/5YyinlvS
	 ed10n+q3nBYsZBhfadfCw3QO/fu+z0pY3gQE3wzqh0FZ2/sg18D2rPvliEsfpRpwO
	 A+FlNWmTN7Krp7E6+RFDVkhYIPozykzqYWVqx7gfRPpeZN5rT5SxN8FBHMjMMc/FN
	 SrIynCaaQtDNnU0rEA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([94.31.75.247]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N1Ok1-1uEcGy2Dmd-00re1b; Tue, 16 Sep 2025 18:46:07 +0200
Date: Tue, 16 Sep 2025 18:46:06 +0200
From: Christian Heusel <christian@heusel.eu>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: rust-for-linux@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>, Linux Regressions <regressions@lists.linux.dev>, 
	lkft-triage@lists.linaro.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <lossin@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
Subject: Re: next-20250915: error[E0425]: cannot find function
 `atomic_read_acquire` in crate `bindings`
Message-ID: <27366f94-67d4-4b73-b420-cacdbe9d603f@heusel.eu>
References: <CA+G9fYtT7HNBM2XBbePeZ-Fw+ig7SJ+JE_NpQ1VuHR_TvAjX2w@mail.gmail.com>
 <CA+G9fYs4JB0ngq+aryXHVQSq-f05cb4agCfyM9zN0SgprQf0_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tl3l7oscxlsmmgsi"
Content-Disposition: inline
In-Reply-To: <CA+G9fYs4JB0ngq+aryXHVQSq-f05cb4agCfyM9zN0SgprQf0_A@mail.gmail.com>
X-Provags-ID: V03:K1:UpdFU2uAahLiZS0wyFOe047oO8Z6N4yaaZevfwl69BxlOKmVI5k
 Cgj6pSGwHNT9Wyn0Vx7mDgtGhn3Zk/4a25sJlxqf/hKiHXDUdW/euurFTZAdFV0m48DQslK
 2i/ZJgNlkv93YdGp4SVmccBF7Km0ridR+I4uvcBKIlxOnwqFOXw/4GFSE+yilEJWUlF+UvP
 Ctyoo8hItlmcuaYFRZpWg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZBuv4hELNTE=;mDQ/Vc0ADFoG+Bfjir8D+G00vs1
 xGQ9i5ZS5QhDW17WnKB7LfdGQGsg5m2PN0NvY+jE8BJMBXJQPmrhUvfK/vurYQrmZ4kt1ub+W
 YItLxBvBpz11IVy53XNhp0gmG1HLvgomzdxlfyIxatTGMTCcrcDFcO5EEKcB0pxN68Xlx3IXB
 LnhKXdkbeA8h48gEnkcAyp2Gm8cIhnVyQulvH+EU1WJ3IALGrkSL0zSBbIqhImJwKlJHSkCv7
 GaR4y74W5glPbpYAEFBsusY1FCN1i1bfrfL99Y8hluPHO6ncOaf7Io4JkQSm+KM7Ke9iA340/
 Y1r1W7VjLiwEddlsw41EU4gPf5xGvpZkLg4CItUy6/ms+ptG4wbur6s7ORqsthdKNCPq3rYk/
 fGCkG+vUdNc5x6q+kAXqVm4cOFCb4gCx6xvkIEb+GwDjWBnXiecuNtiFgDfrRfbPfBCK4MFzu
 eSlW0ApeLA17S5pbqRHmF/nHtezg5bzSVf4BYpOAlg9MV/jJtM1CnlvhU/NwHph4pb8WuWQqZ
 oABf+b6NtQVO4xr+zJeCIWV6wf5DoFY4YWXANldJ2lI5U7WF1h3m5D534vtMSdqtXtVUypmTJ
 2RRMW3TSVqV4ZB3M8evDMsjCHl+GHV56QciRa/2K2TRYP047+Ni8KtOMQOuOzrHFUK1kkdz3f
 cT9xRcO4rHTWYWsDD4YTqrtiL0ZgqUYS2YQpaN8T2yqGQt540lPcgd+2+IdXtPo/Hor5Zi7Hc
 Ala85KZI3npUTRyT7uqZ8OnWKXvM1b4uPKEPlwWAB+vdKXv32Rrp91M8BJ4JUyB1M1h5O78zh
 +GsFnE6/He1EDRThVnPlPuP0zrjyumpUzyrV07O2vbh8S1rskv+6LNKvYSH6cOb/oQp5P9MFa
 5U6SPxRMkw36qCKgRR73RpL3l/Ox6/ccocMQRr8nzVqbM1ioozYaDP/wh0d1y2vnsJ3E5bpT4
 +gqEOPH4iMMubGF+byZYMGSGTqggJqVvpS3M475lU155drs81k0GcGJfRFBXVwb11xVV95z7r
 RCD82yW1xFhUY7GyjHGBOxSlYBFJBo//gWElQWfCNgqWNRMV6TSDpfBDQPgS7xmQJCNSedbB+
 LcXqO1TJeA7i8OFQ4rRGFLbBVmDQLnqtKwpUAmP1kYb2naZrP3Mj6rqx32+jIJaew7dTO+FTP
 Gwzjao/a3CiBWv0ubgGZMRSiEJEpGv3uDdku0DX+UNhjCbKk648uhAtOr5ezcZJxT0YjnieYR
 ORmx1PwiYfRZxHVm1wP7q6q1pDMtUHqOTXnPsdnV2tmnX/u1HrFA3zDd18XP8SGkUHKDy6jQH
 MLD0HR2FyXhDoNj7XmmdaIxC/9cNOacu09bAcZ3vUrTQ12AWgs0VK939C/oWp2eisXJW2vzhB
 RjPbQOXIB95AvVKSz27PkA31AgIp93QWHT+VjYQ5MF978hF6NWa+sE6VizrKqgC4YzaLQloSP
 Qn2VMYVrqprOlxNvzBKL/M25nA55IUc01C8hwBVITNiH5WuNoAYDJUsor6B3+uq6HGnVwZFDn
 OT1xgz2cqIBVj7sfGBmXKrNqyAt7u1a4fES8SFSRF6dv1Flp5sGJLID0zmNPU6vgpi13qjhlF
 G5D1tlvjMkw6k+nO4d7b7/P3gpN+OLkh+jZYjIxuF7MTMPK5l9xyTC4kxhLdlx+VIpIlwliU+
 y0V2JJ4iG1R2Cq53Q04WYF61aRv827zPMKja/dqS187nHB+e9veJ9caUNH54BdeTq/J03cxCp
 ug8zfPft/vroxoXoO6+BTclREn4b8FXPuCD2Qv/yP2BVAyST/lhHm8cM=


--tl3l7oscxlsmmgsi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: next-20250915: error[E0425]: cannot find function
 `atomic_read_acquire` in crate `bindings`
MIME-Version: 1.0

On 25/09/16 09:56PM, Naresh Kamboju wrote:
> On Tue, 16 Sept 2025 at 11:17, Naresh Kamboju <naresh.kamboju@linaro.org>=
 wrote:
> >
> > The following build warnings / errors noticed on the arm arm64 and x86_=
64
> > with rust config build on the Linux next-20250915 tag.
> >
> > First seen on next-20250915
> > Good: next-20250912
> > Bad: next-20250915
> >
> > Regression Analysis:
> > - New regression? yes
> > - Reproducibility? yes
> >
> > * arm, build
> >   - rustclang-lkftconfig-kselftest
> >   - rustgcc-lkftconfig-kselftest
> >
> > * arm64, build
> >   - rustclang-lkftconfig-kselftest
> >   - rustgcc-lkftconfig-kselftest
> >
> > * x86_64, build
> >   - rustgcc-lkftconfig-kselftest
> >   - rustclang-nightly-lkftconfig-kselftest
> >
> > Build regression: next-20250915: error[E0425]: cannot find function
> > `atomic_read_acquire` in crate `bindings`
>=20
> Anders bisected this build regressions and found,
>=20
> # first bad commit:
>  [eb57133305f61b612252382d0c1478bba7f57b67]
>  rust: sync: Add basic atomic operation mapping framework

Is this still an issue on next-20250916? As far as I can tell this has
been fixed, but now there is another rust build issue, see
https://lore.kernel.org/regressions/0fee48bb-7411-4414-b4e7-395a8c3d0f6c@he=
usel.eu/
for more information.

Cheers,
Chris

>=20
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > ## Build log
> > error[E0425]: cannot find function `atomic_read_acquire` in crate `bind=
ings`
> >    --> rust/kernel/sync/atomic/internal.rs:124:37
> >     |
> > 124 |                   $unsafe { bindings::[< $ctype _ $func >]($($c_a=
rg,)*) }
> >     |                                       ^^^^^^^^^^^^^^^^^^^^ not
> > found in `bindings`
> > ...
> > 201 | / declare_and_impl_atomic_methods!(
> > 202 | |     /// Basic atomic operations
> > 203 | |     pub trait AtomicBasicOps {
> > 204 | |         /// Atomic read (load).
> > ...   |
> > 216 | | );
> >     | |_- in this macro invocation
> >     |
> >     =3D note: this error originates in the macro `impl_atomic_method`
> > which comes from the expansion of the macro
> > `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z
> > macro-backtrace for more info)
> > error: aborting due to 34 previous errors
> >
> > For more information about this error, try `rustc --explain E0425`.
> > make[3]: *** [rust/Makefile:553: rust/kernel.o] Error 1
> >
> >
> > ## Source
> > * Kernel version: 6.17.0-rc6
> > * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/ne=
xt/linux-next.git
> > * Git describe: 6.17.0-rc6-next-20250915
> > * Git commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
> > * Architectures: arm, arm64 and x86_64
> > * Toolchains: gcc (Debian 15.2.0-3) 15.2.0
> > * Kconfigs: rust config
> >
> > ## Build
> > * Build log: https://qa-reports.linaro.org/api/testruns/29894207/log_fi=
le/
> > * Build details:
> > https://regressions.linaro.org/lkft/linux-next-master/next-20250915/bui=
ld/rustgcc-lkftconfig-kselftest/
> > * Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkf=
t/builds/32l4UDzp0FMtS73JeG3kWpcoQrm
> > * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32=
l4UDzp0FMtS73JeG3kWpcoQrm/
> > * Kernel config:
> > https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UDzp0FMtS73J=
eG3kWpcoQrm/config
> >
> > --
> > Linaro LKFT
>=20
> - Naresh
>=20

--tl3l7oscxlsmmgsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmjJlEoACgkQwEfU8yi1
JYUh2hAAyo0MneTix6hFjD8ruKiMvRwwgbkfjDjj29QW0/pOaq/WyxT8FBGvJWSv
JUZSBSS3HsoM+KPqhlRwbv9TheDGNnNCYqM5w4P83XgmzYWC4zjl/ITX8H3UH28s
14/vPbYTC8are1EdkDGzrBw/wRg7ekqQE75BOVxPqTMOJ4IQlcTKkVaMZWwH6L7Y
XdECQomFGuD24WQ0ezkhHPkkEmg+VDqYYH5s+Q8hRn4w+uYDGWGegrjSfXUYzoj6
/vl6dkxmx9kQj99lFDebsvw6piNyAfSeS37EuYDE+uz0qf+dU1yWO7RMDsbcZY0K
Jdkpv0GRJt/p3WaOhO2P6iT0BGgz8dYG0B6I65UdqZUPT0Z/YMjmH6gsG5ShSyrm
RH+K8JV90VTgXa1USh2wjG7mGas9gEfGeLSogZNCjWjgiPa5sFXS3xx/e4KX6stF
KTFaW6GxdMsmeqy1F9cr4/CzyI1Tek9e985VOrsuHmnGqEK3rQb7eeXueYM5VIXR
yoJL3DcuSyOAVlt+/jhmOUZQeN3sok2K+ke8ApNzQBU6XyeY5ErlWndKjIfNtY/4
hsw/Q6VVQfiyIdXqinb+tIdL753aViGusuOFh4fU5/9tEjkXdg9oFqU7INj62x8A
b34zElsjs/uGjkVbAR/0RujA6kedS7k3SMFKqX6z/1MfmcfYqZ8=
=+ihB
-----END PGP SIGNATURE-----

--tl3l7oscxlsmmgsi--
