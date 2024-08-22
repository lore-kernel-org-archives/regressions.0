Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E5813AA2D
	for <regressions@lists.linux.dev>; Thu, 22 Aug 2024 06:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724309609; cv=none; b=Avnjp/hnhfGcDPN/uaQpwgLbFkszHL5U17xeDjve7YMo/7I99Fm7yD3/d88PWtQp7W6WWwXt2ts9s0DwQp3ekygZoxjLitkQNoHtJUWDf9sq1jSbcM+T9/QEP5bCTiyVAAVvAWXg180y8dVQBv0yrydp1zRumDwBJ2TYU7kT3rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724309609; c=relaxed/simple;
	bh=x1gwzPNxQ4zd0/iQTcNc1S/i0EDrd4qPvvBcbFRq/ko=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=PozLbNRwEQPSjhyXIBIGJuAO9hQHMTqrKGXp4Jo+WmcY9xXAMjCDzyPoUV/bse32066RwJzz3LWcPlz8QM+tmbhqhF10xl0Tqs34nqVgP+BERxZ9uos3WRiIcJzzeSWHZSoGk8J9JsaiflevZhl0lb+A5u+2v5affcZKMbDXekM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=I3cDcG2h; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="I3cDcG2h"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=x1gwzPNxQ4zd0/iQTcNc1S/i0EDrd4qPvvBcbFRq/ko=; t=1724309607;
	x=1724741607; b=I3cDcG2hkum7iFJnqjmsDYZLdLK1/PJJ0AGObug0IKn9h+MLTgV+aqEri3X/8
	DCLEI8vtxdcpBRFQAFO3V8xL7DwuTpNtNDarCJ3SZp75HKoNgDO6tcY1O5ZjU/YYZKz1yMbLUp4ay
	bf9b06c6kgY4U83PBLMhfbkzjCsgvLJtuOlRW5TRF6Lv2g9JgvqOwMcHcTb8ECcSYX9CPMMDLIy/q
	Lv5DmdUvhn1KV7MU7ktzskNcPgDsu8ynuJVFpliW+DAKZbludZIeHraWzY0y/+Pkc0gQvKze0lMtR
	XU2aWpO4hvP+qOuk5Y+njSrCVbgR71zGk4wIhySS6pL7wcHQpQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sh1hD-0007gI-Ff; Thu, 22 Aug 2024 08:53:23 +0200
Message-ID: <9612654d-9ea3-4ac8-8722-79b387d4de29@leemhuis.info>
Date: Thu, 22 Aug 2024 08:53:23 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1724309607;d615676d;
X-HE-SMSGID: 1sh1hD-0007gI-Ff



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/792a3f54b1d528c2b056ae3c4ebaefe46bca8ef9.camel@bitron.ch/
#regzbot introduced: 413e8f014c8b848e4ce939
#regzbot summary: fuse/folio: copy_file_range can fail with EIO

#regzbot report:
https://lore.kernel.org/all/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com/
#regzbot introduced: 01a0a6cc8cfd99
#regzbot summary: clk: qcom: deferred probes on sm8550-hdk broken
#regzbot monitor:
https://lore.kernel.org/all/20240819233628.2074654-1-swboyd@chromium.org/

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/3564
#regzbot introduced: 0ddd2ae586d28e521d37
#regzbot summary: drm/ttm: sluggishness and stuttering in graphical apps
#regzbot monitor:
https://lore.kernel.org/all/20240820134600.1909370-1-alexander.deucher@amd.com/

