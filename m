Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552071DE4DB
	for <regressions@lists.linux.dev>; Tue,  8 Oct 2024 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728392226; cv=none; b=VZFnlpDcnBE8Gk8ZLL54KWr1b6CBIBucszyjH5KdEEg/MtsaQGewA4LgcEILPVJr83Gfzp0IvJHjTlflmRhiAfaNbeSuTRSBsVRQv/clS27W7jqa3MWqECPwDmvC30SwWzDDT3OFrf3Xws9fkqGtX1tJdqyF7toT2kXTURYpVQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728392226; c=relaxed/simple;
	bh=Mpe6AbE0qh1SF0ur1mBMAMz6bAS9+YOHuGkVjXBmayA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Abha5cVXRxdfXg2IWe7PBX6KjOTO7yefV06ZSIaUdIGpmoZoFMt5VtmNh83ESAUP73pv5inj2PmEMx7hAknWKA8kOu7lrgbPSXaKr/rnOGFwh8F1yrw1STd1stKR5zI9YnJhNXUUzwXRybb46V0TRszDy/85jnwo89dT6X6h2CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=kH8zGKbI; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="kH8zGKbI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=r8WidV59tVn4RYuFOjZan97gTywToz7fjhxkHqv3H70=; t=1728392224;
	x=1728824224; b=kH8zGKbILSpMBJExPX+DXuZv2qshgF7VneK6LWokRNTiPM4VRWs7yWTN++mJA
	v7nYyCVFCZmtK3COj0iFdX7JKh8753uxwzPydeaLrR73TMhMp334E0K4+Bic/5BZt+ytL6W6RIav8
	kGkcoi1dHaeTWRo3uVw0D+ZmkIhJCQ7Tl1w228W+6lNr9tu6VWk7Xe1bti4PqahordwLhkd+HGf03
	MiUJ2gSOfcL/HHQRBiuTx4zrzkzr1iwU2JjEt9UMXDeAduTGUcs+JUM2iMxBjo/can2UTPWFJXkcx
	0qAmzfvE1jXjJLll4TfXYMLnLGkpYYHCZpgaoN8wi1CF3VwmRg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sy9lu-0001Ff-Bp; Tue, 08 Oct 2024 14:57:02 +0200
Message-ID: <6cc705c8-2e27-4cdb-b265-b21db79b51a6@leemhuis.info>
Date: Tue, 8 Oct 2024 14:57:02 +0200
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
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1728392224;87263afa;
X-HE-SMSGID: 1sy9lu-0001Ff-Bp



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.
> 
> Interacting with regzbot from arbitrary places is a recently added
> feature of regzbot usable via the new '#regzbot report <url>' command.
> The indented use of this feature is for updating minor aspect of
> regressions already tracked, e.g. "change the title" or "tell regzbot
> about a related discussion". Such things until now had to be done using
> regzbot commands in a direct or indirect reply to report -- but there
> they would mainly be noise for most others and just add to the huge
> amount of mail people already get. It's also takes a more time to send a
> lot of individual mails instead of preparing just one.
> 
> The new command will be documented on
> https://gitlab.com/knurd42/regzbot/ once it got a bit more testing.
> 
> Ciao, Thorsten

#regzbot report:
https://lore.kernel.org/all/e89107da-ac99-4d3a-9527-a4df9986e120@kernel.org/
#regzbot introduced: 47c8846a
#regzbot summary: pci: ACS broken on some platforms
#regzbot link: https://bugzilla.suse.com/show_bug.cgi?id=1229019

#regzbot report:
https://lore.kernel.org/all/20241007204352.GA449721@bhelgaas/
#regzbot dup:
https://lore.kernel.org/all/e89107da-ac99-4d3a-9527-a4df9986e120@kernel.org/
#regzbot summary: pci: ACS broken on some platforms
#regzbot from: Jiri Slaby <jirislaby@kernel.org>

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219349
#regzbot introduced: 2031c469f816
#regzbot dup: https://lore.kernel.org/all/20241007204646.GA450114@bhelgaas/
#regzbot dup: https://lore.kernel.org/all/20241003213932.GA324584@bhelgaas/
#regzbot summary: pci_for_each_dma_alias: NULL pointer dereference

#regzbot report:
https://lore.kernel.org/all/20241007204646.GA450114@bhelgaas/
#regzbot from: "Marcin Mirosław" <marcin@mejor.pl>

#regzbot report:
https://lore.kernel.org/all/20241003213932.GA324584@bhelgaas/
#regzbot from: "Marcin Mirosław" <marcin@mejor.pl>


#regzbot report:
https://lore.kernel.org/all/353e41fe-6bb4-4ee9-9980-2da2a9c1c508@roeck-us.net/
#regzbot introduced: d9335d0232d2da
#regzbot dup:
https://lore.kernel.org/all/3016e3d6-f916-4a6e-82a5-2bfcd1f2dc2d@roeck-us.net/
#regzbot summary: net: fec: lockdep splat and ultimately crashes






