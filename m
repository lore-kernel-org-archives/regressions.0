Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512781;
	b=Qunu4Nj/+xHY8YZqVGeF+vGYBDJxLCYjFQa8D3EwG7d/rE+X6V7S8aimw6YUPvRtVAFH
	 Mk0vr3XFqn7XPHgK+eZ8DOugBP7Mm0kSaZdVbPZb7PSnu+1FlSxV+gQSEUfi7bal6mWGW
	 1AyzLnhSFAFXJmRrW4lUeIic175uMqQIbQfiqp3rmzpezqVrAr/al/iH+4IXXemqOKW+J
	 YpSTmlGx4M8KlnLmk0Is00lGndT64bRMTfICi69Bt0yuMh4d3cUjteMDGQ4sDq+8k+mvR
	 dxpJ5LpKjOE1zdNk5ETXC1Igx6OPIXdc9km3grB00ZCNKUU63AbcwosaU8jRuJ++HxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512781;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WNBcdN4AN+OAl+FMhFjOrLAZxK6wm+o7XqB3NRfahkw=;
	b=muwSYygoJhGS0qGsrkK5k22TNieXn7pO6+aCoKUextEbUwprSpO/htByF2YV4NlRIITC
	 Ll2rrTLwQWpMuRq3C+GGTjNfmctkrO7gdGBBWMxDn9CbmRDXVrJWRPXk+NKAAngwBuNtL
	 QyUTJTSXZtz8pZQEvYFLiV0/i48tHXcs30Q/6IZGDPZY2DiAuvUvKa3bcDsI4gIrMmyca
	 zaEXsp4+b3rvFYHqU39KeUGWpXJ84x2en1QunY3JBG26JmZUM/mZJ7cE7JWZLBOST8OZt
	 H8D7SO37r5tvXo3GvzAGRA49MYSdJ7ysDTfRjprtN1BbH+x4G9C8lOyWd+Bdhn15Dgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=gdtgpo2u7zh7louxgtwb2b4dmq.protonmail2 header.b=eNqLDqtZ;
	arc=none smtp.remote-ip=79.135.106.99
Received: from mail-10699.protonmail.ch (mail-10699.protonmail.ch [79.135.106.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9781D606A31B
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 16:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9781D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=gdtgpo2u7zh7louxgtwb2b4dmq.protonmail2 header.b=eNqLDqtZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=gdtgpo2u7zh7louxgtwb2b4dmq.protonmail2; t=1792512777;
	x=1792771977; bh=WNBcdN4AN+OAl+FMhFjOrLAZxK6wm+o7XqB3NRfahkw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=eNqLDqtZhtAzmFnPe9E4MXUAuCxlxuuMgr6hrp2QzhnlaVoPJO4eb8oDYha+cRuoJ
	 2sfvi2D6lTd0pjipE8jprq7swMBBT1BgqC66UPGZTK8in9vgwxs2hxd58o/MIjLuSy
	 8HmFdOzEWAYLbqQ0vhsR35OpiN7hOkRP15CREL7qrC9BM+n0n3FY/+R1vBe2VK1wbh
	 SFe/rDDf/PwmfXVsJYlVYhJjuAcZ6oc9aRKwprPSFF2WLYX17zwh/1SwIluisqmlga
	 i9KIhHmbuJXWIRV8OP0vpqPslHOVwdmqB9q86Y9iLWy9rXgxvB4Wi9Zysm2FGoCdce
	 v+G6/DHJsjwMw==
Date: Tue, 20 Oct 2026 16:12:52 +0000
To: "stable@vger.kernel.org" <stable@vger.kernel.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>
From: verazimmerman1987 <verazimmerman1987@proton.me>
Cc: Sasha Levin <sashal@kernel.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: [REGRESSION] 7.2.11: no speakers on CS35L57 SoundWire laptop, "CODEC DAI cs35l56-ot25 not registered"
Message-ID: <k5Jaxe-8dtnRDkZ9ahH_w3C6hqb0IATbibwhxy4gAuOS5rV1HKzb4hzzv9XO9reX24UPoyKP30ZfRI6EVa6Jl0A49Q8Z5o7VKfgFyaq1x7M=@proton.me>
Feedback-ID: 187400468:user:proton
X-Pm-Message-ID: dc5441b4d30896f0953b83a8c7ee4dc7803304c2
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,
After updating from 7.2.10 to 7.2.11 the internal speakers on my
laptop are gone; only "Dummy Output" is available. 7.2.10 works.

The sof_sdw card fails to bind with:

=C2=A0 sof_sdw sof_sdw: ASoC: CODEC DAI cs35l56-ot25 not registered

7.2.11 contains this backport:

=C2=A0 bf7a3ce1d563 ("ASoC: sdw_utils: Switch CS35L56/57/62/63 to use OT25 =
DAI")
=C2=A0 [ Upstream commit 4b7f393a01f88e8d03cba94cf4948652de14789b ]

In v7.2.11, sound/soc/sdw_utils/soc_sdw_utils.c now references
.dai_name =3D "cs35l56-ot25" for the CS35L56/57/62/63 entries, but
sound/soc/codecs/cs35l56.c in v7.2.11 only registers the
"cs35l56-asp1", "cs35l56-sdw1" and "cs35l56-sdw1c" DAIs. It looks
like the codec-side change that adds the OT25 DAI was not backported
together with this machine-driver change.

Could the commit be reverted from 7.2.y, or the missing cs35l56
dependency be backported along with it?

System:
=C2=A0 Dell XPS 14 (DA14260), Intel Panther Lake, SOF (sof-audio-pci-intel-=
ptl)
=C2=A0 4x Cirrus Logic CS35L57 Rev B2 on SoundWire links 2 and 3, fw 4.2.1
=C2=A0 SOF firmware 2.15.0.1, "SoundWire default machine driver with
=C2=A0 function topologies"
=C2=A0 Kernel: 7.2.11-arch1-1 (broken), 7.2.10-arch1-1 (works)

I'm happy to test a fix.

#regzbot introduced: bf7a3ce1d563

Thanks,
Vera
