Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95908332EB1
	for <regressions@lists.linux.dev>; Tue,  5 May 2026 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975482; cv=none; b=iJRQVH6U8XCCNqepS1PoZ1kSuIQv/UDYjMydM3SwNcM+KBvyxiYZGjTOHyZBH0AuKyR6BGFU/JkGielzAumZ486xwo8lkSJ3vx8TL6XiUKJpJBFcQE8q9FMrkhjYOMVubh/asBA9RcEVu0HpGtNi6yUftbd6qr8lpxVef8cROyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975482; c=relaxed/simple;
	bh=31+tRYJDJ5u78DT8GDFHtjM26njVhRnYewdENDhk8h4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=KFkK5AopldDaz4jzBcaRigM6wYUNx1BLK5tvWM4/rc9XhJTIFlwtIqNQVnBj1EZjWxl72FYxZdt+pHd79kOKZbpJzDPXOiN+qv0dstKi/moC0Ff0gKEFVFjMBv5u9WlX6UxwGWIeb6ed2DjrPnEvPtV+GTIf3kQl6dNYmTRZY34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=TX0ki9RN; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="TX0ki9RN"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4g8vJ020Ygz679f
	for <regressions@lists.linux.dev>; Tue,  5 May 2026 12:04:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1777975472;
	bh=31+tRYJDJ5u78DT8GDFHtjM26njVhRnYewdENDhk8h4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=TX0ki9RNkE05X3t5wuPeRRaMww8FDpKnuYI4uBIh/7ivnbAMKPif3o010VK3/PbqI
	 gmZtqYLe8hxuMtyG/Dn4O/FT0uBkpxowZToKycMurzvAYaLGU0xOxsowlEUHFf5a+K
	 zpibIEm1dMZoDRQPUMqhA8OfANMZ0mC2HCNLeJPZU1RqvdEjgyI3o6ybJSOWjcmzGb
	 Q8eMSp961YFk8V3gTtpbUpFLZI8wX/BVAgyHFyKLyR8yO6SYwgFbF5su2pKvJAdAwr
	 Fiul0GHGayh89JkkYfvfvpiDruhJyJ759A6S/Ol5Hr1EijB8NMBZtwPO4czLxtbWuz
	 jW92PW4rSm5CQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4g8vJ01JLrz4xJN
	for <regressions@lists.linux.dev>; Tue,  5 May 2026 12:04:32 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4g8vHz6H6Yz8svZ
	for <regressions@lists.linux.dev>; Tue,  5 May 2026 12:04:31 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 34D4E63294
	for <regressions@lists.linux.dev>; Tue,  5 May 2026 12:04:31 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <5b37956b-2de2-4c3b-bbe8-b5180fcb5b6a@leemhuis.info>
Date: Tue, 5 May 2026 12:04:30 +0200
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
X-PPP-Message-ID: <177797547138.589314.16453641255915626356@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 34D4E63294
X-NC-CID: bz8T+BUhWdzF4IoB/ZO3r76pDZU/IyR3L0sVSeqBu7zn9JEiXZQ=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/8cf80f450085ac17164e8fa1391e9635@linux.ibm.com/
#regzbot introduced: da6b5aae84beb0917ecb
#regzbot title: nfsd: Use-after-free panics on ppc64le

#regzbot report:
https://lore.kernel.org/all/8fd5d3a3-d1d7-4542-a0db-1678989940d4@ovn.org/
#regzbot introduced: 9c42bc9db90a15
#regzbot title: netfilter: nf_conntrack_expect: FTP test failures in OVS

#regzbot report:
https://lore.kernel.org/all/bf0ba588-002b-4860-848e-e806b193840a@app.fastmail.com/
#regzbot introduced: f77f281b6118
#regzbot title: fsverity: overlayfs: verity validation broken

#regzbot report:
https://lore.kernel.org/all/CAMRc=MfADC2ncuUQiSW7TnUwBUWCJn9i=wZ9dqYMZNo2h6qOxw@mail.gmail.com/
#regzbot introduced: 57be33f85e369ce9f69f61eaa34734e0d3bd47a7
#regzbot title: nfc: nxp-nci: IRQ storm

#regzbot report:
https://lore.kernel.org/all/20260501202438.376033-1-florian.fainelli@broadcom.com/
#regzbot introduced: 03f920936977
#regzbot title: PCI: controller: PCI3/NVMe performnace dramatically lower
#regzbot link: https://github.com/raspberrypi/linux/issues/7343
#regzbot fix: PCI: brcmstb: Assign pcie->gen from pcie_get_link_speed()

#regzbot report:
https://lore.kernel.org/all/773ba972-433b-44b4-89d2-295bd9f5de38@huawei.com/
#regzbot introduced: 37c4e72b0651
#regzbot title: scsi: massive resource usage that can lead to kernel crashes
#regzbot dup:
https://lore.kernel.org/all/20260415204850.799431-1-mwilck@suse.com/


