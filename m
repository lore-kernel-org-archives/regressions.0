Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2507443AB7
	for <regressions@lists.linux.dev>; Fri,  4 Sep 2026 15:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535384; cv=none; b=piVBfHE1OXfjiBtcDuoYlgjWqVLAmEZpwG98Fch082ZI/N8ds+KXa5nwdxitzU6XKgM+dN8JN3mj+PfOVSl0Y7XBjdXWeLbiwscLeB6p+vsPICz8nfVhDJU01la6gS8sm3Dxrhxprx85kMllFRJZWNQ9DFXO/uW4A7kEEmZhlQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535384; c=relaxed/simple;
	bh=nxI97ubcEM5+2BBS4utR3zx7Wwf4emiSTt1Vf7EV6EU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ier08k3bgW9/PXTbXwUydbNj0j+PADjVsKZ52EPhaL4zHjtJA1AW7IBZPFwPvo3HTmYQuHte8pHeCSddbrihiz15MTmhU2ZH21SecHsOye8AGEgbGAZDwq+ML0hs1be89Mnz0mCi4Vmslvmgm3bEb/0R26P0cg05/kCx+c54+to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=CS8zyAGO; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="CS8zyAGO"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hc0b13zTjz9MW5;
	Fri,  4 Sep 2026 17:22:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1788535373;
	bh=nxI97ubcEM5+2BBS4utR3zx7Wwf4emiSTt1Vf7EV6EU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CS8zyAGOP9LXa05GPpn9Vq1he1xRlR/5ZxoiFbeciZjmClL3Xcr1Ow8oTETujBzml
	 RN57ezgBln53pwYuG0ZGfFNwsN1IJFKdYsJ/I/R4PtYVyY9VaZHhHUxRGFIqYgv/60
	 UUXGGQR73bzVi4E4LdONz8HkaFND4h6JQZ40egYoyEUSmnBkBhJgCleo7fNODJIiTC
	 r2RSOBv2I10GYgJUvVin7pqTrcaDhkHKX9m2NMsm8O3P0/ks5HDXI7BtHRRY3oetxS
	 /gzgwzKQ4nEuY3Vrobi+eoDJFvjkbawSXrYztgOHG4fTM8FICGScP/t39z7CK+PP2F
	 DJMoqo95Dq4Ww==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hc0b13HR1z7xH9;
	Fri,  4 Sep 2026 17:22:53 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hc0b00M77z8sgw;
	Fri,  4 Sep 2026 17:22:52 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 276FA5FAB5;
	Fri,  4 Sep 2026 17:22:47 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <10138a14-a7c6-424e-950e-c1e5f878beac@leemhuis.info>
Date: Fri, 4 Sep 2026 17:22:46 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Power9 pseries boot hang in v7.2-rc6, narrowed to
 PowerPC GENERIC_ENTRY conversion window
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, LKML
 <linux-kernel@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <96dae110-f79b-4e54-8a9b-514369019b5d@linux.ibm.com>
 <e27eeaf4-c2c9-4ef7-9e1c-0a5fb45755d0@linux.ibm.com>
 <6d1b5f38-f4e4-46ca-88b4-7c18dd6c6280@linux.ibm.com>
 <anq72IebDSu-wWbb@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <ansZjSJMWMV8DDF-@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <2f7e6c34-7258-4b20-a38e-cedebccb835f@linux.ibm.com>
 <985770a7-e488-456a-a9fa-aa71f1cbafd5@leemhuis.info>
 <appZ1UB1tzKz3IY9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <appZ1UB1tzKz3IY9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178853536760.332824.6991298509015054257@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 276FA5FAB5
X-NC-CID: o/w1lT5fDgOK6gXaBrvPIBFhIb+UL7T+sDpvHEat68+j6lsB9MY=

On 9/4/26 07:43, Mukesh Kumar Chaurasiya wrote:
> On Thu, Sep 03, 2026 at 01:22:35PM +0200, Thorsten Leemhuis wrote:
>> On 8/12/26 07:16, Venkat Rao Bagalkote wrote:
>>> On 11/08/26 6:16 pm, Mukesh Kumar Chaurasiya wrote:
>>>> On Tue, Aug 11, 2026 at 11:37:45AM +0530, Mukesh Kumar Chaurasiya wrote:
>>>>> On Mon, Aug 10, 2026 at 05:19:27PM +0530, Venkat Rao Bagalkote wrote:
>>>>>> On 04/08/26 8:23 pm, Shrikanth Hegde wrote:
>>>>>>> On 8/4/26 2:04 PM, Venkat Rao Bagalkote wrote:
>>>>>>>>
>>>>>>>> I'm seeing a boot regression on a Power9 pseries LPAR. The system
>>>>>>>> hangs very early during boot after:
>>>>>>>>
>>>>>>>> Quiescing Open Firmware ...
>>>>>>>> Booting Linux via __start() ...
>>>>>>>>
>>>>>>> That is strange. not sure where to look at without any logs.
>>>>>>> Is it a specific config that fails or this specific LPAR that fails?
>>>>>>>
>>>>> Is this a specific lpar or all power9 pseries are exhibiting same
>>>>> behaviour?
>>> Its specific to a lpar.
>
> I am working on this, [...]
Great, thx.
> Can you also confirm the same.
Na, sorry, can't help, I'm not affected, I'm just keeping an eye on
regression to ensure they are fixed.

Ciao, Thorsten
