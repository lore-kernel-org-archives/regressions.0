Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75ED3624AD
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770378992; cv=none; b=gppBYHcbYlIp+UozBvkjw5GudzqKxlv2ZPHH9Ds5co7O5ba70CKxyiTOmLTFv5TfWzEqTb1QRZpqTIGenciefLuiQLoNx2P2DKNfwnQMt9pkIJ9S3r8JU9YtbDaUFtiyQYu+flAjt1zL5HNEGGd9OZqeNPD4Qfu78PipruZddEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770378992; c=relaxed/simple;
	bh=IV8LBhzf3brzpYwobfkHoqdOH5h9wPLSwyITG2rd36k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=O+C0NB0+gg4RwLTo9K7hh08RqGYQFIKVFZu2bvARdbJn6XB7wSw5XBadEb1lz+KZDk3R1sc/0J2MVvcwv8zkY+Y7zV8jjkl0fkoGThPQ1rrP44N3InRvWIoADjcajGxHy0pJgPcig8VnSGM4pY2FD0Vv3evpEySSipruNQrU4MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=O3sNJbWP; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="O3sNJbWP"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4f6skh60v6z7yjl
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 12:46:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1770378412;
	bh=IV8LBhzf3brzpYwobfkHoqdOH5h9wPLSwyITG2rd36k=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=O3sNJbWPGE54vqbPmrZoF0K68vB4Q5lE1+JQU60sRrgGi1xv9v3Gzpqgl0R1lvj8+
	 00fk/Aui6Ef8IMwSL/XHJVVfBF3WvOZXh0ZYmrSIKnYevV2o9Sk/UGDE1SYcHaanze
	 4X1UlqmB1qjpZvu05lj/pimIH47G4xVPGD/3AolY3JxV+y2m0k3ZI8HlSvfAq3ZDEJ
	 yxUoFYEgHshPiZ7vVVaqYzjjjSGTGnvoMItY0oTE2DLnCNHwtUtvpnL3RlDlqaJ1XB
	 LNn9AlPxAqaK9tZe2MBAw+RcXRMhTJ/d8PpLIlJzMUYW3jlAwvVlWyKnasyDA1hSce
	 jVpF+pZPFW4Ow==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4f6sk95Yqxz80ZP
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 12:46:25 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4f6sk940JWz8sWT
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 12:46:25 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 955DA6704D
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 12:46:24 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <a4defca7-3b94-4950-8e61-e5ecfcb6d4b7@leemhuis.info>
Date: Fri, 6 Feb 2026 12:46:24 +0100
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
X-PPP-Message-ID: <177037838477.1441926.3942459699206677221@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 955DA6704D
X-NC-CID: 2tHP88QYDSnQab1398ShxMYcw+s3daQHCIE7DcnFKKdLC/E2bmM=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CAA2RiuSnH_2xc+-W6EnFEG00XjS-dszMq61JEvRjcGS31CBw=g@mail.gmail.com/
#regzbot introduced: df5ffde96693
#regzbot title: ip6_tunnel: IPv4 packets can no longer be sent to the
external network via MAP-E or DS-Lite

#regzbot report:
https://lore.kernel.org/all/bed73c01aba29fe651c9e23a9820a21e88ad13e7.1769048488.git.jpoimboe@kernel.org/
#regzbot introduced: aca282ab7e75
#regzbot title: x86: Oops in vmmouse code

#regzbot report:
https://lore.kernel.org/lkml/20251119-revert_sriov_lock-v2-0-ea50eb1e8f96@linux.ibm.com/
#regzbot fix: a5338e365c4559d7b4d

#regzbot report: https://lore.kernel.org/lkml/aUuLHzk5jdyBAxD7@archie.me/
#regzbot inconclusive: likely resolved or never a bug in the first place

#regzbot report:
https://lore.kernel.org/lkml/sT06uA3Gtv1kgeL80ZRMshbw6whJNUom-UxnS06H6eVrB4AqGWuzo0P23AhwOn3WsnAq9QfhFYciSAWK3eBeGaKjNJG1oSQLyclv4d2E0L4=@proton.me/
#regzbot inconclusive: likely a bug in the VirtualBox module

#regzbot report:
https://lore.kernel.org/linux-i2c/51388859-bf5f-484c-9937-8f6883393b4d@app.fastmail.com/
#regzbot inconclusive: seems to be a config/initramfs related problem
where these is not much we can do
