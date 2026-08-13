Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5411243F8C9
	for <regressions@lists.linux.dev>; Thu, 13 Aug 2026 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786614567; cv=none; b=ke+cmXTULvrZwiGUG9F/EMfk+qQeB4Ow0Jnpb09xGmQs/qAOGfwCl6bxW5OY86NvWwb9i/By89Brn/76HHNee9yDX6E/HocbGuoJHGWf9ptlTeCsOPO/I/rn9MBjMnwwqT3rOHIij8Fwl0YGKGwsmkDnfdGSVb+ZtPdU9YQzTdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786614567; c=relaxed/simple;
	bh=RXveWGO+YNCYOZNqO3u4xIrt1ua1HulC2uMMGgNwz4A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=hB2cRs02vTL4C7uXbYJ+3X8u7DKObdMKLYzMlnEvtnX2ov86hR/26ABPbIRCENmVOmvw5zbjUhBkJ+8i6AkfTThrkjycj7OQHmw9P4qv0Y/B1qVUYZugcjSNIOwMq7Bz8pSBBuvI+pin3Mh0NKZ96LPpXon+FigQ1+HTQ3HuJ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=G0UkKS+u; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="G0UkKS+u"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4hLLDC3B6Tz8Fpj
	for <regressions@lists.linux.dev>; Thu, 13 Aug 2026 11:49:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1786614555;
	bh=RXveWGO+YNCYOZNqO3u4xIrt1ua1HulC2uMMGgNwz4A=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=G0UkKS+uC9TS95uJ9ZjOZObt2ceFowJnaPr717dfmtJQQOVzLXbon7mWxdCeFvTKq
	 aNiSpQ4qBNsIM6U/pCtnXZe6o4OXTffR2WO0WvtN3C2/L5H8T/D+Yd1XsBbq9Owlz8
	 pNlNxh2hNLGEExV5/odjZpX8M97taBFVL/py2r7Lw/z6BSiGuGGpcSDGZdjciBTkZB
	 O8CTGAgRVIWBLtwkVYS6DfouwMq14ATWOz77DjFFD748HqJu8MnnR0hSrSOsb1evE0
	 XvUvS56QTPw3j2eUDflWk7bhzCDBfpUZKD+yuE4dhosPnFuE6QLO9YhqHtnnFkvQzG
	 OwjrzEqNjpARA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4hLLDC2Tvgz4yWQ
	for <regressions@lists.linux.dev>; Thu, 13 Aug 2026 11:49:15 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hLLDC0ygTz8sb0
	for <regressions@lists.linux.dev>; Thu, 13 Aug 2026 11:49:14 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 6C1AB5F933
	for <regressions@lists.linux.dev>; Thu, 13 Aug 2026 11:49:14 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <20487014-4201-4613-8057-5caa7c098edf@leemhuis.info>
Date: Thu, 13 Aug 2026 11:49:08 +0200
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
X-PPP-Message-ID: <178661455462.859879.11613911186914176937@mxe9fb.netcup.net>
X-NC-CID: bFgbZDm/NjyuWxE/XVGv0pW+DH44C4uV9oLKLsO0WN4KVR2ijTo=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: gitlab.freedesktop.org/drm/amd/-/work_items/5595
#regzbot introduced: 83a8dee2bdfb
#regzbot title: drm: amdgpu: H.264 encoding regression causes ring vce0
timeout on Polaris (vce_v3_0)
#regzbot fix: drm/amdgpu: Implement insert_end for VCE 3

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5570
#regzbot fix: be5c6ca1924acd

#regzbot report:
https://lore.kernel.org/lkml/20260629-btmtk-ryzen-remote-wakeup-v1-1-1d2f1cee6d22@rong.moe/
#regzbot resolve: inconclusive: not totally sure, but I believe this is
either fixed or is the general mediatek firmware problem

#regzbot report:
https://lore.kernel.org/all/CAF38RzLOUW1ZB1f%2BQ2f9mhnYs%2Bt4R2%2BUQA1PCihz_FKEu-nSew@mail.gmail.com/
#regzbot dup:
https://lore.kernel.org/all/CAF38RzLJihCvga6UgkPPR+A1jY33bf1T083CfDy+pfBuzYcdjg@mail.gmail.com/

#regzbot report:
https://lore.kernel.org/all/CAF38RzLOUW1ZB1f%2BQ2f9mhnYs%2Bt4R2%2BUQA1PCihz_FKEu-nSew@mail.gmail.com/
#regzbot dup: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8901



