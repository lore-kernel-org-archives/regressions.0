Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F73C21FF26
	for <regressions@lists.linux.dev>; Tue, 16 Sep 2025 14:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758033962; cv=none; b=c4czeqltLPC3INnB50/OpLncyJLS7/qT3mVdC0bWgVMz8wE28hcJZU82xuDcvFd83qZjcY5xASv790ZYOXozWADYjLzKWae47ZxvHHpDsAJxXFUnM57clO3HEQXke43dSLU7CYV1ipP1UYqYR3o0Mvdh0gYUPJE5ehfimyPkh1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758033962; c=relaxed/simple;
	bh=Z4yxPByTTztB3sFM24pH2Wpl4V1ijJZSaEJbVYamofs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fBueQpwB4PFrnMCrdC94g/sUv+Z9TFUDunxpV/bgZ0Ko33ycNTP0XL8s9nqFOctg6qoMsuxatUUpXU9h7bEj/Rmit1cHRr/xGFzu0HlckkIy7TzVvmxFt3slPSZWO1bHDZH8EAvZtB/5hAy3NXw4PqdtehqZxRMTpyo51kcCOzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=nIX6VdGE; arc=none smtp.client-ip=212.227.17.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="nIX6VdGE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1758033950; x=1758638750; i=christian@heusel.eu;
	bh=DHLESqABxDP34BOvNFzhwzlJxFfjxILjfvStq3LsGmc=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nIX6VdGEpYpQwlJkeWUKxZqtAj4t2uA0AvHbLNZNz78LJnFSC3gT/MTNxNCl/+iy
	 iS2MOIPn/0IziI3RqixJXKqiPQTmD13P04p4eI+h4gtkT6fh6f3zHlPacDWtDSwDW
	 /i97waOm96nlYzvNE3Nbe6tcbmeyba5Co8ExDntA6xJ7gMdXw/CygC8PTQ20M167z
	 /lQ2g5MaL1dS+nTKJ7+R98ccbQ/9SYUg2l+PwHs80J1VEYHnzZ0Ve2fZqUFbWrH96
	 D1yIAOFEr+1p87XjtiTN9JcSvnaKAj4dGtmGD7oS9rfqRdTLC0SzRZldGBj6ducxJ
	 pDxgNlbTfFb1CPoESA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([94.31.75.247]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MqapC-1uccOM0JtI-00gGFn; Tue, 16 Sep 2025 16:45:50 +0200
Date: Tue, 16 Sep 2025 16:45:49 +0200
From: Christian Heusel <christian@heusel.eu>
To: Mark Brown <broonie@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Subject: Build break due to merge commit in linux-next 20250916
Message-ID: <0fee48bb-7411-4414-b4e7-395a8c3d0f6c@heusel.eu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="soqtuarrnej3pntp"
Content-Disposition: inline
X-Provags-ID: V03:K1:KLBvgUOUZ/Tmyex3ihBWRR17/OkITuu5wgiFZAEW9vFLwdCZHi9
 4EuzkApEl62S6yg68f+JRrNULWWuZodNpGFWOLbKeff2xH5EIDdfb6Tj9PoDjoXUkkwH9v5
 Q0QVA+1C5nM/o/b2oIdVqs9JVxiOrgFBEGZh6Ynm5xHACWwwM6AZzisRaTGG/fYv75g/E9E
 BhK+GQmUTXEyAiEU72DUQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sgXqWcJGCU0=;wOe20pMJ1oc68nxQBKqMuxETpcZ
 XNbnm/iv45D1YipRuW0DQ2KDV5pKv/Tnv7N/iLGKLyI9M2E+tvKk/RFzzGrGhMbD1AyBupdCB
 pvyYO/MQUh9l88N3589goTsB+euOyh2ZWsXSlrKfzM9qwwCuvA4gmbsDKAmjYZmp50ECsmrKF
 jU0uAGppNIefpp8NgUqWXqRcBpRyfl5LMzcJORWDkxksNW9bLDwwzWjuAsPbxaQ4Q2gQyijrs
 tr80x8vMxf1gjnLhN98xLGGHrP7xZ/Ba9p0Je8IhZWCpel7m7goddWvPzOVXJPQFUEia3agNS
 HRYX827VvMZsaiRB26GyWruONGoSujHCUzSpffRBmPWyif/G5JrQQjbIHHcFsDXOJJt5/eR6+
 KfuSBkAP7MjkXjgYxbaA00uUORz2rvmH0OW5LdQSxx+QwGy/pTB87rJ6nZ4dtxkg+6tCoq6ko
 ORU9hNsPk/E7ql5Pe/0G0fZBkCKxDfgS6sjCSUw4rrAyhF2hhqsirpVRpgGv8V/nUzI67K09P
 Ws/7SY7oFA6/k02PtjvH2aY8yP+OzBX42p8iu9B3o6GbC6wJsZ5a5mSNcfXTBlgllKymTIdxS
 MHjKCE9YUH56o/949pHTNBJTpkitW6P6x020r5PDvaYhry3n+gfW79n5wERLPTpD3sDO2pBPi
 6I/loalzmU4Da7/9vIo/EwbgjJBq7xIaHJwUJ2wwJhZW/I07dusv4rX9AgE5EQOaY1a1Mt0m+
 pf3ldpkkQkiX8LULCAZCwZehM3xjsKwOF9+yVgaKDAbPoX50khlOFmNbwX+Sg3RM9lM3PLdt+
 EMX6syObfskI/ME0hFAKftUeld7/cxr+AFvtn97EU4VnmjJkT7fur0lR3DFt2NsI0UwZnvjcW
 +xNl2imcVIpxGYfJKmiEs0UJPwdQ5pXSQ4newXQ1n6j+Yl9ORvRB1e8J4EnKbcPRoYf9ctZu6
 lZ3DZ5EESsvOOs1vK6hpXslUBkXeKkRNjAN0fsiWAmcip16iB2pGQif/JQFf6UCuLF49IKxBG
 y3p1qImI3+MyiH5yzO4cuQhD3/x7bjCoCNOsQhcSDQoqh3VASWUk3HIfu3C0znnmc0KIVmCUM
 IM3K7JNYv3KNqeavoi26ptak94N4ZO0D/di7xgpLtrxSPACWfN1yIX4bp4F5MPlMZPztbnReW
 kpxuDCBWfhM3IC5yltP4S1tUyu0LUQiX/va5pI7lmcDeqNRRVMscPdrbh7AtsaK61+ZupR4Ih
 /KbJSo0c+JSPd1TBpqaZxJ+k2qEHL4ZZnsetZzg9Xzt0qq7I/cd3HjHHBwus31xXlBR/KvEai
 f8w2hJadP7q6LMwwDMrlPcWpK5TTwjnu/FPDLE5ijzV5gZlVU19L27IHW9/csigmL5qpXZEOt
 qaVmxJqYbpLJpj3FK9szQS7xFyPw+jibDIN2zU0KTZzysbLrDyrXZ0UYOzE1cg+ymTpTrgu2O
 zPv1YW+DOKL0COp2MiIPKi4qE7aCuktX10HtlMwPJLuojo5Txow3cmImwbG2vHVzg/6hHqfQA
 a8W9gpnUhJxPqRbcj2NlsU8yq1UQJ9Jzx4amU3P6f8zuCaP16RGV05Vs5MqxRUKwfZgHWzYOw
 7M7sCu9xqVDNzenUODVkGVHxiBba0JiiUUq2UQqfFuuQ5KMcC1Na4rmTvUbaOxsF7WjZjHLQ4
 ey8G0SBfRV6EAwgpfi3pF6dhIHg7s+a3o6uQMTGBlSDM34p2u0ZQBxKbfOol5JZJTC8U67gTE
 euVB6B5+SpFNL/1Rz7WmEtMCk2nFGiZ43htcVjr9JnNKqRfkCMCCAERw=


--soqtuarrnej3pntp
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="oirrfxxu7ldff2jk"
Content-Disposition: inline
Subject: Build break due to merge commit in linux-next 20250916
MIME-Version: 1.0


--oirrfxxu7ldff2jk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Mark,

I have noticed that the recent linux-next release fails to build due to
a syntax error in the rust code:

      EXPORTS rust/exports_bindings_generated.h
      RUSTC L rust/kernel.o
    error: expected one of `,` or `}`, found `;`
      --> rust/kernel/block/mq/gen_disk.rs:12:23
       |
    12 |     fmt::{self, Write};
       |                       ^
       |                       |
       |                       expected one of `,` or `}`
       |                       help: missing `,`

    error: aborting due to 1 previous error

    make[2]: *** [rust/Makefile:553: rust/kernel.o] Error 1

It seems like this error was introduced in 6e86e08cdc19 ("Merge branch
'rust-next' of https://github.com/Rust-for-Linux/linux.git") and
introduced with the merge, the attached patch fixes it.

Cheers,
Chris

--oirrfxxu7ldff2jk
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="linux-next-20250914-fix-rust-compilation.patch"

diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index 51a239118ead..1ce815c8cdab 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -9,7 +9,7 @@
     bindings,
     block::mq::{Operations, TagSet},
     error::{self, from_err_ptr, Result},
-    fmt::{self, Write};
+    fmt::{self, Write},
     prelude::*,
     static_lock_class,
     str::NullTerminatedFormatter,

--oirrfxxu7ldff2jk--

--soqtuarrnej3pntp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmjJd/gACgkQwEfU8yi1
JYWhcRAAg9hc0wPAhl6CBaDNZ6Q5WPj9jqXOhYtRJB/OyzY/QEBk7v9tVrG4GXQ7
cfuo+ydiBEYLd1lW2dBBGtvzLuhnrR5JqAe3d5mYgJvf5Fgdk34iy1TUv5pZayBN
wglepAhz2nW075IkA8k4KfvI13NTbTP14dsOkNBv0Tp+s6nGefeNYmG7fetCHpzy
3aVbnSbNmHvTHkWxF7juEovsH9fyecjo6570XCH55jNrsfxJNSUtUMyBIzo7Mk4H
qZp+F3Gxl3UWjO2pamiJEGCw5mXDddQ3QrjrJ4WiNu2tgEd6NkIMaOp6J4hgGjLt
CQ6ditGl8P/96wrugL96VJnyuMTKHJ4+7jkfVfYyLaPQDuM+tFaV6gdy8K3BiI3R
gHvsKQ3aKZ39pZdD0VQlGXlCbRPEVZaiIazVnYjZnxuH+itH3N2I3wSL1o4wZoz7
xnH/vq1FAXsuGY89uCsMU79H64bGeRNaH48inv175N1R1JHJ9UZCfTK/I/e9Lanh
cU1WQD7wbfLt31/sW87Z+C1o9OYK6bTB5PoU7fQf7OEmkJpunvIC8Y3mpfx/+7Xm
jwMyyHa3ZKU4+R+RHK+e7hoo/M9m4vytXLJQMTvt8kgNDw1BWOXHVD2ggpn9fvhe
yZYEbKQxgBJXBrChq8kTZBai4d/+UlMS1KF2W8RLRESFRtQGOB8=
=rJIi
-----END PGP SIGNATURE-----

--soqtuarrnej3pntp--
