Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B982F37
	for <regressions@lists.linux.dev>; Wed, 22 Mar 2023 19:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E19C433D2;
	Wed, 22 Mar 2023 19:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679514259;
	bh=N79/XcqKwBlbg0yGxOvbsm3eH9+OCTisGoN2F8v82b8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gRlGQ9wNjBIpXZ9FVQ96iypTLUE5WU7B014UkpzC90/aakAHtexI3xEWGEgxqvwqw
	 zdOU1SO7M7TiO/b1UpRxNlHHBGZx9ZW3tG7PoMGblvOdQ7x+o1qRknl2khhYDa2m/H
	 v4gcnpfh4mBZSOOYjCjpTNEjugYkKy6piCqkRfTCZD9aA+bMP0s2JqmEYuhOhy7bQm
	 MDTqhQnclR3g46B1VJAx/i8Oc9DH8CKu/89PDfyHM5OQMdiVCy3j+zCIFMOhzKfrVx
	 Ysp5S8J2eYTDB/karvCpNIU9LsQDzIVPsr9GG//ZpqlN8ec7tMBU7HdE7BlwBxTw19
	 aFaY+8qmZvvuQ==
Date: Wed, 22 Mar 2023 19:44:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	regressions@leemhuis.info, regressions@lists.linux.dev
Subject: Re: [PATCH] riscv: require alternatives framework when selecting FPU
 support
Message-ID: <2a3b08ce-5ab1-41b6-ad58-edbeff7b1acb@spud>
References: <ZBruFRwt3rUVngPu@zx2c4.com>
 <20230322120907.2968494-1-Jason@zx2c4.com>
 <20230322124631.7p67thzeblrawsqj@orel>
 <1884bd96-2783-4556-bc57-8b733758baff@spud>
 <20230322192610.sad42xau33ye5ayn@orel>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T7/Amfx/a00q9icF"
Content-Disposition: inline
In-Reply-To: <20230322192610.sad42xau33ye5ayn@orel>


--T7/Amfx/a00q9icF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 08:26:10PM +0100, Andrew Jones wrote:
> On Wed, Mar 22, 2023 at 03:17:13PM +0000, Conor Dooley wrote:
> > On Wed, Mar 22, 2023 at 01:46:31PM +0100, Andrew Jones wrote:

> > > (It's tempting to just select RISCV_ALTERNATIVE from RISCV, but maybe=
 we
> > >  can defer that wedding a bit longer.)
> >=20
> > At that point, the config option should just go away entirely, no?
>=20
> Ah, yes, and that makes the idea even more attractive, as we could remove
> several ifdefs.

I went and did the cursory check, it's not compatible with XIP_KERNEL so
dropping the option entirely probably isn't a possibility :/

--T7/Amfx/a00q9icF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBtajQAKCRB4tDGHoIJi
0hClAQCSetegmG02nWJ9pd0GXnKzqZSmudE53aXR6LOGdXh6tgEA/wjyL0SllO0s
4zT1G8PMYjfg2xPVfBBR3FVlPbok/g0=
=wziO
-----END PGP SIGNATURE-----

--T7/Amfx/a00q9icF--
