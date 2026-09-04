Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D3D37F325
	for <regressions@lists.linux.dev>; Fri,  4 Sep 2026 08:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511626; cv=none; b=RxaW7EMFQLYuQm5rj0X5xeSYWx4xrjSYj+vVt1mIIsDPsIFMqHisqHaQMnBiNJp38Cfwnbx5iftTRCvLYs4VQYe/EijcJBkXf4cIzlr4EAz0YFMpibHbEU/KcuT0WYWs8M+uO95irxkhvnbu8Br2Ah0sUNDDPpP8ivBk3oNikio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511626; c=relaxed/simple;
	bh=nuhOMeUmJJ40/zsnTPmKPh3B8kcXMd0V5QoBzVHuhwI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=Kiot4gPevUIY7+wTLPeGAUNUfjyGBUqHp8anWoNOFPyQJDFwn8H5QhxT3tBfT9Def0A5aKlBOGNT6xWdIMufszn8xxxDIrHSBiCDyz5N2RZKeoVsS1H83IVxuxjBRk7yWSKH/2nLgUXV3hisMt6rrjqfmE8POySVsSUQzXrc9w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=SU727cik; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="SU727cik"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4hbqpB60RVz4HGk
	for <regressions@lists.linux.dev>; Fri,  4 Sep 2026 10:46:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1788511618;
	bh=nuhOMeUmJJ40/zsnTPmKPh3B8kcXMd0V5QoBzVHuhwI=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=SU727cikJQkzfVYA0iGiFo6EUmsw3LpJ4tCEanq3f4qQrxrVxMZtdtfUiRrvJEJx6
	 9689H2T14JqOo5euYrgwnj2/yPym4iyqIo0RPnqn8tzTmO3F/wZo28Gwcd8ZzeuYUv
	 wcVJilv5YyFsyfYG59tG51/nA50QEtHw3S32Cy3sud4sxOJ4nP4A2gBIKmgIgLets4
	 9wvPiuI5kBfcDHWZ20PVZkp6M98I9AQYXYz/PNFNyTXG3RbRbcn41vKv3jogDo29Ly
	 1p7YGJ/izr5mTvMC/ipdAX4JmhhOxN+5J4lPDA5jQI31xM37ivcs/r4IGWLsPK41c4
	 tT2eT11aT+tyg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4hbqpB5HFnz4B3x
	for <regressions@lists.linux.dev>; Fri,  4 Sep 2026 10:46:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hbqpB1ypQz8tf7
	for <regressions@lists.linux.dev>; Fri,  4 Sep 2026 10:46:58 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 625855F995
	for <regressions@lists.linux.dev>; Fri,  4 Sep 2026 10:46:49 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <606f934c-db94-4317-a6d7-f895951d4747@leemhuis.info>
Date: Fri, 4 Sep 2026 10:46:48 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <178851160966.2330377.10610420993211254155@mxe9fb.netcup.net>
X-NC-CID: ODuPujDqch89k9E1Soy1hmsCXRTINwTKit/WSN8NuyTEem129DY=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/20260705-pci-rebar-root-bus-v1-1-55df70cbdd88@honeycomb.io/
#regzbot monitor:
https://lore.kernel.org/lkml/20260731-pci-rebar-root-bus-v3-1-6732e233fc99@honeycomb.io/


#regzbot report:
https://lore.kernel.org/lkml/20260820095714.1865096-1-wenst@chromium.org/
#regzbot dup:
https://lore.kernel.org/all/20260902143351.7b6d5e0a@gandalf.local.home/

#regzbot report:
https://lore.kernel.org/linux-iommu/07b2d390-f7a0-47e2-bc2c-eb0853acf52e@juch.cc/
#regzbot introduced: 283d245468a2
#regzbot title: iommu/amd: booting broke
#regzbot fix: iommu/amd: Fix premature break in init_iommu_one() again
#regzbot monitor:
https://lore.kernel.org/all/20260824062907.4926-1-vasant.hegde@amd.com/

#regzbot report:
https://lore.kernel.org/all/018a9738-1d4a-43a0-9352-a56d1e541364@gmail.com/
#regzbot introduced: 108cc873398932
#regzbot title: btrfs: variety of problems due to change in
/proc/self/mountinfo


