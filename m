Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AE719AD8D
	for <regressions@lists.linux.dev>; Fri, 10 Jan 2025 09:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736499913; cv=none; b=cf/M7gmJ7Szw73xvECQstxTu1Sdt6L6FwkTOSy7P0Wtdfdqi8MG+xZFhhwxco2fAqmFTwlVWxIZ14Q5BEcHRQCrwDs5BFZAaEG4fO1RnGGALBVZyyqWwoqLjEoNooNyZ2Y7JP0zEkfFQQJ70n205BVNmj4Zms2Hx2oaztnEWajY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736499913; c=relaxed/simple;
	bh=1hZ73XkgovQk9ICaDNaqrTzvVxhI6xFNqPwN+dwq8W0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RidXDFFOca+Ba2cCm8N0clP1hl51UKCDwUitKVKWCzUWu+O7RjSTqZr70Cd7notwTkzroQa1j0uyKcmQ9dSRq1AhO8e8s7u5E0/ZmnOM5YrUaX185xmKv6zR9ud3f9o3rTep03tpWTkPtVUwfVCJcF12khXl81p9Vh8bzqdU/s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=yicggslM; arc=none smtp.client-ip=212.227.126.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="yicggslM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1736499890; x=1737104690; i=christian@heusel.eu;
	bh=WbIahtBu8FCxISqH3akxtwyVllMFJcJ1bSy+gqfheFE=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=yicggslM8PnvQfHKJjkYtxtEW+0DLx5oTaTXFZT204ckSsREd3CW7/yJUhAlJCA7
	 RfO7v2z9GKhfgI1rJVrRBJz8t3bP92f1JeFiJsvQjHUHfZMSanb5VluCMZi5zOxbc
	 sZhr27WV5Z2Ce9B5dnZ7DHec99kVAPL/uPYLDa60fuL4oA6T10Xbui0Tz3KXOwy5+
	 Y/nAnaoN1IIyw343X4PtYSsm4HoVkm0PVCit4iL8T4y4wu/UP4MHSwbLw7FsqaGuh
	 J4ZLqywMWdtlT/EiEHOuTNPc9BehlXwLpayjrLaCs523Kufgos9r5fNmx652bYorA
	 0imbuQ3bZet+4Kf/wg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([80.187.64.46]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mr8zO-1tBfpH3HhW-00Zqpe; Fri, 10 Jan 2025 10:04:50 +0100
Date: Fri, 10 Jan 2025 10:04:46 +0100
From: Christian Heusel <christian@heusel.eu>
To: Mario Limonciello <mario.limonciello@amd.com>, 
	Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Subject: [REGRESSION][BISECTED] BU40N Blu-Ray drive broken since 7627a0edef54
Message-ID: <e2be6f70-dff6-4b79-bd49-70ec7e27fc1c@heusel.eu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="agdgufwxrky6r4du"
Content-Disposition: inline
X-Provags-ID: V03:K1:XIWkKBmI7J917KIYFU1PreU8lC+l/trTY37/pShmS0K1qaEaZ2z
 Rgrcv+yDsj861tBxoZBVWS4IoexBokteKlZt2CoI8AKhGnZ8HH1UFNBzEbL4e2545LkmSe8
 NBtlbFq4p0raA1LCe9OQo6YwyLIXbOubXv9tEuXX5yERNjyRflVhKEyBMz5Y13dXaOO5Fin
 kVvb2EcsPAPWBKqkgm/gw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mbAfv/Q8W3A=;jDevMW9U5fLugUgbbF3C59COPaN
 h36fzeYX8ATu5xYd7HsE7dqMFF5oal6+AblvAhRIgiSjBnPuUmwcwBSn0dTv69YlmGemOX41O
 VcIYfMKXi12r+2GbjG8qTXlaqZmuu0aqVMDLZXsR6AvPke3TX+cYUAKe5VS6uYFhp1vAoNy3O
 I/LcFspkcRxEefOEUNG0IpuuRxiPZMAu4CbniYp55MxQpC1RUq3D6RbWQ39ao+VUFPBogvFk8
 3TWLIYhJyIp3tdijJshoJFQRXyw5G6IhxpJpVB94wUELqHlKmbhX5s5riZ64iqSRcwf2xXkEi
 ICbBXCHxXdQejCQOYRti3IUlknazQ/PqWMcKk6vF1BFwNJkUxKpzlaD5usZq1xIE9w4x2sp0P
 IEBNaDe7R33OfjPu0mDGdCEnefJitEcwFTrH9q8Ce8ruH13Fc/NHujtql5nzQo4Wpe5NNTGUR
 trjx9U4ZrOeKKRW2lq3moHO+2n6hcwJr1r6SBOIusqcDjl4kdVspVY/Y7eZ4fTRXDIzHXK9xV
 Mq21kJQAHhH/+/HC0KQqmrzqWYTLiu4TLc9TnpV6qF4SQuQo9b+tXdUx2r9xlTS9izm+45r8p
 y6DcRZKksdLNdgbJiraTJV7ypyeBnwWXrW7KB6OGLPT1JBIIoohnE4ZBLt/wcFBdn2UvbEts1
 Xy1MMA46JqPlyKxUqxHuzZdtF9MtWINOHYjLrJxtZq1y8r7MUmS6Qd0KOPjDCFgNByMny6Jf8
 TvJrAgTD5B+cOpeRu9BCRS9yPVWzJtpXwkMUTTnniGpYRx3twblv/cYnNsp01w9mooKLEf/yu
 OvwHcbZ/gjgu7tdWu/NVW2elssm/hGSrZ2RAa/ZoYFD4w=


--agdgufwxrky6r4du
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [REGRESSION][BISECTED] BU40N Blu-Ray drive broken since 7627a0edef54
MIME-Version: 1.0

Hello everyone,

we have recently received a report by a user in the Arch Linux Forums
user that their Blue Ray player, a HL-DT-ST BD-RE BU40N stopped working
somewhere since kernel version v6.8.0. We have then bisected the issue
together with them within the mainline kernel sources to the following
commit that changes the default power policy:

    7627a0edef54 ("ata: ahci: Drop low power policy board type")

The user reports that adding "ahci.mobile_lpm_policy=3D1" as a kernel
parameter fixes the issue for them.

Additionally fellow forum user @loqs came up with a quirk patch, that
sadly was reported to not work:

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index c085dd8..ef01ccd 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -4118,6 +4118,9 @@ static const struct ata_dev_quirks_entry __ata_dev_qu=
irks[] =3D {
 	{ "SAMSUNG MZ7TD256HAFV-000L9", NULL,       ATA_QUIRK_NOLPM },
 	{ "SAMSUNG MZ7TE512HMHP-000L1", "EXT06L0Q", ATA_QUIRK_NOLPM },
=20
+	/* Hitachi-LG Data Storage models with LPM issues */
+	{ "HL-DT-ST BD-RE BU40N", NULL, ATA_QUIRK_NOLPM },
+
 	/* devices that don't properly handle queued TRIM commands */
 	{ "Micron_M500IT_*",		"MU01",	ATA_QUIRK_NO_NCQ_TRIM |
 						ATA_QUIRK_ZERO_AFTER_TRIM },

So if anyone has feedback on why the patch does not work or any
alternative ideas for a solution that would be highly appreciated!

Cheers,
gromit

[0]: https://bbs.archlinux.org/viewtopic.php?id=3D302334

---

#regzbot introduced: 7627a0edef54
#regzbot link: https://bbs.archlinux.org/viewtopic.php?id=3D302334
#regzbot title: ata: ahci: Blue Ray player broken since power policy change

--agdgufwxrky6r4du
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmeA4q4ACgkQwEfU8yi1
JYULNBAAvSTAkqzoO25BOJqQWDfSrcUvn7ET0+IgWLliubsfpxSuoB6TtT2hVkZN
/XqjT/rJBtTwB2wjhHR5kbVCqaNjU2jZaux/toDXurS9ifY719KeS8IKn/y6HEkN
0f1IH2YPcIvzwSkPdxK7MPz0N5pfCkJwNiaxGR4vIGLHPCVSnCSo/OQ1O/i1B7Ke
VH9hO6ehtNf5Eu6ha7OsO57hwO+HRGHb8BAaCr52BLCbadLHOOXHgWQDofA+Kv1q
9SX2Yt7mKPTKD8mHWkVPdK8OJBZH/FsCDwiWEbOiaTg698y6Q48WH16KtfLLKXeN
0y7AJuP6bvnTVoJ2zkELXDggojHfrkXMnC/m5zoJMZIQ0FYW8QCPesxRYogWZXWr
+UR5GeJei1gtV9JV3zdvnYRXvEnC/+BznsPBgrJB5LsPPx+4WaxHJUI4H2iiW42Q
kdQMxgIFgWyo1vumJhlW5gD9ct+rakUmlPhOcExUrgFzCnoFtndkE3N6wzWD2ZNe
ttT7WQXL00PaZNyHmxhj6rFrRzo4vUbxcWgU00bhBxpXSPjIK9DvuCH+tOIMAdrQ
MV+HT1/iRPeZ4DiQC79Z0km8K9+J+82dVj8m4VO3LoDmFVwKwco+9TmSHD96GVhC
bf/Xltb0C0Z3HS8x55oTwDII9V5WOMGAdeKejVgoANiU3Kh/URE=
=DuzK
-----END PGP SIGNATURE-----

--agdgufwxrky6r4du--
