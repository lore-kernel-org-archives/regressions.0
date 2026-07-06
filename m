Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9164192EF
	for <regressions@lists.linux.dev>; Mon,  6 Jul 2026 11:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783338495; cv=none; b=sEBhecMLXX6p70YonKDurmxdKgb/HWvmT9jLiw9OUJTK3sgpqSNH4DFHSBbPEb+ZlHNBvGCNulHvSCBX0AFOl+noWwScXysxkX/MHdHF54ZsCW+jC7jIKJcqZYIC6T/3h5AVL0oEzDX5TtmDodvKBwRUzLULzxgS14cqf2fCTd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783338495; c=relaxed/simple;
	bh=zBkLLIhXPB445yOtRFvwuK7LgY4CQrx+BNGUiCxwENA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EL1N9Kb/EcBM9lMxDtxmZFvyWJYP7cK9U8VOiitmAzooF+sOlrQqVu+VG1lvSEkDDtvzk07TMrbhDxGZ4pXoqjhVmJ0CI6kojX3MFunXWjO+8bZ7bjAHynoG+jg7Vn5jbO1EkaE+h7qej4q0FdG30Uy197m81F2eLWHRTk6Oi/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=liwJ8LeM; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="liwJ8LeM"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4gv2f11fTQz85pv;
	Mon,  6 Jul 2026 13:47:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1783338441;
	bh=zBkLLIhXPB445yOtRFvwuK7LgY4CQrx+BNGUiCxwENA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=liwJ8LeMLvl63R8G/Phc9TLFr8GbsxHwnq1Vsk0zFrkX5hWZruyjE0fAraIDg9h5x
	 63Oniogs6swRFbNW368hKQQAb1RCA5KIB9jMJCBU1oFP1aKoA+AT450GMEvPT+8+ma
	 nn77Csl7FuQfELlm5+60XqR7UTz/bwx+colbc6UQ/UzoEK9yF4vsLMb91PTcwraubH
	 rPaJ9sRie+2K0qgHjWWl8mpH3+4O88E4RDSg6+wj2d2pEkI8b5Vx0lxtej/V2mc2pv
	 57hZZ6KmwGTwiIqAb6IETYFi7ojhX+xIwvl3/KCN8Td9pmFVG8DGUoror6FM/KD9YE
	 YOokUU5Xz5sNg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4gv2f10xMHz4x8g;
	Mon,  6 Jul 2026 13:47:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gv2dy5dHvz8tb6;
	Mon,  6 Jul 2026 13:47:18 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 1D08D603ED;
	Mon,  6 Jul 2026 13:47:18 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <19b188be-5f81-4f87-b29a-e4ac1e55221e@leemhuis.info>
Date: Mon, 6 Jul 2026 13:47:12 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8] dies
 on resume from suspend
To: Michal Pecio <michal.pecio@gmail.com>,
 Martin Alderson <martinalderson@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: 
 <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
 <CA+_z3hRTD-QAgv3jZhOZUUPA0sNZ8946jfYwYsZ=RnQJ0LG7cw@mail.gmail.com>
 <20260404152438.582f0451.michal.pecio@gmail.com>
 <CA+_z3hTMfggtv+u_A_SRyb2FRzVjm=Nav5NRCTuhmEthb8x0jw@mail.gmail.com>
 <20260509180603.6f67c9d8.michal.pecio@gmail.com>
 <CA+_z3hT_n09fAszT+DkoTHLzracB7fQZwkiiTxGGBJxhFcD8hg@mail.gmail.com>
 <20260512120334.4eef3d0b.michal.pecio@gmail.com>
 <fc2d9862-6c46-4161-8fd5-68b9e6c2e8bb@linux.intel.com>
 <CA+_z3hRdXfZm2ziCmsXEDEY-i8XJjxnw2oe6mkTf+O+B0fx91A@mail.gmail.com>
 <20260529001057.1e0403c4.michal.pecio@gmail.com>
 <CA+_z3hQF-EGKr11Yaa5vwMLt9TUB1mL9ESUAQU5Rnd=UZDXrBQ@mail.gmail.com>
 <20260529122210.6d2c5543.michal.pecio@gmail.com>
 <CA+_z3hSMRvW6qhZ4wB54hQyY89z+Mm0C48MGA40aqG7_+spX2g@mail.gmail.com>
 <20260530005742.25893efa.michal.pecio@gmail.com>
 <CA+_z3hS4sdnZAhAvO+dDTR9hZVwGudDrsw93Do6dZkva8vK=5A@mail.gmail.com>
 <20260613112648.2ea61301.michal.pecio@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
X-Enigmail-Draft-Status: N11222
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <20260613112648.2ea61301.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <178333843841.779304.13391473225227574653@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 1D08D603ED
X-NC-CID: 0k2v2v1nHJ9BdsVVGeCC4InzGX8k12LJIuX7upIOr3/RW0TfbaU=

On 6/13/26 11:26, Michal Pecio wrote:
> On Sat, 6 Jun 2026 14:12:22 +0100, Martin Alderson wrote:
>> So the ordering that kills the controller is:
>>
>> 1. dj work issues a control SET_REPORT on ep0; the URB lands on the ring
>> 2. usb_suspend_both() → usb_suspend_device() drives the port to U3
>> 3. only afterwards does usb_suspend_both() set udev->can_submit = 0
>> and call usb_hcd_flush_endpoint() (drivers/usb/core/driver.c) — and
>> that flush unlinks the still-pending ep0 URB
>> 4. xhci issues Stop Endpoint to an endpoint on a U3 port → 5s timeout → HC died
>>
>> That matches the trace exactly: the "Cancel URB ... ep 0x0" appears
>> after "Set port 7-1 link state ... U3", and the debugfs command ring
>> shows the single stuck Stop Endpoint TRB (slot 1, ep 1).
> 
> Makes sense. And good point about usb_hcd_flush_endpoint() - if this
> gets stuck then usb_suspend_both() can't complete, which explains why
> the HC still isn't suspended either.

Was this regression ever resolved? Looks a bit like this fell through
the cracks, but I might have missed something.

Or is that no regression at all? From the initial mail in the thread is
sounded like one, but it was never bisected afaics.

Ciao, Thorsten

>> I had Claude patch the driver and this seems to fix it:
>>
>> --- /tmp/hid-logitech-dj.orig.c 2026-06-06 14:08:26.580516662 +0100
>> +++ hid-logitech-dj.c 2026-06-06 13:42:15.702948099 +0100
> 
> Improving HID drivers is one thing (which should be discussed with HID
> maintainers - see Documentation/process/submitting-patches.rst), but
> other drivers may behave similarly and it would be nice if this didn't
> crash xHCI controllers.
> 
> While URBs on a suspended device are weird, it turns out that xHCI
> spec (4.15.1) doesn't prohibit that, it only says that endpoints should
> be stopped. Which they are - problem happens when we try to stop again.
> I'd expect such a command to simply complete with Context State Error,
> which it does in my tests on different HW, but yours gets stuck.
> 
> I'm not sure what specifically triggers this failure - is it stopping
> a stopped endpoint always in general, or only after using the SP flag,
> or on a device behind a suspended root port, or something else.
> 
> Would you mind testing some patches? I'm thikning about reordering
> things in usb_suspend_both() so that URBs are flushed before suspending
> the port, or investigating what exactly breaks your chip and adding
> some workarounds. We don't need to stop a stopped endpoint, we could
> proceed immediately to Set TR Dequeue, but it's uncertain if your HW
> would accept that.
> 
> BTW, you initially stated that this happens on the first suspend after
> new boot, but are you sure that it can't happen later? This would make
> it possible to test patches by suspending repeatedly until failure.
> 
> Regards,
> Michal
> 

