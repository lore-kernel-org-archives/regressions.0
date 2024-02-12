Received: from 7of9.schinagl.nl (7of9.schinagl.nl [185.238.129.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575E439AFC
	for <regressions@lists.linux.dev>; Mon, 12 Feb 2024 12:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.238.129.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707740448; cv=none; b=rI1b7tQ20B8SGM5fMpcdps/vg7BK/ulKE1lbFQXFvxWtNnYveJ9vf4uxVypQY+KUTDtR89onJzC64WTo3/LdcFyI9YGaKV90uV2sTBw6kSxWqYEYq86B6sSzacok4q64JHSGrgav1a4eoKCtxHKeTO0qEsslkv42Dx+Rz1leapE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707740448; c=relaxed/simple;
	bh=MrEg1sC7MxsJCaDNNe8ee82ik3MVHrYHp23SxKritMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T0DVvjPF4oa7qjDBKmUZtDVWVgLKGPsH65dFOX57K72YZ5srUqP+UZ5kbB0IRW95AiGFwlOBXBfV9JRGcGZtrarqKwsleRUbC0PP9ZlZuEzhWQ6NEWIwZ+lWKb9JB0nO5mJ0p9bqndoT1U8FIfB4zGKVZ56Abf0I0KFpz4CHx4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=schinagl.nl; spf=pass smtp.mailfrom=schinagl.nl; dkim=pass (1024-bit key) header.d=schinagl.nl header.i=@schinagl.nl header.b=uVB3GHmZ; arc=none smtp.client-ip=185.238.129.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=schinagl.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schinagl.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=schinagl.nl header.i=@schinagl.nl header.b="uVB3GHmZ"
Received: from [192.168.60.206] (unknown [109.109.108.68])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by 7of9.schinagl.nl (Postfix) with ESMTPSA id BC4B119B7956;
	Mon, 12 Feb 2024 13:15:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=schinagl.nl; s=7of9;
	t=1707740122; bh=MrEg1sC7MxsJCaDNNe8ee82ik3MVHrYHp23SxKritMc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=uVB3GHmZUE8/MQjzgCZ3dMmmqLXpPDuOpUmLSEfeWoq4D0FwTDGiX81oLDinn8yPy
	 bkIoMxjINfXCVRcN/cTygDkLOFEiwgjOZ9hPuHmiNuhxbXOFsf4TbkjtmpjwzP8XpA
	 sQLrhtZN0B48zmgsaCbsYIuZR0EPLkgbneb1jJP0=
Message-ID: <0172d016-0421-4671-822e-262b2ebfc636@schinagl.nl>
Date: Mon, 12 Feb 2024 13:15:18 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Fix NULL pointer dereference in
 tb_port_update_credits()
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>, Lukas Wunner <lukas@wunner.de>,
 Andreas Noever <andreas.noever@gmail.com>,
 Gil Fine <gil.fine@linux.intel.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <20240212115132.2630125-1-mika.westerberg@linux.intel.com>
Content-Language: nl
From: Olliver Schinagl <oliver@schinagl.nl>
In-Reply-To: <20240212115132.2630125-1-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey Mika,

On 12-02-2024 12:51, Mika Westerberg wrote:
> Olliver reported that his system crashes when plugging in Thunderbolt 1
> device:
> 
>   BUG: kernel NULL pointer dereference, address: 0000000000000020
>   #PF: supervisor read access in kernel mode
>   #PF: error_code(0x0000) - not-present page
>   PGD 0 P4D 0
>   Oops: 0000 [#1] PREEMPT SMP NOPTI
>   RIP: 0010:tb_port_do_update_credits+0x1b/0x130 [thunderbolt]
>   Call Trace:
>    <TASK>
>    ? __die+0x23/0x70
>    ? page_fault_oops+0x171/0x4e0
>    ? exc_page_fault+0x7f/0x180
>    ? asm_exc_page_fault+0x26/0x30
>    ? tb_port_do_update_credits+0x1b/0x130
>    ? tb_switch_update_link_attributes+0x83/0xd0
>    tb_switch_add+0x7a2/0xfe0
>    tb_scan_port+0x236/0x6f0
>    tb_handle_hotplug+0x6db/0x900
>    process_one_work+0x171/0x340
>    worker_thread+0x27b/0x3a0
>    ? __pfx_worker_thread+0x10/0x10
>    kthread+0xe5/0x120
>    ? __pfx_kthread+0x10/0x10
>    ret_from_fork+0x31/0x50
>    ? __pfx_kthread+0x10/0x10
>    ret_from_fork_asm+0x1b/0x30
>    </TASK>
> 
> This is due the fact that some Thunderbolt 1 devices only have one lane
> adapter. Fix this by checking for the lane 1 before we read its credits.
> 
> Reported-by: Olliver Schinagl <oliver@schinagl.nl>
> Closes: https://lore.kernel.org/linux-usb/c24c7882-6254-4e68-8f22-f3e8f65dc84f@schinagl.nl/
> Fixes: 81af2952e606 ("thunderbolt: Add support for asymmetric link")
> Cc: stable@vger.kernel.org
> Cc: Gil Fine <gil.fine@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> Hi Olliver,
> 
> I managed to reproduce this with a Thunderbolt 1 device. I wonder if you
> can try this patch and see if it fixes your issue too?

That sounds reasonable, as it's an old Macbook (Should be TB2) with an 
old ethernet dongle (probably TB1?) or simply because it doesn't need 
that much speed (gbit adapter only). Sadly patching my kernel is not 
something I can do at the moment.

Olliver

> 
>   drivers/thunderbolt/switch.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index bca6f28c553b..72ebde0e34d7 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -1256,6 +1256,9 @@ int tb_port_update_credits(struct tb_port *port)
>   	ret = tb_port_do_update_credits(port);
>   	if (ret)
>   		return ret;
> +
> +	if (!port->dual_link_port)
> +		return 0;
>   	return tb_port_do_update_credits(port->dual_link_port);
>   }
>   
