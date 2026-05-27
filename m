Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89173DB318
	for <regressions@lists.linux.dev>; Wed, 27 May 2026 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779870295; cv=none; b=i9X8UAAKJc7PTNm93h3Tc35cXr5Cg01FCaA/iy3GCAIcRftxvjVprx3e/LLCMQaQjuAp/EtCnGSD/LczgX38ZeTLa7OKgZ+cYbZPikgj2VFYyOpNVguAWT4tDx689MZDw5pIykz8soV1n5rgIFQhJ/3xfXsFAcWurx00cRY+0L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779870295; c=relaxed/simple;
	bh=LhmivWCxmv3D6rHVzIUcmcgTSUS6b48gTMM/vLL1kKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kzJOKv9FfpvX6ts1d2pnZDBLHacUb4FPhj1XgYXAYn0HUnfWgnVicZKP95Dktuo7y8q2jdk6tvYUycQ2OY5eFQmXrmDsZMv0OJUou+KQk0dwPheWp6lUvPTxIwm5+vsIA1bwS/Za/6Fq+L1q01h54JKHHEfzRfGPsTV/W5hOX5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=MBwCs88Z; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="MBwCs88Z"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gQN2k2wwBz967v;
	Wed, 27 May 2026 10:24:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1779870286;
	bh=LhmivWCxmv3D6rHVzIUcmcgTSUS6b48gTMM/vLL1kKE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MBwCs88ZbZBxCAS+4ut2KChQcrz4bq+HYywYB7kkmIN4UnnLU2B7Ryz7Q61dRddvN
	 LVzT2M3r65D4gPi03E1gh1xmZqa0LSNqkTFrh3l+M0sTPW37+lAEykfpiutjSoHy+a
	 yvnRW7VOb6wGwyVzxL1GXlsyGr/yOaIsiFt4c4JStlLWV2QSCOsEqmYW5z/KMYj6U8
	 xMUYOy+sY6MTWCwtddp40m4UqMqB7aqGkAJzjAcIFudB2Pr7k3fY6gxvvTAK1yrWfr
	 bhW8zX9LviJ6eCv0KqetEzUyozuaB0v6Ad0pd/weNZyPNssnPHlU6X2hgTZwmeObJX
	 Q8omQ6Wejt1ZQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gQN2k2Dgmz7wc3;
	Wed, 27 May 2026 10:24:46 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gQN2j50kNz8sWT;
	Wed, 27 May 2026 10:24:45 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id DB36860345;
	Wed, 27 May 2026 10:24:44 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <7ad15680-e3c8-4547-86ec-ba4141a43e32@leemhuis.info>
Date: Wed, 27 May 2026 10:24:44 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] sched/deadline: Hard lockup during CPU offline after
 commit 14a857056466
To: "juri.lelli@redhat.com" <juri.lelli@redhat.com>,
 batcain <batcain@protonmail.com>
Cc: "peterz@infradead.org" <peterz@infradead.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: 
 <r16mBH1ydY4oK0PInLKwpYR2I5qZBsV5J0JsNLrXAh8OR_QC6z6lABKlcvpzgUiBuarTKtVTP977RLI4mqt64Ydtd2O3yfhRuRJkQ1JL8u8=@protonmail.com>
 <agrDFlsPQxzWa9Xs@jlelli-thinkpadt14gen4.remote.csb>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <agrDFlsPQxzWa9Xs@jlelli-thinkpadt14gen4.remote.csb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <177987028520.4094728.3848410499576110885@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: DB36860345
X-NC-CID: NUW2FT8eYdg4IT6lRXnfZZxvpesDtvJzyIKp4VZWxN8TAOICt7Y=

On 5/18/26 09:43, juri.lelli@redhat.com wrote:
> On 16/05/26 03:07, batcain wrote:
>> [1.] One line summary of the problem:sched/deadline: Hard lockup
>> during CPU offline/migration due to frozen rq_clock loop in
>> update_dl_revised_wakeup()
>> [...]
>> However, under the stop_machine() noirq phase, the runqueue clock is
>> stale/frozen. Since the clock does not progress across iterations
>> within the enqueue loop, the mathematical state stalls. Consequently,
>> dl_entity_overflow() continuously evaluates to true, trapping the
>> processor core in an infinite loop inside the enqueue path, resulting
>> in a system-wide hard lockup.
> 
> I cannot immediately see how this issue can affect dl-server(s), as they
> cannot migrate and are de-activated on CPUs going offline.
> 
> [...]
>> [8.] Environment description (Hardware, distribution, etc.): Hardware:
>> Confirmed on both AMD Zen 2 (Renoir) and AMD Zen 4 (Phoenix)
>> platforms. Distribution: Arch Linux (using official
>> extra/linux-hardened kernel package).
> 
> Also cannot reproduce at my end.
So how to move on here?

Side note: linux-hardened uses hardening patches, which raises the
question if those are the problem. Batcain did you do the bisection with
vanilla?

Another side note: a fix for the patch is the changelog was posted,
wonder if it might be related (reminder: not my area of expertise, so IO
might be misleading everyone here by mentioning it):

sched/deadline: Use revised wakeup rule only for running dl_server
https://lore.kernel.org/lkml/20260522125833.264145-1-gmonaco@redhat.com/

Ciao, Thorsten
