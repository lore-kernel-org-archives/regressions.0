Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEA9337BB5
	for <regressions@lists.linux.dev>; Wed, 11 Mar 2026 16:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246342; cv=none; b=kJp/uX+nuEg4Z325Z+Feliokb/aLVUt84WmkQMMRTyCj734bwi7HoYR08uDv+ZM7wAZWV8OSlpzTUlXUbVdmkcO9RVNhzqORD8C/E7l2BsT15jXhCU4JcNvAEc6z3GzvyfzYLdf0Jo5rv9yQCiy0B+EV8XV7etef+MRsM6Sj160=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246342; c=relaxed/simple;
	bh=puePsqTtvfWhebJ59yb4oFN4QHSDlGgJ+BECm15GfGI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Dp2N4PdpUVkWZHV7xCCAgl2kwiiCSzAuI0CJT5W3MScaQpVKSG1N2LuMt1CXgHHy7tVri67Q5X8Mx9V1cq+LKcB8r5avt8Gv7sGpUAEW/hoMkLaNY5nmy99h9ELNKE3NcNfFKgLqdL0Xn0PtLTqlhsj5jz3gWXKgXkqhgQmDWYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=IvWfxvrO; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="IvWfxvrO"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4fWGLy1JsTz8Ck5
	for <regressions@lists.linux.dev>; Wed, 11 Mar 2026 17:25:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1773246330;
	bh=puePsqTtvfWhebJ59yb4oFN4QHSDlGgJ+BECm15GfGI=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=IvWfxvrOjzB29rqaBP/C/H1axG5K3ar+EEHHhP1EcSmmTrB9tf5uObjJlVaDMz7Ou
	 AXUwxsaH/2guI0tjo+tt4uByqoSxsPk7OElJIU17KaT/U2ALvrojz/q19ozfx9VdlU
	 Z5zO/hfkNCHwm1Bn8iKy8eKAmSoezCfAfjdd6Ep2Ssh+O5xXDdwskWBueEaVXfMmQF
	 H5JCWQKCmpNrwM7eTCLsyYtdFjfYD2KGWRH4hmc/9p3bX0Svwup9BIt71W1PJ6M5Xb
	 z5kkeqmcMvQcM0bWz4+BZlP7+L2d92vLOAZDsEohc9aa5b4B+jnh360tLCld8wU9BN
	 wm4QH3mq+baqQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4fWGLy0dCwz8CkC
	for <regressions@lists.linux.dev>; Wed, 11 Mar 2026 17:25:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fWGLx20JBz8t3x
	for <regressions@lists.linux.dev>; Wed, 11 Mar 2026 17:25:29 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 4959463505
	for <regressions@lists.linux.dev>; Wed, 11 Mar 2026 17:25:28 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <4c8cca3f-e34d-440f-9f22-3fb41048eb50@leemhuis.info>
Date: Wed, 11 Mar 2026 17:25:27 +0100
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
X-PPP-Message-ID: <177324632845.927648.15261292443320847259@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 4959463505
X-NC-CID: Xc++A+Hi/ebvEY30aURYBzHiJOlFOl9oyRiDiQYwK+dvXfV52TY=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5021
#regzbot introduced: 02c057ddefef
#regzbot title: drm/amdgpu: opps when ISP4 camera is enabled
#regzbot fix: drm/amdgpu: Fix ISP regression issue in kernel v7.0
#regzbot monitor:
https://lore.kernel.org/all/20260309215052.1417114-1-pratap.nirujogi@amd.com/

#regzbot report:
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15771
#regzbot introduced: 2bc98c6f97afaa
#regzbot title: drm/i915: screen corruption and stuttering on after
upgrading to Kernel 6.19

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221205
#regzbot introduced: 3958bf16e2fe
#regzbot title: pci: pci=realloc fails on 6.18.16 and 6.19.6
#regzbot monitor:
https://lore.kernel.org/all/CABhMZUWESYKvKxeRvXhF2gkXxAakV0zWR4hjE%3D50-teHRLLgug@mail.gmail.com/
