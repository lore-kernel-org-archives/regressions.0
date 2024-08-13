Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F3B16A955
	for <regressions@lists.linux.dev>; Tue, 13 Aug 2024 11:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723547143; cv=none; b=DiTbRLB1nNZnLGMaAmAFKGy6jcOLLMaSurUPtOrsroOKHAbLgAgx60+o1k5AzJNm1/gFGyQ79mD0UL7JceO8avOH4VGNk4UD9LrSK+fPhgvIDjAHNfj2LYD6SJHZEweK9cspUVJJTkeCaSKwr85+OsdwE1qs0AgAKel5q+nixl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723547143; c=relaxed/simple;
	bh=J9sc0L/3BvrDq2NO4ZrnRksPhLpKSjLa6Se6UUk9vvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=klCFZ6UAASFzncKWHcnLUCoABM7jb1yGf9y8Z+WFGrqDcOq57HZRwMEPCq7rlgYNYBhrfFgReutZjoBqHVqVPXYmyWLfBP/98Z9lU5bo+MX2D49CRn38WkuxizWKvZOMbqoIj7kLEOy8enXSxPQl7ReVyt7+qwSxb37FDR2Mm7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SUb5TACD; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SUb5TACD"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-5a156556fb4so6210287a12.3
        for <regressions@lists.linux.dev>; Tue, 13 Aug 2024 04:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723547140; x=1724151940; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5cBuzogpd8gMkbixAeAjusMFpgm6dK1chnhfZEM0Y4U=;
        b=SUb5TACDPIQuatMiCQSpfNcV7T+jvszhOQ/c753BtojQvu1tHpDf1YzOn7HQZUVsgq
         umxFcC2lHn4AwgHaMqw23bSPQycZGGAICwzLGo5f7noBh8QqOiY/o4iIgT0ldCk9d3y6
         nO+xPcOn9deb9dhQDBPVFL54TTRTQzGW/iPYj7a4oQqc6Wp2AFDFnn/ZGASH2DxCBnc/
         haEK0+ho+LgDcxcq8KUDlyU8veNk96NTyQ3N78B8IDLVoCT4Al6s1tp7qT8aKa1f42nn
         n6JYepCb1CfJIyrdgUFMy2/QkjlcLR+M2uK1LEsM2aSMHc/bfuw/aDBeSQkcLvsT1XlW
         CTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723547140; x=1724151940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5cBuzogpd8gMkbixAeAjusMFpgm6dK1chnhfZEM0Y4U=;
        b=EAzey4U3bf9FRP2je0XccNrmA9AlG8pAyjc+lxVCOtWyoZVU+/ajTA1InpU+l1oy6I
         PsWOL057uyUXL7ub01pNmfCsqsqVt7M6zIOZxzgHnAvrMSfNZjM58X7IZ2Ija5DpgCeS
         PQ6T9MmcDpcunY3SBIpEcrgpilL7+WajokWD+KMr4wh50ebs38hnAt1zeU7u/bCrl8mR
         mXiBfxhT+xrtl4zwfIZlfsrUHaC3sPuEV6AAmEaX3qJqKzNb3BeapiryCII7WgJzPtJz
         kcbiOkD7y892AJ8z+An4eM/jDgJtcJ+aaJU9lEWYEoO/kpmK96cyOD2mWpg8sSV0BZ2X
         /SOw==
X-Forwarded-Encrypted: i=1; AJvYcCVTn0RtPgO0m/RZt+VceQFi3bfUjuCOfH4/bpjArqrK3lmfpzW440/s/D6RLsJjDD26iy0MNFlIpxdTAWoR7tXDM7oq/vW+BCOu098=
X-Gm-Message-State: AOJu0YzRFSljaJkcHYq8uKrowgwqCsWB2UVUyvOal9ZOOvoOjKLic0WJ
	NHPgF+FDeCTEmtw6iri1rXgCurPsGI5PHN79siwyAz4RAx4vHzCpiBwzfCIGln4=
X-Google-Smtp-Source: AGHT+IFiZTH9j5mdKPKn39rAs6+/KYQhEGjUFUmWzvbDURkbTzeVB5FHM6jC9YjWe34y5y9qua4MsQ==
X-Received: by 2002:a05:6402:510c:b0:5bb:9ae0:4a3e with SMTP id 4fb4d7f45d1cf-5bd44c65ae6mr1844917a12.29.1723547140178;
        Tue, 13 Aug 2024 04:05:40 -0700 (PDT)
Received: from ?IPV6:2003:e5:8741:4a00:60e5:7bee:fc48:e85c? (p200300e587414a0060e57beefc48e85c.dip0.t-ipconnect.de. [2003:e5:8741:4a00:60e5:7bee:fc48:e85c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd190acec1sm2876417a12.31.2024.08.13.04.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 04:05:39 -0700 (PDT)
Message-ID: <9e17891e-2c5b-4fcf-b02e-45ccf24c0524@suse.com>
Date: Tue, 13 Aug 2024 13:05:38 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] kernel NULL pointer dereference in xen-balloon with
 mem hotplug
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 regressions@lists.linux.dev
References: <ZrSecpuTN9zgtqYu@mail-itl>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <ZrSecpuTN9zgtqYu@mail-itl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08.08.24 12:31, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> When testing Linux 6.11-rc2, I've got the crash like below. It's a PVH
> guest started with 400MB memory, and then extended via mem hotplug (I
> don't know to what exact size it was at this time, but up to 4GB), it
> was quite early in the domU boot process, I suspect it could be the
> first mem hotplug even happening there.
> Unfortunately I don't have reliable reproducer, it crashed only once
> over several test runs. I don't remember seeing such crash before, so it
> looks like a regression in 6.11. I'm not sure if that matters, but it's
> on ADL, very similar to the qubes-hw2 gitlab runner.
> 
> The crash message:
> 
>      [    3.606538] BUG: kernel NULL pointer dereference, address: 0000000000000000
>      [    3.606556] #PF: supervisor read access in kernel mode
>      [    3.606568] #PF: error_code(0x0000) - not-present page
>      [    3.606580] PGD 0 P4D 0
>      [    3.606590] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
>      [    3.606603] CPU: 1 UID: 0 PID: 45 Comm: xen-balloon Not tainted 6.11.0-0.rc2.1.qubes.1.fc37.x86_64 #1
>      [    3.606623] RIP: 0010:phys_pmd_init+0x96/0x500
>      [    3.606636] Code: 89 ed 48 c1 e8 12 48 81 e7 00 00 e0 ff 25 f8 0f 00 00 4c 8d af 00 00 20 00 4c 8d 24 03 48 8b 1c 24 4c 39 fd 0f 83 89 02 00 00 <49> 8b 0c 24 48 f7 c1 9f ff ff ff 0f 84 b6 01 00 00 48 8b 05 d2 99
>      [    3.606680] RSP: 0018:ffffc90000987b90 EFLAGS: 00010287
>      [    3.606695] RAX: 0000000000000000 RBX: 8000000000000163 RCX: 0000000000000004
>      [    3.606713] RDX: 0000000090000000 RSI: 0000000080000000 RDI: 0000000080000000
>      [    3.606729] RBP: 0000000080000000 R08: 8000000000000163 R09: 0000000000000001
>      [    3.606748] R10: 0000000000000000 R11: 0000000000ffff0a R12: 0000000000000000
>      [    3.606766] R13: 0000000080200000 R14: 0000000000000000 R15: 0000000090000000
>      [    3.606784] FS:  0000000000000000(0000) GS:ffff888018500000(0000) knlGS:0000000000000000
>      [    3.606802] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>      [    3.606819] CR2: 0000000000000000 CR3: 00000000107bc000 CR4: 0000000000750ef0
>      [    3.606840] PKRU: 55555554
>      [    3.606847] Call Trace:
>      [    3.606854]  <TASK>
>      [    3.606862]  ? __die+0x23/0x70
>      [    3.606876]  ? page_fault_oops+0x95/0x190
>      [    3.606887]  ? exc_page_fault+0x76/0x190
>      [    3.606900]  ? asm_exc_page_fault+0x26/0x30
>      [    3.606917]  ? phys_pmd_init+0x96/0x500
>      [    3.606927]  phys_pud_init+0xe8/0x4f0
>      [    3.606940]  __kernel_physical_mapping_init+0x1d5/0x380
>      [    3.606955]  ? synchronize_rcu_normal.part.0+0x45/0x70
>      [    3.606971]  init_memory_mapping+0xb0/0x1f0
>      [    3.606983]  arch_add_memory+0x2f/0x50
>      [    3.606997]  add_memory_resource+0xff/0x2c0
>      [    3.607008]  reserve_additional_memory+0x162/0x1d0
>      [    3.607026]  balloon_thread+0xe4/0x490
>      [    3.607041]  ? __pfx_autoremove_wake_function+0x10/0x10
>      [    3.607060]  ? __pfx_balloon_thread+0x10/0x10
>      [    3.607076]  kthread+0xcf/0x100
>      [    3.607090]  ? __pfx_kthread+0x10/0x10
>      [    3.607101]  ret_from_fork+0x31/0x50
>      [    3.607112]  ? __pfx_kthread+0x10/0x10
>      [    3.607123]  ret_from_fork_asm+0x1a/0x30
>      [    3.607135]  </TASK>
>      [    3.607141] Modules linked in: xenfs binfmt_misc nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nfnetlink intel_rapl_msr intel_rapl_common intel_uncore_frequency_common crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmulni polyval_generic ghash_clmulni_intel sha512_ssse3 sha256_ssse3 sha1_ssse3 xen_netfront xen_privcmd xen_gntdev xen_gntalloc xen_blkback xen_evtchn loop fuse ip_tables overlay xen_blkfront
>      [    3.607266] CR2: 0000000000000000
>      [    3.607277] ---[ end trace 0000000000000000 ]---
>      [    3.607291] RIP: 0010:phys_pmd_init+0x96/0x500
>      [    3.607307] Code: 89 ed 48 c1 e8 12 48 81 e7 00 00 e0 ff 25 f8 0f 00 00 4c 8d af 00 00 20 00 4c 8d 24 03 48 8b 1c 24 4c 39 fd 0f 83 89 02 00 00 <49> 8b 0c 24 48 f7 c1 9f ff ff ff 0f 84 b6 01 00 00 48 8b 05 d2 99
>      [    3.607356] RSP: 0018:ffffc90000987b90 EFLAGS: 00010287
>      [    3.607371] RAX: 0000000000000000 RBX: 8000000000000163 RCX: 0000000000000004
>      [    3.607389] RDX: 0000000090000000 RSI: 0000000080000000 RDI: 0000000080000000
>      [    3.607406] RBP: 0000000080000000 R08: 8000000000000163 R09: 0000000000000001
>      [    3.607428] R10: 0000000000000000 R11: 0000000000ffff0a R12: 0000000000000000
>      [    3.607449] R13: 0000000080200000 R14: 0000000000000000 R15: 0000000090000000
>      [    3.607469] FS:  0000000000000000(0000) GS:ffff888018500000(0000) knlGS:0000000000000000
>      [    3.607488] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>      [    3.607504] CR2: 0000000000000000 CR3: 00000000107bc000 CR4: 0000000000750ef0
>      [    3.607525] PKRU: 55555554
>      [    3.607533] Kernel panic - not syncing: Fatal exception
>      [    3.607599] Kernel Offset: disabled
> 
> Full domU log:
> https://openqa.qubes-os.org/tests/108883/file/system_tests-qubes.tests.integ.vm_qrexec_gui.TC_20_NonAudio_whonix-workstation-17.test_105.guest-test-inst-vm2.log
> Other logs, including dom0 and Xen messages:
> https://openqa.qubes-os.org/tests/108883#downloads
> 
> Kernel config is build from merging
> https://github.com/QubesOS/qubes-linux-kernel/blob/005ae1ac3819d957379e48fb2cfd33f511a47275/config-base
> with
> https://github.com/QubesOS/qubes-linux-kernel/blob/005ae1ac3819d957379e48fb2cfd33f511a47275/config-qubes
> (options set in the latter takes precedence)
> Especially, it has:
> CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=y
> CONFIG_XEN_UNPOPULATED_ALLOC=y
> 
> #regzbot introduced: v6.10..v6.11-rc2
> 

Not sure this is Xen code related. There have been several patches
to mm/memory_hotplug.c in the 6.11 merge window.


Juergen
