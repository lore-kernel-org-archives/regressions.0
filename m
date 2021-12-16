Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F161173
	for <regressions@lists.linux.dev>; Thu, 16 Dec 2021 09:22:26 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mxmxt-0002JI-Rk; Thu, 16 Dec 2021 10:22:18 +0100
Message-ID: <eb34f98f-00ef-3238-2daa-80481116035d@leemhuis.info>
Date: Thu, 16 Dec 2021 10:22:17 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Bug 215117] New: ucsi_acpi: kernel NULL pointer dereference
Content-Language: en-BS
To: bugzilla-daemon@bugzilla.kernel.org, linux-usb@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <bug-215117-208809@https.bugzilla.kernel.org/>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <bug-215117-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1639646547;f3bb4f45;
X-HE-SMSGID: 1mxmxt-0002JI-Rk

Hi, this is your Linux kernel regression tracker speaking.

Parlty top-posting for once, to make this easy accessible to everyone.

Heikki, below bug sounds a awful lot like a regression. I'd be glad if
you could take a quick look at this, as the report seems have fallen
through the cracks; somebody else today confirmed the problem is still
happening with 5.16-rc3.

Chris or Manuel, could you please confirm v5.15.y worked fine?

On 23.11.21 04:51, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=215117
> 
>             Bug ID: 215117
>            Summary: ucsi_acpi: kernel NULL pointer dereference
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.16-rc2
>           Hardware: x86-64
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: linux-kernel-bugs@hixontech.com
>         Regression: No
> 
> Created attachment 299677
>   --> https://bugzilla.kernel.org/attachment.cgi?id=299677&action=edit
> journal and lshw
> 
> The system fails to boot completely (or shutdown properly) after kernel oops,
> apparently in the ucsi_acpi module. It boots up fine with this module
> blacklisted. I first noticed the issue on 5.16-rc1; the problem continues with
> 5.16-rc2.
> 
> HW: HP ENVY x360, AMD Ryzen 7 4700U with Radeon Graphics, Renoir
> 
> Attached: full kernel journal log and output from lshw.
> 
> OOPS:
> 
> Nov 22 06:44:04 kernel: BUG: kernel NULL pointer dereference, address:
> 0000000000000058
> Nov 22 06:44:04 kernel: #PF: supervisor read access in kernel mode
> Nov 22 06:44:04 kernel: #PF: error_code(0x0000) - not-present page
> Nov 22 06:44:04 kernel: PGD 0 P4D 0 
> Nov 22 06:44:04 kernel: Oops: 0000 [#1] PREEMPT SMP NOPTI
> Nov 22 06:44:04 kernel: CPU: 0 PID: 394 Comm: kworker/0:2 Not tainted
> 5.16.0-rc2-1-mainline #1 4a5aa185cbfb8b63cd50dfec190bc41096ea30a5
> Nov 22 06:44:04 kernel: Hardware name: HP HP ENVY x360 Convertible
> 15-ds1xxx/87A9, BIOS F.07 03/18/2021
> Nov 22 06:44:04 kernel: Workqueue: events_long ucsi_init_work [typec_ucsi]
> Nov 22 06:44:04 kernel: RIP: 0010:typec_register_altmode+0x2e/0x3a0 [typec]
> Nov 22 06:44:04 kernel: Code: 00 41 57 41 56 41 55 41 54 49 89 f4 55 48 89 fd
> 48 8d bf 08 03 00 00 53 48 83 ec 28 65 48 8b 04 25 28 00 00 00 48 89 44 24 20
> <48> 8b 87 50 fd ff ff 48 3d e0 99 5b c0 74 18 48 8d 95 f8 02 00 00
> Nov 22 06:44:04 kernel: RSP: 0018:ffffa171c0f9fd30 EFLAGS: 00010286
> Nov 22 06:44:04 kernel: RAX: 8a5a9eb1bcae6600 RBX: ffff94994f1b7800 RCX:
> 0000000000000001
> Nov 22 06:44:04 kernel: RDX: 0000000000000000 RSI: ffffa171c0f9fdd0 RDI:
> 0000000000000308
> Nov 22 06:44:04 kernel: RBP: 0000000000000000 R08: 0000000000000000 R09:
> 0000000000000000
> Nov 22 06:44:04 kernel: R10: 0000000000000000 R11: 0000000000000000 R12:
> ffffa171c0f9fdd0
> Nov 22 06:44:04 kernel: R13: 0000000000000000 R14: 0000000000000000 R15:
> ffff94994f1b7800
> Nov 22 06:44:04 kernel: FS:  0000000000000000(0000) GS:ffff949c3f600000(0000)
> knlGS:0000000000000000
> Nov 22 06:44:04 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> Nov 22 06:44:04 kernel: CR2: 0000000000000058 CR3: 0000000103c3e000 CR4:
> 0000000000350ef0
> Nov 22 06:44:04 kernel: Call Trace:
> Nov 22 06:44:04 kernel:  <TASK>
> Nov 22 06:44:04 kernel:  ? ucsi_acpi_sync_write+0x4a/0x70 [ucsi_acpi
> 02bdd89c7010256e11856d8931a8362b48e4c3f7]
> Nov 22 06:44:04 kernel:  ucsi_register_altmode.constprop.0+0x1f0/0x250
> [typec_ucsi 5c5256aa8a0bedb6e8965681f3f36303c0e1b18d]
> Nov 22 06:44:04 kernel:  ucsi_register_altmodes+0x161/0x1c0 [typec_ucsi
> 5c5256aa8a0bedb6e8965681f3f36303c0e1b18d]
> Nov 22 06:44:04 kernel:  ucsi_check_altmodes+0x17/0x50 [typec_ucsi
> 5c5256aa8a0bedb6e8965681f3f36303c0e1b18d]
> Nov 22 06:44:04 kernel:  ucsi_init_work+0x6c7/0x720 [typec_ucsi
> 5c5256aa8a0bedb6e8965681f3f36303c0e1b18d]
> Nov 22 06:44:04 kernel:  process_one_work+0x1e8/0x3c0
> Nov 22 06:44:04 kernel:  worker_thread+0x50/0x3c0
> Nov 22 06:44:04 kernel:  ? rescuer_thread+0x390/0x390
> Nov 22 06:44:04 kernel:  kthread+0x15c/0x180
> Nov 22 06:44:04 kernel:  ? set_kthread_struct+0x50/0x50
> Nov 22 06:44:04 kernel:  ret_from_fork+0x22/0x30
> Nov 22 06:44:04 kernel:  </TASK>
> Nov 22 06:44:04 kernel: Modules linked in: snd_hda_codec_realtek(+) fjes(-)
> snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi joydev iwlmvm(+)
> mousedev snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi mac80211
> nls_iso8859_1 snd_hda_codec btusb vfat amdgpu(+) libarc4 snd_hda_core btrtl fat
> snd_hwdep btbcm iwlwifi snd_pcm btintel snd_timer bluetooth snd_pci_acp5x
> snd_rn_pci_acp3x k10temp gpu_sched amd_sfh snd_pci_acp3x cfg80211 snd
> ecdh_generic ucsi_acpi drm_ttm_helper sp5100_tco soundcore rfkill typec_ucsi
> ttm i2c_piix4 typec mac_hid roles wmi video tpm_crb tpm_tis wireless_hotkey
> tpm_tis_core hp_accel acpi_cpufreq lis3lv02d amd_pmc acpi_tad 9pnet_virtio 9p
> 9pnet fscache netfs sg crypto_user fuse bpf_preload ip_tables x_tables ext4
> crc32c_generic crc16 mbcache jbd2 dm_crypt cbc encrypted_keys dm_mod trusted
> asn1_encoder tee tpm rtsx_pci_sdmmc mmc_core crct10dif_pclmul serio_raw
> crc32_pclmul crc32c_intel ghash_clmulni_intel atkbd aesni_intel libps2
> crypto_simd cryptd ccp xhci_pci
> Nov 22 06:44:04 kernel:  xhci_pci_renesas rng_core rtsx_pci i8042 serio
> hid_multitouch i2c_hid_acpi i2c_hid pinctrl_amd
> Nov 22 06:44:04 kernel: CR2: 0000000000000058
> Nov 22 06:44:04 kernel: ---[ end trace bdd82aa217da2b8a ]---
> Nov 22 06:44:04 kernel: RIP: 0010:typec_register_altmode+0x2e/0x3a0 [typec]
> Nov 22 06:44:04 kernel: Code: 00 41 57 41 56 41 55 41 54 49 89 f4 55 48 89 fd
> 48 8d bf 08 03 00 00 53 48 83 ec 28 65 48 8b 04 25 28 00 00 00 48 89 44 24 20
> <48> 8b 87 50 fd ff ff 48 3d e0 99 5b c0 74 18 48 8d 95 f8 02 00 00
> Nov 22 06:44:04 kernel: RSP: 0018:ffffa171c0f9fd30 EFLAGS: 00010286
> Nov 22 06:44:04 kernel: RAX: 8a5a9eb1bcae6600 RBX: ffff94994f1b7800 RCX:
> 0000000000000001
> Nov 22 06:44:04 kernel: RDX: 0000000000000000 RSI: ffffa171c0f9fdd0 RDI:
> 0000000000000308
> Nov 22 06:44:04 kernel: RBP: 0000000000000000 R08: 0000000000000000 R09:
> 0000000000000000
> Nov 22 06:44:04 kernel: R10: 0000000000000000 R11: 0000000000000000 R12:
> ffffa171c0f9fdd0
> Nov 22 06:44:04 kernel: R13: 0000000000000000 R14: 0000000000000000 R15:
> ffff94994f1b7800
> Nov 22 06:44:04 kernel: FS:  0000000000000000(0000) GS:ffff949c3f600000(0000)
> knlGS:0000000000000000
> Nov 22 06:44:04 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> Nov 22 06:44:04 kernel: CR2: 0000000000000058 CR3: 0000000103c3e000 CR4:
> 0000000000350ef0

[TLDR for the rest: adding this regression to regzbot; this mail is
partly compiled from a few templates paragraphs some of you might have
seen already.]

Adding the regression mailing list to the list of recipients, as it
should be in the loop for all regressions, as explained here:
https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html

To be sure this issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced v5.15..v5.16-rc1
#regzbot title usb: ucsi_acpi: kernel NULL pointer dereference

Reminder: when fixing the issue, please add a 'Link:' tag with the URL
to the report (the parent of this mail), then regzbot will automatically
mark the regression as resolved once the fix lands in the appropriate
tree. For more details about regzbot see footer.

Sending this to everyone that got the initial report, to make all aware
of the tracking. I also hope that messages like this motivate people to
directly get at least the regression mailing list and ideally even
regzbot involved when dealing with regressions, as messages like this
wouldn't be needed then.

Don't worry, I'll send further messages wrt to this regression just to
the lists (with a tag in the subject so people can filter them away), as
long as they are intended just for regzbot. With a bit of luck no such
messages will be needed anyway.

Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat).

P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
on my table. I can only look briefly into most of them. Unfortunately
therefore I sometimes will get things wrong or miss something important.
I hope that's not the case here; if you think it is, don't hesitate to
tell me about it in a public reply. That's in everyone's interest, as
what I wrote above might be misleading to everyone reading this; any
suggestion I gave thus might sent someone reading this down the wrong
rabbit hole, which none of us wants.

BTW, I have no personal interest in this issue, which is tracked using
regzbot, my Linux kernel regression tracking bot
(https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
this mail to get things rolling again and hence don't need to be CC on
all further activities wrt to this regression.
