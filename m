Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51D7146A6A
	for <regressions@lists.linux.dev>; Mon, 22 Apr 2024 17:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713807404; cv=none; b=cAUBExnaZ4+Ocurn9hcrSnDbmU5Q/6RDzT4RR6G1FJ7P6dHVOtl+PTo4CNMOGuOr1vj9LNy4w+Fyww7lov+5TOGTdIbHnsbWWF2bMYSyE2fuO8c7AyzcsCBm6mu+wVrfq6nGsSA6MCZ4iT0b8yzblAx2fxjFr0Bx11VCohCPo44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713807404; c=relaxed/simple;
	bh=vEhSIZV8yNs0XvCMtgp081pKU7W6GeN8+b9ZbR0xHzw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=N8IqEtlLwLBnDOmCuX2lKVHyOeEMCBKfW6TQSbWE3J7A8RuoH1KPczG8M+C22dYugqJaJ1ikCQjJgDLQUdFiFblhlzvy+fqWx6S5wnxVI9Pmot3HrghJaeAu1uU3Pk59NPZi+FiNq1Vme0nMBrnkW6ratncRfnSaKCO1jXSqFmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=hWbFAGMC; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="hWbFAGMC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=vEhSIZV8yNs0XvCMtgp081pKU7W6GeN8+b9ZbR0xHzw=; t=1713807403;
	x=1714239403; b=hWbFAGMC0rjVZQBk1XOZxG7UYLwLjmLHbmjo99zQYgKqClgo5oFLE8+nSaIh4
	TCDsz2XQFruLOx8VoZY3kO0gr+NSwK2d7foLj2BUNUJoZQQYJJK4vJ2ji3dB9Of+tL00XDSXiVHK/
	XA87w9sMIlBRmS/rhXgw0xEl3dWxyQJndanpESyn8ASvDFz1hkY8o4Z3zxqVU8LAOjWFKrZjYdg+S
	IfT1J4F4kZvuf+EdUVcxprETW4/DXT9O6hHv3Hd72eHk9dFIyDJl8WfI3nme2EAXZmukqlKyLRfJ0
	nKEvzg3afFJTIPz/lYDREd4ARvIAJUG2y4sUfwvsaVfzZfR+IQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ryxar-00009r-2D; Mon, 22 Apr 2024 19:36:41 +0200
Message-ID: <03489993-9612-422f-b1d9-0ad5f62c0e98@leemhuis.info>
Date: Mon, 22 Apr 2024 19:36:40 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1713807403;43ee6386;
X-HE-SMSGID: 1ryxar-00009r-2D



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218740
#regzbot introduced: 6dbdd4de0362
#regzbot duplicate:
https://lore.kernel.org/all/dff8729b-3ab6-4b54-a3b0-60fabf031d62@intel.com/
#regzbot summary: net: e1000e: scheduling while atomic
#regzbot fix: e1000e: change usleep_range to udelay in PHY mdic access
#regzbot monitor:
https://lore.kernel.org/all/20240417190320.3159360-1-vitaly.lifshits@intel.com/

