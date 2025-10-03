Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49217C148
	for <regressions@lists.linux.dev>; Fri,  3 Oct 2025 04:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759467547; cv=none; b=oLd2u8Qe4cPJXus/HedzwPCqW5LE7fmBJeSOtjt7/MdFWLuFCtfGpXhc8te7yJK0RGV57qPh4Lk3y7U0i/FvXhQ2eJNd8i9rLC1yJfy/zN77NP99fZWnSMQmEsllL1TMuqDVsRr5v0oACcUTOV4PjE/VJ6fjmeeEz0BSxG/P0BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759467547; c=relaxed/simple;
	bh=rGqUzefOsezmXKul4+ZX90yT85oKURSlxUtycuN1gVQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=trUIKZeyjrnOrE8W58O1gZkHxgDAGeHKGX0T+PsJBWukYxV8UO7nWjk4j9qNtZwfK1GlGGi6Te7UvHVHt69M32K4e14EXA5S4dvGGga6r27XDjOOnSIgpkX66imf9E7TLajmjOQop8abz1fKnU2oBC2MQ/wBDRJAKoB/eeK2pJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=CfWGYZM8; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="CfWGYZM8"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-28e8c5d64d8so16769655ad.1
        for <regressions@lists.linux.dev>; Thu, 02 Oct 2025 21:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1759467545; x=1760072345; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dngT4ej3KSbM1/KlbBDOSEDv6EzhiSm+d/v67xipPiA=;
        b=CfWGYZM8OZ3FuG7QrCB6fYUt3Wc0ayHDVlKR4khvE6Zhttb5YrQLtCTIsLDrCzFgn3
         pTN7D+G/E/ayOIf8tgppjpoW1noOL3pGEu7H6Uc8umkZyCTMDi1P43cJgPicv1cVnop4
         DAaSTxKKycurqpVa8KXzK3yWXhW66axEHIGzBN13CEKVp4YFIB4Z4foh6FjE+KifeNAg
         T3DGDin/2NIYHGC5ucgAM3KhrarNgRFCU+LOIZ11+IXbkz2LkIulN1rUFB54C5Vg6s/X
         mV0SC72v0Kpa8HIv4sYYkFzqEEKJJhrx++9mxdfmj3uhv7LS002e1puUfrywe3g29pg2
         W62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759467545; x=1760072345;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dngT4ej3KSbM1/KlbBDOSEDv6EzhiSm+d/v67xipPiA=;
        b=gbyOcuMwuijjsrGndhpamuiQMa8aE41etUAMYV5VPqHj3n18AHHxa1Es9SabPElEoC
         tYvp4BkwVapVhYb+mbujMkKbisaHT0RdT7pDghguQYZ+dl23TJC0NJAk+W1m6JZ29trh
         JARO7+mlwXwANKscdUA/FbUHZEg7NRei0w0hvgJfPx4UIXwU5gIRApSuyaO8a/sk4R4s
         i3gY//66BkyjMo0sq1hm+SNJym7FWPo5+pY+IhGu1ToCaehT+oIPPReU+JBPG4k11vvr
         rtnpSQ3t6ZubuE5Oworxjuh177MZy2RQCzcULYeWp3yggICwS/CpPCpSsZuQo4E8/F9y
         4uCQ==
X-Gm-Message-State: AOJu0YxkH6FXSbePDnFOVtqwdM/NcOkPnUR2pIXl0TbFtxVo941RvU71
	bKagjr+q6ObvQ0sH/duo1EkzU+cF8HzVWHNqu4gG5QFoRUFXcnsVHWkRjdvar0QaMwvoUxy9nvB
	vkmce
X-Gm-Gg: ASbGncsY/Nqp+MhGfqH3qHA97bv3tyzpsOr8D/ZSZP6JkpxD/slvv/BMCKU11uO4Xfg
	h1zS5ra9O+FM82ZGLl3gjWG/6P+i0yrRzya34Oe497EAG4pq0RbjuPQ0HcXihAb4sL3fsU4aGDB
	0/VIv5i4kj8dHmmI44MwQtP1JARzDxFsXnxG7spJQE4Sj3KUajwjakpvTT8IXSJgHE/wadLbPCR
	/c7M1pEuMe8TWh3TgZnLG+sSEDqEq/mKO8H3mInLnwXonqScFBrsA/J/LiTVgkn4mPpXAnr87wG
	cOiTtplR1N+1JXJac0lVXBwVr1yKkNZm8xVLmKUPJEZp1D1Whjbm8T8sDeLJYG3Ttk3AFU/xEGf
	bY+3a8Seb3wX2qgKS4WwbJdHG954H1axZgW8rGm48
X-Google-Smtp-Source: AGHT+IHD3HVlSVzfPWyZQs1cGp8X25YkCQFpM67rvjbB1x39sP+7slyYG+hMrHhagqTWvwZQthTjDg==
X-Received: by 2002:a17:902:ced0:b0:27d:339c:4b0 with SMTP id d9443c01a7336-28e9a5fa863mr20875195ad.35.1759467545502;
        Thu, 02 Oct 2025 21:59:05 -0700 (PDT)
Received: from c325b7c58cb6 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b9e5asm37075435ad.74.2025.10.02.21.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 21:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) format specifies type 'size_t'
 (aka
 'unsigned int') but the argume...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 03 Oct 2025 04:59:03 -0000
Message-ID: <175946754326.289.9829841122484465364@c325b7c58cb6>





Hello,

New build issue found on mainline/master:

---
 format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Werror,-Wformat] in fs/btrfs/disk-io.o (fs/btrfs/disk-io.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:0632e4e1eb4e0d786f6df5aabd5d5cfa7f942266
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  e406d57be7bd2a4e73ea512c1ae36a40a44e499e



Log excerpt:
=====================================================
fs/btrfs/disk-io.c:3401:28: error: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Werror,-Wformat]
 3400 |                            "support for block size %u with page size %zu is experimental, some features may be missing",
      |                                                                      ~~~
      |                                                                      %lu
 3401 |                            fs_info->sectorsize, PAGE_SIZE);
      |                                                 ^~~~~~~~~
fs/btrfs/messages.h:47:51: note: expanded from macro 'btrfs_warn'
   47 |         btrfs_printk_in_rcu(fs_info, KERN_WARNING fmt, ##args)
      |                                                   ~~~    ^~~~
fs/btrfs/messages.h:84:31: note: expanded from macro 'btrfs_printk_in_rcu'
   84 |         btrfs_printk(fs_info, fmt, ##args);             \
      |                               ~~~    ^~~~
fs/btrfs/messages.h:27:32: note: expanded from macro 'btrfs_printk'
   27 |         _btrfs_printk(fs_info, fmt, ##args)
      |                                ~~~    ^~~~
./include/vdso/page.h:15:19: note: expanded from macro 'PAGE_SIZE'
   15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1 error generated.

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (arm):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:68df3c03841b167e8d3c9151

## i386_defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (i386):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:68df3c6d841b167e8d3c91c9


#kernelci issue maestro:0632e4e1eb4e0d786f6df5aabd5d5cfa7f942266

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
