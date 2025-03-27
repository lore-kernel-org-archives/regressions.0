Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7DE20CCF2
	for <regressions@lists.linux.dev>; Thu, 27 Mar 2025 10:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070482; cv=none; b=n1HBC0uWss10TLhHJhPmWtlMO0Gf2rTSR2IKpk0OPlgescGuiXjsC/w1bOx5tgnjwVvAhqQW0AiwTTmsKuaJemyDTzZvji4DdcW91YOBfgIOu712oLI5DASuVkgNNZdA5DDDkt2uT5edWn34ckd2FRjGtH7IZOQdZuJ+hEmxRjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070482; c=relaxed/simple;
	bh=mBOblcfMWCKyDXGapWwCTQYegZlR2y8I30LIqPbI/Es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nq8VuQbNlW2gVvhwF2yMhlKjoTB4lfMqFWg4ay3BXzh3zGdBXo6hsoq6ghVa96c1vabF4r6S1KbFLO0rqPQ+Aq5PJ52+l0jTfADNhl+oQ1B2i8rOmecm9hIjDqKwklj3luLgf4hpMJ3frVS8CIJRgibD3Zdw9Uz2nkLwJlvG/HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=I6AMo9cq; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="I6AMo9cq"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso373693f8f.2
        for <regressions@lists.linux.dev>; Thu, 27 Mar 2025 03:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743070479; x=1743675279; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8QIJATbl4wLG4OdrsHUeIGEbyiXBb/oACeqPdaFMavw=;
        b=I6AMo9cq33W1NDYKCDuTJYPbkr44tYmTa/mujEDA4ZQr9oDRR6V72XJlVRKTJQ2JDl
         jCztqB3fbkM+v8ZpKGrqUxKaowyiVpF/X+YvGf3ZYulqczf8mLzasYbuxQeArRiD1X1J
         lKqNvCDN4KrbyoT/q0nza3O5E18GhCxL2z1xX800/hfufeXPULJTgB1VRx8F9aIllobc
         XGzOvTMCJSyRM/upPynmlbssHkJlMVBnxuATBYZnh5AuK4v8Wbn6F4FNlaK51Bmgfvw7
         VX2Bs3OgwDlvT5xapStB1zITP7as/FfKnH8oClCiM6SUgJ+3fIYSaX3+myIKPnKQOmUH
         N32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070479; x=1743675279;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QIJATbl4wLG4OdrsHUeIGEbyiXBb/oACeqPdaFMavw=;
        b=oA1P9NSEiN2HtG47sRYe1WLW3zCTKbdMdatQsToaRwX2kCFgloeOgSwt5v5VUya1xE
         iiGq6U32MrYdWiJ8ek9HyKjula2kcKpxnRaf/mYUuCiIP859OTjZKqYvevAhp+PQ5im0
         LgsoO4Uj4ECfI10xyKIiPmAXXCCNALUmxkqQsvLfhh9HrjL+zGqQtXaJ5UW8TOi6rJN3
         Zdcy5XyMpiXGQjIHgTyrd+qxs3GM0Ls0H9qgqjUm4JJieDpSs3kOdVirq1P2+mP0Nspy
         nWVYroppIcMnIFK4V70CAtmDg9Y+OOCZIgZ62ThD8B9lEw2BOPdyErpqSpxvCu/kenFQ
         aI2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqxW/reTAvXBkGY17cB9z6KAluDTb8QcS3afqJXPK8clgD9GI04Cc0XWqkHNy+1HJoXaW/PYodqNhRIw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGQAuKv7q6G09DhrdnQziNsuQhiQkO28tOdVMOezJ6PZ+mc/We
	quS0Y7JNsQEWZv1gAk7f9/6x3B7cXTtmrgqf1r0fMAat6n8ETjjx71WP9XdoPQ==
X-Gm-Gg: ASbGncsg+yiDbGuXTyP7kca0dsec20osTILl8ctUucqdDogNKvgQEK4qxIC1OiyrR1j
	Agbh++zTtRXnCB72tqw7uEFwHgizx0iVnrLL7KpLrc+Z8pEKex3EkGcdAZjT1futprRh17FEbTx
	X4XGe9OTW9fQ4pwtaXVVcMkq7LLJZBgRTwYN5QVd6mkNqGqtZZy46yJhxuZ/AE8C6nfoeOq9d1L
	nRXhAMJHRDqwyyflBaB9Os0/p2ZD9W1d7bGsOaRu55G6sL0ckadpuexQXU7Ew8+zMhYr0aQOcNp
	HxZE7OQvgd1hC5d6H/Z2IZxqIBk+bT2aiJdCAETAm+ooWqVD1nnRSsaxAayf0IVgxctSOYQBH0k
	BR2VR0h/KcsxY5VylejdGKQZOFc6oWQ==
X-Google-Smtp-Source: AGHT+IHgHVz/7dbVkSCT2Llln75bv9PXy0vAF5ynyfKbcKddVwqAfZuLGuMyHldhkr298BSA9jh8aw==
X-Received: by 2002:a05:6000:2ca:b0:38f:503a:d93f with SMTP id ffacd0b85a97d-39ad1770526mr2679967f8f.40.1743070478824;
        Thu, 27 Mar 2025 03:14:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f995423sm19196181f8f.20.2025.03.27.03.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 03:14:38 -0700 (PDT)
Message-ID: <3796f2d9-738f-4cdf-a4a2-61c4aa99c310@suse.com>
Date: Thu, 27 Mar 2025 11:14:37 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: NULL pointer dereference in cpufreq_update_limits(?) under Xen PV
 dom0 - regression in 6.13
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, regressions@lists.linux.dev,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
References: <Z-ShAR59cTow0KcR@mail-itl>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <Z-ShAR59cTow0KcR@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2025 01:51, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> I've got a report[1] that 6.13.6 crashes as listed below. It worked fine in
> 6.12.11. We've tried few simple things to narrow the problem down, but
> without much success.
> 
> This is running in Xen 4.17.5, PV dom0, which probably is relevant here.
> This is running on AMD Ryzen 9 7950X3D, with ASRock X670E Taichi
> motherboard.
> There are few more details in the original report (link below).
> 
> The kernel package (including its config saved into /boot) is here:
> https://yum.qubes-os.org/r4.2/current/host/fc37/rpm/kernel-latest-6.13.6-1.qubes.fc37.x86_64.rpm
> https://yum.qubes-os.org/r4.2/current/host/fc37/rpm/kernel-latest-modules-6.13.6-1.qubes.fc37.x86_64.rpm
> 
> The crash message:
> [    9.367048] BUG: kernel NULL pointer dereference, address: 0000000000000070
> [    9.368251] #PF: supervisor read access in kernel mode
> [    9.369273] #PF: error_code(0x0000) - not-present page
> [    9.370346] PGD 0 P4D 0
> [    9.371222] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
> [    9.372114] CPU: 0 UID: 0 PID: 128 Comm: kworker/0:2 Not tainted 6.13.6-1.qubes.fc37.x86_64 #1
> [    9.373184] Hardware name: ASRock X670E Taichi/X670E Taichi, BIOS 3.20 02/21/2025
> [    9.374183] Workqueue: kacpi_notify acpi_os_execute_deferred
> [    9.375124] RIP: e030:cpufreq_update_limits+0x10/0x30
> [    9.375840] Code: 84 00 00 00 00 00 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 05 98 e4 21 02 <48> 8b 40 70 48 85 c0 74 06 e9 a2 36 38 00 cc e9 ec fe ff ff 66 66
> [    9.377009] RSP: e02b:ffffc9004058be28 EFLAGS: 00010246
> [    9.377667] RAX: 0000000000000000 RBX: ffff888005bf4800 RCX: ffff88805d635fa8
> [    9.378415] RDX: ffff888005bf4800 RSI: 0000000000000085 RDI: 0000000000000000
> [    9.379127] RBP: ffff888005cd7800 R08: 0000000000000000 R09: 8080808080808080
> [    9.379887] R10: ffff88800391abc0 R11: fefefefefefefeff R12: ffff888004e8aa00
> [    9.380669] R13: ffff88805d635f80 R14: ffff888004e8aa15 R15: ffff8880059baf00
> [    9.381514] FS:  0000000000000000(0000) GS:ffff88805d600000(0000) knlGS:0000000000000000
> [    9.382345] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    9.383045] CR2: 0000000000000070 CR3: 000000000202c000 CR4: 0000000000050660
> [    9.383786] Call Trace:
> [    9.384335]  <TASK>
> [    9.384886]  ? __die+0x23/0x70
> [    9.385456]  ? page_fault_oops+0x95/0x190
> [    9.386036]  ? exc_page_fault+0x76/0x190
> [    9.386636]  ? asm_exc_page_fault+0x26/0x30
> [    9.387215]  ? cpufreq_update_limits+0x10/0x30
> [    9.387805]  acpi_processor_notify.part.0+0x79/0x150
> [    9.388402]  acpi_ev_notify_dispatch+0x4b/0x80
> [    9.389013]  acpi_os_execute_deferred+0x1a/0x30
> [    9.389610]  process_one_work+0x186/0x3b0
> [    9.390205]  worker_thread+0x251/0x360
> [    9.390765]  ? srso_alias_return_thunk+0x5/0xfbef5
> [    9.391376]  ? __pfx_worker_thread+0x10/0x10
> [    9.391957]  kthread+0xd2/0x100
> [    9.392493]  ? __pfx_kthread+0x10/0x10
> [    9.393043]  ret_from_fork+0x34/0x50
> [    9.393575]  ? __pfx_kthread+0x10/0x10
> [    9.394090]  ret_from_fork_asm+0x1a/0x30
> [    9.394621]  </TASK>
> [    9.395106] Modules linked in: gpio_generic amd_3d_vcache acpi_pad(-) loop fuse xenfs dm_thin_pool dm_persistent_data dm_bio_prison amdgpu amdxcp i2c_algo_bit drm_ttm_helper ttm crct10dif_pclmul drm_exec crc32_pclmul gpu_sched
> crc32c_intel drm_suballoc_helper polyval_clmulni drm_panel_backlight_quirks polyval_generic drm_buddy ghash_clmulni_intel sha512_ssse3 drm_display_helper sha256_ssse3 sha1_ssse3 xhci_pci cec nvme sp5100_tco xhci_hcd nvme_core nvme_auth
> video wmi xen_acpi_processor xen_privcmd xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn scsi_dh_rdac scsi_dh_emc scsi_dh_alua uinput dm_multipath
> [    9.398698] CR2: 0000000000000070
> [    9.399266] ---[ end trace 0000000000000000 ]---
> [    9.399880] RIP: e030:cpufreq_update_limits+0x10/0x30
> [    9.400528] Code: 84 00 00 00 00 00 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 05 98 e4 21 02 <48> 8b 40 70 48 85 c0 74 06 e9 a2 36 38 00 cc e9 ec fe ff ff 66 66
> [    9.401673] RSP: e02b:ffffc9004058be28 EFLAGS: 00010246
> [    9.402316] RAX: 0000000000000000 RBX: ffff888005bf4800 RCX: ffff88805d635fa8
> [    9.403060] RDX: ffff888005bf4800 RSI: 0000000000000085 RDI: 0000000000000000
> [    9.403819] RBP: ffff888005cd7800 R08: 0000000000000000 R09: 8080808080808080
> [    9.404581] R10: ffff88800391abc0 R11: fefefefefefefeff R12: ffff888004e8aa00
> [    9.405332] R13: ffff88805d635f80 R14: ffff888004e8aa15 R15: ffff8880059baf00
> [    9.406063] FS:  0000000000000000(0000) GS:ffff88805d600000(0000) knlGS:0000000000000000
> [    9.406830] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    9.407561] CR2: 0000000000000070 CR3: 000000000202c000 CR4: 0000000000050660
> [    9.408318] Kernel panic - not syncing: Fatal exception
> [    9.409022] Kernel Offset: disabled
> (XEN) Hardware Dom0 crashed: 'noreboot' set - not rebooting.
> 
> Looking at the call trace, it's likely related to ACPI, and Xen too, so
> I'm adding relevant lists too.
> 
> Any ideas?
> 
> #regzbot introduced: v6.12.11..v6.13.6

That code looks to have been introduced for 6.9, so I wonder if so far you merely
were lucky not to have observed any "highest perf changed" notification. See
9c4a13a08a9b ("ACPI: cpufreq: Add highest perf change notification"), which imo
merely adds a 2nd path to a pre-existing problem: cpufreq_update_limits() assumes
that cpufreq_driver is non-NULL, and only checks cpufreq_driver->update_limits.
But of course the assumption there may be legitimate, and it's logic elsewhere
which is or has become flawed.

Jan
