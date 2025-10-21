Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E6C329C76
	for <regressions@lists.linux.dev>; Tue, 21 Oct 2025 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761041272; cv=pass; b=cCO09kUItetzvpLKLn490BhZcu8Y+EhXdiXijKYl1D4rqxDLMIHIs3iWjGZRJB5d4pSl3M6KVZIuOutQe77sanr+Xxk+D0IMQ/pBb/W9FhtPA5nt9z7RoHWuSm2VuAvumoM9Fjink7z44qQ3bfz0bmwCObNXIkEwejyMarV8oTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761041272; c=relaxed/simple;
	bh=Zy+YIx4wOUtLteMs5mbXIF/xPPefUp5YEVyDK3zwUFQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gkp0XnZAJi3sVtT07giNgCjqXN+viQsRQzmI62QT9B+wOCCWDkZAKXjbc+B4vBf3cEt7Drw8BcjKFdBu+n7FkedBGMfgqbWqU//QzFEyH6G7Hm6nUtjkamg0881cQE0yUGpAWHXDv9qBDddNiaLqW0VF1si4WWLlbEzZYFofdYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=iDPSzf+r; arc=pass smtp.client-ip=94.100.134.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="iDPSzf+r"
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=jofrQ0T7wEpqVhNL9sL4aUoJ4MX3kqIvOomYczAKOzs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761041249;
 b=eYcp1aY68/mpsurFTQcBlcUa2lPvr4lo38aSifgDbf1N5QhmmwftTymYwyUr3NK8FkBz1kUE
 1DKP5I/CF7vwA26DA5FEQGjfSa8fzwm5jppLzp53b7RN0S2qxZGVQmxpDwlI8qY/YnTZ6dvic2/
 EHEIgB3iKkh24Lk0SLNWTuAdNY7ldZy1TcKxQ2Eey5NSn1J82u5jm2qTvSio8Tvgf2Sx21vsVQi
 Aa0jXWdHHhEsNCqC6/4KT7YCC3js5XsxR57LFfy6N98rEyB04KmZTN0RlB8crSd0WW8S98nwrRa
 JW4MQMrFSpJZlprQZnuL+PIuB3lwLS45NlfqGvhDtYJbg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761041249;
 b=Bl4x8NkbJiIPQKJ903Mm2gyMgWxxRb/6ox6CpjQm2KmaD6lBPJA5PKcF1n9Oj7KtviVBK/6v
 JM9BjByr66Eivy3KrXLVrJMOQtGOv/aMN3T3cgzA7J8uQj/aVo/5w2uo626+Q6uCop3Z0s6/Gjj
 0sUemEBxjNVZwCa4rHb6wHmNP1qFIGq7XQVDvIesIM4Iyjisj3qMjQXJp5FkXA+A0Vv7QW6OPnS
 DAg8kYxUQHGhAzj8DWS9KmjAn6C7OmtyCp0wuIi+3CMDvC/J/WGKqfIL0dkkpgJEmn0JX4MGsiR
 VD6zbR7F4NaLxmkuke748ymJeI6Og1+GaGnARmJ87ezNA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Tue, 21 Oct 2025 12:07:28 +0200
Received: from [192.168.153.128] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D25185A0EFE;
	Tue, 21 Oct 2025 12:06:32 +0200 (CEST)
Message-ID: <1a849a0b515c77faebe28456d6537d39d4ca32d0.camel@ew.tq-group.com>
Subject: Re: [REGRESSION] Suspend to RAM does not work anymore with
 k3-am62-ti-ipc-firmware.dtsi
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Beleswar Prasad Padhi <b-padhi@ti.com>, Francesco Dolcini
	 <francesco@dolcini.it>
Cc: Hiago De Franco <hiagofranco@gmail.com>, nm@ti.com, vigneshr@ti.com, 
 kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org,  afd@ti.com, u-kumar1@ti.com, hnagalla@ti.com,
 jm@ti.com, d-gole@ti.com,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org, Robert
 Nelson <robertcnelson@gmail.com>,  =?ISO-8859-1?Q?Jo=E3o?= Paulo
 =?ISO-8859-1?Q?Gon=E7alves?= <joao.goncalves@toradex.com>, Emanuele Ghidoli
 <emanuele.ghidoli@toradex.com>,  Francesco Dolcini
 <francesco.dolcini@toradex.com>, Logan Bristol <logan.bristol@utexas.edu>,
 Josua Mayer <josua@solid-run.com>, John Ma <jma@phytec.com>, Nathan
 Morrisson <nmorrisson@phytec.com>, Garrett Giordano <ggiordano@phytec.com>,
 Matt McKee <mmckee@phytec.com>, Wadim Egorov <w.egorov@phytec.de>, Max
 Krummenacher <max.krummenacher@toradex.com>, Stefan Eichenberger
 <stefan.eichenberger@toradex.com>, Hiago De Franco
 <hiago.franco@toradex.com>,  Diogo Ivo <diogo.ivo@siemens.com>, Li Hua Qian
 <huaqian.li@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Baocheng Su
 <baocheng.su@siemens.com>, Benedikt Niedermayr
 <benedikt.niedermayr@siemens.com>, regressions@lists.linux.dev
Date: Tue, 21 Oct 2025 12:06:32 +0200
In-Reply-To: <cf10f312-3ba1-4226-96da-d2c9a149c1c7@ti.com>
References: 
	<sid7gtg5vay5qgicsl6smnzwg5mnneoa35cempt5ddwjvedaio@hzsgcx6oo74l>
	 <e60dd8d6-2bd5-41f0-bf8a-b0a5822a7f88@ti.com>
	 <20251021093420.GA28462@francesco-nb>
	 <cf10f312-3ba1-4226-96da-d2c9a149c1c7@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-cloud-security-sender:matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient:regressions@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4crScp6Fzyz4MZyc
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:0a2fbe90152789f9a2452f0c191400a4
X-cloud-security:scantime:2.520
DKIM-Signature: a=rsa-sha256;
 bh=jofrQ0T7wEpqVhNL9sL4aUoJ4MX3kqIvOomYczAKOzs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761041248; v=1;
 b=iDPSzf+rSPajyLIPyRapnA/JNUPWW2pyatQJatRjN1Bei3wi19ptWS1W3+L0Sobikhfsh704
 X+HNrbM21mkvbMLjSSfm/1aJBHOjnMPUFU4d45kk9ErCPn+TWhu0semPsESK1pNQ4W2KOMLcHno
 5XwNvb8ye+w/YkdlrbxKATdQ9pxZ/P2quYzo/0MnJbClZKRK+9GJRoTSDMfPG0lYDt0EGzC/l9Y
 6g11uC8iLVi3WJIjeyftnww67cpLV8uyb19b4rqeFi4LwXQWKhapMHMEMDrkTy/+so8SSqkQDCH
 A2G+hRXHXv9CrP0UCo4uuG6bL5qXSs+3ZEwOIbmrSkjAw==

On Tue, 2025-10-21 at 15:26 +0530, Beleswar Prasad Padhi wrote:
> On 21/10/25 15:04, Francesco Dolcini wrote:
> > On Tue, Oct 21, 2025 at 02:33:10PM +0530, Beleswar Prasad Padhi wrote:
> > > On 20/10/25 19:47, Hiago De Franco wrote:
> > > > DM R5 sends a message that is never consumed, since no firmware is
> > > > running on the M4 (the core is offline).
> > >=20
> > > May I know why you are not running any firmware on the M4
> > > rproc? If the intention is just to run the DM R5 core on the SoC,
> > > you can disable the IPC by NOT including the
> > > "k3-am62-ti-ipc-firmware.dtsi". That was the motivation for the
> > > refactoring.
> > Verdin AM62 and AM62P are generic SoMs, that can be used for a multitud=
e
> > of different use cases. And not having anything running on the M4 is th=
e
> > default use case.
>=20
>=20
> If not having anything on M4 is the default use case, it should
> be marked as "status=3Ddisabled" in the DT.
>=20
> >=20
> > I think having the node in the DT is the correct way forward, if you
> > want to start the M4 firmware you need such a node, so this is enabling
> > a valid and useful use case.
>=20
>=20
> Having the node is fine, you can still choose to keep it
> disabled by default.

I agree with Francenso that it would be nice to keep the node enabled by de=
fault
- whether something is running on the M4 can be controlled via sysfs after =
all,
and may change over the runtime of the OS.

On our TQ starterkit mainboards, we'd like to provide the option to build t=
he
BSP with or without M4 firmware without having to modify the DTS (which is
supposed to describe the hardware after all - I'm aware that this principle=
 has
its limits, as the DT also needs to reserve memory ranges for MCU firmware
usage, but having a few unused memory reservations isn't as disruptive as
breaking suspend when the M4 is not running).

Best,
Matthias


>=20
> >=20
> > > List of suggestions/solutions in order of preference:
> > > 1. If no intention to enable IPC on rprocs:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Do _not_ include k3-am62-ti-ipc-firmwa=
re.dtsi
> > > 2. If intention is to enable IPC on rprocs:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Make sure rproc firmware is available =
in rootfs.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rproc would boot up and consume the mb=
ox
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg, suspend would be successful. Test=
ed this
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 on TI AM62x-sk with commit 1d6161617c,=
 works
> > > 3. Add support in mbox driver to flush the pending
> > > =C2=A0=C2=A0=C2=A0 queues.
> > 2 is not applicable here, and 1 to me is not a good solution.
>=20
>=20
> Why not? Why would you power on the rproc, enable
> the mailboxes, carveout some memory if you never
> intend to use it?
>=20
> >  So this
> > means that we need #3.
> >=20
> > > > #regzbot introduced: 1d6161617c
> > > Would not see this as a regression, but rather a new
> > > bug for the omap-mailbox driver...
> > As a user this is just a regression. It worked fine before, it's not
> > working anymore now.
>=20
>=20
> Isn't this partly dependent on the filesystem as well?
> You would not see this behavior if you package the
> firmware in rootfs, which I assume you did while
> testing a49f991e740f
>=20
> https://lore.kernel.org/all/20250908142826.1828676-17-b-padhi@ti.com/
>=20
> >=20
> > The fact that the solution might not be in the same file that introduce=
d
> > the issue is not a reason for this not being considered a regression.
> >=20
> > Francesco
> >=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
