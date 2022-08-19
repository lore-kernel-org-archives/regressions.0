Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF795CBF
	for <regressions@lists.linux.dev>; Fri, 19 Aug 2022 12:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660910690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4PfD//gcExMPoTr7Iib7oV2J/W9qv3uSCm7od3N71NE=;
	b=gQAi6biCCQijiPoW2GPbs2tPpoUPnbKtRFVBvIZ0sLnRe+Nel00LQTqNOuAjKjC8MHgXGs
	Wkrzj9Wf8oJ6OjZqO3njRVXPHrRYFt+iamVhmzjgI8hw5psbSO08NNJ5OXtBlqcugEpUvQ
	Ja3sPSmrYXIRizc5nK4kBQfL+lhxbzQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-471-NMLnGn7FOxaTf_skK89pKA-1; Fri, 19 Aug 2022 08:04:49 -0400
X-MC-Unique: NMLnGn7FOxaTf_skK89pKA-1
Received: by mail-ed1-f70.google.com with SMTP id q32-20020a05640224a000b004462f105fa9so1596576eda.4
        for <regressions@lists.linux.dev>; Fri, 19 Aug 2022 05:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=57lbzvIa6BmcNW5ljRKD/dOhl0fWej5ztO8NUJwHM1M=;
        b=A5/Jz9jkjoyWo60izThv4gddqiUfbd2C780jXcxbKPiTgKMFB9EoWiY1nY+cQtlsrI
         tm7ORVZHEYDA7MmYI3hwA08Vkls1v+GlDkJZV/c+n2Y+9ayM4icXECU6yr0rPvawgcLf
         OY1LJUs8w0hr6UjWWNnzU/Ci24bsoW7KLAhWeWORcs6XXwBqSXD020m5kjxYVtKvs9aX
         DyuS7QpEfLzNb7tbRyxOOhL/OQ6KbY7cfWIYAIHdUwW8xks7X2rTarGZX2TbmiABjGY7
         mNDhLH+QxBwM3wqgTvs0sJyAbXcbbQ61zjnbs5r50p6oXHYLnCn5HMsZKRJhxNzAANM9
         cZ5A==
X-Gm-Message-State: ACgBeo3mGI3gR+SkWaY9kMe7sZD6hnR4eT7sYhd3oU3KGAjoRzbtof7T
	MdRepG3VO6z/tPNfLSJBoiCNSTUjVUdE4Vsx5p6mZ4Wq5t+Jha0m9xHojET7bHFR0LkeYd+ZFe4
	CzO+m/jbinQBXICb9C0IW4w0=
X-Received: by 2002:a17:906:98d5:b0:73d:538a:cb88 with SMTP id zd21-20020a17090698d500b0073d538acb88mr1094200ejb.422.1660910687529;
        Fri, 19 Aug 2022 05:04:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4ECqtEd/QIQe20OmqmEvaxJ4U0VUXbvdHs8DhTBHLVR4RQzhEVf3MrrU+HBrJV7njn5HObww==
X-Received: by 2002:a17:906:98d5:b0:73d:538a:cb88 with SMTP id zd21-20020a17090698d500b0073d538acb88mr1094194ejb.422.1660910687337;
        Fri, 19 Aug 2022 05:04:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id j13-20020aa7de8d000000b0043d742104efsm2927434edv.19.2022.08.19.05.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 05:04:46 -0700 (PDT)
Message-ID: <587e5aa0-63d2-3b0b-4cc5-8c0240a9e8df@redhat.com>
Date: Fri, 19 Aug 2022 14:04:45 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
To: Mathias Nyman <mathias.nyman@intel.com>,
 linux-usb <linux-usb@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
From: Hans de Goede <hdegoede@redhat.com>
Subject: 6.0-rc1 new XHCI cacheline tracking EEXIST WARN/oops
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi All,

While dogfooding 6.0-rc1 on my main workstation I noticed the following
new WARN/oops:

Aug 19 12:22:39 shalem kernel: ------------[ cut here ]------------
Aug 19 12:22:39 shalem kernel: DMA-API: xhci_hcd 0000:30:00.3: cacheline tr=
acking EEXIST, overlapping mappings aren't supported
Aug 19 12:22:39 shalem kernel: WARNING: CPU: 14 PID: 8321 at kernel/dma/deb=
ug.c:570 add_dma_entry+0x1ed/0x270
Aug 19 12:22:39 shalem kernel: Modules linked in: rfcomm snd_seq_dummy snd_=
hrtimer qrtr bnep vboxnetadp(OE) vboxnetflt(OE) vboxdrv(OE) binfmt_misc vfa=
t fat intel_rapl_msr intel_rapl_common iwlmvm snd_hda_codec_realtek snd_hda=
_codec_generic edac_mce_amd mac80211 ledtrig_audio snd_hda_codec_hdmi kvm_a=
md snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi libarc4 kvm snd_hda_co=
dec irqbypass iwlwifi snd_hda_core snd_usb_audio btusb rapl btrtl snd_usbmi=
di_lib iwlmei btbcm snd_hwdep btintel snd_rawmidi snd_seq mc btmtk snd_seq_=
device cfg80211 wmi_bmof bluetooth snd_pcm joydev snd_timer rfkill mei r816=
9 snd soundcore i2c_piix4 k10temp gpio_amdpt gpio_generic zram dm_crypt amd=
gpu drm_ttm_helper ttm iommu_v2 crct10dif_pclmul gpu_sched crc32_pclmul crc=
32c_intel drm_buddy hid_lg_g15 drm_display_helper nvme ghash_clmulni_intel =
nvme_core ccp cec sp5100_tco wmi video hid_logitech_hidpp uas usb_storage h=
id_logitech_dj ip6_tables ip_tables fuse i2c_dev
Aug 19 12:22:39 shalem kernel: Unloaded tainted modules: acpi_cpufreq():1 a=
cpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 pcc_cpuf=
req():1 pcc_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 =
amd64_edac():1 acpi_cpufreq():1 amd64_edac():1 acpi_cpufreq():1 amd64_edac(=
):1 acpi_cpufreq():1 amd64_edac():1 acpi_cpufreq():1 amd64_edac():1 amd64_e=
dac():1 acpi_cpufreq():1 fjes():1 amd64_edac():1 acpi_cpufreq():1 fjes():1 =
amd64_edac():1 acpi_cpufreq():1 fjes():1 pcc_cpufreq():1 amd64_edac():1 acp=
i_cpufreq():1 fjes():1 amd64_edac():1 acpi_cpufreq():1 pcc_cpufreq():1 fjes=
():1 acpi_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 acpi_cpufreq():1 fjes(=
):1 amd64_edac():1 pcc_cpufreq():1 acpi_cpufreq():1 fjes():1 amd64_edac():1=
 pcc_cpufreq():1 fjes():1 amd64_edac():1 acpi_cpufreq():1 pcc_cpufreq():1 f=
jes():1 amd64_edac():1 acpi_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 fjes=
():1 pcc_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 pcc_cpufreq():1 fjes=
():1 acpi_cpufreq():1 pcc_cpufreq():1
Aug 19 12:22:39 shalem kernel:  fjes():1 acpi_cpufreq():1 pcc_cpufreq():1 a=
cpi_cpufreq():1 fjes():1 pcc_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 =
fjes():1 pcc_cpufreq():1 acpi_cpufreq():1 fjes():1 acpi_cpufreq():1 pcc_cpu=
freq():1 fjes():1 acpi_cpufreq():1
Aug 19 12:22:39 shalem kernel: CPU: 14 PID: 8321 Comm: kworker/u64:57 Taint=
ed: G           OE     -------  ---  6.0.0-0.rc1.20220817git3cc40a443a04.14=
.fc38.x86_64 #1
Aug 19 12:22:39 shalem kernel: Hardware name: Micro-Star International Co.,=
 Ltd. MS-7C95/B550M PRO-VDH WIFI (MS-7C95), BIOS 2.90 12/23/2021
Aug 19 12:22:39 shalem kernel: Workqueue: events_unbound async_run_entry_fn
Aug 19 12:22:39 shalem kernel: RIP: 0010:add_dma_entry+0x1ed/0x270
Aug 19 12:22:39 shalem kernel: Code: ff 0f 84 97 00 00 00 48 8b 5f 50 48 85=
 db 75 03 48 8b 1f e8 15 96 85 00 48 89 c6 48 89 da 48 c7 c7 30 c9 86 85 e8=
 73 99 ce 00 <0f> 0b 48 85 ed 0f 85 a9 50 cf 00 8b 05 f2 09 23 02 85 c0 0f =
85 ca
Aug 19 12:22:39 shalem kernel: RSP: 0018:ffffa78dc2c0ba20 EFLAGS: 00010282
Aug 19 12:22:39 shalem kernel: RAX: 0000000000000060 RBX: ffff8ac186a636c0 =
RCX: 0000000000000000
Aug 19 12:22:39 shalem kernel: RDX: 0000000000000001 RSI: ffffffff858d07a4 =
RDI: 00000000ffffffff
Aug 19 12:22:39 shalem kernel: RBP: ffff8ac184f17a80 R08: 0000000000000001 =
R09: 0000000000000001
Aug 19 12:22:39 shalem kernel: R10: 0000000000000001 R11: 0000000000000000 =
R12: 0000000000000000
Aug 19 12:22:39 shalem kernel: R13: 0000000000000001 R14: 0000000000000206 =
R15: 00000000042f65bd
Aug 19 12:22:39 shalem kernel: FS:  0000000000000000(0000) GS:ffff8ac409a00=
000(0000) knlGS:0000000000000000
Aug 19 12:22:39 shalem kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800=
50033
Aug 19 12:22:39 shalem kernel: CR2: 0000000000000000 CR3: 000000014c028000 =
CR4: 0000000000750ee0
Aug 19 12:22:39 shalem kernel: PKRU: 55555554
Aug 19 12:22:39 shalem kernel: Call Trace:
Aug 19 12:22:39 shalem kernel:  <TASK>
Aug 19 12:22:39 shalem kernel:  dma_map_page_attrs+0x82/0x2d0
Aug 19 12:22:39 shalem kernel:  ? _raw_spin_unlock_irqrestore+0x30/0x60
Aug 19 12:22:39 shalem kernel:  usb_hcd_map_urb_for_dma+0x423/0x500
Aug 19 12:22:39 shalem kernel:  usb_hcd_submit_urb+0x9b/0xb80
Aug 19 12:22:39 shalem kernel:  ? lockdep_init_map_type+0x62/0x260
Aug 19 12:22:39 shalem kernel:  usb_start_wait_urb+0x55/0x140
Aug 19 12:22:39 shalem kernel:  usb_control_msg+0xc9/0x120
Aug 19 12:22:39 shalem kernel:  hub_ext_port_status+0x89/0x110
Aug 19 12:22:39 shalem kernel:  hub_activate+0x11c/0x8b0
Aug 19 12:22:39 shalem kernel:  ? usb_dev_thaw+0x10/0x10
Aug 19 12:22:39 shalem kernel:  hub_resume+0x23/0xe0
Aug 19 12:22:39 shalem kernel:  ? usb_dev_thaw+0x10/0x10
Aug 19 12:22:39 shalem kernel:  usb_resume_interface.constprop.0.isra.0+0x8=
9/0xd0
Aug 19 12:22:39 shalem kernel:  usb_resume_both+0x109/0x180
Aug 19 12:22:39 shalem kernel:  ? usb_dev_thaw+0x10/0x10
Aug 19 12:22:39 shalem kernel:  usb_resume+0x15/0x60
Aug 19 12:22:39 shalem kernel:  dpm_run_callback+0x53/0xc0
Aug 19 12:22:39 shalem kernel:  device_resume+0xa8/0x200
Aug 19 12:22:39 shalem kernel:  async_resume+0x19/0x30
Aug 19 12:22:39 shalem kernel:  async_run_entry_fn+0x30/0x130
Aug 19 12:22:39 shalem kernel:  process_one_work+0x2a0/0x600
Aug 19 12:22:39 shalem kernel:  worker_thread+0x4f/0x3a0
Aug 19 12:22:39 shalem kernel:  ? process_one_work+0x600/0x600
Aug 19 12:22:39 shalem kernel:  kthread+0xf5/0x120
Aug 19 12:22:39 shalem kernel:  ? kthread_complete_and_exit+0x20/0x20
Aug 19 12:22:39 shalem kernel:  ret_from_fork+0x22/0x30
Aug 19 12:22:39 shalem kernel:  </TASK>
Aug 19 12:22:39 shalem kernel: irq event stamp: 2115
Aug 19 12:22:39 shalem kernel: hardirqs last  enabled at (2123): [<ffffffff=
8418fb52>] vprintk_emit+0x342/0x350
Aug 19 12:22:39 shalem kernel: hardirqs last disabled at (2130): [<ffffffff=
8418fb01>] vprintk_emit+0x2f1/0x350
Aug 19 12:22:39 shalem kernel: softirqs last  enabled at (0): [<ffffffff840=
f5079>] copy_process+0xa49/0x1e50
Aug 19 12:22:39 shalem kernel: softirqs last disabled at (0): [<00000000000=
00000>] 0x0
Aug 19 12:22:39 shalem kernel: ---[ end trace 0000000000000000 ]---
Aug 19 12:22:39 shalem kernel: DMA-API: Mapped at:
Aug 19 12:22:39 shalem kernel:  debug_dma_map_page+0x66/0x100
Aug 19 12:22:39 shalem kernel:  dma_map_page_attrs+0x82/0x2d0
Aug 19 12:22:39 shalem kernel:  usb_hcd_map_urb_for_dma+0x423/0x500
Aug 19 12:22:39 shalem kernel:  usb_hcd_submit_urb+0x9b/0xb80
Aug 19 12:22:39 shalem kernel:  usb_start_wait_urb+0x55/0x140

Regards,

Hans


