Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731B618562F
	for <regressions@lists.linux.dev>; Sat, 26 Oct 2024 08:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729931341; cv=none; b=Rw9mY9FRuRr1V3b9BtzroBlhTdM0ajEX6QSD7ZOcUPOVM8gbXaVGHE1/Il2N0gj5cJUc81OynXZcCNuMkR8jHcWif6nWhItJBzwewbWgg9zKfiaMJBO+u1kHnIOkC21qqE/j57gWS5yZ20dwg1D4UGOduc/YYZFj3n5o46sfU8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729931341; c=relaxed/simple;
	bh=Hkrr8nj6+2PyyERqujQs8w/2O7uWfz4zEvFO6eAZ34I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Qx6OVU3xSsaeGWIbLOn32HWcWrHMfrxEir0QvrS4RIqicaQnl2ifBjuXb3wAs8r5KH2bKQDS7cMI+Ny9TGQLpf96Mtl3P7omiNnr8Dr4bkU6lWLuwxKcN+1dcI/FHvtkCoXQmHDtHI6uuPaQqEbqOEFvOcjswLSu4uPCPlUWGlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=dKsZotgx; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="dKsZotgx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Hkrr8nj6+2PyyERqujQs8w/2O7uWfz4zEvFO6eAZ34I=; t=1729931339;
	x=1730363339; b=dKsZotgxZFLIfQSMrTwYTEMOEP27rBy+FDx3yDg6NQYvF+Z0Wbzp0IEuNQw44
	go1BXKg+aI/YhlILUAwtlc0dekePfMV7UeJN1ivlYWx96TtajDUi+onm1BnDYrzvPIaWFd9GQkoYZ
	OUXlduTrB24UEAsF1GG9y3GHwheaZlRBle4MKNCYLYRXsuQPx6VHP1+Q9vM0rmbRo1bC3Y61Myi+3
	u8nHLjeqQzra8xHPNbeNsB6WgEbWM/ZfUfMh8VgkfLfosibkeWtx6YcZObndkBv67pq/N7iUrUHk/
	cALuTZFRSTz+DmbnN3cxm/7FOosAjMlWNOQ/PdDr6zMeFPduZA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1t4cAF-0000Ra-Ce; Sat, 26 Oct 2024 10:28:51 +0200
Message-ID: <5f2c55fa-d783-470d-aaa6-3ebce2b5c2bc@leemhuis.info>
Date: Sat, 26 Oct 2024 10:28:50 +0200
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
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1729931339;1c8aaa6c;
X-HE-SMSGID: 1t4cAF-0000Ra-Ce



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/linux-fsdevel/ZxFEi1Tod43pD6JC@moon.secunet.de/
#regzbot fix: iov_iter: Fix iov_iter_get_pages*() for folio_queue

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219417
#regzbot introduced: c1ba4b8ca799
#regzbot summary: jfs: mount of clean filesystem fails

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219420
#regzbot introduced: v6.8..v6.11
#regzbot summary: thunderbolt: errors when upgrading the firmware

#regzbot report:
https://lore.kernel.org/all/63d6ceeb-a22f-4dee-bc9d-8687ce4c7355@oracle.com/
#regzbot introduced: v6.11..v6.12-rc1
#regzbot summary: workqueue lockups

#regzbot report:
https://lore.kernel.org/all/7d052744-4bfa-40bc-ba06-1b4c47a5eb87@heusel.eu/
#regzbot introduced: 1b6d7f9eb150
#regzbot link:
https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/issues/79
#regzbot link: https://chaos.social/@gromit/113345582873908273
#regzbot title: tpm: popping sound in headphones connected via USB-C

