Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1649F33A9FC
	for <regressions@lists.linux.dev>; Fri,  8 May 2026 10:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778235708; cv=none; b=Q1YePEv6PH9IytbqSuT/TjhfmZzTClYtt3NxJL+RbaBk/bwbzK0QgIfJTcF1NkFpyswosc9g7Y2mUdUzSKNtWohls9trffF6mIOz5vT42owrPNSqFl8HdNtA7wyHB2YIV35tygHVfhuT+UDEClUfz8m5U7p6/nF0ZOO7CxZqxPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778235708; c=relaxed/simple;
	bh=ivFM7yWFDfjl8slXaCc1Co683+MSWjop7ZS1dRkMTG8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=QGIP/En87d96jWDIIyZfU63PYUM4/1bVd1cQ7qFgtxQwIbh4IANVpSmPdsgZAmZte5/iu81GxhiFv9v2mGUrjYwKXX28eOkpGYcpbdGW8YH3//GmD6qrKinXJFsecGYmjeoecJd0Ls6B1pRIV0oJENdXZl3To38WzBGNCk1sBkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=THlp0CSn; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="THlp0CSn"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gBlXT2MJhz930g
	for <regressions@lists.linux.dev>; Fri,  8 May 2026 12:21:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1778235705;
	bh=ivFM7yWFDfjl8slXaCc1Co683+MSWjop7ZS1dRkMTG8=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=THlp0CSnJZjTPY85eeoNl0IYIPyvxdCj59cYNKIDLRoNPh6+2Xt2f7ltztAbnwMbV
	 XDi8wxdpt+K+ox5A2AJZ0hsaunIM9ABrwNKEWx9Cw0SR5dr7J5SCMDsExPl+6OS/IO
	 QYeK5qzJx/mCPQddHSvKnzrpS+RSSXXCGhWp81Z9y1t7I9OUjLcPUDEN73hE4zw/ss
	 /z0K+wgrE/GDRzroaKiWKvHsVL9VI40iZmo3LjyOkMRuN/HcaC8rJZvoBdHBccXLA/
	 FUGqDzRgiBlk4AbDBa+GrONvYiJ6pcAZhxSSWhfCaTgL6moOUjr5Hd0ShTVrK9hfuP
	 m1G0CYHM06KNA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gBlXT1g4Xz7wTx
	for <regressions@lists.linux.dev>; Fri,  8 May 2026 12:21:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gBlXS4XQSz8tcb
	for <regressions@lists.linux.dev>; Fri,  8 May 2026 12:21:44 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0E4AD5FBF7
	for <regressions@lists.linux.dev>; Fri,  8 May 2026 12:21:44 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <419cf258-d3de-423b-a11d-31f1ec8f98ec@leemhuis.info>
Date: Fri, 8 May 2026 12:21:43 +0200
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
X-PPP-Message-ID: 
 <177823570421.2312208.10057786690087643381@mxe9fb.netcup.net>
X-NC-CID: U6egGZbR4Jl77LcIxlWka04GdJ2PP9wK2N9nawsBTHSHOyNEYU0=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221473
#regzbot introduced: e30ca6dd5345c5b8ba05f346a8e81105352fe571
#regzbot title: cpufreq/amd-pstate: cpu stuck at 1.7GHz under full load

#regzbot report:
https://lore.kernel.org/linux-arm-kernel/ab6b9b36-f08d-451a-9c2d-ef27b813d744@armadeus.com/
#regzbot fix: pinctrl: imx1: Allow parsing DT without function nodes
#regzbot monitor:
https://lore.kernel.org/lkml/20260505160902.1425532-1-Frank.Li@nxp.com/


