Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6C748A8C0
	for <regressions@lists.linux.dev>; Wed, 29 Jul 2026 13:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330286; cv=none; b=YViQSpdffEnK4CpdPQGcayDBEuiqkme5BQZykT7PlBmC0LbrjhxXG9m2CYzPK5DE66lciAgrU/HS6zhw7NL2GAV5OuC3FYVsooafkEJ8cDzghzRO37VSdsYT97aL3hsJG9g8MYVi72iJ0hfHj2nhZuk1lBaG0uXZZz1y9HRdIE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330286; c=relaxed/simple;
	bh=42/LEoZ/Hy5Qi0AsptQJqmFCwFxF6KySLPiRm6fPhOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jscofhcBv+4lGbJusvGWOnYcwnvG06oLCxvXebHk2MhPvtbPJxN0D98d4Dt5sZ9psvY4tZCl/hkCgNasQwTuyKj9fdJAC9paS7vOw3xUUTIxyP0SyrwU0C9TUmLLBqwdSs+160jCQ63kGIMpQ/n90HfctfMtJ/GUagMDsNffPKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=YIetipND; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="YIetipND"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4h9CGT6734z8RTd;
	Wed, 29 Jul 2026 15:04:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785330273;
	bh=42/LEoZ/Hy5Qi0AsptQJqmFCwFxF6KySLPiRm6fPhOA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=YIetipNDPIaJk5Ht9KWvWr1txJm+3FIq6r7Sb3SS5eTVrGN/m1vMb9/iM6V0lAaEm
	 czZ/6ki9EdCeJdr+d+/nqjktM1YpQmQh+DPYPjI6IMR16FR25Ei9lJnRpmRJ0tRvBR
	 LLFx515o2JnMV2KvGoyi5mF/BeabZTE3OhVwabwMevf+NJAuygHR+dKxej7BzBbkey
	 D6LCOcqdh9RHdc0aRRwZE6G7fhTBlIFilFmJmrUrRRDmrHScTPvvXs6NtxUIGyxVPR
	 R5LFs1WuNTOk4QYLCCbGx1CP6Gi4Hmk/g+zvnFosChHPj0gCNXX14lORNFtEGJ02BM
	 WkqOlI2HmB2XA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4h9CGT5RYkz8Bpn;
	Wed, 29 Jul 2026 15:04:33 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4h9CGT34rmz8sZw;
	Wed, 29 Jul 2026 15:04:33 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A83955F97A;
	Wed, 29 Jul 2026 15:04:21 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <f6d99c0e-6517-402c-b3ee-982faebb54e3@leemhuis.info>
Date: Wed, 29 Jul 2026 15:04:20 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug caused by upstream commit
 6650527444dadc63d84aa939d14ecba4fadb2f69
To: Pasha Boroffski <hex.dec.bin.oct@gmail.com>, regressions@lists.linux.dev
References: 
 <CAHmU7GkfHNdA-sph9mBf-s+a=9m22KcGTq6r=78=qSf5BKBgag@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CAHmU7GkfHNdA-sph9mBf-s+a=9m22KcGTq6r=78=qSf5BKBgag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178533026188.861080.2713569346639254618@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: A83955F97A
X-NC-CID: nlTsbwNQGfqvidyGI5vWMSyhoUNCzBHvzrRFxdwk7EnnBUy3fcs=

On 7/29/26 14:11, Pasha Boroffski wrote:
> I believe 6650527444dadc63d84aa939d14ecba4fadb2f69 (proc: protect
> ptrace_may_access() with exec_update_lock (part 1)) causes a "kernel
> bug".

That change is not my area of expertise, but from a quick look I'm
pretty sure it will be fixed with the next stable release, as it will
contain a commit that the mentioned change needs:
https://lore.kernel.org/all/20260726195203.stable-0001@kernel.org/

If not, please let me know. Ciao, Thorsten

> My kernel is 6.12.98 #9 SMP PREEMPT_RT x86_64 merged with
> 6650527444dadc63d84aa939d14ecba4fadb2f69. PREEMPT_RT preemption does
> not matter, PREEMPT/PREEMPT_DYNAMIC behaves the same.
> To reproduce the bug I used 'find /proc/ | grep 123'. When scanning,
> the kernel triggers an "Oops".
> 
> [  344.465851][ T3715] BUG: kernel NULL pointer dereference, address:
> 00000000000000f8
> [  344.465862][ T3715] #PF: supervisor read access in kernel mode
> [  344.465867][ T3715] #PF: error_code(0x0000) - not-present page
> [  344.465871][ T3715] PGD 0 P4D 0
> [  344.465879][ T3715] Oops: Oops: 0000 [#3] PREEMPT_RT SMP PTI
> [  344.465888][ T3715] CPU: 0 UID: 0 PID: 3715 Comm: find Tainted: G
>    D    O       6.12.98 #9
> [  344.465899][ T3715] Tainted: [D]=DIE, [O]=OOT_MODULE
> [  344.465901][ T3715] Hardware name: ADLINK Technology Inc.
> nanoX-BT/To be filled by O.E.M., BIOS 17/04/2025
> [  344.465905][ T3715] RIP: 0010:down_read_killable+0x9/0x40
> [  344.465920][ T3715] Code: ff ff ff c3 cc cc cc cc 66 0f 1f 84 00 00
> 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa
> 0f 1f 44 00 00 <8b> 07 85 c0 79 10 8d 50 01 f0 0f b1 17 75 f3 31 c0 c3
> cc cc cc cc
> [  344.465926][ T3715] RSP: 0018:ffffb4f2c0937db0 EFLAGS: 00010202
> [  344.465932][ T3715] RAX: 00000000000000f8 RBX: ffffb4f2c0937ee0
> RCX: 0000561d401b989d
> [  344.465937][ T3715] RDX: 0000000080000001 RSI: 0000000000000009
> RDI: 00000000000000f8
> [  344.465940][ T3715] RBP: ffffa242601b0dc0 R08: 00007ffffffff000
> R09: 0000000000000004
> [  344.465944][ T3715] R10: 0000000000000000 R11: 0000000000000001
> R12: ffffffffa50c2df0
> [  344.465948][ T3715] R13: ffffa2425c16a988 R14: ffffa2425b916400
> R15: ffffb4f2c0937df0
> [  344.465952][ T3715] FS:  00007fdb493a2780(0000)
> GS:ffffa242b7400000(0000) knlGS:0000000000000000
> [  344.465958][ T3715] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  344.465962][ T3715] CR2: 00000000000000f8 CR3: 000000001bb06000
> CR4: 00000000001006f0
> [  344.465966][ T3715] Call Trace:
> [  344.465971][ T3715]  <TASK>
> [  344.465974][ T3715]  proc_map_files_readdir+0xc7/0x500
> [  344.465986][ T3715]  ? _copy_to_user+0x36/0x50
> [  344.465996][ T3715]  ? cp_new_stat+0x136/0x170
> [  344.466008][ T3715]  ? __do_sys_newfstatat+0x50/0x80
> [  344.466016][ T3715]  iterate_dir+0x99/0x160
> [  344.466025][ T3715]  ? fdget_pos+0x9b/0x160
> [  344.466034][ T3715]  __x64_sys_getdents64+0x8a/0x130
> [  344.466042][ T3715]  ? __pfx_filldir64+0x10/0x10
> [  344.466050][ T3715]  do_syscall_64+0x54/0x120
> [  344.466058][ T3715]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  344.466066][ T3715] RIP: 0033:0x7fdb49555b4e
> [  344.466073][ T3715] Code: 87 43 04 ff c8 7e 08 48 89 ef e8 48 59 fc
> ff 5b 4c 89 e0 5d 41 5c c3 b8 ff ff ff 7f 48 39 c2 48 0f 47 d0 b8 d9
> 00 00 00 0f 05 <48> 3d 00 f0 ff ff 76 10 48 8b 15 9b 92 0d 00 f7 d8 64
> 89 02 48 83
> [  344.466077][ T3715] RSP: 002b:00007ffc5adeff48 EFLAGS: 00000293
> ORIG_RAX: 00000000000000d9
> [  344.466084][ T3715] RAX: ffffffffffffffda RBX: 0000561d401b9840
> RCX: 00007fdb49555b4e
> [  344.466088][ T3715] RDX: 0000000000008000 RSI: 0000561d401b9870
> RDI: 0000000000000005
> [  344.466091][ T3715] RBP: 0000000000000001 R08: 0000000000000001
> R09: 0000000000000000
> [  344.466095][ T3715] R10: 0000000001000000 R11: 0000000000000293
> R12: 0000561d401b9844
> [  344.466098][ T3715] R13: ffffffffffffff80 R14: 0000000000000000
> R15: 0000561d401b9870
> [  344.466104][ T3715]  </TASK>
> [  344.466106][ T3715] Modules linked in: iptable_mangle iptable_nat
> nf_nat nf_conntrack nf_defrag_ipv4 vfio_pci vfio_pci_core irqbypass
> vfio igb i2c_algo_bit overlay btrfs libcrc32c xor lzo_compress
> zlib_defla
> te zstd_compress raid6_pq at24 regmap_i2c [last unloaded: axi_dev(O)]
> [  344.466147][ T3715] CR2: 00000000000000f8
> [  344.466176][ T3715] ---[ end trace 0000000000000000 ]---
> [  344.512192][ T3715] RIP: 0010:down_read_killable+0x9/0x40
> [  344.512211][ T3715] Code: ff ff ff c3 cc cc cc cc 66 0f 1f 84 00 00
> 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa
> 0f 1f 44 00 00 <8b> 07 85 c0 79 10 8d 50 01 f0 0f b1 17 75 f3 31 c0 c3
> cc cc cc cc
> [  344.512217][ T3715] RSP: 0018:ffffb4f2c0c4fdb0 EFLAGS: 00010202
> [  344.512224][ T3715] RAX: 00000000000000f8 RBX: ffffb4f2c0c4fee0
> RCX: 00005602c548641d
> [  344.512229][ T3715] RDX: 0000000080000001 RSI: 0000000000000009
> RDI: 00000000000000f8
> [  344.512232][ T3715] RBP: ffffa242601b0dc0 R08: 00007ffffffff000
> R09: 0000000000000004
> [  344.512236][ T3715] R10: 0000000000000000 R11: 0000000000000001
> R12: ffffffffa50c2df0
> [  344.512240][ T3715] R13: ffffa2425c16a988 R14: ffffa2425b8a1100
> R15: ffffb4f2c0c4fdf0
> [  344.512244][ T3715] FS:  00007fdb493a2780(0000)
> GS:ffffa242b7400000(0000) knlGS:0000000000000000
> [  344.512249][ T3715] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  344.512253][ T3715] CR2: 00000000000000f8 CR3: 000000001bb06000
> CR4: 00000000001006f0
> 
> 
> I think it is because
> mm = mm_access(task, PTRACE_MODE_READ_FSCREDS);
> is checked for IS_ERR(mm) only and not checked for NULL (IS_ERR_OR_NULL(mm))
> 
> Loaded drivers (lsmod | awk '{print $1}'):
> 
> iptable_mangle
> iptable_nat
> nf_nat
> nf_conntrack
> nf_defrag_ipv4
> vfio_pci
> vfio_pci_core
> irqbypass
> vfio
> igb
> i2c_algo_bit
> overlay
> btrfs
> libcrc32c
> xor
> lzo_compress
> zlib_deflate
> zstd_compress
> raid6_pq
> at24
> regmap_i2c
> 
> Best regards,
> Pavel Borovskikh
> 

