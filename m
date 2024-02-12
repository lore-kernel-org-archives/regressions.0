Received: from 7of9.schinagl.nl (7of9.schinagl.nl [185.238.129.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C3D5235
	for <regressions@lists.linux.dev>; Mon, 12 Feb 2024 12:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.238.129.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707740838; cv=none; b=sl9QeYTgE9x+ygazABOHKMNG/wFdyGIJrwE0iu6kGuEjJgbtScKJm38FcRKKe6JM8NNGLRt8zqi9/QEav/eXph1S0d45al+gtwRvICYpfoKdyzqW4jnLUBP82bs4xLzCZANDhsvXw1HzFpuYJjh+caGAVjbfUFQ1x9OqgBjHcGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707740838; c=relaxed/simple;
	bh=UStRlN2g3m+/l2GbYV2Gl82VNQ9V/YiNiuZEeZuEocw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WRjbdyDjSwQSkE9j5qFIajNPheO1b8bwcyWCXpmCnQwo85GNaOtvmUZABJdxfCYqHU1ACbN+a6V8n4ydIvUVNHF9m6MDjB717GGbbkyTgAFLFMgZ+Il/z06dYZ6obZKR0tOKREstjJPIQbkGjPAZkZexJpYuxmO6cNWG5mVXllk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=schinagl.nl; spf=pass smtp.mailfrom=schinagl.nl; dkim=pass (1024-bit key) header.d=schinagl.nl header.i=@schinagl.nl header.b=CktyQ5xj; arc=none smtp.client-ip=185.238.129.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=schinagl.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schinagl.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=schinagl.nl header.i=@schinagl.nl header.b="CktyQ5xj"
Received: from [192.168.60.206] (unknown [109.109.108.68])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by 7of9.schinagl.nl (Postfix) with ESMTPSA id A2E7D19B7995;
	Mon, 12 Feb 2024 13:27:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=schinagl.nl; s=7of9;
	t=1707740833; bh=UStRlN2g3m+/l2GbYV2Gl82VNQ9V/YiNiuZEeZuEocw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CktyQ5xjb8F/F5XwKgft0U7YMbqoAxqbkfD2QK7UOAV6U1vUnkSRZZ/WsjjttyQK6
	 hbpguXkufzun8S6BLQoyE8jVxhtqG0FO2PjLfnRXrzN01xHyyAguXquh7G6Cn5A6v1
	 ZYYYKOgfbNBHboFGmnT7ABNILEQKLwmQQ6IUCE6I=
Message-ID: <abebfff8-5c92-45c6-b828-9bf563e8f0f7@schinagl.nl>
Date: Mon, 12 Feb 2024 13:27:13 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Fix NULL pointer dereference in
 tb_port_update_credits()
Content-Language: nl
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>, Lukas Wunner <lukas@wunner.de>,
 Andreas Noever <andreas.noever@gmail.com>,
 Gil Fine <gil.fine@linux.intel.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <20240212115132.2630125-1-mika.westerberg@linux.intel.com>
 <0172d016-0421-4671-822e-262b2ebfc636@schinagl.nl>
 <20240212122548.GX8454@black.fi.intel.com>
From: Olliver Schinagl <oliver@schinagl.nl>
In-Reply-To: <20240212122548.GX8454@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12-02-2024 13:25, Mika Westerberg wrote:
> On Mon, Feb 12, 2024 at 01:15:18PM +0100, Olliver Schinagl wrote:
>> Hey Mika,
>>
>> On 12-02-2024 12:51, Mika Westerberg wrote:
>>> Olliver reported that his system crashes when plugging in Thunderbolt 1
>>> device:
>>>
>>>    BUG: kernel NULL pointer dereference, address: 0000000000000020
>>>    #PF: supervisor read access in kernel mode
>>>    #PF: error_code(0x0000) - not-present page
>>>    PGD 0 P4D 0
>>>    Oops: 0000 [#1] PREEMPT SMP NOPTI
>>>    RIP: 0010:tb_port_do_update_credits+0x1b/0x130 [thunderbolt]
>>>    Call Trace:
>>>     <TASK>
>>>     ? __die+0x23/0x70
>>>     ? page_fault_oops+0x171/0x4e0
>>>     ? exc_page_fault+0x7f/0x180
>>>     ? asm_exc_page_fault+0x26/0x30
>>>     ? tb_port_do_update_credits+0x1b/0x130
>>>     ? tb_switch_update_link_attributes+0x83/0xd0
>>>     tb_switch_add+0x7a2/0xfe0
>>>     tb_scan_port+0x236/0x6f0
>>>     tb_handle_hotplug+0x6db/0x900
>>>     process_one_work+0x171/0x340
>>>     worker_thread+0x27b/0x3a0
>>>     ? __pfx_worker_thread+0x10/0x10
>>>     kthread+0xe5/0x120
>>>     ? __pfx_kthread+0x10/0x10
>>>     ret_from_fork+0x31/0x50
>>>     ? __pfx_kthread+0x10/0x10
>>>     ret_from_fork_asm+0x1b/0x30
>>>     </TASK>
>>>
>>> This is due the fact that some Thunderbolt 1 devices only have one lane
>>> adapter. Fix this by checking for the lane 1 before we read its credits.
>>>
>>> Reported-by: Olliver Schinagl <oliver@schinagl.nl>
>>> Closes: https://lore.kernel.org/linux-usb/c24c7882-6254-4e68-8f22-f3e8f65dc84f@schinagl.nl/
>>> Fixes: 81af2952e606 ("thunderbolt: Add support for asymmetric link")
>>> Cc: stable@vger.kernel.org
>>> Cc: Gil Fine <gil.fine@linux.intel.com>
>>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>>> ---
>>> Hi Olliver,
>>>
>>> I managed to reproduce this with a Thunderbolt 1 device. I wonder if you
>>> can try this patch and see if it fixes your issue too?
>>
>> That sounds reasonable, as it's an old Macbook (Should be TB2) with an old
>> ethernet dongle (probably TB1?) or simply because it doesn't need that much
>> speed (gbit adapter only). Sadly patching my kernel is not something I can
>> do at the moment.
> 
> Right, if you plug in a TB1 device into TB2 host, that's also same issue
> (TB1 devices don't always have two lane adapters).
> 
> It's fine if you cannot test this (but let me know if you want
> instructions). I can pick this into my fixes branch and send for -rc. It
> should land the arch Linux kernel tree at some point too, so you get it
> by upgrading the kernel.
Yeah, I'll gently wait for it to land there. I'm using a 10/100Mbit USB 
adapter for those few times I need it :)

Thanks for looking into this!
Olliver
