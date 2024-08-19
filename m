Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCD815B57B
	for <regressions@lists.linux.dev>; Mon, 19 Aug 2024 08:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724056143; cv=none; b=RGYuB/r/6OSYP7mvn7JpJ5D502WKSJlpeFyy+L6mRH3wM8KNQrk5NntvooijjPWWudtbdtwms+sWKeozMXkfUvL1eyeXPtr/6+7xgwBgi5ngP3IeL5VSmL74NxL/q96FFf/cJElMKMax0GapdHtQg8BFwGrYyZ3ekKEUgWa8Phc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724056143; c=relaxed/simple;
	bh=FVAVj1LvGkF/qSjcgZvVxOe72okf4eq3mAz9Bqo5X84=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=b6gTHBD+K6IKaPrl5HvTw9nswP1SxZrxMf16nE2N+NLHsRrdWFSh2ek9PwDXiWmrWbkZwJbKwbMsOZNCDM10/+jrdK4Uh+zJh5flSA4wq9e6fsbL4lA3OtS9UO/PTQ+0+6knXbDw3n2ZgJ5Kf3a7WguaqlQZZpdaLV5nNFIuGvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WqvREHpA; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WqvREHpA"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4929fd67c7bso1257200137.0
        for <regressions@lists.linux.dev>; Mon, 19 Aug 2024 01:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724056140; x=1724660940; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UpX4LsrqwRDqFBD8C2IBSkZVW31sWUBwFvypF0QOuuo=;
        b=WqvREHpAuJEPBOwCTbAtKDw/iViXdWrLoLO8f5gcpf2guHW7SpfsZCJfZaoy48TrNQ
         i4gSwDwpr0oeKEZ3Wo0XCvX/KiuqSBHTnYazsGt5BYFISSaNaFou7spTQNDftdMoXnqs
         bVAdnGgMSBsHaFS1FTArczHwI0FckYkCYrhyRHHWD9swNbpbaD9K5SPWQBMqB1vqYE58
         HmRfH7uFYIbn80rkw03De8lPsuLO4+oH/Rmf5pjAokBkW8nDH+zzEBz7s4TFhqbPtuSa
         Bda/lzDGc78LMrETEYnt0RVpTRN7vpcb/zPBvuqp/lis4isuZZJPj06MHoEnLbGAbzRz
         oPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724056140; x=1724660940;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UpX4LsrqwRDqFBD8C2IBSkZVW31sWUBwFvypF0QOuuo=;
        b=udR9Ef/anNU088Pbn6gNZ8FC8WTy3IHgLgh3rKGl88DNhCzPtQqnUgUzzeoBmGIR83
         Rwi2lmlU80dyZGXLoeitLTqU7y12yFqj9aIdA2quJF7MFqzD3G2aqjRUaAvtgnF2q3m3
         YHe9STS38WKKcSFdgW1+Fg8dih3o4DBB77WiHKHgnjpSMiWNXhKpwRGhh9A4Axd4NvAN
         oXbbfiPvmRg/Yuur83Ke6ukkojqAMC5Mjt/xP0Uw7ovX3DI54i6YKshVl3nrOVRbumvD
         skog2a1avGDGsMO2bxU/hlQ/IuRb5RrGPdk2Rde+Jmx9PeQYcOMQMxdvidc8rTyJd4fK
         wZpg==
X-Forwarded-Encrypted: i=1; AJvYcCXUFUr87wOYXW26fLNNLl3dE6g9EOZo0BGOt+AItJffvhdvdO5emHCGwyo69dfPEsH2VCfwJwUNKJz0j9UDAYyEr8dSuSqNUF/bRT8=
X-Gm-Message-State: AOJu0YxWuR2mLSX6mZx6ddy1A/dMUIwh3mnuj8sBEIVRhl+e0+KMFd5J
	7DEtYOEj8cT9tI8zWvReXdZ5ZvajbABTlox6FaDDu4lYqJ+ViXodYbGe41DIBc5Tm4WrogwBr0G
	jSDYfu1BeWRSIiUoDAZcTPIoiatBNHv/GXG5FaQ==
X-Google-Smtp-Source: AGHT+IHKVi6WKmdyAQ6QyA73ge60UMveA7EfNgA9AWldj2xZheTdlekHgzFhLgWv7yt/BTmNdTQkVOzDSqv76IZiO/8=
X-Received: by 2002:a05:6102:5487:b0:495:6aeb:a0e9 with SMTP id
 ada2fe7eead31-49779881408mr11886459137.4.1724056140489; Mon, 19 Aug 2024
 01:29:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 19 Aug 2024 13:58:49 +0530
Message-ID: <CA+G9fYuFDon59=Nw6WCdgp0FanZ1oE3dCkoq71EK0Bxe6Jhe_g@mail.gmail.com>
Subject: gcc-8: mm/swapfile.c:863:40: error: array subscript 1 is above array
 bounds of 'struct list_head[1]' [-Werror=array-bounds]
To: linux-mm <linux-mm@kvack.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Kairui Song <kasong@tencent.com>, Barry Song <21cnbao@gmail.com>, Chris Li <chrisl@kernel.org>, 
	"Huang, Ying" <ying.huang@intel.com>, Hugh Dickins <hughd@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The x86 builds failed with gcc-8 due to following build warnings / errors on
Linux next-20240802 to next-20240819.

x86_64 defconfig gcc-8 build failed
x86_64 defconfig gcc-13 build pass

First seen on the next-20240802 tag.

  GOOD: next-20240730
  BAD:  next-20240802

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build errors:
--------
mm/swapfile.c: In function 'scan_swap_map_slots.constprop':
mm/swapfile.c:863:40: error: array subscript 1 is above array bounds
of 'struct list_head[1]' [-Werror=array-bounds]
   while (!list_empty(&si->frag_clusters[o])) {
                       ~~~~~~~~~~~~~~~~~^~~
mm/swapfile.c:872:43: error: array subscript 1 is above array bounds
of 'struct list_head[1]' [-Werror=array-bounds]
   while (!list_empty(&si->nonfull_clusters[o])) {
                       ~~~~~~~~~~~~~~~~~~~~^~~
In file included from include/linux/list.h:5,
                 from include/linux/wait.h:7,
                 from include/linux/wait_bit.h:8,
                 from include/linux/fs.h:6,
                 from include/linux/highmem.h:5,
                 from include/linux/bvec.h:10,
                 from include/linux/blk_types.h:10,
                 from include/linux/blkdev.h:9,
                 from mm/swapfile.c:9:
include/linux/list.h:612:18: error: array subscript 1 is above array
bounds of 'struct list_head[1]' [-Werror=array-bounds]
  list_entry((ptr)->next, type, member)
                  ^~
include/linux/container_of.h:19:26: note: in definition of macro 'container_of'
  void *__mptr = (void *)(ptr);     \
                          ^~~
include/linux/list.h:612:2: note: in expansion of macro 'list_entry'
  list_entry((ptr)->next, type, member)
  ^~~~~~~~~~
mm/swapfile.c:873:9: note: in expansion of macro 'list_first_entry'
    ci = list_first_entry(&si->nonfull_clusters[o],
         ^~~~~~~~~~~~~~~~
include/linux/list.h:612:18: error: array subscript 1 is above array
bounds of 'struct list_head[1]' [-Werror=array-bounds]
  list_entry((ptr)->next, type, member)
                  ^~
include/linux/container_of.h:19:26: note: in definition of macro 'container_of'
  void *__mptr = (void *)(ptr);     \
                          ^~~
include/linux/list.h:612:2: note: in expansion of macro 'list_entry'
  list_entry((ptr)->next, type, member)
  ^~~~~~~~~~
mm/swapfile.c:864:9: note: in expansion of macro 'list_first_entry'
    ci = list_first_entry(&si->frag_clusters[o],
         ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Steps to reproduce:
-------
# tuxmake --runtime podman --target-arch x86_64 --toolchain gcc-8
--kconfig x86_64_defconfig

Build log link,
------
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240819/testrun/24918869/suite/build/test/gcc-8-x86_64_defconfig/log

metadata:
-----
  git describe: next-20240802
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git short_log: f524a5e4dfb7 ("Add linux-next specific files for 20240802")
  config: https://storage.tuxsuite.com/public/linaro/lkft/builds/2k6wLr4UFODrd3snUDTPPevXpPY/config
  download_url:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2k6wLr4UFODrd3snUDTPPevXpPY/
  toolchain: gcc-8
  arch: x86_64

--
Linaro LKFT
https://lkft.linaro.org
