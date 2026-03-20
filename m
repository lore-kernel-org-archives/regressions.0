Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEA238D6A8
	for <regressions@lists.linux.dev>; Fri, 20 Mar 2026 13:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013019; cv=none; b=mJHGr+buFjaVIWH4ej1B78mvxjmIH1e/U+1Mphjan4vy2pxM6BQHh9k8SvJKvvRlXvX9CYmlfiXt8eu9K1x6Zl9dfrejWrYyPDTsFOoaSAhiXCA5tJB9L8nE89rZ/2OrAA0AIr7w9A95jBCQ/TMM5ZpWpIu5olFDJQblUn/5uk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013019; c=relaxed/simple;
	bh=FKRdYxxhm3uUoq5zyPUBTETsZZdWu8DAbg3LzztKAWo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=PODIfaD5FSTtr/y5ql/GiLBG72thTSlTFSXBqVwbJkg1VVSufxpnO12y/uOa2KkkMxaPKIMLzfZdDhNd5NViGreY0Wy47QBsLIkx3jI/8b3JK4Ob+UnOF6eRlyO3obHh5LQ20GNxHTDFNTLmK8vKcvbkHU/ZLXG+pGKSyRLtUBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=AHB3Ww0o; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="AHB3Ww0o"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4fcjth1cTZz67qg
	for <regressions@lists.linux.dev>; Fri, 20 Mar 2026 14:23:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1774013004;
	bh=FKRdYxxhm3uUoq5zyPUBTETsZZdWu8DAbg3LzztKAWo=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=AHB3Ww0oWyQY7UenJo2PYf+n7lR+X1lIxxCO7+qUMYRgZXU73BV6q2UcLu3pXXclx
	 eBZeYlOuiEieboQzEJfjJh0GXDcX2r+2pLeIl46fDH0ZhubbmI8RbSkq973/KfeEPY
	 ck2o6VJyodubdJ4qcUVWuGPDRu9ga0exgof88O33zk1gwi9h/s9hYz3NHHAELZzkOP
	 SPK9ISpn7W1XXaZtd9JWgSzZc694saaOBKXLwet3WvzcWZ75I5JEao1wBtrnjfvMJC
	 xhFoXjCSuAj/X3KVpbLf8zE+yo4dZAuQGNQE3bY4pLO0UV4p2DCDnFHDn03aIZgBRN
	 ZHzk1q7Nnkf9w==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4fcjth0vdqz4xMR
	for <regressions@lists.linux.dev>; Fri, 20 Mar 2026 14:23:24 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fcjtg5ZPlz8sWT
	for <regressions@lists.linux.dev>; Fri, 20 Mar 2026 14:23:23 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 04B4D633B8
	for <regressions@lists.linux.dev>; Fri, 20 Mar 2026 14:23:22 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <377b5bde-a30a-498f-a01f-c7b184ec18f2@leemhuis.info>
Date: Fri, 20 Mar 2026 14:23:22 +0100
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
 <177401300317.1614972.11684021310754192597@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 04B4D633B8
X-NC-CID: N1bGGb72WQ/rB1TEXur0M8GANsUX+3D+tJ7Ns3aWudkSj4bDgT4=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221234
#regzbot introduced: 7a126c1b6cfa2c
#regzbot title: PCI: iommu grouping problems
#regzbot dup:
https://lore.kernel.org/all/2c30f181-ffc6-4d63-a64e-763cf4528f48@leemhuis.info/


#regzbot report: https://lore.kernel.org/all/abmMptgPR581bPUS@mail.iam.tj/#t
#regzbot dup: https://lore.kernel.org/all/abmNkRC_vSVaP2sC@mail.iam.tj/
#regzbot dup:
https://lore.kernel.org/all/1f88b91c-59e6-4347-84c2-50b7cf106c47@samsung.com/


#regzbot report:
https://lore.kernel.org/all/20260315232500.251088-1-CFSworks@gmail.com/
#regzbot introduced: cac190c7674fea
#regzbot title: ceph: crash
#regzbot fix: ceph: fix num_ops OBOE when crypto allocation fails
#regzbot monitor:
https://lore.kernel.org/all/20260318023733.116789-1-CFSworks@gmail.com/

#regzbot report: https://lore.kernel.org/all/abNvb2PcrKj1FBeC@ly-workstation
#regzbot introduced: 88ec797c4680
#regzbot title: ext4: deadlock on inode reallocation
#regzbot fix: ext4: Fix deadlock on inode reallocation
#regzbot monitor:
https://lore.kernel.org/all/20260320090428.24899-2-jack@suse.cz/


