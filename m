Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58209422E2A
	for <regressions@lists.linux.dev>; Fri, 24 Jul 2026 10:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889452; cv=none; b=ls1LqZMdAXQpLxBkyRvKFlA8dc6wuffUPiworydWlcbYPpbry8KwiPWrty0AsliZJ8PgrBu0EXcgmNfFWT1vQN7m0DvBBiKj66KQU53x2bQKgiE75gfGT+htPnMeHVENOxuhIBaw2tLvxex6tQCeSpqxK0tIjnPmCVBPIG48TZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889452; c=relaxed/simple;
	bh=FE7c0eKbjahz1EZ7PPtFA5NSrE5dBOuGQDccJuepNWI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=f4J9Ra/L7ObZp1MVk06BJ2gn2GCmZRGrWNdiAI4WkvwMQpFHu+3owPIU+LsKdCHpZVCq3wk6rvYSeI+OspUYV8H6wZ5PqF/dgXyOYntKXvaUztqv6oRqZj/2pA+1Te0Mj8XWlzuteuMCIGdZ0mYcoXOaZq/++82Q/OjNd9L4REk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=JkVm/tRN; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="JkVm/tRN"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4h64F36Cvwz4PFW
	for <regressions@lists.linux.dev>; Fri, 24 Jul 2026 12:37:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1784889447;
	bh=FE7c0eKbjahz1EZ7PPtFA5NSrE5dBOuGQDccJuepNWI=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=JkVm/tRNklSBsHNjUTQyZN8uelbMEEYRGoOPbtQfvHMg4tua3S5jE3FkEE+UdXgf8
	 on0joL+cDPLLfMlH7LmVvVYhPeXTyOtrBOBgUoBB5ldtbBHUsEH0drg9IhiXmPh87x
	 qKREHg1ZRIyxSclgFS6UlxjSHTp4esT0p/3i1PEL0aM2ysBNVSpj3TfAQZM4gkgfnl
	 wDPR797zN1uDxi3QN0VyE/wQQPFyZfX0BPD7JNOQubwjiiavnA15LdtLRg47IjwWtn
	 M6R/UrrGrok4eyJ2HjKLMyZLpJzFlBp8lY1luLLoQjwFQSEs4ifkbnDrwTyr/3W+Ct
	 guGm4dvXcq1oA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4h64F35WSsz7xYV
	for <regressions@lists.linux.dev>; Fri, 24 Jul 2026 12:37:27 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4h64F341lrz8sb9
	for <regressions@lists.linux.dev>; Fri, 24 Jul 2026 12:37:27 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 1589D5F9DB
	for <regressions@lists.linux.dev>; Fri, 24 Jul 2026 12:37:27 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <df2fd11b-af9e-4ec2-8166-d2f188b0118f@leemhuis.info>
Date: Fri, 24 Jul 2026 12:37:26 +0200
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
 <178488944724.3029799.14433771601659306196@mxe9fb.netcup.net>
X-NC-CID: 8mhf0W9yu0xzqPJNSCvYf6TfJPIoZedHIW3aRMix3IslHomWolU=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20260722070155.GA11808@strace.io/
#regzbot introduced: d7a6797e0bc1ee
#regzbot title: powerpc: PTRACE_GETREGS broken
#regzbot fix: powerpc: Fix exit_flags field placement in pt_regs for ptrace
#regzbot monitor:
https://lore.kernel.org/all/20260723194809.4046600-1-mkchauras@gmail.com/

#regzbot report:
https://lore.kernel.org/all/178455954409.13463.336399957099402658@kernelci.org/
#regzbot resolve: fixed by including 499578e22ae0

#regzbot report:
https://lore.kernel.org/all/178422474345.11595.3718390216125966001@kernelci.org/
#regzbot resolve: problematic patch was dropped


