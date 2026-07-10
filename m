Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979A8358389
	for <regressions@lists.linux.dev>; Fri, 10 Jul 2026 08:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673476; cv=none; b=p10t+0y4LPc2Ng++chPVWENYlvWAotgMQ69bWuQWENakMA0wuq+VWJPy+sv7ViViXQlfDb+q58NuMLoCK33EHRePgaS45roDMC9zCXxZZsuLGabCEZqhhL8u2By0X7PZZskXm/CUtn9r6eQmjfMHPI3KolyBLmfaL20JkYJkyuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673476; c=relaxed/simple;
	bh=V5zhTcom5efSQyDbldj1bXsXOMzojvRjADHtHAiml5I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=lcRpRmkB/3kgEkaKIdgD7iBpO2O6pJwh0G+PuB7bT5iBh48gIpO4BeGMDv7/WravhJLY4rsaqFxOQCZonD962HoDkQlwRXf/tmoMdst1CTDjyU96G+DI/gU4dBOq+mqfotcHfbRN3wEoAzPQtt6sD1b1XFNZ4vpZTNpG85d+Pwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=beMM5AVp; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="beMM5AVp"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gxQXn5xPcz66Bj
	for <regressions@lists.linux.dev>; Fri, 10 Jul 2026 10:51:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1783673465;
	bh=V5zhTcom5efSQyDbldj1bXsXOMzojvRjADHtHAiml5I=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=beMM5AVpVS+EkA9dgSROeCo0MqXvUQ6NLLz5euE9G51L7B3cvHxqpIu8yF4ksntKI
	 XWGmaVaJzyYkRMjrsK/rWGzR+fStB+QyvKTKEGsuIwCl+zPoFqGbYIELwUJ/jQfOg/
	 dfjc2tjfzedjo5rs6WzzW2+Bd/T8VPJNgziXDN/JaMBGulvt6sW8Kf0Sx3s4lMRypD
	 No8urKmKOoTC3d2pvmAEdpO7Zc2h/I3h1RQjmiPBDUP1sCUsFMw6967L8MzT6jpTOC
	 9M/0vmYSfuT3i4yCRGfssn3sCWMEb/1oL0ETAQ6rB4thY5uhp2Q3dzH2a5scBqeioB
	 t48+AFzp0ND+Q==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gxQXn5FLmz4xXy
	for <regressions@lists.linux.dev>; Fri, 10 Jul 2026 10:51:05 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gxQXn3PfQz8sWT
	for <regressions@lists.linux.dev>; Fri, 10 Jul 2026 10:51:05 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id E3EF560387
	for <regressions@lists.linux.dev>; Fri, 10 Jul 2026 10:51:04 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <077276a6-e7c7-4e33-a48f-f6232b8c6fc6@leemhuis.info>
Date: Fri, 10 Jul 2026 10:50:28 +0200
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
 <178367346510.1722150.17859428779684472144@mxe9fb.netcup.net>
X-NC-CID: 5gYm4ASONk4Wzf0OoxUX5pJesnrf4KhBOViF0f6wYLcHzni2mnw=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5447
#regzbot introduced: 01bdc7e219c4e10166a2eb4642e9e55af33b8ff5
#regzbot title: drm: amdgpu: BUG_ON in amdgpu_device_mm_access on
re-probe of Navi 48 after VFIO passthrough

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221704
#regzbot resolve: not a regression

#regzbot report:
https://lore.kernel.org/all/20260707073826.919541-1-ericwouds@gmail.com/
#regzbot introduced: 4cb3cd670b2a29e52dd3cfd6463e44121674c9b8
#regzbot title: net: dsa: mt7530: wrong matching

#regzbot report:
https://lore.kernel.org/all/784d45c6-1b96-825e-3686-074dbf8a2d58@gmail.com/
#regzbot introduced: f5cc545f596
#regzbot title: thunderbolt: crash may stop boot


