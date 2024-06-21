Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22008197
	for <regressions@lists.linux.dev>; Fri, 21 Jun 2024 10:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718965456; cv=none; b=HG9AHBF7E6OjJQhpQGcbu0+cE3EF1AOFwEc7y27bUMSOOinlCmowOywgtwT+VGcoi79vJVINhtU5i0DVJKElGlJ8Y8pOeu/WzxAMp8hT1v1PZPqTTB5tfdpQVtrU6jzR5eBYfMWp8GyzEq4WUzxgobrw3Cu3UvkTm/24JppTRmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718965456; c=relaxed/simple;
	bh=FfjoPuVOWGJQTTdNMzgxMDtprN4q27AHcoal7fal25E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=QS7KJAksbmy0PFhw1aYnKVHc4BzlGJfXI2NUtcVtECSLOBV+kQQv8Z2gSbqOnq0VTkR0yT2Ybxddfyy5WTIHsXz5kX+tNba5IyMtiGP4Ndyq1Y5N+W+vSb+dMVKrzZ2s3old4QapMbK5t1k9Cs/Jk2AJFn3XR+1mD6pcLiMicbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=1iyTlElG; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="1iyTlElG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=FfjoPuVOWGJQTTdNMzgxMDtprN4q27AHcoal7fal25E=; t=1718965454;
	x=1719397454; b=1iyTlElGXP1qqEBmMh6y8x58Rk6DAD2DKdZ2oxlP1hS/1m8gNgG/z4QzCKUcG
	3itjWMo4oLOr98FprqExbqokEvhj3WUd0CAAboXdMyGOwjyjN3WsjNFEPgp5T5JG8Vo3LZ8QSuoCo
	JOCSpAOBGXCfYhcmm01Wm9zYIDE4KQ2+N4OJFJRwq+Qws2dRxxzIN6X8Tw8C13cwtqR/6awDGPdJQ
	eiHEUylQRNGOfNy10MljjrTDVdLA6vyVLMfdfv+z8NHz8ZsTx18O3LeOFNF2RBkdpMLlSDC4a0AED
	zsTkOfPgX2YzBObTcuwZD2ZdlzkBwc5iu6DMS7WMTAWO3P+9CQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sKbRE-000276-66; Fri, 21 Jun 2024 12:24:12 +0200
Message-ID: <0a9f8fbc-7fc0-432b-8ac3-f2dffe499cae@leemhuis.info>
Date: Fri, 21 Jun 2024 12:24:11 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1718965454;b6782ac0;
X-HE-SMSGID: 1sKbRE-000276-66



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218975
#regzbot introduced: v6.9..v6.10-rc1
#regzbot summary: iommu: suspend broken when IOMMU is used
#regzbot duplicate: https://gitlab.freedesktop.org/drm/amd/-/issues/3435
#regzbot monitor:
https://lore.kernel.org/linux-iommu/20240621101533.20216-1-vasant.hegde@amd.com/

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218861
#regzbot resolve: apparently solved

#regzbot report:
https://lore.kernel.org/all/e72771c75988a2460fa8b557b0e2d32e6894f75d.camel@ew.tq-group.com/
#regzbot introduced: a163c5761019b
#regzbot summary: can: m_can: kernel hang

#regzbot report:
https://lore.kernel.org/all/75e17b57-1178-4288-b792-4ae68b19915e@draconx.ca/
#regzbot introduced: 062eacf57ad91b5c272f89dc964fd6dd9715ea7d
#regzbot summary: mm: vmalloc: kernel crashes when running xfsdump
