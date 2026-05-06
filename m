Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802843EB807
	for <regressions@lists.linux.dev>; Wed,  6 May 2026 10:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778063722; cv=none; b=C9nTovavQs9/mAZfFZyVRiSZXqLHAMqfF+CiIljuo8GPhdBgpUywAb9PrwdnZKyAme7X9Vyc/cz/DF3mlJ+jh3gMOf2ssQIPEa3rZKVMJO0bYkkz3WkoqSPkYhDilkM0NOGQXE7reb6KSqh3XAbOjqwvX+oi6Rnw5SJ58Prpkog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778063722; c=relaxed/simple;
	bh=khlgcmY9/G5wNSenaITKQTG+WgOFSpDaCE/oY/AWk+o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=c6xAg84v4QPVX2BjvvwtVl6wvoMrDaV4yN/EvQMN/GcsSaQjwnO345/MG7Jh4rJQw1HjKsBz9uqj9CTiM1ribfXQFsne7hON0ZNPoWNyR/wfZcGaozHfCWoVQFPpwbHkTICM6ezHBcpy+mCNm5aXYxyfhL6lsZkmlo7tSyhpCOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=MRRSAt5l; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="MRRSAt5l"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4g9Wwx1TLCz3wNN
	for <regressions@lists.linux.dev>; Wed,  6 May 2026 12:35:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1778063713;
	bh=khlgcmY9/G5wNSenaITKQTG+WgOFSpDaCE/oY/AWk+o=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=MRRSAt5lc2aCfik9ujPeIPE6hMNFNW5FdiUkMvHxHCX9ieEKQpVH1d3u3MXXzeoO5
	 c2aRSx9UkgEDkJFVousYjuxP+4LzN/jFblRPXz322YoP872YCbWMjYjYE87r7ZiLfW
	 6Uzx9Q+MMvCtvO5SnzzN6TiXkQUOwTtkREqNWQZKlcuvCcNhnAPUWWc5qJglUFoiDd
	 djqwB9RSJk9gwDy5aJn48wewdTPOMPKsg63dOzYET9zPOwpocYb4W2kGTqlWVp8iuC
	 7hYR5DiBWEWAZ5IpEk6xwmQajbpNoJaXGTFdyeBhwmgBQVOEAErKKU55ITeRBM6s2J
	 SeJCOm6JuNSHw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4g9Wvz5mlxz3wQS
	for <regressions@lists.linux.dev>; Wed,  6 May 2026 12:34:23 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4g9Wvz3fd6z8sWT
	for <regressions@lists.linux.dev>; Wed,  6 May 2026 12:34:23 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id E1A2363311
	for <regressions@lists.linux.dev>; Wed,  6 May 2026 12:34:22 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <0fb33769-4826-40b5-a855-52ef853c9faa@leemhuis.info>
Date: Wed, 6 May 2026 12:34:22 +0200
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
 <177806366311.3931726.13543000548239465312@mxe9fb.netcup.net>
X-NC-CID: AfOd8W5iCGal7UTKqx0ZHE0UXlkMd+D/NXAa8DL051rf2r9jvhM=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5167
#regzbot introduced: 69e3be6893a7e668660b05a966bead82bbddb01d
#regzbot title: drm: amdgpu: Garbled HDMI display on wakup from DPMS or
suspend

#regzbot report:
https://lore.kernel.org/lkml/773ba972-433b-44b4-89d2-295bd9f5de38@huawei.com/
#regzbot monitor:
https://lore.kernel.org/linux-scsi/20260421202018.511388-1-mwilck@suse.com/

#regzbot report:
https://lore.kernel.org/all/177771348699.1898023.16904466444228860838@eldamar.lan/
#regzbot fix: net: Fix icmp host relookup triggering ip_rt_bug

#regzbot report:
https://lore.kernel.org/dri-devel/CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com/
#regzbot monitor:
https://lore.kernel.org/dri-devel/20260223203528.213275-1-mwen@igalia.com/

#regzbot report:
https://lore.kernel.org/linux-arm-kernel/23024521.EfDdHjke4D@steina-w/
#regzbot resolve: inconclusive: seems nobody cares anymore

#regzbot report: https://lore.kernel.org/lkml/abE_QoS5DM-ZltaV@monoceros/
#regzbot resolve: inconclusive: affected machine unavailable for tests

#regzbot report:
https://lore.kernel.org/stable/CA%2BtjKGrmADg=oG9CT74_mgGNN3h17=LLmnv51K=MggAqo7q2Eg@mail.gmail.com/
#regzbot resolve: inconclusive: lack of feedback from reporter

#regzbot report:
https://lore.kernel.org/all/87df54eb-c527-4f1a-a3a7-67afbd73cb47@leemhuis.info/
#regzbot monitor:
https://lore.kernel.org/all/87df54eb-c527-4f1a-a3a7-67afbd73cb47@leemhuis.info/
#regzbot resolve: inconclusive: very old, seems nobody really cares
