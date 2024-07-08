Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E77E13ACC
	for <regressions@lists.linux.dev>; Mon,  8 Jul 2024 07:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720422515; cv=none; b=ULRSgTIeAOzKNJrwpthwiPlmfJ5j09nilS7+4o/ei8w9DFCCqDA7tOvthgZn8vbywNPVkYl4YJyeVL8izYtwD98KnvOyzoeoB+vBaeXTpukyLxDLXelukmEqKbYslbGBcNmsiat6ldmmK8nA41J700iGCKD0cQJUSfeFNx+4U8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720422515; c=relaxed/simple;
	bh=DIU8dmfslZRLf1+pJBGe3Skn0UYVHyS7c1pVbIQqTaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fuvxs/cma0F9METAzm0iWTkU0x9KNqwtcpvBBBoNeCfgOBBCqfalkgz1fVvR0M5uF4HtrnqW85CoGoJ5bDe874esKfgv6X9rDT32TDtf/nVQTs5lKVI1/8EBY770RS65vXeSxOEXRUZOAzP3pmICLK5C9pvQKwPGZBem/CbB2qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=DpRuCtNs; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="DpRuCtNs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=a+IC7dMGoV3T5+yo8Urn4pdz1psq+4B65srNVNBEp78=; t=1720422513;
	x=1720854513; b=DpRuCtNsfCM58o86Jvg8/zTIyGZohSElOSt2sV+BQwpv7/MpUq2cetJVghb3I
	qQoKUlUjl2jS6Bi3pFwD5WnPujCX6CjT11reEFAHF2X94jkHM9QK54HbURnpHl/hC1Z8nIWLe+3oB
	Y1AmlcIBwB5rocQNJK9wCxuo6EvqMO7z+YK2L5S4itgDmaNVMjmkECYwh5LOlP1/jPjQ4HXK6Cg2B
	JVfFLsO4qbiQDD3Ju3zRHYn4ABBa3s0R670nwc+7AWoOZSWNYBf3hXuc9Z9l3FzCyyBg2/VQHUFJa
	8jRRtTDfH9d6G4oLAjJrDUEEg43stKMkrxXaOO9wvqJUq8ZnYw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sQiU5-0001FK-5J; Mon, 08 Jul 2024 09:08:25 +0200
Message-ID: <26f1b4f8-c78b-4aff-b748-58abaa01671f@leemhuis.info>
Date: Mon, 8 Jul 2024 09:08:24 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: dm-crypt performance regression due to workqueue changes (was: Re:
 Thread for updating minor properties of tracked regressions [consider
 ignoring it!])
To: Christian Heusel <christian@heusel.eu>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
 <d3b6a145-ed72-4da4-ace5-b6d99d3e4ff7@heusel.eu>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <d3b6a145-ed72-4da4-ace5-b6d99d3e4ff7@heusel.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1720422513;68d73706;
X-HE-SMSGID: 1sQiU5-0001FK-5J

On 08.07.24 00:54, Christian Heusel wrote:
> On 24/03/09 11:18AM, Thorsten Leemhuis wrote:
>> Hi! This is the start of a thread I'll use for updating minor properties
>> of regressions tracked by regzbot. Consider telling your mailer to
>> ignore this thread, the replies are unlikely to be of relevance for you,
>> but done here to ensure a public paper trail.
> 
> #regzbot report: https://lore.kernel.org/linux-kernel/32fd8274-d5f-3eca-f5d2-1a9117fd8edb@redhat.com/
> #regzbot introduced: 63c5484e74952f60f5810256bd69814d167b8d22
> #regzbot summary: workqueue: dm-crypt performance regression

Christian, thx for adding this, but please allow me to ask: what's your
intention here?

Is this something like "I have seen a regression report and all
regressions must be fixed" or "I or someone else I know is affected by
this and we think this should be fixed".

Because the thing is: the former might not be enough to convince
developers to fix this, as that thread are mainly developers debating
the change and the culprit is in the tree for a while already; but the
latter case mentioned above might be. At least that's how I would assume
Linus stance would be in this case -- but I might be wrong there, hard
to say.

Ciao, Thorsten
