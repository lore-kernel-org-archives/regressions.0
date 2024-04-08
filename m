Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA9A3BB22
	for <regressions@lists.linux.dev>; Mon,  8 Apr 2024 08:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712564439; cv=none; b=ptp3rPURw82hJjYIiJz3d4h2mqymyc0ftd2DZzM88jD/IkDnFuwuBiiiYEBJwuGJh7nLdJZ75x6UVBCqC9URYxvKtiZhUbEqCGNwKwsIjFydYPe/sVN1lYJ0eDoEWxtlS4ZMEBeuVAzrt3DsASJDismUQQz9D6fJiB2DvwzBhIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712564439; c=relaxed/simple;
	bh=6KcrIOycZ3UQaXDbv1ynZutea7vqMZldQFCg0ePvU1E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IlPLyVq+lM5Ir5u8ikeHUmb6s+8hFMtnJoCKwNlCESwVabdSI4YvdfDEqy4Bq1QsfPiUMaN00pawiiqvfV4KMLfOh8WxhlckPR78wBmG98jKR65eRXNRvBBE+4Ec5UwZZywoFAQhVm0wbRrqqZN4vfL0gAoR1G90knb4BWrm6JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lwMEQRfP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2gAX/aOT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lwMEQRfP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2gAX/aOT"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1712564435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gMVoXZYiIlU4ozo0MMikevpPJnSQyAU1xeiARptVQkM=;
	b=lwMEQRfPQrZHwqAmcMB4zNpJtkLi8QKVo1LTD3fkZGIpURL/vTWo+9kgfnEW1cv4kVfHzr
	Ze3Scqi//prSRq+m1VLRkfo89oq/Y/xSC9UrJBTUcCWKgSZ8BAdI5LFDw+9szCOHb0AOmw
	yr3DkRPJh35NxSaNFQvLXLuUECDnsGFxmEpkwD2UN6wdixnobDoR5u6ar9QBVTx5rWngD7
	lh2q8tdL/PNGhcR+8mnBhQZcOkZ+uahk4bjlZOJhcSivzp4Sm2/HyRiZMvPUJ9nrnriot7
	Wtugu9jamIGI4eli0RYeP5yAg66PT59MePdEj75w0QucKbX7JgbBn1IEVW17WA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1712564435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gMVoXZYiIlU4ozo0MMikevpPJnSQyAU1xeiARptVQkM=;
	b=2gAX/aOTReJ9BYRzukzs7x7HXkdrbC/ojll590P0SHoWe3KeuMrM0gwSI190xlkZrlKcoX
	KpZCGlL7nYVBSsDg==
To: Laura Nao <laura.nao@collabora.com>
Cc: kernel@collabora.com, laura.nao@collabora.com,
 linux-kernel@vger.kernel.org, regressions@leemhuis.info,
 regressions@lists.linux.dev, x86@kernel.org
Subject: Re: [REGRESSION] mainline boot regression on AMD Stoney Ridge
 Chromebooks
In-Reply-To: <87msq797pf.ffs@tglx>
References: <87ttkg7wvg.ffs@tglx>
 <20240405135837.306376-1-laura.nao@collabora.com> <87msq797pf.ffs@tglx>
Date: Mon, 08 Apr 2024 10:20:34 +0200
Message-ID: <87zfu46zal.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Laura!

On Fri, Apr 05 2024 at 16:59, Thomas Gleixner wrote:
> On Fri, Apr 05 2024 at 15:58, Laura Nao wrote:
>> On 4/5/24 15:38, Thomas Gleixner wrote:
>>> 
>>> Can you please boot a working kernel and provide the output of:
>>> 
>>> # rdmsr 0xc0011005
>>
>> # rdmsr 0xc0011005
>> 2fabbfff2fd3fbff
>
> Ok. So the CPU does not advertise FEATURE_TOPOEXT which is consistent
> with CPUID.
>
> Now I'm even more puzzled because then the patch I gave you should make
> a difference. I need to run some errands now, I will provide a debug
> patch later this evening.

Hmm. No real good idea yet.

Can you please checkout

    c749ce393b8f ("x86/cpu: Use common topology code for AMD")

and apply the patch further up in the thread and see whether that
boots. We'll take it from there.

Thanks,

        tglx
