Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2CC4A02
	for <regressions@lists.linux.dev>; Thu, 12 Feb 2026 18:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770920629; cv=none; b=mLsPAm1iqveMC0P0W6u5PdYeiGf54R9a8yVgTAC034hdWXQFztz6uuPcm7xBjwlfFElZ7Fj8eVwYMEBGl1g7VPuTk3/uiNWRiiLF8Qa0GukyB8AG8XHaUA1U5z1UzfkO5oP3+ortLeI3ooOBOZKibw6AZPCXUQ8eXC1v9yHpg+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770920629; c=relaxed/simple;
	bh=HCREbIboiOaPQiNqqhtZGLEe+MnQi3f2Apg0aRfEP+4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=EklewEzXAuMyeFGJKm7i1NOCmIDHX0WBsOtPPUtRsGXeL+Mok2Zim4pRzaFOEPsVp++pj3SNFIoMzZzhKatBEkcWQbytrCYBILltjotvXRCMeuzboAReRpN3XrwX55aWMw57S/ERC7huD7OU3Kc6XDCA0WMyAVhXBci19I+fbxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=KqZdA/MD; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="KqZdA/MD"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4fBkFq708tz6HB1
	for <regressions@lists.linux.dev>; Thu, 12 Feb 2026 19:23:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1770920624;
	bh=HCREbIboiOaPQiNqqhtZGLEe+MnQi3f2Apg0aRfEP+4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=KqZdA/MDNMUcqZu2duzqIQXqHHLkAZM2tqVfi8uiW7B1sHVl3DtsA2MACNfCmuyK4
	 TcCXsqHH8bUfCOWpiN+bjF2HRPYDSX5Yz8r2G6Zr0pAay1wqmSp35imh4C6D5YMDNF
	 WmrWxSGaAzROOGDJTr5PBjHM8oweHlWkO2618id1rs8B3Vf1+YXFlSPzHyqFh+WL0L
	 v36C5Co5dwL2kMkZ+YZQkJQIbR49N1bEZ14j9hSQ+FqZNLO0nflaA/MIhB6Aj1v6bp
	 T+oNFKVlg8BN64Bwaykd4+ZOWo9q1Bv0tT7DF0o0O3ebnK6iPTV7ASJb2H/yQ9/9y6
	 AWhppkifTrhFw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4fBkFq6HVwz4xPm
	for <regressions@lists.linux.dev>; Thu, 12 Feb 2026 19:23:43 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fBkFq4MHqz8sgW
	for <regressions@lists.linux.dev>; Thu, 12 Feb 2026 19:23:43 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id BE790671B1
	for <regressions@lists.linux.dev>; Thu, 12 Feb 2026 19:23:42 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ba25d95d-d8ef-4342-9f18-eaa275c8d471@leemhuis.info>
Date: Thu, 12 Feb 2026 19:23:42 +0100
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
X-PPP-Message-ID: <177092062294.2502171.7573943755336367046@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: BE790671B1
X-NC-CID: 4FlbY2yym5zDSiQV/A+qYARU/kKOg+HsQy+2ZcVpAOPDjoUgnwM=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CAK8fFZ58fidGUCHi5WFX0uoTPzveUUDzT%3Dk%3DAAm4yWo3bAuCFg@mail.gmail.com/
#regzbot fix: Revert "ipmi:si: Gracefully handle if the BMC is
non-functional"

#regzbot report:
https://lore.kernel.org/all/20260212074111.316980-1-mariusz.skamra@codecoup.pl/
#regzbot introduced: fe05e3c0593f
#regzbot title: Bluetooth: CIS host feature condition broken
#regzbot fix: Bluetooth: Fix CIS host feature condition

#regzbot report:
https://lore.kernel.org/all/558b602a-1b30-2761-fff4-04d837656ea5@rock-chips.com/
#regzbot introduced: f61731bd6062
#regzbot title: arm64: dts: rockchip: rk3588s-evb1-v10 broken

#regzbot report:
https://lore.kernel.org/all/a2eae87efe46ebf397bcec3580eb9bc152b80846.camel@collabora.com/
#regzbot introduced: c29345fa5f66be
#regzbot title: pmdomain: mediatek: Genio 700 EVK stopped booting

#regzbot report:
https://lore.kernel.org/all/20260210013733.1901270-1-nichen@iscas.ac.cn/
#regzbot introduced: fd24173439c0
#regzbot title: myri10ge: unintended side effects
#regzbot fix: myri10ge: replace comma with semicolon to fix regression
