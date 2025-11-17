Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE82296BC2
	for <regressions@lists.linux.dev>; Mon, 17 Nov 2025 17:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400071; cv=none; b=WrwRdHDCQDUa/K6sBlnloVmoMa2uef2oJ8vzKGrjsKnN0DdbVzzh/jDLPdsgQBTKYELkmWjAjx8m4xVQJMlpsq0ta1AHvBVeqe6yZ5/EFgyh0KoWplKCgTlOnYxDKj7GcOUzIL9zh3J0hn1Kjvh00cAyCCWKFXjA1jNemcI9TlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400071; c=relaxed/simple;
	bh=CpsMqcBrBmLhRSglWFt9sdrSkoAtgfilYvkZIITbakM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V4nlatjaN+GXoaRsFRFsCi4fICCUhTdnSrReRooGWBQN7lOnEYpcMqIUZB4wQZoOWjK9CSogf0BL6kecThifCmxxZyDnWhSMnLQKkb5Ztw4jdV1JlVAdm0tdZ5tbduLvnCADcpYaFp4XWtqoXOpZifPWtzJ2Yobf+ntw5hjbTjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aEyM+yaf; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aEyM+yaf"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so7884322a12.1
        for <regressions@lists.linux.dev>; Mon, 17 Nov 2025 09:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763400067; x=1764004867; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udV0B2AM43mBQD7j3KWWFP5zdzMvBd+ee3IlnT4qfK4=;
        b=aEyM+yafCWIGMYqyhL2PimQPnVp+A9OILFE2f7b1ryVKi/Xp8UhTkzxdEQEfmKWzCe
         cjaupVfFdS+DV3sobgg46pcOguT8PqCUvdr2yKPlgJazaNZ9SSbuMflcZ6P32xzIitsJ
         3H6gqQqq4NmHg7FbSGQnCwpvjvz7eOzQX4pDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400067; x=1764004867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=udV0B2AM43mBQD7j3KWWFP5zdzMvBd+ee3IlnT4qfK4=;
        b=uQXHgaRShNvC25jUTnnrtG+diD7FsTB30XBFEISV1ujx9U7KKsRi1hzCj/jTJkPgjv
         fY4tSDIZvYu30HVm/EGzM30wQuF33H5eSnNVWdsjICMDrH1PWuYHiDBfZEkKmDAWXaD3
         aiSTGo+fIBdhddUPNY1OhNWpi6zIKh+yEVh/jOeKq8n/2ZMXVSmqQVL/32U/Ig1B161I
         szvluD/IS+CNNI1QVDMqx6xB8C3RbW3cT3HkfxVhpNFxJYHt6vXthkiEt9LZhYCmAMS+
         VSWF3JlavOElR3P90zCPdWCodJdYFdLw7QHjIx4iylqGDMxwRlm4oLhnmXySqkthyvz8
         759g==
X-Forwarded-Encrypted: i=1; AJvYcCWyvhCwARyq2053n9puHi0tOIKqJ88dJ+PKU1554llLIV6tk06x8hAbKN4xdPZw/o3MzK6z8OU9wRdeoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJSglnRs08+0jP3A/vzF9mfZ9mUZDqiUTcWH3EfLu4dIFuetzF
	h11lFDbQ7k6HXM1cOuV5iNU8LHxs41H+hmawi1sColA31fVAang/9LVr37JxEYpfoPAfVedYTSg
	niECS2w==
X-Gm-Gg: ASbGncsd9YWgGpQfuvxGiq+/Db5yd/5YU4hr4t2V/UvutS1oruLzGEzQsDCj8A2mBbc
	pGFybQmy/OkGTb+86+pLEXjyhCrc2SBEdUAkmE1+NSOxbuIiBVZlVIUxpwvrzqJW2WkJpz7PRiX
	OFWdxjdYBUex2kextepRRBRTyLD3fO8kaqRcfgoN4ZFH5p7u1uSWrW6Zb2Hn8khnq0jaIzE9y4E
	MjGdHim9Nz9IBR+tljI5vPIcvKW11bbGsqXv6TT1kn4ASLdNfHDFwVl1+e+U5CtqJL8D8Jc5/nu
	6eoWdmfaw1KDSF6lteWFTEFl94YRIzTgbzTb3P9WoYUd+nO586GsOSV43BRf5NOYMW0vEFRhqlN
	W6l0PNgvvexEfvyymJIGzm8P1CeJYITxZlcL6bZrZScoF1KZqRZ9L/B96Ookll7s9Ae/b7Pvg12
	PnLhNtsHR24Ztmq2wJiXYSlwwoyjNCHvpWCgvUiTDoPHeKBJpECcPGzR2vhweKttyoNx0Xhko=
X-Google-Smtp-Source: AGHT+IHwtc5BzpBQXrOArDpv8edTHEjf2lSkVdTLF+YsxAmsAS1+jP9B3L9cwPXbe9qzicbb9H+xsQ==
X-Received: by 2002:a05:6402:234c:b0:641:27d8:ec4c with SMTP id 4fb4d7f45d1cf-64350e06ef6mr13908238a12.16.1763400066963;
        Mon, 17 Nov 2025 09:21:06 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-644f13ff4d4sm1179832a12.12.2025.11.17.09.21.05
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 09:21:05 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b3ac40ae4so2715524f8f.0
        for <regressions@lists.linux.dev>; Mon, 17 Nov 2025 09:21:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxNcr78h+FdtJqzBEehtXi+uEinluYkey/cIBvScNgSNnbj1oR7GWmS/m2/9fQrNeyBeUQ/q4qQMb/xg==@lists.linux.dev
X-Received: by 2002:a05:6000:4024:b0:42b:3b55:8928 with SMTP id
 ffacd0b85a97d-42b59344ab4mr12357908f8f.20.1763400064512; Mon, 17 Nov 2025
 09:21:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <jOB6zqCC3xjlPPJXwPYPb4MxHJOhxVgp380ayP7lYq-aT2iA5D8YCdMeCvq5Cp_ICZmqjpfgX8o9siQdlPu9DY4qgnL_zCjgqP23fXc-P4U=@proton.me>
 <1b59d3c2-1ed0-40df-a3ba-cca2316e866b@leemhuis.info> <a03739b9-3a54-4ecb-b55f-6aaa69da3fc6@leemhuis.info>
 <a380d061-479e-4713-bddd-1d6571ca7e86@leemhuis.info>
In-Reply-To: <a380d061-479e-4713-bddd-1d6571ca7e86@leemhuis.info>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 Nov 2025 09:20:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xt58+WGK_j_TvTxpUfXrm-=Cec1-oodkuf5xiDGrsKuA@mail.gmail.com>
X-Gm-Features: AWmQ_bmPIoADLM7hcZvYJZbsnMMoj2N4eb3kGIXfqZu5R4vdEJTZxLWO33NCRP4
Message-ID: <CAD=FV=Xt58+WGK_j_TvTxpUfXrm-=Cec1-oodkuf5xiDGrsKuA@mail.gmail.com>
Subject: Re: [REGRESSION] Bluetooth adapter provided by `btusb` not recognized
 since v6.13.2
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: incogcyberpunk@proton.me, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, "marcel@holtmann.org" <marcel@holtmann.org>, 
	"luiz.dentz@gmail.com" <luiz.dentz@gmail.com>, 
	"linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, 
	"johan.hedberg@gmail.com" <johan.hedberg@gmail.com>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 17, 2025 at 8:48=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> [Ccing Douglas Anderson, who might have an idea]
> [dropping stable from To, that is irrelevant there]
>
> On 11/17/25 11:55, Thorsten Leemhuis wrote:
> > On 11/17/25 10:42, Thorsten Leemhuis wrote:
> >> On 11/17/25 02:30, incogcyberpunk@proton.me wrote:
> >>> Distro: Arch Linux
> >>> Kernel: since v6.13.2
> >> Lo! Thx for the report. It's unlikely that any developer will look int=
o
> >> this report[1] as 6.13.y is ancient by kernel development standards an=
d
> >> EOL for quite a while.
> >>
> >> Please check if the latest stable version is still affected; if it is,
> >> ideally try latest mainline (6.18-rc6), too. If that is as well, it
> >> would be great if you could bisect between 6.13.1 and 6.13.2.
> >
> > TWIMC, IncogCyberpunk replied in private to me and wrote:
> >
> > """
> > Sorry, if I was not clear but, the problem persists in both the stable
> > (v6.17.8) and the latest mainline (v6.18-rc6) linux kernels as of Nov 2=
025
> > """
> >
> > Please reply in public next time.
>
> IncogCyberpunk sent another reply in private. IncogCyberpunk, please
> just use "reply-to-all", I cannot forward each of your replies manually.
> Anyway, here it is:
>
> """
> The logs for the 6.18-rc6 mainline kernel are provided below Also, to
> make it clear, the regression has been observed in both the stable and
> the mainline kernels since the kernel 6.13.2.
>
> Logs for v6.18-rc6 kernel:
> https://pastebin.com/GeAzr56Z
> """
>
> To quote from that:
>
> """
> Nov 17 17:14:30 Incog kernel: BUG: kernel NULL pointer dereference, addre=
ss: 00000000000000d0
> Nov 17 17:14:30 Incog kernel: fbcon: Taking over console
> Nov 17 17:14:30 Incog kernel: #PF: supervisor write access in kernel mode
> Nov 17 17:14:30 Incog kernel: #PF: error_code(0x0002) - not-present page
> Nov 17 17:14:30 Incog kernel: PGD 0 P4D 0
> Nov 17 17:14:30 Incog kernel: Oops: Oops: 0002 [#1] SMP NOPTI
> Nov 17 17:14:30 Incog kernel: CPU: 8 UID: 0 PID: 136 Comm: kworker/u49:0 =
Tainted: G S                  6.18.0-rc6-1-mainline #1 PREEMPT(full)  23296=
8b2ab8c223687b1bdd5c39590a8f510b2d3
> Nov 17 17:14:30 Incog kernel: Tainted: [S]=3DCPU_OUT_OF_SPEC
> Nov 17 17:14:30 Incog kernel: Hardware name: Acer Aspire A315-59/Callisto=
_ADU, BIOS V1.16 08/16/2022
> Nov 17 17:14:30 Incog kernel: Workqueue: hci0 hci_power_on [bluetooth]
> Nov 17 17:14:30 Incog kernel: RIP: 0010:mutex_lock+0x1c/0x30
> Nov 17 17:14:30 Incog kernel: Code: 90 90 90 90 90 90 90 90 90 90 90 90 9=
0 90 f3 0f 1e fa 0f 1f 44 00 00 53 48 89 fb 2e 2e 2e 31 c0 65 48 8b 15 de 0=
7 d7 01 31 c0 <f0> 48 0f b1 13 75 06 5b c3 cc cc cc cc 48 89 df 5b eb b1 90=
 90 90
> Nov 17 17:14:30 Incog kernel: RSP: 0018:ffffcf12807fbd88 EFLAGS: 00010246
> Nov 17 17:14:30 Incog kernel: RAX: 0000000000000000 RBX: 00000000000000d0=
 RCX: 0000000000000001
> Nov 17 17:14:30 Incog kernel: RDX: ffff8c88c61f0000 RSI: 0000000000000002=
 RDI: 00000000000000d0
> Nov 17 17:14:30 Incog kernel: RBP: ffff8c88c7a20028 R08: 0000000000000000=
 R09: 0000000000000010
> Nov 17 17:14:30 Incog kernel: R10: 0000000000000000 R11: 0000000000000404=
 R12: ffff8c88c9fb4000
> Nov 17 17:14:30 Incog kernel: R13: ffff8c88c61c1a05 R14: 0000000000000000=
 R15: ffff8c88c9fb4408
> Nov 17 17:14:30 Incog kernel: FS:  0000000000000000(0000) GS:ffff8c8cd8f0=
2000(0000) knlGS:0000000000000000
> Nov 17 17:14:30 Incog kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
> Nov 17 17:14:30 Incog kernel: CR2: 00000000000000d0 CR3: 000000010b106000=
 CR4: 0000000000f50ef0
> Nov 17 17:14:30 Incog kernel: PKRU: 55555554
> Nov 17 17:14:30 Incog kernel: Call Trace:
> Nov 17 17:14:30 Incog kernel:  <TASK>
> Nov 17 17:14:30 Incog kernel:  btusb_mtk_setup+0xa0/0x1a0 [btusb 3ead27e0=
9a395fe31ca20705f760e78aab4d59d8]
> Nov 17 17:14:30 Incog kernel:  hci_dev_open_sync+0x102/0xb80 [bluetooth e=
25d49b4e9236169faf4970d9c81deaa8aed0e62]
> Nov 17 17:14:30 Incog kernel:  ? try_to_wake_up+0x35b/0x840
> Nov 17 17:14:30 Incog kernel:  hci_dev_do_open+0x23/0x60 [bluetooth e25d4=
9b4e9236169faf4970d9c81deaa8aed0e62]
> Nov 17 17:14:30 Incog kernel:  hci_power_on+0x4d/0x250 [bluetooth e25d49b=
4e9236169faf4970d9c81deaa8aed0e62]
> Nov 17 17:14:30 Incog kernel:  process_one_work+0x193/0x350
> Nov 17 17:14:30 Incog kernel:  worker_thread+0x2d7/0x410
> Nov 17 17:14:30 Incog kernel:  ? __pfx_worker_thread+0x10/0x10
> Nov 17 17:14:30 Incog kernel:  kthread+0xfc/0x240
> Nov 17 17:14:30 Incog kernel:  ? __pfx_kthread+0x10/0x10
> Nov 17 17:14:30 Incog kernel:  ? __pfx_kthread+0x10/0x10
> Nov 17 17:14:30 Incog kernel:  ret_from_fork+0x1c2/0x1f0
> Nov 17 17:14:30 Incog kernel:  ? __pfx_kthread+0x10/0x10
> Nov 17 17:14:30 Incog kernel:  ret_from_fork_asm+0x1a/0x30
> Nov 17 17:14:30 Incog kernel:  </TASK>
> Nov 17 17:14:30 Incog kernel: Modules linked in: btusb intel_rapl_msr uvc=
video ghash_clmulni_intel snd_pcm_dmaengine processor_thermal_rfim iTCO_wdt=
 mt76 btmtk processor_thermal_rapl videobuf2_vmalloc intel_pmc_bxt snd_pcm =
aesni_intel mei_pxp btrtl mei_hdcp iTCO_vendor_support ee1004 intel_rapl_co=
mmon btbcm uvc rapl snd_timer videobuf2_memops btintel intel_cstate process=
or_thermal_wt_req mac80211 hid_multitouch(+) i2c_i801 spi_nor mei_me videob=
uf2_v4l2 acer_wmi snd i2c_smbus processor_thermal_power_floor bluetooth int=
el_uncore mtd videobuf2_common pcspkr wmi_bmof platform_profile libarc4 sou=
ndcore i2c_mux mei thunderbolt(+) processor_thermal_mbox igen6_edac intel_o=
c_wdt ov13858 i2c_hid_acpi v4l2_fwnode int3403_thermal int340x_thermal_zone=
 v4l2_async i2c_hid intel_pmc_core videodev pmt_telemetry mc pmt_discovery =
intel_hid int3400_thermal pmt_class pinctrl_tigerlake acpi_thermal_rel spar=
se_keymap mousedev acpi_pad intel_pmc_ssram_telemetry joydev acer_wireless =
mac_hid cfg80211 rfkill usblp pkcs8_key_parser crypto_user ntsync dm_mod lo=
op
> Nov 17 17:14:30 Incog kernel:  nfnetlink ip_tables x_tables xe intel_vsec=
 drm_ttm_helper drm_suballoc_helper gpu_sched nvme drm_gpuvm nvme_core nvme=
_keyring drm_exec nvme_auth hkdf drm_gpusvm_helper i915 i2c_algo_bit drm_bu=
ddy ttm serio_raw video intel_gtt spi_intel_pci intel_lpss_pci drm_display_=
helper intel_lpss spi_intel wmi vmd cec idma64
> Nov 17 17:14:30 Incog kernel: CR2: 00000000000000d0
> Nov 17 17:14:30 Incog kernel: ---[ end trace 0000000000000000 ]---
> Nov 17 17:14:30 Incog kernel: RIP: 0010:mutex_lock+0x1c/0x30
> Nov 17 17:14:30 Incog kernel: Code: 90 90 90 90 90 90 90 90 90 90 90 90 9=
0 90 f3 0f 1e fa 0f 1f 44 00 00 53 48 89 fb 2e 2e 2e 31 c0 65 48 8b 15 de 0=
7 d7 01 31 c0 <f0> 48 0f b1 13 75 06 5b c3 cc cc cc cc 48 89 df 5b eb b1 90=
 90 90
> Nov 17 17:14:30 Incog kernel: RSP: 0018:ffffcf12807fbd88 EFLAGS: 00010246
> Nov 17 17:14:30 Incog kernel: RAX: 0000000000000000 RBX: 00000000000000d0=
 RCX: 0000000000000001
> Nov 17 17:14:30 Incog kernel: RDX: ffff8c88c61f0000 RSI: 0000000000000002=
 RDI: 00000000000000d0
> Nov 17 17:14:30 Incog kernel: RBP: ffff8c88c7a20028 R08: 0000000000000000=
 R09: 0000000000000010
> Nov 17 17:14:30 Incog kernel: R10: 0000000000000000 R11: 0000000000000404=
 R12: ffff8c88c9fb4000
> Nov 17 17:14:30 Incog kernel: R13: ffff8c88c61c1a05 R14: 0000000000000000=
 R15: ffff8c88c9fb4408
> Nov 17 17:14:30 Incog kernel: FS:  0000000000000000(0000) GS:ffff8c8cd8f0=
2000(0000) knlGS:0000000000000000
> Nov 17 17:14:30 Incog kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
> Nov 17 17:14:30 Incog kernel: CR2: 00000000000000d0 CR3: 000000010b106000=
 CR4: 0000000000f50ef0
> Nov 17 17:14:30 Incog kernel: PKRU: 55555554
> Nov 17 17:14:30 Incog kernel: note: kworker/u49:0[136] exited with irqs d=
isabled
> """
>
> A very quick a rough search on lore made me wonder if e9087e828827e5
> ("Bluetooth: btusb: mediatek: Add locks for usb_driver_claim_interface()"=
)
> from Douglas might be the culprit, which was indeed added to 6.13.2:
> https://lore.kernel.org/all/20250205134516.957708847@linuxfoundation.org/
>
> IncogCyberpunk, you might want to try if reverting that one helps.

Certainly that seems plausible if the PC points to mutex_lock(). I
guess that means "btmtk_data->isopkt_intf" must be NULL? This would
probably fix you?

@@ -2714,6 +2714,11 @@ static void btusb_mtk_claim_iso_intf(struct
btusb_data *data)
        struct btmtk_data *btmtk_data =3D hci_get_priv(data->hdev);
        int err;

+       if (!btmtk_data->isopkt_intf) {
+               bt_dev_err(data->hdev, "Can't claim NULL iso interface");
+               return;
+       }
+

I don't personally know the driver well enough to know if that's
"safe" because we're checking w/ no locking, but it would at least be
as safe as the code was before my patch.

-Doug
