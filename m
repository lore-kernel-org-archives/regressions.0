Received: from mail.flyingcircus.io (mail.flyingcircus.io [212.122.41.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E3339944
	for <regressions@lists.linux.dev>; Wed, 11 Oct 2023 18:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=flyingcircus.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flyingcircus.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=flyingcircus.io header.i=@flyingcircus.io header.b="Wzr+nymK"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flyingcircus.io;
	s=mail; t=1697047907;
	bh=d+Sr05wOr6odmI26LohhC7IvZbIgvBSxxhLMDUKBFdk=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=Wzr+nymKX+HnvaqMcmiXM5WSsO1EAMKuqTH188SJLylosOJe72/Lxe+UqhG8Oufat
	 vV8Z1T6Ji6w/c734v2bpHlY7xr9mdKEnEtQmaKKC9XwnjTACE1LgzUuNfE7Yoy4BJ2
	 H9s+wO0OLXhsH0R/VGZHlD6GFhVEVDkmX2DVDjcc=
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [REGRESSION] Userland interface breaks due to hard HFSC_FSC
 requirement
From: Christian Theune <ct@flyingcircus.io>
In-Reply-To: <CAM0EoMkKm4VcQB7p1abg9d-Pozz7fV-isexDtA1rGX+NuJEykA@mail.gmail.com>
Date: Wed, 11 Oct 2023 20:11:26 +0200
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
Message-Id: <D7464B3C-53BE-435F-B58D-B9C612D3CAC7@flyingcircus.io>
References: <297D84E3-736E-4AB4-B825-264279E2043C@flyingcircus.io>
 <065a0dac-499f-7375-ddb4-1800e8ef61d1@mojatatu.com>
 <0BC2C22C-F9AA-4B13-905D-FE32F41BDA8A@flyingcircus.io>
 <20231009080646.60ce9920@kernel.org>
 <da08ba06-e24c-d2c3-b9a0-8415a83ae791@mojatatu.com>
 <20231009172849.00f4a6c5@kernel.org>
 <CAM0EoM=mnOdEgHPzbPxCAotoy4C54XyGiisrjwnO_raqVWPryw@mail.gmail.com>
 <20231010112647.2cd6590c@kernel.org>
 <CAM0EoMkKm4VcQB7p1abg9d-Pozz7fV-isexDtA1rGX+NuJEykA@mail.gmail.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>


> On 11. Oct 2023, at 19:27, Jamal Hadi Salim <jhs@mojatatu.com> wrote:
>=20
> On Tue, Oct 10, 2023 at 2:26=E2=80=AFPM Jakub Kicinski =
<kuba@kernel.org> wrote:
>=20
> The qdisc is non-trivial. The good news is we now know there's at
> least one user for this qdisc ;->

Thanks everyone for taking the time to look at it. I hope and guess =
I=E2=80=99m not the only user =E2=80=A6 :)

Hugs,
Christian

--=20
Christian Theune =C2=B7 ct@flyingcircus.io =C2=B7 +49 345 219401 0
Flying Circus Internet Operations GmbH =C2=B7 https://flyingcircus.io
Leipziger Str. 70/71 =C2=B7 06108 Halle (Saale) =C2=B7 Deutschland
HR Stendal HRB 21169 =C2=B7 Gesch=C3=A4ftsf=C3=BChrer: Christian Theune, =
Christian Zagrodnick

