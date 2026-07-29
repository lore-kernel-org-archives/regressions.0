Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDB043CEF7
	for <regressions@lists.linux.dev>; Wed, 29 Jul 2026 08:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785315491; cv=none; b=m9rx8N8vaMRNiuGIuM9l7PcJChlDf8RngKUJymu63cu7YmLQVi5LsBpA49/+OdIBIk6Bb+yfMtfeW2VxJvAzpMoB2hBu5TAVaOLwgRci+GeMopisqdNBDRH3zdVTt+2khSvi0/ST9hQgWCWEEN+O5KyoY6eSD7Qoj5t8HqittC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785315491; c=relaxed/simple;
	bh=D7B3256nWbk1QykNJ2FhVMKZhQ1ZVjkrsICNSqbiOt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YWZzD4au912NnwCLepyZyVaKnH+LWqIxlo+NoCyzqEBPRJG+Z/q12yRr5KMoFs96G2KPY5ayXHr/bB1ThNtc/Mr2PJhBzQ1RgxYmtgV04zxeKXO/nbBpsUIHA1fQmB8Tr54BlQ4VlIJRZUj3K/IgdQF5WHhT3ron80UVQlXZC3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=PJXsGXOL; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="PJXsGXOL"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4h95nx4p0Dz4PbB;
	Wed, 29 Jul 2026 10:57:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785315477;
	bh=D7B3256nWbk1QykNJ2FhVMKZhQ1ZVjkrsICNSqbiOt0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PJXsGXOLov7aS6bmxA3ZAhd9E8hJSEibBhuzrM5wt5GFKgc2TqpUb1p6jy20rLCnC
	 Z9Rxz6qGR5r+AAkFm23D36b+cL9jd/4wn0WeRpVGsozsGQW0Cghgq3fPqLqQvpsrKo
	 AvvMgZxVm89xhSd9tgOpU2UDbsXR1E3nQC7PcKbDSFa30XY6nQer698C6CJ7apn/Un
	 8pjI7U+pmQK6zg1a2aZ6hw+PwwzfuFLfCaFfQGWNPhwj0VOD2CxQSUf6Fn5VGjt4n+
	 s3s1xnto+FJC791dKnSaLHi1cmTgUhDLKL/lrBMjCyQPsRR+GQG+pCA17U2WWHGF01
	 wdKA2yszP76tw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4h95nx44Jgz82CC;
	Wed, 29 Jul 2026 10:57:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4h95nv4cXnz8tYZ;
	Wed, 29 Jul 2026 10:57:55 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 264615FC5F;
	Wed, 29 Jul 2026 10:57:54 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <67fd0bdf-237e-41d0-aa02-62ca2736942a@leemhuis.info>
Date: Wed, 29 Jul 2026 10:57:53 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/970: fix nap return address corruption on async
 interrupt exit
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com
Cc: thuth@redhat.com, "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 mchauras@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 ruanjinjie@huawei.com, linux-kernel@vger.kernel.org,
 Andreas Schwab <schwab@linux-m68k.org>,
 John Ogness <john.ogness@linutronix.de>, chleroy@kernel.org,
 sshegde@linux.ibm.com,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260707172430.790040-1-mkchauras@gmail.com>
 <87fr1iq4fu.fsf@jogness.linutronix.de> <87h5lpq5x4.fsf@jogness.linutronix.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
X-Enigmail-Draft-Status: N11222
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <87h5lpq5x4.fsf@jogness.linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178531547470.3920696.1454003865760787024@mxe9fb.netcup.net>
X-NC-CID: ZM4BlkQm5JePw8eJDR5zuLxW+OLloQN2cipqRUaupCL2ugjiY2g=

On 7/23/26 13:52, John Ogness wrote:
> On 2026-07-16, John Ogness <john.ogness@linutronix.de> wrote:
>> On 2026-07-07, "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com> wrote:
>>> On PowerMac G5 (PPC970, CONFIG_PPC_970_NAP) the system panics shortly
>>> after boot with symptoms including instruction fetch faults, kernel data
>>> access faults, and stack corruption, predominantly on SMP and always
>>> somewhere inside softirq processing.
>>> [...]
>>> Fix this by calling nap_adjust_return() inside DEFINE_INTERRUPT_HANDLER_ASYNC
>>> immediately before irq_exit_rcu(), ensuring _TLF_NAPPING is cleared and
>>> regs->NIP is adjusted before any code that can re-enable interrupts or
>>> invoke softirqs runs.  Move the explanatory comment into
>>> nap_adjust_return() itself and remove it from arch_interrupt_async_exit_prepare().
>>>
>>> Fixes: bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature")
>>> Closes: https://lore.kernel.org/all/87wlvazrdy.fsf@igel.home/
>>> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
>>> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
>>
>> Tested-by: John Ogness <john.ogness@linutronix.de>
> 
> Is there a reason this is not being queued for 7.2? Without this fix,
> PPC970 machines cannot boot 7.2.
Wondering the same. Quick reminder: Linus afaik wants all regressions
ideally be fixed by -rc6. So it would be good to get this mainlined
within the next few days -- unless of course there is a reason why this
fix is a bad idea. Is there?

Ciao, Thorsten
