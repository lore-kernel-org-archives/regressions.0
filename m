Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7886D2576F
	for <regressions@lists.linux.dev>; Sun, 30 Jun 2024 17:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719770329; cv=none; b=fkV7KIsIe5x5NBxDwKUeQDCHbG/bdvMOc8WGDR0NqTeBh7jeUk2Dh/j4lfUrtBYRv+R8lh8dXhEHYAhTbfb2JuO648JoKmxWr17QINXxKsqMDGDV+nDKKubUnKF0MD7xPhJ1P/KgLibjxGpxa+kHe9M/YjFRD1O/bZBtmnXGTwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719770329; c=relaxed/simple;
	bh=HK3RambsDvRtQ6Hri0ymPUA6Mp8K9KQBFsJl0cE0uUQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=UmIYNS9Bn8qRon+BKZTam2gzreaUi5k3D3fTFMpZd3Ni3ePCHGFou/dn8Zqf/p4uEQ7lcWkePbz4N/EzA+/yKls2mzVYfMfErQoPEVxcmQdwXeVPuwpEpPhOou7hl8lvMJpsdpea3oLpM5jdhkiyPb0iAB2XuMyO9QSx/fqLizE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwbHf3tf; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwbHf3tf"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-80b58104615so554086241.1
        for <regressions@lists.linux.dev>; Sun, 30 Jun 2024 10:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719770326; x=1720375126; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RooJD74YPhcavtOzToUvF7qoCvI/JEzdxnFDDQjDAGM=;
        b=fwbHf3tft6AMEuEVj4pSLFqIL9M7hmQrHYH6FM634qNLE7W2X2nn7vPbsXRId4bSrI
         E2hQZQSL1NBs3TQgCiRjSOzEwJzijG4LSWrlvG4JQpFw6mPjUVzSo4zJxK7yMZklIBr9
         O3UfdeM1SiJPcbhaoMMiROjKin2bAuTtowIXdY+FVv8dwIwYn4vg50jpRaD1xZ2nQ5+k
         bvGeCxq2sc5IXhy3Zmarj+D+gI1FPnDiVj5RznIjLqkRkiM7Bpc4ZZVfs+CoAibWiISW
         E6CTmLhnwoAEvIDoVGCQMGpxBufng3u5wjQiNbeT2X+l3KumIm6eyFSlRNndAQooSjpx
         wMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719770326; x=1720375126;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RooJD74YPhcavtOzToUvF7qoCvI/JEzdxnFDDQjDAGM=;
        b=Mu/IZffPQnyetPZpZGvrpQmKduTlxKiqE4k28U4v5sGIlORQNdEic/g9cImGVMRFxC
         vgGChud1j1X1KOxuV8YtRGaXPj5ucjzM1B/C7p8JWqKRWPYHVpUpK7JioOSKAunv3HbM
         owD/wsU7VU4N9y+A9sf1QAWD9iQi71vevN5jwFQhHMTzbaUDfG6zD7wg2/uHVh3DJit4
         ir5OEg9/JM1uGUU22NQJs6j4WH16dJYu6QPr8eN55a9Xr8gCHHhf7D1rX85XDg8juLjU
         hb0RK9mjTIR1hstyBDGIjwLDhKK9zgXK/hgf2FrWPMCSgaxXlzTkRRsB9BE59E//Tt4/
         fj0g==
X-Gm-Message-State: AOJu0Ywo7oeLUyr271olVo1oRP+3mUBhrMmd2PbOG02N1d9iXKBNoU4L
	rDEMmzfePDjEOgLxTob2cB1f1MGk4DxCv8IgqPaaBjqAVsFn4T25UauF9mCTgHVfa0iy/dsmbSF
	D+YcYyInoPgtfii5rLO/vZuONpvs=
X-Google-Smtp-Source: AGHT+IFGWfhDQGxsQ5lZNUamWworOjiMfzJRND1IQcem6D2td64ZCDenu4H4Q65Ys79DKchydEyvsSisQLrSVjKmhls=
X-Received: by 2002:a05:6102:3544:b0:48c:40cd:e4da with SMTP id
 ada2fe7eead31-48faf0d6717mr3728175137.19.1719770325354; Sun, 30 Jun 2024
 10:58:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Pedro Falcato <pedro.falcato@gmail.com>
Date: Sun, 30 Jun 2024 18:58:34 +0100
Message-ID: <CAKbZUD1-kqfuV0U+KDKPkQbm=RwzD_A1H3qk_c+bw92CqtMbuw@mail.gmail.com>
Subject: zswap_writeback_entry crashes in 6.9.5
To: mm <linux-mm@kvack.org>
Cc: Linux Regressions <regressions@lists.linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yosry Ahmed <yosryahmed@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Christian Heusel <christian@heusel.eu>
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Reporting a bug I've experienced over the last few releases, all in
6.9. I don't have a repro for it (seems to happen randomly?). Distro
is Arch Linux (which is itself minimally patched, config
https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/blob/e1057d426590bd2064df83779f8644de519874c0/config).

I understand 6.9.5 is a little old, but as I have no repro I'm posting
this in case someone has any hints or has hit this before.

dmesg:
BUG: unable to handle page fault for address: 00000000000315af
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0
Oops: 0000 [#1] PREEMPT SMP PTI
CPU: 5 PID: 90 Comm: kswapd0 Tainted: P     U     OE
6.9.5-arch1-1 #1 b9e5462a84a73f67b5c7c6b73f88d2a6349ae768
Hardware name: ASUSTeK COMPUTER INC. X542URR/X542URR, BIOS X542URR.310
10/29/2021
RIP: 0010:zswap_writeback_entry+0x128/0x1f0
Code: 89 ef e8 3b 5a a8 00 48 89 de 48 89 ef e8 20 f4 ff ff 65 48 ff
05 d8 82 68 7e 4c 8b 6d 38 4d 85 ed 74 1a 66 90 e8 f8 2a dc ff <49> 8b
7d 10 be 6e 00 00 00 e8 fa eb ff ff e8 75 7d dc ff 48 89 ef
RSP: 0018:ffffbc740049b848 EFLAGS: 00010202
RAX: 0000000000000001 RBX: ffffdcd8c489c480 RCX: 0000000000001000
RDX: ffff9e0401e1ec00 RSI: 0000000000000f80 RDI: ffff9e04b3641bc8
RBP: ffff9e04603b15a0 R08: 0000000000000080 R09: ffff9e0422713000
R10: 0000000000000000 R11: 0000000000000000 R12: ffffbc740049b850
R13: 000000000003159f R14: 00000000001d6747 R15: ffff9e040d207750
FS:  0000000000000000(0000) GS:ffff9e0566c80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000000315af CR3: 000000020a420003 CR4: 00000000003706f0
Call Trace:
<TASK>
? __die_body.cold+0x19/0x27
? page_fault_oops+0x15a/0x2b0
? exc_page_fault+0x81/0x190
? asm_exc_page_fault+0x26/0x30
? zswap_writeback_entry+0x128/0x1f0
? zswap_writeback_entry+0x128/0x1f0
shrink_memcg_cb+0x82/0xd0
__list_lru_walk_one+0xa3/0x1b0
? __pfx_shrink_memcg_cb+0x10/0x10
? __pfx_shrink_memcg_cb+0x10/0x10
list_lru_walk_one+0x5d/0x90
zswap_shrinker_scan+0xbd/0x120
do_shrink_slab+0x143/0x360
shrink_slab+0x2a9/0x3b0
shrink_one+0x120/0x1f0
shrink_node+0x962/0xbb0
balance_pgdat+0x4c5/0x960
? psi_task_switch+0xd6/0x230
? finish_task_switch.isra.0+0x99/0x2e0
kswapd+0x1f5/0x380
? __pfx_autoremove_wake_function+0x10/0x10
? __pfx_kswapd+0x10/0x10
kthread+0xcf/0x100
? __pfx_kthread+0x10/0x10
ret_from_fork+0x31/0x50
? __pfx_kthread+0x10/0x10
ret_from_fork_asm+0x1a/0x30
</TASK>
Modules linked in: snd_seq_dummy rfcomm snd_hrtimer snd_seq
xt_conntrack xt_MASQUERADE nf_conntrack_netlink xt_addrtype nft_compat
br_netfilter xfrm_interface xfrm6_tunnel tunnel4 tunnel6 xfrm_user
xfrm_algo nf
t_masq nft_ct nft_reject_ipv4 nf_reject_ipv4 nft_reject nft_chain_nat
nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables libcrc32c
bridge stp llc overlay cmac algif_hash algif_skcipher af_alg bnep vbox
netflt(OE) vboxnetadp(OE) vboxdrv(OE) nvidia_uvm(POE) nvidia_drm(POE)
nvidia_modeset(POE) snd_hda_codec_hdmi nvidia(POE)
intel_uncore_frequency intel_uncore_frequency_common snd_soc_avs
snd_soc_hda_codec snd_so
c_skl snd_soc_hdac_hda snd_hda_ext_core snd_soc_sst_ipc
snd_soc_sst_dsp intel_tcc_cooling x86_pkg_temp_thermal
snd_soc_acpi_intel_match snd_hda_codec_realtek intel_powerclamp
snd_soc_acpi coretemp snd_hda_codec
_generic snd_soc_core snd_hda_scodec_component snd_compress kvm_intel
ac97_bus vfat snd_pcm_dmaengine crct10dif_pclmul fat snd_hda_intel
crc32_pclmul polyval_clmulni
snd_intel_dspcfg ath10k_pci polyval_generic btusb uvcvideo
snd_intel_sdw_acpi gf128mul ath10k_core videobuf2_vmalloc
ghash_clmulni_intel btrtl snd_usb_audio sha512_ssse3 btintel uvc
snd_hda_codec ath sha256_ss
se3 processor_thermal_device_pci_legacy videobuf2_memops
snd_usbmidi_lib btbcm processor_thermal_device videobuf2_v4l2
sha1_ssse3 spi_pxa2xx_platform btmtk hid_multitouch aesni_intel
8250_dw dw_dmac mac80211 le
dtrig_netdev snd_ump processor_thermal_wt_hint snd_hda_core
crypto_simd videodev bluetooth processor_thermal_rfim snd_rawmidi
cryptd r8169 iTCO_wdt asus_nb_wmi snd_hwdep videobuf2_common
processor_thermal_rapl
rapl asus_wmi intel_pmc_bxt libarc4 snd_seq_device ecdh_generic mc
mousedev joydev snd_pcm intel_rapl_msr ee1004 mei_hdcp mei_pxp
iTCO_vendor_support intel_cstate snd_timer intel_rapl_common realtek
platform_pr
ofile cfg80211 intel_uncore pcspkr wmi_bmof i2c_i801 sparse_keymap
processor_thermal_wt_req snd mei_me mdio_devres intel_lpss_pci
processor_thermal_power_floor i2c_smbus rfkill
processor_thermal_mbox intel_xhci_usb_role_switch intel_lpss soundcore
libphy mei intel_pch_thermal roles intel_soc_dts_iosf idma64
i2c_hid_acpi i2c_hid int3403_thermal intel_pmc_core
int340x_thermal_zone inte
l_vsec pmt_telemetry int3400_thermal acpi_thermal_rel
pinctrl_sunrisepoint pmt_class acpi_pad asus_wireless mac_hid kvmgt
mdev vfio_iommu_type1 vfio iommufd kvm i2c_dev sg crypto_user dm_mod
loop nfnetlink ip_t
ables x_tables ext4 crc32c_generic crc16 mbcache jbd2 hid_generic
usbhid i915 serio_raw i2c_algo_bit atkbd drm_buddy libps2 ttm
vivaldi_fmap mxm_wmi intel_gtt crc32c_intel drm_display_helper
xhci_pci cec xhci_p
ci_renesas i8042 video serio wmi
CR2: 00000000000315af
---[ end trace 0000000000000000 ]---
RIP: 0010:zswap_writeback_entry+0x128/0x1f0
Code: 89 ef e8 3b 5a a8 00 48 89 de 48 89 ef e8 20 f4 ff ff 65 48 ff
05 d8 82 68 7e 4c 8b 6d 38 4d 85 ed 74 1a 66 90 e8 f8 2a dc ff <49> 8b
7d 10 be 6e 00 00 00 e8 fa eb ff ff e8 75 7d dc ff 48 89 ef
RSP: 0018:ffffbc740049b848 EFLAGS: 00010202
RAX: 0000000000000001 RBX: ffffdcd8c489c480 RCX: 0000000000001000
RDX: ffff9e0401e1ec00 RSI: 0000000000000f80 RDI: ffff9e04b3641bc8
RBP: ffff9e04603b15a0 R08: 0000000000000080 R09: ffff9e0422713000
R10: 0000000000000000 R11: 0000000000000000 R12: ffffbc740049b850
R13: 000000000003159f R14: 00000000001d6747 R15: ffff9e040d207750
FS:  0000000000000000(0000) GS:ffff9e0566c80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000000315af CR3: 000000020a420003 CR4: 00000000003706f0
note: kswapd0[90] exited with irqs disabled
------------[ cut here ]------------
WARNING: CPU: 5 PID: 90 at kernel/exit.c:827 do_exit+0x8c7/0xaf0
Modules linked in: snd_seq_dummy rfcomm snd_hrtimer snd_seq
xt_conntrack xt_MASQUERADE nf_conntrack_netlink xt_addrtype nft_compat
br_netfilter xfrm_interface xfrm6_tunnel tunnel4 tunnel6 xfrm_user
xfrm_algo nf
t_masq nft_ct nft_reject_ipv4 nf_reject_ipv4 nft_reject nft_chain_nat
nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables libcrc32c
bridge stp llc overlay cmac algif_hash algif_skcipher af_alg bnep vbox
netflt(OE) vboxnetadp(OE) vboxdrv(OE) nvidia_uvm(POE) nvidia_drm(POE)
nvidia_modeset(POE) snd_hda_codec_hdmi nvidia(POE)
intel_uncore_frequency intel_uncore_frequency_common snd_soc_avs
snd_soc_hda_codec snd_so
c_skl snd_soc_hdac_hda snd_hda_ext_core snd_soc_sst_ipc
snd_soc_sst_dsp intel_tcc_cooling x86_pkg_temp_thermal
snd_soc_acpi_intel_match snd_hda_codec_realtek intel_powerclamp
snd_soc_acpi coretemp snd_hda_codec
_generic snd_soc_core snd_hda_scodec_component snd_compress kvm_intel
ac97_bus vfat snd_pcm_dmaengine crct10dif_pclmul fat snd_hda_intel
crc32_pclmul polyval_clmulni
snd_intel_dspcfg ath10k_pci polyval_generic btusb uvcvideo
snd_intel_sdw_acpi gf128mul ath10k_core videobuf2_vmalloc
ghash_clmulni_intel btrtl snd_usb_audio sha512_ssse3 btintel uvc
snd_hda_codec ath sha256_ss
se3 processor_thermal_device_pci_legacy videobuf2_memops
snd_usbmidi_lib btbcm processor_thermal_device videobuf2_v4l2
sha1_ssse3 spi_pxa2xx_platform btmtk hid_multitouch aesni_intel
8250_dw dw_dmac mac80211 le
dtrig_netdev snd_ump processor_thermal_wt_hint snd_hda_core
crypto_simd videodev bluetooth processor_thermal_rfim snd_rawmidi
cryptd r8169 iTCO_wdt asus_nb_wmi snd_hwdep videobuf2_common
processor_thermal_rapl
rapl asus_wmi intel_pmc_bxt libarc4 snd_seq_device ecdh_generic mc
mousedev joydev snd_pcm intel_rapl_msr ee1004 mei_hdcp mei_pxp
iTCO_vendor_support intel_cstate snd_timer intel_rapl_common realtek
platform_pr
ofile cfg80211 intel_uncore pcspkr wmi_bmof i2c_i801 sparse_keymap
processor_thermal_wt_req snd mei_me mdio_devres intel_lpss_pci
processor_thermal_power_floor i2c_smbus rfkill
processor_thermal_mbox intel_xhci_usb_role_switch intel_lpss soundcore
libphy mei intel_pch_thermal roles intel_soc_dts_iosf idma64
i2c_hid_acpi i2c_hid int3403_thermal intel_pmc_core
int340x_thermal_zone inte
l_vsec pmt_telemetry int3400_thermal acpi_thermal_rel
pinctrl_sunrisepoint pmt_class acpi_pad asus_wireless mac_hid kvmgt
mdev vfio_iommu_type1 vfio iommufd kvm i2c_dev sg crypto_user dm_mod
loop nfnetlink ip_t
ables x_tables ext4 crc32c_generic crc16 mbcache jbd2 hid_generic
usbhid i915 serio_raw i2c_algo_bit atkbd drm_buddy libps2 ttm
vivaldi_fmap mxm_wmi intel_gtt crc32c_intel drm_display_helper
xhci_pci cec xhci_p
ci_renesas i8042 video serio wmi
CPU: 5 PID: 90 Comm: kswapd0 Tainted: P     UD    OE
6.9.5-arch1-1 #1 b9e5462a84a73f67b5c7c6b73f88d2a6349ae768
Hardware name: ASUSTeK COMPUTER INC. X542URR/X542URR, BIOS X542URR.310
10/29/2021
RIP: 0010:do_exit+0x8c7/0xaf0
Code: 08 00 00 e9 09 fe ff ff 49 8d 7c 24 18 e8 61 4f 07 00 e9 3b f8
ff ff 48 8b bb 20 06 00 00 31 f6 e8 7e e1 ff ff e9 83 fd ff ff <0f> 0b
e9 b1 f7 ff ff 48 89 df e8 ca 67 12 00 e9 54 f9 ff ff 0f 0b
RSP: 0018:ffffbc740049bec8 EFLAGS: 00010282
RAX: 0000000400000000 RBX: ffff9e0401e1ec00 RCX: 0000000000000000
RDX: 0000000000000001 RSI: 0000000000002710 RDI: ffff9e0401017380
RBP: 0000000000000009 R08: 0000000000000000 R09: ffffbc740049bdb8
R10: ffffffff836b21a8 R11: 0000000000000003 R12: ffff9e040101f500
R13: ffff9e0401017380 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff9e0566c80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000000315af CR3: 000000020a420003 CR4: 00000000003706f0
Call Trace:
<TASK>
? do_exit+0x8c7/0xaf0
? __warn.cold+0x8e/0xe8
? do_exit+0x8c7/0xaf0
? report_bug+0xff/0x140
? handle_bug+0x3c/0x80
? exc_invalid_op+0x17/0x70
? asm_exc_invalid_op+0x1a/0x20
? do_exit+0x8c7/0xaf0
? do_exit+0x71/0xaf0
make_task_dead+0x90/0x90
rewind_stack_and_make_dead+0x16/0x20
RIP: 0000:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0000:0000000000000000 EFLAGS: 00000000 ORIG_RAX: 0000000000000000
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
</TASK>
---[ end trace 0000000000000000 ]---

A little disassembly around zswap_writeback_entry+0x128 (+296 in the disasm):
   0xffffffff813a97ab <+267>:   call   0xffffffff813a8bd0 <zswap_decompress>
  0xffffffff813a97b0 <+272>:   incq   %gs:0x7ec882d8(%rip)        #
0x31a90 <vm_event_states+880>
  0xffffffff813a97b8 <+280>:   mov    0x38(%rbp),%r13
  0xffffffff813a97bc <+284>:   test   %r13,%r13
  0xffffffff813a97bf <+287>:   je     0xffffffff813a97db
<zswap_writeback_entry+315>
  0xffffffff813a97c1 <+289>:   jmp    0xffffffff813a97db
<zswap_writeback_entry+315>
  0xffffffff813a97c3 <+291>:   call   0xffffffff8116c2c0 <__rcu_read_lock>
  0xffffffff813a97c8 <+296>:   mov    0x10(%r13),%rdi
  0xffffffff813a97cc <+300>:   mov    $0x6e,%esi
  0xffffffff813a97d1 <+305>:   call   0xffffffff813a83d0
<count_memcg_events.constprop.0>
  0xffffffff813a97d6 <+310>:   call   0xffffffff81171550 <__rcu_read_unlock>
  0xffffffff813a97db <+315>:   mov    %rbp,%rdi
  0xffffffff813a97de <+318>:   call   0xffffffff813a9520 <zswap_entry_free>
  0xffffffff813a97e3 <+323>:   lock orb $0x8,(%rbx)
  0xffffffff813a97e7 <+327>:   lock orb $0x4,0x2(%rbx)
  0xffffffff813a97ec <+332>:   mov    %r12,%rsi
  0xffffffff813a97ef <+335>:   mov    %rbx,%rdi
  0xffffffff813a97f2 <+338>:   call   0xffffffff8139f2e0 <__swap_writepage>

which (by my manual inspection) more or less cleanly lands us around:


zswap_decompress(entry, &folio->page);

count_vm_event(ZSWPWB);
if (entry->objcg)
    count_objcg_event(entry->objcg, ZSWPWB);

zswap_entry_free(entry);

/* folio is up to date */
folio_mark_uptodate(folio);

/* move it to the tail of the inactive list after end_writeback */
folio_set_reclaim(folio);

/* start writeback */
__swap_writepage(folio, &wbc);



It looks like entry->objcg is garbage? My second-to-last repro of this
(in my logs) has an equally bogus but different address (0x1317), on
6.9.1.

Again, really sorry I can't give out more information, but my repro
really is "Use the system for a bunch of days in a row and we'll
Eventually(tm) hit this", which really isn't suited for bisection or
anything of the sort :)

PS: I tested my RAM for a few memtest86 cycles, to be sure it wasn't
just a RAM stick gone bad.

Thanks!
Pedro
