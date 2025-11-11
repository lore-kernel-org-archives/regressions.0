Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CF5313E3B
	for <regressions@lists.linux.dev>; Tue, 11 Nov 2025 15:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762873294; cv=none; b=M4swLk76pn62Ox+9arSFosbIgwENARBcxuPoYtl2ySDU05LpphcVaLbWdiDIzHPE4QzNMkJTHZIbulBJ+u5Plqzs1WwpxY19bBpqrVtY4oInbh0+kftZPxb9nK/AFO4xCp/FW3MnOvMX+FST9MIaycbbCfQzA2COaVNTWH7E7mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762873294; c=relaxed/simple;
	bh=Atma+SuGiIwaloIeDvh2EpI0e1M+lNq+g58nlek+bS0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=tKfqkgTig91V8QZ6x37g0+S9WjHWSCE1q8197VLQJTKE+I+r1aCyMsJUu9ZHMf4UHxzMPLG4G66MtoAb0HMjVflksU1DLHu6dDq1EO+cARoQcb06aYXWgP7ypY/XuKninnUC05oXe31i4E7l9emJ+wxrgAS852p3n3kPCH8ZIOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=w70jRv/p; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="w70jRv/p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Atma+SuGiIwaloIeDvh2EpI0e1M+lNq+g58nlek+bS0=; t=1762873292;
	x=1763305292; b=w70jRv/pRmQMisxB3AQtKs+RFFeDtBFSPR+zyPSkgvjQJBKXccapzNmCMRmbS
	PwmO0ODY8R2ElkcWMhv2OnYKt/DffQGw3xnm0k9ZWbAfLsONaQiBuJ8SliAxPiRQ3f45MLHH48J8u
	Ipn4c8J4D3uAhJRnQ+V/k6zqkGx0apOFJxvAQ/4RzYanthzXGGDI18ZJW6IGJzub/51GEaADR8Hot
	ecQW79cJHBKwIaDe6ZyOgCHnE6Ujl9RbIvHDTwaAbEfwpkRZzRSrA0tSfnoLNO+d74vpkrkm+Tvsh
	ARtpyOOg+965LsU9ZUfS9gUba36xk5cX34GjAIkyV46tWAIF0Q==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vIpsA-004LVr-2j;
	Tue, 11 Nov 2025 16:01:30 +0100
Message-ID: <02a3e68c-743e-4193-b210-b06f1a9b9f3f@leemhuis.info>
Date: Tue, 11 Nov 2025 16:01:30 +0100
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1762873292;c115fbac;
X-HE-SMSGID: 1vIpsA-004LVr-2j



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=220109
#regzbot fix: ALSA: hda/realtek: Audio disappears on HP 15-fc000 after
warm boot again



#regzbot report:
https://lore.kernel.org/lkml/3d7f77d2-b1f8-4d49-b36a-927a943efc2f@heusel.eu/
#regzbot fix: 3471c1400ad1

That is not the real fix, just the last in a series resolving the problem)"

#regzbot report:
https://lore.kernel.org/all/g3scb7mfjbsohdszieqkappslj6m7qu3ou766nckt2remg3ide@izgvehzcdbsu/
#regzbot introduced: 794b679a28bb59
#regzbot summary: MIPS: mm: tlb-r4k: boot hang on Indy R4400SC
#regzbot dup:
https://lore.kernel.org/all/e4ed75c7-b108-437f-b44b-69a9b340c085@app.fastmail.com/

#regzbot report:
https://lore.kernel.org/all/bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42/
#regzbot summary: drm: bridge: ti-sn65dsi83: DSI display stopped working

#regzbot report:
https://lore.kernel.org/lkml/4b392af8847cc19720ffcd53865f60ab3edc56b3.camel@sapience.com/
#regzbot fix: e433110eb5bf

#regzbot report:
https://lore.kernel.org/linux-pci/8d6887a5-60bc-423c-8f7a-87b4ab739f6a@hartkopp.net/
#regzbot fix: e433110eb5bf
