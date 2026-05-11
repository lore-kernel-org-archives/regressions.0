Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD43F30BBBF
	for <regressions@lists.linux.dev>; Mon, 11 May 2026 07:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778484242; cv=none; b=ejAb8djYaHdDWbkLUtji+IZuWkZ+r+HzDqovhM1NMQMo4ZPnmjkHM/yMKIaZYoGbMU2f0WCDLuhv7iaqL9A1dE+q8Ev3eOIivxEdXz4zvYtJwGqZW6jioNtsMpwKydABD0o7m1AeWWkUHZxlrFbK3sFypc23HN/AWDYmGR8wfaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778484242; c=relaxed/simple;
	bh=inblUtGfoEbc7w++VauNchFtVaKEBv/n5/UhmGnVkx8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=A3APIbvFuhQ7YRZ2QY/+WBTB+a1J5jP1Aym8Gs87P678kHTVo4eW93BBGwXMccqA7HQiFQdJnvuB7AO8jLakh5/jZ75vi4WcuTb6PDDtY2fVLhPxQrscektxpb0b6/vX3sWW8PRt7aVQNxjg/dpm24znJcjCnlSbU9d2XgfKKOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ODGJIpJP; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ODGJIpJP"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gDWRn21Hsz644m
	for <regressions@lists.linux.dev>; Mon, 11 May 2026 09:23:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1778484229;
	bh=inblUtGfoEbc7w++VauNchFtVaKEBv/n5/UhmGnVkx8=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=ODGJIpJP4P91cPYcZw1+R76G8zzNl4Y6IEb9QoHJthDe4JJnVYe4mB1q4za2+rwzg
	 mD9EnuEug6UPQ8BZFNA7T89Q0vKEjwszSFklVBjrne3YCaByjt/LpbGDIdE7rK1798
	 sXlxMFYMOeusil5UvBV1GXBtexBgWfLSa1LZ+bQkjrlL5SSAcAiBVldcAHim0AYOQy
	 w5lCV0NueoNB8HdRataRR28shUvXU3m/ExPlfAXuretmQRbyKxAjzVSUPPoSs3jpW7
	 mlOKhxoHL82yl0T6S1DNuiVTIHPIHX5ooG9fC4aHCVQvnMclayIHboGfPDJtri/xhZ
	 BEksIitcSwVsA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gDWRn1JQlz4whn
	for <regressions@lists.linux.dev>; Mon, 11 May 2026 09:23:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gDWRm1gPcz8tf9
	for <regressions@lists.linux.dev>; Mon, 11 May 2026 09:23:48 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id B7BFE6183D
	for <regressions@lists.linux.dev>; Mon, 11 May 2026 09:23:47 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <8a17737e-ba9b-4842-a429-c4eab3abcdec@leemhuis.info>
Date: Mon, 11 May 2026 09:23:47 +0200
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
X-PPP-Message-ID: <177848422793.3701446.4440570973643970713@mxe9fb.netcup.net>
X-NC-CID: Wcss7tldRYN9hEDhEXkI22k3j8KjmivX4vrcdUgdtMWaHVm887w=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/CADo9pHjr-zZ9C3%2B026y5%2BXOGPSeRzSJMCHof27TVPtAUNgTc8A@mail.gmail.com/
#regzbot dup:
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16015

#regzbot report:
https://lore.kernel.org/all/8d8b2244-2bf0-48cf-8fb8-9e47e197a62d@nvidia.com/
#regzbot introduced: f3ac2ff14834
#regzbot title: PCI/ASPM: low-power suspend broken on some of Tegra
platforms

#regzbot report:
https://lore.kernel.org/all/CAK8fFZ5gY8_Mw2A=iZVFNVKQNrXQzVsn-HTd+Me9K6ZfmdgA+Q@mail.gmail.com/
#regzbot resolve: configuration change avoids the problem and reporter
is fine with that

#regzbot report:
https://lore.kernel.org/all/770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi/
#regzbot introduced: 634a4408c0615c523cf7531790f4f14a422b9206
#regzbot title: Bluetooth: btmtk: initialization fails on MediaTek MT7922
#regzbot dup:
https://lore.kernel.org/all/20260508173121.27526-1-mikhail.v.gavrilov@gmail.com/
#regzbot dup:
https://lore.kernel.org/all/f652d5d9841a9b7c100dd19ee97c86099f580724.camel@gmail.com/

#regzbot report:
https://lore.kernel.org/linux-ide/ce09cc21-a8e9-4845-b205-35411e22fba9@tkel.ly/
#regzbot introduced: 0ea84089dbf6
#regzbot fix: ata: libata-scsi: do not use the deferred QC feature on
PMPs with CBS
#regzbot monitor:
https://lore.kernel.org/all/20260508195051.188207-4-cassel@kernel.org/
