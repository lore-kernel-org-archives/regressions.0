Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780718;
	b=umAbbCQJ3zkexINT7ZzaJyWjecsJl0jhrKcao5vNgxDopEtLKsS1qLDH+Sa9gVXeRGN3
	 lL2jjmm7JZQpGndabKNAkODPW64S/lPKchGv7ZT88zL6a2mZKSVmrEOVajUZaevD1D0Uw
	 inzKZ2s1S1sEMzz+N+7UCQS7w44ekfV1uY1pUGrvKvtHKzwQBNCIc6+HOE+8GEf5T9D+A
	 /zeFZw4igJj47PILValHSRjUI2ZukRGajFv671EqAAVzHbu5DKAh883SmgjfZj29AM81O
	 +qaKUzWPE8iAk2wp/CyjI8Rm1dYLw+Pgxum0SPGlwsDH4WO8HVNtZqRh5GdeEmgl1wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780718;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=fI8cje7LjWAJWAuAxMsBJaXn2eRfr8xetpPdouuS+jM=;
	b=eIz+Rokj9OhvvwGSoi40Pn6i/IJeVispFKCYop5t8f2/kSouoPaMG7VxdkZ46k6FZq4s
	 HPM+8raQFN04xcMnHypIjAe8JiQtTFitt8RU3LVs3TFs37I4r6kIr0ClJdXv8d/vT3c63
	 ybssg0NMrh//YrTA5LX1i9WcTeGR3HoXR4ibJC8saiElOr/+e3lJM5C5+y7VyHqsEbE5j
	 +YW0MJyqJ8vIRvbAvdcShunuFdLo9UNpq+WEovVxm/+4kt0FL69y+26PfTOlhwfUTo76N
	 CZIzGeCDn25mCp77NEGpW0+JVOkZIlmhNPw7djNUwbQ1T2uKi8YCDJzS1zyixJ9K/GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=BgO4Dm6J;
	arc=none smtp.remote-ip=188.68.63.166
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5D9606A31B
	for <regressions@lists.linux.dev>; Wed,  4 Nov 2026 08:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A5D9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=BgO4Dm6J
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4jKJQk6qfBz44JF
	for <regressions@lists.linux.dev>; Wed,  4 Nov 2026 09:25:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793780703;
	bh=fI8cje7LjWAJWAuAxMsBJaXn2eRfr8xetpPdouuS+jM=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=BgO4Dm6Jfl/rF/h8s69Yesl0/lL3v8knH7KzqZnsEPO7vLEuENfANuce3kLlK7D0C
	 MrIQtUzOC5PKzlIBJtvtLd7/0mvorksRj9kIQLIl3J6zrC3m5N4MwSoZmFLbH2/wnZ
	 JS7DeZrUJipKcMs4DodkoLiZdh5wwbmAvLXhfYy49sYwkEX1peh/NRsXfjwznEq6Ax
	 pCNg2QuTluFIxPNSzff+kX0aeGElOsmvfdK5vMeZgK7ZCjN9lRc7BYQ9gew1eVdbsY
	 6DZw+gfECGspetKYcSsM/umjA+VK3nPpSTg5W8tf7d6gZ71K0A/nszjtoCxetuE4ti
	 vg/hAvL/EtMTA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4jKJQL3WgMz4SXs
	for <regressions@lists.linux.dev>; Wed,  4 Nov 2026 09:24:42 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jKJQL4W8xz8sbs
	for <regressions@lists.linux.dev>; Wed,  4 Nov 2026 09:24:42 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 584D05F8D5
	for <regressions@lists.linux.dev>; Wed,  4 Nov 2026 09:24:32 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <43bb1ba7-cc9e-441d-b5d6-dc83d163ed01@leemhuis.info>
Date: Wed, 4 Nov 2026 09:24:31 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
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
X-PPP-Message-ID: <179378067254.812258.13588330125382678306@mxe9fb.netcup.net>
X-NC-CID: iL6Bu6RrgaabPLjT1Akg+AnrQLZkKTzMVFYfgL3wsG8GYCsZoS8=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/20261030114705.3159093-1-jjc@jclark.com/
#regzbot dup:
https://lore.kernel.org/lkml/cover.1793669297.git.jjc@jclark.com/

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/6081
#regzbot introduced: bf5bdfd1f8d4ad5c6020468d09b68b09c2adc5c2
#regzbot title: iommu/amd: Navi 23 GPU stops working in 7.4-rc1

#regzbot report:
https://lore.kernel.org/stable/20261029080731.890996-1-challvy.tee@gmail.com/
#regzbot fix: x86/virt/tdx: Gate TDH.SYS.DISABLE on
X86_FEATURE_TDX_HOST_PLATFORM

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5628
#regzbot monitor:
https://lore.kernel.org/amd-gfx/20260822091715.6692-1-julien.lebourg8@gmail.com/
#regzbot monitor:
https://lore.kernel.org/amd-gfx/99ad760f-c563-4c68-b5e2-bb473c5b41ff@gmail.com/

#regzbot report:
https://lore.kernel.org/all/97e7c46b2c3b8a0af2a458649349798c4ecc55ff.camel@guillain.net/
#regzbot introduced: bf5bdfd1f8d4ad
#regzbot fix: iommu/amd: Fix NULL pointer dereference for GPUs without
upstream bridge


