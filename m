Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7670725B690
	for <regressions@lists.linux.dev>; Mon, 10 Feb 2025 18:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211327; cv=none; b=jI0XK/VN/MdgbylTcxSpDvRAqKPBtm7ssTzExWtd/f80qTm8vJn78lPD+HdZbBxea9mne7wEw52cJij7Ai+D6t+OwareiwJJDriYhUFikn05v6dVjolXrEp2t4oQAfHb1Sp4dQcInDPnLoF/BLlFKk5N80T4h8vxSKhEAMb3Fo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211327; c=relaxed/simple;
	bh=v7PziTxmLBZ3O9Aq22uBVsuoPEsJTelP/2x7OeJdsI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CGwKu/k4xB45yd3DEgHg9BGkocaFXgcQLAvzzGM0608fNbYRQBFP+NMaWxwg8doDL0QJKYypMNx3UVQEhrhcrzmVypzJI5ox0MOUSd6iwIaDVrSZkEVNKgEFsYnvU1ITnlZliwMRlSRIOMKDiaWZQ+18jyCPagyamq49lSJQ9zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFxJgTLi; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFxJgTLi"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaec61d0f65so1040516666b.1
        for <regressions@lists.linux.dev>; Mon, 10 Feb 2025 10:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739211324; x=1739816124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qJV1rgacZpDBBz9dWk61btrLIQ0FzziI9339+dVw5oE=;
        b=DFxJgTLi9w/A6IAr1BpUszBEGzOo8r57YupFOtSn8QLfQxfSns84yJtr/l5bynas4l
         O3tjJ0GNGbtdHyUUTzK1Z0OCb3sVr4t4BDWMBp95lwFBA0sIZO34buk3+hGQ8zN5fCgM
         y/8cFB16+P8NnGcwZJ9X0MEYcT7WCvLZozfuScpMHFJMQjBABpAEKpLRC2UC3A8BZOPj
         c54RlHnJzaUjVqDnTCDA2SMULSc3qbipiY5WMeSTrwxFa/kWwJSR4xNpRKdwESYnkIUf
         AIG3OihT5yeLkSBiP4CjPvnUqqdH59ogd5PxzyXNv2efEYoVBlkD0lv70V7/bJAJCKRy
         UquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211324; x=1739816124;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJV1rgacZpDBBz9dWk61btrLIQ0FzziI9339+dVw5oE=;
        b=Atm7yhkUbQnsMRB8acz0M035qk3ByC39KaKZwwXf3ffjWehugcZSZGfjCRlBOAnfHu
         plFPWBD4kDamGBdxy0srWdgiW3MaT2R7sXJUefNobxLQl3ZXVtQBrYSDWbDk/TswuUnd
         IUe7yaabEmD9IW+n6WuWQOSAGMomnKnawHQxSecKyFPxuFFoiFNzy2s/N5bXm6HD94M2
         ES/iMU0/XK2KvSAGQ9/Y5jS0zdA7c1FekdAI2LHhgCaC30STzzhDa2cuzBChRvkNKc+E
         NcplASx7fd5hd/JBZNpTXo9qnpjl0VSZdAhcZOEQBgY5uxwf/eKUKluyMqjTZe+VSVKR
         pi8A==
X-Gm-Message-State: AOJu0Yy3eHbw4J19X7zv6dpEH4+ZvYH2gjX7XtM9oL4sT/IAgQ/8+l/5
	UuY422KIlX/s8rGZPziIPiWtP32U4gIcqwB1Ule2P8k4T/aleqKjO9X41Sg3
X-Gm-Gg: ASbGncsPLa4x/oDkCo88I5yiYVso6W0d2v94o7pMfcQ7BuDb9VkAd6HPgeMWLYK9LJh
	QrnW5I3nHNq0M0qd7r3EjG4mBC4bfTysniBkMNcT3n3ogjpWqx4x4YWQ9rtxgPX9yWk7hBbuiJJ
	So5OZ18t9NJVlPlGZftUkFdPObh0xsix0ojWQ4YWxanq5kKHBGVr72m3FhXLVmZEEQppG3kFQUS
	VCy5doGDoMpGzsGgoJjYAP3/ACbQpbA46Pd9zUTLW3EnIkcOw4ciV3hz+D7xVF3lONgQ3upVCq9
	wjk8Vu1qLAO0juHGRxmg8kfxIeWtYxwn
X-Google-Smtp-Source: AGHT+IEH9VPL3jeCxUwyp282Q8Fb/cN5oEN0K/DdSnhXtJ6KA9hqwh+vV5t9Bz5K6FuA9iHoVtUq5Q==
X-Received: by 2002:a17:907:c281:b0:ab7:bc17:b3a4 with SMTP id a640c23a62f3a-ab7bc17b58bmr443229266b.34.1739211323290;
        Mon, 10 Feb 2025 10:15:23 -0800 (PST)
Received: from foxbook (adtq181.neoplus.adsl.tpnet.pl. [79.185.228.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7d1df3161sm101465966b.108.2025.02.10.10.15.22
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 10 Feb 2025 10:15:23 -0800 (PST)
Date: Mon, 10 Feb 2025 19:15:18 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: amd-gfx@lists.freedesktop.org
Cc: regressions@lists.linux.dev, Kenneth Feng <kenneth.feng@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Boyuan Zhang <boyuan.zhang@amd.com>
Subject: [REGRESSION 6.14][BISECTED] AMD Carrizo shutdown hang since amdgpu
 commit ff69bba05f08
Message-ID: <20250210191518.351576aa@foxbook>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I have a machine with this APU:
AMD PRO A10-8770 R7, 10 COMPUTE CORES 4C+6G

6.13 was OK, with 6.14-rc2 it hangs on shutdown after the display
turns off.

git-bisect says:
# first bad commit: [ff69bba05f085cd6d4277c27ac7600160167b384] drm/amd/pm: add inst to dpm_set_powergating_by_smu

The preceding commit does indeed shutdown normally.
AMDGPU is built into the kernel image, not sure if it matters.

Final lines of dynamic debug over serial pasted below. Any ideas?

Thanks,
Michal

[   79.232113] [SURFACE]:Pipe 0: width, height, x, y
[   79.232113] viewport:1600, 1200, 0, 0
[   79.232113] recout:  1600, 1200, 0, 0
[   79.251418] amdgpu: [IPS]: dc_allow_idle_optimizations_internal: allow_idle old=0 new=1 (caller=amdgpu_dm_crtc_vblank_control_worker)
[   79.253727] [SCALER]:resource_build_scaling_params pipe 0:
[   79.253727] Viewport: height:1200 width:1600 x:0 y:0  Recout: height:1200 width:1600 x:0 y:0  HACTIVE:1600 VACTIVE:1200
[   79.253727] src_rect: height:1200 width:1600 x:0 y:0  dst_rect: height:1200 width:1600 x:0 y:0  clip_rect: height:1200 width:1600 x:0 y:0
[   79.303043] [SCALER]:resource_build_scaling_params pipe 0:
[   79.303043] Viewport: height:1200 width:1600 x:0 y:0  Recout: height:1200 width:1600 x:0 y:0  HACTIVE:1600 VACTIVE:1200
[   79.303043] src_rect: height:1200 width:1600 x:0 y:0  dst_rect: height:1200 width:1600 x:0 y:0  clip_rect: height:1200 width:1600 x:0 y:0
[   79.339233] [BANDWIDTH_CALCS]:dce110_validate_bandwidth: start
[   79.339691] [SCALER]:resource_build_scaling_params pipe 0:
[   79.339691] Viewport: height:1200 width:1600 x:0 y:0  Recout: height:1200 width:1600 x:0 y:0  HACTIVE:1600 VACTIVE:1200
[   79.339691] src_rect: height:1200 width:1600 x:0 y:0  dst_rect: height:1200 width:1600 x:0 y:0  clip_rect: height:1200 width:1600 x:0 y:0
[   79.384264] [BANDWIDTH_CALCS]:dce110_validate_bandwidth: start
[   79.384601] [SURFACE]:Pipe:0 ffff888104900000: addr hi:0xff, addr low:0xed3000, src: 0, 0, 1600, 1200; dst: 0, 0, 1600, 1200;clip: 0, 0, 1600, 1200
[   79.408652] [SURFACE]:Pipe 0: width, height, x, y
[   79.408652] viewport:1600, 1200, 0, 0
[   79.408652] recout:  1600, 1200, 0, 0
[   79.428580] [BANDWIDTH_CALCS]:dce110_validate_bandwidth: start
[   79.428597] [BANDWIDTH_CALCS]:dce110_validate_bandwidth: finish,
[   79.428597] nbpMark_b: 0 nbpMark_a: 31870 urgentMark_b: 0 urgentMark_a: 16615
[   79.428597] stutMark_b: 0 stutMark_a: 27915
[   79.428597] nbpMark_b: 0 nbpMark_a: 0 urgentMark_b: 0 urgentMark_a: 0
[   79.428597] stutMark_b: 0 stutMark_a: 0
[   79.428597] nbpMark_b: 0 nbpMark_a: 0 urgentMark_b: 0 urgentMark_a: 0
[   79.428597] stutMark_b: 0 stutMark_a: 0 stutter_mode_enable: 1
[   79.428597] cstate: 1 pstate: 1 nbpstate: 1 sync: 0 dispclk: 0
[   79.428597] sclk: 0 sclk_sleep: 12225 yclk: 2668000 blackout_recovery_time_us: 0
[   79.429071] amdgpu: [IPS]: dc_allow_idle_optimizations_internal: allow_idle old=0 new=1 (caller=amdgpu_dm_crtc_vblank_control_worker)
[   79.527445] [BANDWIDTH_CALCS]:dce110_validate_bandwidth: start
[   79.527463] [BANDWIDTH_CALCS]:dce110_validate_bandwidth: finish,
[   79.527463] nbpMark_b: 0 nbpMark_a: 31870 urgentMark_b: 0 urgentMark_a: 16615
[   79.527463] stutMark_b: 0 stutMark_a: 27915
[   79.527463] nbpMark_b: 0 nbpMark_a: 0 urgentMark_b: 0 urgentMark_a: 0
[   79.527463] stutMark_b: 0 stutMark_a: 0
[   79.527463] nbpMark_b: 0 nbpMark_a: 0 urgentMark_b: 0 urgentMark_a: 0
[   79.527463] stutMark_b: 0 stutMark_a: 0 stutter_mode_enable: 1
[   79.527463] cstate: 1 pstate: 1 nbpstate: 1 sync: 0 dispclk: 0
[   79.527463] sclk: 0 sclk_sleep: 12225 yclk: 2668000 blackout_recovery_time_us: 0
[   79.609435] amdgpu: Setting Deep Sleep Clock: 1222
[   79.616505] amdgpu: enable Low Memory PState.
[   79.708792] amdgpu: Setting Deep Sleep Clock: 1222
[   79.715842] amdgpu: enable Low Memory PState.
[   79.722763] amdgpu 0000:00:01.0: amdgpu: IP block9 already in the target gate state!
