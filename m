Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0003B71AC
	for <regressions@lists.linux.dev>; Tue, 28 Jul 2026 12:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785243350; cv=none; b=Ir9YGKvQKtuGVTSjOrVsD/+23cuoYtVCIqz2zs2dQj2ZZZILtAknV4mY86MFqL5rIHgVhPVycPfu38Pp95b2F9kUzRc8r7JjUryTuUa7s6QvixaOD23hVGR34naYxdQGLNNVB2LBgCox92WV5I/lZCbLH7b3t7sZNptVFmRIwtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785243350; c=relaxed/simple;
	bh=O8WC6MkAjbjOGPhciENy/M68GTHA7aJo3luxOuToxzU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=GN05yUJnZXYaKd7DJT618dlZMvql7qucCHnORvLtwHemmi5tq1NWq9sraHmg5N0Qx93c4LohFOD3dMsHh8avWmpxbXbJDlDd6l0tbVrJ59b1FJJCAx9H9yL5WELKmoQPbPjaaA8zuZsZrnOuusblIDFOGs65JC1Y/v3Rw5s0RNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NvM+TKFc; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NvM+TKFc"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bfb3347ce0so1184064e0c.2
        for <regressions@lists.linux.dev>; Tue, 28 Jul 2026 05:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785243347; x=1785848147; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vnkFDZWqR5ytpQ4iGipyAov7bXJjFdR1vjkKVJosivA=;
        b=NvM+TKFcbKeiSwNOHaUyKY6SdA86WeEjPnt5j9zBrJ0RGDYaSfNAT/w5OA2+1Wj4RH
         t8ojoUOB5ZaBdvygH1JV22qTPamXPTM3D+dv0dXsPcxgd7FdsxSMYiFMNnFJjvJnU+Zn
         Cdq04cGnlCd2IlQDc08woKwtNZ9gg9QcWbF3XXVUeJjZyLC/uhWM1iz6tGraxb/7d7ys
         cXeuHkZamGHwp3xrngCWGTIsYanexirKbeBMJgpwXBwsiQnktBcQqVEB2/o1+YRxgLbj
         aqO2Zr0Qb4xJlO3g7Zp9E9udpZ4OaUSbOGFgoyQPd/UeVYJBoBcZwDjw/crWfg2Gc2+e
         ZNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785243347; x=1785848147;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vnkFDZWqR5ytpQ4iGipyAov7bXJjFdR1vjkKVJosivA=;
        b=h47TlOBJHB+Hu5jA0DJTFIGOkikyd50fj6AyY2Z4YHgHoM7mqJi1O5cyS9fLvwXJI1
         QvjUloScXjfIHZ9DtmbXNRalP5Qf/FgZBExolVT4z1T21VJQfAR9nXecHqap5dz0tBLO
         si8eetYm3IDLqO5HpWnwdMLFbTVcRsIGNiIs9yQZjsYZo/FTTprhZzW/323VdhT5Kv72
         CJM/pLFKth1uqP+lRBBHzkXaNm3xgUBefyPCvQ8lok9QUbVivMS1i5JCcmnoCflooS3o
         8qPXHxLCZLmWbvpDGkueRCQSqWq5EvarW05NUsmGcIkKMR/AFUep0FErlAmt7cqXJ4fv
         yymQ==
X-Forwarded-Encrypted: i=1; AHgh+RpD9mFak3H/fHC1NjP2Cnz0OffXwQCtTpcf0VhkZu1S3AzbVDAX7DjR5YO0e1ioFjVJk6Y9Vq1iwCSVpQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwraK86WJ8xVXEX1B7d21wjpUtsbm4krtrg55ukv+tHcdef+K7J
	BJ2Qu6jSy6EKrgkaete4woq7Z7MNLG98LXVbyaT58L7QoaqYDsGAEEiOKsMlNIY=
X-Gm-Gg: AR+sD1012KIkPlHOpFOzMQc4i/zNg/3QO6EgaZf4fczB/8rMdG7i3YPn+Hc5YQasGQR
	byYUpqaycAZ/3WbDmE6YkvYTwhSb0szL95Nxtal1PRoZjGemiyY5vh7AKIjuffLjQSyD2I7yBNM
	Qk+NHO8+od8Cvzy/SfO311Vhb3sPAx6KW5+irIYhJaiWhk7y/WFuBWWibz0yzjN2DTTVueW8kin
	JN/8sT6HSEyI5iQiPx+I+vJD2Vgi3GIQYDTDlqfzBgkNAbuNd+jDUg89fHGnLtxxWD3x21aKDrT
	7G+Kq+7AAVDbkctoFbkcvza8qxvy4oW8f1toYGBOPEHWF72X4jkCurhsRWuJHLIPCslB8o17SJP
	4/SlWdXbrtP/iEg4FtHrZzK6L8Kt9Nvr4xOLUDx5KIYHS0v2Rux3z0/nQWTjryHsRDf8hQjYTR6
	zos07vE5yHapFHO7w1rPQji7gw2ap6GtLeirPW4V0r
X-Received: by 2002:a05:6123:2c2:b0:5c1:2b9a:7cae with SMTP id 71dfb90a1353d-5c33f975e82mr766980e0c.6.1785243346896;
        Tue, 28 Jul 2026 05:55:46 -0700 (PDT)
Received: from [120.7.1.23] (135-23-94-154.cpe.pppoe.ca. [135.23.94.154])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c3054a709esm9205840e0c.7.2026.07.28.05.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:55:46 -0700 (PDT)
Subject: Re: [Regression] Kernel 7.2-rc : thunderbolt crash on startup
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <784d45c6-1b96-825e-3686-074dbf8a2d58@gmail.com>
 <98b6d591-4b65-4b93-899d-77f27f2367ad@leemhuis.info>
From: Woody Suwalski <terraluna977@gmail.com>
Message-ID: <ee77d8e8-0d4f-fcb0-119e-1a9ac0e06884@gmail.com>
Date: Tue, 28 Jul 2026 08:56:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:140.0) Gecko/20100101
 Firefox/140.0 SeaMonkey/2.53.24
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <98b6d591-4b65-4b93-899d-77f27f2367ad@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thorsten Leemhuis wrote:
> On 7/8/26 22:09, Woody Suwalski wrote:
>> Re: commit f5cc545f59699549adbaa4084149f8247865a51d
>> Author: Mika Westerberg <mika.westerberg@linux.intel.com>
>> Date:   Wed Nov 19 12:53:58 2025 +0200
>>
>>      thunderbolt: Wait for tb_domain_release() to complete when driver is
>> removed
>>
>> ====================
>>
>> Mika, starting with7.2-rc1 the boot on an old Apple MacBookPro and
>> MacBook Air has been problematic - the thunderbolt driver crash may stop
>> boot or let it boot in somehow unstable state.
> Seems this fell through the cracks (due to vacations or something I
> assume -- so no worries!), but to ensure this is not totally forgotten:
>
> Woddy, does this still happen with 7.2-rc5? And is the fix you proposed
> still helping?
> https://lore.kernel.org/lkml/62caf7f8-b403-d0dd-15bc-b31b56f71c28@gmail.com/
>
> Ciao, Thorsten
>
Hi Thorsten,

Mika is now back from holidays and we are starting to discuss the fix.
So most likely it will now be cleared in an one or two rc releases :-)

Thanks, Woody
>> The issue is the domain_release()/complete() crash as called during boot.
>>
>> Just disabling the
>>
>> complete(&nhi->domain_released);
>>
>> line will allow system to boot OK, however (as designed in your patch)
>> on shutdown system will hang waiting for completion.
>>
>> I am not sure if the workaround should be to detect that
>> domain_release() is called during startup, or perhaps to fix the problem
>> on the kernel scheduler level?
>>
>> If you have any ideas or patches, let me know...
>>
>> Thanks, Woody Suwalski
>> terraluna977@gmail.com
>>
>> =========================
>> [   10.531967] [   T2588] bcma-pci-bridge 0000:03:00.0: bus0: Core 2
>> found: PCIe (manuf 0x4BF, id 0x820, rev 0x1
>> 3, class 0x0)
>> [   10.570223] [   T2604] ACPI: bus type thunderbolt registered
>> [   10.580666] [   T2604] BUG: unable to handle page fault for address:
>> fffffffffffffff8
>> [   10.580745] [   T2604] #PF: supervisor read access in kernel mode
>> [   10.580796] [   T2604] #PF: error_code(0x0000) - not-present page
>> [   10.580844] [   T2604] PGD 2ec19067 P4D 2ec19067 PUD 2ec1b067 PMD 0
>> [   10.580915] [   T2604] Oops: Oops: 0000 [#1] SMP NOPTI
>> [   10.580929] [   T2603] acpi ACPI0001:00: SBS HC: offset = 0x20,
>> query_bit = 0x10
>> [   10.580968] [   T2604] CPU: 3 UID: 0 PID: 2604 Comm: (udev-worker)
>> Tainted: G S                  7.2-pingu #0~rc1 PREEMPT(full)
>> 9f8aaa247129d19aebb6b0d19f7b648b1f9f7f36
>> [   10.581126] [   T2604] Tainted: [S]=CPU_OUT_OF_SPEC
>> [   10.581165] [   T2604] Hardware name: Apple Inc. MacBookPro8,1/
>> Mac-94245B3640C91C81, BIOS MBP81.88Z.0050.B00.1804101331 04/10/18
>> [   10.581248] [   T2604] RIP: 0010:complete+0x3a/0x70
>> [   10.581301] [   T2604] Code: 61 c8 00 48 89 c5 8b 03 83 f8 ff 74 05
>> 83 c0 01 89 03 48 8b 53 10 48 8d 43 10 48 39 c2 74 29 48 8b 5b 10 31 d2
>> be 03 00 00 00 <48> 8b 7b f8 e8 4d e9 fd ff 48 8b 13 48 8b 43 08 48 89
>> 42 08 48 89
>> [   10.581441] [   T2604] RSP: 0018:ffff92720020ba98 EFLAGS: 00010046
>> [   10.581496] [   T2604] RAX: ffff8c82c6a2b3b0 RBX: 0000000000000000
>> RCX: 000000000000000c
>> [   10.581559] [   T2604] RDX: 0000000000000000 RSI: 0000000000000003
>> RDI: ffff8c82c6a2b3a8
>> [   10.581621] [   T2604] RBP: 0000000000000282 R08: 0000000000000000
>> R09: 0000000000000000
>> [   10.581681] [   T2604] R10: 0000000000000001 R11: ffff8c832ba20d80
>> R12: ffff8c82c6a2b3a8
>> [   10.581744] [   T2604] R13: ffff8c82c81f02b0 R14: 0000000000000000
>> R15: ffff8c82c6e53148
>> [   10.581808] [   T2604] FS:  00007ffaf52c99c0(0000)
>> GS:ffff8c839ad88000(0000) knlGS:0000000000000000
>> [   10.581881] [   T2604] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   10.581935] [   T2604] CR2: fffffffffffffff8 CR3: 0000000105596002
>> CR4: 00000000000606f0
>> [   10.581999] [   T2604] Call Trace:
>> [   10.582032] [   T2604]  <TASK>
>> [   10.582061] [   T2604]  device_release+0x3a/0x90
>> [   10.582112] [   T2604]  kobject_put+0x8a/0x230
>> [   10.582166] [   T2604]  icm_probe+0xf2/0x550 [thunderbolt
>> 2f2c536023810e0da91d9b6d6a63a9f9bf553e73]
>> [   10.582415] [   T2604]  nhi_probe+0x196/0x390 [thunderbolt
>> 2f2c536023810e0da91d9b6d6a63a9f9bf553e73]
>> [   10.582620] [   T2604]  local_pci_probe+0x3c/0x90
>> [   10.582668] [   T2604]  pci_device_probe+0xb0/0x1d0
>> [   10.582715] [   T2604]  ? sysfs_do_create_link_sd+0x69/0xd0
>> [   10.582778] [   T2604]  really_probe+0xd1/0x3e0
>> [   10.582826] [   T2604]  ? __pfx___driver_attach+0x10/0x10
>> [   10.582878] [   T2604]  __driver_probe_device+0x80/0x180
>> [   10.582931] [   T2604]  driver_probe_device+0x1a/0x80
>> [   10.582983] [   T2604]  __driver_attach+0xca/0x1f0
>> [   10.583031] [   T2604]  bus_for_each_dev+0x6d/0xc0
>> [   10.583079] [   T2604]  bus_add_driver+0x11b/0x240
>> [   10.583128] [   T2604]  driver_register+0x50/0x100
>> [   10.583178] [   T2604]  ? __pfx_init_module+0x10/0x10 [thunderbolt
>> 2f2c536023810e0da91d9b6d6a63a9f9bf553e73]
>> [   10.583404] [   T2604]  nhi_init+0x30/0xff0 [thunderbolt
>> 2f2c536023810e0da91d9b6d6a63a9f9bf553e73]
>> [   10.583606] [   T2604]  ? __pfx_init_module+0x10/0x10 [thunderbolt
>> 2f2c536023810e0da91d9b6d6a63a9f9bf553e73]
>> [   10.583805] [   T2604]  do_one_initcall+0x6b/0x2c0
>> [   10.583851] [   T2604]  ? do_init_module+0x1d/0x270
>> [   10.583895] [   T2604]  do_init_module+0x5b/0x270
>> [   10.583935] [   T2604]  init_module_from_file+0xc3/0xe0
>> [   10.583982] [   T2604]  idempotent_init_module+0xf7/0x2e0
>> [   10.584029] [   T2604]  __x64_sys_finit_module+0x68/0xe0
>> [   10.584075] [   T2604]  do_syscall_64+0xc2/0x550
>> [   10.586162] [   T2604]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> [   10.588198] [   T2604] RIP: 0033:0x7ffaf5e277b9
>> [   10.590222] [   T2604] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f
>> 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b
>> 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 27 66 0d 00 f7 d8
>> 64 89 01 48
>> [   10.594678] [   T2604] RSP: 002b:00007ffd1d772f38 EFLAGS: 00000246
>> ORIG_RAX: 0000000000000139
>> [   10.597004] [   T2604] RAX: ffffffffffffffda RBX: 0000561fac083800
>> RCX: 00007ffaf5e277b9
>> [   10.599213] [   T2604] RDX: 0000000000000000 RSI: 00007ffaf455a44d
>> RDI: 0000000000000027
>> [   10.601423] [   T2604] RBP: 0000000000000000 R08: 0000000000000000
>> R09: 0000561fac003030
>> [   10.603602] [   T2604] R10: 0000000000000000 R11: 0000000000000246
>> R12: 00007ffaf455a44d
>> [   10.605753] [   T2604] R13: 0000000000020000 R14: 0000561fac082060
>> R15: 0000000000000000
>> [   10.607706] [   T2604]  </TASK>
>> [   10.609330] [   T2604] Modules linked in: sbshc bcma(+)
>> thunderbolt(+) usb_common sg efi_pstore nvme_fabrics fuse configfs
>> efivarfs dmi_sysfs autofs4
>> [   10.610939] [   T2604] CR2: fffffffffffffff8
>> [   10.612390] [   T2604] ---[ end trace 0000000000000000 ]---
>> [   10.615077] [   T2588] bcma-pci-bridge 0000:03:00.0: bus0: Bus
>> registered
>>
>>

