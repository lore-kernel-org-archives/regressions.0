Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309F12F872
	for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 09:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143311; cv=none; b=iL2RMLJp1nEkw8Qbly0XLXuHIU7eUOewAIrgGEe7+4ySB+EsvGAdNNKP7HCg8ssZClEWhUQ90m4rf6D/2TpahAwKOmSEnXLqVoc77/ubiZI7jSoT0llYZPAevV3R7i1CO8bhzfFLXEerYuHUmjLAhf0ahnbq+IPP63Dlr8y/CzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143311; c=relaxed/simple;
	bh=jZK+s0KvDs0UMMgUFJ5WVCvd9RGfYIgzuEaXmRcsacQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=r0L0eBU+PG6IZ+R8uk/hEo1F6uSFhThZRi2VF0YYo8hVBfUGe1bHU09eoj9SYQBV/OzsFMDQzHo+zmunj/JmxwCfaYipVNEN+nTHMBHHb3qw/ugW6PsiF7BP6gE2ehb2jPZcAS9o8FLejjFcmJCxMBtNM6Vhj7n1z6N+tcVZVv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=MVyoD0/E; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="MVyoD0/E"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4h7t0X2GZ3z4Crf
	for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 11:02:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785142972;
	bh=jZK+s0KvDs0UMMgUFJ5WVCvd9RGfYIgzuEaXmRcsacQ=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=MVyoD0/ExvfN8h/QwM1P3enZctcuhuRykzqDGOqIFvN4PMcSoC2A/EFOQ4n2mPoIY
	 yu/NA3rTizKySrdFfwqfcIMJWj4w0b8Gks7LYdLNH0H/6dkmTNYWmjMvCBak13ZmOM
	 QW1ObxuOHnTDfxZYGecAGXRnJImZQbTe66aMRw6GA+owSQTtoQNj6DRCe9EJP/CIWq
	 Xn0S8eHWIBcn9mgoaNt6M8QVcY1bMeB/FQnr4xOg1ZBnT1lQaJzWCln3CoLLab5h5s
	 /pph2J5fM0HnEA2f/Ai7k9dxwxdz1etX3NfSSMUeFW+PytXbBs0uZPgnoVDqH16FvW
	 K1QpKUoe6evMA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4h7t0X1Zdlz4Cql
	for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 11:02:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4h7t0W4F7Xz8tZN
	for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 11:02:51 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 05FAF5FC5F
	for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 11:02:50 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <fc72fdfd-b1d9-4781-be09-dec83070ea39@leemhuis.info>
Date: Mon, 27 Jul 2026 11:02:48 +0200
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
X-PPP-Message-ID: <178514297119.990032.6045094014810211543@mxe9fb.netcup.net>
X-NC-CID: 7Xq4A+sbfxGuV+pJS5xANuYBkbTgm8xbszy+911M/xM9/xeQD0I=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20260721191152.101118-1-borntraeger@linux.ibm.com/
#regzbot introduced: b2a9f217ad3f
#regzbot title: btrfs: random hangs
#regzbot fix: btrfs: trigger cow fixup via dirty_folio()
#regzbot monitor:
https://lore.kernel.org/all/9f7a81cdd022d9e3f69d347a17c0a25438ccec14.1785131713.git.boris@bur.io/

#regzbot report:
https://lore.kernel.org/all/MWHPR04MB102982652A66D828B734EBC4C92CF2@MWHPR04MB10298.namprd04.prod.outlook.com/
#regzbot introduced: df4148a5a3cf
#regzbot title: snd_hda_intel: 15s audio resume delay on AMD Conexant SN6140
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/work_items/5529

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5527
#regzbot introduced: 48ab86360af1
#regzbot title: drm: amdgpit: `Pageflip timed out!` errors and severe
display freezes
#regzbot fix: drm/amd/display: fix DCN VUPDATE page-flip completion
#regzbot monitor:
https://lore.kernel.org/all/20260727-dcn-vupdate-flip-completion-v1-1-4a985b8526f1@outlook.com/
