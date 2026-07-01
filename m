Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC84548A2C3
	for <regressions@lists.linux.dev>; Wed,  1 Jul 2026 13:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912617; cv=none; b=kjN5fSTVNcmJbzR/wYd0RE5Q7oSttADljwbpYgHBhBfkmCB+Krs9MxohdW7S4eD8G+Ip9advkit6iuWo+x0z5uub49KbsswP2461uTktb0dhtuv295sbvPkW7/H23eUlS1HHCXFHCpC23F9uW0NLKVnXF2tAn8InFNpxn40Npkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912617; c=relaxed/simple;
	bh=YHe2HKBcVpxTfR9tm05rWnq+O2L7WNMW4GMPsGkhaUk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Q4pz6FrZ1MEQp3eJuNMmDJDyJeHF7pwERgfQSXOJuyrMs89e9ETgz1Z56IsDH7yEC7EJk3Q3NwbC8RcNgStzNl8+eHPpVvLzo1IvD6syWTrifZu++Shwtm8IAUWhLQkXg6S1JMfDssveLvubGv2SIhchwNy2E0Cyzv4mQqZEUV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=R6uv+WtF; arc=none smtp.client-ip=188.68.61.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="R6uv+WtF"
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4gr0y85HdRz73X3
	for <regressions@lists.linux.dev>; Wed,  1 Jul 2026 15:20:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1782912048;
	bh=YHe2HKBcVpxTfR9tm05rWnq+O2L7WNMW4GMPsGkhaUk=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=R6uv+WtFPF/m6ISzPlnRnCpTs1YgIIMAyP5YbSMQ2vJIMulF6+oGyfciiAMipc4nu
	 XbF0mSU1tf41/8uhLZrSgFKey70aiRkOiSRDQ5RxdMQC8qdzPIK2SaxMfczi0Dn46T
	 zvnQ0IWlino7QGBzZfU6SKoi3dc+RXF9ASLGJ1QEue7dghuHoeuh6nQdvQkSMFeyiL
	 hNuuYxeuuIvMOwyQPsTr6ne1piAG9RkaXzhpJf2hsfxbSi6yz3iRFqN45nSkLYQ13G
	 XnFSHSdz8IrV9pvM01WOwBd1wf80eamfG/5nk6bpL+UDPeP47rKZPkVFqSGxGqlfsW
	 SPj86pWtngkwg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4gr0y84d2jz73Wr
	for <regressions@lists.linux.dev>; Wed,  1 Jul 2026 15:20:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gr0y766Vjz8t4T
	for <regressions@lists.linux.dev>; Wed,  1 Jul 2026 15:20:47 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 5782D5FAFF
	for <regressions@lists.linux.dev>; Wed,  1 Jul 2026 15:20:47 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <47d247d6-03c2-4950-9285-926c2fbf6e0c@leemhuis.info>
Date: Wed, 1 Jul 2026 15:20:47 +0200
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
X-PPP-Message-ID: <178291204752.1245053.1929216326464696569@mxe9fb.netcup.net>
X-NC-CID: nkS6URA1yPAKk9Zm/z7NQPbhM/5AZr/wbkseSGFcJyZFQqQUjQw=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5399
#regzbot introduced: 5cd5f99b7b9b
#regzbot title: drm/amdgpu: kernel oops in amdgpu_hmm_invalidate_gfx
while using mpv
#regzbot fix: drm/amdgpu: fix check in amdgpu_hmm_invalidate_gfx
#regzbot monitor:
https://lore.kernel.org/all/20260626180145.6213-1-christian.koenig@amd.com/

#regzbot report:
https://lore.kernel.org/all/d171cc76-bf25-48ce-b482-d344669dfc24@proxmox.com/
#regzbot introduced: 9b8b84879d4a
#regzbot title: block or megaraid_sas: crashes during certain I/O patterns



#regzbot report:
https://lore.kernel.org/all/585bc5ca-8348-49e6-bbce-acbf6b99d912@yeah.net/
#regzbot introduced: 0e24d17bd966
#regzbot title: tcp: throughput dropped from ~1GB/s to 100MB/s

#regzbot report:
https://lore.kernel.org/all/036a0c95-f5d4-46ab-88e7-1eab567d7a84@uclouvain.be/
#regzbot introduced: f0914b8436c589b7ab32c614d8d7868eb4ebd5bf
#regzbot title: mpls: ECMP with MPLS broken


