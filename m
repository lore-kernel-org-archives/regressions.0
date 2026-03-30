Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73F93939C1
	for <regressions@lists.linux.dev>; Mon, 30 Mar 2026 12:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774875575; cv=none; b=Sl0huMksg6tXND2rCtcAoVci6bSzmbAEDBI9tslpYSL4LPrI9dsJOUrtLYxb3gj0ygjPHTx+Upcpy8R/5X8jmJVEdU87Y0yD5pIKMnJcAe0pF85ooU8gRoqA/Sltyv4RU9pr8r1KxD/50hfbB9mJfdi/2JP7HfavNyUDOBc/MEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774875575; c=relaxed/simple;
	bh=OgPYHeECgMgCeW/cgRx3noasxkG2aOKDWwuh3LQc9No=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=IdkAObQoEInegzdv6QCHqJf1o3Bv1C3Go+tiatTKDLTfKXJrxWvay4MqWFVQupLi94s/ZL8QOHydwHyF0G06devtO8mi41OTvgLVRjUT/FreK8ehCRgGNrMnlvcHmU6kLOStfJLITZuxIqyz602reAaJH9ZQVZio4XRgAvO9JM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ZxcI48JU; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ZxcI48JU"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4fkrtN5RLmz8D0t
	for <regressions@lists.linux.dev>; Mon, 30 Mar 2026 14:59:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1774875564;
	bh=OgPYHeECgMgCeW/cgRx3noasxkG2aOKDWwuh3LQc9No=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=ZxcI48JUrzg2NkDnfqK49p3pvZvlzggP522OL+eR89fgcRKFoBIZaauuzEd2XAIyg
	 QnIfeGtXViXDMJw4UMECEV5PkfhGHBGRGdMm1m8jh69kFH2gHIVG3caTS9gDq/ekPn
	 VSqFU2oc4vTiVYyVqTNze93X908PiXEgJ6AhjzNtQmR9VwYTfm2T9vpCbWHxwOS8Rs
	 FsfP2/iMchXtdmVI6ogQTNnZAh7AbZVcyBj0ZnLB0D6dPtM073ChuX/2EVzKblBM7O
	 /s85P9Wfme1Xb+nN69lDOuX0t1heYN40JYv9HZWqhTiS7Slzw2fOws9Zh55srhmmFZ
	 oofsXSuvH1bVA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4fkrtN4m1tz8Cyn
	for <regressions@lists.linux.dev>; Mon, 30 Mar 2026 14:59:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fkrtN1JXSz8tXc
	for <regressions@lists.linux.dev>; Mon, 30 Mar 2026 14:59:24 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 62BCB635A4
	for <regressions@lists.linux.dev>; Mon, 30 Mar 2026 14:59:23 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <d2ef2645-acaf-4739-a19a-9f136a759f90@leemhuis.info>
Date: Mon, 30 Mar 2026 14:59:22 +0200
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
X-PPP-Message-ID: <177487556356.1762375.9103633991815358728@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 62BCB635A4
X-NC-CID: QGPvH6zG9qosEktXZjudH0OzC4M5brVBPE7hjsVj25ioDr6nH/A=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221283
#regzbot introduced: b9537a51b65af020
#regzbot title: UML not building any more

#regzbot report:
https://lore.kernel.org/all/20260326215127.3857682-1-joannelkoong@gmail.com/
#regzbot introduced: 64dd89ae01f2
#regzbot title: mm: performance regressions for
strictlimited BDIs and memcg setups
#regzbot fix: mm: reinstate unconditional writeback start in
balance_dirty_pages()

#regzbot report:
https://lore.kernel.org/all/20260327160050.31631-1-liavmordouch@gmail.com/
#regzbot introduced: 5eb608319bb5
#regzbot title: vt: black screen with no keyboard input accepted
#regzbot fix: vt: discard stale unicode buffer on alt screen exit after
resize

