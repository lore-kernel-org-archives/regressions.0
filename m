Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8FB41D11C
	for <regressions@lists.linux.dev>; Tue,  6 Oct 2026 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791293400; cv=none; b=ZyEQHoty9SmA5HZgdqVKvCIlBOzCnO+kylFYIWVn91H67MZv/6QQ51Xh27xkT08Oo0cW38NmYG2lItWNnUpox/Ht6TuMXa6zKnQvKezH0xKYxEE24d4btp3GdJ4hoqg7MJpk9pArs9y5eeT0kb9UR2068veNKR3w49E6iwxetIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791293400; c=relaxed/simple;
	bh=Rv2tA/KNNWig9Ao7/VoG6Iw9CROsVlo7IlM415pBl7A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=G39qDnCFy00A1UDpqMSBuO95rx1CjktJvfr5OXOszn/s7j7h66N0CsQrB3BND1d+SOgp3/nIXrotTtCDLicM5nrDahA832L0yqY2VZRSgMJdXlTOFSd21Qi7+vfISLWEYaoxo0J0Z0oBEdi0GPO4qyFkNOISuaNdAjkhafl7trg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=jNgFYQxq; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="jNgFYQxq"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4hzcYm17kpz8Djg
	for <regressions@lists.linux.dev>; Tue,  6 Oct 2026 15:29:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1791293388;
	bh=Rv2tA/KNNWig9Ao7/VoG6Iw9CROsVlo7IlM415pBl7A=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=jNgFYQxqnMMc9CbdfCToKToWKm21cr+YPvdf10UJAh8LlRCb8UVBscnRJo+FDEUAM
	 Cv7aWLIL/Fk5xN3ZHmMylIq21Kf6IxrOyUhUZOS00F9fXy79loMCv/omjApPWDxyg1
	 SRJxYYPsxNKp9UJRG9JDVK+Yzpdk1Gl/68rXV+K6eDK54VEtCIMZQJP6BWTwSWMXcM
	 LDP3T0VeSz68XyzAVDJgs7uNm4z69BorwGhl842KhlXToIauX76+zMzvY0SkIRL3og
	 0aU3lUHci/AX2gDApVb8JKV9I9FXwcUnKxw/cwUdpYbSfGilY7vOBAeXnQSNSAQZfF
	 JpgEPDKzR9z3w==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4hzcYm0R9Vz4xtG
	for <regressions@lists.linux.dev>; Tue,  6 Oct 2026 15:29:48 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hzcYl5xFgz8svY
	for <regressions@lists.linux.dev>; Tue,  6 Oct 2026 15:29:47 +0200 (CEST)
Received: from [192.168.142.38] (90-182-211-1.rcp.o2.cz [90.182.211.1])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 2BAF65F9C4
	for <regressions@lists.linux.dev>; Tue,  6 Oct 2026 15:29:47 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 90.182.211.1) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[192.168.142.38]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <44983ff6-3510-4cc1-a7b7-a7476b2f7898@leemhuis.info>
Date: Tue, 6 Oct 2026 15:29:46 +0200
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
 <179129338733.3889724.11059683060776633607@mxe9fb.netcup.net>
X-NC-CID: //4QD0AfySfjTXFPDIItJ1J8KBD3wXtVgvZh1lx+O2UmBV5PS88=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.
#regzbot report:
https://lore.kernel.org/lkml/20260920094508.39682-1-roman.stingler@gmail.com/
#regzbot fix: 3fabd8ec206bd4

#regzbot report:
https://lore.kernel.org/lkml/20260916062222.27347-1-mikhail.v.gavrilov@gmail.com/
#regzbot fix: e3ee38c1bc0b11


