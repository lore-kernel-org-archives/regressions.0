Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8072610A03
	for <regressions@lists.linux.dev>; Wed, 29 May 2024 13:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716989139; cv=none; b=Mvk4wXbGRG9n+29lFx/nqKuba9PrNdGr9yVRGlPJpSmcFURM7q6apxIxfbBup2FaZAOi0nWUeD06FUWJUhH7QfNzoMuXRLPdOmUdYhPn0bHR5tFIdAOQEW/UkNZyqzvR7++v7L4jjtbeCOqVSc6GD4NDCUftKXHZgdAf0I4GHrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716989139; c=relaxed/simple;
	bh=fA+DsbESFknueERyfGbRq2g2TMIE7UteAWy8sFmzHBs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=RiqpQFNvuofqFc9/y2BXVa5xnSADi/9t6R80KMiNDRmKDAk7xCP34Nz9mQjMIrkSMJIBs50BXwDMfBf/HEzctKgytSJzpVCCgwmQvZ/YctiJK8eKKGQW7GfN+5OolkixPccK9A2f9P724tYr6OI/K9PE/RTMNhKV2u1jHuqgbqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Idmz0yGL; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Idmz0yGL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=fA+DsbESFknueERyfGbRq2g2TMIE7UteAWy8sFmzHBs=; t=1716989137;
	x=1717421137; b=Idmz0yGLt1DJZw2Ef7HJxOpNXuDrV4stmg7cykShygFiWBZK4aJNJZZM1h9yD
	bf6LLnzNDLFq0Xd55BV24OiBWBSHK9jov2JLjGvabRPHPVP3418UlpJuZ9gxqiXjVB4nkSZfPgkOM
	fp5qgR4TDYu74Qt05hyIKOPAKDG+3SFVBk4IsCKJGSqO4QLdHVDFjt04e1t1flqWJaa1usi3HDiCR
	xRsbfqDCl8Q1vmH8clLrVjb8x4dRGo33lYOI1BnWsJTbHEhOrau/92YwnQ6ilS9o+F5AY+KZP3HOW
	kzStxCyVYhQfQDeKuAOxHwNCQy72JsoVa5VPyxlW6Bt1A1JJFQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sCJJ9-0006BR-Pq; Wed, 29 May 2024 15:25:35 +0200
Message-ID: <3f7f2173-2d75-4677-a7b1-1ca5afbae983@leemhuis.info>
Date: Wed, 29 May 2024 15:25:35 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716989137;b6e0f00e;
X-HE-SMSGID: 1sCJJ9-0006BR-Pq



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CAHj4cs9KZJc6Wsp9t0fDc4fDBJB1TmwGT7-8peCGLiqW3J_Fqw@mail.gmail.com/
#regzbot introduced: d74169ceb0d2e32438946a2f1f9fc8c803304bd6
#regzbot summary: iommu/vt-d: blktests block/008 lead kerne panic

#regzbot report:
https://lore.kernel.org/all/CABXGCsOkiGxAfA9tPKjYX7wqjBZQxqK2PzTcW-RgLfgo8G74EQ@mail.gmail.com/
#regzbot introduced: 86167183a17e03ec77198897975e9fdfbd53cb0b
#regzbot summary:

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218895
#regzbot introduced: 0a44dfc07074
#regzbot summary: wifi: mt76: MT7615E doesn't work any more with v6.9
#regzbot relate:
https://lore.kernel.org/all/20240528142308.3f7db1821e68.I531135d7ad76331a50244d6d5288e14aa9668390@changeid/

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218890
#regzbot introduced: 321da3dc1f3c92
#regzbot summary: scsi: sd: usb_storage: uas: device only accessible
after about 1 minute

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218896
#regzbot introduced: b8b8b4e0c052b
#regzbot summary: ata: ahci: SATA devices on Alder-Lake S not recognized
