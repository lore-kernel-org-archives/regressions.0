Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5900413789
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 14:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900013; cv=none; b=AsnxcFrcL4gBDhItdsjw83dqCc2i22KLcpdiOyTtaYJSbquMJZDbsGu3jeat9/hAK+8jbeZy0O3zMsBmdqbHfEOLxMfGUbK2XTfrQRxjzdR83mLhsLN6oi03yIy58wCMPx9VWpEJDzlRBIhH4A+l1Hc5n9C6ogIX7gsten53LBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900013; c=relaxed/simple;
	bh=/YABckFbJTbigc5I5JyUYeUJic90eIY5TnWHn4SHxjE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=psl5Zla05j/VQrDQ4uAH7z83VgPrx1uzgkBt+AOnhgi1XX1HVvI1tpFptI/9yNJe3zQiszv4RzWv+tN7/u1sglsjXDDxeX60HeEHQsfM+oc1R91PSWgDkVgleuBSyVkGY/fNSbMDJxfVKYu/6Wgr0Gfl+DtVNpCTunyIMJZ3lZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=kbcIPGpc; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="kbcIPGpc"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4j3wsx1h3Pz42jG
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 15:58:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1791899925;
	bh=/YABckFbJTbigc5I5JyUYeUJic90eIY5TnWHn4SHxjE=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=kbcIPGpcvkx8hMo9z1nYZNg+EJ4tIvuh9P1nu6UYDaLhxoHTUgHDelcDtD19BZs0n
	 ZBiM14A2y8T/wLWMcEmvXjxItwcKBWmAz6w/ro2lM5uEOIYMJLeBQqUuAaHF7+/1Wt
	 JvjPxtFGSbkPLgh+0XIfMulZz1Tdx4m7NzvF2jnUhzdPZ54iEsjQUqwqYQ29nf0x4k
	 QDOw69fZBR2SyjTQwMLy6c/+k56EFUYo6U5sewvxGZWzsK4DfquwFXj7m/r9kLavGG
	 nHGgnopm6WJIcvZcFtShQ0ZMLL5CoMehKviaE0qIBk46H34E8J1GXVIi3No0Myo3RO
	 A5cBghZ3wVfkA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4j3wsx0xB6z42hm
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 15:58:45 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4j3wsw60bJz8sch
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 15:58:44 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id EBFAA5F9CA
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 15:58:39 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <45ee647a-6e60-42c2-a165-dc21258f8999@leemhuis.info>
Date: Tue, 13 Oct 2026 15:58:39 +0200
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
X-PPP-Message-ID: <179189992015.939996.10805341786759575767@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: EBFAA5F9CA
X-NC-CID: rr7dRSU5P9NgMAcpzUgQjrF9ymlxKGlGFYUxNYmofxwpFzIOj0I=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5678
#regzbot fix: 85371c5ef502d1

#regzbot report:
https://lore.kernel.org/lkml/20260830190717.1509012-1-lin2530632123@gmail.com/
#regzbot resolve: inconclusive: not worth tracking in regzbot, no
feedback and likely micro-benchmark anyway

#regzbot report:
https://lore.kernel.org/lkml/178682274912.1759826.11422695267451330087@eldamar.lan/
#regzbot fix: 057dac23d329d5

#regzbot report:
https://lore.kernel.org/lkml/CALAyJWrn7OQyQMd5OPoifn_3qe6iWNf1%2BxSSg_six-%2Bpo9kpvQ@mail.gmail.com/
#regzbot fix: 6f1d5a3513c237

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5634
#regzbot introduced: 8979ded4d899
#regzbot fix: drm/amd: Drop calls to restore power limit and clock from
smu_resume()

#regzbot report:
https://lore.kernel.org/lkml/GXe6anuewkS4bLNwca3cYOmUxN9csc0TxLYGSBc1qNRmfrmvFlcmD62wEM23TxfzfuXAv4P3yvUv7pyraleARrL1Na-aN8w-t9uc1Igu8DA=@httpd.dev/
#regzbot fix: 8805840aad73df

#regzbot report:
https://lore.kernel.org/lkml/CANGjgdnoz4NdqzOV9+SZaYTc+O_GkNNn5NVp+ZpHUQbp5h-QVQ@mail.gmail.com/
#regzbot resolve: inconclusive: not worth tracking in regzbot,
micro-benchmark issue and dev is looking into this

#regzbot report:
https://lore.kernel.org/lkml/CANGjgdmt0FQ=offsdfn%2BwEaDxbOFoAa6bi92X_vEo4S6aCZ56A@mail.gmail.com/
#regzbot resolve: inconclusive: not worth tracking in regzbot,
micro-benchmark issue and dev is looking into this
