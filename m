Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71F048592E
	for <regressions@lists.linux.dev>; Fri, 11 Sep 2026 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132134; cv=none; b=NZPQ9dbFHFH7JSsrSuZ6jlNPHoyxv+nH5+FLukDGR3JOLYoXTmTcp2FU9oO6mpAvTQEc4iws6ZlyJFrvf/DvkfbRfbPANDOPmnyNsOxlmyb0OhaPBF9CiopV71rp9T0Dgoi+vLZ5mnPlwzw7x5vhedze/UMhiBPbkvkEFpdvxRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132134; c=relaxed/simple;
	bh=dD7wWt9XmoskBE9txrx3GI0azh7qvVsTIlblo1WEz74=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=A1MuXjo2yJP8r05JBOC+yYhkfL0bc0LEQbJaeh/WnQHf+FM/bgSeUWSDid3VvSCdmwXxL9+jrdnYCsW/yt3ebTc/6ghewYPndzMg1zPNdIGu1MdYXRGKqauJEGuuzCI/b4H5dFqC1imd+r+Vnc4OL0VjlOEMaAxs5JFBuxiJNg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=OFhkbOqg; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="OFhkbOqg"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4hhFGy4prjz6D8Y
	for <regressions@lists.linux.dev>; Fri, 11 Sep 2026 15:08:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789132122;
	bh=dD7wWt9XmoskBE9txrx3GI0azh7qvVsTIlblo1WEz74=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=OFhkbOqgAUvFW02EiNQ6a5Ki7An8yBAKg/jEsrhqXbpnu+TW5b+ZEZP0G/9n+VVNX
	 62AoT1d8EL9TBvK7Kv3B3Os941QB6hxfjcVhjidk1+X30aEkDzEE06rbK7IDxB67i4
	 C+zxnxsEc2Sq1FKGG1x4+rc/xFHfWpKLbrOOvvCCSkxo/bfoQ6BeGIc5dpXQajS9DN
	 q/u8U1cOpVijsttL4ogcOvCPq6AUhk+1M8/cFb/UYynuT+ias7DjQ8cKtYW5T9K9+U
	 1u4fPuUK/16ZRQ9gMYpVCZ/ALa9LeqhxIP22Sq/ls78QM6SZezbzmGPFfJZV/G/lbo
	 7p3GdNEqVM20w==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4hhFGy46jqz4xNb
	for <regressions@lists.linux.dev>; Fri, 11 Sep 2026 15:08:42 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hhFGy2CH5z8svX
	for <regressions@lists.linux.dev>; Fri, 11 Sep 2026 15:08:42 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 7A81D5F89B
	for <regressions@lists.linux.dev>; Fri, 11 Sep 2026 15:08:41 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <a7335933-75e8-4100-a91f-6fdbe33a9e81@leemhuis.info>
Date: Fri, 11 Sep 2026 15:08:39 +0200
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
 <178913212172.2107967.11078340699288227227@mxe9fb.netcup.net>
X-NC-CID: tm7FCsZ4CzP6pNeX7VbiyBhriufIBCWWg7KD5bwd9Gv1gcnM9Wo=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CAO84+xJLVW_9_D9-8cwJYv_Vz+LK7nJqRaG-1P4_eeLrQmSiWw@mail.gmail.com/
#regzbot introduced: 130d29c5627c
#regzbot title: platform/x86: asus-wmi: screenpad backlight power state
is never read back

#regzbot report:
https://lore.kernel.org/lkml/20260810-serial-v1-1-abbe51602c13@debian.org/
#regzbot fix: b144dc5a2414

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5714
#regzbot resolve: inconclusive: looks like this wasn't a regressions

#regzbot report:
https://lore.kernel.org/lkml/20260901194524.908240-1-ghidoliemanuele@gmail.com/
#regzbot fix: crypto: caam: map job ring registers without claiming region


