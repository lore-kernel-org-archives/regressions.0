Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29E817729
	for <regressions@lists.linux.dev>; Fri,  3 Nov 2023 13:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSZWmOgH"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cc3216b2a1so21719495ad.2
        for <regressions@lists.linux.dev>; Fri, 03 Nov 2023 06:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699017227; x=1699622027; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MwPMVH4LDuJgobt9cfmpj/2pKioxsX4geRXK7wNjBk=;
        b=XSZWmOgHc6DAXXJyRGpZO0IFzOmj3Hag2TKc+ZuMgg/sB/CS9qyhdGvtarqh+NbDRN
         /lemsKNQKBg4WT81cletRZUa6FUFk2HpNc/bRqzWNlhtMkt0V9RsCf68us4yRAmv9sQU
         ihWxZm4wAXtu7z93oqdQXnosPeVfR4eEQZGT2FsT8EycWElwgOM2wNy9/mR2ExIbVvys
         YCBYQHGVIsODIGzolEGFkA9bjOeSvI/z8biMSdM5v2KYDG9zpmgBCk/z6AnDtLScG45e
         LVeX3ncAqX/xJo89a5P2IcUwwVdp37sfnJgg3UuVusKzpcHCGco9WSGf4OF6BvuDxRyq
         SRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699017227; x=1699622027;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3MwPMVH4LDuJgobt9cfmpj/2pKioxsX4geRXK7wNjBk=;
        b=uyYXnrZpSwza/ItLgWgO5NYwactnXnQcgc3mhtUAOCz3OkWpn3NrJunLWBhAb7q4+t
         hNthSCrvWzInyyEYSHYumwCmKNdo98HvGPMJzR0sfdtjFDfGaAkBX7oFORYOCCtM9ONo
         olK1qz5iokhlVx99V+e56+7nY+IQh6qex0i7gMTX383gZOUSmYbp30qzVnkjaCpnWLsC
         RhXBrRVW0C2WgoDxyOO4TbKalEfHr2o6/oJLejEJQjoS565sJaKs/oy6odwivGLqh1rs
         p3pm5bFlWTY99HfVt3INwJg6spwalu66XnNlfz2tCAKlExcW6j6J2hc3LTl2Xl00tN9o
         OclA==
X-Gm-Message-State: AOJu0Yw4yoibt+FmUcSiq/p5vpLapcqzm5oq7FP3B5zzar65egdz2RWg
	KX3Xf4XGkOG7S/DdSLo523w=
X-Google-Smtp-Source: AGHT+IGox8sPxCi41z2/fQ07a38d3a66J0bRgzx3BiBzfXjqXw/i/vdXI5phmjIVWUfpgfDcGS/OIA==
X-Received: by 2002:a17:902:e54e:b0:1cc:3fe1:f45e with SMTP id n14-20020a170902e54e00b001cc3fe1f45emr17035703plf.27.1699017226695;
        Fri, 03 Nov 2023 06:13:46 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id iw14-20020a170903044e00b001cc50146b43sm1377428plb.202.2023.11.03.06.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 06:13:46 -0700 (PDT)
Message-ID: <2fa930bb-54dd-4942-a88d-05a47c8e9731@gmail.com>
Date: Fri, 3 Nov 2023 20:13:39 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Wireless <linux-wireless@vger.kernel.org>
Cc: Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Johannes Berg <johannes.berg@intel.com>,
 =?UTF-8?B?TmlrbMSBdnMgS2/EvGVzxYZpa292cw==?= <pinkflames.linux@gmail.com>,
 Fabio Comolli <fabio.comolli@gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: iwlmvm: Linux 6.7 pre-rc1 prints stack trace of
 iwl_op_mode_mvm_start; caused by commit b6e3d1ba4fcf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> When testing the branch that will become Linux 6.7-rc1, ever since commit b6e3d1ba4fcf02176846d03a930203d8133c0aaf I have observed the following abbreviated kernel stack trace (please see attachments for the full trace):
> 
> ```
> [    6.733281]  ? __warn+0xc3/0x1d0
> [    6.733284]  ? iwl_op_mode_mvm_start+0x9c4/0x9d0 [iwlmvm]
> [    6.733299]  ? report_bug+0x167/0x220
> [    6.733301]  ? handle_bug+0x3d/0x90
> [    6.733304]  ? exc_invalid_op+0x1a/0x60
> [    6.733306]  ? asm_exc_invalid_op+0x1a/0x20
> [    6.733309]  ? iwl_op_mode_mvm_start+0x9c4/0x9d0 [iwlmvm]
> [    6.733325]  _iwl_op_mode_start+0x66/0xe0 [iwlwifi]
> [    6.733338]  iwl_opmode_register+0x87/0xd0 [iwlwifi]
> [    6.733350]  ? __cfi_init_module+0x10/0x10 [iwlmvm]
> [    6.733364]  init_module+0x22/0xff0 [iwlmvm]
> [    6.733378]  ? __cfi_init_module+0x10/0x10 [iwlmvm]
> [    6.733392]  do_one_initcall+0x129/0x380
> [    6.733395]  ? idr_alloc_cyclic+0x148/0x1e0
> [    6.733397]  ? security_kernfs_init_security+0x41/0x80
> [    6.733399]  ? __kernfs_new_node+0x1be/0x250
> [    6.733401]  ? preempt_count_add+0x55/0xb0
> [    6.733404]  ? up_write+0x4a/0xe0
> [    6.733406]  ? preempt_count_add+0x55/0xb0
> [    6.733408]  ? sysvec_call_function+0xa4/0xb0
> [    6.733410]  ? asm_sysvec_call_function+0x1a/0x20
> [    6.733411]  ? free_unref_page_prepare+0xf3/0x410
> [    6.733413]  ? preempt_count_add+0x62/0xb0
> [    6.733415]  ? _raw_spin_trylock+0x19/0x60
> [    6.733417]  ? _raw_spin_unlock+0x11/0x30
> [    6.733419]  ? __kmem_cache_free+0x29a/0x3c0
> [    6.733421]  ? vfree+0xd2/0x150
> [    6.733422]  ? slab_post_alloc_hook+0x76/0x3d0
> [    6.733425]  ? do_init_module+0x3f/0x230
> [    6.733427]  ? __kmem_cache_alloc_node+0x1fe/0x2f0
> [    6.733430]  do_init_module+0x7a/0x230
> [    6.733432]  __se_sys_init_module+0x1a0/0x220
> [    6.733435]  do_syscall_64+0x7a/0x100
> [    6.733438]  ? syscall_exit_to_user_mode+0x2d/0x1d0
> [    6.733440]  ? do_syscall_64+0x89/0x100
> [    6.733442]  ? do_user_addr_fault+0x4e7/0x680
> [    6.733444]  ? exc_page_fault+0x61/0x150
> [    6.733446]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
> ```
> 
> I did try reverting the offending commit but the result did not compile and I did not want to dig deeper to identify any subsequent commits what would need reverting to fix compilation.
> 
> If it's relevant, I'm building the kernel with Clang 17.0.4 toolchain by setting the LLVM=1 variable. CFI is enabled but I'm not sure if it's actually functional.

See Bugzilla for the full thread.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: b6e3d1ba4fcf02 https://bugzilla.kernel.org/show_bug.cgi?id=218095
#regzbot title: new iwlwifi firmware statistics API triggers stack trace

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218095

-- 
An old man doll... just what I always wanted! - Clara
