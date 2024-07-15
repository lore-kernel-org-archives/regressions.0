Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCF913B295
	for <regressions@lists.linux.dev>; Mon, 15 Jul 2024 12:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721045750; cv=none; b=F28tFd0SlH9NqvGjE2PzrIc2Jqri/zLoS/ekDOT3Jga6Td6z0hkv68VpVaRTNixOG/sNQCF34Zcxc9bFcl7Lu4fdhQzVrxOLKReyVGgOgAlGzbacFernors06iMZbBZN5WZCMfio3m3udaZWBqeAn8ETe/NGIju51PcpD5PG6es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721045750; c=relaxed/simple;
	bh=C6vQv7U0fY0XVJ1fXJxTW9LVsYrn4ekwpfFAbZ7I/6E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=YCG9i2c83DDwKPN3t55BNuXQpmeHYi+H/s4qrrt2iluCxu0YZMOMota/Y28rLSRZjVC5JSP2NwLnYeyyeikwBapawTwKR+P1JdY+kggpzjatGLB6jp9dRHfwtwZF97kzvgyQspMOhziza8Bs1e7/8N57l+yrnRUQxFBetm3NRWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=SubwfWws; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="SubwfWws"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=C6vQv7U0fY0XVJ1fXJxTW9LVsYrn4ekwpfFAbZ7I/6E=; t=1721045748;
	x=1721477748; b=SubwfWwse/LXSKKf58/Dvo6fW9Y9WNKyzJDXYy3XvDHVUOnWN+w+XT7rExJRU
	llC7khAi0xdPZjXaH162oNWfLR+r5pceh6Df4FyEC+b4cs/y6mjfOkTtAPn1g+aCy0fXRxWzkPA5B
	nRokqF6rU9c7g/NMgJw5lKvjgB2/lG1zyuKpyOjr49BeKZrSAuqlU4j23wHsIAB3P/miIZPBP6dMO
	viD5o8cYuSC7N0Ow6GXTL1uEbtbXmjpXdgepGLMMX2OkHAFKpXE8mcwgBYNTm3/SZEvdLBc4C4Mx4
	N+p0A/jDkCxOUIl0bTcG/lKvEz4+BqkOLAcvmm4O6YBPO1wQXA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sTKcM-0004RA-G7; Mon, 15 Jul 2024 14:15:46 +0200
Message-ID: <496e3762-9497-4f02-97ac-3a7e0b4f6ecd@leemhuis.info>
Date: Mon, 15 Jul 2024 14:15:46 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1721045748;6ae51665;
X-HE-SMSGID: 1sTKcM-0004RA-G7



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219008
#regzbot introduced: 05580bbfc6bc
#regzbot summary: nfsd: NFSv4 server crash during client access,
page_fault_oops at nfsd_file_lease_notifier_call
#regzbot fix: nfsd: nfsd_file_lease_notifier_call gets a file_lease as
an argument
#regzbot relate:
https://lore.kernel.org/linux-nfs/20240712-nfsd-next-v1-1-58c5f2557436@kernel.org/

#regzbot report: https://lore.kernel.org/all/ZpP3RU-MKb4pMmZH@eldamar.lan/
#regzbot introduced: 948554f1bb16e15b90006c109c3a
#regzbot fix: 1f4a10cb826fdec5cd442df010bcb3043bfd6464 (patch)

#regzbot report:
https://lore.kernel.org/linux-bluetooth/CADRbXaDqx6S%2B7tzdDPPEpRu9eDLrHQkqoWTTGfKJSRxY=hT5MQ@mail.gmail.com/
#regzbot resolve: inconclusive: seems nobody cares anymore

#regzbot report:
https://lore.kernel.org/lkml/75e17b57-1178-4288-b792-4ae68b19915e@draconx.ca/
#regzbot fix: a34acf30b19bc4

