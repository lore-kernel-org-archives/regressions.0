Received: from mail.flyingcircus.io (mail.flyingcircus.io [212.122.41.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BC036AF3
	for <regressions@lists.linux.dev>; Tue, 10 Oct 2023 17:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=flyingcircus.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flyingcircus.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=flyingcircus.io header.i=@flyingcircus.io header.b="gpdcauxM"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flyingcircus.io;
	s=mail; t=1696959133;
	bh=Vm8UzwARi05LgZyDRSB9WVm5dq28VXyWxvE9pM5Id+Q=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=gpdcauxMq6nWN/5poKNCnYYTQ1bCAjiV2P13JeDU0wT9hQQ8617CWyWH3QLxU3Mz/
	 ROmRZnanhD680QWZoIqaNrNsCgbjECaP/tUGPK2Zlq5nJ5OtqQGZeuNcVlGjyg1DIK
	 mS3xIPZ9p2OTSxuoDGMXho5+fSG1g6dg5R2Z/lY4=
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [REGRESSION] Userland interface breaks due to hard HFSC_FSC
 requirement
From: Christian Theune <ct@flyingcircus.io>
In-Reply-To: <CAM0EoM=mnOdEgHPzbPxCAotoy4C54XyGiisrjwnO_raqVWPryw@mail.gmail.com>
Date: Tue, 10 Oct 2023 19:31:51 +0200
Cc: Jakub Kicinski <kuba@kernel.org>,
 Pedro Tammela <pctammela@mojatatu.com>,
 markovicbudimir@gmail.com,
 stable@vger.kernel.org,
 netdev@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 davem@davemloft.net,
 edumazet@google.com,
 pabeni@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <7058E983-D543-4C5B-91ED-A8728775260A@flyingcircus.io>
References: <297D84E3-736E-4AB4-B825-264279E2043C@flyingcircus.io>
 <065a0dac-499f-7375-ddb4-1800e8ef61d1@mojatatu.com>
 <0BC2C22C-F9AA-4B13-905D-FE32F41BDA8A@flyingcircus.io>
 <20231009080646.60ce9920@kernel.org>
 <da08ba06-e24c-d2c3-b9a0-8415a83ae791@mojatatu.com>
 <20231009172849.00f4a6c5@kernel.org>
 <CAM0EoM=mnOdEgHPzbPxCAotoy4C54XyGiisrjwnO_raqVWPryw@mail.gmail.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>

Hi,

> On 10. Oct 2023, at 17:02, Jamal Hadi Salim <jhs@mojatatu.com> wrote:
>=20
> This is a tough one - as it stands right now we dont see a good way
> out. It's either "exploitable by root / userns" or break uapi.
> Christian - can you send your "working" scripts, simplified if
> possible, and we'll take a look.

Sure, what kind of simplification are we talking about? Something like =
this?

#### snip
#!/bin/bash
modprobe ifb
modprobe act_mirred

uplink=3Deth0
uplink_ingress=3Difb0

tc qdisc add dev $uplink handle ffff: ingress
ifconfig $uplink up

tc filter add dev $uplink parent ffff: protocol all u32 match u32 0 0 =
action mirred egress redirect dev $uplink_ingress

tc qdisc add dev $uplink_ingress root handle 1: hfsc default 1
tc class add dev $uplink_ingress parent 1: classid 1:999 hfsc rt m2 =
2.5gbit
tc class add dev $uplink_ingress parent 1:999 classid 1:1 hfsc sc rate =
50mbit
#### snap

This should provoke the error reliably. You might need to point it at =
whatever network interface is available but need to be prepared to loose =
connectivity.

Christian


Liebe Gr=C3=BC=C3=9Fe,
Christian Theune

--=20
Christian Theune =C2=B7 ct@flyingcircus.io =C2=B7 +49 345 219401 0
Flying Circus Internet Operations GmbH =C2=B7 https://flyingcircus.io
Leipziger Str. 70/71 =C2=B7 06108 Halle (Saale) =C2=B7 Deutschland
HR Stendal HRB 21169 =C2=B7 Gesch=C3=A4ftsf=C3=BChrer: Christian Theune, =
Christian Zagrodnick

