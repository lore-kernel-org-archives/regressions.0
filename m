Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D6721CC59;
	Thu, 20 Aug 2026 04:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787198452; cv=none; b=otZzbtNvyj6tw3VXgYc7DQN9kaxnqJDyak8b2sgs28J0ADk8lqPzAvW8eLz1hb4u9pbLfEWylmlyyidMBgCA+OctTLhEETjjHK/lpkfNvLeCr8iUi5f3s1VU2AXEQlppxobi8lX8vpFO6+YzJbI3ysT11umMnQpr97ov2hZuC9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787198452; c=relaxed/simple;
	bh=CliyQUCro3WWMX9aKG/knb2BvJolkyg7neVJ69vctWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uABpP7mOEvtfYM3Cp2nZu32MdRNML1GGADdrmao2Jiq2XM3Dj5KGNQaROusrI+eczTEVHe7E1UYBTk9eBqJCjRMeQI/glzMseSlNlaGQKSwlK3/ptvGAfXf4dcm5q85gcNkrKPl0r6CT+/tuDGuc1HoZdUH2lcS3zXREQmXWFLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=YM87030T; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="YM87030T"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4hQV6x4pFbz3yZD;
	Thu, 20 Aug 2026 05:59:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1787198345;
	bh=CliyQUCro3WWMX9aKG/knb2BvJolkyg7neVJ69vctWg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YM87030Tj0xV2jPaqMrp32mukVHFS/5AuzJEUZzXxAviMbj7jyK9EhabN6Gwh/rWB
	 UZ8iot9HRbQ3O0iFB4TupBPEu0QMtuCNfNkJ8sPUDDGQUlQD8BrAWP99cZj8AiaXV4
	 +CnG60lRxPOmd6Li1w3rrQjUOHRkzg43m9j3ygUg/IjKUMTig+RR/6BN9bBL6mAipu
	 SCk4P8ct11WLBhUqGBhLMJjidTTPCLXSV5q+sPN8eB+dWNu6o5lCfZPTMf6L72EUsn
	 OrFkqDaM1LHNcYfeZJhxMKLb7E0g2JKjl+zSUrsqUBoO+Nc4Px0K1Hjo6sQtwszgFN
	 /gZA7Gk3MRvng==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4hQV6x2LSKz3yYM;
	Thu, 20 Aug 2026 05:59:05 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hQV6w4KFGz8svG;
	Thu, 20 Aug 2026 05:59:04 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id ABC785F8E8;
	Thu, 20 Aug 2026 05:58:59 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <040a9b66-c299-4e57-8250-14480e298e60@leemhuis.info>
Date: Thu, 20 Aug 2026 05:58:58 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mainline/master: (build) in
 arch/arm/kernel/entry-common.o (/tmp/kci/linux/scripts/Makefile...
To: Nathan Chancellor <nathan@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, regressions@lists.linux.dev,
 laura.nao@collabora.com, shreeya.patel@collabora.com,
 Mark Brown <broonie@kernel.org>, kernelci-results@groups.io,
 kernelci@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
References: <178701474442.5156.12765087253678603047@kernelci.org>
 <c9ba4aeb-a288-4597-b13a-9da55666f96a@leemhuis.info>
 <CAKwvOdkcCnhM-395QVriu3hnjmtX1H-3i_1tU5Jpb1Ybr2Q77g@mail.gmail.com>
 <20260818165116.GA1335107@ax162> <20260818175209.GA1675024@ax162>
 <e5c6c56c-b0e2-4950-996a-4f9321a1a57a@app.fastmail.com>
 <20260820000900.GA3034882@ax162>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20260820000900.GA3034882@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178719834013.1949881.2449875283920977510@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: ABC785F8E8
X-NC-CID: uvFPIFAHKl7P9wkqPg6T1YNeAdbkhcFdT7pgHAKn5cx37pmUNYg=

On 8/20/26 02:09, Nathan Chancellor wrote:
> On Wed, Aug 19, 2026 at 11:08:39AM +0300, Ard Biesheuvel wrote:
>> We're falling back to the mov_l asm macro in this case.
>>
>> This is unfortunate, because the only reason to avoid these group
>> relocations is making allyesconfig work, now that LLD has caught up.
>>
>> I did not manage to reproduce this, but if this is something we care
>> deeply about, we might tweak mov_l as below when COMPILE_TEST is set,
>> so that the literal pool is always in range.
> 
> I am not sure that we do, at least currently, since Arnd's patch to turn
> off OABI compat for everything but StrongARM has now landed in mainline,
> getting rid of the originally reported error.

Grea. Nathan, Ard, many thx for looking into this!

> If this error comes back, we could look at a better fix.

+1 -- not sure, but even that might only be worth it if more than just
one CI runs into the problem in a particular test case.

Ciao, Thorsten
>> --- a/arch/arm/include/asm/assembler.h
>> +++ b/arch/arm/include/asm/assembler.h
>> @@ -636,6 +636,12 @@
>>         .macro          mov_l, dst:req, imm:req, cond
>>         .if             __LINUX_ARM_ARCH__ < 7
>>         ldr\cond        \dst, =\imm
>> +#ifdef CONFIG_COMPILE_TEST
>> +       /* The literal may go out of range in pathological cases */
>> +       b               .L\@
>> +       .ltorg
>> +.L\@:
>> +#endif
>>         .else
>>         movw\cond       \dst, #:lower16:\imm
>>         movt\cond       \dst, #:upper16:\imm
> 

#regzbot resolve: commit 25900bd99d4d avoids this error by disabling
CONFIG_OABI_COMPAT for allmodconfig
