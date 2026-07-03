Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA1935E94F
	for <regressions@lists.linux.dev>; Fri,  3 Jul 2026 14:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783087558; cv=none; b=h+kCh0/u7W84i0D3VfSSDxxr045QJlnOjVBHzxhXtrQG427ui62qM0JVVwMuxshb91OlfV/Xkbf9YsoXAiOu/4xUtP2OOhpR2v0UDDuglBDItZqCqXTfyb9+sz5m/HBGmv8PnINoqqKUzYNhC1f9HAlGO+2DDYDrfXfGCuLqN/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783087558; c=relaxed/simple;
	bh=LfRcnY8F8PFhrGuhoaoTiJbe/ex5n1bmT/ua4i/qYg4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=tQGmao6wbjkAD0+v9ymbi/PYHkgnpNH5voddNKNkrKr8SAZORAqJFB86YQOa1JGYEievz6/Eheg/gqQjnEiOwRUX29uIyNwsHIc12MGOz7apa7bELg4FQSFcLhrCMhYUMnmtLCj9lLZLfd5o1TcU5AprL3REM/T4e3FrPpuHqW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=MwwWixLM; arc=none smtp.client-ip=188.68.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="MwwWixLM"
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4gsFs74YPvz8kqQ
	for <regressions@lists.linux.dev>; Fri,  3 Jul 2026 14:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1783087547;
	bh=LfRcnY8F8PFhrGuhoaoTiJbe/ex5n1bmT/ua4i/qYg4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=MwwWixLMeHel3pfdqsYHtyXinF/3eATkhoBQONIqC70XuRyI0X0tO1X9gmd9n2uh8
	 O+hNORJvqB7iW/gi+buwY3uUQnru2tvR6QkJdDC2tSMFXQicpYBwL8VPwf3FivFwoa
	 99fbuisvQly6WpkK7aaANF079U4bJQ05p0NL0sRLl+z9okdXzlo+Bd/XsJzu8MGKhy
	 LV+BBdNH5lhEcLS8KkwiiIGky+d0mPOP7mlTK4LD/QcrpH2lD+VxpqAI7ZUZLbStvZ
	 qRfqRC3yDKbRmKunJ/iyrN58LEqNSp6x2RLEm5820+v5ZD0n6Bddlql/YjHy7E3afI
	 /X9dYw+tVVr5A==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4gsFs73sdyz8k2T
	for <regressions@lists.linux.dev>; Fri,  3 Jul 2026 14:05:47 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gsFs64W7tz8sbf
	for <regressions@lists.linux.dev>; Fri,  3 Jul 2026 16:05:46 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id E7563603E7
	for <regressions@lists.linux.dev>; Fri,  3 Jul 2026 16:05:45 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <6bdc6187-5a84-4738-accd-8366f35dbe9b@leemhuis.info>
Date: Fri, 3 Jul 2026 16:05:44 +0200
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
X-PPP-Message-ID: <178308754611.278820.5829099021759794696@mxe9fb.netcup.net>
X-NC-CID: JherfJpF84yB2f5thZ1v12AJernrGFM94S27SJ7iyzZy/LfHl54=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/ajRmlyx_AEGybykL@soda.int.kasm.eu/
#regzbot fix: wifi: mt76: fix MAC address for non OF pcie cards
#regzbot monitor:
https://lore.kernel.org/linux-wireless/20260630210215.400379-1-rosenp@gmail.com/

#regzbot report:
https://lore.kernel.org/lkml/CABXGCsOuCXr4R+WW60KNuWNS2MqzE9w6iv-t_ykbwmhqDSABAQ@mail.gmail.com/
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/work_items/5437

#regzbot report: https://lore.kernel.org/all/akZpICZ0pGqspV2u@monoceros/
#regzbot resolve: patch was removed from -next

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221696
#regzbot introduced: f0457842215438786e2e205ad06a4fbb8ab63cd0
#regzbot title: bluetooth: btmtk: NULL pointer dereference
#regzbot monitor:
https://lore.kernel.org/regressions/7ea1c4a0-d38f-413b-993b-7846b2b7debd@leemhuis.info/T/#u

#regzbot report:
https://lore.kernel.org/lkml/01ac45a8-b558-4d4d-9f8f-e7a4e725d5d2@zytor.com/
#regzbot resolve: inconclusive: padding issue, likely pretty specific;
not worth tracking and people are working on it

#regzbot report:
https://lore.kernel.org/lkml/r16mBH1ydY4oK0PInLKwpYR2I5qZBsV5J0JsNLrXAh8OR_QC6z6lABKlcvpzgUiBuarTKtVTP977RLI4mqt64Ydtd2O3yfhRuRJkQ1JL8u8=@protonmail.com/
#regzbot resolve: inconclusive: reporter MIA


#regzbot report:
https://lore.kernel.org/lkml/d171cc76-bf25-48ce-b482-d344669dfc24@proxmox.com/
#regzbot dup:
https://lore.kernel.org/all/GPhsSM0vkgyIrs0DIZ62qeUZX7X4RxwQXVKiuvMx-lHQVSPDxpztUyQOGS0xikqvJ-Z94hMV-dW_5KN_0CX2hsfV7kTf_t0MTf6vdAAaSEc=@magik.net/

#regzbot report: https://lore.kernel.org/lkml/ahC8Pyuatu_AvnZp@google.com/
#regzbot fix: ced835ae1f62c5

#regzbot report:
https://lore.kernel.org/lkml/773ba972-433b-44b4-89d2-295bd9f5de38@huawei.com/
#regzbot fix: 8c292e89bd831c

