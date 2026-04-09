Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4D22EBB89
	for <regressions@lists.linux.dev>; Thu,  9 Apr 2026 12:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775736673; cv=none; b=lk5vST6042VTgSV5HR8vVMYrhEN9ukNxKIG7uPXD87Y8aB0wn51araKC6rwX6gOQVQ8x1Wb6XQjKQaN7vsW9sQ48fkTEb/fm37MvhtzLnx89XFqTMQczKHNnjMGxwX7nC77ECnhs3R8GUFwULxGKHF5BazYNgGCXGtOuwcFdHgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775736673; c=relaxed/simple;
	bh=WvfNIQj3GVpzac4Uj+i0MbDZd+deaBLJ9q+U7cjfZZ4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=pxSIOhTnnoMr9S+BYAL8ngwyInCpIblo8LvlRb41JNVGWMI6JUSqNsEYBZ27VKb5IDH5iSBVtWTd6hGvvNy9cNV+B5V2RtVCx+hVDAw6RDAeg2WTOi93G8/CF75G8jjqKvDmCSQwB/frjTVgS+G9nh/kQZlemflGRUlYr1E+M6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=bX4O/TBS; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="bX4O/TBS"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4frzKy1TLNz94gL
	for <regressions@lists.linux.dev>; Thu,  9 Apr 2026 14:11:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1775736662;
	bh=WvfNIQj3GVpzac4Uj+i0MbDZd+deaBLJ9q+U7cjfZZ4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=bX4O/TBS0UDgXDYCnuZk9W7eAuV4Q7uW/2tsT6ZMrjmBy6EGOf3HHWToHVzxj5Vcl
	 uhWokYDGWJbFSK44OL3Ju44FA4RLfkT6JkwvEod7uhOCjDZCmrWApxf2kltxqdyZLR
	 k2d+pSJYyShJMWGkNao1CHm51OVkEykpxbItgWZINSS1SUYVCKIc+24HlKPrbnl/No
	 di87FLW+pWwV6ZGJy29p46BRy0Z8O2vGue40YOEp0Kk/Qe5Coo1VqaFPFP1Z3QZWBD
	 8INAWteUKtJFcn/26w97ZhycGYXDv9t452xlTVyiin/3B5OH292xFB1vroVPS/pKWi
	 yJCU6gSSBEWCA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4frzKy0nMTz7xKv
	for <regressions@lists.linux.dev>; Thu,  9 Apr 2026 14:11:02 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4frzKx5vBzz8svH
	for <regressions@lists.linux.dev>; Thu,  9 Apr 2026 14:11:01 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 2C8AB635BD
	for <regressions@lists.linux.dev>; Thu,  9 Apr 2026 14:11:01 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <3d34d961-7a13-4981-b2ab-43731225ea20@leemhuis.info>
Date: Thu, 9 Apr 2026 14:11:00 +0200
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
 <177573666137.3617976.11423459808114709030@mxe9fb.netcup.net>
X-NC-CID: Naw0iC8He1qpjv0rxuSqxyeIFk1EhCEjtQOimv3NREymqVsPBWc=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221322
#regzbot introduced: 56fbbe096a89ff4b5
#regzbot title: ALSA: hda/realtek: front Microphone disappeared
#regzbot dup:
https://lore.kernel.org/CAEfRphPU_ABuVFzaHhspxgp2WAqi7kKNGo4yOOt0zeVFPSj8+Q@mail.gmail.com
#regzbot fix: Revert "ALSA: hda/realtek: Add quirk for Gigabyte
Technology to fix headphone"
#regzbot monitor:
https://lore.kernel.org/all/20260407123333.171130-1-tiwai@suse.de/

#regzbot report:
https://lore.kernel.org/all/20260403191942.21410-1-dipiets@amazon.it/
#regzbot introduced: 7dadeaa6e851
#regzbot title: sched: throughput and latency regression on PostgreSQL

#regzbot report:
https://lore.kernel.org/all/ce09cc21-a8e9-4845-b205-35411e22fba9@tkel.ly/
#regzbot introduced: v6.18..v6.19
#regzbot title: drive access became extremely slow, causing lock fs
timeouts

#regzbot report:
https://lore.kernel.org/lkml/20260221235050.2558321-1-lkml@antheas.dev/
#regzbot fix: 0a4d00e2e99a39
