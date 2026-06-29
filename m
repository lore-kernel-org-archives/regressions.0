Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906D231E82A
	for <regressions@lists.linux.dev>; Mon, 29 Jun 2026 19:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762802; cv=none; b=jAdjmpC9KZyLfpmCZn32SPBh20l/cdeErIrkEqLFqW/NkOFj5R0VA5d5U9hR5RKfQtXDb9tF2TX0KLYoq2oweNg0rpIlkoUJ3YcT85OVVjKGzcCz4ojAXsCfRzLNuo5tAqQEBpjhCtlfX6vckDrcL4uUYmySWxD+YGxB+nJbFyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762802; c=relaxed/simple;
	bh=PbPgBayX6b24ISDV01nkGcJIvbWXXJPgcSy/A/hY1+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KeD14SKs/l0F3Q7XkXCYxgigW7Zqe8JcY6FaVsL/XlfStktAHkWk6hEgXFJl2jo8NFhKCCDntHlXfOKpiVOaJ+QVF5gAXsvA1HVe+cqHdoYDKFtS8DrKyEO2yHNqvSaGXfQMbrD5wKgvqza8y3BFBz3iPpxGueyGxWSCKs44NB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=khrKQ0g8; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="khrKQ0g8"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2B108270AC;
	Mon, 29 Jun 2026 21:53:20 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tKKKoC5HHSQC; Mon, 29 Jun 2026 21:53:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1782762799; bh=PbPgBayX6b24ISDV01nkGcJIvbWXXJPgcSy/A/hY1+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=khrKQ0g8pLbzWz324vtf05mo7a/lVK/vvOiBeHLqoUDurCXh/aqFB/nUWsWzl6NLX
	 Vos3V7PNrNH0lSbsacsvgrrpsubxdMcsghCytkObMLYF4fe5QSvewCeoBbVEZ+SvjP
	 dQdgGH8jzfpXnOFD2wfwRnB+sT0nUoQILywZYflFULNU8+Z7PcUTH9rn89ZKDRh7/0
	 fkH6YrIx4URxlCRfyNHBoqGQEYUITLs1rFlLjeFB8GBUVJoP/BJ2HyMuvKMBu9f/fY
	 ZJS27tFwEjwWWeU0aYQ4J61vvWiNUpzo+/nhFwJ33XOc1JJZhshWOLuYi/1ywLWd8S
	 99L2qDf0yLnNg==
From: Marco Scardovi <scardracs@disroot.org>
To: Milan Oravec <moravec@ukf.sk>
Cc: bp@alien8.de, crecklin@redhat.com, dave.hansen@linux.intel.com,
 hpa@zytor.com, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 mingo@redhat.com, pavel@kernel.org, rafael@kernel.org,
 regressions@leemhuis.info, regressions@lists.linux.dev, tglx@kernel.org,
 x86@kernel.org
Subject:
 Re: [PATCH v2 0/4] PM: hibernate: Add relaxed_memmap option for x86 E820
 integrity check
Date: Mon, 29 Jun 2026 21:53:06 +0200
Message-ID: <2_MjK2gjTYawu-VEuCwZxw@disroot.org>
In-Reply-To: <4346170f-6685-40c6-8eeb-e3adab19275c@ukf.sk>
References:
 <cd45c7c8-4df9-4963-b847-02cf72bcc039@ukf.sk>
 <20260623165724.10753-1-scardracs@disroot.org>
 <4346170f-6685-40c6-8eeb-e3adab19275c@ukf.sk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

In data luned=C3=AC 29 giugno 2026 15:04:04 Ora legale dell=E2=80=99Europa =
centrale, Milan Oravec ha scritto:
> Hello, I wanted to try this new set of patches, but I was unable to=20
> apply them. Tested with 7.1.2 and master too.
>=20
> migo@migo-HP:~/build/linux-test/linux$ patch -p1 < ../hibernate2.patch
> patching file include/linux/suspend.h
> patching file kernel/power/hibernate.c
> Hunk #2 FAILED at 1431.
> 1 out of 2 hunks FAILED -- saving rejects to file=20
> kernel/power/hibernate.c.rej
> patching file arch/x86/power/hibernate.c
> Hunk #1 FAILED at 61.
> Hunk #2 succeeded at 78 with fuzz 1.
> Hunk #3 FAILED at 144.
> Hunk #4 FAILED at 166.
> 3 out of 4 hunks FAILED -- saving rejects to file=20
> arch/x86/power/hibernate.c.rej
> patching file Documentation/admin-guide/kernel-parameters.txt
> Hunk #1 FAILED at 1967.
> 1 out of 1 hunk FAILED -- saving rejects to file=20
> Documentation/admin-guide/kernel-parameters.txt.rej
>=20
> Thank you,
>=20
> Milan
>=20
Hi Milan,
that's probably because all the patches I write are against linux-next and
not a specific linux version. In that case linux-next contain [1] which
is not on stable version, making the patch non working for you.

To be honest I'm not gonna release a new patch specifically for kernel 7.1:
it's a waste of effort to target a specific version as the patch will be me=
rged
(if rafael will agree with it) in a future version. Said that, I'm not even
sure it will be merged for the points stated by Rafael, which I understand
and agree.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/kernel/power/hibernate.c?h=3Dnext-20260629&id=3D783c8109844503bd1c35dab=
41b6d5fd074a9f131

With best regards,
Marco


