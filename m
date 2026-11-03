Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793699582;
	b=JHEfxPncXN0O2kleZTLF5Ry4+yxEkXzcKI6Zp99I6+iwdhulOvgR2bS3ovlzw+PwjmZw
	 80nurtwllx9Ejm+0QG9uQVp3kN6de3qzkRJ+8AghMuvg6XZPjD6DbbIj4JWO+mQfAx5dR
	 0jDYzVs+cKgr0rMkohQjZThMRymWsv+oEme1HwmT/P5GIgXDI18uW4izFURmPFhGk0nsV
	 UpfapH0cZa2Ceuab0mgPzl7Aq+QIby2cr4Z1MLoCQF2L7pPr2OqiW4OZidbDvtmu73DKO
	 qpuQCvi4W6Ia5yzOflCiLs22AWyXellztwIF7h+OR8tkt3QmpCf10TPFYqgHJQ3VUsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GKajE82zSLmmO4qRbQtdvvELq+9Ww/Uvb5sLbelJn60=;
	b=SfH1PxM5KFu0aL74JkwYHl734vhYEcons7BqPvPuV7tMFG4C+SyBDu+9Hf9TJROE4wFv
	 wWYC2SFlIUim6eXuBGeaC4GwlTPQ9/hUkpHvSAdK+WfeuoMCChJ7W7HQZQ16z1n58PIVq
	 Adp7LVfcxtjfWpNgdSLFsx8y4I90aKKl56ZaWhJYaQCRRI+o2ce/gZQaKO/mx8OJV3XOv
	 mcxzXTIQd5CqPgB98trLpHun/2erUK/7BYknM0UlJpthgRCw3kiAzeD8ydFlOcQ9mtlge
	 Iws5T5js1tN+Kj5WjQa/XGtS63jr8cfJub26F78EtuIsQLjz8lPShSTINBNSNVk1o6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aHu7zwGR;
	arc=fail smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A871C606EE89
	for <regressions@lists.linux.dev>; Tue,  3 Nov 2026 09:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A871C606EE89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aHu7zwGR
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so2866245e9.0
        for <regressions@lists.linux.dev>; Tue, 03 Nov 2026 01:53:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793699580; cv=none;
        d=google.com; s=arc-20260327;
        b=M/kp5ABeJj0/uxZUGkJ3XrFeT4jdDVOEg2x3BxDZrD88RFsY7wcEMteCGqA5M0LYtu
         UWeL+lw2V33TL/4Fdodz0FA5ryRZ3S0pVotDfATeTyCJASzyPHEP9JZrZTNQ2Kl1kyoF
         n4nXHdRAMKHg3jem8QsfiOin5nPRnt2ef+AN7Qx5yAh+UH/riH20Z6bK9nRZcdf10e4r
         q7AYui6ACnxNeeMMochb0k7dMd1ofeYNDjzutUdnIuvYyIdSi2Nz/gow9RcEvwH0RIIJ
         yxjUlGpLB4X40UXAVVjosteGGaA8KvqmGXQyJTeh3F3RIsXijgKEgysRS+DRNwKFFTHd
         GQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GKajE82zSLmmO4qRbQtdvvELq+9Ww/Uvb5sLbelJn60=;
        fh=3XcMwQ2jryJVcGwtta51KGVXOBORQqXW7NVkD2vhndI=;
        b=YL++odijfVHIaQye7ihVJSnHRj/QtWi2NfGj5SvYt1Ef56eEzBLvYyPD5Z7u3eUBa3
         ul0BUMOHGYV8PCmp8tgFNJt9T/gCdUmNqDMoQBAmEF988SdoWK61x37Q5Lq/9wfVuyUj
         K+UGrLBljVIZWkW7oXauplUgTmAGXbsrSdfqZLDjScQzxubhbJpHtntXnRP0uh8RxhMl
         xeCucdwv/IKjEf/ZSW+jDP94othLkiSo63alJsnQuL5Ulsh6Vz5RpTX/ZXONYuhGDWys
         F7NVDgyEeSRtyWTfdGWaY6YN2gWGCOwAil/zTibHN2GE3KoRC+BPohBnX7GJ12VM9AWZ
         Zdmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699580; x=1794304380; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GKajE82zSLmmO4qRbQtdvvELq+9Ww/Uvb5sLbelJn60=;
        b=aHu7zwGRdtLaEElMQvwr3jb2OJBwWKFYCaG43d2u8o0OVVI0EogXlg0Ry8vZgxVoMH
         H7Bn7SqMxTeCnnQs1dqBnh2TZctSAWp/1A/MwJWNwZLOyeUHQAB/AJSAR2oJaGd0254g
         xNCRtTUAwxT2b5XkiSA/MNf+ASQXgmFP7Ptg7ZdkDW+WfrvBDD8B0rrThXgY7zuCHZ6s
         4gkh+pkcttL9mx5oHtOXwx3Obohqt6VngLNPNXaVoQMJGyMFbrxQK/UclV1aHWCtAFwQ
         cyY+OR1GSvH6CLcaVlSgF3y49G/ZjIkffxB1wTS0VlViez6H4pkXxPEd9pgHKiYKZn8j
         Yrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699580; x=1794304380;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GKajE82zSLmmO4qRbQtdvvELq+9Ww/Uvb5sLbelJn60=;
        b=QOLmVwb3rV4Tel46WWdKy2gMOr8e60FdC/E8HQqSXNQP3MV+/oSXOWhdebqQBdz3n0
         DODtTlAawi5yqu1qUuHmr6BnGKOhXvXzo34B/sb2nsWoXmZ8byy8sT4KfAROOhg/t8kS
         8k7luqQy0w8aCFL7Y1TQjzyRD3ZMSLAuMRqlyB6r0IOfwLxXD6TuReh1RPM6B11t1AeW
         vC+gRgD9MUWpE5z8PTjOnKkk+kCojuFNfqNTCBHhz+Z2WlwYiqnzDWpJLN03cQtIdbO7
         RTllfWoM8qu2PbRNW/jLgz/tDoEZb1YYmPH4awjErp2V1e+6eGKe3wxhgDmuZXNly+E+
         SBKA==
X-Forwarded-Encrypted: i=1; AKwUvBzYZMHxOyhmSfATb5/itGwPl/Kmuv6RdS1byLaL/qgUbUy2u/Vs5RJ2LKyCsOrRPf6v7kb167epS4Frow==@lists.linux.dev
X-Gm-Message-State: APuU4Z/OInyDSs7uMwkGpJ9lzPCiqF6askU1Ey5JmekdfgKQFrlZlbZM
	0YkED7YP7LOgKpAkBNayJF8v5ua7EL0ezq/IVtmor/ilSc7T62Rf1BwEIlA5R1r1HnZISFivcmz
	qTnm2POb8wBhbpdnOrs3Zmc7qDpyM4bg=
X-Gm-Gg: AYBFou3LjozjyagdQe/Kxt/uWtgFo3T+PyOGhZgXj+mH/OafGT4w5A0c6s9rAaDUWbf
	frbLKgptciHIcVt5bx1Xr7uduqY/HikBgTCqUgD2UR7IUDHBlHuI72LYH7kQwruxJgecEE4Dx9+
	wuZTpDBn1ZBiQpTq2bj4K4/gamSW7Ai7Ms/n2lVAmwBcn5MsNvDXnYsSv1eacGZt387QkDWdvOI
	AbIU9Ni5Nfa77Tw1E5J7gSJvvlRQiyqqYVvEaHczxjaOC7U/JY7SwDP4HNm/rl19o5/1P0uD9g7
	SR+IIie/GGAgHHFiQDCBiAQEzozfeNtnKEVm7eahWAvZYyvWduF1PNgcQa695kmcovpMdcYq93F
	kXEjj2pSsBF6KzKx8QbCqG2w+3dtZhDWEUuvSWXJdiHkKunwRNz68daDZsaabUCxuRfIi1RXli0
	LaF/4up36w1wZicZo=
X-Received: by 2002:a05:600d:6508:b0:4b0:b9ff:1e7c with SMTP id
 5b1f17b1804b1-4b0b9ff2129mr116381315e9.15.1793699579991; Tue, 03 Nov 2026
 01:52:59 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <a84fe7b5-ba90-4e51-afcc-548f8b30180b@icloud.com> <4e500063-d985-46b6-a0a1-3feaa77c4b2f@leemhuis.info>
In-Reply-To: <4e500063-d985-46b6-a0a1-3feaa77c4b2f@leemhuis.info>
From: Mohamed Yassine JEBABLI <med.jebabli@gmail.com>
Date: Tue, 3 Nov 2026 10:52:48 +0100
X-Gm-Features: AclHuK_gVSoghFofHU4OU9sa8nsiBkF76JbJCDYGPYcibo5ActA64gLH3ScUcvw
Message-ID: <CAN6p6ihSizkgHHYP2ns1ifE-eDeR2ZsK=wWyi4JoEgF3gQ3zxg@mail.gmail.com>
Subject: Re: [REGRESSION] ALSA: hda/tas2781: divide error on playback open
 after accepting V1 calibration data without CRC (Lenovo Yoga Pro 9 16IRP8)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: tiwai@suse.de, linux-sound@vger.kernel.org, 
	Cristian Castellano <cristian.castellano@icloud.com>, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cristian, Thorsten, Takashi,

(Resending as plain text, the previous mail was rejected by the
list and also pointed to the wrong link, sorry for the noise.)

Sorry for the breakage, and thanks for the detailed report.

The two populated entries in the dump are valid (R0 =3D 3.64/3.65 ohm,
1/R0 consistent), so I suspect p->ndev is larger than 2 on this
machine: the V1 loop then converts all-zero entries for the remaining
devices, and tas2781_cali_preproc() divides by re_cal =3D=3D 0. My patch
only checked the first entry, which was not enough.

Fix posted here, Cristian please give it a try:
https://lore.kernel.org/all/20261103-tas2781-v1-nocrc-fix-v1-1-a769c27f21ce=
@gmail.com/

Takashi's re_cal check looks like a good additional safeguard.

Thanks,
Mohamed yassine JEBABLI

Le lun. 2 nov. 2026 =C3=A0 12:36, Thorsten Leemhuis
<regressions@leemhuis.info> a =C3=A9crit :
>
> On 10/27/26 23:21, Cristian Castellano wrote:
> > Hello, since I updated to 7.2.11 (and then to 7.3), opening a
> > playback stream on my Lenovo Yoga Pro 9 16IRP8 (83BY, subsystem
> > 17aa:3835, BIOS KVCN44WW) triggers a divide error in
> > snd_soc_tas2781_fmwlib and audio stops working. 7.2.9 just works.
> >
> > The only tas2781 change between the two I found is: c1b708f712f5
> > ("ALSA: hda/tas2781: Accept V1 calibration data without CRC")
> > (upstream 408249089c48).
>
> Mohamed Yassine Jebabli: have you seen this? It's a change of yours that
> causes this problem.
>
> Cristian: can you maybe try if reverting that patch fixes things for
> you? That we know that this is a option in case no fix comes into reach
> soon.
>
> Ideally please test vanilla Linux, ideally mainline? CachyOS might not
> modify this drivers code, but occasionally changes in lower levels an
> cause trouble (but I doubt that is the case here).
>
> Ciao, Thorsten
>
>
> > At boot the driver now logs:
> >
> > tas2781-hda i2c-TIAS2781:00: tas2781_apply_calib: V1 data without
> > CRC, accepting
> >
> > Before that commit the data was rejected and the amplifiers worked
> > with default parameters. On this machine the CALI_DATA EFI variable
> > (CALI_DATA-1f52d2a1-bb3a-457d-bc09-43a3f4310a92) contains two non-zero
> > device entries followed by zeros, with TimeStamp and CRC zeroed:
> >
> >   0000000 07 00 00 00 5c c8 20 1d 28 b5 27 23 2a 79 42 16
> >   0000016 f2 07 c5 00 00 00 e0 2e 01 f7 2a 1d 72 6f 1b 23
> >   0000032 2a 41 4a 16 c4 0a c3 00 00 00 e0 2e 00 00 00 00
> >   0000048 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >   *
> >   0000128 00 00 00 00
> >
> > (the first 4 bytes are the EFI attributes)
> >
> > Oops:
> >
> >   Oops: divide error: 0000 [#1] SMP NOPTI
> >   CPU: 10 UID: 1000 PID: 1533 Comm: wireplumber Tainted: G        W  O =
       7.3.0-4-cachyos #1 PREEMPT(full)
> >   Hardware name: LENOVO 83BY/LNVNB161216, BIOS KVCN44WW 03/05/2025
> >   RIP: 0010:tasdevice_select_tuningprm_cfg+0x8c2/0xa90 [snd_soc_tas2781=
_fmwlib]
> >   Code: 4c 89 f7 41 b8 04 00 00 00 2e 2e 2e 41 ff d3 85 c0 0f 88 97 01 =
00 00 48 8b 4c 24 10 66 0f 38 f0 01 0f b7 c0 0f af 44 24 18 99 <f7> 7c 24 2=
4 88 21 88 41 01 c6 41 08 01 48 8b 4c 24 08 48 8b 44 24
> >   RAX: 0000000000000000 RBX: 000000000000002a RCX: ffff8d36ca8af218
> >   RDX: 0000000000000000 RSI: 0000000000000db8 RDI: ffff8d36ca8af21b
> >   RBP: 0000000000000000 R08: 0000000000000004 R09: 000000000000000a
> >   R10: 0000000000000100 R11: ffffffff87559290 R12: ffff8d3684e350df
> >   R13: ffff8d36a861d9b8 R14: ffff8d3684e35038 R15: 0000000000000002
> >   Call Trace:
> >    <TASK>
> >    tasdevice_tuning_switch+0x71/0x80 [snd_soc_tas2781_fmwlib]
> >    tas2781_hda_playback_hook+0x4c/0x110 [snd_hda_scodec_tas2781_i2c]
> >    hda_component_manager_playback_hook+0xb5/0x370 [snd_hda_scodec_compo=
nent]
> >    playback_pcm_open+0x79/0xa0 [snd_hda_codec_generic]
> >    hdac_hda_dai_open+0x5c/0x90 [snd_soc_hdac_hda]
> >    snd_soc_dai_startup+0x52/0x90 [snd_soc_core]
> >    __soc_pcm_open+0x108/0x6c0 [snd_soc_core]
> >    dpcm_be_dai_startup+0x153/0x3c0 [snd_soc_core]
> >    dpcm_fe_dai_open+0x109/0xc00 [snd_soc_core]
> >    snd_pcm_open_substream+0x604/0x920 [snd_pcm]
> >    snd_pcm_open+0xeb/0x220 [snd_pcm]
> >    snd_pcm_playback_open+0x39/0x60 [snd_pcm]
> >    chrdev_open+0xbf/0x230
> >    vfs_open+0x3f8/0x520
> >    path_openat+0x4f4/0xc50
> >    do_file_open+0xd7/0x150
> >    do_syscall_64+0x8f/0x380
> >    entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >    </TASK>
> >
> > The kernel is  linux-cachyos 7.3 (taint O is from the NVIDIA module);
> > CachyOS does not patch the tas2781 driver, and its LTS, 6.18.55
> > works. If it is needed, I can test patches.
> >
> > #regzbot introduced: 408249089c48
> >
> > Thank you,
> > Cristian Castellano
>
