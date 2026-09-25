Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A669C47207D
	for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 12:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340510; cv=none; b=bH4D8eh+AA/mdSnwDaGkiPTuLC6PuegSoKTsXZfzvSbve0/qMVupMOhv8yWkHrSF00RKRSHtI7DGsq7jo2C2n9kqlb3K7LPkmS1OPPLckdUXYubrmuRCgKb2QOS5Ig+m6Swt2/24ZWOs10IgXIMFGWqQ+RL70H8LHHnorcQX0u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340510; c=relaxed/simple;
	bh=Tqy468hMPCXPykZWd5B6HRgj7Q9UFwZHyCMGFiCTXwQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=JtEOXV5aZSVZqc4Ooy6WModIUnNPh/ktp+cliqebLsoKPkRM2IfUfLKQnyvIHYGvUWI2stst7hy+DZdXf2q3RKGebeNfzpqtfRoZi4Bmb77UnjaBbpeIMvxKuVYa+/X79DXBuPhXpNPCENhFCxbU9HvaC7hd+YRpowiFunmkXV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=kZOpusY0; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="kZOpusY0"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hrr8z6KDrz8JTP
	for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 14:48:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1790340499;
	bh=Tqy468hMPCXPykZWd5B6HRgj7Q9UFwZHyCMGFiCTXwQ=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=kZOpusY0iSxWGCej7LEuQWyg2dKxnQCIu2xwXv5iOFhFuivJERdqKiyJhBiUKYRKM
	 7+p9AZl+UUEH5UmEPQi1wJdWhI7/VUdLo0ahx/HYsuYJr2JPWfHJDAaTBoHza0JKmo
	 aLRm9YY7+h1ZLiRfmfXemOgw8h/L57UtNSNxSyaAOM2tYxGQ+UkJTaOYQXb0Dn+hgi
	 OtP49N2mVRhNaRLNKda07e3huav5/Fy4JbPxpMbagE+hagGJW8cqUbNIKqIgeYdgrJ
	 bsaGuQAPgfAnqKZEuGaveda4RWHQSMO+gwEhPPEFPkp6Zc78RvwFxXOoBq9Ff5Yubv
	 tsRT6Z+a4vxYw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hrr8z5cX0z8D0V
	for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 14:48:19 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hrr8z43Fyz8sbC
	for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 14:48:19 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id DCE275F8CC
	for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 14:48:14 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <a647e8cb-667b-4a45-b9b9-0daf47069b8d@leemhuis.info>
Date: Fri, 25 Sep 2026 14:48:14 +0200
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
X-PPP-Message-ID: <179034049508.693061.6006475535314260754@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: DCE275F8CC
X-NC-CID: Y4OTEiCx64StNlnk861FtB4gVvkzc4jrN1G5qA75wZoBWxN6YDE=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/20260916062222.27347-1-mikhail.v.gavrilov@gmail.com/
#regzbot fix: x86/mm: Drop the page allocation from pud_free_pmd_page()

#regzbot report:
https://lore.kernel.org/lkml/20260901194524.908240-1-ghidoliemanuele@gmail.com/
#regzbot fix: 53cf0f26eece095a375

#regzbot report:
https://lore.kernel.org/regressions/6262cbbd-d1f2-4c9d-a1c7-9c5d12636f4b@gmx.de/
#regzbot fix: 3ac761b613c744

#regzbot report:
https://lore.kernel.org/lkml/20260804083434.20885-1-i@4t.pw/
#regzbot fix: dea99705bc8fcda12590

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221745
#regzbot fix: 5d00a11d484e7b3

#regzbot report:
https://lore.kernel.org/netdev/20260707162146.73823-1-stefan@agner.ch/
#regzbot fix: 06232cb44bc8e


