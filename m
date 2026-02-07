Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3220E2C859
	for <regressions@lists.linux.dev>; Sat,  7 Feb 2026 11:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770464806; cv=none; b=QDupJ1ROQXePVVWINprjY5SwxMkgKgFsJae6HoQPNELGD/0HR7/9fc6+KFJu+AI73lenC3G4Jd3Gist9U4L+bDtwbMkYgncQb1mG0TOscGW5R2SfbgOzv0BLabZzwjF6zyHofrKLlWl9ubpUNx6y1uBrbhf95WtwDXsX2cDavS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770464806; c=relaxed/simple;
	bh=0E4Y9kW9rQ9MJIHBClU9+2YYNR7BIOY1w2YQspqf84c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=m/1RyykptIIorhuMUyZCIB6wd4QWM/fRdqn7DEApXqRTCob3+3Z5F7yx9P5psRsQ6akEtKybNreaMrEc9w+eZs07/4goqMJOXN72Sd1S6ddjrL/Vu85umHZSoibviZFVgaNLbG/1pw3xA8aM4YMz0Tl+/4k046lY/4yirqZ6iBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=VDvuyBWs; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="VDvuyBWs"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4f7Th2234Xz872Y
	for <regressions@lists.linux.dev>; Sat,  7 Feb 2026 12:46:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1770464802;
	bh=0E4Y9kW9rQ9MJIHBClU9+2YYNR7BIOY1w2YQspqf84c=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=VDvuyBWsIZRsV0zBqA83bgEod2fZuufVzwPDUYxrAR/DGG6QC2PqwxAG740Lxvk0b
	 XAIxQMcCFl7PimbcYW/T6dSmst3NR2qQO1cdgsY5Mxhi6B+FB8nHKf8Y1o5ls+fxhN
	 LlF9rRLaQzh5LBA6YQjl+Wsu/hxGt0RWpUMhVKyUTr9lLtBsBQdgjpJ/uS9Ji1oYbZ
	 WGOBfGGfQa+GUbxg636aoS7xiadBk8XeCBmN1WTBN6dZqdMRUiBHn8wQf2u+4BBfPA
	 pCJyjF4zi2KIUMj28MfAxSyTuzYyMruS4ycn61sCBeqtQuKw3vtWm1nUf+sApZ7ijA
	 BcoH0luGpr4Lw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4f7Th21Mzrz4xWl
	for <regressions@lists.linux.dev>; Sat,  7 Feb 2026 12:46:42 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4f7Th16z6Lz8sWT
	for <regressions@lists.linux.dev>; Sat,  7 Feb 2026 12:46:41 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 76F17671DF
	for <regressions@lists.linux.dev>; Sat,  7 Feb 2026 12:46:41 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <b5ef1dd4-33f9-4897-b87a-9f98bbb0a299@leemhuis.info>
Date: Sat, 7 Feb 2026 12:46:41 +0100
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
 <177046480164.2285977.16074372057493299304@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 76F17671DF
X-NC-CID: 1tWpuD7J8/f7Pp+9bkFArKE0pZDnEcQk87k/c1tTFhss/1z629w=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/bed73c01aba29fe651c9e23a9820a21e88ad13e7.1769048488.git.jpoimboe@kernel.org/
#regzbot fix: 2687c848e57820651b9f69d30c4710f4219f7dbf
