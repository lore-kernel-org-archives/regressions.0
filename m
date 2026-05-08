Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F5C37CD52
	for <regressions@lists.linux.dev>; Fri,  8 May 2026 07:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778226848; cv=none; b=bfH1Gzpiz1aPRXpscKpPKqdqpRX4M3uEI4WhZVeyqXpnQYC6FsR4G+v171pF2rkTb1NyQu69U73NGlINY7swn9NxEUqjOr4b5gNz71hw5/PYLkqKJ8RrxUACserCF19jr6TdWZAy+z5z+4oFnKZFltOR4rpXdkvXtQ+uuNTFaDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778226848; c=relaxed/simple;
	bh=3D6N8Wqln8ocycX1adE6giaEuBVGW+rRoNbdeRSOO20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dEejfLvQCIrAIqyA1gArkZWeE8S/J9mmm0GYSwmGcCIQDYYnyYboSoh2cba5u8HPYUcZ99hYOq+tuVkChLMSP1IZ/6HGUAuzW0uowuBmGzRaPDs1NtkX8zDZfMCi7PoZOOjU13PdMCD7AhuupvKyK2q2fuANnCG3BLcKNW5hauE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=gq/Aw/AQ; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="gq/Aw/AQ"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4gBhFx6Z7jz46Pd;
	Fri,  8 May 2026 09:53:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1778226837;
	bh=3D6N8Wqln8ocycX1adE6giaEuBVGW+rRoNbdeRSOO20=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gq/Aw/AQhbKBQo7f9thR3MGnr/TvLMbHcRgBB6jsSFaOD1xDi5/gjAnR5BBQquEMb
	 7o4Byj3KFXgQQgDxntc+TBk0xpGqTDpAGZzpjN3dkkeznbEB1rIeV0MiJgZNNPIc89
	 vlIBagnIPthyielZq1wbh21XwxVAE3zERoMZTK1vH6PT7iwOQJPkbBZeDwZYHNFh6J
	 FpqP8C2QVm0UlB3VmThj+AdN15uSQ4axqeUtQZVO7/S8SGtYHRtpWOZCvMGflSMEPi
	 L0981F6PfpB+HXfzx8X5iGlPAcjKr4Oi+FkP2elaSNWzWSTPTeMg1p+dPiq489Fq7D
	 prPAVJzTIrXWg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4gBhFx5pz3z46Mf;
	Fri,  8 May 2026 09:53:57 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gBh9z5r9Mz8tjT;
	Fri,  8 May 2026 09:50:31 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id B3F6E60362;
	Fri,  8 May 2026 09:50:30 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <1c165caf-36b4-4673-97fd-ed86bef17b88@leemhuis.info>
Date: Fri, 8 May 2026 09:50:30 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: the stuttering regression in 7.0: should I have done something
 different?
To: Tony Rodriguez <unixpro1970@gmail.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>
References: <ffb44522-f01c-4be3-849d-27dc17fbca7f@leemhuis.info>
 <D5D19776-C809-4284-9417-F9A860877B98@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
X-Enigmail-Draft-Status: N11222
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <D5D19776-C809-4284-9417-F9A860877B98@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177822663106.2070279.10412447286703157782@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: B3F6E60362
X-NC-CID: 4ftG8n7JVwX25Kwhf7lvSCraAUHjMNZFmiG4BCHL/Pbk9cZl810=

[+tglx so he knows about it; details about the problem that Tony faces
can be found in https://github.com/sparclinux/issues/issues/79 ]

On 5/8/26 09:38, Tony Rodriguez wrote:
> I still don't believe this is fixed upstream as of v7.03 and v7.1-rc1,

Yes and no. It looks like d6e152d905bdb1 ("clockevents: Prevent timer
interrupt starvation") causes two regression.

Thomas fixed one with 4096fd0e8eaea1 ("clockevents: Add missing resets
of the next_event_forced flag") -- and feedback shows that it definitely
solved the problem for quite a few people. If that's not the case for
you, then you seem to face a different problem caused by the same
change. Happens, that's life sometimes.

Ciao, Thorsten

> only when my patch is applied does the SPARC74 S7-2 system become stable
> again. I also tested my patch with v7.04 and it works their as well.
> Will perform additional tests without my fix against v7.0.4 and v7.1-rc2
> later today to revalidate the regression (USA Pacific time).
> 
> Tony Rodriguez
> www.linkedin.com/in/unixpro1970
> 
>> On May 7, 2026, at 11:33 PM, Thorsten Leemhuis <linux@leemhuis.info>
>> wrote:
>>
>> ﻿On 5/8/26 07:51, John Paul Adrian Glaubitz wrote:
>>> On Thu, 2026-04-23 at 18:30 +0200, Thorsten Leemhuis wrote:
>>>> FWIW, here is the rough timeline of the regression, just to be sure we
>>>> are all on the same page:
>>>>
>>>> * The regression I'm talking about is caused by d6e152d905bdb1
>>>> ("clockevents: Prevent timer interrupt starvation") [authored:
>>>> 2026-04-07 10:54:17; committed: 2026-04-10 22:45:38; next arrival:
>>>> next-20260413; merged: 2026-04-12 19:01:55; v7.0 (2026-04-12 22:48:06)]
>>> [...]
>>> Tony Rodriguez from the SPARC community has observed the regression
>>> on SPARC as well
>>> and proposed a fix to address it [1]. Not sure whether he has
>>> retested on the latest
>>> commit of Linus' tree yet.
>>>
>>> Tony, can you verify that 4096fd0e8eaea1 fixes the issue for you?
>>>
>>>> [1] https://github.com/sparclinux/issues/issues/79
>>
>> It's likely a different regressions, as that report's title says that
>> v7.0.1, v7.0.2, v7.0.3, and v7.1‑rc1 are affected, which all contain the
>> fix, aka 4096fd0e8eaea1. Reporting in a new thread is likely best, as
>> the authors of the culprit are not even CCed here.
>>
>> Ciao, Thorsten

