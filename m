Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18BA3DD534
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 07:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780645779; cv=none; b=gBd+Z9PijjcQdBvid4e4g50LqOe2SHcCQlU6DuY/qiVH2L7Fg8fgI4OJWhBbIQ4DoR0aTJ8v03eSnwTwB5B1S3qAjr70Kv5TS3p2ByclkhDKA0kRd+5CBJ+HGa4eCx0WwwptZEtoTtklpXg7HZRb/4SWhDUx5SxyTCdu0P9KYvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780645779; c=relaxed/simple;
	bh=9ZcttrwgpG72+2ylRbwEn2hBZtKnVp6k/7rporcsv+s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=BAmqdFAiTBdktRb81dGFtUSk0YsUKrO/uR0tQUpVta00cmemINmnH4I9EWGDbCoDb/5EVMNobNg76QfdtssID1zH8v0mF54gjugeMQgSxEg8kRGLKf4uIDcskHPrMp9B3XWKNHj7EAl3Z/gN8gw5A00kejTk63B6DbtqFSeJaAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=k+LpE5Py; arc=none smtp.client-ip=188.68.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="k+LpE5Py"
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4gWtqk5wFyz8fhR
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 07:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1780645762;
	bh=9ZcttrwgpG72+2ylRbwEn2hBZtKnVp6k/7rporcsv+s=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=k+LpE5PyoeHV99/+RBPbz8d7EWhXKKprbIe8CuXg+gU8twNSepev1Bgwzp+ULrzUQ
	 kZoaSTC54TtR20JnTss4MC+muuDFfBrtCE0KHn3rS2WdhiLwKhgLZaP11NaMSE2SoB
	 5pE4carBBOWzY5qWHXRp4NzbGivXub6if9SWKluJ8DMWfCFjHLZ3/dOO4Lz1PTcRLB
	 eZuciw3BUDsEVv4sCDLuF4PWoaakmbzKG2GpGuSLXU0y2Ckr+h6RgG39HsRly3BvkQ
	 CklcooNPiPs5PAOjVFxoX9jes1ydQHMKghnZLUtJaMXNeaxb4/iMbb2k8EytkWowsh
	 skFqofJwR+w6Q==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4gWtpj6XVjz8bLT
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 07:48:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gWtph0SPqz8tZs
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 09:48:28 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 5F82061822
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 09:48:27 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <218b7a4f-7cb4-4288-ac25-4742506b3579@leemhuis.info>
Date: Fri, 5 Jun 2026 09:48:27 +0200
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
X-PPP-Message-ID: <178064570755.1264621.5857803197410720771@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 5F82061822
X-NC-CID: eSY0dOefaPnxFEsbgoOrpXkn1ZmflntHVHRDYtPsBmHtQIScSBs=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/lkml/ahC8Pyuatu_AvnZp@google.com/
#regzbot fix: PCI: qcom: Indicate broken L1ss exit during resume from
system suspend

#regzbot report: https://lore.kernel.org/all/ah726OtFX-Qw3U-R@gmail.com/
#regzbot introduced: 850d9248d2ea
#regzbot title: suspicious RCU usage lockdep splat
#regzbot fix: b6197b386677

#regzbot report:
https://lore.kernel.org/all/20260508102403.4e2fb1bc@kemnade.info/
#regzbot introduced: c34dbc5900b0
#regzbot title: wifi: wlcore: warning endlessly repeated
#regzbot fix: wifi: wlcore: enable the right set of ciphers
#regzbot monitor:
https://lore.kernel.org/all/20260604103316.377251-1-andreas@kemnade.info/

#regzbot report: https://lore.kernel.org/all/aiHlPmeZq3WgMwoJ@kernel.org/
#regzbot introduced: 18755b8c2f241
#regzbot title: svcrdma: severely lower RDMA performance


