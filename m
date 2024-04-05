Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA22145B15
	for <regressions@lists.linux.dev>; Fri,  5 Apr 2024 08:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712304837; cv=none; b=Tw9/Sc3aQ38VZQ2ofrBF0sdJTpwQUERplNG1T3k24UOw37Fe7nT7Ae15o8HhoPUS5gQ0YFdoALY052H8qLI0031BR9kAYAQ9AZCWV3YXeR1+H8/Aqca5KXL1otvadxI8K9QuYI7358abouSwP5ZA/Wc/O3fY4oZayeTQMsLuPTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712304837; c=relaxed/simple;
	bh=aLcvOXrdCrqopfXqGq+WE4Bd9vEupxkZrmFX8Q7u6Ao=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TjscRNpGl31XuWjzr27O0QSOJgJspi1cDczWYC4/qVkAWPTxWoLgn7iBtWt/uYqlz2bJlCDXvyppRXUKG2VYhkTiijNMMlmsZ94ESeZHUf4WJwzQGWPxVjs0K5jzp2DgDuy5yEBBb5Q8rptSaLPz4e5WwL8UkYmFeBz8BKoHmwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=yj76Ra8A; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="yj76Ra8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712304835;
	bh=aLcvOXrdCrqopfXqGq+WE4Bd9vEupxkZrmFX8Q7u6Ao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yj76Ra8AXVginYgFPamjr/H/RiuVNbfSOwZkOKBzzXPhPzNHnlz4wjj9ikH/FalfY
	 bW26gpoPbGvIktS8C/gzeYZLVCxE+pHFLabtfOPcm7ycCXkX0NA8CdBcxusi8LIKuj
	 aYHfJssGT4q3Du2w9wQUlJi0toIFxnEyCyUaKIobe555F84jRhcVBBv4WpE/nEbJEg
	 WoUtiSEQTAolfzHoZ8yrqIQSQ3wUpbfxqnrpwpJh1/eA+89ThiSqjd+BdLEV3H0e0z
	 hG3mLljicyma/TuvQSP8ncUgbM4ZX80kI+5IqrDkBh/G40pln/1nHubYnFYV/Y8lSt
	 C4ZtdzaJoHC5A==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 22B2B378212D;
	Fri,  5 Apr 2024 08:13:54 +0000 (UTC)
From: Laura Nao <laura.nao@collabora.com>
To: tglx@linutronix.de
Cc: kernel@collabora.com,
	laura.nao@collabora.com,
	linux-kernel@vger.kernel.org,
	regressions@leemhuis.info,
	regressions@lists.linux.dev,
	x86@kernel.org
Subject: Re: [REGRESSION] mainline boot regression on AMD Stoney Ridge Chromebooks
Date: Fri,  5 Apr 2024 10:14:15 +0200
Message-Id: <20240405081415.15170-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <87cyr4ao79.ffs@tglx>
References: <87cyr4ao79.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Thomas,

On 4/4/24 22:05, Thomas Gleixner wrote:
> On Thu, Apr 04 2024 at 21:14, Thomas Gleixner wrote:
> 
>> On Thu, Apr 04 2024 at 20:06, Thomas Gleixner wrote:
>>> On Thu, Apr 04 2024 at 18:14, Thomas Gleixner wrote:
>>>> Can you please provide 'cpuid -r' output too as 'cpuid' does a few
>>>> tweaks to the raw data and it's hard to match it back to the code.
>>>
>>> Don't bother. I think I figured it out.
>>>
>>> Can you please test the patch below?
>>
>> Bah. Won't help. Let me dig deeper.
> 
> Can I get the /proc/cpuinfo output please?

Here are more logs from the same device running v6.8:
- cpuid -r: https://pastebin.com/raw/YmDrnw06
- cpuinfo: https://pastebin.com/raw/Ki0vwdDE

Thanks for looking into this!

Laura
