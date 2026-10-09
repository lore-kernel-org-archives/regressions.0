Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57C243E4BE
	for <regressions@lists.linux.dev>; Fri,  9 Oct 2026 13:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552287; cv=none; b=TnmeSlbUalVK1jVjFpDxyrcA3cJatptpEUByjLMRese+i9pIspXxUJL8gla2wGhbxox8f9HPSOhOTnISafOvacLlhOVlsCashF1xd+kwY94105g1LqU6zKKpY76Q+M6syunUQH3VsPs1LnBtL4hjzVhlTT2QE2VIq365uwwYXl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552287; c=relaxed/simple;
	bh=z5nnYeMOHRzSVQrKILM+Em5VIVbjLEfPMCi6vMw285E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=N5+emX6HuUbs/g0jwbXm736fjiTNlXVqQO9MoXekguooINPD/NbdvmvMSz1UXDelHZqag+V6LYDSZ+7pcV3yOc61JThl+nJcq4hmXY2b7FVYOd6S1UlHsJoMiA7dVucUPUTTCrowpL0Py9amNXrcL8C/OzffeWfusEr7Aaw+z6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=iAnafIco; arc=none smtp.client-ip=188.68.61.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="iAnafIco"
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4j1SJJ4sR2z77vF
	for <regressions@lists.linux.dev>; Fri,  9 Oct 2026 15:24:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1791552272;
	bh=z5nnYeMOHRzSVQrKILM+Em5VIVbjLEfPMCi6vMw285E=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=iAnafIcoRqLtWO9UyPqJ/rAlCA71EbxfU3mP3PRcXuHA3Z7PLsewcfN/UE4/WXpha
	 ZKRqJ8qTai1GSh+Zr1MLbZ1qX2UNlwL+BkbprKQxAXxG230grngANHdwCs1DrRSYpu
	 hqGE4OTPg19xT+pzJc7nsS5cPxgK5VbCc2Nzrsg6X1q6uxMihQ7Dmzb9OkrTnNVITo
	 xt4YJqJaPKAbavyc05lL+qeTiweWhwTkdo2h7nBxxjfCTHOJxSQX5u10Q+T2uVVAI4
	 5Fy9b2S+Scnmf5es4v9uYJXFHIqgKaIwd9zIqifIyfT015BR0/daYqSZx5q55Fwn/b
	 hs35PKJGxFIEQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4j1SJJ48tcz77tg
	for <regressions@lists.linux.dev>; Fri,  9 Oct 2026 15:24:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4j1SJJ0rSmz8tgc
	for <regressions@lists.linux.dev>; Fri,  9 Oct 2026 15:24:32 +0200 (CEST)
Received: from [172.18.73.209] (unknown [185.104.138.134])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 7231A5FA2F
	for <regressions@lists.linux.dev>; Fri,  9 Oct 2026 15:24:23 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 185.104.138.134) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[172.18.73.209]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <1e2b998a-5181-489b-a103-f88e84644f7b@leemhuis.info>
Date: Fri, 9 Oct 2026 15:24:12 +0200
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
 <179155226368.3736699.16258640227889456641@mxe9fb.netcup.net>
X-NC-CID: oL3ZgdSMNihMNYmWV2BeHkHGt2Cnu/DqYOlGykQcuntUVHw7JZ4=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/20261002175651.811343-1-ameer.hamza@truenas.com/
#regzbot fix: perf/core: track the perf mlock gift separately

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=222041
#regzbot introduced: ffe8a0c6b552
#regzbot title: pinctrl: amd: Clear S4 wake bits when firmware has _AEI

#regzbot report:
https://lore.kernel.org/lkml/20260920094508.39682-1-roman.stingler@gmail.com/
#regzbot fix: 3fabd8ec206bd4

#regzbot report:
https://lore.kernel.org/regressions/d81824c1-f802-4488-960d-6545cbe51f6e@leemhuis.info/
#regzbot resolve: invalid: typo

#regzbot report:
https://lore.kernel.org/regressions/d81824c1-f802-4488-960d-6545cbe51f6e@leemhuis.info/
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=222095
#regzbot fix: PCI/AER: Skip error recovery on false alarms


