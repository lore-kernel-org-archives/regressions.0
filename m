Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9515A4A8A35
	for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 12:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475289; cv=none; b=AfLavpB9iUzz/nXsXEgF8oksEL4i3klfL933KKp32PXJ7x+NgtobEJ0vJUIl/JXcSSWYtA5OAP2y57+v0uEWi7HnBgtsx3yqCkcP8FWgYZoBTUwXyyyrbk7MwjNwQksA8vg4UC+EWnr5UNRP9qJiqmyaqIdTIn1Dq/Wppo4B0GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475289; c=relaxed/simple;
	bh=K+zRp5MEpzRwAl0LSpFk1cAMMJoTi5Xlaz0Y+xDYkTA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=H+OVgsj/bzALYmp30HSbi7lH//deBAgcgdVUzeXfqhFEuKEllNqonDN48KOKkp8SKwj46eIki1ChCm1wsn+ps/T9RbJbcMRSjpQfandDdj4/seMfdX2D3muVszY793EiOBVJkeFnsWndRuStu+1BCKax9V4HtjFoyicxo0xRQ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=C7lyc/3i; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="C7lyc/3i"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hkhBD3PNSz4B9g
	for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 14:28:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789475284;
	bh=K+zRp5MEpzRwAl0LSpFk1cAMMJoTi5Xlaz0Y+xDYkTA=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=C7lyc/3ivGaCXiFTbv0Ok6OeTzTo0n/AEHJAVT2/j6N99xGyrS5P2dzcBRR4hZHIV
	 SQRxn2zXJ5oX+5zSDDm124grp/InTV888L8TpBefTIHSsRHcqnJ74GbvS1x13EUQ7z
	 PrUUcFKLC3MmC7/P3IgGBgqPYl0K8AmPU0EbCXFReSYfXinNJ97TvDlND0uR8aZNJK
	 DEBkcSRvcZtOcPUPuiI/rUqsyR/QJMgP5fY1KAKz6055tkVKJpP23EFHi133GQL7Rd
	 fXkEJ8wdeoMz4EUU+Ts6OwootXdOTVxw6CJDOdFdQbkvVYPvlHV0ZLZL8wDl2W9bOq
	 JXAmFNdnuhAsg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hkhBD2jsgz7xLy
	for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 14:28:04 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hkhBD16dnz8tJW
	for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 14:28:04 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 92C225F9C8
	for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 14:27:59 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <d7c8af92-c73f-43c8-b01a-431fde37667f@leemhuis.info>
Date: Tue, 15 Sep 2026 14:27:59 +0200
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
X-PPP-Message-ID: <178947527977.1805206.8484119801354397855@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 92C225F9C8
X-NC-CID: +IA5stAmtHjLeAtBgSi+xBrFTyauhz854ghrVgvPSSlY7tMLpvk=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/linux-btrfs/c97652a5-ac6b-4de6-aa23-3cdebc01d00b@gmail.com/
#regzbot introduced: 3eaf5f082c4c
#regzbot title: btrfs: Inline data is compressed unconditinally
#regzbot monitor:
https://lore.kernel.org/all/721d8fd2c73095d06cbdbfa714a6dfac9c488953.1789407346.git.fdmanana@suse.com/

#regzbot report:
https://lore.kernel.org/lkml/20260731122233.18345-1-info@humanlearning.ch/
#regzbot resolve: inconclusive: reporter MIA, I thus assume this was
resolved

#regzbot report:
https://lore.kernel.org/stable/9ac1c05b-e9f2-49e9-af63-9cd0e42115fc@gmail.com/
#regzbot fix: Bluetooth: btrtl: Add the support for RTL8761CUV

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5735
#regzbot fix: x86/mm: Don't force unencrypted DMA for IOMMU-backed devices
