Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631E22459D7
	for <regressions@lists.linux.dev>; Tue, 16 Dec 2025 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765883866; cv=none; b=dix7qO5712PVtfiek1nxS/0DDHqNQhVsvsH60cx1T80+S07+MGP/Ehb894fHk2T6ebItB/sjNiguT+izQCPHrETUkWixD78rDWXeHCBe+JfSwlViA39HUQszKxdsn3ViJImPMP/m5KzZLheFv4kvUxzstmZgxN2O+LgJT88G7Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765883866; c=relaxed/simple;
	bh=1BmFLS8eJsd32YMosDAovlIqS1/5vuUQOYwR6VzG6+Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=or6/03wZLl1BPGBQe05Yz1K9GQnCt2je4HYpGTumVJA6HO+/22sGx+RK7OO7LF9jKiIwwjktlhIrQnCH/rcqdhYpignEy68LtkLoeXHRVxQsXDBugAZoQKaNE6XeIGxjU7X0MyKuftxo1na4OU8bd1B07VmY+r23hEQ32VoMUEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=XFuBTwGw; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="XFuBTwGw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=1BmFLS8eJsd32YMosDAovlIqS1/5vuUQOYwR6VzG6+Q=; t=1765883864;
	x=1766315864; b=XFuBTwGwmZ7qRbinz/SN6EaVcqOzWvBa97gMGJLSpBUCsvMFRha5eo9htNCdv
	gMAaNZMRweOTQhYgyjwZYPFrVKoTu9cLKRgPSlLuQYR55wTJ6sImiJJGA/AXkaOlV1UyjCL/pr8RI
	idnY19foqmsoO3j4FfTUs57oVzGVfNpflosYTUzDKoUVgMDU04vp4gtHX6IYmHCmwrGGeu/XdbF9U
	Ciwglkc90JMUofaUnQlBplHJmvsAKObvy1N9VVFN33CZL5IYbhzSQY4PcC+4uc7ycMtpA6z07HRjn
	IvNP5T7ZtD7OmpBxXmxJSWTMjOgo/nKZ2Uvi4BbQmrULkIQWog==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vVT3m-00C6gm-1P;
	Tue, 16 Dec 2025 12:17:42 +0100
Message-ID: <d9aad68a-0d9b-481d-9842-087f1ab39cd5@leemhuis.info>
Date: Tue, 16 Dec 2025 12:17:42 +0100
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1765883864;71daf072;
X-HE-SMSGID: 1vVT3m-00C6gm-1P



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/krmiwpwogrvpehlqdrugb5glcmsu54qpw3mteonqeqymrvzz37@dzt7mes7qgxt/
#regzbot fix: rtc: interface: Alarm race handling should not discard
preceding error
#regzbot monitor:
https://lore.kernel.org/all/BN0PR08MB6951415A751F236375A2945683D1A@BN0PR08MB6951.namprd08.prod.outlook.com/

#regzbot report:
https://lore.kernel.org/linux-fsdevel/aR4zisdeorFTTwOv@debian.local/
#regzbot resolved: very likely a false-positive warning

#regzbot report:
https://lore.kernel.org/all/a939e5fc-c5ea-4a9e-8566-54dfa54bb0da@gmail.com/
#regzbot inconclusive: very likely a userspace bug

#regzbot report:
https://lore.kernel.org/all/9444c2d3-2aaf-4982-9f75-23dc814c3885@student.kit.edu/
#regzbot fix: Revert "drm/amd/display: Fix pbn to kbps Conversion"


