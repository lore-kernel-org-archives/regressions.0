Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F721607B4
	for <regressions@lists.linux.dev>; Sun, 26 Jan 2025 16:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737910017; cv=none; b=unpzNuWDW4zvqCgHS4NVKrVTuHC9oFVC8jX0gEYVfli7elNudQQeddaZBTlcJq71hEHMmZ2UjTEb2ZFra2kbIL8+1jeWvmWcuawNU+sfZa2NHx3dpcJTyWzI1q0vqOoPPHRZ61PVJMwoY69go8QxbiZv8ku6k/dPB9Cg2FxUuVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737910017; c=relaxed/simple;
	bh=fhcPhEwMtrAo5lDkMsqKDQhqocY3seyg1r+fXuZPNe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdbizSu4ee0ejh530fHlwOlBltdVjSXvabfRnZ/M5hFVL/kzvHYdR6fa0yiN0BbCyT2e+Pw5lqkWU3TbmveneVw33Sl5MQXtGWYx/qJzyHZ6X4MXcHWLB7E28/F5r3hDFjmNs4Z3AnKrb7wjZqI8oC2jY4aGeoJRHfWpESv8glI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mm7Dy2je; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mm7Dy2je"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43622267b2eso38044065e9.0
        for <regressions@lists.linux.dev>; Sun, 26 Jan 2025 08:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737910014; x=1738514814; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zFYvOsyMJ3P2jqxVWBFulLXelv8uChNnsVL5aq9ciyw=;
        b=Mm7Dy2jeDADfGNYMVwBjg3wHEeAP7gFOrzoD0LuWB9GhEVm8aC4XB+SyVZgJK+rUlm
         DuhpaPbnRRw+pcvX2q/zOX7OVjW8PKn6sML1NH2soe0ugI4fX5SU2fJyrnMp5RHaPpdd
         i2rvQxePvGtxLetj2M4+8AG7Er/OspH8tek6dWmX8fnOaC8LY21UWM88fz8Md8zTBaSW
         iVnH4KfL+DOJNQlU9LGHoET77m22uSB5y0RJ13a2BunGTNkDpJSpwfSbTPqVIIzOCdj1
         3/K9o2WGLP1jr1tjGLzbN8uQXaMxhFMN/F6AbuIKUrg3jz2vWTp3QxEcL1sqqKJKPczH
         o12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737910014; x=1738514814;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFYvOsyMJ3P2jqxVWBFulLXelv8uChNnsVL5aq9ciyw=;
        b=ivkitCVLFcL0urEHJtqZ6KaSsLkfo5KneET7l9IPbWiaDYhV/Jg6cspMSGfXOjwtWz
         WCYBW07c74UMmGvFenT6FByIOq0QY8sNsQBLU8gLHKwJ1lnuZN0aNgp54SWEL0inZKy0
         zURhLxZffJmfg8xhURraa5xbID6iShbjaG2JgCR1eKK52+NzviGPg7+bopd2GYahZ1sX
         +ZSyD03agOYA8MS5h/bwPOiXJBF9Wcqk076oBjm0IA5TKX+ytgwrbvMe8aGdXYAsEaQi
         LBMpYjapShxmPcWluXFkxCGV2kdU+R6zsaiBAf+8lY7qjqaYEhF8WFT9chaRwuQ0kTBf
         Nu9g==
X-Forwarded-Encrypted: i=1; AJvYcCUFZiw1w1gLQEKwN9B4vf6DuAyWvSy0g/CpwWHHr5ejHWQvLR5pO4mUGm9bMmXLYeDc+fmDNCdj+b1BnA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxP4XsSi5o1hKlviPgV+NQT6nbZVvpuix5BhkH/bu9h8fpsmKns
	PTT2CQCmL4ZyEepmBwxEew4rPJBEI6VC5iPZwDfCMs+fAc5qPgeN
X-Gm-Gg: ASbGncvp0P3s8OYWDNqhPlPtR6mpTwRVk3nCF0XJ2Nbqe9a4ObaXmKujhvYLSmUMRhA
	fJohaHgIr9jGI16dwoZGVulEt381KNsoEFPAUZg0Tagm43pFM/tVFKqjKTHnLM0VV7czjXkFUVq
	cMDRdqFg5ascxsCZ5mOz+wCNP1+Y+iWnkbbbtKvhVZsyo9Fmcyfdnqwrxrqk96ehlQATerfHAcf
	QAv8MTixyEveK8cjhV1JgX8pi37sY9efGZbwlVcUsMmI/DFCB0Q77qJ39xJiK0vTXyuUBjvilPC
	drIr2lifT5hcaviS
X-Google-Smtp-Source: AGHT+IFqEKVqZKh+2t8/LZoVaoeEBRS0LrzFSY6O6gz7GIeYZQsQPl4wy8SbI+/ONYCCTqYfAG/PJw==
X-Received: by 2002:a05:600c:4e52:b0:436:e751:e445 with SMTP id 5b1f17b1804b1-438a079c1e7mr332368425e9.5.1737910013791;
        Sun, 26 Jan 2025 08:46:53 -0800 (PST)
Received: from debian.local ([2a0a:ef40:cc6:2501:f7c7:eea3:297e:edf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd507fe8sm98049135e9.24.2025.01.26.08.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 08:46:52 -0800 (PST)
Date: Sun, 26 Jan 2025 16:46:49 +0000
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Leo Li <sunpeng.li@amd.com>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	Harry Wentland <harry.wentland@amd.com>, zaeem.mohamed@amd.com,
	pekka.paalanen@collabora.com,
	"Wheeler, Daniel" <daniel.wheeler@amd.com>,
	"Deucher, Alexander" <alexander.deucher@amd.com>,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	imre.deak@intel.com, lyude@redhat.com
Subject: [BUG,BISECTED] WARNING dcn20_find_secondary_pipe
Message-ID: <Z5Zm-STfRzJ_PIkI@debian.local>
References: <CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com>
 <CABXGCsNztS8MLteq5=fcddwuQ1TCzeOM8TdVtpJ3crK=sV5PTQ@mail.gmail.com>
 <CABXGCsMdxHJ-MLkS0pm51Sk8g0PTghsuZxmowvj5t44bVN4ndA@mail.gmail.com>
 <ffd2c40c-1c2e-4465-b26f-88d5e08a80d9@amd.com>
 <CABXGCsOoL5vD0+FRALFQFr3ZBpb2z5mpGKzAD5RHoW9_sb5yaQ@mail.gmail.com>
 <f68020a3-c413-482d-beb2-5432d98a1d3e@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f68020a3-c413-482d-beb2-5432d98a1d3e@amd.com>

Hardware is HP Pavilion Aero 13 laptop with Dell WD19 dock and three
external monitors. I get a warning with recent kernel builds when
enabling the external monitors with xrandr after initial boot:

16:57:49 kernel: WARNING: CPU: 4 PID: 1347 at drivers/gpu/drm/amd/amdgpu/..=
/display/dc/resource/dcn20/dcn20_resource.c:1734 dcn20_find_secondary_pipe+=
0x1a6/0x400 [amdgpu]
16:57:49 kernel: Modules linked in: rfcomm xt_conntrack nft_chain_nat xt_MA=
SQUERADE nf_nat nf_conntrack_netlink nf_conntrack nf_defrag_ipv6 nf_defrag_=
ipv4 xfrm_user xfrm_algo xt_addrtype nft_compat nf_tables nfnetlink br_netf=
ilter bridge stp llc nvme_fabrics ccm snd_seq_dummy snd_hrtimer snd_seq cma=
c algif_hash algif_skcipher af_alg bnep qrtr overlay binfmt_misc snd_acp3x_=
pdm_dma snd_soc_dmic snd_acp3x_rn snd_sof_amd_rembrandt snd_sof_amd_renoir =
snd_sof_amd_acp snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_ct=
l_led snd_soc_core snd_hda_codec_realtek snd_compress snd_hda_codec_generic=
 snd_pci_ps snd_hda_scodec_component snd_soc_acpi_amd_match snd_hda_codec_h=
dmi snd_rpl_pci_acp6x uvcvideo snd_hda_intel snd_usb_audio snd_acp_pci iwlm=
vm videobuf2_vmalloc btusb snd_intel_dspcfg intel_rapl_msr snd_usbmidi_lib =
snd_acp_legacy_common videobuf2_memops btrtl intel_rapl_common snd_pci_acp6=
x snd_hda_codec snd_ump uvc mac80211 btintel snd_pci_acp5x snd_hwdep kvm_am=
d videobuf2_v4l2 snd_rawmidi btbcm libarc4 snd_hda_core
16:57:49 kernel:  snd_seq_device snd_rn_pci_acp3x btmtk videodev kvm hp_wmi=
 snd_pcm snd_acp_config ucsi_acpi iwlwifi ee1004 videobuf2_common platform_=
profile rapl snd_timer snd_soc_acpi pcspkr sparse_keymap bluetooth typec_uc=
si wmi_bmof k10temp sp5100_tco snd_pci_acp3x snd ccp mc cfg80211 soundcore =
typec input_leds joydev amd_pmc acpi_tad serio_raw mac_hid msr parport_pc p=
pdev lp parport efi_pstore dmi_sysfs ip_tables x_tables autofs4 btrfs blake=
2b_generic xor raid6_pq dm_crypt hid_microsoft ff_memless usbmouse usbkbd h=
id_cmedia r8153_ecm cdc_ether usbnet usbhid r8152 mii amdgpu i2c_algo_bit d=
rm_ttm_helper ttm drm_panel_backlight_quirks drm_exec drm_suballoc_helper u=
as cec hid_multitouch usb_storage rc_core hid_generic amdxcp polyval_clmuln=
i drm_buddy nvme i2c_hid_acpi polyval_generic gpu_sched i2c_piix4 nvme_core=
 amd_sfh i2c_hid video ghash_clmulni_intel drm_display_helper i2c_smbus nvm=
e_auth hid wmi aesni_intel crypto_simd cryptd
16:57:49 kernel: CPU: 4 UID: 0 PID: 1347 Comm: Xorg Not tainted 6.13.0-0707=
8-gb46c89c08f41 #139
16:57:49 kernel: Hardware name: HP HP Pavilion Aero Laptop 13-be0xxx/8916, =
BIOS F.16 08/01/2024
16:57:49 kernel: RIP: 0010:dcn20_find_secondary_pipe+0x1a6/0x400 [amdgpu]
16:57:49 kernel: Code: 48 69 db b8 0f 00 00 49 8d 44 1d 00 44 88 a0 24 08 0=
0 00 48 85 c0 75 c7 49 8b 86 98 05 00 00 44 8b a0 a8 02 00 00 41 83 ec 01 <=
0f> 0b 45 85 e4 78 ac 44 89 e0 48 69 c0 b8 0f 00 00 4d 8d 74 05 08
16:57:49 kernel: RSP: 0018:ffff9efc4383f478 EFLAGS: 00010206
16:57:49 kernel: RAX: ffff910e59a6f800 RBX: 0000000000000000 RCX: ffff910ea=
4a02218
16:57:49 kernel: RDX: ffff910e59a6f800 RSI: ffff910ea4a002a8 RDI: ffff910e5=
9400000
16:57:49 kernel: RBP: ffff9efc4383f4b0 R08: ffff910ea4a02218 R09: 000000000=
0000000
16:57:49 kernel: R10: ffff9efc4383f5d0 R11: 0000000000000000 R12: 000000000=
0000003
16:57:49 kernel: R13: ffff910ea4a002a8 R14: ffff910e59400000 R15: fffffffff=
ffff048
16:57:49 kernel: FS:  0000711c38030ac0(0000) GS:ffff91114e400000(0000) knlG=
S:0000000000000000
16:57:49 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
16:57:49 kernel: CR2: 00007cae3d793018 CR3: 000000010d5b1000 CR4: 000000000=
0f50ef0
16:57:49 kernel: PKRU: 55555554
16:57:49 kernel: Call Trace:
16:57:49 kernel:  <TASK>
16:57:49 kernel:  ? show_regs+0x68/0x80
16:57:49 kernel:  ? __warn+0x93/0x1b0
16:57:49 kernel:  ? dcn20_find_secondary_pipe+0x1a6/0x400 [amdgpu]
16:57:49 kernel:  ? report_bug+0x17e/0x1b0
16:57:49 kernel:  ? handle_bug+0x6a/0xb0
16:57:49 kernel:  ? exc_invalid_op+0x18/0x80
16:57:49 kernel:  ? asm_exc_invalid_op+0x1b/0x20
16:57:49 kernel:  ? dcn20_find_secondary_pipe+0x1a6/0x400 [amdgpu]
16:57:49 kernel:  dcn21_fast_validate_bw+0x409/0x740 [amdgpu]
16:57:49 kernel:  dcn21_validate_bandwidth_fp+0xd6/0xf20 [amdgpu]
16:57:49 kernel:  ? __might_sleep+0x58/0x90
16:57:49 kernel:  dcn21_validate_bandwidth+0x62/0xa0 [amdgpu]
16:57:49 kernel:  ? dcn21_validate_bandwidth+0x62/0xa0 [amdgpu]
16:57:49 kernel:  dc_validate_global_state+0x444/0x600 [amdgpu]
16:57:49 kernel:  ? drm_dp_mst_atomic_check+0xbd/0x100 [drm_display_helper]
16:57:49 kernel:  amdgpu_dm_atomic_check+0x17ae/0x1940 [amdgpu]
16:57:49 kernel:  drm_atomic_check_only+0x6a4/0xb30
16:57:49 kernel:  drm_atomic_commit+0x6f/0xe0
16:57:49 kernel:  ? __drm_printfn_seq_file+0x30/0x30
16:57:49 kernel:  drm_atomic_helper_set_config+0x7e/0xc0
16:57:49 kernel:  drm_mode_setcrtc+0x416/0x9e0
16:57:49 kernel:  ? __lock_acquire+0x415/0x27d0
16:57:49 kernel:  ? __lock_acquire+0x415/0x27d0
16:57:49 kernel:  ? drm_mode_getcrtc+0x1e0/0x1e0
16:57:49 kernel:  drm_ioctl_kernel+0xb5/0x120
16:57:49 kernel:  drm_ioctl+0x300/0x5a0
16:57:49 kernel:  ? drm_mode_getcrtc+0x1e0/0x1e0
16:57:49 kernel:  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu]
16:57:49 kernel:  __x64_sys_ioctl+0xa0/0xd0
16:57:49 kernel:  x64_sys_call+0xee7/0xfb0
16:57:49 kernel:  do_syscall_64+0x87/0x140
16:57:49 kernel:  ? find_held_lock+0x31/0x90
16:57:49 kernel:  ? find_held_lock+0x31/0x90
16:57:49 kernel:  ? lock_release+0xdb/0x2c0
16:57:49 kernel:  ? dput.part.0+0x91/0x460
16:57:49 kernel:  ? dput.part.0+0x9b/0x460
16:57:49 kernel:  ? dput+0x13/0x20
16:57:49 kernel:  ? __fsnotify_parent+0x200/0x3b0
16:57:49 kernel:  ? find_held_lock+0x31/0x90
16:57:49 kernel:  ? find_held_lock+0x31/0x90
16:57:49 kernel:  ? lock_release+0xdb/0x2c0
16:57:49 kernel:  ? __f_unlock_pos+0x15/0x20
16:57:49 kernel:  ? __mutex_unlock_slowpath+0x41/0x2e0
16:57:49 kernel:  ? mutex_unlock+0x12/0x20
16:57:49 kernel:  ? trace_irq_disable+0x7b/0xb0
16:57:49 kernel:  ? trace_irq_enable+0x7b/0xb0
16:57:49 kernel:  ? syscall_exit_to_user_mode+0xcc/0x210
16:57:49 kernel:  ? do_syscall_64+0x93/0x140
16:57:49 kernel:  ? do_syscall_64+0x93/0x140
16:57:49 kernel:  ? sysvec_apic_timer_interrupt+0x57/0xc0
16:57:49 kernel:  entry_SYSCALL_64_after_hwframe+0x4b/0x53
16:57:49 kernel: RIP: 0033:0x711c3831ccdb
16:57:49 kernel: Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 0=
0 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <=
89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
16:57:49 kernel: RSP: 002b:00007fffe26e36f0 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000010
16:57:49 kernel: RAX: ffffffffffffffda RBX: 0000592748268ac0 RCX: 0000711c3=
831ccdb
16:57:49 kernel: RDX: 00007fffe26e3780 RSI: 00000000c06864a2 RDI: 000000000=
000000f
16:57:49 kernel: RBP: 00007fffe26e3780 R08: 0000000000000000 R09: 000000000=
0000000
16:57:49 kernel: R10: 0000000000000000 R11: 0000000000000246 R12: 00000000c=
06864a2
16:57:49 kernel: R13: 000000000000000f R14: 0000000000000000 R15: 000000000=
0000000
16:57:49 kernel:  </TASK>
16:57:49 kernel: irq event stamp: 2276151
16:57:49 kernel: hardirqs last  enabled at (2276157): [<ffffffffa985a9c5>] =
__up_console_sem+0x75/0x90
16:57:49 kernel: hardirqs last disabled at (2276162): [<ffffffffa985a9aa>] =
__up_console_sem+0x5a/0x90
16:57:49 kernel: softirqs last  enabled at (2274574): [<ffffffffa979ecff>] =
__irq_exit_rcu+0xbf/0xf0
16:57:49 kernel: softirqs last disabled at (2274567): [<ffffffffa979ecff>] =
__irq_exit_rcu+0xbf/0xf0
16:57:49 kernel: ---[ end trace 0000000000000000 ]---

The bisect leads to a merge commit 43102a2012c2 ("Merge tag
'drm-misc-fixes-2024-09-26'"). Neither parent commit produces the
warning, but the merged commit does.

There are two commits that interact to cause this warning:

2a2a865aee43 ("drm/amd/display: Add all planes on CRTC to state for
overlay cursor").

and

70a6587dca37 ("drm/dp_mst: Fix DSC decompression detection in Synaptics
branch devices")

2a2a865aee43 was added to the mainline Linux repo first, but the warning
only appears following the merge of 70a6587dca37.

#regzbot introduced: 43102a2012c2
