Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219A82CA5
	for <regressions@lists.linux.dev>; Tue,  7 Mar 2023 09:33:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pZTh2-0007l7-0d; Tue, 07 Mar 2023 10:33:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pZTgz-002RxZ-P9; Tue, 07 Mar 2023 10:33:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pZTgy-002wzY-QJ; Tue, 07 Mar 2023 10:33:08 +0100
Date: Tue, 7 Mar 2023 10:33:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Pierre Asselin <pa@panix.com>
Cc: linux-acpi@vger.kernel.org, regressions@lists.linux.dev,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [Regression] acpi: laptop panics early in boot
Message-ID: <20230307093308.m5enhuegm3r4qwvo@pengutronix.de>
References: <9f6cba7a8a57e5a687c934e8e406e28c.squirrel@mail.panix.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5xwoizhnk7z6op77"
Content-Disposition: inline
In-Reply-To: <9f6cba7a8a57e5a687c934e8e406e28c.squirrel@mail.panix.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: regressions@lists.linux.dev


--5xwoizhnk7z6op77
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

> Problem is still present in 6.3-rc1 .  Bisecting, the first bad commit
> is d6fb6ee1820c .

There is a small timeframe where the (now deleted) struct
acpi_device::driver is different from acpi_device::dev->driver. That's
because the latter is assigned to in drivers/base/dd.c's really_probe()
before the acpi probe function is called, while the former is assigned
only later.

So acpi_drv->ops.add(acpi_dev) is called with the driver set while that
was not true before d6fb6ee1820c.

To test if this is the culprit, can you please try a 5.19 kernel plus
the following patch?:

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index e2db1bdd9dd2..657a2520a3e1 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1022,6 +1022,8 @@ static int acpi_device_probe(struct device *dev)
 	struct acpi_driver *acpi_drv =3D to_acpi_driver(dev->driver);
 	int ret;
=20
+	acpi_dev->driver =3D acpi_drv;
+
 	if (acpi_dev->handler && !acpi_is_pnp_device(acpi_dev))
 		return -EINVAL;
=20
@@ -1032,8 +1034,6 @@ static int acpi_device_probe(struct device *dev)
 	if (ret)
 		return ret;
=20
-	acpi_dev->driver =3D acpi_drv;
-
 	pr_debug("Driver [%s] successfully bound to device [%s]\n",
 		 acpi_drv->name, acpi_dev->pnp.bus_id);
=20

If the above patch breaks 5.19 that's the trail we have to follow. That
this is timing-related is strange though.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5xwoizhnk7z6op77
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQHBNEACgkQwfwUeK3K
7AmcAwf/cgXNS274mBJJlX1uA2cv9j3AFPcMGzLPZ6dKO06ergAcVpboCOiEZ/xG
OSu/i+awxSCld8dlaiIgmRqjWKL1UGGZz0rcY6h1UucqyS5o5TLaO9bpks3DFUi5
RZ0wjCB9SEdxoJu7p+LlpC3EJr/17k57U86szOpzXi3V9W1K424w3eS30AEkzw6U
W81vmf2Asaya3Qv3DVgcG9yqIIOf8fmJiNQJ9n1p6BkyH/TivkQ7QynXjgiTXoFX
wNJgeA2FT+/K5ZHUGiE3kPCmIhyLA3QkeASg89co+UyCVh//0OsYK7C6Uq0hHeze
PZ7K79UigClZ9YdZWZvKhnoVYtatvA==
=H4CK
-----END PGP SIGNATURE-----

--5xwoizhnk7z6op77--
