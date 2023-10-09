Received: from mail.flyingcircus.io (mail.flyingcircus.io [212.122.41.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E25347C3
	for <regressions@lists.linux.dev>; Mon,  9 Oct 2023 15:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=flyingcircus.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flyingcircus.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=flyingcircus.io header.i=@flyingcircus.io header.b="h7MdZNj8"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flyingcircus.io;
	s=mail; t=1696866410;
	bh=HWvc+5ISlvs1/m94xDgJR6CaS7Jho5VmQgLxRGlMnBE=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=h7MdZNj8/PpoAybfSgEqYnD9SMa0tPslsFT2g9vJsE7UBimkf4fGkR/QC0nXox1lc
	 xbzZpCDFSJIlB3ZejV1M5aC8HZJvDSZeTQyKDllAQau0ZbVz225e7roKxEpppKTRAj
	 wSlh2Kd7F+vfIjBr+AYy+iN9GIExyqYUtHFBqjw0=
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [REGRESSION] Userland interface breaks due to hard HFSC_FSC
 requirement
From: Christian Theune <ct@flyingcircus.io>
In-Reply-To: <da08ba06-e24c-d2c3-b9a0-8415a83ae791@mojatatu.com>
Date: Mon, 9 Oct 2023 17:46:28 +0200
Cc: Jakub Kicinski <kuba@kernel.org>,
 markovicbudimir@gmail.com,
 stable@vger.kernel.org,
 netdev@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 davem@davemloft.net,
 edumazet@google.com,
 pabeni@redhat.com,
 Jamal Hadi Salim <jhs@mojatatu.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2CBA18C8-51A4-443C-81D1-8D43B0F6AA76@flyingcircus.io>
References: <297D84E3-736E-4AB4-B825-264279E2043C@flyingcircus.io>
 <065a0dac-499f-7375-ddb4-1800e8ef61d1@mojatatu.com>
 <0BC2C22C-F9AA-4B13-905D-FE32F41BDA8A@flyingcircus.io>
 <20231009080646.60ce9920@kernel.org>
 <da08ba06-e24c-d2c3-b9a0-8415a83ae791@mojatatu.com>
To: Pedro Tammela <pctammela@mojatatu.com>

Hi,

> On 9. Oct 2023, at 17:31, Pedro Tammela <pctammela@mojatatu.com> =
wrote:
>=20
> We had a UAF with a very straight forward way to trigger it.
> Setting 'rt' as a parent is incorrect and the man page is explicit =
about it as it doesn't make sense 'qdisc wise'. Being able to set it has =
always been wrong unfortunately...

Well - this is a complex thing and even though I took care when setting =
it up I did not find this in the manpages sufficiently highlighted and =
built such a system: this has been running for more than a year, it did =
what I wanted AFAICT and upgrading a micro version broke it =
catastrophically.

The argument that this never should have been built, feels a bit like =
=E2=80=9Cthis has been written for 50 years in the basement of the =
office for planetary destruction on Alpha Centauri and earthlings had =
more than enough time to come and complain=E2=80=9D =E2=80=A6 ;)
=20
Hugs,
Christian

--=20
Christian Theune =C2=B7 ct@flyingcircus.io =C2=B7 +49 345 219401 0
Flying Circus Internet Operations GmbH =C2=B7 https://flyingcircus.io
Leipziger Str. 70/71 =C2=B7 06108 Halle (Saale) =C2=B7 Deutschland
HR Stendal HRB 21169 =C2=B7 Gesch=C3=A4ftsf=C3=BChrer: Christian Theune, =
Christian Zagrodnick

