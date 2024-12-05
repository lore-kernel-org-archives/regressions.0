Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7861D8DE8
	for <regressions@lists.linux.dev>; Thu,  5 Dec 2024 10:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733396378; cv=none; b=msGr1RyyYL7iMunBpi6EO8TMI5pr99THE+COIzWoeas/0QUxGWr0D/iXn8RJ+Qgrtx54bQ6S+VRBc7/2YbWtzBTRPb+0mhngdH1luMkfIvl1taIDwukEfufHfZ+iBH+FQLM/7CPXOhbs1BnZh8fXmTow4D9dHyXr76EEy15/qnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733396378; c=relaxed/simple;
	bh=252cpp28CjA+InBEBkejnfANuYhNFASK63iHMtN9SsM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=ttSRAKjDh6r/eNzNoNjMwq82/W3b4rK+dW7m7fxPjoyR6NicKN+XdC/IyWg2L9V0Fg1BSRoVuQyOPKKnneW1uemhRqDTqj7Hty+lMim9iTNffmSQm0s2jn1DxWViqVgeKaPsYV4BHo3aFeRZGzI73Yk+13AoRWzlrmLSPSCZHXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jDuPysIe; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jDuPysIe"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Y3rxb6DXkz9srM;
	Thu,  5 Dec 2024 11:59:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1733396371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aBP8+Ta6VPCfT/d+af6u0urgv8qVbZAuyQUjcoZOP6Q=;
	b=jDuPysIerMVBKQ3bBZrvYbDQxBzbSuHW3DsNKhe6lKA/EXGwm9Nwq6lkO5j2SohElPIjaq
	Tcqs/mSBhu+egNw6zLahZsQyR6Lvr1nyU39D/YomEv5l38Q7BK8jZASX8k/0IrlS1zrxyB
	hNFkncCx7rpfmz9zSWW+jFMq5fCluujh7/BGM47/2eMxJakVHlxCDY88Pqn1C3G8M1Yl83
	kldptISIRW3cYBgETDlSSJ53+hyjGLqbH5L9GYEKNiPC20AnvnwEyVdYHq2X3YggYbkHQs
	NocbwesIOVx7RqwMrIHLfnnI8Hwduvi+3NBocux1cvfpmMwfC1hJ7KnG0XF5bg==
Message-ID: <5fcdfd16-d598-4a86-962e-9d22b0524b12@mailbox.org>
Date: Thu, 5 Dec 2024 11:59:29 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Language: en-US
To: kbusch@kernel.org, hch@lst.de, linux-mm@kvack.org
From: Simon Polack <spolack@mailbox.org>
Subject: [REGRESSION] 6.13-rc1: Loading nvme module leads to
 mm/page_alloc.c:4727 __alloc_pages_noprof+0x321/0x330
Cc: regressions@lists.linux.dev, linux-nvme@lists.infradead.org,
 'linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 6kb6byan7tnwaj8ou1yqqcxjxf6ybgto
X-MBO-RS-ID: e39f74d05971d8e3050

Hello,

i noticed a regression after upgrading from 6.12.1 to 6.13-rc1. The logs 
indicate a error in mm/page_alloc.c which is called from the nvme 
module. Other modules seem to be not producing that warning, therefore i 
have included nvme maintainers as well.

The issue is seen on a Dell Latitude 5340 Notebook which is runnning 
Fedora 41 using vanilla kernel and the system seems to be still 
perfectly working, aside from the call trace.

Please bare with me in case i forgot to include relevant recipients or 
deviate from the exact process, as this is my first reported issue.

Best,
Simon


CPU Model:
13th Gen Intel(R) Core(TM) i5-1345U

Affected Release:
Linux version 6.13.0-0.rc1.20241203gtcdd30ebb.314.vanilla.fc41.x86_64 
(mockbuild@51edd079414046e884973245b9e58270) (gcc (GCC) 14.2.1 20240912 
(Red Hat 14.2.1-3), GNU ld version 2.43.1-2.fc41) #1 SMP PREEMPT_DYNAMIC 
Tue Dec  3 07:44:07 UTC 2024

Last known good release:
Linux fedora 6.12.1-400.vanilla.fc41.x86_64 #1 SMP PREEMPT_DYNAMIC Fri 
Nov 22 16:32:03 UTC 2024 x86_64 GNU/Linux


Related logs:
[    2.301170] nvme 0000:01:00.0: platform quirk: setting simple suspend
[    2.301276] nvme nvme0: pci function 0000:01:00.0
[..]
[    2.325090] ------------[ cut here ]------------
[    2.325094] WARNING: CPU: 7 PID: 206 at mm/page_alloc.c:4727 
__alloc_pages_noprof+0x321/0x330
[    2.325099] Modules linked in: drm_buddy nvme ttm crct10dif_pclmul 
crc32_pclmul crc32c_intel polyval_clmulni drm_display_helper nvme_core 
polyval_generic
ghash_clmulni_intel sha512_ssse3 intel_ish_ipc(+) hid_multitouch(+) 
sha256_ssse3 ucsi_acpi typec_ucsi sha1_ssse3 intel_ishtp cec nvme_auth 
typec video i2c_hi
d_acpi i2c_hid wmi pinctrl_tigerlake serio_raw pkcs8_key_parser fuse
[    2.325115] CPU: 7 UID: 0 PID: 206 Comm: kworker/u48:5 Not tainted 
6.13.0-0.rc1.20241203gtcdd30ebb.314.vanilla.fc41.x86_64 #1
[    2.325118] Hardware name: Dell Inc. Latitude 5340/07MV6Y, BIOS 
1.17.0 09/09/2024
[    2.325119] Workqueue: async async_run_entry_fn
[    2.325124] RIP: 0010:__alloc_pages_noprof+0x321/0x330
[    2.325126] Code: e1 7f f7 c2 00 00 04 00 0f 45 d9 89 d9 83 e1 f7 81 
e2 00 00 00 10 0f 45 d9 e9 76 fd ff ff 80 e3 3f eb e8 c6 05 a5 1c 50 02 
01 <0f> 0b eb
  9e e8 c6 7e d1 00 66 0f 1f 44 00 00 90 90 90 90 90 90 90
[    2.325127] RSP: 0018:ffffc183c06efb50 EFLAGS: 00010246
[    2.325129] RAX: 0000000000000000 RBX: 0000000000000cc0 RCX: 
0000000000000000
[    2.325130] RDX: 0000000000000000 RSI: 000000000000000e RDI: 
0000000000000cc0
[    2.325131] RBP: 000000000000000e R08: 0000000000000cc0 R09: 
ffff9d854939aec0
[    2.325132] R10: ffffc183c06efbb8 R11: 00000000ffffffff R12: 
0000000000000000
[    2.325133] R13: ffffffffffffffff R14: 0000000000000000 R15: 
000000000000000e
[    2.325134] FS:  0000000000000000(0000) GS:ffff9d88bf780000(0000) 
knlGS:0000000000000000
[    2.325135] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.325136] CR2: 000055a61ee27018 CR3: 000000010c092001 CR4: 
0000000000f70ef0
[    2.325138] PKRU: 55555554
[    2.325139] Call Trace:
[    2.325141]  <TASK>
[    2.325142]  ? __alloc_pages_noprof+0x321/0x330
[    2.325144]  ? __warn.cold+0x93/0xfa
[    2.325146]  ? __alloc_pages_noprof+0x321/0x330
[    2.325149]  ? report_bug+0xff/0x140
[    2.325152]  ? handle_bug+0x58/0x90
[    2.325155]  ? exc_invalid_op+0x17/0x70
[    2.325157]  ? asm_exc_invalid_op+0x1a/0x20
[    2.325159]  ? __alloc_pages_noprof+0x321/0x330
[    2.325162]  __dma_direct_alloc_pages.isra.0+0x1ed/0x330
[    2.325166]  dma_direct_alloc_pages+0x3f/0x190
[    2.325168]  dma_alloc_noncontiguous+0xd9/0x270
[    2.325171]  nvme_setup_host_mem+0x400/0x480 [nvme]
[    2.325176]  ? nvme_init_ctrl_finish+0x2ac/0x330 [nvme_core]
[    2.325190]  nvme_probe.cold+0x13b/0x240 [nvme]
[    2.325194]  local_pci_probe+0x42/0x90
[    2.325198]  pci_device_probe+0xdd/0x290
[    2.325200]  really_probe+0xdb/0x340
[    2.325203]  ? pm_runtime_barrier+0x54/0x90
[    2.325205]  __driver_probe_device+0x78/0x110
[    2.325208]  driver_probe_device+0x1f/0xa0
[    2.325210]  __driver_attach_async_helper+0x5e/0xe0
[    2.325212]  async_run_entry_fn+0x31/0x130
[    2.325215]  process_one_work+0x176/0x330
[    2.325218]  worker_thread+0x252/0x390
[    2.325221]  ? __pfx_worker_thread+0x10/0x10
[    2.325223]  kthread+0xcf/0x100
[    2.325225]  ? __pfx_kthread+0x10/0x10
[    2.325226]  ret_from_fork+0x31/0x50
[    2.325229]  ? __pfx_kthread+0x10/0x10
[    2.325230]  ret_from_fork_asm+0x1a/0x30
[    2.325233]  </TASK>
[    2.325234] ---[ end trace 0000000000000000 ]---
[    2.331289] nvme nvme0: allocated 64 MiB host memory buffer (16 
segments).



#regzbot introduced: v6.12.1..v6.13-rc1

