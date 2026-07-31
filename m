Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409113D1709
	for <regressions@lists.linux.dev>; Fri, 31 Jul 2026 09:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785491672; cv=none; b=u3JwSuBbsZGz7LPq8ba/46tsC53EHw9X4Wii6TaUVTqtc+l27B9UNrvSYj0fzmT8syYt503ArBjrjdZ7CHOjM8lcFMO6hWoAgwyhNGoOsOpZItQ/9RaUjwo+ruwSAm0tKnN32sgO4/rJcVAlpC01J1OWz+V53xDPfEHRL0WEoOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785491672; c=relaxed/simple;
	bh=GvcB+CNVdxzR7DZ/75QB+uRsgk/eYLRoVeNRBn8wWXM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=uMFdL+G2YHmZbk+WJODr/drNSzFgyTaLp3xHXPFB+BLyMwJxdvu214Bi3YVPSxvKuxrHUD3C7SCkBQtj4ePphiXK4UQ9ZtM4gC8HYssLUtTD2v8MYlvmZoKitMgwB4NihWpRCAsiqnT+pr0sxLGZowP7d3ZnS5W7jkDyCTjzSYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=PljvIQhr; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="PljvIQhr"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hBLy103MWz95mn
	for <regressions@lists.linux.dev>; Fri, 31 Jul 2026 11:54:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785491657;
	bh=GvcB+CNVdxzR7DZ/75QB+uRsgk/eYLRoVeNRBn8wWXM=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=PljvIQhrUsV1D7jf5QGtb/3d6GIfe3uKsMK9b9qT87GqyopmK15qA90JO1Eb+8cDA
	 vOwfqA5E/4AsL1yrSklTSyA1tap/AvpyTay1vMOU+tKZ5EZy72OK/j07uUfaf/Wtvr
	 KgpPVgIukRaNxdwxu1/6R+uzgRckPH2MyggZn/XUauX1Gkv6IDosznOo8taUTyD47f
	 cmfI0yx2UqDNFRG2WjmZChR3x3XuyQvMSBZP/t7qZr4wCGOArQuqiepgcEg/QTqFJp
	 mmKej3v3U/6ioGGMRnZt+ERFb7OH3cxZX80GBZminMGVh6kt8vERiL2aLMcNbgUh+M
	 /nfJWbYhi/nzA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hBLy06VPpz82gR
	for <regressions@lists.linux.dev>; Fri, 31 Jul 2026 11:54:16 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hBLy04zXgz8svW
	for <regressions@lists.linux.dev>; Fri, 31 Jul 2026 11:54:16 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id E8C1B5FC67
	for <regressions@lists.linux.dev>; Fri, 31 Jul 2026 11:54:11 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <9ebbb675-4b32-49c8-9810-ea7d700fe9c8@leemhuis.info>
Date: Fri, 31 Jul 2026 11:54:11 +0200
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
X-PPP-Message-ID: <178549165213.2792250.2175478593335091328@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: E8C1B5FC67
X-NC-CID: L3+491b9Ix9ZEw8SWipScWRNUgoqrPVguTamrDxfLw43pd9/k4Q=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/all/akWdcp6P0FkNDzBk@google.com/
#regzbot introduced: 9722955b54307e
#regzbot title: bpf: selinux denials in userspace
#regzbot fix: selinux: bpf: check SBLABEL_MNT before isec init
#regzbot monitor:
https://lore.kernel.org/all/20260730221508.3846409-1-cmllamas@google.com/

#regzbot report:
https://lore.kernel.org/all/24d84eb2-1b63-407f-ae5c-6831650ad67b@gmx.net/
#regzbot resolve: vendor kernel, EOL series, oot modules.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221745
#regzbot introduced: 0949c646d64697
#regzbot title: x86/xen: PV DomU ballooning driver init issue
#regzbot dup:
https://lore.kernel.org/all/f7fe5959-f0c6-430c-8404-927d7944c836@leemhuis.info/

#regzbot report:
https://lore.kernel.org/all/f7fe5959-f0c6-430c-8404-927d7944c836@leemhuis.info/
#regzbot from: Yannick Martin <yannick.martin@okazoo.eu>

#regzbot report:
https://lore.kernel.org/all/3353bdf3-4f33-44b1-809b-b0378bee5816@gmail.com/
#regzbot introduced: c0f691388992c70
#regzbot title: usb/intel_idle: ehci fails to initialize on intel s1200btl


