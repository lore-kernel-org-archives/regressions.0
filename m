Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAF7664B3
	for <regressions@lists.linux.dev>; Tue, 20 Feb 2024 11:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708428034; cv=none; b=Zq2dx1HyNZ65/f6lNjsAmOnkyHKYAx8vYryr8HQ0va6vWWy8uoAtd24W6qEQXV9VeuRbp4xghBk+JgPea+D3NNHerL+Rpo0/Vs5ZR07oEm906vuGKG4RtpVXsgQZ947ZEaXvehnfMjvAi+ZsuTwPv012meMAtSfxxo/6VF2Dlx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708428034; c=relaxed/simple;
	bh=b/iVUzmAcIEE7O3HVV9fh4ZYnPEE741MdSszqZZKwUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bB53a4EsNuWRhb2Qk1EOBLxhhN2Q5Giz52bTFRaAMQ0k5S1G0VYEzwo+k4Q5KGPduMO9wTEegIJZ82C0G/0ay4Aam3WChkNcsx5ZcWrXjp92xCrOwNwlPknW29PIzR7MhIhoWw92l3CVlQNW/2CSUV++TUUUBJRBSRX0zJj3uKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rcOAi-0004rl-E0; Tue, 20 Feb 2024 12:20:24 +0100
Message-ID: <79b5c364-d3c2-4e9e-8431-66fee783fe0c@leemhuis.info>
Date: Tue, 20 Feb 2024 12:20:23 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel 6.7+ broke under-powering of my RX 6700XT. (Archlinux,
 mesa/amdgpu)
Content-Language: en-US, de-DE
To: regressions@lists.linux.dev
References: <ae64f04d-6e94-4da4-a740-78ea94e0552c@riadoklan.sk.eu.org>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ae64f04d-6e94-4da4-a740-78ea94e0552c@riadoklan.sk.eu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1708428032;5e9e670b;
X-HE-SMSGID: 1rcOAi-0004rl-E0

On 17.02.24 14:01, Roman Benes wrote:
> Minimum power limit on latest(6.7+) kernels is 190W for my GPU (RX
> 6700XT, mesa, archlinux) and I cannot get power cap as low as before(to
> 115W), neither with Corectrl, LACT or TuxClocker and /sys have a
> variable read-only even for root. This is not of above apps issue but of
> the kernel, I read similar issues from other bug reports of above apps.
> I downgraded to v6.6.10 kernel and my 115W(under power)cap work again as
> before.
> 
> Please bring the low range back as efficiency vs power consumption is
> significant(links were not allowed, I posted in reddit's Linux sub about
> it and I am going to gitlab's drm/amd as well, but its like 90W and <
> 10% performance tradeoff).

#regzbot ^introduced 1958946858a62b
#regzbot link: https://gitlab.freedesktop.org/drm/amd/-/issues/3183
#regzbot link: https://gitlab.freedesktop.org/drm/amd/-/issues/3137
#regzbot title drm: amdgpu: under-powering broke

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
