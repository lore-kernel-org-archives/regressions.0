Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793699087;
	b=XGaf3lbeKuXNh5jnLip7ayN81d/13V9IC2KSL7YUrOR8K4D8hj55SqojOpPr5LGw6Aej
	 9jlqzFhpSZvS/YyhbhUVNAv2Pk9Et1c7jmpSXCvb4Nuc2n28d2GmCpnPplIfhnl8HuaiV
	 0XG+KPW5uajz1LTaQf6V3LzZEWexBoNJEXxYn2XUJPN4mpNefmi/2tDJ8/GrKJAyYFVH7
	 beft56vhqpUJPNRqWqlTxNFVVXxZO9HRcE9cSyPBzSxpxG3EzHi7Jg7S97omQB+WDwrEm
	 V320s9sm3QO7Wkx45vLpDn2lK4p/T5sy9thtBy4Z7xLIf5a2mPurR5H0SOcWQ7Fz16g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/J9BnLRGC8uxOFLsZCgp0LPx3pkvhWp1geAJQFcvRlg=;
	b=hZvn3JjyRNRgQoiu1NG4YAfbiIZzqO8bHdGuuZAS7CRt/iJuEhay/AenF04tt9yaF00D
	 0AxD5k/twJHbkyuMVULfzhVEhnFvpO4ze3ajwt5h7FWawUJaNFQMyOvrBq3Z8ZZ0aNFeI
	 kAv9ur7lCRzGNzc1+g6vIdKS3LTpjquLT/11fpcV4RxchTuPRQarEwdD1G7nsF1ZI8Eno
	 SDyDhj8OoZ9GoK593Wd2y5ofU5UomOGbPEbTLY8DwVGo4nGFyHgQJTDmcEg68zRjV7AuL
	 uC+w/5X8UjHahM/mkddJGwdDNH634b0XH1cb1KtQoG+lkDb8JuI4ArT/h+OwW60bYUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qrRXM+QU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F02606A327
	for <regressions@lists.linux.dev>; Tue,  3 Nov 2026 09:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7F02606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qrRXM+QU
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso27657205e9.2
        for <regressions@lists.linux.dev>; Tue, 03 Nov 2026 01:44:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793699085; cv=none;
        d=google.com; s=arc-20260327;
        b=cs+EaaUqagvVsG9AaUIYGt3BcJsMi8tL6Azt8TchfsZ2Pobtzhy04EfDDMoBGtJtfe
         zwsEG6QoHLtVux5PFSSYtTVidYsHcb8CS3QaNG2YS+79eOuEVCx2JPblVohkWJrT60Pg
         S0LiaWXzS8nGM/GRAdZfj31i4uyY+s7wo+/i14Or2x+hgLlr/pyfSIfAji5/ZuQ7JUDT
         3VnpMgTwq0gBkAKGU0lqFIUg0xxqAkncW3zpgkLBIkn+XFSWO+ZL6wIvJPPaHoPVPRkQ
         wIazbyVJn2MRiMzEEDS0T3sp+D7EHHG3Ywx3Kz1N5+5XtndA6RziGNg6ix2Be0KNiUcF
         QHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/J9BnLRGC8uxOFLsZCgp0LPx3pkvhWp1geAJQFcvRlg=;
        fh=EPjbemrJkkoR/pjoCow6IPpq+oSI2a5PbNrBTVL7DA0=;
        b=Do8Q7PBh3Qjp3dnL5pJbag5ynqubYbIkeXikZx0WO9Pjrq2HDxMqGGR2QV4f9fzG03
         IdK5iPWWHiewhfY2SKtEoRGTi7Q/00s3t235Avpmnm/Z0iDbMOPf5zBEZ80wIaBmrrn7
         pMMuXI4VNir8dVIFebtIoWVKDqIWX1u4ep8Njhk2ccHVWf/LZACnkfmsC90e/dpPnT6Y
         hz7uBaZ/x2cUZMVecDvuy4A1Bd8oYtybrUyLYHrYT93Pl/iiX5g7Rv1ryM4NUfb3cdMj
         5ev61nB/y6OXjYYEa5IuE31TuxSv1/hBbmYkJvu9X+3I0bvyOV4T8epWD7P5s1609xnS
         yJvQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699085; x=1794303885; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/J9BnLRGC8uxOFLsZCgp0LPx3pkvhWp1geAJQFcvRlg=;
        b=qrRXM+QUjFV4PTAo6Xl76rgCKjeRTSq/zO8jPwtnV74+rxPiFfKgeLXXTUmKQxs0jD
         D0Yc8CE2vUqy++IEPzxmQcEKSwsEk8CJ9oJo2+hINHSlGa+FEu8NXzxESgUoY7Vx/LvF
         lxoL8Mo2Saq70cM2clGBH/ZKIHzmViqj1SMnzOvEM03yGx5XoNOipozTqw2MB4hbwzlU
         7WdmtngcGV84+DVldVt4S8CGJAkI0aWGMZNWry0Tw0e1qa4s6sK0qFTRin3DMGzRcK2L
         kzU/yvdOXd5RVx8YfTuUlYN/QwPsXOxC/5qmYkojSRx5eEkrqNYvW9K3uGNN+4rUMVpd
         vGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699085; x=1794303885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/J9BnLRGC8uxOFLsZCgp0LPx3pkvhWp1geAJQFcvRlg=;
        b=s8/fvbDAYjftNMKg3TYVdOiBZSb2WJS1q9cWiBfNflXF9fGXTa89WLUDlO7Dt+tK3F
         xkBUDRYIRmo8Vf0gUfUQW5YMIk/LIOl4Ky0psym6cFHjtMf2/+el6tr5HSEA7QcVptGw
         AGPQa9NQfOfnQwcLnB8ZNEIIiziTRvs6PJ6Kx8EnTImoVlq9nwSXjrlfXQx8a++G4nxh
         PM2DEf0OpYJJQwXwS745/Ov6uN+yJPXmEzlXl0VtgAqOygOVey+nY2v+hvUwkZSqaAfJ
         kDopXymNIegtBY9nATpNKZoRaQA8aeYURvGEG36CKBNhqJjO01lDw6r6BJejr4ZqaLOp
         b3hQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9hqZMNP+gYIdxxSnEbmrsS8qjuuAWvyatPVfo/5yRWYV18HdHGWxoeq6hEpKhTUVfz+Air6Jw4Ac+bw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/7bxqoiVCIB+z3/jZf/cjuHjzQL8i6n6VMYFUPsqyXtHigUU5z
	33NCPgwmfIjY7m+3F7Q0+SM80YF+gYbwEOTXHPZvNUZH5PuVm6nDNRyemdsyXKRcFYvWDA1Beu6
	gSqAIzpl2CrKZY9xoy5NfnyTNK7mEi8O0wy1x4h0=
X-Gm-Gg: AYBFou1P1Qf44uzW9mxtNuYrI2+qJ/PbeyS7wHW8CCYjxFcSeb3ernuurr0aSBODWs6
	1P1QPRfTArPHbOOy18biAVrdzxT2dMJ/FKdJsRhNzMaZdoccmuNd1MDV17NMjNGBDO5oGWbun/W
	tT2jfsQMLSalcY5eWErKAl6S1YqO540BkYCy2qRPWmmrl3hCtkfJISELMa7ZmUd3n+indkrTzJS
	RZxjqpYlUdHJIrGDjjKE+6krTuL5Hy+0m3SG7hIipCjJcgOUBm0W/ENFEKtvbamdtBphtPc7c0V
	g9sG4GlAYMfNAKs2QNI2JflR6JT2k//UUL4UxE8dYTO5RPbnP5ciBkoKJiYvMLAoy0q0tdDeQZD
	CazOk8gTZC0IFASuYn4HG0VPTJGziHnSKQyJtKw79rm444LmsLFdQs5QKYU5JjRUq9UM40Q==
X-Received: by 2002:a05:600c:5246:b0:4a1:f377:5c6c with SMTP id
 5b1f17b1804b1-4ac16acfe48mr291991475e9.10.1793699084886; Tue, 03 Nov 2026
 01:44:44 -0800 (PST)
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
Date: Tue, 3 Nov 2026 10:44:32 +0100
X-Gm-Features: AclHuK9LrOPRysXH3dwqwQb4TVsSxZhcptimLlVHKzJ2_9mQk8sFNwCloZqoTrE
Message-ID: <CAN6p6ihUEgoPLs-Xtg0Rwntoxzp-_9_99Aj7_R_M2PL0Vn7U1w@mail.gmail.com>
Subject: Re: [REGRESSION] ALSA: hda/tas2781: divide error on playback open
 after accepting V1 calibration data without CRC (Lenovo Yoga Pro 9 16IRP8)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: tiwai@suse.de, linux-sound@vger.kernel.org, 
	Cristian Castellano <cristian.castellano@icloud.com>, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cristian, Thorsten, Takashi,

Sorry for the breakage, and thanks for the detailed report.

The two populated entries in the dump are valid (R0 =3D 3.64/3.65 ohm,
1/R0 consistent), so I suspect p->ndev is larger than 2 on this
machine: the V1 loop then converts all-zero entries for the remaining
devices, and tas2781_cali_preproc() divides by re_cal =3D=3D 0. My patch
only checked the first entry, which was not enough.

Fix posted here, Cristian please give it a try:
https://lore.kernel.org/all/4e500063-d985-46b6-a0a1-3feaa77c4b2f@leemhuis.i=
nfo/

Takashi's re_cal check looks like a good additional safeguard.

Thanks,
Mohamed Yassine JEBABLI
Tel : +33 77 38 91 074
Boulogne Billancourt - PARIS

Mohamed Yassine JEBABLI
Tel : +33 77 38 91 074
Boulogne Billancourt - PARIS



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
