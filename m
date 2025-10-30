Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD74D1E5718
	for <regressions@lists.linux.dev>; Thu, 30 Oct 2025 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761825368; cv=none; b=h6M2UPFjGKOp6cDJGC/INXJGZVaOOT6xo5MKehHgMqwQ3BD5k87TT94KAkoXF/Ia4vwHpMb+8rqpY9bUDgwv9ZJnmkvVcG0V0bdetcBI75og6znJ8zDEIjyNOi5ewQa0rWV+DhOn6UDMFdr3ShJl1qJcFPSiCswXfARHaS6pyZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761825368; c=relaxed/simple;
	bh=ud+YwPE+Luum5bXZteIfLLA3xppiyJNp2nD0xxRMOfQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=qMTEypbQ6q4wTCPRaBRxww/tLDRuoNSUw+LHRfNDzlHTwNQSDInwGfuDaXKP59tqw/yNFn8G69fRGXWmxXVBzcND7INOa4zWDINUIS3oQX8b7vjHfU41W++711QZ8dkhF+hyqXRAF4xiJQmSS0pZezMcjx9o427dEyZpaAAwZ1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Tgh75PHs; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Tgh75PHs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=ud+YwPE+Luum5bXZteIfLLA3xppiyJNp2nD0xxRMOfQ=; t=1761825365;
	x=1762257365; b=Tgh75PHsdx7og/ocEUs91+nGOLOqIzejtteuMMLHW0rKaTyI96dhi3GCFDL1J
	AYQd9VooSnh9iH4dXhmcMtkYk2GLnaaL8ryMrk5tjswXaZtfFhty7KjhujZSAnDZb13z/pUEK+oKR
	dfUBUpsJ8ZSUgvlnanlP3ZRFmJBA+mVoSK7LwVAY/vBblqGYKyPshMrDmVvj+rBqyG1LaMwulr2+0
	9tGpy3Y5jnvknnFFjNniuFM7YmQdZO0KAiaaARpS/1y446jcpvVSz8NljWT8irOL03wmoZxF6uVgT
	pAwAcmcVeSeLg/gb/lCqx8MxD6Uaih65ySnAPOPb72dw1uZWPQ==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vERG7-001FGY-2t;
	Thu, 30 Oct 2025 12:56:04 +0100
Message-ID: <0b049c70-f89e-415c-a673-f12f33051fc4@leemhuis.info>
Date: Thu, 30 Oct 2025 12:56:03 +0100
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1761825365;60333601;
X-HE-SMSGID: 1vERG7-001FGY-2t



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/linux-pci/20251013211939.GA865451@bhelgaas/
#regzbot fix: e433110eb5bf

#regzbot report:
https://lore.kernel.org/lkml/20251013205531.GA863704@bhelgaas/
#regzbot fix: a78835b86a44

#regzbot report:
https://lore.kernel.org/lkml/20251013210236.GA864224@bhelgaas/
#regzbot fix: 1d5d1663619d

(the latter requires f294a5fd34db, too)


