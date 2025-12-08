Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A861C84D7
	for <regressions@lists.linux.dev>; Mon,  8 Dec 2025 14:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765202427; cv=none; b=gcpLFraKvRdAoplFBydvKm7lyior73pJAlG3CSQ09Rm/VU24ATH3UYy/AlRXV2UamlmsuPj6mkiXRK9nMNGBKVNsqqV7DlF5k42szZMUJV/1Z/fpcTYqomY932ARlBcFhAPEOa5H/gyMNt8+7givNl5Ye+xi35xPPBExbJvRNNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765202427; c=relaxed/simple;
	bh=bxuqJ28I/B8SLXe8L1n/sywUzU2JnloOZwMPqPsidbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=SJS/UVCAmGpdaGSYiZNNsWJqIPpOB5CPqBPXfzoPuUW/bjUP43Oer8q1db4m8V7KC49LCIBnCDP+R7gw7BezHVKqv/tVKZ5d5fMDaEHFSSAIrsjjYSn4RD8Gl8yVaMPCZhrFD4S8suaVTFQoFoci8ySkCvXMgrKDHUUMr1mcwac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=P1AciFf4; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="P1AciFf4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=dmnjpWrO9kSNnBaL0EvH+ob4B1yZU4VzG/XzuYR+q50=; t=1765202426;
	x=1765634426; b=P1AciFf45ld+KWwr2t29WKQhleZ2w5e6u+wZvr3CXHN8sno50j9F+kQBhBjdm
	j53u9FzjXgXXu6BDYG/sQQrkBT2uTYEpLYdaoLeX8tkAqBKM4uX8hFtc5QrjCCCHFaOpFO1aw+xkZ
	rYik0UtrFY2iErw9WcZX4McuIE2C7VeVFaz1XEj9Sa1zLrCyjwRBLBS/qbjlY0O6jE/oaLpSc4ORa
	Ry5CyOLjwcy8+Ye4OJWm5+b7SVmeyEF+ZuFyltlkqboH/UMkCd1ZqFcUATPCFn38FupKQXLtgbinO
	H1PvtzqeRqRTdC/buHmCLhTJNpyCj0l+mWOS1W1eLWcPrFseEQ==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vSbmq-004Q14-1O;
	Mon, 08 Dec 2025 15:00:24 +0100
Message-ID: <04cabb57-04aa-4945-8f65-593377bd3b95@leemhuis.info>
Date: Mon, 8 Dec 2025 15:00:23 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in how user space handles the Widevine Content
 Decryption Module (firefox and maybe others)
To: Dave Morgan <d_a_morgan@hotmail.com>
References: <LOBP302MB229140293C531C0E0A93E20CD2D2A@LOBP302MB2291.GBRP302.PROD.OUTLOOK.COM>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
In-Reply-To: <LOBP302MB229140293C531C0E0A93E20CD2D2A@LOBP302MB2291.GBRP302.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1765202426;3a050230;
X-HE-SMSGID: 1vSbmq-004Q14-1O

On 11/22/25 17:53, Dave Morgan wrote:
> Userspace handles decryption fine up to linux-6.17.8, but fails in decrypting Netflix content using firefox for all rc versions for linux-6.18.0-rcX.
> 
> Thanks for looking into this, and my appreciation to you all for your work.

Hi! Thx for the report and I apologize for the late reply.

Is 6.18 final also affected? And when you say "up to linux-6.17.8", does
that mean that 6.17.9 is affected? And what kernel GPU driver do you use?

Note, 6.17.y is EOL in a few days, so the issue is unlikely to get fixed
there.

Ciao, Thorsten
