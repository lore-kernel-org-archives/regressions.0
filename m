Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634192BEC5E
	for <regressions@lists.linux.dev>; Mon,  3 Aug 2026 07:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743444; cv=none; b=LcCkmGSI6X57sKxngTdeOA4aHsfMa4Z4v9UTgMSKlROEDI+WAcqBNy+9d3fJAAVxvvmetkC8pUW+7b+kGlXAvqxwu13nOEjisbgEf736DbRI1KGefwOqPspMAxvigJ7lTJDatHn40Hjy7s0Dsbuq57SIzDXLcmAtH3qLZJeUfGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743444; c=relaxed/simple;
	bh=/5vKaJ5Jab/suyXVO4i1bA1sXNwyoBqzzJFclEa3a+E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=R+XDFuhmRoXUuWUHHtccoZFVjWgOA2qCR2t7LV59K65LclV2z0/DMAKntxsy8tVvXROwzUzGBBisr9/w0rncpyf/RejCm0LWp5ZtGOGvx4cun23CIzEYlIDI3mh+vK4PWS8vysV1/Nw3e/qFXZ7MjizFMoXpQ5XIa6qQBM2691Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=e7ebirNW; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="e7ebirNW"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hD83y6mP2z65Vq
	for <regressions@lists.linux.dev>; Mon,  3 Aug 2026 09:50:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785743438;
	bh=/5vKaJ5Jab/suyXVO4i1bA1sXNwyoBqzzJFclEa3a+E=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=e7ebirNWhqpkqB0jZDY64fAp/5W4BDcEt8u71ETyMnuskVFye81DkGX4uxWp7PYK+
	 dZJ/KdB5EJ09WOwR2jhByu2kmBKuh5IC3jtYv5WMKhA24iGD803lC0tj7H7UOW+3ds
	 o7GZViLGQo30UW8fjXTBYRsMF1IMktTEmTvlqIUHS+jRgGZ9w/3hJascxOgtDAHDs/
	 VHd/Nm5a+dbv++pjmJtpgCKGL3dm/r1oV3oToDPbr3M1TDEjO65gQHpI6fAXOhdF4e
	 cZMs72y5TZPcosVZ8Mcxm708C+3WJSPuTXR4tBZdw3DbvGLovOp5H43EPTdEXT1sTL
	 Gl3kdrNc+FNWA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hD83y61YDz4xYr
	for <regressions@lists.linux.dev>; Mon,  3 Aug 2026 09:50:38 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hD83y47Bbz8svJ
	for <regressions@lists.linux.dev>; Mon,  3 Aug 2026 09:50:38 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 000B05FB88
	for <regressions@lists.linux.dev>; Mon,  3 Aug 2026 09:50:37 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <431847c5-3573-4065-b12e-06e99047c48f@leemhuis.info>
Date: Mon, 3 Aug 2026 09:50:37 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178574343818.631152.8916801735887995299@mxe9fb.netcup.net>
X-NC-CID: famQW4UfHR8pxxh0EmmomWkrFVGVPeFEKwuQP5vKyk2NOXU2UOA=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221801
#regzbot title: PCI: booting takes longer
#regzbot dup:
https://lore.kernel.org/all/20260801201244.4421-1-andiwild@gmail.com/
#regzbot fix: PCI: Skip Target Speed quirk on clamped ports with no link
#regzbot monitor:
https://lore.kernel.org/all/20260801201244.4421-1-andiwild@gmail.com/

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221774
#regzbot introduced: e716edafedad49
#regzbot title: HID: multitouch: palm rejection broke

#regzbot report:
https://lore.kernel.org/lkml/ea15cce1-b393-43f6-8d58-3d6f90f0c0cd@samsung.com/
#regzbot dup:
https://lore.kernel.org/linux-arm-kernel/20260619204832.586079-1-dan@reactivated.net/
#regzbot title: arm64: dts: broadcom: bcm2712: booting broke on RaspberryPi5

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5527
#regzbot fix: 8419331e64d92a8de

#regzbot report:
https://lore.kernel.org/dri-devel/PH8PR12MB7279ACE40040268C9A48F484F9F82@PH8PR12MB7279.namprd12.prod.outlook.com/
#regzbot fix: 114b42507b6a23d9d2


