Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB8819CD00
	for <regressions@lists.linux.dev>; Thu, 25 Jul 2024 16:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721923959; cv=none; b=F3ZiiZB7aCKIMQEcY0JQjP02icyZ85CbUyPYSHNgBN6GYBAp8wRuNGWFQAy31rB6QTO0r0d7Kk+upEx5qnBfdqHagvzi4XVk+0sddsISCh04g9Uogcp8YJ+oNgkcMj7XE34CIjlEgEHzTuVbqc+WItNFqdMvtxsDmPRObqDMErQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721923959; c=relaxed/simple;
	bh=r3WeARIIvi7uylbExbQ5/dfT7x5BB/jZJ6LffnLYNjQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=qxI7yw3iJhHDBrEefGPIu9JxBrylCHciCcmGx5qrxwydvMzL4lcc/IlL39vtd0Uivj3LiiJwZxF5H4q3/7YAdRUegU9AELBTCYV96gI+hpqouys848EvmTsjeTlrgK+tSPtHEBJvdF+egFDP00IXJLFE+DgqzFCRuM6HnL4h/1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=EbVKmWSO; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="EbVKmWSO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:Subject:From:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=NU3mWtn51eFfRAyG63Qatzcpv84aHly3DsLvC4W8wr0=; t=1721923956;
	x=1722355956; b=EbVKmWSOf0P2sD0hXPfll+kfy24hYTUmfP86/Nej1HThnUj+LsXYzKxEkrxOn
	fQekChSAo30XD9utPHjxjuDhfpdazmfR/EXJbIgsAGVF8/mnKaO8j0k/99ZJyLlQm8BkM/51kCyMk
	64LxR6zv97xkARLPuk0512J6/KXz03pAAIyaPh05xJpF8X91nYnQVxJP69x/bss8v1+sCCkYodQeF
	3NrvDxqL64WtYzf/DBFNCZ5M6aeToYjIHIeNtM6Um45KsYrJCEuLnHURsJWAgIhgxsvnqGF5bcQQY
	LlCjgkreLoHMkU2BdRWC6o0NoP+G5wkeKsmgH6dE/0k4BkzvrQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sX14v-0007vi-1u; Thu, 25 Jul 2024 18:12:29 +0200
Message-ID: <58adc2c2-c052-4c2a-b966-05d3c571d8cb@leemhuis.info>
Date: Thu, 25 Jul 2024 18:12:28 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1721923956;3590ed75;
X-HE-SMSGID: 1sX14v-0007vi-1u



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CABXGCsMmtqzBfUykT-JgyhZn-7ZXtftHL35znDdYuTnUOpGnoQ@mail.gmail.com/
#regzbot introduced: e356d321d0240663a09
#regzbot summary: drm/amdgpu: lots of "MES failed to respond to msg=MISC
(WAIT_REG_MEM)" messages

#regzbot report:
https://lore.kernel.org/all/20240719204701.1605950-1-minipli@grsecurity.net/

#regzbot introduced: 27152bceea1df2
#regzbot summary: tracing: user events UAF crash

#regzbot report:
https://lore.kernel.org/all/n4jdkizinqfoztqn2cwv7uqqqnvkyu2xk32qebazqznh74b3d3@r23skt4k7mqe/
#regzbot dup:
https://lore.kernel.org/all/rrufondjeynlkx2lniot26ablsltnynfaq2gnqvbiso7ds32il@qk4r6xps7jh2/
#regzbot introduced: 1d717123bb1a7555

#regzbot report:
https://lore.kernel.org/all/26c01e3b726812979846710afcaab81e92da6a40.camel@declera.com/
#regzbot introduced: 0ddd2ae586d2
#regzbot summary: drm/ttm:  choopy youtube video on Ryzen IGP
