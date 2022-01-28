Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC79168
	for <regressions@lists.linux.dev>; Fri, 28 Jan 2022 10:22:38 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nDOOq-0002DE-6X; Fri, 28 Jan 2022 11:22:36 +0100
Message-ID: <8c06116a-7901-a82b-1d89-7a4317e5c7a9@leemhuis.info>
Date: Fri, 28 Jan 2022 11:22:35 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: usb: Oops in typec code (fwd from bugzilla) #forregzbot
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <fe213beb-4de2-982e-a7a0-0a9bae76ced3@leemhuis.info>
In-Reply-To: <fe213beb-4de2-982e-a7a0-0a9bae76ced3@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1643365358;7120292f;
X-HE-SMSGID: 1nDOOq-0002DE-6X

For the record:

#regzbot fixed-by: 147ab5376f18045da9f22a826

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-linus&id=147ab5376f18045da9f22a8262185707745bbf77
https://lore.kernel.org/linux-usb/20220124090228.41396-3-heikki.krogerus@linux.intel.com/

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 26.01.22 10:10, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> There is a regression in bugzilla.kernel.org I'd like to add to the
> tracking:
> 
> #regzbot introduced: v5.16..v5.17-rc1
> #regzbot from:  neoe <hi2@n101n.xyz>
> #regzbot title: usb: Oops in typec code
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215530
> 
> Quote:
> 
>> almost same config for working v5.16 build. but fail on v5.17-rc1
>> dmesg:
>>
>>
>> [    7.967005] Oops: 0000 [#1] PREEMPT SMP NOPTI
>> [    7.967694] CPU: 3 PID: 265 Comm: kworker/3:2 Not tainted 5.17.0-rc1-gs #1
>> [    7.968374] Hardware name: ASUS System Product Name/PRIME B550M-A (WI-FI), BIOS 2423 08/09/2021
>> [    7.969043] Workqueue: events_long ucsi_init_work [typec_ucsi]
>> [    7.969714] RIP: 0010:typec_port_match+0x4b/0x90 [typec]
>> [    7.970382] Code: 8b 98 90 02 00 00 48 89 df 48 83 eb 10 e8 dd 59 c1 c0 84 c0 b8 00 00 00 00 48 0f 44 d8 4c 39 eb 74 0c 41 8b 84 24 70 fd ff ff <39> 03 74 0b 5b 31 c0 41 5c 41 5d 41 5e 5d c3 49 8b 3e 49 8d 76 08
>> [    7.971099] RSP: 0018:ffffacf640ffbd48 EFLAGS: 00010207
>> [    7.971810] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
>> [    7.972525] RDX: 0000000000000001 RSI: ffffacf640ffbdb8 RDI: 0000000000000000
>> [    7.973238] RBP: ffffacf640ffbd68 R08: ffff9a62003d96a0 R09: ffffacf640ffbc08
>> [    7.973955] R10: ffff9a6225f36000 R11: 0000000000000000 R12: ffff9a62016e7a90
>> [    7.974679] R13: ffff9a62016e7800 R14: ffffacf640ffbdb8 R15: ffff9a6200c96c08
>> [    7.975405] FS:  0000000000000000(0000) GS:ffff9a80ae8c0000(0000) knlGS:0000000000000000
>> [    7.976128] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [    7.976844] CR2: 0000000000000000 CR3: 0000000121dfa000 CR4: 0000000000350ee0
>> [    7.977561] Call Trace:
>> [    7.978272]  
>> [    7.978979]  ? typec_port_compare+0x10/0x10 [typec]
>> [    7.979694]  bus_for_each_dev+0x7e/0xc0
>> [    7.980408]  typec_link_ports+0x45/0x80 [typec]
>> [    7.981110]  typec_register_port+0x1d4/0x2d0 [typec]
>> [    7.981808]  ucsi_init_work+0x401/0x720 [typec_ucsi]
>> [    7.982508]  process_one_work+0x21d/0x3f0
>> [    7.983202]  worker_thread+0x50/0x3d0
>> [    7.983887]  ? rescuer_thread+0x380/0x380
>> [    7.984571]  kthread+0xff/0x130
>> [    7.985246]  ? kthread_complete_and_exit+0x20/0x20
>> [    7.985927]  ret_from_fork+0x22/0x30
>> [    7.986608]  
>> [    7.987282] Modules linked in: snd_hda_codec_realtek snd_hda_codec_generic kvm_amd ledtrig_audio iwlmvm(+) kvm snd_hda_codec_hdmi crct10dif_pclmul mac80211 ghash_clmulni_intel libarc4 snd_hda_intel btusb snd_intel_dspcfg snd_intel_sdw_acpi aesni_intel btrtl snd_hda_codec btbcm iwlwifi crypto_simd btintel asus_wmi snd_hda_core cryptd platform_profile btmtk sparse_keymap snd_hwdep input_leds rapl wmi_bmof video bluetooth ucsi_ccg cfg80211 snd_pcm efi_pstore typec_ucsi snd_timer ecdh_generic k10temp typec snd sp5100_tco ccp ecc soundcore mac_hid amdgpu iommu_v2 gpu_sched drm_ttm_helper ttm drm_kms_helper cec drm i2c_algo_bit fb_sys_fops syscopyarea sysfillrect sysimgblt hid_generic crc32_pclmul i2c_piix4 r8169 usbhid i2c_designware_pci realtek hid wmi gpio_amdpt gpio_generic
>> [    7.990356] CR2: 0000000000000000
>> [    7.991132] ---[ end trace 0000000000000000 ]---
>> [    8.060078] iwlwifi 0000:09:00.0: Detected RF HR B3, rfid=0x10a100
>> [    8.129116] RIP: 0010:typec_port_match+0x4b/0x90 [typec]
>> [    8.130024] Code: 8b 98 90 02 00 00 48 89 df 48 83 eb 10 e8 dd 59 c1 c0 84 c0 b8 00 00 00 00 48 0f 44 d8 4c 39 eb 74 0c 41 8b 84 24 70 fd ff ff <39> 03 74 0b 5b 31 c0 41 5c 41 5d 41 5e 5d c3 49 8b 3e 49 8d 76 08
>> [    8.130919] RSP: 0018:ffffacf640ffbd48 EFLAGS: 00010207
>> [    8.131763] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
>> [    8.132462] iwlwifi 0000:09:00.0: base HW address: 08:5b:d6:51:40:96
>> [    8.132598] RDX: 0000000000000001 RSI: ffffacf640ffbdb8 RDI: 0000000000000000
>> [    8.134511] RBP: ffffacf640ffbd68 R08: ffff9a62003d96a0 R09: ffffacf640ffbc08
>> [    8.135417] R10: ffff9a6225f36000 R11: 0000000000000000 R12: ffff9a62016e7a90
>> [    8.136317] R13: ffff9a62016e7800 R14: ffffacf640ffbdb8 R15: ffff9a6200c96c08
>> [    8.137190] FS:  0000000000000000(0000) GS:ffff9a80ae8c0000(0000) knlGS:0000000000000000
>> [    8.138035] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [    8.138869] CR2: 0000000000000000 CR3: 0000000121dfa000 CR4: 0000000000350ee0
> 
> Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat)
> 
> P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
> on my table. I can only look briefly into most of them. Unfortunately
> therefore I sometimes will get things wrong or miss something important.
> I hope that's not the case here; if you think it is, don't hesitate to
> tell me about it in a public reply, that's in everyone's interest.
> 
> BTW, I have no personal interest in this issue, which is tracked using
> regzbot, my Linux kernel regression tracking bot
> (https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
> this mail to get things rolling again and hence don't need to be CC on
> all further activities wrt to this regression.
> 
> ---
> Additional information about regzbot:
> 
> If you want to know more about regzbot, check out its web-interface, the
> getting start guide, and/or the references documentation:
> 
> https://linux-regtracking.leemhuis.info/regzbot/
> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md
> 
> The last two documents will explain how you can interact with regzbot
> yourself if your want to.
> 
> Hint for reporters: when reporting a regression it's in your interest to
> tell #regzbot about it in the report, as that will ensure the regression
> gets on the radar of regzbot and the regression tracker. That's in your
> interest, as they will make sure the report won't fall through the
> cracks unnoticed.
> 
> Hint for developers: you normally don't need to care about regzbot once
> it's involved. Fix the issue as you normally would, just remember to
> include a 'Link:' tag to the report in the commit message, as explained
> in Documentation/process/submitting-patches.rst
> That aspect was recently was made more explicit in commit 1f57bd42b77c:
> https://git.kernel.org/linus/1f57bd42b77c
