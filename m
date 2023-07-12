Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [195.201.174.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD63B635
	for <regressions@lists.linux.dev>; Wed, 12 Jul 2023 06:49:02 +0000 (UTC)
Received: from leda.eworm.net (unknown [194.36.25.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx.mylinuxtime.de (Postfix) with ESMTPSA id BF48E23D399;
	Wed, 12 Jul 2023 08:48:54 +0200 (CEST)
Date: Wed, 12 Jul 2023 08:48:50 +0200
From: Christian Hesse <list@eworm.de>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-integrity@vger.kernel.org, Thorsten Leemhuis
 <regressions@leemhuis.info>, Lino Sanfilippo <l.sanfilippo@kunbus.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>, Peter Huewe
 <peterhuewe@gmx.de>, Christian Hesse <mail@eworm.de>,
 stable@vger.kernel.org, roubro1991@gmail.com, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 1/2] tpm/tpm_tis: Disable interrupts for Framework
 Laptop Intel 12th gen
Message-ID: <20230712084850.1e12ca3f@leda.eworm.net>
In-Reply-To: <31d20085105784a02b60f11d46f2c7fec4d3aa0a.camel@kernel.org>
References: <20230710133836.4367-1-mail@eworm.de>
	<20230710142916.18162-1-mail@eworm.de>
	<20230710231315.4ef54679@leda.eworm.net>
	<bd0587e16d55ef38277ab1f6169909ae7cde3542.camel@kernel.org>
	<31d20085105784a02b60f11d46f2c7fec4d3aa0a.camel@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
X-Face: %O:rCSk<c"<MpJ:yn<>HSKf7^4uF|FD$9$I0}g$nbnS1{DYPvs#:,~e`).mzj\$P9]V!WCveE/XdbL,L!{)6v%x4<jA|JaB-SKm74~Wa1m;|\QFlOg>\Bt!b#{;dS&h"7l=ow'^({02!2%XOugod|u*mYBVm-OS:VpZ"ZrRA4[Q&zye,^j;ftj!Hxx\1@;LM)Pz)|B%1#sfF;s;,N?*K*^)
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAGFBMVEUZFRFENy6KVTKEd23CiGHeqofJvrX4+vdHgItOAAAACXBIWXMAAA3XAAAN1wFCKJt4AAACUklEQVQ4y2VUTZeqMAxNxXG2Io5uGd64L35unbF9ax0b3OLxgFs4PcLff0lBHeb1QIq5uelNCEJNq/TIFGyeC+iugH0WJr+B1MvzWASpuP4CYHOB0VfoDdddwA7OIFQIEHjXDiCtV5e9QX0WMu8AG0mB7g7WP4GqeqVdsi4vv/5kFBvaF/zD7zDquL4DxbrDGDyAsgNYOsJOYzth4Q9ZF6iLV+6TLAT1pi2kuvgAtZxSjoG8cL+8vIn251uoe1OOEWwbIPU04gHsmMsoxyyhYsD2FdIigF1yxaVbBuSOCAlCoX324I7wNMhrO1bhOLsRoA6DC6wQ5eQiSG5BiWQfM4gN+uItQTRDMaJUhVbGyKWCuaaUGSVFVKpl4PdoDn3yY8J+YxQxyhlHfoYOyPgyDcO+cSQK6Bvabjcy2nwRo3pxgA8jslnCuYw23ESOzHAPYwo4ITNQMaOO+RGPEGhSlPEZBh2jmBEjQ5cKbxmr0ruAe/WCriUxW76I8T3h7vqY5VR5wXLdERodg2rHEzdxxk5KpXTL4FwnarvndKM5/MWDY5CuBBdQ+3/0ivsUJHicuHd+Xh3jOdBL+FjSGq4SPCwco+orpWlERRTNo7BHCvbNXFVSIQMp+P5QsIL9upmr8kMTUOfxEHoanwzKRcNAe76WbjBwex/RkdHu48xT5YqP70DaMOhBcTHmAVDxLaBdle93oJy1QKFUh2GXT4am+YH/GGel1CeI98GdMXsytjCKIq/9cMrlgxFCROv+3/BU1fijNpcVD6DxE8VfLBaxUGr1D5usgDYdjwiPAAAAAElFTkSuQmCC
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yQI_sn/JO1S3ejmlYu+D=W5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yQI_sn/JO1S3ejmlYu+D=W5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Jarkko Sakkinen <jarkko@kernel.org> on Tue, 2023/07/11 00:51:
> On Tue, 2023-07-11 at 00:29 +0300, Jarkko Sakkinen wrote:
> > OK, this good to hear! I've been late with my pull request (past rc1)
> > because of kind of conflicting timing with Finnish holiday season and
> > relocating my home office.
> >=20
> > I'll replace v2 patches with v3 and send the PR for rc2 after that.
> > So unluck turned into luck this time :-)
> >=20
> > Thank you for spotting this! =20
>=20
> Please, sanity check before I send the PR for rc2:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/

Looks good and works as expected on Framework Laptop 12th Gen, verified by =
me
and someone in the linked bugzilla ticket. I do not have Framework Laptop
13th Gen available for testing.

Looks like there are general workarounds by disabling interrupts after a
number of unhandled IRQs. Will this still go in?
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Best regards             my address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*    Chris            cc -ox -xc - && ./x    */b/42*2-3)*42);}

--Sig_/yQI_sn/JO1S3ejmlYu+D=W5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXHmveYAHrRp+prOviUUh18yA9HYFAmSuTNIACgkQiUUh18yA
9HYg+QgAwzieNysWbqPhs/vDDbC2UQSFn9f7GXd/kHbjTSNbH3RMsJCwzB1W9kIl
cjxizF1ljdu1YUfq/GgLn1GpOhqCOPbYDSmnCiPHI25I4h25djJwBxTHOwjYmYdR
JvnSC8h3VczNcJLjswKX2lzl+nkNGclkszYF/RaTwX+Rj4sTRx56XbXsAxGYgQPN
HMabdUlm34Tb9uOXETAl4k1nE1sS/iQDpgLnES9HOZPSvusjZ5oiKiwGypT/FFxe
//Zu3u0fCFevFFHokDswB4keGaAh/skbZkpJhmGPMo80Pq8rayO5A7wou9yVLhO6
KmVSNyN/dJiRaa0JxdnUxQI0Xq576w==
=tP9E
-----END PGP SIGNATURE-----

--Sig_/yQI_sn/JO1S3ejmlYu+D=W5--
