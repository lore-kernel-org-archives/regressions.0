Received: from maynard.decadent.org.uk (maynard.decadent.org.uk [95.217.213.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F60815A3
	for <regressions@lists.linux.dev>; Thu, 18 Aug 2022 23:40:19 +0000 (UTC)
Received: from 213.219.160.184.adsl.dyn.edpnet.net ([213.219.160.184] helo=deadeye)
	by maynard with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ben@decadent.org.uk>)
	id 1oOod9-0000LN-QA; Fri, 19 Aug 2022 01:08:51 +0200
Received: from ben by deadeye with local (Exim 4.96)
	(envelope-from <ben@decadent.org.uk>)
	id 1oOod9-000YsC-0m;
	Fri, 19 Aug 2022 01:08:51 +0200
Date: Fri, 19 Aug 2022 01:08:51 +0200
From: Ben Hutchings <benh@debian.org>
To: x86@kernel.org
Cc: linux-kernel@ver.kernel.org, 1017425@bugs.debian.org,
	=?iso-8859-1?Q?Martin-=C9ric?= Racine <martin-eric.racine@iki.fi>,
	stable@vger.kernel.org, regressions@lists.linux.dev,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Subject: [PATCH] x86/speculation: Avoid LFENCE in FILL_RETURN_BUFFER on CPUs
 that lack it
Message-ID: <Yv7Gg2nu4CpSY58S@decadent.org.uk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X9reK1QatItOUBDw"
Content-Disposition: inline
X-SA-Exim-Connect-IP: 213.219.160.184
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false


--X9reK1QatItOUBDw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The mitigation for PBRSB includes adding LFENCE instructions to the
RSB filling sequence.  However, RSB filling is done on some older CPUs
that don't support the LFENCE instruction.

Define and use a BARRIER_NOSPEC macro which makes the LFENCE
conditional on X86_FEATURE_LFENCE_RDTSC, like the barrier_nospec()
macro defined for C code in <asm/barrier.h>.

Reported-by: Martin-=C9ric Racine <martin-eric.racine@iki.fi>
References: https://bugs.debian.org/1017425
Cc: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Cc: Daniel Sneddon <daniel.sneddon@linux.intel.com>
Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Fixes: 2b1299322016 ("x86/speculation: Add RSB VM Exit protections")
Fixes: ba6e31af2be9 ("x86/speculation: Add LFENCE to RSB fill sequence")
Signed-off-by: Ben Hutchings <benh@debian.org>
---
 arch/x86/include/asm/nospec-branch.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/nospec-branch.h b/arch/x86/include/asm/no=
spec-branch.h
index e64fd20778b6..b1029fd88474 100644
--- a/arch/x86/include/asm/nospec-branch.h
+++ b/arch/x86/include/asm/nospec-branch.h
@@ -34,6 +34,11 @@
=20
 #define RSB_CLEAR_LOOPS		32	/* To forcibly overwrite all entries */
=20
+#ifdef __ASSEMBLY__
+
+/* Prevent speculative execution past this barrier. */
+#define BARRIER_NOSPEC ALTERNATIVE "", "lfence", X86_FEATURE_LFENCE_RDTSC
+
 /*
  * Google experimented with loop-unrolling and this turned out to be
  * the optimal version - two calls, each with their own speculation
@@ -62,9 +67,7 @@
 	dec	reg;				\
 	jnz	771b;				\
 	/* barrier for jnz misprediction */	\
-	lfence;
-
-#ifdef __ASSEMBLY__
+	BARRIER_NOSPEC;
=20
 /*
  * This should be used immediately before an indirect jump/call. It tells
@@ -138,7 +141,7 @@
 	int3
 .Lunbalanced_ret_guard_\@:
 	add $(BITS_PER_LONG/8), %_ASM_SP
-	lfence
+	BARRIER_NOSPEC
 .endm
=20
  /*

--X9reK1QatItOUBDw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmL+xn0ACgkQ57/I7JWG
EQltURAAgnJN1OPNWZt4of2uNaxsWdziuJHTwiGBj0CISrZIBrEK5fFUyUP9pHdv
qR5EV+dN04rge9ZHHskxlHVY0zz4RXjP34IWekKyTiVPSYK1EnEsdlD6gFYWNZ1H
J/yu50W9fPi0lNAR94g8ZNokqyvTDpDFqlJfZMNX/oCBkDZ1tdiUKdjN+lHQwOAm
9G4upD541+UFnsSAt/sBEbyAOz8XJxNLJNVvXYrm8+6NnhuWI40RYUFtuK/p15kC
Hj0pbKMaJPKL8QeMeCE+gUKZEqCA7AVYZ51NTJn4uDs1yqXU/u5hEz92U3bhCWDM
Y18b4Af75uMIIwF0irNQYJDzIoZWYjFcDG5lMq0CKw/VrQrizqQPJBwkuKCxZwNv
5PyEu3YLb4RsRI8d0ItP46Osa9lXR5NKXVqWbvPFjg+7MfYUAwmSdgdf7CPC1nEs
6NbpnjJan9C63vYJ5+kjAthLFlh/dzlg36EeTSwgK1aqdS9LUS3NG/5BIs3UGjGh
Z5MTEpXUcihHlxN7sLwGR7/xwyRjyj4ChymnnhTWRW0h7sgxh+aexfxTH6i8hWWV
BdYXbe7K5brpSAIcHUUAl7XwDYlAfWR18I+vAzxuSWbqK8MwqQqjwXH4eJh4kNDL
yXpZqG1ScwZsqVDlLHjc6Bs+Buzw789esQoyn1RgxZbT0dYtvmU=
=tFRN
-----END PGP SIGNATURE-----

--X9reK1QatItOUBDw--
