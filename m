Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1FD26770B
	for <regressions@lists.linux.dev>; Tue, 25 Feb 2025 12:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740486501; cv=none; b=mG5D/+Sr6+60lzeVgL+TNbWAkBiMM5gvhcLUwiBT7GUBGYvdH9tG0LWjgDDr7gRs+N2PDf7kSHmiNKJe9Ll6UslZQaZzukbMiNR127JyUmmGe/rjhf14U+2US+ExWL85C/zlunzDY5ZOMFEcxfnbxqplydXMGi3vbtbHm5Xb4eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740486501; c=relaxed/simple;
	bh=rBqKwtM6TD/w7cO+MBuJKkrvOiRxxXCewJk5I4pIH9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wg887S1ET9CQheqDw+KJSv5ncqhbK94NeYbLAW4TZ9BKcqvDc5wT9KEGooiIu8w+zz9oRPVCjXiRVEUkZ5ooig68NNKQeYmFrfOmtyBYHxo3VEcq1g0CFi6k5+Q79V/eObSoV4rcrEyV95/Ny4J8Cw4VXCwAmvMT4/zNpsb0lgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iP1MqT8X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iP1MqT8X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBACEC4CEDD;
	Tue, 25 Feb 2025 12:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740486500;
	bh=rBqKwtM6TD/w7cO+MBuJKkrvOiRxxXCewJk5I4pIH9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iP1MqT8Xdi32fclKJu6jTbTEXEM5DDhZMo6LYP+6z+0VAUovANBCNpJb+F6BEurWI
	 AHqErElN59ruYIeCKOlihw/cbI3l57WCCpLkbRRzsjvhqSfOXOkg86owt71Zsriz5h
	 P3HUONbRLI01vKYocS909wyrskEaLC+2o/PzCOvIDk2j+fShvFimA+oOzuomYsrPe8
	 F9idjmEvztYAtSw+ZM65swWyBBq71zSAFPD+OozP3XdgsbomL+WN1z3Ad5yHRa4L3K
	 baezFv4swAI130EAHQuHeCKRAXSr5N/H3j1Sbq5r3ZMzSoI1tWzYfzJC/daigoBf7u
	 +csqbcswB/lUA==
Date: Tue, 25 Feb 2025 12:28:15 +0000
From: Mark Brown <broonie@kernel.org>
To: kernelci-results@groups.io, bot@kernelci.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com
Subject: Re: [REGRESSION] next/master: (boot) WARNING at
 drivers/gpio/gpiolib.c:349 gpiochip_get_direction+0xc8/...
Message-ID: <016580ec-2b16-4ac5-a724-5e26419538fa@sirena.org.uk>
References: <CACo-S-3CDuZpEeJBbP9_f21aRb4B8Vdj784f3J0NPPs+hu0mfA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QfpfuJoBkMgrKITl"
Content-Disposition: inline
In-Reply-To: <CACo-S-3CDuZpEeJBbP9_f21aRb4B8Vdj784f3J0NPPs+hu0mfA@mail.gmail.com>
X-Cookie: I'm not available for comment..


--QfpfuJoBkMgrKITl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 01:55:08AM -0800, KernelCI bot wrote:

> New boot regression found on next/master:

Looks like more platforms which need fixups for the return value of
get_direction():

> ---
>  WARNING at drivers/gpio/gpiolib.c:349
> gpiochip_get_direction+0xc8/0x108
> [logspec:generic_linux_boot,linux.kernel.warning]
> ---
>=20
> - dashboard: https://d.kernelci.org/issue/maestro:f3a22e054a59c4f786527f8=
c71545728bee8714a
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
=2Egit
> - commit HEAD:  0226d0ce98a477937ed295fb7df4cc30b46fc304
>=20
>=20
> Log excerpt:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> [    1.920880] WARNING: CPU: 7 PID: 1 at drivers/gpio/gpiolib.c:349
> gpiochip_get_direction+0xc8/0x108
> [    1.921033] Modules linked in:
> [    1.921105] CPU: 7 UID: 0 PID: 1 Comm: swapper/0 Tainted: G
> W          6.14.0-rc4-next-20250225 #1
> [    1.921260] Tainted: [W]=3DWARN
> [    1.921320] Hardware name: Google juniper sku16 board (DT)
> [    1.921411] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    1.921526] pc : gpiochip_get_direction+0xc8/0x108
> [    1.921617] lr : gpiochip_get_direction+0xc4/0x108
> [    1.921707] sp : ffff8000800d7340
> [    1.921771] x29: ffff8000800d7340 x28: 1fffe7c2e0394929 x27: ffff3e170=
230e3d0
> [    1.921912] x26: dfff800000000000 x25: ffff3e1702053000 x24: ffff3e170=
230e3d8
> [    1.922053] x23: ffff3e1701ca48a0 x22: ffffb19df70f4b40 x21: ffffb19df=
6408000
> [    1.922193] x20: 00000000000000bf x19: ffff3e1701ca48a0 x18: 000000000=
0000004
> [    1.922334] x17: ffffb19def596200 x16: 0000000000000000 x15: ffff3e170=
0950954
> [    1.922474] x14: 1fffe7c2e012a137 x13: 1ffff633bf0fb814 x12: ffff67c2e=
0461c76
> [    1.922614] x11: 1fffe7c2e0461c75 x10: ffff67c2e0461c75 x9 : dfff80000=
0000000
> [    1.922753] x8 : ffff3e170230e3af x7 : 0000000000000001 x6 : ffff67c2e=
0461c75
> [    1.922894] x5 : 1ffff633bec811bb x4 : dfff800000000000 x3 : 1fffe7c2e=
343b086
> [    1.923035] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 000000000=
0000000
> [    1.923174] Call trace:
> [    1.923227]  gpiochip_get_direction+0xc8/0x108 (P)
> [    1.923320]  gpiochip_add_data_with_key+0xfdc/0x19a4
> [    1.923416]  mtk_paris_pinctrl_probe+0x9b8/0xf78
> [    1.923505]  platform_probe+0xc4/0x214
> [    1.923584]  really_probe+0x188/0x5d0
> [    1.923661]  __driver_probe_device+0x160/0x2e8
> [    1.923747]  driver_probe_device+0xe8/0x298
> [    1.923831]  __device_attach_driver+0x184/0x328
> [    1.923918]  bus_for_each_drv+0x104/0x18c
> [    1.923999]  __device_attach+0x168/0x358
> [    1.924079]  device_initial_probe+0x14/0x20
> [    1.924163]  bus_probe_device+0x128/0x160
> [    1.924244]  device_add+0x8bc/0xdcc
> [    1.924317]  of_device_add+0xdc/0x150
> [    1.924392]  of_platform_device_create_pdata+0x11c/0x1f4
> [    1.924490]  of_platform_bus_create+0x290/0x610
> [    1.924576]  of_platform_bus_create+0x2d8/0x610
> [    1.924663]  of_platform_populate+0x74/0x118
> [    1.924747]  of_platform_default_populate_init+0x100/0x120
> [    1.924850]  do_one_initcall+0x128/0x760
> [    1.924931]  do_initcalls+0x158/0x288
> [    1.925008]  kernel_init_freeable+0x330/0x474
> [    1.925095]  kernel_init+0x30/0x204
> [    1.925171]  ret_from_fork+0x10/0x20
> [    1.925247] irq event stamp: 129328
> [    1.925314] hardirqs last  enabled at (129327):
> [<ffffb19df0ea52b4>] exit_to_kernel_mode+0x38/0x118
> [    1.925462] hardirqs last disabled at (129328):
> [<ffffb19df0ea5488>] el1_dbg+0x24/0x8c
> [    1.925596] softirqs last  enabled at (129298):
> [<ffffb19ded7a6e34>] handle_softirqs+0x8ec/0xd90
> [    1.925742] softirqs last disabled at (129293):
> [<ffffb19ded610970>] __do_softirq+0x14/0x20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>=20
>=20
> # Hardware platforms affected:
>=20
> ## mt8183-kukui-jacuzzi-juniper-sku16
> - dashboard: https://d.kernelci.org/test/maestro:67bd70e1323b35c54a882491
> - compatibles: google,juniper-sku16 | google,juniper | mediatek,mt8183
> - 1 fails since 2025-02-25 08:37 UTC
> - test path: boot
> - last pass: https://d.kernelci.org/test/maestro:67bc6ce1323b35c54a85d5e9
>     - on 2025-02-24 12:58 UTC
>     - commit hash:  4ef7aa6a88280d015c6533a210e46efd55bdb57f
>     - test id:  maestro:67bc6ce1323b35c54a85d5e9
>=20
> ## mt8186-corsola-steelix-sku131072
> - dashboard: https://d.kernelci.org/test/maestro:67bd70e2323b35c54a882494
> - compatibles: google,steelix-sku131072 | google,steelix
> - 1 fails since 2025-02-25 08:27 UTC
> - test path: boot
> - last pass: https://d.kernelci.org/test/maestro:67bc6ce2323b35c54a85d5ec
>     - on 2025-02-24 12:58 UTC
>     - commit hash:  4ef7aa6a88280d015c6533a210e46efd55bdb57f
>     - test id:  maestro:67bc6ce2323b35c54a85d5ec
>=20
> ## mt8192-asurada-spherion-r0
> - dashboard: https://d.kernelci.org/test/maestro:67bd70e3323b35c54a882497
> - compatibles: google,spherion-rev3 | google,spherion-rev2
> - 1 fails since 2025-02-25 08:35 UTC
> - test path: boot
> - last pass: https://d.kernelci.org/test/maestro:67bc6ce3323b35c54a85d5ef
>     - on 2025-02-24 12:58 UTC
>     - commit hash:  4ef7aa6a88280d015c6533a210e46efd55bdb57f
>     - test id:  maestro:67bc6ce3323b35c54a85d5ef
>=20
> ## mt8195-cherry-tomato-r2
> - dashboard: https://d.kernelci.org/test/maestro:67bd70e4323b35c54a88249a
> - compatibles: google,tomato-rev2 | google,tomato | mediatek,mt8195
> - 1 fails since 2025-02-25 08:27 UTC
> - test path: boot
> - last pass: https://d.kernelci.org/test/maestro:67bc6ce4323b35c54a85d5f2
>     - on 2025-02-24 12:58 UTC
>     - commit hash:  4ef7aa6a88280d015c6533a210e46efd55bdb57f
>     - test id:  maestro:67bc6ce4323b35c54a85d5f2
>=20
> ## sc7180-trogdor-kingoftown
> - dashboard: https://d.kernelci.org/test/maestro:67bd70e5323b35c54a88249d
> - compatibles: google,kingoftown | qcom,sc7180
> - 1 fails since 2025-02-25 08:27 UTC
> - test path: boot
> - last pass: https://d.kernelci.org/test/maestro:67bc6ce5323b35c54a85d613
>     - on 2025-02-24 12:58 UTC
>     - commit hash:  4ef7aa6a88280d015c6533a210e46efd55bdb57f
>     - test id:  maestro:67bc6ce5323b35c54a85d613
>=20
> ## sc7180-trogdor-lazor-limozeen
> - dashboard: https://d.kernelci.org/test/maestro:67bd70e6323b35c54a8824a0
> - compatibles: google,lazor-rev5-sku5 | google,lazor-rev5-sku6
> - 1 fails since 2025-02-25 08:27 UTC
> - test path: boot
> - last pass: https://d.kernelci.org/test/maestro:67bc6ce5323b35c54a85d616
>     - on 2025-02-24 12:58 UTC
>     - commit hash:  4ef7aa6a88280d015c6533a210e46efd55bdb57f
>     - test id:  maestro:67bc6ce5323b35c54a85d616
>=20
>=20
> #kernelci issue maestro:f3a22e054a59c4f786527f8c71545728bee8714a
>=20
> Reported-by: kernelci.org bot <bot@kernelci.org>
>=20
>=20
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
>=20
> Made with love by the KernelCI team - https://kernelci.org
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#58537): https://groups.io/g/kernelci-results/message/=
58537
> Mute This Topic: https://groups.io/mt/111374733/1131744
> Group Owner: kernelci-results+owner@groups.io
> Unsubscribe: https://groups.io/g/kernelci-results/unsub [broonie@kernel.o=
rg]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20

--QfpfuJoBkMgrKITl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme9t18ACgkQJNaLcl1U
h9BiHAf/YyACBPUhJL+IjhslJ5CTXl9Vdmy2VhmuA/12/DEPj+novWMwsbmzI5FB
LL5lJupfZaEnOZpZtyJvocPrZDhO8ZRfOL1QsDSvFkM+mslLmb2z00L7t4u+SYk1
LGm+u31PC/+VKIVWYVJ6SO3ToVvXp+OeOmIsZJOclI3arGnA4CrDWx7LjXW1wJ1f
Yjxu3+axa7MnftSqEsaXxu4nP5xMYbQLyjz+WfoaaRSHXdrBr6B1pyuADyhPGy0N
QDTsWR8uKS7/vj20eQaJGIlLe/UJdMhp3mJwFqukAtaRXHGGl3R3cc8t6zTOGyRV
3d1cYm5//nfhn6Jr/eSxGK1kNTg8bg==
=K2BO
-----END PGP SIGNATURE-----

--QfpfuJoBkMgrKITl--
