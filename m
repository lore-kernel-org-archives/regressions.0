Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6EF2D7DC8
	for <regressions@lists.linux.dev>; Fri, 20 Feb 2026 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771578717; cv=none; b=mRAHwKB83XdE3ATHs5dYy+wuTXocTPB+xClqKGwYZTPrjvlu4A6T6eyZa+KYSr8SCwxmes9ceisGBhY4d08T7KAi6+JKk6fSYCr7kFRKGPImqIezGtB9LjS/xgZTfhfBmhTcrfMb7EcIq9Jl14gLY2BpPPddbFATpiLycc3OcB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771578717; c=relaxed/simple;
	bh=HnNCuAac8FlRvxa2bx4UrCbRdA77eCnoPJaAIqVbiGo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=puDQIdQQZRLagagKnNhH0Z4tDjVOHBb3k4LbmZBQKLNc9eFwAS+VD7STPHUd6aE6Ior32XVIXGUW4b56GyjMYh5esal0GOwwWnKeP+BZzXLTDkDKjBhsK6zoDOlDuF++AnOGyYQkk42fR4hw0VbwqorwpbViaOa3ez+uEeyMV4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=VliykZaA; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="VliykZaA"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4fHPTz5HYqz94HH
	for <regressions@lists.linux.dev>; Fri, 20 Feb 2026 10:05:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1771578327;
	bh=HnNCuAac8FlRvxa2bx4UrCbRdA77eCnoPJaAIqVbiGo=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=VliykZaAoZaRbK4Qz5vuWfke9JvE6tnozcBhpVtH4ySog6zpucj6r7nKxZzGYgAl1
	 0y8nTieuxwIvZ/4FNgK7hmmnETWWjpdAKwWu/VV6wOh0yjK2NyUW+vxLPC27Mdv1we
	 mLRNqcH/SnEtcFLfQE7ietnX3A46IKlVeJFD3WecdHk4qD8Zh0nv1SO0LB8Zl9szlH
	 uAbnsHQlsfYQrnq8uOzF6w9wOeyp1uWgDnCG0tBXyNA3z/rAN6w6aXgrSW2oEbooZ+
	 wB7zlpXdMaWOBDkbV4g3gwfMfvPyMOINJGMbxW6wQUwAJaRmvYsXu9RLnzsnbfQk+m
	 m+3hRoPoxx71g==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4fHPTz4bXxz7vfH
	for <regressions@lists.linux.dev>; Fri, 20 Feb 2026 10:05:27 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fHPTz32cBz8sgS
	for <regressions@lists.linux.dev>; Fri, 20 Feb 2026 10:05:27 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id B3F6866F46
	for <regressions@lists.linux.dev>; Fri, 20 Feb 2026 10:05:26 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <6c061340-117f-4fe9-91a7-95de606d8d7a@leemhuis.info>
Date: Fri, 20 Feb 2026 10:05:20 +0100
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
X-PPP-Message-ID: <177157832691.4002597.2687474055907662754@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: B3F6866F46
X-NC-CID: f/Getzs0iAOAJHs3sJQx+JHAW3wSelIMmDPP2HpsaiyuclA3xKs=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/netdev/CAA2RiuSnH_2xc%2B-W6EnFEG00XjS-dszMq61JEvRjcGS31CBw=g@mail.gmail.com/
#regzbot fix: net: tunnel: make skb_vlan_inet_prepare() return drop reasons

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221097
#regzbot introduced: v6.18..v6.19
#regzbot title: net: wireless: ath12k: Black Screen/Breaking KDE/System
Hangs on boot

#regzbot report:
https://lore.kernel.org/all/587f25e0-a80e-46a5-9f01-87cb40cfa377@wildgooses.com/
#regzbot introduced: 3e86e4d74c0490e5fc5a7f8de8f29e7579c9ffe5
#regzbot title: kbuild: extlinux can't boot kernel anymore

#regzbot report:
https://lore.kernel.org/lkml/20260210013733.1901270-1-nichen@iscas.ac.cn/
#regzbot fix: 7c375811b5117dd26e36fc508cff1fb5cd4121aa


