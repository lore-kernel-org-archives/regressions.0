Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A822E7193
	for <regressions@lists.linux.dev>; Thu, 21 Aug 2025 06:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755759547; cv=none; b=Jx918S4RA9boW/8hPUXXKKs4kz5RBWktYpBTkp6j/Hiocu+DLZEAl225TqL4nbsSXBzmos5a2b/D2ZVuMnrJry98gFq3dm0HGT4sVmce8AVm49ea9qW9eAzbOKNruZ2nb97IiTx0CdGWWh5UCkouW3rx0exo1PPJbV5ZRuU3EO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755759547; c=relaxed/simple;
	bh=ZSv4wB36PfS5VGVUvJHoEWowEtmZNAEhcpaOx0Rgfow=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=R1FwwZ9ecEFSXuscc9HoIPWkB+ajG4Q2wY+3DBG40NUPoHH00xG8gMt+2hqmESat1ysPY09JeORlLnW4oJr73u1wEoWiQKR0t5npI/jIEmAEUZSRk4RIPFDjt7Wayk6PxMcsaEzvapVRPHZBOmj/Mc6+wfeYMJLugkDWN3sA9Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=aqpV94ht; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="aqpV94ht"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-245fb4c8738so8161275ad.0
        for <regressions@lists.linux.dev>; Wed, 20 Aug 2025 23:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755759545; x=1756364345; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkmYqFYcjlIoTyAuPZAuVl8TGuuRtgnNe9g9iFR96f0=;
        b=aqpV94htvPSefJ+SBNyd9hSCXGBDCVf7uocJCmdfgM/36pcVHUR/f2+teNP8cPLbpY
         Ne2OOrL+LfcInZdNAtMO9mVrfrxLaG1fTjSc474zcTXuEUt2Uaq1936Eqk4386IxDKwD
         OF4YRbZo19+ZJ3uUtivEMiGmedKYZldDVWfQB+9jGSmSYaLwA0w1Lz76bwDAGBWbxS/P
         Ay7EeMCm+LPDGqnGB73GoxWncf+ptUg6lZjzAu32aJXTJzTXBUFvvQ+UhG4oBhM0XVd2
         Kq07bYoCAWit4Ef882ZbMXbr33DfZjEOLb761ozRgQ1x+9JYOMKnpNO+vpFxt3lZWgTC
         SREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755759545; x=1756364345;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pkmYqFYcjlIoTyAuPZAuVl8TGuuRtgnNe9g9iFR96f0=;
        b=TtglUZum6wypl/vkbFTxLOiKarQ8axAvq9wKbms/FTNv0qD9e2wX3nuCF74vVUhb7S
         LJHlP15tmpBxdObg3vEtv/clEN17teEQL+3on4uuHg8hVENln6Q7KGPm33DnY1qLzHPF
         OO75aNy6n5foae4CQib0W0QBL9rzC01Pwiw8U2w0qiFKoPkO3kg9syRmCg7v5g/D12gs
         RrUHdqRAsFyAlePS9upwurdZcnqbLRDN1TsAnBF/g73F2zims7svxG7AvP4n37yY0kcN
         OYV3Qsguh9icgpZsmu/oZGVH1wY0Nsw+JOe+bl3PAxi0doCnSkJYN4VVwdws8bS8r8Xk
         Z+JQ==
X-Gm-Message-State: AOJu0Yxivfbx21rGy5P30+SMDD50H7/3AwZRgLhYlaVCDFHomdJfIWIK
	rxAgK3bpoJc6zOL3B+4LWcXJfe7KcKDnVfL2qmSaqd9uWV1dCZyPCIEup8EjDLBriB1IwLpuLDt
	gm6xv72w=
X-Gm-Gg: ASbGncu6zsK6B5MHHboowMpcGif/HgC8ijsfJuolJ5PqZiF1WtYr9ab6MN80lf2BiIH
	kJ3Ouoa3hbj1ze+fMFloGWNQSQa4bC/DiDxbIcCcotB4pPHJgP72XmYQK/3ztc3zVAy4iGyCOlP
	UJGzEWLPrpDNiPotLczWRcwrSu3H/SlPgr2GdN9zr0310xqzf21sUfqxUGtXuenJmcGKzwNSuDe
	jVVJqg9+vX9vfEc/Jk6+Wy+9A9whH7FXlQZSlo6Zf4+8zl6zuPCU4ZOssj8yU61RAygjxnGrVWa
	nfL5pD3kTwEz91NqdFItyUJb6iBEscCsty6hkaO/3LV39u/p8/vQSwHQc6CMYvzvzKtCg5JFB5a
	rABFOS9eP/G51IFXVTkXjwlVzUrY=
X-Google-Smtp-Source: AGHT+IG/B5stGNdGiwG8KC7dcHDlE7l2ZKDOB0YFdWhSQXQwzaKtVXo2UoJt5gDvGcZfJ2c7sYJGJg==
X-Received: by 2002:a17:903:41c7:b0:240:671c:6341 with SMTP id d9443c01a7336-245fed7e771mr19297955ad.26.1755759544756;
        Wed, 20 Aug 2025 23:59:04 -0700 (PDT)
Received: from 16ad3c994827 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324f384ddc1sm349449a91.0.2025.08.20.23.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 23:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [REGRESSION] next/master: (build)
 ./arch/mips/include/asm/cacheflush.h:42:34:
 error: passing argumen...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 21 Aug 2025 06:59:03 -0000
Message-ID: <175575954332.147.3671353627841122443@16ad3c994827>





Hello,

New build issue found on next/master:

---
 ./arch/mips/include/asm/cacheflush.h:42:34: error: passing argument 2 of ‘set_bit’ from incompatible pointer type [-Werror=incompatible-pointer-types] in arch/mips/kernel/asm-offsets.s (arch/mips/kernel/asm-offsets.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:dfad1cace3166f976876f942be0d5f653324d85c
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  7fa4d8dc380fbd81a9d702a855c50690c9c6442c
- tags: next-20250821


Log excerpt:
=====================================================
                 from arch/mips/kernel/asm-offsets.c:12:
./arch/mips/include/asm/bitops.h:89:70: note: expected ‘volatile long unsigned int *’ but argument is of type ‘memdesc_flags_t *’
   89 | static inline void set_bit(unsigned long nr, volatile unsigned long *addr)
      |                                              ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
./arch/mips/include/asm/cacheflush.h: In function ‘flush_dcache_page’:
./arch/mips/include/asm/cacheflush.h:42:34: error: passing argument 2 of ‘set_bit’ from incompatible pointer type [-Werror=incompatible-pointer-types]
   42 |         set_bit(PG_dcache_dirty, &(folio)->flags)
      |                                  ^~~~~~~~~~~~~~~
      |                                  |
      |                                  memdesc_flags_t *
./arch/mips/include/asm/cacheflush.h:70:17: note: in expansion of macro ‘folio_set_dcache_dirty’
   70 |                 folio_set_dcache_dirty(page_folio(page));
      |                 ^~~~~~~~~~~~~~~~~~~~~~
./arch/mips/include/asm/bitops.h:89:70: note: expected ‘volatile long unsigned int *’ but argument is of type ‘memdesc_flags_t *’
   89 | static inline void set_bit(unsigned long nr, volatile unsigned long *addr)
      |                                              ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
cc1: some warnings being treated as errors

=====================================================


# Builds where the incident occurred:

## 32r2el_defconfig on (mips):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68a6c16c233e484a3fa4cedd

## 32r2el_defconfig+allnoconfig on (mips):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68a6c169233e484a3fa4ceda


#kernelci issue maestro:dfad1cace3166f976876f942be0d5f653324d85c

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
