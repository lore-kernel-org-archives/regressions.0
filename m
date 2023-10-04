Received: from abi149hd125.arn1.oracleemaildelivery.com (abi149hd125.arn1.oracleemaildelivery.com [129.149.84.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1E515E84
	for <regressions@lists.linux.dev>; Wed,  4 Oct 2023 16:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-arn1-20220924;
 d=augustwikerfors.se;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=8T0PGx2dNJlnTyxCzlVq4bOxn0w4Q9z3eZpQdiPzdRU=;
 b=G60Gta9gOZ/E3LGGrRm3EShbs4AV8X9tq3dH6Z+O5z2vbG5lIYIEZSoQE1RkFxmXWH0LdrILaUnK
   46u89YI1+bQ57txxV4T0bynE8rY4GNrlwC6IU9QjpWknLsvMjzhRoLJUne0OEYn84H0jOPqekKZj
   IB/TcWFDvljcNOgDpiRFciFzOdYMliaiDnI9tl8W787A6G0cYXWywO/ku+vCUBymGjBg7c93m7ig
   1QCKQOLlZ4/+9zsWzOy2EEq7+z6ILmE032yruVwTHUv5ONdmQjaBK2IEemtc/0WRNKbfw3vYVsj3
   IXFphRVOwl/y+C8nF8YGQRQYoryypFsUZIwJvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-arn-20211201;
 d=arn1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=8T0PGx2dNJlnTyxCzlVq4bOxn0w4Q9z3eZpQdiPzdRU=;
 b=N30DlDb52o7ps8zoqhHRYRQgz1K9YK3GEIAIb0DOJDifUhUN1dd9uRpFRsxDYonthnV/OhRlY8PQ
   Pgfre6sfotICob5A1gtyLkRUiPhbaG2v7Yd4+J6W/S7mCrTYGRd1PINx1Nw5QxR+xosEfv13opWX
   +qgarbJAtwINpxFXBf+2TIJg9ztn75cZ3MJtcSvkXPuSJ8N2Bakf8Gnft6HvvySXPQXEG5mA4x0P
   +TWQrQbe7peIbarusaT7ojsGJYBPV9uOG6BIvX0jHogK9Y5XbQrVM1mBQW/l4za3VljAyHxCrTjR
   RF2vBkf+zqwhlsqxyOoJZ6mE6/YbJPE68Xc30A==
Received: by omta-ad1-fd1-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230808 64bit (built Aug  8
 2023))
 with ESMTPS id <0S20002V9JCYDZ30@omta-ad1-fd1-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com>
 for regressions@lists.linux.dev; Wed, 04 Oct 2023 16:34:10 +0000 (GMT)
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: quoted-printable
From: August Wikerfors <git@augustwikerfors.se>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-version: 1.0
Subject: Re: Patch
 "ASoC: amd: yc: Fix non-functional mic on Lenovo 82QF and 82UG" has been added
 to the 6.1-stable tree
Message-id: <B48DED01-5B50-4EF7-B0AC-2DC742D07890@augustwikerfors.se>
Date: Wed, 4 Oct 2023 18:33:55 +0200
Cc: broonie@kernel.org, stable-commits@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>, regressions@lists.linux.dev
To: gregkh@linuxfoundation.org, stable@vger.kernel.org
Reporting-Meta:
 AAEHWQsg/CM5M6X2tVhNU4NXmxPo0N7v07ec6PufRpyTJI3MyRZ78LZwL2o/Wwp9
 FHmUjMf8uxnMCWG7lXdRqo7w80jiK9yzPzi4nJr2rxMHUpITY+VyN1lOYIYTG/UB
 bEvWq+5RKEsTuyyp/9sTBc0Q7lAaG6+moEcTSCYQM4/aEPLZm/0xC9eaxHP9TfvN
 OO6rEsWSv3ylD4JRIc7BW9VgfMusrzlSFjArsV1d9m9UNJg04p7i947SVKR1ka2I
 p/vqqrdimg2d8IsC4OCviDBjSSq2sHJIj46Fp3SvBUD1VKhxp2arZaNe1UmQvlmt
 I8FtbRrLuTvRM7roK9k/quB0lqIIeRgF2VoEcKvH9jHfYw3lDWdw+2Rti6wp2zXd
 MrAKa6hSO796byHfcFE0dbJn21aV0x2H5K/wctf+HiLPoSV8M+MqnO2bIGd5j0WQ XQuRgQ==

Hi Greg,

> On 4 Oct 2023, at 16:58, gregkh@linuxfoundation.org wrote:
>=20
> =EF=BB=BF
> This is a note to let you know that I've just added the patch titled
>=20
>  ASoC: amd: yc: Fix non-functional mic on Lenovo 82QF and 82UG
>=20
> to the 6.1-stable tree which can be found at:
>  http://www.kernel.org/git/?p=3Dlinux/kernel/git/stable/stable-queue.git;a=
=3Dsummary
>=20
> The filename of the patch is:
>   asoc-amd-yc-fix-non-functional-mic-on-lenovo-82qf-and-82ug.patch
> and it can be found in the queue-6.1 subdirectory.
>=20
> If you, or anyone else, feels it should not be added to the stable tree,
> please let <stable@vger.kernel.org> know about it.
>=20
>=20
> =46rom 1263cc0f414d212129c0f1289b49b7df77f92084 Mon Sep 17 00:00:00 2001
> From: August Wikerfors <git@augustwikerfors.se>
> Date: Mon, 11 Sep 2023 23:34:09 +0200
> Subject: ASoC: amd: yc: Fix non-functional mic on Lenovo 82QF and 82UG
>=20
> From: August Wikerfors <git@augustwikerfors.se>
>=20
> commit 1263cc0f414d212129c0f1289b49b7df77f92084 upstream.
>=20
> Like the Lenovo 82TL and 82V2, the Lenovo 82QF (Yoga 7 14ARB7) and 82UG
> (Legion S7 16ARHA7) both need a quirk entry for the internal microphone to=

> function. Commit c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on=

> Lenovo 82SJ") restricted the quirk that previously matched "82" to "82V2",=

> breaking microphone functionality on these devices. Fix this by adding
> specific quirks for these models, as was done for the Lenovo 82TL.
>=20
> Fixes: c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on Lenovo 82=
SJ")
> Closes: https://github.com/tomsom/yoga-linux/issues/51
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D208555#c780
> Cc: stable@vger.kernel.org
> Signed-off-by: August Wikerfors <git@augustwikerfors.se>
> Link: https://lore.kernel.org/r/20230911213409.6106-1-git@augustwikerfors.=
se
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Please also add commit cfff2a7794d2 ("ASoC: amd: yc: Fix a non-functional mi=
c on Lenovo 82TL") to 6.1+ as it fixed the same regression for another model=
 (but wasn=E2=80=99t tagged for stable).

Regards,
August Wikerfors=
