Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4214E3F54D9
	for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 10:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148284; cv=none; b=hsupwB6uzjQrcsMSHMpH6ekWBK4sFhBR+FGl6B4wvDFaexM+dXqySpQkh40SBGu2zzj0PRnsgvEVtNgBpd66rLaFjzxJJErYqdWPfZwuJ1n90oO9JjIVuLmg6ciwjU7u5ZEIcKHN4m0mB46PLIGQqb3P+uUSiuk1Rjol7HEEV70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148284; c=relaxed/simple;
	bh=YjlXfYkduonKlx5DbNh76Bxg0BXTxqaXzkgDLh9nydw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=oyLS7H0KJ+u2lLpZmYBze/afGe+wzrtp2JZ2/e0oW4/bFzVB4EJAuMe0VsaaCs1g8dAlOT4NOyAkNpJYP6GzZbpzdkddJN0Ilg+I1VFOXt1cfc5zdAX262Gc5kJKLiAo26cQp5RDUkEms5LMsxCOmPSECPKjXXwDHe8UPBNXZlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=LdkTEN85; arc=none smtp.client-ip=188.68.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="LdkTEN85"
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4h7vyP2VyLz8jB0;
	Mon, 27 Jul 2026 10:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785148269;
	bh=YjlXfYkduonKlx5DbNh76Bxg0BXTxqaXzkgDLh9nydw=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=LdkTEN857z4DRahw3cWA2Jqpalhr09WCE3XisiwML1A5pDBX3C8VNoTQ9mmTu147Q
	 iTABzv71RvrUtyyzQCEn+Mb1N6YXEWwtR7EfzCZKcGIqwtQ5TBxMqN8JYaaUTZi5me
	 4oLAvDV45wlrUegYpPv7WavrD6hqzVLVJZCsUsLXJopuhs8lxI7RlvZf9w4yv5ynug
	 au+WwU2MHBffMOAhLGG+6ihJUZ9vRTkIkD5GGbCW92BunYxUs1VbgqTWur/oBOTCId
	 hMdmmx0iId8UQbsU3gM1AI7m0SDixTSYRy/xryqLbncFCYUM+xaki0EsnwA0pXV6st
	 e/QU++sgBhuHQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4h7vyP1p5wz8j67;
	Mon, 27 Jul 2026 10:31:09 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4h7vyM6CkCz8tcX;
	Mon, 27 Jul 2026 12:31:07 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 473785FA76;
	Mon, 27 Jul 2026 12:30:59 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <98b6d591-4b65-4b93-899d-77f27f2367ad@leemhuis.info>
Date: Mon, 27 Jul 2026 12:30:57 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Regression] Kernel 7.2-rc : thunderbolt crash on startup
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Woody Suwalski <terraluna977@gmail.com>
References: <784d45c6-1b96-825e-3686-074dbf8a2d58@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
X-Enigmail-Draft-Status: N11222
Autocrypt: addr=linux@leemhuis.info; keydata=
 xsFNBFJ4AQ0BEADCz16x4kl/YGBegAsYXJMjFRi3QOr2YMmcNuu1fdsi3XnM+xMRaukWby47
 JcsZYLDKRHTQ/Lalw9L1HI3NRwK+9ayjg31wFdekgsuPbu4x5RGDIfyNpd378Upa8SUmvHik
 apCnzsxPTEE4Z2KUxBIwTvg+snEjgZ03EIQEi5cKmnlaUynNqv3xaGstx5jMCEnR2X54rH8j
 QPvo2l5/79Po58f6DhxV2RrOrOjQIQcPZ6kUqwLi6EQOi92NS9Uy6jbZcrMqPIRqJZ/tTKIR
 OLWsEjNrc3PMcve+NmORiEgLFclN8kHbPl1tLo4M5jN9xmsa0OZv3M0katqW8kC1hzR7mhz+
 Rv4MgnbkPDDO086HjQBlS6Zzo49fQB2JErs5nZ0mwkqlETu6emhxneAMcc67+ZtTeUj54K2y
 Iu8kk6ghaUAfgMqkdIzeSfhO8eURMhvwzSpsqhUs7pIj4u0TPN8OFAvxE/3adoUwMaB+/plk
 sNe9RsHHPV+7LGADZ6OzOWWftk34QLTVTcz02bGyxLNIkhY+vIJpZWX9UrfGdHSiyYThHCIy
 /dLz95b9EG+1tbCIyNynr9TjIOmtLOk7ssB3kL3XQGgmdQ+rJ3zckJUQapLKP2YfBi+8P1iP
 rKkYtbWk0u/FmCbxcBA31KqXQZoR4cd1PJ1PDCe7/DxeoYMVuwARAQABzSdUaG9yc3RlbiBM
 ZWVtaHVpcyA8bGludXhAbGVlbWh1aXMuaW5mbz7CwZQEEwEKAD4CGwMFCwkIBwMFFQoJCAsF
 FgIDAQACHgECF4AWIQSoq8a+lZZX4oPULXVytubvTFg9LQUCaOO74gUJHfEI0wAKCRBytubv
 TFg9Lc4iD/4omf2z88yGmior2f1BCQTAWxI2Em3S4EJY2+Drs8ZrJ1vNvdWgBrqbOtxN6xHF
 uvrpM6nbYIoNyZpsZrqS1mCA4L7FwceFBaT9CTlQsZLVV/vQvh2/3vbj6pQbCSi7iemXklF7
 y6qMfA7rirvojSJZ2mi6tKIQnD2ndVhSsxmo/mAAJc4tiEL+wkdaX1p7bh2Ainp6sfxTqL6h
 z1kYyjnijpnHaPgQ6GQeGG1y+TSQFKkb/FylDLj3b3efzyNkRjSohcauTuYIq7bniw7sI8qY
 KUuUkrw8Ogi4e6GfBDgsgHDngDn6jUR2wDAiT6iR7qsoxA+SrJDoeiWS/SK5KRgiKMt66rx1
 Jq6JowukzNxT3wtXKuChKP3EDzH9aD+U539szyKjfn5LyfHBmSfR42Iz0sofE4O89yvp0bYz
 GDmlgDpYWZN40IFERfCSxqhtHG1X6mQgxS0MknwoGkNRV43L3TTvuiNrsy6Mto7rrQh0epSn
 +hxwwS0bOTgJQgOO4fkTvto2sEBYXahWvmsEFdLMOcAj2t7gJ+XQLMsBypbo94yFYfCqCemJ
 +zU5X8yDUeYDNXdR2veePdS3Baz23/YEBCOtw+A9CP0U4ImXzp82U+SiwYEEQIGWx+aVjf4n
 RZ/LLSospzO944PPK+Na+30BERaEjx04MEB9ByDFdfkSbM7BTQRSeAENARAAzu/3satWzly6
 +Lqi5dTFS9+hKvFMtdRb/vW4o9CQsMqL2BJGoE4uXvy3cancvcyodzTXCUxbesNP779JqeHy
 s7WkF2mtLVX2lnyXSUBm/ONwasuK7KLz8qusseUssvjJPDdw8mRLAWvjcsYsZ0qgIU6kBbvY
 ckUWkbJj/0kuQCmmulRMcaQRrRYrk7ZdUOjaYmjKR+UJHljxLgeregyiXulRJxCphP5migoy
 ioa1eset8iF9fhb+YWY16X1I3TnucVCiXixzxwn3uwiVGg28n+vdfZ5lackCOj6iK4+lfzld
 z4NfIXK+8/R1wD9yOj1rr3OsjDqOaugoMxgEFOiwhQDiJlRKVaDbfmC1G5N1YfQIn90znEYc
 M7+Sp8Rc5RUgN5yfuwyicifIJQCtiWgjF8ttcIEuKg0TmGb6HQHAtGaBXKyXGQulD1CmBHIW
 zg7bGge5R66hdbq1BiMX5Qdk/o3Sr2OLCrxWhqMdreJFLzboEc0S13BCxVglnPqdv5sd7veb
 0az5LGS6zyVTdTbuPUu4C1ZbstPbuCBwSwe3ERpvpmdIzHtIK4G9iGIR3Seo0oWOzQvkFn8m
 2k6H2/Delz9IcHEefSe5u0GjIA18bZEt7R2k8CMZ84vpyWOchgwXK2DNXAOzq4zwV8W4TiYi
 FiIVXfSj185vCpuE7j0ugp0AEQEAAcLBfAQYAQoAJgIbDBYhBKirxr6Vllfig9QtdXK25u9M
 WD0tBQJo47viBQkd8QjTAAoJEHK25u9MWD0tCH8P/1b+AZ8K3D4TCBzXNS0muN6pLnISzFa0
 cWcylwxX2TrZeGpJkg14v2R0cDjLRre9toM44izLaz4SKyfgcBSj9XET0103cVXUKt6SgT1o
 tevoEqFMKKp3vjDpKEnrcOSOCnfH9W0mXx/jDWbjlKbBlN7UBVoZD/FMM5Ul0KSVFJ9Uij0Z
 S2WAg50NQi71NBDPcga21BMajHKLFzb4wlBWSmWyryXI6ouabvsbsLjkW3IYl2JupTbK3viH
 pMRIZVb/serLqhJgpaakqgV7/jDplNEr/fxkmhjBU7AlUYXe2BRkUCL5B8KeuGGvG0AEIQR0
 dP6QlNNBV7VmJnbU8V2X50ZNozdcvIB4J4ncK4OznKMpfbmSKm3t9Ui/cdEK+N096ch6dCAh
 AeZ9dnTC7ncr7vFHaGqvRC5xwpbJLg3xM/BvLUV6nNAejZeAXcTJtOM9XobCz/GeeT9prYhw
 8zG721N4hWyyLALtGUKIVWZvBVKQIGQRPtNC7s9NVeLIMqoH7qeDfkf10XL9tvSSDY6KVl1n
 K0gzPCKcBaJ2pA1xd4pQTjf4jAHHM4diztaXqnh4OFsu3HOTAJh1ZtLvYVj5y9GFCq2azqTD
 pPI3FGMkRipwxdKGAO7tJVzM7u+/+83RyUjgAbkkkD1doWIl+iGZ4s/Jxejw1yRH0R5/uTaB MEK4
In-Reply-To: <784d45c6-1b96-825e-3686-074dbf8a2d58@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <178514825953.1160124.11008219244780643471@mxe9fb.netcup.net>
X-NC-CID: NwDPTsQpv3y+XV3QYJmc+UtL9lv9ZJpMA7dY+B+IgKMUyx5vzTk=

On 7/8/26 22:09, Woody Suwalski wrote:
> Re: commit f5cc545f59699549adbaa4084149f8247865a51d
> Author: Mika Westerberg <mika.westerberg@linux.intel.com>
> Date:   Wed Nov 19 12:53:58 2025 +0200
> 
>     thunderbolt: Wait for tb_domain_release() to complete when driver is
> removed
> 
> ====================
> 
> Mika, starting with7.2-rc1 the boot on an old Apple MacBookPro and
> MacBook Air has been problematic - the thunderbolt driver crash may stop
> boot or let it boot in somehow unstable state.

Seems this fell through the cracks (due to vacations or something I
assume -- so no worries!), but to ensure this is not totally forgotten:

Woddy, does this still happen with 7.2-rc5? And is the fix you proposed
still helping?
https://lore.kernel.org/lkml/62caf7f8-b403-d0dd-15bc-b31b56f71c28@gmail.com/

Ciao, Thorsten


> The issue is the domain_release()/complete() crash as called during boot.
> 
> Just disabling the
> 
> complete(&nhi->domain_released);
> 
> line will allow system to boot OK, however (as designed in your patch)
> on shutdown system will hang waiting for completion.
> 
> I am not sure if the workaround should be to detect that
> domain_release() is called during startup, or perhaps to fix the problem
> on the kernel scheduler level?
> 
> If you have any ideas or patches, let me know...
> 
> Thanks, Woody Suwalski
> terraluna977@gmail.com
> 
> =========================
> [   10.531967] [   T2588] bcma-pci-bridge 0000:03:00.0: bus0: Core 2
> found: PCIe (manuf 0x4BF, id 0x820, rev 0x1
> 3, class 0x0)
> [   10.570223] [   T2604] ACPI: bus type thunderbolt registered
> [   10.580666] [   T2604] BUG: unable to handle page fault for address:
> fffffffffffffff8
> [   10.580745] [   T2604] #PF: supervisor read access in kernel mode
> [   10.580796] [   T2604] #PF: error_code(0x0000) - not-present page
> [   10.580844] [   T2604] PGD 2ec19067 P4D 2ec19067 PUD 2ec1b067 PMD 0
> [   10.580915] [   T2604] Oops: Oops: 0000 [#1] SMP NOPTI
> [   10.580929] [   T2603] acpi ACPI0001:00: SBS HC: offset = 0x20,
> query_bit = 0x10
> [   10.580968] [   T2604] CPU: 3 UID: 0 PID: 2604 Comm: (udev-worker)
> Tainted: G S                  7.2-pingu #0~rc1 PREEMPT(full) 
> 9f8aaa247129d19aebb6b0d19f7b648b1f9f7f36
> [   10.581126] [   T2604] Tainted: [S]=CPU_OUT_OF_SPEC
> [   10.581165] [   T2604] Hardware name: Apple Inc. MacBookPro8,1/
> Mac-94245B3640C91C81, BIOS MBP81.88Z.0050.B00.1804101331 04/10/18
> [   10.581248] [   T2604] RIP: 0010:complete+0x3a/0x70
> [   10.581301] [   T2604] Code: 61 c8 00 48 89 c5 8b 03 83 f8 ff 74 05
> 83 c0 01 89 03 48 8b 53 10 48 8d 43 10 48 39 c2 74 29 48 8b 5b 10 31 d2
> be 03 00 00 00 <48> 8b 7b f8 e8 4d e9 fd ff 48 8b 13 48 8b 43 08 48 89
> 42 08 48 89
> [   10.581441] [   T2604] RSP: 0018:ffff92720020ba98 EFLAGS: 00010046
> [   10.581496] [   T2604] RAX: ffff8c82c6a2b3b0 RBX: 0000000000000000
> RCX: 000000000000000c
> [   10.581559] [   T2604] RDX: 0000000000000000 RSI: 0000000000000003
> RDI: ffff8c82c6a2b3a8
> [   10.581621] [   T2604] RBP: 0000000000000282 R08: 0000000000000000
> R09: 0000000000000000
> [   10.581681] [   T2604] R10: 0000000000000001 R11: ffff8c832ba20d80
> R12: ffff8c82c6a2b3a8
> [   10.581744] [   T2604] R13: ffff8c82c81f02b0 R14: 0000000000000000
> R15: ffff8c82c6e53148
> [   10.581808] [   T2604] FS:  00007ffaf52c99c0(0000)
> GS:ffff8c839ad88000(0000) knlGS:0000000000000000
> [   10.581881] [   T2604] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   10.581935] [   T2604] CR2: fffffffffffffff8 CR3: 0000000105596002
> CR4: 00000000000606f0
> [   10.581999] [   T2604] Call Trace:
> [   10.582032] [   T2604]  <TASK>
> [   10.582061] [   T2604]  device_release+0x3a/0x90
> [   10.582112] [   T2604]  kobject_put+0x8a/0x230
> [   10.582166] [   T2604]  icm_probe+0xf2/0x550 [thunderbolt
> 2f2c536023810e0da91d9b6d6a63a9f9bf553e73]
> [   10.582415] [   T2604]  nhi_probe+0x196/0x390 [thunderbolt
> 2f2c536023810e0da91d9b6d6a63a9f9bf553e73]
> [   10.582620] [   T2604]  local_pci_probe+0x3c/0x90
> [   10.582668] [   T2604]  pci_device_probe+0xb0/0x1d0
> [   10.582715] [   T2604]  ? sysfs_do_create_link_sd+0x69/0xd0
> [   10.582778] [   T2604]  really_probe+0xd1/0x3e0
> [   10.582826] [   T2604]  ? __pfx___driver_attach+0x10/0x10
> [   10.582878] [   T2604]  __driver_probe_device+0x80/0x180
> [   10.582931] [   T2604]  driver_probe_device+0x1a/0x80
> [   10.582983] [   T2604]  __driver_attach+0xca/0x1f0
> [   10.583031] [   T2604]  bus_for_each_dev+0x6d/0xc0
> [   10.583079] [   T2604]  bus_add_driver+0x11b/0x240
> [   10.583128] [   T2604]  driver_register+0x50/0x100
> [   10.583178] [   T2604]  ? __pfx_init_module+0x10/0x10 [thunderbolt
> 2f2c536023810e0da91d9b6d6a63a9f9bf553e73]
> [   10.583404] [   T2604]  nhi_init+0x30/0xff0 [thunderbolt
> 2f2c536023810e0da91d9b6d6a63a9f9bf553e73]
> [   10.583606] [   T2604]  ? __pfx_init_module+0x10/0x10 [thunderbolt
> 2f2c536023810e0da91d9b6d6a63a9f9bf553e73]
> [   10.583805] [   T2604]  do_one_initcall+0x6b/0x2c0
> [   10.583851] [   T2604]  ? do_init_module+0x1d/0x270
> [   10.583895] [   T2604]  do_init_module+0x5b/0x270
> [   10.583935] [   T2604]  init_module_from_file+0xc3/0xe0
> [   10.583982] [   T2604]  idempotent_init_module+0xf7/0x2e0
> [   10.584029] [   T2604]  __x64_sys_finit_module+0x68/0xe0
> [   10.584075] [   T2604]  do_syscall_64+0xc2/0x550
> [   10.586162] [   T2604]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   10.588198] [   T2604] RIP: 0033:0x7ffaf5e277b9
> [   10.590222] [   T2604] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f
> 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b
> 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 27 66 0d 00 f7 d8
> 64 89 01 48
> [   10.594678] [   T2604] RSP: 002b:00007ffd1d772f38 EFLAGS: 00000246
> ORIG_RAX: 0000000000000139
> [   10.597004] [   T2604] RAX: ffffffffffffffda RBX: 0000561fac083800
> RCX: 00007ffaf5e277b9
> [   10.599213] [   T2604] RDX: 0000000000000000 RSI: 00007ffaf455a44d
> RDI: 0000000000000027
> [   10.601423] [   T2604] RBP: 0000000000000000 R08: 0000000000000000
> R09: 0000561fac003030
> [   10.603602] [   T2604] R10: 0000000000000000 R11: 0000000000000246
> R12: 00007ffaf455a44d
> [   10.605753] [   T2604] R13: 0000000000020000 R14: 0000561fac082060
> R15: 0000000000000000
> [   10.607706] [   T2604]  </TASK>
> [   10.609330] [   T2604] Modules linked in: sbshc bcma(+)
> thunderbolt(+) usb_common sg efi_pstore nvme_fabrics fuse configfs
> efivarfs dmi_sysfs autofs4
> [   10.610939] [   T2604] CR2: fffffffffffffff8
> [   10.612390] [   T2604] ---[ end trace 0000000000000000 ]---
> [   10.615077] [   T2588] bcma-pci-bridge 0000:03:00.0: bus0: Bus
> registered
> 
> 

