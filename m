Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8712A5326A1
	for <regressions@lists.linux.dev>; Tue, 22 Sep 2026 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066682; cv=none; b=NI9L9dMfr2+CZBOkKUEWPE7WhAuoec7QG9d+VBWl9Trb0XsPmawpTDa50+AjcWKpfEsEz14icG/xkROF4/goeWbO7MQM2Pkoqks+TPJPD8zWwZt6626RLY5wOlA+ATuIH2HI4pmpnbhdHQK37xQn0cMTdZ3oWKtHUEA6YqLCn+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066682; c=relaxed/simple;
	bh=qU/d6UCBhCknuh3UGxxgonveQE+VmPmoVzZMwBc10GI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=j7DOvTSN95yCRq4n1dCh5/wCjJuYY0Jm9VArua5jLpx22zJLlz5V6WERuSZL/kym2rbegYh/ck6eKHPfpxOPW/reqKdCtIB7RmedDp6Xse1Eo0sy55iXsyccnMwitHQCGhDqXt/8hc4com/3Iub2+LIm+IBtn4ralT+RLxvNYmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=cKNyJal8; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="cKNyJal8"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hptv35t32z4Nks
	for <regressions@lists.linux.dev>; Tue, 22 Sep 2026 10:44:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1790066671;
	bh=qU/d6UCBhCknuh3UGxxgonveQE+VmPmoVzZMwBc10GI=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=cKNyJal8hkuMSGC2zXX4bWm+kZDzS7ABvaOJqnBewASd3vaYK79Ys3omFKayWuiwV
	 RyW09Ydz3oZOk9AhCYBx5YIXTkJxjHSMw5GWo0gvEKsgmE0YlZs6UEoROt1LP894rW
	 v9+Sfmg4oBMJEqE0X/dej3ArHd5iM7h8oVCK0KPObLSZ612qv6Z3ooiUHP6lAZ157o
	 kEefo0BHGkPtplcZ2rJGnT3XRAjl8p/LwqGzJwxINArIBcRrhtIydIi7UXDT0f4pE+
	 omMYBCvMPzqvlI74nTfLhHIIUF8RF3Xm+k+IjopqVG9Ln8lxCbYMh05yt2fttoam/z
	 NfNDoFewVEEKw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hptsx0B7Gz7wWh
	for <regressions@lists.linux.dev>; Tue, 22 Sep 2026 10:43:33 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hptsw5hKrz8tGh
	for <regressions@lists.linux.dev>; Tue, 22 Sep 2026 10:43:32 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0ACE25FADD
	for <regressions@lists.linux.dev>; Tue, 22 Sep 2026 10:43:28 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <27c01fa1-e3cf-480d-94c9-55f5bf51ed5d@leemhuis.info>
Date: Tue, 22 Sep 2026 10:43:27 +0200
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
X-PPP-Message-ID: <179006660826.302284.5511955175870145448@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 0ACE25FADD
X-NC-CID: 4g/o2C2yhYH3Uy0dE8FFdUVfuxtGBlzGxVVTuR2NZM5WRUwOvgY=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.


#regzbot report:
https://lore.kernel.org/all/20260903121218.4955-1-nikprica@amd.com/
#regzbot fix: PCI: Accept AtomicOps already enabled by the hypervisor

#regzbot report:
https://lore.kernel.org/all/905771062.272724286.1789919301858.JavaMail.zimbra@trinity-net.com/
#regzbot introduced: 6cffb59ee50ea4
#regzbot fix: ACPI: processor:
Update cpuidle driver check in __acpi_processor_start()

#regzbot report:
https://lore.kernel.org/all/CALjEBWQo0-Sdimo+aRNKUQvgDGw=jBFCcfwCXaqVdtoPrHLAQA@mail.gmail.com/
#regzbot fix: PM: hibernate: Freeze kernel threads after image preallocation



