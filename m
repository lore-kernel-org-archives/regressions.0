Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48237E
	for <regressions@lists.linux.dev>; Sun, 28 May 2023 10:54:50 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3094910b150so2232333f8f.0
        for <regressions@lists.linux.dev>; Sun, 28 May 2023 03:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685271289; x=1687863289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YGeujGs5J2cfKGl9T3rp2xlqXzbl0eaOMQ0pNWGB5mk=;
        b=ISxDVGKvBGGfHuGpuh0V/wi0tPvWaF1DKdCaiVjjPfBgq4m9lvCa2uKKz3EpeEH54T
         6U2LVPQJD4/dNuaWxLcOabpL2MBTZujC33AsxH++bmqymsc/7fMcysBH/EA5LuXPSsch
         Ax04xPlBnZEvEEtkwtglgKLqwSbbdk6GFxlZ+qr78M2Qa2hkV5bqBCJX4qmx4zI/8Hfv
         3j/CPzguFC0HxfUfAT2BsFq5t8ZLtYAEToXwTww/+H9MKlp1pDNFb5Nvtuw3k3UoTPnl
         ktLRHvPSRbf9UJJHaS7UpqBbB5xUDnKoanWSwDa29196Sl3KOqyFOk5fRYfgyig57M2z
         v+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685271289; x=1687863289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGeujGs5J2cfKGl9T3rp2xlqXzbl0eaOMQ0pNWGB5mk=;
        b=QrdBYVr0XZ1iBvPf7XdCuVVLQOtEFueeNgKPMORnL43K+yBEeoeOUNS5l6mxhMOjwL
         godbm0ghMIKf9ochVVYBgNqDGT6pcVAPbfM5FBTI3I4kOjJAOAsI961YWAerhyAMqSll
         +l86JQw8J/+1xH7Ii1R5Gq3aCPINomemmol8vTv+871Dr721kcQZ7sdR5xbr8+jvjl1T
         Fg4VqdMWKxo9LUCIcps3oDZU82nsxooqziFkDJOx/HF9vLZ+G0N9Jk/FQvDUec41BuRG
         0io5EdzPRrqyUP9Cjofiyun6SR5s7Kxf6EaZESwoEFqO/tJOvm+xx/7hPjQsvCCwHgDf
         /i0g==
X-Gm-Message-State: AC+VfDxcZYdgk30u3P0G0raK+tWyvMOj9oBvFFbws+6VB6bcK4lO+CSm
	1nRKXhpr2GmK8JxTxv4NGBwtSJyiSOoXlGQKATU=
X-Google-Smtp-Source: ACHHUZ6Err6NzYZmeSHCTvaobNbsHmLziJ1mYQELmoDtZJDYfW9Cv58OYaizfb1VmP3fKvtyd7eUzeYsxoHNPkq2hU8=
X-Received: by 2002:adf:e341:0:b0:30a:e369:5acb with SMTP id
 n1-20020adfe341000000b0030ae3695acbmr4797580wrj.68.1685271288725; Sun, 28 May
 2023 03:54:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADpTngX9LESCdHVu_2mQkNGena_Ng2CphWNwsRGSMxzDsTjU2A@mail.gmail.com>
 <ZHDl6rXQ0UTWdk2O@google.com>
In-Reply-To: <ZHDl6rXQ0UTWdk2O@google.com>
From: Fabio Coatti <fabio.coatti@gmail.com>
Date: Sun, 28 May 2023 12:54:37 +0200
Message-ID: <CADpTngW6KU+VvRD2gwU8XbSedMEy8WTBiEWG=LnfaEZfCDXCLA@mail.gmail.com>
Subject: Re: WARNING trace at kvm_nx_huge_page_recovery_worker on 6.3.4
To: Sean Christopherson <seanjc@google.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 26 mag 2023 alle ore 19:01 Sean Christopherson
<seanjc@google.com> ha scritto:

>
> Do you have the actual line number for the WARN?  There are a handful of sanity
> checks in kvm_recover_nx_huge_pages(), it would be helpful to pinpoint which one
> is firing.  My builds generate quite different code, and the code stream doesn't
> appear to be useful for reverse engineering the location.

Just got the following: arch/x86/kvm/mmu/mmu.c:7015 so seemingly around here:

if (atomic_read(&kvm->nr_memslots_dirty_logging)) {
slot = gfn_to_memslot(kvm, sp->gfn);
WARN_ON_ONCE(!slot);
}


[Sun May 28 12:48:12 2023] ------------[ cut here ]------------
[Sun May 28 12:48:12 2023] WARNING: CPU: 1 PID: 3911 at
arch/x86/kvm/mmu/mmu.c:7015
kvm_nx_huge_page_recovery_worker+0x38c/0x3d0 [kvm]
[Sun May 28 12:48:12 2023] Modules linked in: vhost_net vhost
vhost_iotlb tap tun rfcomm snd_hrtimer snd_seq xt_CHECKSUM
xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 ip6table_mangle
ip6table_nat ip6table_filter ip6_tables iptable_mangle iptable_nat
nf_nat iptable_filter ip_tables bpfilter bridge stp llc algif_skcipher
bnep rmi_smbus rmi_core squashfs sch_fq_codel vboxnetadp(OE)
nvidia_drm(POE) vboxnetflt(OE) rtsx_pci_sdmmc intel_rapl_msr
nvidia_modeset(POE) mmc_core mei_pxp mei_hdcp vboxdrv(OE) snd_ctl_led
intel_rapl_common snd_hda_codec_realtek intel_pmc_core_pltdrv
snd_hda_codec_generic intel_pmc_core intel_tcc_cooling
x86_pkg_temp_thermal intel_powerclamp btusb snd_hda_intel btrtl btbcm
snd_intel_dspcfg btmtk snd_usb_audio kvm_intel btintel snd_usbmidi_lib
snd_hda_codec snd_hwdep kvm snd_rawmidi iwlmvm snd_hda_core
snd_seq_device bluetooth snd_pcm thinkpad_acpi irqbypass
crct10dif_pclmul crc32_pclmul snd_timer mei_me ledtrig_audio
ecdh_generic psmouse joydev think_lmi uvcvideo polyval_clmulni snd
polyval_generic wmi_bmof
[Sun May 28 12:48:12 2023]  firmware_attributes_class iwlwifi rtsx_pci
uvc ecc mousedev soundcore mei intel_pch_thermal platform_profile
evdev input_leds nvidia(POE) coretemp hwmon akvcam(OE)
videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videodev
videobuf2_common mc loop nfsd auth_rpcgss nfs_acl efivarfs dmi_sysfs
dm_zero dm_thin_pool dm_persistent_data dm_bio_prison dm_service_time
dm_round_robin dm_queue_length dm_multipath dm_delay virtio_pci
virtio_pci_legacy_dev virtio_pci_modern_dev virtio_blk virtio_console
virtio_balloon vxlan ip6_udp_tunnel udp_tunnel macvlan virtio_net
net_failover failover virtio_ring virtio fuse overlay nfs lockd grace
sunrpc linear raid10 raid1 raid0 dm_raid raid456 async_raid6_recov
async_memcpy async_pq async_xor async_tx md_mod dm_snapshot dm_bufio
dm_crypt trusted asn1_encoder tpm rng_core dm_mirror dm_region_hash
dm_log firewire_core crc_itu_t hid_apple usb_storage ehci_pci ehci_hcd
sr_mod cdrom ahci libahci libata
[Sun May 28 12:48:12 2023] CPU: 1 PID: 3911 Comm: kvm-nx-lpage-re
Tainted: P     U     OE      6.3.4-cova #2
[Sun May 28 12:48:12 2023] Hardware name: LENOVO
20EQS58500/20EQS58500, BIOS N1EET98W (1.71 ) 12/06/2022
[Sun May 28 12:48:12 2023] RIP:
0010:kvm_nx_huge_page_recovery_worker+0x38c/0x3d0 [kvm]
[Sun May 28 12:48:12 2023] Code: 48 8b 44 24 30 4c 39 e0 0f 85 1b fe
ff ff 48 89 df e8 2e ab fb ff e9 23 fe ff ff 49 bc ff ff ff ff ff ff
ff 7f e9 fb fc ff ff <0f> 0b e9 1b ff ff ff 48 8b 44 24 40 65 48 2b 04
25 28 00 00 00 75
[Sun May 28 12:48:12 2023] RSP: 0018:ffff99b284f0be68 EFLAGS: 00010246
[Sun May 28 12:48:12 2023] RAX: 0000000000000000 RBX: ffff99b284edd000
RCX: 0000000000000000
[Sun May 28 12:48:12 2023] RDX: 0000000000000000 RSI: 0000000000000000
RDI: 0000000000000000
[Sun May 28 12:48:12 2023] RBP: ffff9271397024e0 R08: 0000000000000000
R09: ffff927139702450
[Sun May 28 12:48:12 2023] R10: 0000000000000000 R11: 0000000000000001
R12: ffff99b284f0be98
[Sun May 28 12:48:12 2023] R13: 0000000000000000 R14: ffff9270991fcd80
R15: 0000000000000003
[Sun May 28 12:48:12 2023] FS:  0000000000000000(0000)
GS:ffff927f9f640000(0000) knlGS:0000000000000000
[Sun May 28 12:48:12 2023] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Sun May 28 12:48:12 2023] CR2: 00007f0aacad3ae0 CR3: 000000088fc2c005
CR4: 00000000003726e0
[Sun May 28 12:48:12 2023] Call Trace:
[Sun May 28 12:48:12 2023]  <TASK>
[Sun May 28 12:48:12 2023]  ?
__pfx_kvm_nx_huge_page_recovery_worker+0x10/0x10 [kvm]
[Sun May 28 12:48:12 2023]  kvm_vm_worker_thread+0x106/0x1c0 [kvm]
[Sun May 28 12:48:12 2023]  ? __pfx_kvm_vm_worker_thread+0x10/0x10 [kvm]
[Sun May 28 12:48:12 2023]  kthread+0xd9/0x100
[Sun May 28 12:48:12 2023]  ? __pfx_kthread+0x10/0x10
[Sun May 28 12:48:12 2023]  ret_from_fork+0x2c/0x50
[Sun May 28 12:48:12 2023]  </TASK>
[Sun May 28 12:48:12 2023] ---[ end trace 0000000000000000 ]---


-- 
Fabio
