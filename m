Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CDC34CEB
	for <regressions@lists.linux.dev>; Tue, 16 May 2023 11:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684236981; x=1715772981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CTuARb/YrAFoLf//M9oeOcM9jK+YYhZvEJI0/BqCYLc=;
  b=wTwt3V1U0u5r3vWxUWzyd/XBfiGy628jA5MdGmKSZvOz4mHcE7Q9yytW
   NEXUOnMfZEE2Ji5HcbqCMD5ezPpZqhOfc8dLAbfMvNEYpSXlIvD5TGlpJ
   0zOGWLzYzL6fzvAHKvBWvMg+f6EdG3v6lxUpA2kVAhFW2c/8W2mfD/qvJ
   FVnVUJNZJCWSegP+yWii+s8U1aU4/pRm9j6Lap8nEJ5RYn90jL8hCNDzc
   TZkWXnkZwpx9+f/veQlJpZR5b2BV4Ayx3PH1C//vCa2vSa720q84sBKYT
   9V87Sqj9cXCi5QQA86zhGXBBzEeIarbTdgfGERCXR8UWLxwGGKZGHoA/G
   g==;
X-IronPort-AV: E=Sophos;i="5.99,278,1677567600"; 
   d="asc'?scan'208";a="213509855"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 May 2023 04:36:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 16 May 2023 04:36:18 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 16 May 2023 04:36:16 -0700
Date: Tue, 16 May 2023 12:35:55 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Song Shuai <suagrfillet@gmail.com>
CC: <alexghiti@rivosinc.com>, <robh@kernel.org>, Andrew Jones
	<ajones@ventanamicro.com>, <anup@brainfault.org>, <palmer@rivosinc.com>,
	<jeeheng.sia@starfivetech.com>, <leyfoon.tan@starfivetech.com>,
	<mason.huo@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Guo
 Ren <guoren@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: Bug report: kernel paniced when system hibernates
Message-ID: <20230516-figure-vanity-d8b671ca1aa0@wendy>
References: <CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Thw0RZ3mGVPR1apd"
Content-Disposition: inline
In-Reply-To: <CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com>

--Thw0RZ3mGVPR1apd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2023 at 09:24:07AM +0000, Song Shuai wrote:
> Description of problem:
>=20
> The latest hibernation support[1] of RISC-V Linux produced a kernel panic.
> The entire log has been posted at this link: https://termbin.com/sphl .

Since the reporting is a bit scattered between here and the sw-dev list:

#regzbot introduced: v6.4-rc1.. ^
#regzbot title: kernel accessing opensbi reserved memory

--Thw0RZ3mGVPR1apd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGNqiwAKCRB4tDGHoIJi
0kCaAQCKg2EPoULgExcqaStj6FVDGF8glj2Zx8FXdFbroDJd1AD/YDqMn5PkGi/W
MVkHIVMQ0QwpL9sXst2NadGypRkw7Ao=
=QQ5L
-----END PGP SIGNATURE-----

--Thw0RZ3mGVPR1apd--
