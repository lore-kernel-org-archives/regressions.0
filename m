Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A6B3EDE76
	for <regressions@lists.linux.dev>; Wed, 10 Jun 2026 10:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086923; cv=none; b=hrIqHGuQhzYGv3p7ywms8TFLyfrINV/bKUMpDZnXuu5QjSKCgjP+V9OePmBAzFWyowmJaVCApyY8Tu9OPcwzTK0g1MAA2ghaGv2sAQZHmrF3sbsYAtnOzgU6JM+AHTa6FJjjst3wCLQpwqo7GVICw0R/SIZ/NFai6IUtKwMqEWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086923; c=relaxed/simple;
	bh=okPcpkHPEcFFZ3Wjg9fvdzD1vVnZuDAoGCK7cgalCaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WJrzNbzdJASE7yHKrOzO0j3gJm0TqTyrGoyTyKA0VjZTq3JGNM/7ssyF2GXsiw78FJ2i7SdP+kfFD8jPiitwoGdfDqpyUT2XrBPXnjQD1AGuE8IgPWqzy3/sGcZ1eph/elzxzELxsO7F1nuzFH9m9vl2UU14JltuDnKd2aWlSeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=NBbmW+Nb; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="NBbmW+Nb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=W1xAQ3kxXWEPxj+qDrh+a29AP/hJ8tSPkUteLT00sjA=; b=NBbmW+NbmS3pkIic+2TuPDqcoo
	t2jUBrBIgVIx6LJ8uC9jB9//B/SrpqbhMSLq+LUbvWvy7fGD/JTWiubTYAqoq5s21K85bVvQ1iY98
	lNRl9Fb9Q02gwBrCs5wKnYoCcQsorqPmobTs4tCS1FHfQ0dTNfI0Xsv5Vhb29OscdaSIhvjDfGGDw
	FA4njdisxO4Ym2HEofLetBXTvVX4UYZNEGffSqgqZ7yfEZ8+4xR7wKOUw72J25jrm4GWJLTUlGZjr
	1lKz89WxeufpcbkmlXxZ0yWMXsijMMvsGkzxXwo10SACxDaC/wabpw+1jVEnMuiNGnC8ac757E2aj
	D28giIvQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Oren Klopfer <oklopfer37@gmail.com>, linux-rockchip@lists.infradead.org,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: regressions@lists.linux.dev, pbrobinson@gmail.com, guptarud@gmail.com,
 megi@xff.cz
Subject:
 Re: [REGRESSION][BISECTED] wireless networking broken on Pinephone Pro
Date: Wed, 10 Jun 2026 12:21:50 +0200
Message-ID: <3761289.R56niFO833@diego>
In-Reply-To: <b68dc2ab-ab54-435f-a4e5-05b1b8397505@leemhuis.info>
References:
 <20260607225901.64019-1-oklopfer37@gmail.com>
 <b68dc2ab-ab54-435f-a4e5-05b1b8397505@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 10. Juni 2026, 11:28:03 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Thorsten Leemhuis:
> On 6/8/26 00:59, Oren Klopfer wrote:
> > Apologies if this is not formatted properly, this is my first
> > submission to the kernel mailing list. WiFi specifications were
> > introduced into the Pinephone Pro device tree in
> > 096bd8c679185f898cae9933c6a68650fa26ea4f, but this causes complete
> > networking failure on some devices. The regression affects all
> > versions v6.18-rc1..v7.1-rc6.
> >=20
> > An identical issue was reported for the Pinebook Pro at https://
> > lore.kernel.org/all/aUKOlj-RvTYlrpiS@rock.grzadka/; the regression
> > was reverted in 29d1f56c4f3001b7f547123e0a307c009ac717f8. The errors
> > faced on the Pinephone Pro are exactly the same as were reported for
> > the Pinebook Pro regression.
> >=20
> > A previous patch at https://lore.kernel.org/all/20260112-
> > ppp_connectivity-v1-3-284d6e83b212@gmail.com/ attempted to resolve
> > this issue but never ended up being merged.
> >=20
> > 096bd8c679185f898cae9933c6a68650fa26ea4f is the first bad commit
> > commit 096bd8c679185f898cae9933c6a68650fa26ea4f
> > Author: Peter Robinson <pbrobinson@gmail.com>
> > Date:   Fri Aug 29 12:38:24 2025 +0100
> >=20
> >     arm64: dts: rockchip: Further describe the WiFi for the Pinephone P=
ro
> > [...]
> >=20
> > Reverting the commit allows wireless connection to function again. I
> > am not really familiar with the process of submitting a revert
> > patch, but I'd request that this be done on all of 6.18 (LTS), 7.0
> > (Stable), 7.1 (Mainline). Thanks!
> Thx for the report. Sounds like a revert is the right course of action
> here. Could you submit one with a stable tag to ensure backporting? That
> might be the fastest way to resolve this, as that makes it easy to
> process for the maintainers to process this.

Was confused for like 5 minutes because "didn't we do that just recently",
until realizing, that it's the Pinephone this time, not the Pinebook.

So we'd need a similar one to
https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?h=3Dfor=
=2Dnext&id=3D29d1f56c4f3001b7f547123e0a307c009ac717f8


Heiko


