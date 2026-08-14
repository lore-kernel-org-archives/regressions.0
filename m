Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B68845DF42
	for <regressions@lists.linux.dev>; Fri, 14 Aug 2026 12:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710610; cv=none; b=KVgcJr0jSk9XpYBG+JgLyynCXvs6zmvRktn8oKHO531Fxi+ysjw89+ish5DikNJLtyvirwGosdCjfXhw2XSo5+GRlD5zKkrMCv6cUwiOa3EkJsWTdX/1G13WYvebB/2EQi89GukLETefZ58vXBHh+7NTidWLuO4BoxK18LLBM3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710610; c=relaxed/simple;
	bh=YsmEydYEM5q2IcU4+Jg6W9+2Z1dCMOtA+OKNLjG5WMU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=DRYM57h56VQXm0Pnz07+RpnnkjCBLoM2FIORbI7V26ir+blpWIMPx4tRbkRm6IvkfglbQbDN2+Nja8eegAZT16rdS5L2KAI+Qy43Lf1wYEMlaT6G3dZbu0Gck8TJTyxD/nvmoxut61A8l2iWvd9v+nj/gq9Ma8oy25H1fIgaiQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=IMfeHEnt; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="IMfeHEnt"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hM1jz0qFhz48fY
	for <regressions@lists.linux.dev>; Fri, 14 Aug 2026 14:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1786710535;
	bh=YsmEydYEM5q2IcU4+Jg6W9+2Z1dCMOtA+OKNLjG5WMU=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=IMfeHEntqYE/NITBKgm0rTP+d7HkET1nvHtyRgZIwuttiPqyW1/S8iJNFhLsdjekq
	 GNbYGc4zhhU6uH7SwVyZXoQUSb1pIF45cKomYwp7ddcC+ESYWK57Ac4ig6o9kgjz0Y
	 IghURdd33ZUq0VywydtyAHa+zRoZ0MAEKb6XrEGYzz4QPcp3Ja+tjqg3W6zn9Hen3R
	 4INS1h4bG8lnq1zl9fGvMwwj9zM6pmko/f2Pqll8g0HFPtUkQT5K5G49GuQbtuHoj9
	 yw2tgFTW4AKEArmp5IdRp8KMJiSjhNfEenaQXLDSFHxVr/6gi6BYZie1CgNTLDNBkm
	 jOqFf4Aw9PLpg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hM1jJ4VVCz7vvV
	for <regressions@lists.linux.dev>; Fri, 14 Aug 2026 14:28:20 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hM1jJ34Y7z8sh8
	for <regressions@lists.linux.dev>; Fri, 14 Aug 2026 14:28:20 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A6BAC5F9B8
	for <regressions@lists.linux.dev>; Fri, 14 Aug 2026 14:28:19 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <1289ab0f-4e33-40f8-b921-0d4c38f55ad9@leemhuis.info>
Date: Fri, 14 Aug 2026 14:28:19 +0200
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
X-PPP-Message-ID: <178671049984.931143.13861452900324341766@mxe9fb.netcup.net>
X-NC-CID: IB6A1FWKj4trDKXPZj3q39NO+hVFUoz1anK+PHuzemfyA1CNgKM=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/bl7i3obu2clzsgeoct2a4mtfhv6typcjdqmgneropf3hpgwve6@n2m5uhlduw57/
#regzbot introduced: 610fa91d9863
#regzbot title: PCI: imx6: PCI link creation fails on Apalis iMX6
#regzbot fix: PCI: imx6: Move clock enable after core reset assertion
#regzbot monitor:
https://lore.kernel.org/all/20260813095003.356062-1-hongxing.zhu@oss.nxp.com/

#regzbot report:
https://lore.kernel.org/lkml/TfhgV1W0W5LI6RWUO6J35B3R8QIYH_FN3Eihzdo_9PH39hfn1AVByT-QBPHmWiAR-L0Kqi2sppM_EhFPKwZPGmb5pFgpF2MrzeFzkZDmpG8=@proton.me/
#regzbot fix: Revert "drm/sched: Switch default policy to fair"


