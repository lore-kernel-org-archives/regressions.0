Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A9A1B4248
	for <regressions@lists.linux.dev>; Fri, 10 Jan 2025 09:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736501629; cv=none; b=Rkx1qNXlvnGvk7IFZjxHQzPTsfhqcxCWTrN1d3u1WrP2Wy5CUSJLOTRYvxVCHzoYBJPvTCELF1x42IBZNd20l05tNFzCFv+cbtwAu2XqRjqb2SzhSYg2vcAgABqZ4VunLt+tLQPqLfIQrWvLC8v1N0TCMKkEh6xcXoiJZsoZ2c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736501629; c=relaxed/simple;
	bh=sFqsVpcf8WdqFUtz/ciRUPxiYilqnfmEkbSTlusLt48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kYEBBFflnxXm5cEKONwxlYPdWpwwZrWGtx1500ZbjqUig2KEzMjQ33aQrDE+WUgG+H9oqRRgN+b0c/+xjoJLu0WK0utGGUx1OH1HibYs0XxOLzIXgZmGrJE+ds8lK4N4BRLuVta9C6+XqXsxrU9JqPEm7w1GBF4T2E3WU8ePddo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=wendler.lars@web.de header.b=gOcKsra+; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=wendler.lars@web.de header.b="gOcKsra+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1736501618; x=1737106418; i=wendler.lars@web.de;
	bh=uW4RCSpi5zvF8vaN3QryreOHPgqgI3aRoSgX/l2rohw=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=gOcKsra+MDX/D6dLDQaYW+mQ1XlOtD+kfMhAM73rmre57iei3ObZqSSdsr3ni3Lt
	 JezrRyvMcibWFWDRgkgaW7DFAUiDg5oUMdSZVL4GqIYbRPfYc/gAzkAoGKrdodYAm
	 p4dz518F6wdOBmlwMJsao+xCbx0vtED/pRdUaHPw9aH8yItbV2NKkBrADQSCecfcy
	 KixhVlXpKObGeUotDJK5fgBEG34Dq8mpBoA3sIDPujjFoz2e0GLpmIWRXQ1AMl0CF
	 BXtLWO4bwWFEpqY2TjGOfTdsgfMG8HnVr6mjNJNyJ//jwUCm/FG/vrPd05hwujQWh
	 6aZJimJrHDm3sx3fbQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from chagall.paradoxon.rec ([79.234.209.197]) by smtp.web.de
 (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1M91LW-1tcFvw1TqI-001q2R; Fri, 10 Jan 2025 10:33:38 +0100
Date: Fri, 10 Jan 2025 10:33:28 +0100
From: Lars Wendler <wendler.lars@web.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>, Baoquan He
 <bhe@redhat.com>
Subject: kexec build regression in linux-6.6.70 (linux-6.6.y LTS branch)
Message-ID: <20250110103328.0e3906a8@chagall.paradoxon.rec>
Organization: privat
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kt3rnQote7ej+29.KL6VM01";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Provags-ID: V03:K1:DtnxpThIDzJI4kDkW9Ym4DjDW5igz5qVfXbM/YdzRV45WXKu9P3
 cJJDLmvKNcMZJ0RyZ02nrsHXOHgwTx7AFScA4iNnv/mdDz9/FsTds9KbPpVu2UP1kKnooe4
 DDGJ29A0B7sSy5/tM40GUdNIHm8NRY7uBm4+bDg0PE2ax7a6BvjUn++1tJXf6iOAXuRGg/r
 AT14qtaLJZWF5qAVcuNdQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JCZ/UVDdkjw=;sZo3o215xlvGFZykz9xvj+Vb9k/
 4Zdp4EolREKvcUgExuPdjo6wOfw58YjuyDgnekbX3pd4rbBBcNouZz9E0xMfoEPldohGfdUAF
 ne+cO62G3Zzd8G6hUeIw6ZogxaDQynHn/TStG5H/DDSoggD14OTVfAUaBxOCBRsRzEzgnRb1l
 5zYEBSxAp/eoxLWtwO+p3Y01lt6rlqi07e445Cib0vwk/thLUq6bcDQnmP8hlTRjRpFErHQDT
 W8I3atLO84Rs0RawNypVLzLh2Heb8VN7mRBoGO5v/V5qixeUw5CMD3H9fcf57f9xPjMaB8b4T
 Zpo4+NglVDly36bwKc6QSBgmvixuMgPGmet1C9ILTudDzbWNtf9DwMuOwsbegNftQHZvDcKpe
 D/GG4Ngo6qcksJaNNLb752qbiMpC3aIto78IIqoW+6oLEKBuNJDWXJdmwte+CRhr3W66rJxhZ
 xkSyqsT/9+gIjNfRVP2wIA5Bu9hB2QanH+ZBtmkqZ1JFypAERemHMGW6Av5r1ePNwkTOlV602
 5YMhzdXnbQJJPMgS6E3dtshrxTpxXtCNSJM6X5ga36RfngD8J038x3bzwt7iKRrPjJhbTtqrd
 ADOVmTwHHOITlQEBOe3KZwGcjadaOmn+3osrzLkkb2IlkANaKAURl7W6bWOzVhCXP7hp9Ffk6
 VgxN7X8CKiG+VV89yxdjk9AGrEq3NUK1wCgcHwU1JqM5UrufTWi0SgwT+rh1/Aqj9xrtLrW8d
 wnJkf2JUuPEVo7hReHwsF0zC7KR8UY7GGqw8p0GG+KyNtzrGngAgQQPzK8gbqwXJeWCtjB54K
 fsUUlBPZDWcAQr8CzvE4+wwo9fSV7m+sTsfYTci6gwkpobFTGXtCUoisQ7p6IuQSAoz3lAwlq
 X9ToSHlxNtAcVhQ1eC4INi6ibWgOg35k3sVBXu2ggAMGTPYHLYlvxBDUmf8XSA531hvdGJZup
 RP6zR1mP62wdENj4uRk8vXcwLMYpnFcV8ZPrDvajbdd+1/5jMDLdslUt+ksbVjbrcenGXo9t9
 amoMxHsyh2De1HOmZuMPKxsUo5HTP4dkbXKH5lAsRJW2ihLrdBmGFL2zgVIsDOLxQlZMx3eEm
 sD8qLvVu43DB3PM0IdTbyt/wvu1sta

--Sig_/kt3rnQote7ej+29.KL6VM01
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello folks,

trying to build latest linux-6.6.y release (6.6.70) fails with the
following error:

  LD      .tmp_vmlinux.kallsyms1
ld: vmlinux.o: in function `__crash_kexec':
(.text+0x1bf9c1): undefined reference to `machine_crash_shutdown'
ld: vmlinux.o: in function `do_kexec_load':
kexec.c:(.text+0x1c15bb): undefined reference to
  `arch_kexec_protect_crashkres' ld: kexec.c:(.text+0x1c1611):
  undefined reference to `arch_kexec_unprotect_crashkres' ld:
  vmlinux.o: in function `__do_sys_kexec_file_load':
  kexec_file.c:(.text+0x1c272a): undefined reference to
  `arch_kexec_protect_crashkres' ld: kexec_file.c:(.text+0x1c2772):
  undefined reference to `arch_kexec_unprotect_crashkres' make[2]: ***
  [scripts/Makefile.vmlinux:37: vmlinux] Error 1 make[1]: ***
  [/usr/src/linux-6.6.70/Makefile:1164: vmlinux] Error 2 make: ***
  [Makefile:234: __sub-make] Error 2


I suppose this is related to commit
e5b1574a8ca28c40cf53eda43f6c3b016ed41e27 which is the only commit in
question that changes kexec code between linux-6.6.69 and linux-6.6.70.

Kind regards
Lars Wendler

--Sig_/kt3rnQote7ej+29.KL6VM01
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEWCOBmo8i7LhvVmNAVx3S0DQ8YDkFAmeA6WgACgkQVx3S0DQ8
YDn7Iw/7BYQ9mjq18bF/OwUW7oTVZBBxd0aBxShKNXr68r/936Tgp/fbvynoROp7
brhTXaOfRFsKdv65o0WQZBmf/q6ohY16FEQEGc7Ku2GS8IjE8UMzdAuvmYKSYy+S
XIPlxzEOwmb7YKFmk9DSC7UaB+sU9M8IHJa7IWBJj1Cagnd3aR+kY0TbJ+tOGAfe
0RTHpPSPdPfhE5/lRhBi5jeNpdtxrdUZCNzKTLu/GPOq5812WKHU+HbKuZ60L9OH
0N4vLy7rG9h8FwuicUTL+PopnxfMr8zJMsXElG+OEV+uaPR30gY2f5EmHqbOP42p
QvRaJnOf860pySngLnh88fyWxSVt/O8on5c++6YSk8yFoNJS8bMxf3c1f0wdOUqx
m2/zYRcm64+obGUuk6chrPNcCC6B4BRQfdSuUooDGOqkZ6QU60If3YJ9eu/lzc32
US+sEWlxGnT85tOwrn6571Tt7ZZ3T/VX7Q5aFfyWdQoZyViA3MJJZCE4qlK2ptQq
s+8RyDcpyKk35A0/ZKp38tYKbqaf8YlAkLHug7dIDscuVcLQf2YvNHT5wLy07cK1
My4Sn8Ddj5ffpp1Vlr8K2C8RVtdHVhAxkIXFRORpEKTnXzCv5m8RFV/RAyKfHuwz
CPN+BshwDIu0uj48tm6VHXSoaH5yToHtP5n6yi6mRWzVTc9ioC8=
=eY5B
-----END PGP SIGNATURE-----

--Sig_/kt3rnQote7ej+29.KL6VM01--
