Received: from maynard.decadent.org.uk (maynard.decadent.org.uk [65.21.191.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AD7205513
	for <regressions@lists.linux.dev>; Fri, 25 Apr 2025 04:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.191.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745553998; cv=none; b=LBAlBAogV8/86K/xJRexvhNgavEaW8sm10H6gUR9U9hUEFkI7h6/v9ojmkwiiwUPxIlKIsG41NY/WUNzbKRvZMrxNhXW+jdYI0GdvPnhE3OYOspE6mvMF1d+Pe/4+RlYffZU4ndR2EmnrNkO19eZJ5AU9zI78t+GFVqM/AFDVkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745553998; c=relaxed/simple;
	bh=Ty8SHgbKvpSsErpVpM9+esTwL8UJbkNUXc/mU8RHaOU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LClewuVV6gE4GCfTMsW0MG7pfo0ICjnYoo6hDhHcOx+RLN7airS1QjXOkYKvkpBR2ng4q2k7RaKJ50WQwTD+AZggFoLnuCIBVHmd3T2VEbASP9MgXWGB3S1R+nHJfWliDRV/Zc2wOQG/W+XEX9PRkotNPVXjlHp8SMq3iLVk7h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=decadent.org.uk; spf=pass smtp.mailfrom=decadent.org.uk; arc=none smtp.client-ip=65.21.191.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=decadent.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=decadent.org.uk
Received: from [2a02:578:851f:1502:391e:c5f5:10e2:b9a3] (helo=deadeye)
	by maynard with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ben@decadent.org.uk>)
	id 1u8A0i-003N5k-2N;
	Fri, 25 Apr 2025 03:45:55 +0000
Received: from ben by deadeye with local (Exim 4.98.2)
	(envelope-from <ben@decadent.org.uk>)
	id 1u8A0g-00000009xXn-0GJ1;
	Fri, 25 Apr 2025 05:45:54 +0200
Message-ID: <dddb6b8d56e3f28b914e1e243f948457d53149ce.camel@decadent.org.uk>
Subject: Re: linux-image-amd64: Kernel Panic: copy_fpstate_to_sigfrane
 crashes.
From: Ben Hutchings <ben@decadent.org.uk>
To: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
Cc: Larry Wei <larryw3i@yeah.net>, 1103397@bugs.debian.org, x86@kernel.org, 
	regressions@lists.linux.dev
Date: Fri, 25 Apr 2025 05:45:49 +0200
In-Reply-To: <c566339b-d8d3-4f74-a3b8-8f373fbe3f47@yeah.net>
References: <4ac9f677-699e-4ef1-b160-9f1c6fe8e820@yeah.net>
	 <c566339b-d8d3-4f74-a3b8-8f373fbe3f47@yeah.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-slkr1vebN/96mKJT2Iiw"
User-Agent: Evolution 3.56.0-1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a02:578:851f:1502:391e:c5f5:10e2:b9a3
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false


--=-slkr1vebN/96mKJT2Iiw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aruna,

Commit ae6012d72fa6 "x86/pkeys: Ensure updated PKRU value is XRSTOR'd"
seems to be broken on some Zhaoxin/VIA processors.  Specifically:

On Thu, 2025-04-24 at 16:24 +0800, Larry Wei wrote:
> Thanks for your replying, the `Probe URL` of my laptop:=20
> https://linux-hardware.org/?probe=3D58facb533d , and `cpuinfo` is:
>=20
> larry@zx2:~/Downloads$ sudo cat /proc/cpuinfo
> processor=C2=A0=C2=A0=C2=A0 : 0
> vendor_id=C2=A0=C2=A0=C2=A0 : CentaurHauls
> cpu family=C2=A0=C2=A0=C2=A0 : 7
> model=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 59
> model name=C2=A0=C2=A0=C2=A0 : ZHAOXIN KaiXian KX-6000G/4@3.0GHz
[...]
> flags=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : fpu vme de pse tsc msr =
pae mce cx8 apic sep mtrr pge mca=20
> cmov pat pse36 clflush acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx=20
> pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl nonstop_tsc=20
> cpuid aperfmperf pni pclmulqdq monitor vmx smx est tm2 ssse3 cx16 xtpr=
=20
> pcid sse4_1 sse4_2 movbe popcnt tsc_deadline_timer aes xsave avx f16c=20
> rdrand rng rng_en ace ace_en ace2 phe phe_en pmm pmm_en lahf_lm abm=20
> 3dnowprefetch ibrs ibpb tpr_shadow ept vpid fsgsbase tsc_adjust bmi1=20
> smep bmi2 invpcid rdseed adx smap sha_ni xsaveopt dtherm hwp=20
> hwp_act_window hwp_epp hwp_pkg_req vnmi umip pku ospke rdpid=20
> arch_capabilities
> vmx flags=C2=A0=C2=A0=C2=A0 : vnmi invvpid ept_x_only ept_1gb tsc_offset =
vtpr mtf ept=20
> vpid unrestricted_guest ple
[...]

Notice that this has the PKU and OSPKE features set, but *not* XGETBV1.
Which means that xfeatures_in_use() should not be called (and will cause
a #GP exception).

(The full bug report log for this is at
<https://bugs.debian.org/1103397>.)

Is there some fallback that could be used in case XGETBV1 is not
available?  Or do we need a dependency X86_FEATURE_PKU ->
X86_FEATURE_XGETBV1 in arch/x86/kernel/cpu/cpuid-deps.c, so that we
disable protection keys in this CPU?
>=20
>=20

Ben.

--=20
Ben Hutchings
Who are all these weirdos? - David Bowie, on joining IRC

--=-slkr1vebN/96mKJT2Iiw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmgLBW0ACgkQ57/I7JWG
EQlJ1g/8CUsPfuZ5lsovTHs7ePPs4lRrR+f6t9+ocg+OMKWnKcZw7nO49cq3XH6o
Nv9RFJACK/r2Kv9XOHvsXojN2EmaPrWKhj7t/6PgR0MiZY23Te1CwZldiWKiQ8N5
QrcnJtBnwJd0M2t4839/9h7nNVDKFLrypF/bgSuQ/UZxVwSzVIebKW7Tk2wI5nts
A7o0wDKAKsAqZAgWcVYo8l6dRSm3IEsR2vP/krJKAgWmTz4I+RssMr42yIIwVYr3
2+/ZML/FNTxGlQuSN5OhiD2zPPqdOfPj0PfE3LQ2Dl96cFbNf3uFDejLxGk5dfF0
tdRMPBMUUaubDwvYbsGajKog376yC7TusE3uW/wo/pjMDmhZlIGrRW47Ghjv+H8A
ZGJ7BKf47EISqZjTjuEQY5QV1Uv5YzRWAfs0DD/+7yLygtfvqgqtBCRRBLauh9K3
iJfDfNoV6SArFDKBEHwhLVuhrdYkPOpirV2Py/9wwqFfhBKJKF9PBFMaLgQrfhpG
SNLYfj4z4fK2a4PEbfW86Zd3NqvixawJgjtfcO7/oxJq6qj58IKj3rpp6Gxy8TXG
eehU1kZG9eYXgL4ZvuLieeGE5Z750mGcuhMOsG+DUZJgS/KnCX/I5Z4SkXwxqUSF
mnsE8DVPS2T8zisrZ3gFrvhJxgcQAVRBk9tTTtWQzQSbpfT5q3Q=
=8sGg
-----END PGP SIGNATURE-----

--=-slkr1vebN/96mKJT2Iiw--
