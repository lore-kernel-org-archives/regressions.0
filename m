Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361742;
	b=otGsPDFfZ+geCN0shV5Nkc7R/L13bicIGVGMdjFVVWMlhtclfS2Ovez8eAMIVVGF9cLj
	 M3OKuaFHjEVvuYep6RLIwqmIUwP5jLh//od2h4wfm7FHSqjCOafPLwJEY4MODvWa/2Ey6
	 KbkfiHTgX9QcacIcHGsyH+Sh51xyfNIbKKqJo4HV0RBPSgZHhx2pRJaqsLjojqcp0c/vd
	 FAgtxb8kJsqAesMsmLpvzZ0BMVGq0cif5cS7bJPPiVdyC1OLxcn+IlgK4qqATSbBvtJ2j
	 Q/brqpFOCVTdB/UkGCIBU/vdOm7ApSDLN+DJcUPZsvw+gnkM0e5/dXvzivcBHWmgrkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361742;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=vA2XWL/ECXb9housIkU/J/op2Gb5aFCgyJTHpL5leHo=;
	b=FfKXksv7FrJOt6HlCu8YOeVz0s3TcdB981dp5nwOshGVEVMLoyYQzPWqPb0yesq3B51D
	 a8qr6NtwZNM5K6RlozUxMQTsZl3wap5DNCa6WtHFws2/PAYUf1L//sYQHYkLqPduWuceW
	 TZxxYonS3RIMjQMS/bWJXdWIyNMcNUy5zc48xL3uZw9tO9PHHt8lvs9rz7cDPeuNnCOOj
	 3ORV3r5zaGSq1Pe/gCCITSTUY+4Adzbdi1KQD6LvezQuTofL64zx7NgBozfVjTz1u0mkW
	 NaxiCwcDtZJv2dXTjAVNGxFYWHIZ9+FWrOefS7h0blpjLDbC+RkvYr3yOGknRJqIyzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=QEsViWjH;
	arc=none smtp.remote-ip=188.68.63.102
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB15606A325
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 12:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB15606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=QEsViWjH
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jGKTf310qz6Wh5
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 13:02:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793361734;
	bh=vA2XWL/ECXb9housIkU/J/op2Gb5aFCgyJTHpL5leHo=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=QEsViWjHtmnZbGufuugkbBFpjzXG3wj720F8X1X7E5zkm9d6ZilLaOldx7oiL2Dsp
	 ZwgXppLl73EFbjjmoQA/dhp3yUddCgug1OiXZp2MYh485OWVefhxbWlwCw41Az0jsL
	 RNwJqg6Y2OZIEXx9GBwgdB49SIeEs3jf8ScOPzSwxS2jiY8CaU9TDE+bHJ+7qQjMCb
	 j/4L8fP/P/3+cOushTEie9DscsmxoQ+UsKcKR7rPn5c95ARivNEamrDVLvoMV3Vru8
	 f8AwfDV4F2gshO2wvxl+NJqXc5IL4p4iii8Zu6fa24Tz2lkZtp2LZS/Al0qdBt/jt8
	 HaYVCGbJYBbHg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jGKTf2Jzlz4xn9
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 13:02:14 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jGKTf0Z4rz8svW
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 13:02:14 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 912C95F98B
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 13:02:08 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <083fbf31-ab4c-4d84-af4a-c72ca712b857@leemhuis.info>
Date: Fri, 30 Oct 2026 13:02:07 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
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
X-PPP-Message-ID: <179336172887.1306160.2131261716314313884@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 912C95F98B
X-NC-CID: QYlHEwKLAc1384hD6LhsNY+Le15infTmNiL3JrAT4psxDw5SyEE=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.


#regzbot report: https://lore.kernel.org/lkml/ar_AuRr1eaZzOfw9@baldur/
#regzbot monitor:
https://lore.kernel.org/all/20261021080517.2161-1-okerixx@gmail.com/

#regzbot report: https://lore.kernel.org/lkml/ar_AuRr1eaZzOfw9@baldur/
#regzbot monitor:
https://lore.kernel.org/lkml/20261021080517.2161-1-okerixx@gmail.com/

#regzbot report:
https://lore.kernel.org/lkml/CAEB5A_91hob8ddOhW=PrO1=O7GrFmSxY3r1-_Ard6x8KHHuJGA@mail.gmail.com/
#regzbot fix: sched/rt: queue a push when a queued RT task is boosted
#regzbot monitor:
https://lore.kernel.org/lkml/179229574717.42111.11570330900189006001@gmail.com/

