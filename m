Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6B6291C3F
	for <regressions@lists.linux.dev>; Wed, 28 Jan 2026 20:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769631453; cv=pass; b=nAC4WaDxtOX9OHR3GygdFSWIXkTYB4eRP6ShthXjMmkrwQmjy+jZxqscEwU2tEgOrUvnUD1Iu4MsdX5I/SjugcJ4aOCuI7EtSe1vu2WXEKQsVKJxRC0AwUrvx6qsAp2yS6WI9B31NBKnV+mYSFLIZxim09Qois8/qDPMlBHw0zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769631453; c=relaxed/simple;
	bh=pS7OpUIY8Lwj0bj3asRJKuDnEuSegT1ycrOVcMYxpJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=blCJAd5eVdlGkrq0mAXTQmUppsnyDPn9nvfyENqhtATg3Xfe2htE3mGtBEMbU5AjXsIXKn/0DJ0FbvAGCBToYfGI1DMDWSAv+bCKRRE4HaVYk4ENj7eSWgmTMmXMN4Pu8WweWECOYR1/6YRRoV7o2PuxEDRFKM0nswG6bRiY1bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enPIBkbY; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enPIBkbY"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-124a946a340so20197c88.3
        for <regressions@lists.linux.dev>; Wed, 28 Jan 2026 12:17:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769631450; cv=none;
        d=google.com; s=arc-20240605;
        b=ALXTdvD/fVDqV/J73kzn5JvYegomyunbOeq0CDLP9in57phUMGUNL9HDraQOaOljNn
         t8JobRCPJDRQLA2eks8br19xurutsJJgGksX7yBWVOYBGhU0E29VkDtUrDnhycdnfEmT
         1k2UDFpGB8SXTZKeb70J++2ltu1orO+RktIifcgj/8w30zeH4qvsoSrVHpQN2SzPkysR
         9asJDoMBEW4Y5vALLdoFOub5Uv+DqmSGT3kmIIvfi2bxNQgkgSPvVklDehSnKUxes61E
         MOSVtim49M4hmx9VImtxIR9pRZtKWb6WVR6xt7/BjbD7TbHwtjHC9mZorQDjlCRYdm1A
         LlTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xrGQay6nsSQPdFOjcgmMh48gL9qeXglFQ391llRMDBM=;
        fh=kcEAFN9sb1BBJOy9IcA8bMJcx0FOX8RUffaila/T+xU=;
        b=RTnkNDyJG0FrVAvJWCjAtSoiVdadAdXSCLKoIsaELD5UE3FAUg9LIxyTwMknP91GJQ
         fX+kJG5ZlP5EOCtgzH5GkB0rflsKPKEGq2znxbvja3ZoWCjrFPDHk1SIEA8DtLjcw03L
         WEH8JlD7dtz4mIIR6Ul8alPdX5p4elzClIWqjvdw5WCcZgKK8B8FhFKvygLO/vFmrKMR
         OE5lsdEYWEp3Sd0jmpwpUoMiO2Uq6g16rqmps93peDhMj9TkUv+nV9Pcwej3tsyps81P
         j4vHIUMnXyXr0FPv5YoDGTy1GICt/Imxh8FePFwWPGBIULr3vDEcQhD8bAsE9XoKnkA5
         aU3A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769631450; x=1770236250; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrGQay6nsSQPdFOjcgmMh48gL9qeXglFQ391llRMDBM=;
        b=enPIBkbY8k46DIIDh77/69nkh3O++GG8DEQ1fWukcLSYLH/vJ22uXYvHpGHQ81imx9
         Ua0pi90zYaZZ7fXUY4MW4M/2/QIA3K5wPiwO96TWTOf10ozFXmFRHMni2keAJSLucHH5
         UWukHP2ve/ZlR0mgPHjO3+SO5ZbR47i2xtbHW9VIfag0sF1yRms5tjm5zJh1f2beUlXI
         8vRGRY/jNfZr6hF47dF/ERMASf4G0gd3YChySll4h8UdcZDfAFfmltsh7+UDGU9olnx0
         T/SUjB+NlVY5p06ssiL1GrcD/wJlPPqqmJ/s4S157st7aCP5btAjBmYlkrgYp7tuF11r
         4TGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769631450; x=1770236250;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xrGQay6nsSQPdFOjcgmMh48gL9qeXglFQ391llRMDBM=;
        b=o57mZEyuD+fSu96UTEVmeBYqY1J+vbP8iV2WmD1rj4vtBiDbJKmLu5BDRSNwxgevvw
         iQB5ZQlD8qtwJxl9lhLxzsOfUUxD8iUP7FsCOJJHEkcSIwI8W0+ua/zcd2VJDz938xKD
         UfNK8yn94SgSQqcGc6FojBK0+saQvEf4Kue+lOfM0rIZXI1YJ4MrrEi70lornKgwAAfp
         OqWK+D9Dn/h2PEKbE0+1+xxvm2TtmyNeiaOL1CkJJu/5ngRr/3Ji90cEg8SqTUNprLQI
         B+Hf9hCzVFfhYeg0bY54JGb7Sq8s61j0VI+HvLqgjENZV6KLFeOrnVQrSf+WdBXi4Ofr
         vWKg==
X-Forwarded-Encrypted: i=1; AJvYcCVFt4e4t6mlfdoFz9za8xCMvUMsmavVfQEybHaflt1P5yZAOhLTRQSe7H1DTCr1S9jPoEt9lZW4XcVPdw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+1eIg2ZT2+U4/Gsa55Dy0bCy0Uva24Yux2luzeDD8xXePs5/B
	crYerTSYvKLkvjPzdAwkznYBDFN7Zmu+oFq64EUKSR8eIQid87dvIDqci1kf8kH2WrBqqN98Qbk
	tGaxFtYSmbuDrC7D2KOCo8tSdsvPQC4A=
X-Gm-Gg: AZuq6aLkzD/U2A4PzkM3gJAPYIeV14QyqkHVU01pcJtpg4r+w+KMP3miot6T1+pAV0c
	odEigZkWhxN6CGkcFEaHqDXCH7m0jm9qWarQYQNt+bvix5/U0Y8LPTSrS5MOQt21zv+xmFcfydw
	45Y7qfrDUb2/Xw7LAi+H64ytDl6xdLbcVEK412o6O7P9LkP+RQsc4zQ31/rzN+5tBWMtrMIAMM/
	n2ItBFyju/NXXNyhojF1rSW+31GU+/z4cmtkk34CZL9DBT84jfYqz1JtYKfkacne/MqZz/R
X-Received: by 2002:a05:7300:3206:b0:2ae:5bd5:c241 with SMTP id
 5a478bee46e88-2b7af7b8fc9mr393364eec.7.1769631449880; Wed, 28 Jan 2026
 12:17:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aXptBPF3L07zJB1O@earendel>
In-Reply-To: <aXptBPF3L07zJB1O@earendel>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 28 Jan 2026 15:17:18 -0500
X-Gm-Features: AZwV_QjMUVEUN8BSFXcLOXLYeS1GVfA8tYWmapthDqOo4Luz7ATJ6Hkmj2w_OO0
Message-ID: <CADnq5_OqFEi_ML9zR-i_WFtFmBBQQcbQNRAiP8pVdD+prvEoiQ@mail.gmail.com>
Subject: Re: [REGRESSION] drm/amd/display: Add an hdmi_hpd_debounce_delay_ms module
To: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Ivan Lipski <ivan.lipski@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, "Mario Limonciello (AMD)" <superm1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 3:09=E2=80=AFPM Peter Colberg <pcolberg@redhat.com>=
 wrote:
>
> Hi,
>
> I hit a regression introduced as part of v6.19-rc6 (and still present
> in v6.19-rc7), where, upon unloading the amdgpu module, __flush_work()
> is passed a work struct with the work function set to NULL. The issue
> is seen with an AMD Radeon Pro W7900, but not an AMD Instinct MI210.

I think this should be fixed in:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/17b2c526fd8026d8e0f4c0e=
7f94fc517e3901589

Alex

>
> #regzbot introduced: d04f73668bebbc5a44a2771ea92b6ec253148050
>
>     4231 static bool __flush_work(struct work_struct *work, bool from_can=
cel)
>     4232 {
>     4233         struct wq_barrier barr;
>     4234
>     4235         if (WARN_ON(!wq_online))
>     4236                 return false;
>     4237
> --> 4238         if (WARN_ON(!work->func))
>     4239                 return false;
>
> Tests were carried out on an AMD Radeon Pro W7900 with a mainline
> kernel compiled and booted with an up-to-date CentOS Stream 10 x86_64
> and amdgpu firmware commit 993573ac3dc6ab038505c2639701db22f6142487.
>
> % cp /lib/modules/6.12.0-191.el10.x86_64/config .config
> % scripts/config --enable LOCALVERSION_AUTO
> % scripts/config --disable EFI_SBAT_FILE
> % scripts/config --disable SECURITY_LOCKDOWN_LSM
> % scripts/config --disable MODULE_SIG
> % make olddefconfig
> % make -j $(nproc) binrpm-pkg
>
> The first test exercises commit d04f73668beb which introduced the
> regression, the second test b2426a211dba prior to the regression.
>
> # dmesg --follow-new &
> # cat /proc/cmdline
> BOOT_IMAGE=3D(hd0,gpt2)/boot/ostree/default-8a8985bdb88376ac62c94e787be00=
dea13130a3b5e56e8598bd96b4cf7eaac4c/vmlinuz-6.19.0-rc5-00016-gd04f73668beb =
root=3D/dev/mapper/rhel-root rd.lvm.lv=3Drhel/root rd.lvm.lv=3Drhel/swap rw=
 boot=3DUUID=3D9c458207-c078-4fcf-bb4c-679ae1a3ae9f ostree=3D/ostree/boot.0=
/default/8a8985bdb88376ac62c94e787be00dea13130a3b5e56e8598bd96b4cf7eaac4c/0=
 "dyndbg=3Dfile drivers/base/firmware_loader/main.c +fmp"
> # rmmod amdgpu
> [   77.410012] [drm] PCIE GART of 512M enabled (table at 0x00000080003000=
00).
> [   77.410074] amdgpu 0000:83:00.0: amdgpu: PSP is resuming...
> [   77.473976] amdgpu 0000:83:00.0: amdgpu: reserve 0x1300000 from 0x8b3c=
000000 for PSP TMR
> [   77.617936] amdgpu 0000:83:00.0: amdgpu: GECC is currently enabled, wh=
ich may affect performance
> [   77.617941] amdgpu 0000:83:00.0: amdgpu: To disable GECC, please reboo=
t the system and load the amdgpu driver with the parameter amdgpu_ras_enabl=
e=3D0
> [   77.634803] amdgpu 0000:83:00.0: amdgpu: RAP: optional rap ta ucode is=
 not available
> [   77.634808] amdgpu 0000:83:00.0: amdgpu: SECUREDISPLAY: optional secur=
edisplay ta ucode is not available
> [   77.634813] amdgpu 0000:83:00.0: amdgpu: SMU is resuming...
> [   77.634818] amdgpu 0000:83:00.0: amdgpu: smu driver if version =3D 0x0=
000003d, smu fw if version =3D 0x00000040, smu fw program =3D 0, smu fw ver=
sion =3D 0x004e8300 (78.131.0)
> [   77.634825] amdgpu 0000:83:00.0: amdgpu: SMU driver if version not mat=
ched
> [   77.779854] amdgpu 0000:83:00.0: amdgpu: SMU is resumed successfully!
> [   77.789735] amdgpu 0000:83:00.0: amdgpu: [drm] DMUB hardware initializ=
ed: version=3D0x07002F00
> [   77.795903] amdgpu 0000:83:00.0: [drm] Cannot find any crtc or sizes
> [   77.795913] amdgpu 0000:83:00.0: amdgpu: ring gfx_0.0.0 uses VM inv en=
g 0 on hub 0
> [   77.795917] amdgpu 0000:83:00.0: amdgpu: ring comp_1.0.0 uses VM inv e=
ng 1 on hub 0
> [   77.795921] amdgpu 0000:83:00.0: amdgpu: ring comp_1.1.0 uses VM inv e=
ng 4 on hub 0
> [   77.795924] amdgpu 0000:83:00.0: amdgpu: ring comp_1.2.0 uses VM inv e=
ng 6 on hub 0
> [   77.795927] amdgpu 0000:83:00.0: amdgpu: ring comp_1.3.0 uses VM inv e=
ng 7 on hub 0
> [   77.795930] amdgpu 0000:83:00.0: amdgpu: ring comp_1.0.1 uses VM inv e=
ng 8 on hub 0
> [   77.795933] amdgpu 0000:83:00.0: amdgpu: ring comp_1.1.1 uses VM inv e=
ng 9 on hub 0
> [   77.795937] amdgpu 0000:83:00.0: amdgpu: ring comp_1.2.1 uses VM inv e=
ng 10 on hub 0
> [   77.795940] amdgpu 0000:83:00.0: amdgpu: ring comp_1.3.1 uses VM inv e=
ng 11 on hub 0
> [   77.795943] amdgpu 0000:83:00.0: amdgpu: ring sdma0 uses VM inv eng 12=
 on hub 0
> [   77.795946] amdgpu 0000:83:00.0: amdgpu: ring sdma1 uses VM inv eng 13=
 on hub 0
> [   77.795954] amdgpu 0000:83:00.0: amdgpu: ring vcn_unified_0 uses VM in=
v eng 0 on hub 8
> [   77.795958] amdgpu 0000:83:00.0: amdgpu: ring vcn_unified_1 uses VM in=
v eng 1 on hub 8
> [   77.795961] amdgpu 0000:83:00.0: amdgpu: ring jpeg_dec uses VM inv eng=
 4 on hub 8
> [   77.795965] amdgpu 0000:83:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM in=
v eng 14 on hub 0
> [   77.798920] amdgpu 0000:83:00.0: [drm] Cannot find any crtc or sizes
> [   77.835746] amdgpu 0000:83:00.0: amdgpu: amdgpu: finishing device.
> [   77.934047] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_mes1.bin devm-00000000729a84e2 re=
leased
> [   77.934052] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_mes_2.bin devm-000000008a601096 r=
eleased
> [   77.934054] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/vcn_4_0_0.bin devm-00000000ce1dfe25 release=
d
> [   77.934055] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/sdma_6_0_0.bin devm-00000000f4c59a6f releas=
ed
> [   77.934057] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_imu.bin devm-000000000fe0df50 rel=
eased
> [   77.934059] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_mec.bin devm-000000006b38a3b2 rel=
eased
> [   77.934061] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_rlc.bin devm-000000004a747642 rel=
eased
> [   77.934064] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_me.bin devm-000000002ce74390 rele=
ased
> [   77.934066] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_pfp.bin devm-00000000b0e91c69 rel=
eased
> [   77.934068] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/dcn_3_2_0_dmcub.bin devm-000000000b75c19c r=
eleased
> [   77.934069] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/smu_13_0_0.bin devm-000000001ab5d2f3 releas=
ed
> [   77.934071] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/psp_13_0_0_ta.bin devm-00000000a37398c2 rel=
eased
> [   77.934072] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/psp_13_0_0_sos.bin devm-0000000027208a82 re=
leased
> [   77.934078] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_mes_2.bin fw_priv=3D000000004a41fbe6 data=3D000000=
002a21f503 size=3D257344
> [   77.934090] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_mes1.bin fw_priv=3D000000004f12a566 data=3D0000000=
0c562adda size=3D218240
> [   77.934117] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/vcn_4_0_0.bin fw_priv=3D00000000bf93c3ab data=3D000000003ba7=
47fe size=3D403856
> [   77.934137] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/sdma_6_0_0.bin fw_priv=3D000000006a092a88 data=3D00000000007=
c1a01 size=3D34560
> [   77.934167] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_pfp.bin fw_priv=3D00000000b86bbe6d data=3D00000000=
f13777ad size=3D231008
> [   77.934175] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_me.bin fw_priv=3D00000000493fdf17 data=3D00000000a=
fc5401f size=3D314512
> [   77.934189] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_rlc.bin fw_priv=3D0000000035fafe96 data=3D00000000=
ab68b2da size=3D185376
> [   77.934199] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_mec.bin fw_priv=3D00000000293ce4de data=3D00000000=
0eb1a171 size=3D406528
> [   77.934213] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/dcn_3_2_0_dmcub.bin fw_priv=3D00000000c705cc78 data=3D000000=
00f530b58b size=3D284432
> [   77.934228] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/smu_13_0_0.bin fw_priv=3D00000000c876ab3e data=3D000000003f0=
5626c size=3D292452
> [   77.934238] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/psp_13_0_0_sos.bin fw_priv=3D00000000c877aa90 data=3D0000000=
0f123f702 size=3D268304
> [   77.934249] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/psp_13_0_0_ta.bin fw_priv=3D00000000886845ff data=3D00000000=
466f9c99 size=3D267520
> [   77.934639] amdgpu 0000:83:00.0: amdgpu: amdgpu: ttm finalized
> [   77.935587] ------------[ cut here ]------------
> [   77.935592] WARNING: kernel/workqueue.c:4238 at __flush_work+0x338/0x3=
50, CPU#31: kworker/31:0/207
> [   77.935603] Modules linked in: snd_hda_codec_alc662 snd_hda_codec_real=
tek_lib snd_hda_codec_generic amdgpu(-) snd_hda_codec_atihdmi snd_hda_codec=
_hdmi mt7921e amdxcp drm_panel_backlight_quirks mt7921_common snd_hda_intel=
 drm_ttm_helper mt792x_lib snd_usb_audio amd_atl intel_rapl_msr ttm snd_hda=
_codec mt76_connac_lib snd_usbmidi_lib intel_rapl_common i2c_algo_bit snd_u=
mp drm_suballoc_helper snd_hda_core mt76 snd_rawmidi amd64_edac gpu_sched s=
nd_intel_dspcfg edac_mce_amd snd_intel_sdw_acpi btusb drm_exec mc snd_hwdep=
 btrtl drm_buddy snd_seq btintel drm_display_helper btbcm mac80211 snd_seq_=
device kvm_amd btmtk cec think_lmi kvm video snd_pcm irqbypass firmware_att=
ributes_class wmi_bmof bluetooth rapl cfg80211 snd_timer pcspkr crc16 snd i=
2c_piix4 rfkill k10temp soundcore i2c_smbus libarc4 gpio_amdpt gpio_generic=
 i2c_designware_platform i2c_designware_core loop overlay erofs xfs nvme_tc=
p nvme_fabrics nvme nvme_core nvme_keyring ahci nvme_auth libahci ghash_clm=
ulni_intel hkdf r8169 atlantic ccp libata sp5100_tco realtek
> [   77.935687]  macsec wmi sunrpc dm_mirror dm_region_hash dm_log dm_mod =
fuse nfnetlink
> [   77.935731] CPU: 31 UID: 0 PID: 207 Comm: kworker/31:0 Not tainted 6.1=
9.0-rc5-00016-gd04f73668beb #1 PREEMPT(voluntary)
> [   77.935744] Workqueue: events drm_connector_free_work_fn
> [   77.935751] RIP: 0010:__flush_work+0x338/0x350
> [   77.935756] Code: 3e 46 06 00 65 48 8b 15 2e e4 e3 02 48 85 db 48 8b 0=
4 24 48 89 54 24 48 0f 85 e6 fe ff ff e9 fe fd ff ff 0f 0b e9 77 ff ff ff <=
0f> 0b e9 70 ff ff ff 0f 0b e9 19 ff ff ff e8 15 22 d9 00 0f 1f 44
> [   77.935765] RSP: 0018:ff57cb59c0b7bd68 EFLAGS: 00010246
> [   77.935770] RAX: 0000000000000000 RBX: ff2d8e14daf8d480 RCX: 000000000=
0000000
> [   77.935775] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ff57cb59c=
0b7bdb8
> [   77.935779] RBP: ff2d8e14daf8d480 R08: ff2d8e14a1a86420 R09: 000000000=
02a001f
> [   77.935783] R10: ff2d8e14a1a86401 R11: ff2d8e14a1a86f60 R12: ff2d8e159=
2180010
> [   77.935788] R13: ff57cb59c0b7bd70 R14: 0000000000000001 R15: 000000000=
0000000
> [   77.935792] FS:  0000000000000000(0000) GS:ff2d8e3396243000(0000) knlG=
S:0000000000000000
> [   77.935797] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   77.935801] CR2: 000055f1cff22050 CR3: 0000000112666002 CR4: 000000000=
0f71ef0
> [   77.935806] PKRU: 55555554
> [   77.935809] Call Trace:
> [   77.935812]  <TASK>
> [   77.935818]  cancel_delayed_work_sync+0x5e/0x80
> [   77.935823]  amdgpu_dm_connector_destroy+0x33/0xe0 [amdgpu]
> [   77.936146]  drm_connector_free_work_fn+0x72/0x90
> [   77.936152]  process_one_work+0x18b/0x340
> [   77.936157]  worker_thread+0x256/0x3a0
> [   77.936162]  ? __pfx_worker_thread+0x10/0x10
> [   77.936166]  kthread+0xfc/0x240
> [   77.936171]  ? __pfx_kthread+0x10/0x10
> [   77.936175]  ? __pfx_kthread+0x10/0x10
> [   77.936180]  ret_from_fork+0x121/0x190
> [   77.936186]  ? __pfx_kthread+0x10/0x10
> [   77.936190]  ret_from_fork_asm+0x1a/0x30
> [   77.936198]  </TASK>
> [   77.936201] ---[ end trace 0000000000000000 ]---
> [   77.936210] ------------[ cut here ]------------
> [   77.936214] WARNING: kernel/workqueue.c:4238 at __flush_work+0x338/0x3=
50, CPU#31: kworker/31:0/207
> [   77.936221] Modules linked in: snd_hda_codec_alc662 snd_hda_codec_real=
tek_lib snd_hda_codec_generic amdgpu(-) snd_hda_codec_atihdmi snd_hda_codec=
_hdmi mt7921e amdxcp drm_panel_backlight_quirks mt7921_common snd_hda_intel=
 drm_ttm_helper mt792x_lib snd_usb_audio amd_atl intel_rapl_msr ttm snd_hda=
_codec mt76_connac_lib snd_usbmidi_lib intel_rapl_common i2c_algo_bit snd_u=
mp drm_suballoc_helper snd_hda_core mt76 snd_rawmidi amd64_edac gpu_sched s=
nd_intel_dspcfg edac_mce_amd snd_intel_sdw_acpi btusb drm_exec mc snd_hwdep=
 btrtl drm_buddy snd_seq btintel drm_display_helper btbcm mac80211 snd_seq_=
device kvm_amd btmtk cec think_lmi kvm video snd_pcm irqbypass firmware_att=
ributes_class wmi_bmof bluetooth rapl cfg80211 snd_timer pcspkr crc16 snd i=
2c_piix4 rfkill k10temp soundcore i2c_smbus libarc4 gpio_amdpt gpio_generic=
 i2c_designware_platform i2c_designware_core loop overlay erofs xfs nvme_tc=
p nvme_fabrics nvme nvme_core nvme_keyring ahci nvme_auth libahci ghash_clm=
ulni_intel hkdf r8169 atlantic ccp libata sp5100_tco realtek
> [   77.936292]  macsec wmi sunrpc dm_mirror dm_region_hash dm_log dm_mod =
fuse nfnetlink
> [   77.936331] CPU: 31 UID: 0 PID: 207 Comm: kworker/31:0 Tainted: G     =
   W           6.19.0-rc5-00016-gd04f73668beb #1 PREEMPT(voluntary)
> [   77.936337] Tainted: [W]=3DWARN
> [   77.936342] Workqueue: events drm_connector_free_work_fn
> [   77.936346] RIP: 0010:__flush_work+0x338/0x350
> [   77.936350] Code: 3e 46 06 00 65 48 8b 15 2e e4 e3 02 48 85 db 48 8b 0=
4 24 48 89 54 24 48 0f 85 e6 fe ff ff e9 fe fd ff ff 0f 0b e9 77 ff ff ff <=
0f> 0b e9 70 ff ff ff 0f 0b e9 19 ff ff ff e8 15 22 d9 00 0f 1f 44
> [   77.936357] RSP: 0018:ff57cb59c0b7bd68 EFLAGS: 00010246
> [   77.936360] RAX: 0000000000000000 RBX: ff2d8e1492153480 RCX: 000000000=
0000000
> [   77.936363] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ff57cb59c=
0b7bdb8
> [   77.936366] RBP: ff2d8e1492153480 R08: ff2d8e14a1a861e0 R09: 000000000=
02a001e
> [   77.936369] R10: ff2d8e14a1a86101 R11: ff2d8e14a1a86420 R12: ff2d8e159=
2180010
> [   77.936373] R13: ff57cb59c0b7bd70 R14: 0000000000000001 R15: 000000000=
0000000
> [   77.936376] FS:  0000000000000000(0000) GS:ff2d8e3396243000(0000) knlG=
S:0000000000000000
> [   77.936379] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   77.936382] CR2: 000055f1cff22050 CR3: 0000000112666002 CR4: 000000000=
0f71ef0
> [   77.936386] PKRU: 55555554
> [   77.936388] Call Trace:
> [   77.936390]  <TASK>
> [   77.936393]  cancel_delayed_work_sync+0x5e/0x80
> [   77.936397]  amdgpu_dm_connector_destroy+0x33/0xe0 [amdgpu]
> [   77.936613]  drm_connector_free_work_fn+0x72/0x90
> [   77.936617]  process_one_work+0x18b/0x340
> [   77.936621]  worker_thread+0x256/0x3a0
> [   77.936624]  ? __pfx_worker_thread+0x10/0x10
> [   77.936627]  kthread+0xfc/0x240
> [   77.936630]  ? __pfx_kthread+0x10/0x10
> [   77.936634]  ? __pfx_kthread+0x10/0x10
> [   77.936637]  ret_from_fork+0x121/0x190
> [   77.936640]  ? __pfx_kthread+0x10/0x10
> [   77.936643]  ret_from_fork_asm+0x1a/0x30
> [   77.936649]  </TASK>
> [   77.936651] ---[ end trace 0000000000000000 ]---
> [   77.936658] ------------[ cut here ]------------
> [   77.936661] WARNING: kernel/workqueue.c:4238 at __flush_work+0x338/0x3=
50, CPU#31: kworker/31:0/207
> [   77.936666] Modules linked in: snd_hda_codec_alc662 snd_hda_codec_real=
tek_lib snd_hda_codec_generic amdgpu(-) snd_hda_codec_atihdmi snd_hda_codec=
_hdmi mt7921e amdxcp drm_panel_backlight_quirks mt7921_common snd_hda_intel=
 drm_ttm_helper mt792x_lib snd_usb_audio amd_atl intel_rapl_msr ttm snd_hda=
_codec mt76_connac_lib snd_usbmidi_lib intel_rapl_common i2c_algo_bit snd_u=
mp drm_suballoc_helper snd_hda_core mt76 snd_rawmidi amd64_edac gpu_sched s=
nd_intel_dspcfg edac_mce_amd snd_intel_sdw_acpi btusb drm_exec mc snd_hwdep=
 btrtl drm_buddy snd_seq btintel drm_display_helper btbcm mac80211 snd_seq_=
device kvm_amd btmtk cec think_lmi kvm video snd_pcm irqbypass firmware_att=
ributes_class wmi_bmof bluetooth rapl cfg80211 snd_timer pcspkr crc16 snd i=
2c_piix4 rfkill k10temp soundcore i2c_smbus libarc4 gpio_amdpt gpio_generic=
 i2c_designware_platform i2c_designware_core loop overlay erofs xfs nvme_tc=
p nvme_fabrics nvme nvme_core nvme_keyring ahci nvme_auth libahci ghash_clm=
ulni_intel hkdf r8169 atlantic ccp libata sp5100_tco realtek
> [   77.936718]  macsec wmi sunrpc dm_mirror dm_region_hash dm_log dm_mod =
fuse nfnetlink
> [   77.936751] CPU: 31 UID: 0 PID: 207 Comm: kworker/31:0 Tainted: G     =
   W           6.19.0-rc5-00016-gd04f73668beb #1 PREEMPT(voluntary)
> [   77.936757] Tainted: [W]=3DWARN
> [   77.936762] Workqueue: events drm_connector_free_work_fn
> [   77.936766] RIP: 0010:__flush_work+0x338/0x350
> [   77.936769] Code: 3e 46 06 00 65 48 8b 15 2e e4 e3 02 48 85 db 48 8b 0=
4 24 48 89 54 24 48 0f 85 e6 fe ff ff e9 fe fd ff ff 0f 0b e9 77 ff ff ff <=
0f> 0b e9 70 ff ff ff 0f 0b e9 19 ff ff ff e8 15 22 d9 00 0f 1f 44
> [   77.936776] RSP: 0018:ff57cb59c0b7bd68 EFLAGS: 00010246
> [   77.936779] RAX: 0000000000000000 RBX: ff2d8e1492151480 RCX: 000000000=
0000000
> [   77.936782] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ff57cb59c=
0b7bdb8
> [   77.936785] RBP: ff2d8e1492151480 R08: ff2d8e14a1a860c0 R09: 000000000=
02a001d
> [   77.936788] R10: ff2d8e14a1a86001 R11: ff2d8e14a1a861e0 R12: ff2d8e159=
2180010
> [   77.936791] R13: ff57cb59c0b7bd70 R14: 0000000000000001 R15: 000000000=
0000000
> [   77.936795] FS:  0000000000000000(0000) GS:ff2d8e3396243000(0000) knlG=
S:0000000000000000
> [   77.936798] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   77.936801] CR2: 000055f1cff22050 CR3: 0000000112666002 CR4: 000000000=
0f71ef0
> [   77.936804] PKRU: 55555554
> [   77.936806] Call Trace:
> [   77.936808]  <TASK>
> [   77.936812]  cancel_delayed_work_sync+0x5e/0x80
> [   77.936815]  amdgpu_dm_connector_destroy+0x33/0xe0 [amdgpu]
> [   77.937015]  drm_connector_free_work_fn+0x72/0x90
> [   77.937020]  process_one_work+0x18b/0x340
> [   77.937025]  worker_thread+0x256/0x3a0
> [   77.937029]  ? __pfx_worker_thread+0x10/0x10
> [   77.937034]  kthread+0xfc/0x240
> [   77.937038]  ? __pfx_kthread+0x10/0x10
> [   77.937042]  ? __pfx_kthread+0x10/0x10
> [   77.937047]  ret_from_fork+0x121/0x190
> [   77.937051]  ? __pfx_kthread+0x10/0x10
> [   77.937056]  ret_from_fork_asm+0x1a/0x30
> [   77.937063]  </TASK>
> [   77.937065] ---[ end trace 0000000000000000 ]---
> [   77.937074] ------------[ cut here ]------------
> [   77.937077] WARNING: kernel/workqueue.c:4238 at __flush_work+0x338/0x3=
50, CPU#31: kworker/31:0/207
> [   77.937084] Modules linked in: snd_hda_codec_alc662 snd_hda_codec_real=
tek_lib snd_hda_codec_generic amdgpu(-) snd_hda_codec_atihdmi snd_hda_codec=
_hdmi mt7921e amdxcp drm_panel_backlight_quirks mt7921_common snd_hda_intel=
 drm_ttm_helper mt792x_lib snd_usb_audio amd_atl intel_rapl_msr ttm snd_hda=
_codec mt76_connac_lib snd_usbmidi_lib intel_rapl_common i2c_algo_bit snd_u=
mp drm_suballoc_helper snd_hda_core mt76 snd_rawmidi amd64_edac gpu_sched s=
nd_intel_dspcfg edac_mce_amd snd_intel_sdw_acpi btusb drm_exec mc snd_hwdep=
 btrtl drm_buddy snd_seq btintel drm_display_helper btbcm mac80211 snd_seq_=
device kvm_amd btmtk cec think_lmi kvm video snd_pcm irqbypass firmware_att=
ributes_class wmi_bmof bluetooth rapl cfg80211 snd_timer pcspkr crc16 snd i=
2c_piix4 rfkill k10temp soundcore i2c_smbus libarc4 gpio_amdpt gpio_generic=
 i2c_designware_platform i2c_designware_core loop overlay erofs xfs nvme_tc=
p nvme_fabrics nvme nvme_core nvme_keyring ahci nvme_auth libahci ghash_clm=
ulni_intel hkdf r8169 atlantic ccp libata sp5100_tco realtek
> [   77.937154]  macsec wmi sunrpc dm_mirror dm_region_hash dm_log dm_mod =
fuse nfnetlink
> [   77.937197] CPU: 31 UID: 0 PID: 207 Comm: kworker/31:0 Tainted: G     =
   W           6.19.0-rc5-00016-gd04f73668beb #1 PREEMPT(voluntary)
> [   77.937204] Tainted: [W]=3DWARN
> [   77.937211] Workqueue: events drm_connector_free_work_fn
> [   77.937216] RIP: 0010:__flush_work+0x338/0x350
> [   77.937221] Code: 3e 46 06 00 65 48 8b 15 2e e4 e3 02 48 85 db 48 8b 0=
4 24 48 89 54 24 48 0f 85 e6 fe ff ff e9 fe fd ff ff 0f 0b e9 77 ff ff ff <=
0f> 0b e9 70 ff ff ff 0f 0b e9 19 ff ff ff e8 15 22 d9 00 0f 1f 44
> [   77.937229] RSP: 0018:ff57cb59c0b7bd68 EFLAGS: 00010246
> [   77.937234] RAX: 0000000000000000 RBX: ff2d8e1492155480 RCX: 000000000=
0000000
> [   77.937238] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ff57cb59c=
0b7bdb8
> [   77.937242] RBP: ff2d8e1492155480 R08: ff2d8e14836abf00 R09: 000000000=
02a0026
> [   77.937246] R10: ff2d8e14836abf01 R11: ff2d8e14836abcc0 R12: ff2d8e159=
2180010
> [   77.937251] R13: ff57cb59c0b7bd70 R14: 0000000000000001 R15: 000000000=
0000000
> [   77.937255] FS:  0000000000000000(0000) GS:ff2d8e3396243000(0000) knlG=
S:0000000000000000
> [   77.937260] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   77.937264] CR2: 000055f1cff22050 CR3: 0000000112666002 CR4: 000000000=
0f71ef0
> [   77.937268] PKRU: 55555554
> [   77.937271] Call Trace:
> [   77.937274]  <TASK>
> [   77.937278]  cancel_delayed_work_sync+0x5e/0x80
> [   77.937283]  amdgpu_dm_connector_destroy+0x33/0xe0 [amdgpu]
> [   77.937467]  drm_connector_free_work_fn+0x72/0x90
> [   77.937471]  process_one_work+0x18b/0x340
> [   77.937475]  worker_thread+0x256/0x3a0
> [   77.937478]  ? __pfx_worker_thread+0x10/0x10
> [   77.937481]  kthread+0xfc/0x240
> [   77.937484]  ? __pfx_kthread+0x10/0x10
> [   77.937488]  ? __pfx_kthread+0x10/0x10
> [   77.937491]  ret_from_fork+0x121/0x190
> [   77.937494]  ? __pfx_kthread+0x10/0x10
> [   77.937498]  ret_from_fork_asm+0x1a/0x30
> [   77.937503]  </TASK>
> [   77.937505] ---[ end trace 0000000000000000 ]---
>
> # dmesg --follow-new &
> # cat /proc/cmdline
> BOOT_IMAGE=3D(hd0,gpt2)/boot/ostree/default-4d1352b3a0c9141bf3b54ff6edfc1=
90370f348342e5f6c795641cfd33ee2c88b/vmlinuz-6.19.0-rc5-00015-gb2426a211dba =
root=3D/dev/mapper/rhel-root rd.lvm.lv=3Drhel/root rd.lvm.lv=3Drhel/swap rw=
 boot=3DUUID=3D9c458207-c078-4fcf-bb4c-679ae1a3ae9f ostree=3D/ostree/boot.1=
/default/4d1352b3a0c9141bf3b54ff6edfc190370f348342e5f6c795641cfd33ee2c88b/0=
 "dyndbg=3Dfile drivers/base/firmware_loader/main.c +fmp"
> # rmmod amdgpu
> [  130.326780] [drm] PCIE GART of 512M enabled (table at 0x00000080003000=
00).
> [  130.326830] amdgpu 0000:83:00.0: amdgpu: PSP is resuming...
> [  130.390765] amdgpu 0000:83:00.0: amdgpu: reserve 0x1300000 from 0x8b3c=
000000 for PSP TMR
> [  130.534582] amdgpu 0000:83:00.0: amdgpu: GECC is currently enabled, wh=
ich may affect performance
> [  130.534587] amdgpu 0000:83:00.0: amdgpu: To disable GECC, please reboo=
t the system and load the amdgpu driver with the parameter amdgpu_ras_enabl=
e=3D0
> [  130.551451] amdgpu 0000:83:00.0: amdgpu: RAP: optional rap ta ucode is=
 not available
> [  130.551456] amdgpu 0000:83:00.0: amdgpu: SECUREDISPLAY: optional secur=
edisplay ta ucode is not available
> [  130.551461] amdgpu 0000:83:00.0: amdgpu: SMU is resuming...
> [  130.551466] amdgpu 0000:83:00.0: amdgpu: smu driver if version =3D 0x0=
000003d, smu fw if version =3D 0x00000040, smu fw program =3D 0, smu fw ver=
sion =3D 0x004e8300 (78.131.0)
> [  130.551473] amdgpu 0000:83:00.0: amdgpu: SMU driver if version not mat=
ched
> [  130.695062] amdgpu 0000:83:00.0: amdgpu: SMU is resumed successfully!
> [  130.707036] amdgpu 0000:83:00.0: amdgpu: [drm] DMUB hardware initializ=
ed: version=3D0x07002F00
> [  130.714347] amdgpu 0000:83:00.0: [drm] Cannot find any crtc or sizes
> [  130.714359] amdgpu 0000:83:00.0: amdgpu: ring gfx_0.0.0 uses VM inv en=
g 0 on hub 0
> [  130.714364] amdgpu 0000:83:00.0: amdgpu: ring comp_1.0.0 uses VM inv e=
ng 1 on hub 0
> [  130.714368] amdgpu 0000:83:00.0: amdgpu: ring comp_1.1.0 uses VM inv e=
ng 4 on hub 0
> [  130.714372] amdgpu 0000:83:00.0: amdgpu: ring comp_1.2.0 uses VM inv e=
ng 6 on hub 0
> [  130.714375] amdgpu 0000:83:00.0: amdgpu: ring comp_1.3.0 uses VM inv e=
ng 7 on hub 0
> [  130.714379] amdgpu 0000:83:00.0: amdgpu: ring comp_1.0.1 uses VM inv e=
ng 8 on hub 0
> [  130.714383] amdgpu 0000:83:00.0: amdgpu: ring comp_1.1.1 uses VM inv e=
ng 9 on hub 0
> [  130.714387] amdgpu 0000:83:00.0: amdgpu: ring comp_1.2.1 uses VM inv e=
ng 10 on hub 0
> [  130.714391] amdgpu 0000:83:00.0: amdgpu: ring comp_1.3.1 uses VM inv e=
ng 11 on hub 0
> [  130.714395] amdgpu 0000:83:00.0: amdgpu: ring sdma0 uses VM inv eng 12=
 on hub 0
> [  130.714399] amdgpu 0000:83:00.0: amdgpu: ring sdma1 uses VM inv eng 13=
 on hub 0
> [  130.714403] amdgpu 0000:83:00.0: amdgpu: ring vcn_unified_0 uses VM in=
v eng 0 on hub 8
> [  130.714407] amdgpu 0000:83:00.0: amdgpu: ring vcn_unified_1 uses VM in=
v eng 1 on hub 8
> [  130.714411] amdgpu 0000:83:00.0: amdgpu: ring jpeg_dec uses VM inv eng=
 4 on hub 8
> [  130.714415] amdgpu 0000:83:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM in=
v eng 14 on hub 0
> [  130.717614] amdgpu 0000:83:00.0: [drm] Cannot find any crtc or sizes
> [  130.749867] amdgpu 0000:83:00.0: amdgpu: amdgpu: finishing device.
> [  130.832990] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_mes1.bin devm-0000000074b66149 re=
leased
> [  130.832994] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_mes_2.bin devm-00000000d46d3d0a r=
eleased
> [  130.832995] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/vcn_4_0_0.bin devm-00000000016db898 release=
d
> [  130.832997] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/sdma_6_0_0.bin devm-000000005efee9f4 releas=
ed
> [  130.832998] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_imu.bin devm-000000003ae64728 rel=
eased
> [  130.832999] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_mec.bin devm-00000000af46a982 rel=
eased
> [  130.833001] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_rlc.bin devm-000000001cb79a18 rel=
eased
> [  130.833002] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_me.bin devm-00000000cc67f139 rele=
ased
> [  130.833003] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/gc_11_0_0_pfp.bin devm-0000000081c0968b rel=
eased
> [  130.833004] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/dcn_3_2_0_dmcub.bin devm-00000000443f0df7 r=
eleased
> [  130.833006] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/smu_13_0_0.bin devm-00000000b15e02fd releas=
ed
> [  130.833007] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/psp_13_0_0_ta.bin devm-000000000210a6a5 rel=
eased
> [  130.833008] firmware_class:fw_name_devm_release: firmware_class: fw_na=
me_devm_release: fw_name-amdgpu/psp_13_0_0_sos.bin devm-00000000f20cdcf8 re=
leased
> [  130.833014] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_mes_2.bin fw_priv=3D000000002d9267e4 data=3D000000=
0031802202 size=3D257344
> [  130.833024] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_mes1.bin fw_priv=3D00000000c7ac6b6f data=3D0000000=
033e75f41 size=3D218240
> [  130.833055] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/vcn_4_0_0.bin fw_priv=3D000000004d750fd5 data=3D000000003b01=
c6c8 size=3D403856
> [  130.833077] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/sdma_6_0_0.bin fw_priv=3D000000009cbfce7c data=3D00000000e92=
460ba size=3D34560
> [  130.833109] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_pfp.bin fw_priv=3D00000000db83ee7b data=3D00000000=
3055277c size=3D231008
> [  130.833118] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_me.bin fw_priv=3D00000000eacba546 data=3D000000008=
290cf98 size=3D314512
> [  130.833126] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_rlc.bin fw_priv=3D00000000328bec43 data=3D00000000=
b139d21a size=3D185376
> [  130.833134] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/gc_11_0_0_mec.bin fw_priv=3D00000000fd9b77a5 data=3D00000000=
e642bc9c size=3D406528
> [  130.833151] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/dcn_3_2_0_dmcub.bin fw_priv=3D00000000af71cb2f data=3D000000=
00aca60ab1 size=3D284432
> [  130.833167] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/smu_13_0_0.bin fw_priv=3D00000000fa494fe0 data=3D00000000a8e=
97967 size=3D292452
> [  130.833180] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/psp_13_0_0_sos.bin fw_priv=3D000000005273a87e data=3D0000000=
04f725920 size=3D268304
> [  130.833192] firmware_class:__free_fw_priv: firmware_class: __free_fw_p=
riv: fw-amdgpu/psp_13_0_0_ta.bin fw_priv=3D00000000dbd3858b data=3D00000000=
b534cfff size=3D267520
> [  130.833581] amdgpu 0000:83:00.0: amdgpu: amdgpu: ttm finalized
>
> Thanks,
> Peter
>
