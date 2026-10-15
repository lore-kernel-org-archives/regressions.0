Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683BE513564
	for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 10:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060897; cv=none; b=GE+zM8VNCeSru5km7zX9Qc1arLuF3iq3PVseM0S03jdWPKTukkQTHVQ9FsHPmi4LdW5qhFHdlevf/Z6nXrGCbqw0Rrr4Fv3RRLi3uAjTAtsFT7ZvCcvi7CCFZgy+czV2ThQAL72Ol6XXsVn/h70cam1SM2rPjaXAvgb6bhYwfb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060897; c=relaxed/simple;
	bh=IdMjNjrHFK9F4a7Gdfg/wLHhsASt848mGGrv0Z/4RtY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=Lx0+NPo4RFKq25xFEGASrmduzH8qR8xEL3cqb37/eWVEJzTElxIrmKkW3uQWLGred1PuKR8HfpzQWE7zHPSzjofX4TZUd2/FESsUJVT5RMHORVdWTiYjw1HIU5EZ45wgpRfS/n1BN4NUx6JD4FLmUF1fEhwoO5kcY920FkRBowg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=OZGCHKeu; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="OZGCHKeu"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4j54Ny5Gxmz48Dc
	for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 12:41:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792060866;
	bh=IdMjNjrHFK9F4a7Gdfg/wLHhsASt848mGGrv0Z/4RtY=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=OZGCHKeuvTWFqZRgHrRUwFIe6r1PqMuPxiLP6vWgIbhvRIuIeDHbVjwkXbbwWxyfT
	 T0IU2vQ2LWW+JcRddyj0177LVdyicJ+sYyCiIIUd/uQPDPyoIKHtVuPZPrQ0o4B4xZ
	 mVnoyq0zJM3t9urhdXfqBrWTFHG0mBwV+cJM+OqAOBlANMztHq5ObZKXOxMia3jU96
	 sI0pLC7+CXqRdydvWtsfYRwHNAAT2XlDPcJFnFu5VRVAlWBhacTmlHOyvitmCKA59z
	 c8EY8UxJ0SrZKUuHZ5UDUjY8hX2At6d42SvHnCEJNTE03yT5Y5fR+YxmVy7vrygcFB
	 bF25ewidJlkFw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4j54Ny4bFDz7xjT
	for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 12:41:06 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4j54Ny34qsz8svT
	for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 12:41:06 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id BAC8C5FA3B
	for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 12:41:01 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <eea5a10e-a225-42f2-9ad9-3ee8ddf238d8@leemhuis.info>
Date: Thu, 15 Oct 2026 12:41:00 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <179206086199.3626381.16900452349232585905@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: BAC8C5FA3B
X-NC-CID: nssGViD9ANZGNhbyyu6mJQGO8g0bWKb4utdQYPK+RHA9sI4z4kU=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5663
#regzbot fix: eaeac1498b289b34244

#regzbot report:
https://lore.kernel.org/lkml/7cc824c4-632d-49df-ae5e-cfcbb5bf76ad@proxmox.com/
#regzbot fix: nfsd: fix all-zero stateid in CB_OFFLOAD for async COPY

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5762
#regzbot introduced: 11c141672045ff
#regzbot title: drm: amdgpu: Black screen after boot with newer kernels
in multi-GPU system
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/work_items/5979

#regzbot report:
https://lore.kernel.org/netdev/4F0FAEB6-A13B-47F3-BFF1-C706686C6F64@gmail.com/
#regzbot introduced: 7f84f07f54fab1

#regzbot report:
https://lore.kernel.org/stable/179173732257.29426.7905170638383807320@pm.me/
#regzbot fix: Revert "i2c: qcom-geni: Fix hardcoded clock index in
SE_GENI_CLK_SEL"
#regzbot title: i2c: qcom-geni: built-in keyboard and touchpad stopped
working

#regzbot report:
https://lore.kernel.org/lkml/20261013-qmp-pcie-skip-reset-revert-v1@michaelburch.net/
#regzbot introduced:
#regzbot title: phy: qcom: qmp-pcie: link then never retrains and the
root port comes up with no endpoint
