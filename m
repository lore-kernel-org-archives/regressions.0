Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FDF1EE02F
	for <regressions@lists.linux.dev>; Tue, 30 Sep 2025 19:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759262348; cv=none; b=URuCX32CJO3NxWtCxZ5jQyIcst3TUStc/yUTmlHVncA7Xq3qLLcFoPWKFi6RW4eR7yvyfS4kavsvfUyvDQsal7G5CTvY5nGpJpuf5JOK/oHY1raRgimmlffG8veRNC1chyhV7aTQS+NXSEckCSl3vhv4qUBachylrN78fuqBAKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759262348; c=relaxed/simple;
	bh=iDWIzHNHHj2vciK2xfzgbi+QUOJD+V3P9WOslgRaJ8I=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ANZf5R5vkVdd4+OBrzyg+wQg5JrcZHjtQwWxbCtIi7zm81RgABabVNMY1bd9cWR6arESXgT12jPkREd7XcSFr8Osc985SOloqSbg4YYkzxg6YukDe0lW1VBHOoBYI89t6RrQreiI1EkCEH/XztT6PCfejhNl9qdsDvXTRUNc2+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=qXgzDezn; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="qXgzDezn"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-781db5068b8so3234239b3a.0
        for <regressions@lists.linux.dev>; Tue, 30 Sep 2025 12:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1759262346; x=1759867146; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xa3PNk1yMBHfe3pVcZ1nwX4FG5FOz8kwURcAt+4oLZk=;
        b=qXgzDeznIy7BF41DAnMopQGTpgJiYyE57UYRf9gBQHka39E/FqnuR+X1ooaZGO5vwY
         UFWpJ0ZcU8SxAnJU/4Fa1UsCdOWyIK6sRYCre6y0ztdMaL980bNixUD2BAGZtwSYO4HZ
         ZqeIlVhp0pm4fnYtHsXTBODd4U7oy6fFFyuelaBglA/IMZcAx+0M+kgwrtH0userM7SN
         ZAJrXZTfD52Mn/Oxaq4ePhnlwvoaukaW5JpiRXPrIxfnqczz6jY0jrTvx01/y0m7pEzP
         xeAgO7eCsYnevpl64HEFNEFTpUAdMQ6Gf0wOE/0hvuODOTeqiv7NBIiO3U8ez48Qrv/L
         gJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759262346; x=1759867146;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xa3PNk1yMBHfe3pVcZ1nwX4FG5FOz8kwURcAt+4oLZk=;
        b=o1YqaV2t0RnR0+tXqeti8i+0mkIi6SYgzzLo85Muk2/3FSHrOFSSBn5iWeCDYD/5C/
         43zO/VQh2n8apTiia3lZD1QtuB4XYtyoixxsFaWegQsuLnRwVIhNC8coi5Z9LoXmjnkw
         2tcmLSBMtRBNRRdyGKZC616bnk+TqupZ5ZLptdIMWKHsGsfti/QeZ7G9LIfIMjMwzlCg
         +tegiIHK9XiFVPxl6dh9QXdgVTAnEvcaTIpShpwIsNPstbuZXVuWRlem888sOVvyuF3s
         ZInYmsWUEmHa07oT0r5PcXPrEhmXE1s0WwykR6VsIfN4xbNkVjArwtfFSt/nG9os8QvR
         DbLA==
X-Gm-Message-State: AOJu0Yw0crM8K4Ho03csaBMpZV/o4qmFbKyOd1AmXSkb0hxsEY6RlBe0
	PxpzqOm7f2JcESPpTb3twJrlmthxm59CzDVLkihAprI5zSMtWb1ee0zkqepkkz8TX3o=
X-Gm-Gg: ASbGncs4rU9eH4j4T//UrWdXRBNkrPiZMQKOf4lWCKGqZGMHR/T6v8/f8RxY5Vc208t
	iQPYBbN9vnPhYmouAaS/eYGMo78vtcdnNffVhUFdkbJVHl/NmWaCLw9JBmc4qb9R8dEfvAN/zwn
	gWpFzUiyDSMItUk5e1TqWC5t95KhR8RDtiJkLt7hAaDNqeRx7i6Ipo3RY5MkyZI0vGwVi72DI0K
	A1eFBun3D++8cd5xEyybhLlL21wOzkcwPTmQBVpWvjByMET7q9p21VlTDrJA2r4nbSs/hEjBoYP
	a0sIUTi8GJl09eXc/6imzp/zFGqcZFZx91ARiKBnSE010kiUVapDBA2e8uFpjQAcFKCaxckCQF+
	iGck/x5WTdMKlBtoL0GRcsSHP0g4p7B22TwyvKVPgKkzmY52PyjA=
X-Google-Smtp-Source: AGHT+IEZofWkgSIDGPaV5eW7eavUlSGn/9m7SxK8Pe31/UjWDvtlk526EnYNkb89BaFoVCc7/MWVww==
X-Received: by 2002:a05:6a00:230b:b0:77d:13e3:cd08 with SMTP id d2e1a72fcca58-78af4141a41mr694645b3a.5.1759262345679;
        Tue, 30 Sep 2025 12:59:05 -0700 (PDT)
Received: from 425547dfa489 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-781023c2b29sm14770469b3a.36.2025.09.30.12.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:59:04 -0700 (PDT)
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
Date: Tue, 30 Sep 2025 19:59:04 -0000
Message-ID: <175926234348.77.14416250745228358277@425547dfa489>





Hello,

New build issue found on mainline/master:

---
 format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Werror,-Wformat] in fs/btrfs/disk-io.o (fs/btrfs/disk-io.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:508104d34b42851d5cf2793962558310ea5c8b41
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  755fa5b4fb36627796af19932a432d343220ec63



Log excerpt:
=====================================================
fs/btrfs/disk-io.c:3400:28: error: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Werror,-Wformat]
 3399 |                            "support for block size %u with page size %zu is experimental, some features may be missing",
      |                                                                      ~~~
      |                                                                      %lu
 3400 |                            fs_info->sectorsize, PAGE_SIZE);
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
- dashboard: https://d.kernelci.org/build/maestro:68dc15cc841b167e8d35cb5e


#kernelci issue maestro:508104d34b42851d5cf2793962558310ea5c8b41

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
