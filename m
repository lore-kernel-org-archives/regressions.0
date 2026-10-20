Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.244.194.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499762;
	b=I+fMz+fUgJOuwSqtpzm+8FR8NV/1M34CazFH/lySziuGqfV1tEe63BRSGe9Ba+kTLS4C
	 ycs013KDblVp8kxlMfKkirKKA+11Few3y03z+BLpXhtM/gMUafSmc9ZsHUc7RygfxfC8z
	 Z870FMgmmTLwbMiFQYhCDRslmA/Oy7fsmUS79Fcn4PPLjDasPeh9YnjOFaq3QU5ci3JLG
	 +HFs79OawYpmD9so9tXwPRm3SVOUeDHIJoFv/B58GDYHVmEaLYzz/rDJXgWrnV2TmUbca
	 xu86MIfng/8r9nC/jzxwbSSADJ4coh24URRKk5ghi58Rb/NEdaHg2aIiXCZnIqVKVsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499762;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=IWEMl3dsuO6wVu7TbcIoYGEJOJIYKGL1k0Igv2gre7I=;
	b=uTi1F7a1SI33Ivdcw0uJjYIB0YV4HAlFm813UwAUW7WzxucEJy7/b5ALB+m7qAp+ExWu
	 3yjEzFUt+zasgVlz2GtYiaovmxBDdEKB82BJiiMEr+W8tMccu9Vsx9fSl6AJ0JXi20ruL
	 ZfFBn2RI5FNgoRfsyyGBRDlqLSiZ9uaan4446MCjEZfbjgwfRi/LOlMjCCZ+7kyteAvTk
	 INLhPOxJyqzxGkcj2k8RuJPZVpBQghfc7+nebAB2EI0xWFoF0Pg+gpVEesFcnQtyV/yNB
	 KZWAFwpcRYMU7eIYl+hU3lPFs+YhTQyvpnfJIHOg+dO9Zig5L7E47U4O497IDrPxc0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=MPeJJyTF;
	arc=none smtp.remote-ip=185.244.194.184
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8802E606A319
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 12:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8802E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=MPeJJyTF
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4j8Bgy5Pwpz9BjQ
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 14:34:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792499694;
	bh=IWEMl3dsuO6wVu7TbcIoYGEJOJIYKGL1k0Igv2gre7I=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=MPeJJyTFytiVTCvuitW2eMjB/2AJxh9LGdgIbxR7wdJgl0Z5aV2oYaIICGLdn9Xs8
	 f4ic2jmsBpCJVxf5gCBY+3OfVYkc6j+cCJHRbM44Sbvngn7wC5DSDOLxGDZyACyda3
	 imgkHTcLjXMpcX1QmLnkRcew/O8RgUE4w9tRHLageHBS+U72kkPmcaITCrGJ1O5p/t
	 Dbq3FcYxNHqI1v+S0YlVPreYaensdWdjBRjnO7DVl595ObV/+1NUUCehHQoYSIl8qu
	 Vluha4flrMo4rIXMj5bSdWdrw2AVvgpK8GrDjhe9Whr9WSBpXr27HBeJErWLgY9UxG
	 nCNlMS1M1g6fA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4j8Bgy4lHmz7wvJ
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 14:34:54 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4j8Bgy3FzZz8svH
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 14:34:54 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 16CBF5FB3F
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 14:34:38 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <bd2727b1-4abb-4c28-8eeb-5a2bf6c34367@leemhuis.info>
Date: Tue, 20 Oct 2026 14:34:37 +0200
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
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
X-PPP-Message-ID: <179249967833.69831.11641325466958598534@mxe9fb.netcup.net>
X-NC-CID: v6q40iS1qISYFWatqgnUEsAqDYYU5g50SVEFRNDZiWhb+ds4A0k=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/6004
#regzbot introduced: c87e6635d2db
#regzbot title: drm: amdgpu: gfx1201: brief white-noise strips on all
displays in mixed-refresh multi-monitor setup

#regzbot report:
https://lore.kernel.org/stable/45162613-2802-401c-84c9-742f9c8c68e6@app.fastmail.com/
#regzbot fix: ALSA: usb-audio: Avoid applying boot quirk for Behringer
UMC204HD

#regzbot report:
https://lore.kernel.org/all/29f6c901-5209-4681-81cc-ff768cd405f4@maich.gr/
#regzbot title: scsi: lpfc: Fix use-after-free of mboxq in
lpfc_sli4_driver_resource_setup()
