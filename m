Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6260F44A401
	for <regressions@lists.linux.dev>; Sun,  4 Oct 2026 14:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122708; cv=none; b=uG2fnJUYhChGHFq2T6OXOsqwFGZAJvdtl4a7ZjxfqUy89xeT0vyATvj5y2t7IlWaZ4qNfxPdcwhKZt6aBthIXaNeR84YhrtF2CRY7LtTkRCJ9ZB0NthmOraar6eDCZKPtPIZOIimeDEWBnOzFw+7BeVfZc95VEEZbjXXPIzrHr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122708; c=relaxed/simple;
	bh=ahipVlefqOFSfshTS+hSpoItsZZy/luWwf8AZU0mU0Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=b2SAXRlIVaNAYN/v1Ha+4J7IXTpbO8iWsUjyR9z4nUxm/67kG0yZFRNDYkU+VJRyhIze7iJU3B9dW9ipZ+++IF7G+1P8w5UnDadXjTGu1ny2z4j1InO0YqvcsRX0AvMTCSxTcxMjOJVaJ/xFnqtPJquAGrc3FcxnL0q04kynNCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=F1Oos3OJ; arc=none smtp.client-ip=188.68.61.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="F1Oos3OJ"
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4hyPR81MWwz79Vv
	for <regressions@lists.linux.dev>; Sun,  4 Oct 2026 16:04:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1791122692;
	bh=ahipVlefqOFSfshTS+hSpoItsZZy/luWwf8AZU0mU0Q=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=F1Oos3OJuIEuNy0FxFXXgDNcrw8kltI742dDvO3uZytAitDRWKmiEffJzcxLQLzfY
	 jp4d455WVKvxZulSpkXSO0BXaCWmhUWVdyVBkBCEJUBQQ93ip7rWHTIB+DGVdvu0MO
	 ocoxxiDPCcTTTgzSl16/+6OwGh3yupybYGR3iCvV1apdLsp1MOc9oOefNAdH9sB1nv
	 jozKcXqcWRruho9pdogjnajjozVf36s/BWpF2yynNH0ydsbIjWmfFMxRW8WSn906Lt
	 XmYttIIAwxcb7SVDG73lH8dUyOw34ELmPCnr4/w2670Xb6pEjgnF4ANw7qFxLipbfe
	 N5oyV+VrelRVA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4hyPR80gKbz79Vs
	for <regressions@lists.linux.dev>; Sun,  4 Oct 2026 16:04:52 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hyPR76BFPz8svb
	for <regressions@lists.linux.dev>; Sun,  4 Oct 2026 16:04:51 +0200 (CEST)
Received: from [172.18.132.253] (unknown [185.104.138.131])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 36FED5F9DA
	for <regressions@lists.linux.dev>; Sun,  4 Oct 2026 16:04:51 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 185.104.138.131) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[172.18.132.253]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <5171190b-dcdd-4046-87f1-3817165c89ed@leemhuis.info>
Date: Sun, 4 Oct 2026 16:04:40 +0200
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
X-PPP-Message-ID: <179112269146.205896.14954428894670673464@mxe9fb.netcup.net>
X-NC-CID: +T8Ko9+CX4+SaAqPUuON9bjyeISkEmQFfd+u37CeF0sBdlpyZ+8=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/20260920094508.39682-1-roman.stingler@gmail.com/
#regzbot fix: 3fabd8ec206bd4

#regzbot report:
https://lore.kernel.org/lkml/20260920094508.39682-1-roman.stingler@gmail.com/
#regzbot fix: perf/core: track the perf mlock gift separately

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5740
#regzbot fix: 5a67d2e055897a
