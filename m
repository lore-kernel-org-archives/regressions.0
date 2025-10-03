Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084491547C9
	for <regressions@lists.linux.dev>; Fri,  3 Oct 2025 04:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759467548; cv=none; b=nDVxrPr3GWxrpz8NBvflsH2aMilsQ3WBSgFQiiX0XebrYwhyiFTgZEVXj3ugleMrIk5xjacjOnqcH2WQaZ+W6yKEE07A41jc+VKYFOc01hQyj0tyFQBb4PVqxoY+/LLF8Hl9YOrp1OSM0NOCDfa+ZMP52KNGCcAId3M8Ljx7CeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759467548; c=relaxed/simple;
	bh=rGqUzefOsezmXKul4+ZX90yT85oKURSlxUtycuN1gVQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=KBCPpLN/iZ9LpN6UfA6QIvqt8jA8WOy7NhiBOPFXTROStUklLMPsWK3w/E3842tn87E2u6QHtU8Du3wg1H2Ri4x/T4X0LM8V3WYmLPTPsWICurBZReMooFSn9ST11g4rB+8RPAPLJ8+6JoGqkXgnFMRUgXY9hq/wPlSGHR59Wlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=3X5+Cbl8; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="3X5+Cbl8"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-27c369f898fso19175065ad.3
        for <regressions@lists.linux.dev>; Thu, 02 Oct 2025 21:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1759467546; x=1760072346; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dngT4ej3KSbM1/KlbBDOSEDv6EzhiSm+d/v67xipPiA=;
        b=3X5+Cbl8pbAVQS5Mb0jp0y3Asa8umRLX9oFer5cMoaVJTwiZ7TXJ2Rj0gwIFukA1AH
         vUzMONdKh34o9/LSPgDkL0i0dPyjbBwodg9GxXs4Lj9GlrijRA40lOmxzT8ZmECvYXGP
         eOfZR57+2C2s8pJtJAqZ/1zfYj5xwRBFlBPl8myHUKWQKP3OuryHCFQ/LfhJ9XJkptGW
         EZ31Qnqxo1B+HhPJq8tAtK1AQGwDA3DkSFzXxQTftkwGPEd7vwjSuW5g/t3z/zfYEtG0
         NxiQq2zSq4y95UBIdrvmixZWShiJMHnJgwStsPHgRSQg1sWwloiK4vl3erOlxKOKPGoX
         /16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759467546; x=1760072346;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dngT4ej3KSbM1/KlbBDOSEDv6EzhiSm+d/v67xipPiA=;
        b=L07N62R0fRrFHJMaVZQdcI0aJKna6rMr3Aq/AdwYzRBi6i1F6QcSYJdKUxhr9WSaw4
         3aQ9ARt0lavojY+GU8uwswPaElKJoEctbvC46rfNSGIDWlZFj2PgKNdMlpaPiwcPPixg
         CnfYAmicMQN8xnb5p24cB66EN1uUi8vDUnsOl8rh1CLaCxsDnkwf4vhotdGaUaS5Zgjv
         QbxiYWg27fD3mTUIQC8utFHs2S2u2iNDgC+Ha/v29TEUbmsjp2V9GxmLh3Cn7n0CZAKQ
         HE5aRT1w+915AVR/VpzGcL5Zuj1I2B3tnx2ypYXHTrutNlYWHIhjzLZCAjpWr1+grmMP
         p1LA==
X-Gm-Message-State: AOJu0YxjXZXW+UJWXti0xOa+cxrNVbGGjmGR7LtrCs2tx7y9wmHJyl/K
	kWLW2NXlPiIpqyF1JeSWJc4ObGbRamlBth1yaG0KRorgKCv+0WaC/KCQ9fv5215o0plV3ODvDj3
	aBOVD
X-Gm-Gg: ASbGncsqxjvf5LPu03+gzbu54rPYGd+hBs7M2aVEowncs83mRsH5CxNarfNtG6Z1CP/
	vNNlS0liJ+KVPlKPRApkyPFRLAmnXyuTCvueEiKtTeMxEsNjtsCXgp5ZpR9urY9G4z/H0hxuwYl
	WlteUbd3Hv8AJDBt3S/pgdOyohsRQgzIO0NKAY5RlpGot/BfDZut+lN/l+IpsFV8gIEQv2UFco5
	1QaMlFGlGs//rE6i4K5hGK+PxxFwSa4OnZdicq93ctQhSXbFAZN/hkXGutaO5xzfw+RDdqXYA9W
	2uSPwv9c8sGWVP63Hugu9/8nQa1tv9IkoNFvdfNQX5cZJ/dwiYxQ7JiUctjXwSFb38RR1uq27ET
	m9PQnZ1eKm0z3eLNnZLxA54698Poq7UgdyYO4X8uK
X-Google-Smtp-Source: AGHT+IH9wfFADYEcU2YBvgbS4FAvtCme857i6ls9aWo7AquvG4jHWNDzLdeuTHp1mJw3mNN3sB3YrQ==
X-Received: by 2002:a17:903:2f4c:b0:27e:d4a8:56ad with SMTP id d9443c01a7336-28e9a6a2eb6mr19016415ad.61.1759467546310;
        Thu, 02 Oct 2025 21:59:06 -0700 (PDT)
Received: from d4e9dbf8e2d5 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d11085fsm37604115ad.14.2025.10.02.21.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 21:59:05 -0700 (PDT)
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
Date: Fri, 03 Oct 2025 04:59:04 -0000
Message-ID: <175946754379.131.2929871643754423012@d4e9dbf8e2d5>





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
