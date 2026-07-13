Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2689395D9F
	for <regressions@lists.linux.dev>; Mon, 13 Jul 2026 08:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930924; cv=none; b=I1EkmeSPdJJR6xqo2jPPSWUDjMraO1uPlSrcrF+078EgSMivSf328xKDCqpqbkXyHS/HrQ8+LD0RCNZEV8wMepnP/Qpmos5lc6rfEnglt5MZyIvJMAGRaU5BcaTOS0K8l2pup0/Y53B56qnzbwtG7TQX8ligI6Ln0Zz1dXrLAh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930924; c=relaxed/simple;
	bh=BBGxN+IFSinm3F1HRbNmBwn5+MjY8ZjLa3ySNeg/xok=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=PabVmqy6yYytAPR0hAcu1u4vfRg8S1jS/542F7aQGBTCDzDaxFytkXCWy+lVL7HPxWNpom2ibA0WMsmfR5gOObP/00EV46+GFLHUHIRt/hjy6tOqSX0oBiwISRExbPeigcbewsFwnvNsC76msyseQ9GCKd4Avjbic3+ZFbEe/dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=NTtfxrOZ; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="NTtfxrOZ"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4gzFlh6Qxdz8DJp
	for <regressions@lists.linux.dev>; Mon, 13 Jul 2026 10:21:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1783930912;
	bh=BBGxN+IFSinm3F1HRbNmBwn5+MjY8ZjLa3ySNeg/xok=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=NTtfxrOZP3sGJAYwljmOkXOk858T5XgZCEZQ+b0Wpi9acWhwH0ijlFazTr3mL7LYZ
	 0VQHwOvX5aI35+X45qxwfo4efa4r9lzY4P1hnmpfcGcjK1ghUIiACWNKExCAYOsDD7
	 M0UujhK0cFzh2NCSmt7y8HiKSKiNRO+VqPonM0pBcQWElgw1H/QdusPl688ORgJeYx
	 ec7yTfYeXKBRVAc7Uvl6s5JlZXDkv6wgwrck7z4jcl+KfQJwzCCg2FlCl+tzrfp8QX
	 ePt3O/wSkBN/ktb3pSbFpv1L0Km7yxcRMTHAagi0LJJgfc7SBNc5n8AZj8BL4jUJqM
	 rvl8t5HFuepfg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4gzFlh5l3lz4xM2
	for <regressions@lists.linux.dev>; Mon, 13 Jul 2026 10:21:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gzFlh0j3nz8tcf
	for <regressions@lists.linux.dev>; Mon, 13 Jul 2026 10:21:52 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id DC1B360322
	for <regressions@lists.linux.dev>; Mon, 13 Jul 2026 10:21:43 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <7e054510-1178-4cce-9133-ee6ea1cdfcd2@leemhuis.info>
Date: Mon, 13 Jul 2026 10:21:42 +0200
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
X-PPP-Message-ID: <178393090408.3554832.9108261906295756508@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: DC1B360322
X-NC-CID: PVIQJJ3YOesZIeIWpDZmW4GY7i6OHpbagaxw7yUeN4Kyex4fK/w=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5465
#regzbot introduced: a62346043a89
#regzbot dup:
https://lore.kernel.org/all/178379850751.8410.12007342378134020217@murena.io/

#regzbot report:
https://lore.kernel.org/stable/6eccafaaaa60651ef091257c3439c46b@stwm.de/
#regzbot report: 516403d4d85607fdef3ca41d4a56b54e5566fa9a

#regzbot report:
https://lore.kernel.org/lkml/20260706170735.2941493-1-linmag7@gmail.com/
#regzbot title: proc: several strace --pidns-translation tests started
failing

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221727#c7
#regzbot resolve: things for some reason started working

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/4893
#regzbot resolve: seems fixes where mainlined


#regzbot report:
https://lore.kernel.org/linux-scsi/GPhsSM0vkgyIrs0DIZ62qeUZX7X4RxwQXVKiuvMx-lHQVSPDxpztUyQOGS0xikqvJ-Z94hMV-dW_5KN_0CX2hsfV7kTf_t0MTf6vdAAaSEc=@magik.net/
#regzbot dup:
https://lore.kernel.org/linux-scsi/0CFE3F49-179D-4735-86E2-B6C1EE2FDD2A@danielfernau.com/

#regzbot report:
https://lore.kernel.org/linux-scsi/GPhsSM0vkgyIrs0DIZ62qeUZX7X4RxwQXVKiuvMx-lHQVSPDxpztUyQOGS0xikqvJ-Z94hMV-dW_5KN_0CX2hsfV7kTf_t0MTf6vdAAaSEc=@magik.net/
#regzbot dup:
https://lore.kernel.org/linux-scsi/4FE725D3-0702-425C-AAC5-4E0AF86E5EA1@intility.no/

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5167
#regzbot resolve: inconclusive: not worth tracking, pretty specifc, old
regression, and reporter that knows how to handle things

#regzbot report:
https://lore.kernel.org/lkml/O6pYAi7yf23du9ivLsL0QqrnTmodj2lDTL7Wviv7I_nhjVtvllO7Y5Ban0TeTqrastb1RWhJtlkqrM3quLMWSriai-YjjGy312MTcEhxyWs=@protonmail.com/
#regzbot resolve: inconclusive: not worth tracking, extreme corner case,
fixing it might cause another, and maybe not really a regression
