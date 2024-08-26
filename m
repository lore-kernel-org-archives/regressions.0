Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD47D77111
	for <regressions@lists.linux.dev>; Mon, 26 Aug 2024 07:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724656106; cv=none; b=iCoUP0Fg8spdCfED/wnqyXSFfPryXbuN3YD8MNxsAM6cgZc/4SeTU/qiOLUYAxjbYm8DLQ8yrOvltiwqQK2XN+fk1K2DGdTVB/7LMmndujjK5x0bvKCje+OxjSugZjpwNXzSsw0UNTww57shCB4KgXE0KlLyBIMRWJx8ymC1cS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724656106; c=relaxed/simple;
	bh=2RKWqivUTiCTAgm0apYM2cpY/LqWNwRXuOHoeen2znU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=r90p7uKDmDSBXJoAvLEdQH46dJq64f6f2NOcamshM3OdsgNo3yxwRYeUgn3t9oQZ7FDuTEbq+gDMRO4ZWtgaeC9+yAgLW3/d7NVO4CgmUlvgPXxH8JM6Ko7cYLe695hCv2f/bzufnZTPX6FGBY08dtAyQnZexOl94UCexiSuC/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Q1fBv0in; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Q1fBv0in"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=2RKWqivUTiCTAgm0apYM2cpY/LqWNwRXuOHoeen2znU=; t=1724656104;
	x=1725088104; b=Q1fBv0inXgag68KTb+h3mGRuY0/6oWyjwqYTlAh3ZBS+eT59mO/v0k6LsGhUN
	m2EnB583lavmFc36gyyR/iQ5UFQxfGd4lIFm1e3vgmlje6BPiim9AkxdDic+l+zRaxLIi2BUdixm0
	nGeqACTChtlepXNc+z3i17jzaMqyLu9STi0tGm2KeM1CV7z+BIlwOijcXy7e3ffWL7jVxln41273W
	LrpbfxMNlBDysn4ph/QQAuKRkpbaq1vr7Pb1yPY8d3Hk9dGpb9UWBK3KSNZ0urlK7hPTQFC3cY3tC
	gYyPPy/3JQ5sLKetzIWTvbt3kWuOi9YnNbGCedbnP3GGqsoQ8A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1siTpp-0000oy-5n; Mon, 26 Aug 2024 09:08:17 +0200
Message-ID: <f464a66e-6ce6-45ce-bfcb-e9998ab11814@leemhuis.info>
Date: Mon, 26 Aug 2024 09:08:16 +0200
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
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1724656104;0a8039bf;
X-HE-SMSGID: 1siTpp-0000oy-5n



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/AS8P194MB204221F4E3BD3979A86D89BA868F2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM/
#regzbot introduced: v6.1.87..v6.1.97
#regzbot summary: net: ice: page faults

#regzbot report:
https://lore.kernel.org/linux-iommu/20240814162726.5efe1a6e.alex.williamson@redhat.com/
#regzbot introduced: f90584f4beb8
#regzbot summary: iommu/vt-d: device assignment broken
#regzbot fix: iommu/vt-d: Fix incorrect domain ID in context flush helper
#regzbot monitor:
https://lore.kernel.org/all/20240815124857.70038-1-baolu.lu@linux.intel.com/
