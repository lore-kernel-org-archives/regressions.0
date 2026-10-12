Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6834A8FE5
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 15:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820681; cv=none; b=imkZJ8CpZ9OLBNVqdnWIg1hKzIA94AeA2iY8by8SgqP1y6ma4YZ+Zx1x9HtfCCgdvLh9y3CGcjXraCStIywB01G2nkDXec5GANvgIRZxzPT+Xe1p5AW3my8ELZJWWmnui4sLrvCs2RlJtGSecxN1Y0mNuutil5lC5avBioTudfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820681; c=relaxed/simple;
	bh=6h3L5F2bCABvKUhtGBfjENFjhoz6ntyUCFLIBk/lpFw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Bvp+0Y2zeJzMVr5hCZtMOry3BJj6BrI7ppqtikR8kEltT5cNVEcCCTxVcHvPDqax1MjBAbWl8MYhkZpEnU/Rgj6n4V6sxYXF/qFkL67KDT1y0VHHYv54yuYhtji0btvS7bKwx/kPtPifF2pbLle8xL0Ruf4sN6I0oIFTNGFlOLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=bxKvBHYX; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="bxKvBHYX"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4j3MYx64pmz4DqS
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 17:57:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1791820677;
	bh=6h3L5F2bCABvKUhtGBfjENFjhoz6ntyUCFLIBk/lpFw=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=bxKvBHYXDwormHFhBmtbbcGD/jF8iwFMMxt8yJc03+2wVXIW02bvNyz5bqGPIr/Wr
	 m6hYeaX11Ga/lRAqYyAjRiUtOT/SLusHZ3tKLpPIRkhPQW+S3jewcn2tbvKwJ2fWbm
	 C5Mwz+srdF7sFiFygYbABV3XrCZT69AcXccxx/2Kjd1XBQBxYy4ttm7tJFfI26H2br
	 /rWjk7mZr34afRumkILvofCUVRmSYmnblZ3iE3bIACiBsYxCej66ngsA+03b7AITs3
	 6qLbdewCcIQK92G7zL0EnKqz4W+WRTFRlXQl5ZRK8YlC+DA/dFbZvWTFj6jqQOoW8P
	 f4dLmD4r95pSg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4j3MYx5P30z4DWC
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 17:57:57 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4j3MYx3YY9z8sb7
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 17:57:57 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id E7EC95FA0A
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 17:57:56 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <6a9e41a6-5acc-4e7b-8516-8c78935e5f6e@leemhuis.info>
Date: Mon, 12 Oct 2026 17:57:56 +0200
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
X-PPP-Message-ID: <179182067715.918715.17816616785004694637@mxe9fb.netcup.net>
X-NC-CID: iYkxteG/qGgfIfhXT4YjhmWTKwfSbwRsbtMR2dBtyP0n10dvXoU=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/7c9eeb21.1c04f.19efaacbb2f.Coremail.chengfenglin@stu.xmu.edu.cn/
#regzbot resolve: inconclusive: people can't reproduce, likely a
microbenchmark issue

#regzbot report:
https://lore.kernel.org/lkml/CANGjgd=RwMy=29OYG14b6kkoF1uBHz67jTGge5Nubb-XemMvBg@mail.gmail.com/
#regzbot resolve: Jan Kara considers it a scalability regression is
acceptable tradeoff, but plans to work on this

#regzbot report:
https://lore.kernel.org/lkml/096b42fa-107f-450d-b3b1-03bcad3f1e04@oracle.com/
#regzbot resolve: inconclusive: performance regression and seems people
lost interest

#regzbot report:
https://lore.kernel.org/linuxppc-dev/CADyY0-5M0+N1u45RVZN3Tf52iKaXcvKeUaqgdw-wP1B_4zuA0w@mail.gmail.com/
#regzbot fix: 6b28e0e7a07353


