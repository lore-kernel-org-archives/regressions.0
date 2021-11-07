Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E092C99
	for <regressions@lists.linux.dev>; Sun,  7 Nov 2021 12:00:23 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id r8so21669121wra.7
        for <regressions@lists.linux.dev>; Sun, 07 Nov 2021 04:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:message-id:date:mime-version:user-agent:subject
         :content-language:references:to:in-reply-to
         :content-transfer-encoding;
        bh=Zt8g/LnTAvNBDiSn+LEG/cLuy1k82jZr1FdxyoZcV2w=;
        b=Yy7lI7x3TVLuvtvIEP6+3kdjDltYSdOjswRxwOGlri1jNVaD9xymf0f0vOm9ZreER1
         wI1mWwTW8dfynNS82rWDXIu14re5FDkTNsUaw4Zh0g5b0Wt+vOXJ/+6WqBZI4IjkNO+N
         fy6SKsvJwTjIJCH2BkZkP/VysdrIDGAkZUER++lC425xERVzp2Xk4WSi7IaOrYNXdM1Z
         sYI8NAkj47h14f7yheSLF1sKO3NN9VIK6d4NX8oO45lcCbgkU25UpI+8WM1fnJU+ni0C
         W++RZtYB5JG+4WgAyla/ZYC0XMQVz5cxiWVH0rI07XT7FnGOuwd6UQ+dl5dnwFsGmBRF
         Gi6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent
         :subject:content-language:references:to:in-reply-to
         :content-transfer-encoding;
        bh=Zt8g/LnTAvNBDiSn+LEG/cLuy1k82jZr1FdxyoZcV2w=;
        b=hlNeOrdtb3+Wag2qUoB73j7Vou5DoGSP0DQm+2LI0wzfWjKGNygV9z2gdoJIcKT9I2
         bj3abKjN24V6lE2kNifbCx5p6MIMxFC4XJxarZzmP5XZ7kJvLcajBCHXDj6VDdyNr0tK
         /y7i8Ra6M4R4wlmMOR8nczMElzvEi5itZBcEW6wAnIqvVM+S97K2rEHidrT6rjdb0+ej
         Ahl+hy8eVGiHdHJoXMJKueKozCfER1a4GECRC+Wyupe/RGePTV3du08PF/0M6ie3+WBo
         GjgXwQV+VOQJqO/gqFAXYF8jaHgc3PXq5CZvXH9AB42dQ0PTXGTdviFYZpqXT7rFmlG3
         WRLA==
X-Gm-Message-State: AOAM5330AgCvwSkCoEPxZlWM7bQ2RlUbf0PfP37IhJl0mYjczhTLSjhl
	9K6aoX2vKJIYuttiOxOgPOUkH/A=
X-Google-Smtp-Source: ABdhPJwDEttk91hN8jGs3aD9qV9+ejB7SlirmOtqJXTH+mxeueb0HMeL8JySJuzyQPHJl04UBL01/Q==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr81525637wrr.189.1636286421569;
        Sun, 07 Nov 2021 04:00:21 -0800 (PST)
Received: from [192.168.0.209] (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.googlemail.com with ESMTPSA id u23sm6183772wru.21.2021.11.07.04.00.20
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Nov 2021 04:00:21 -0800 (PST)
From: "Colin King (gmail)" <colin.i.king@googlemail.com>
X-Google-Original-From: "Colin King (gmail)" <colin.i.king@gmail.com>
Message-ID: <ac0a7716-1f48-cd40-52a0-45ffb6d49aa3@gmail.com>
Date: Sun, 7 Nov 2021 12:00:20 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Fwd: DEAD callback error for CPU, WARNING: CPU: 3 PID: 1134 at
 kernel/cpu.c:1163 _cpu_down+0x20a/0x3a0
Content-Language: en-US
References: <f6a0f4be-ad53-489c-0036-09dead99f368@gmail.com>
To: regressions@lists.linux.dev
In-Reply-To: <f6a0f4be-ad53-489c-0036-09dead99f368@gmail.com>
X-Forwarded-Message-Id: <f6a0f4be-ad53-489c-0036-09dead99f368@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Copying  regressions@lists.linux.dev


-------- Forwarded Message --------
Subject: DEAD callback error for CPU, WARNING: CPU: 3 PID: 1134 at 
kernel/cpu.c:1163 _cpu_down+0x20a/0x3a0
Date: Sun, 7 Nov 2021 11:59:17 +0000
From: Colin King (gmail) <colin.i.king@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner 
<tglx@linutronix.de>
CC: linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>

On a SMP system in a VM, a deadlock callback error can be reproduced 
with 5.15, tested from head at commit 
d4439a1189f93d0ac1eaf0197db8e6b3e197d5c7

Didn't see this issue on 5.13

How to reproduce:

git clone https://github.com/ColinIanKing/stress-ng
cd stress-ng
make -j $(nproc)
sudo ./stress-ng --cpu-online 0 -t 15 --pathological

Tested on a 8 thread virtual machine, 4MB of memory.

[ 2239.378724] smpboot: CPU 6 is now offline
[ 2239.379443] smpboot: Booting Node 0 Processor 6 APIC 0x6
[ 2239.380169] kvm-clock: cpu 6, msr 79201181, secondary cpu clock
[ 2239.401652] ------------[ cut here ]------------
[ 2239.401658] DEAD callback error for CPU6
[ 2239.401721] WARNING: CPU: 3 PID: 1134 at kernel/cpu.c:1163 
_cpu_down+0x20a/0x3a0
[ 2239.401856] Modules linked in: dm_multipath scsi_dh_rdac scsi_dh_emc 
scsi_dh_alua intel_rapl_msr intel_rapl_common kvm_intel 
snd_hda_codec_generic ledtrig_audio snd_hda_intel kvm snd_intel_dspcfg 
snd_intel_sdw_acpi snd_hda_codec rapl joydev input_leds snd_hda_core 
snd_hwdep snd_pcm snd_timer snd serio_raw soundcore qemu_fw_cfg mac_hid 
sch_fq_codel msr virtio_rng ip_tables x_tables autofs4 btrfs 
blake2b_generic zstd_compress raid10 raid456 async_raid6_recov 
async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c raid1 
raid0 multipath linear qxl hid_generic drm_ttm_helper ttm drm_kms_helper 
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel virtio_net syscopyarea 
aesni_intel sysfillrect sysimgblt fb_sys_fops cec usbhid crypto_simd 
net_failover rc_core i2c_i801 ahci hid cryptd i2c_smbus psmouse libahci 
drm lpc_ich virtio_blk failover
[ 2239.402631] CPU: 3 PID: 1134 Comm: stress-ng Not tainted 5.15.0+ #1
[ 2239.402649] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 
1.14.0-2 04/01/2014
[ 2239.402654] RIP: 0010:_cpu_down+0x20a/0x3a0
[ 2239.402664] Code: 8b 03 41 39 c6 7f 6f 39 45 c0 0f 8e 34 ff ff ff 3d 
96 00 00 00 0f 84 be 00 00 00 44 89 ee 48 c7 c7 f3 38 9a 95 e8 26 a2 f9 
ff <0f> 0b e9 13 ff ff ff e8 3a bd 52 ff e9 2a ff ff ff f0 48 0f b3 05
[ 2239.402744] RSP: 0018:ffffa30e008b7cc0 EFLAGS: 00010282
[ 2239.402755] RAX: 0000000000000000 RBX: ffff8ccb7bda0660 RCX: 
0000000000000000
[ 2239.402760] RDX: 0000000000000001 RSI: ffffffff959b6099 RDI: 
00000000ffffffff
[ 2239.402766] RBP: ffffa30e008b7d00 R08: 0000000000000000 R09: 
ffffa30e008b7ab0
[ 2239.402771] R10: ffffa30e008b7aa8 R11: ffffffff96356908 R12: 
0000000000000000
[ 2239.402776] R13: 0000000000000006 R14: 0000000000000096 R15: 
00000000ffffffea
[ 2239.402783] FS:  00007f5ee8713740(0000) GS:ffff8ccb7bcc0000(0000) 
knlGS:0000000000000000
[ 2239.402791] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2239.402796] CR2: 000055e786065c20 CR3: 000000010622e004 CR4: 
0000000000370ee0
[ 2239.402811] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 
0000000000000000
[ 2239.402816] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 
0000000000000400
[ 2239.402821] Call Trace:
[ 2239.402827]  <TASK>
[ 2239.402938]  cpu_device_down+0x34/0x60
[ 2239.403018]  cpu_subsys_offline+0xe/0x10
[ 2239.403086]  device_offline+0xe6/0x110
[ 2239.403095]  online_store+0x53/0xc0
[ 2239.403103]  dev_attr_store+0x17/0x30
[ 2239.403155]  sysfs_kf_write+0x3e/0x50
[ 2239.403193]  kernfs_fop_write_iter+0x137/0x1c0
[ 2239.403207]  new_sync_write+0x117/0x1a0
[ 2239.403264]  vfs_write+0x211/0x2a0
[ 2239.403276]  ksys_write+0x67/0xe0
[ 2239.403290]  __x64_sys_write+0x19/0x20
[ 2239.403303]  do_syscall_64+0x5c/0xc0
[ 2239.403316]  ? exc_page_fault+0x89/0x180
[ 2239.403323]  ? asm_exc_page_fault+0x8/0x30
[ 2239.403349]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[ 2239.403359] RIP: 0033:0x7f5ee8c1b777
[ 2239.403395] Code: 10 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 
1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 
05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
[ 2239.403425] RSP: 002b:00007ffe09004648 EFLAGS: 00000246 ORIG_RAX: 
0000000000000001
[ 2239.403432] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 
00007f5ee8c1b777
[ 2239.403436] RDX: 0000000000000003 RSI: 00007ffe0900467d RDI: 
0000000000000004
[ 2239.403439] RBP: 00007ffe09004680 R08: 0000000000000000 R09: 
00007ffe09004500
[ 2239.403442] R10: 0000000000000000 R11: 0000000000000246 R12: 
00007ffe0900467d
[ 2239.403454] R13: 0000000000000004 R14: 0000000000000006 R15: 
000055e785de5f08
[ 2239.403463]  </TASK>
[ 2239.403466] ---[ end trace e92cc28a4b580b82 ]---

See bug report https://bugzilla.kernel.org/show_bug.cgi?id=214955

Colin

