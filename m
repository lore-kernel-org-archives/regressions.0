Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1863264DF
	for <regressions@lists.linux.dev>; Thu,  5 Mar 2026 07:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697132; cv=none; b=Cjt4jsG3fojJdoQiOoOcnpsj8CGaLoNhWsJ9zoiQ4Gb8ueXLL+KYZAl74Ihbs8S4gDrnhWfK8yxWSjDI8I3i/E1UwttfJCn+xLgALbJR/PDOk4cFW+SXgCL5flx6kEZ04OpTfnHyiaNE+67kmq1k976IaNVgtN39UHFQo6A5J1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697132; c=relaxed/simple;
	bh=M1Ugsf9m4Bi0d9LReZu15Ikks7uH70Y9LvuC/L9zoE8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=JYfV8iumd2MU9dJC/RBiwJObLBThIlb3sGRn4x32lH7ywdnjE6VKWlLjQuFEfWzkLbMIxC3K086Kk4+hJjpNNOwRpCy90QJgnW3k0Vr6oxRtldupgZbPu0nUhB8npzF40KD5pMNFl3HgHPnCjomZ2BoiU3tFjpdnrZvQ/zZicc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Cdd+TTSI; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Cdd+TTSI"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4fRMFC6cf7z4Ckq
	for <regressions@lists.linux.dev>; Thu,  5 Mar 2026 08:51:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1772697119;
	bh=M1Ugsf9m4Bi0d9LReZu15Ikks7uH70Y9LvuC/L9zoE8=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=Cdd+TTSIVog6ZVtTX3mhT4/3Y51lwGkONj4nKcwKmx8CtzswpbjYGvpms1SwKrmyq
	 wAQNTxpHBM1+icLcIT/fr78FVeIdyoLyLzNlLJURbHkgyH+xKfnArGs/qva8aRoRAM
	 4XimrcG4gkMm8rWK7NePxGlJKTVvPQTCBxA5wwTOlN6radzKqQSfLdgF9PntN2mTDJ
	 PaVY2G56nR3SDVnGQQQ3+v2xZPS18/DLCRrmmYpPIv1kLu5A01ZiETqZIwHFfnQZqm
	 88KDhX6kzHqSupFVPz6sQe75DVoy2nBeOWCd+cpFQrlCzDQ6zkASyOY+Nceb0S2+jK
	 TpUPrheob8HHA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4fRMFC5xGdz7wPS
	for <regressions@lists.linux.dev>; Thu,  5 Mar 2026 08:51:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fRMFB0bJgz8t4J
	for <regressions@lists.linux.dev>; Thu,  5 Mar 2026 08:51:58 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 2B881617A5
	for <regressions@lists.linux.dev>; Thu,  5 Mar 2026 08:51:57 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <9a77a88d-99ce-4136-ba05-b6c0e9e22f75@leemhuis.info>
Date: Thu, 5 Mar 2026 08:51:55 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <177269711735.142259.8500724499871381732@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 2B881617A5
X-NC-CID: BpAQYtZ0yCTVgbx2kBOCFfhAZ4Hj1x7gaLGaUTU4FngIKr+dy30=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20260218-wip-fix-iris-plus-v1-1-e6b969defd6d@kernel.org/
#regzbot dup: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15777


#regzbot report:
https://lore.kernel.org/lkml/CAPh3n803k8JcBPV5qEzUB-oKzWkAs-D5CU7z=Vd_nLRCr5ZqQg@mail.gmail.com/
#regzbot introduced: c7159e960f14
#regzbot monitor:
https://lore.kernel.org/all/20260302102825.274385-1-lvivier@redhat.com/
#regzbot fix: qmi_wwan: allow max_mtu above hard_mtu to control rx_urb_size

#regzbot report:
https://lore.kernel.org/all/558b602a-1b30-2761-fff4-04d837656ea5@rock-chips.com/
#regzbot fix: pmdomain: rockchip: Fix rkvdec0/1 and venc0/1 for RK3588
#regzbot monitor:
https://lore.kernel.org/linux-rockchip/1770891364-52147-1-git-send-email-shawn.lin@rock-chips.com/

#regzbot report:
https://lore.kernel.org/lkml/fd099b27-8716-4ed9-a2eb-f9b03fbb45cb@skogtun.org/
#regzbot fix: 9197e5949a41cfb5d44a6b8a860766266340d558

#regzbot report:
https://lore.kernel.org/all/qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net/
#regzbot inconclusive: reporter seems MIA

#regzbot report: https://lore.kernel.org/lkml/aZu9muHK02vPPl8E@archie.me/
#regzbot inconclusive: unclear, maybe something odd on the reporter's
machine


