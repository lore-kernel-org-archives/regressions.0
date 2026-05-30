Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253323C1F
	for <regressions@lists.linux.dev>; Sat, 30 May 2026 10:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780136576; cv=none; b=aopNKymcEzjQUW10WyCtcSHoAVxM8x2YWwLnftEFoi3RYUv4IWmrV5bq+FcY9gNHtLO/18fLKsoVRlcJuKWYpx8NNcnAJgU1IUZtNgvc456qvmv4cidVahihozebgWj7Q786qMyhBegmi7nPM3gTnKxHw0B1oyi92P+gA421GTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780136576; c=relaxed/simple;
	bh=Carymhsl1UVSHQC1mRGCwn2nmWduFk0/mI5baRyIaZs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=UXXqRdUDDEyTPLpt9tPh62G1lK7kbBLq4I3+Ycn7fBjAOzOSCx6RQER4mVcTiaOxOye+ssPVC6cn/AOW7f/ES2YGNDIwKZ9G8Jg76amruFYh7Mrgf0U0hPpscBjIevXLfY4UO9vuevrXlh1P2CJJMNAFPhngocTsEWtljMaknG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=fpNWM3y9; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="fpNWM3y9"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4gSGW36PYnz8Bsg
	for <regressions@lists.linux.dev>; Sat, 30 May 2026 12:22:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1780136543;
	bh=Carymhsl1UVSHQC1mRGCwn2nmWduFk0/mI5baRyIaZs=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=fpNWM3y9W1w6mqTwZE1tWzcmoYIEGYYSHYAEDF8cBq5IwT9Lwei1ncfg3nAowgFr9
	 saReNXW3A3tl4pmiK9DY0LvvLpW60sr862erhz+JjjIDXQODiHRbmmoh33I15HnLub
	 tP+flSETHxFdUS+rDnK9ZPMY1QhBRJkJecXfhoLMb23PmKTJ3OqFO3GzTPBx8Fdn8P
	 9ayx33AR24kN5TcV3k75AGO7hSxnMCJmXRK7joFHG20BXqSV2dtNLvGi1OifGk8qwX
	 H9U1CtGICXzh7Y+PxdSA1VZSWeCA61SUnrDBjbU0t5lM+qNb7w8PWYNT2TYrjDYBUj
	 cDV7x75vBn+wA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4gSGW35hD9z4xDR
	for <regressions@lists.linux.dev>; Sat, 30 May 2026 12:22:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gSGW32kV9z8tYj
	for <regressions@lists.linux.dev>; Sat, 30 May 2026 12:22:23 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 8D0A260385
	for <regressions@lists.linux.dev>; Sat, 30 May 2026 12:22:22 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <8f8bc921-37b6-4ba2-873d-4261c65682f4@leemhuis.info>
Date: Sat, 30 May 2026 12:22:21 +0200
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
X-PPP-Message-ID: <178013654274.2024454.9156021680351382904@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 8D0A260385
X-NC-CID: qJfV1pqPHrP36MrpVKPRk4+M00i4V7t1SpDCpsBMRKsWVShKdNc=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221505
#regzbot title: cpufreq/amd-pstate: switching to performance profile
impossible

#regzbot report:
https://lore.kernel.org/all/CAHLWS5FJCx66GQ-O10pu+nEudEo_QgQAM9vt76T7vT0zGPPC1g@mail.gmail.com/
#regzbot introduced: 86aa1ea1f15ce6b5
#regzbot title: ALSA: usb-audio: low volume on Edifier MF200

#regzbot report:
https://lore.kernel.org/all/03e5151a-f420-46f9-ad5e-109420132021@linux.ibm.com/
#regzbot introduced: 54067bacb49cae
#regzbot title: selinux: Random memory corruption causing kernel oops on
Power11
#regzbot fix: selinux: revert use of __getname() in selinux_genfs_get_sid()
#regzbot monitor:
https://lore.kernel.org/selinux/20260529153608.30853-2-paul@paul-moore.com/
