Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8DE1CFB2
	for <regressions@lists.linux.dev>; Sun, 14 Apr 2024 07:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713078088; cv=none; b=NtLPkSRddCIvQo8WYFf0Q1smL1OSoFcBTIEy3QFBwTvfUesSJ2PVYvZjcYJ942WOzjRuNC/4XriPfx3zoHiC6tSomEr5n9ICSD86Z0YhliPadwf8gunPmJx0dV/F542cVBnvUQJd3v0Uk8myz/mQrDJI1/Qs84wW4Q2c+jIFZoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713078088; c=relaxed/simple;
	bh=7TPbpwPVKtCkuaOVo9Us4jIkqSL8PxmA5PzTiKjRm6w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=A5FVhdzCvKBjMeuWZNF098kHK8gHTqpImVs2MajknvpqlkQ/Tu32K9c4hinDdNisv+HCe2OEGGirluX8VTIyJd6XXiX6i5Bid3jy1pejOid9lNI7c4KDDUV1xBO77XcIEwS+r8Ckzh731I/NgY95wgDjX4Afw8vYr8uVI1H8CMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=zL3zivfv; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="zL3zivfv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=7TPbpwPVKtCkuaOVo9Us4jIkqSL8PxmA5PzTiKjRm6w=; t=1713078086;
	x=1713510086; b=zL3zivfvDRPEcw9t2E/2ttc+Z4XkYGZ2doq8Kn6ZNpG4TMIM3hH2OFUgZhbYh
	dHhQZxDPOLuFmKvmxotHcu1UWh1/qZn6X9wf1Deensw7qw591f2QzsUTk9sUvA+jsiJqMq40WcIqB
	zWhcyrfojLiGPqfbi5Q6r3kVSukpFwpLaU9eb5+icEd3Cjr0LynnJ2XFOniwwiCcyPebKspsloddK
	H0bZ8HdAxLMABfi1bPQUx/DWDtI5dmtrm5Ns8RYfyHTl+kvaEGXE2RQ794uDwnUmTXmf2KNCvN9dF
	m2am8O/8fmh8WfPedprXytjNe4T+7h0ohdW1XgH6CMCjVx2Zng==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rvtrg-0007Ar-Ec; Sun, 14 Apr 2024 09:01:24 +0200
Message-ID: <854a1d63-8e10-4214-92c4-e4dbf9726a92@leemhuis.info>
Date: Sun, 14 Apr 2024 09:01:23 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1713078086;164283e1;
X-HE-SMSGID: 1rvtrg-0007Ar-Ec



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/ZaQS5x-XK08Jre6I@smile.fi.intel.com/
#regzbot introduced: f49449fbc21e7e9550a
#regzbot summary: usb: gadget: u_ether: ether setup broken

#regzbot report: https://lore.kernel.org/all/ZhFl6xueHnuVHKdp@nuc/
#regzbot introduced: d2689b6a86b9
#regzbot summary: ax88179_178a assigns the same MAC address to all USB
network interfaces
#regzbot fix: net: usb: ax88179_178a: avoid writing the mac address
before first reading
#regzbot monitor:
https://lore.kernel.org/all/20240410095603.502566-1-jtornosm@redhat.com/

#regzbot report: https://lore.kernel.org/all/20240413024956.488d474e@yea/
#regzbot introduced: 4461438a8405e800f90e
#regzbot duplicate:
https://lore.kernel.org/all/20240403173059.GJZg2SUwS8MXw7CdwF@fat_crate.local/
#regzbot summary: x86/retpoline: MITIGATION_RETHUNK causes boot problems
on x86-32 machines

#regzbot report:
https://lore.kernel.org/all/878r1ibpdn.fsf@all.your.base.are.belong.to.us/
#regzbot introduced: c604110e662a
#regzbot summary: riscv32 EXT4 splat
