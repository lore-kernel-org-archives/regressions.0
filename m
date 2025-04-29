Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24315127E18
	for <regressions@lists.linux.dev>; Tue, 29 Apr 2025 06:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909312; cv=none; b=MtX3nuAiZYb6NpGNRUNQvKMaGryf2qZEr2EggAgxMKpY9naP9Ub9y+pylVXPg2U4NoApMKSqfHe6athv3jcvSwgA+Sny8tSUgd1LR92lGHTCpwTNXyZiXgKSBaL7pTEmVk/Vs93FY5GkEG0byEa2KK0l2WQYJP73RgTbhK0Pfbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909312; c=relaxed/simple;
	bh=9CyJ9vrui2u8M8iSVZFuwmIfqoRlB9IonBcSStjHu8I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RGm2SfB9RiTDcnTqRB5swclCOpaq9Q/Q/4rn/Rj5WnXbVC2eaowZfW4mM6BkIgkmHRKjZdFZS1itfxk7eOQyUTgQjeNgjmDk5MIQGhRXQMlbhH0BMS04xdFho1VL2cVW29pCfreoDMKeqp70dx7SZv+mNz4OcjWJ86Ad02ExGHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mRVdQImy; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mRVdQImy"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-877d7fa49e0so2011936241.2
        for <regressions@lists.linux.dev>; Mon, 28 Apr 2025 23:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745909310; x=1746514110; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sXi/SUjRC6MuKQgZypsU6mTKwVzFc0J4r/au1GEfB6U=;
        b=mRVdQImymN8/Rv/+6+x7G3YtNkzBy086UoaowpXvUrVgsX9jwsMJ70kAlLCvKPYhrD
         DBgWCySBiH4ChxqqccANiGPCA9MJaBUacbzjcB6nFHUqyp78QRpp55psVgS0Rtpn7PA6
         oQndfbYt+yZgXsQfGe1QHgufT7Z2EuwkEsHRnp6brhq+rFiJTkMVyFUjA41UsVC/tNnT
         OVqq5ABeVPliG1CKgo+zKuaXz3SUH0HliVS3ixcBCZcN0NVGQPXr1EiAhSWRVcNcqpDE
         qdj3HsEpSfoXF0TlOPEb47CNaXGYnj7rFcsKN7QZVLCegkmQdl81bDtXcXB5k8IMRW1B
         PhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745909310; x=1746514110;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sXi/SUjRC6MuKQgZypsU6mTKwVzFc0J4r/au1GEfB6U=;
        b=amDW2Gk6srEADdQxyZgjrvbhYYELcQAwNFKGlFUbSvwLbn+0t5ryt1ntldHWCDvKj6
         kJGWWT71ztJhwuGN29ivzWl5qR2TVcZiR5xZFi4st0AHNJxEf4wfGHRg99JITnb5GwBr
         VYIGXWc52HzpsUBTHxIJ6V8FIyCj9dmP8sTt5pXdhZUeUfe/etBwQ8lVejav+mEkP4Wn
         dQqc7kFNqqly6RXwZWQvwAzyz5P9i8Thwaqb+Qc6bTHIA+fOh8KaoFNSE6VPpRieYyaD
         j4lZwwBlBQD1cwFMMXNEUTAUyITX4JE2vU2KQW6o3JNkxkSF0h20K9BUn4QkhGcTt/MH
         kzOA==
X-Forwarded-Encrypted: i=1; AJvYcCWVZFGSrcBA3Pt6Fcp2W5hUKtGQKe9zYGG5d76/tnn28zG7jOSayGFILjOV0PpYHeBT6PX7qn6zb4SYGA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4zjywIRr+KdZUp5PkwWBDlhGaIWS4zANUvCKFVImN5TGN68xM
	VhgWlgKure4Tc0WdwYAy6NYbtAHtI2eIVJN/3suS3KiL7T3ryIoG43qstznu80KJ8lqB4UBiKvt
	yW+OqzF4FGkbrIGptUD6hxO/vQWOnc2yHQgUoyw==
X-Gm-Gg: ASbGncv0avQTGYbTYaaGzF9IQAoyi6KDbQ9ojKSsZbP3AUpT6UHO8X27cmpzteOwo3R
	nLZ5ki2u5aJAE1FHpH81GtjycTWXs6xvArmh1bEPUEXoKo1VIL6E6OW+4zWb2GCL4VeahI+/HNx
	ToU31ww4VASt66tBjsDlWkE2CIte5l9dfoSnwwfjKcPQp9b143D+HLlT4=
X-Google-Smtp-Source: AGHT+IE/wW4rey32KhYXnxm7YMuvinzWZGvhxBn7qZf2ls6SaJNTx93pWcEcAKsoRl631YWuZ2kxHHUmOj06rOZzMfs=
X-Received: by 2002:a05:6102:3f12:b0:4c1:71b6:6c with SMTP id
 ada2fe7eead31-4da7f52f85cmr1891727137.7.1745909309952; Mon, 28 Apr 2025
 23:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 29 Apr 2025 12:18:18 +0530
X-Gm-Features: ATxdqUFl-SyW1AweGtS7b9hyai4LUeaBQ5GoyXRjUVKMKKGjw-9Kv4VCa9Ay_TE
Message-ID: <CA+G9fYs+7-Jut2PM1Z8fXOkBaBuGt0WwTUvU=4cu2O8iQdwUYw@mail.gmail.com>
Subject: next-20250428: drivers/net/ethernet/qlogic/qede/qede_main.c error:
 field name not in record or union initializer
To: Netdev <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Regressions on arm64, s390 and riscv with allyesconfig config build failed
with gcc-13, clang-20 and clang-nightly toolchains on Linux next-20250428.

First seen on the next-20250428
 Good: next-20250424
 Bad:  next-20250428

Build regressions:
* arm64, build
* riscv, build
* s390, build
  - gcc-13-allyesconfig
  - clang-20-allyesconfig
  - clang-nightlty-allyesconfig

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: arm64 riscv s390 allyesconfig qedf_main.c field name
not in record or union initializer

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build error:
drivers/scsi/qedf/qedf_main.c:702:9: error: positional initialization
of field in 'struct' declared with 'designated_init' attribute
[-Werror=designated-init]
  702 |         {
      |         ^
drivers/scsi/qedf/qedf_main.c:702:9: note: (near initialization for
'qedf_cb_ops')
drivers/net/ethernet/qlogic/qede/qede_main.c:206:9: error: braces
around scalar initializer [-Werror]
  206 |         {
      |         ^
drivers/net/ethernet/qlogic/qede/qede_main.c:206:9: note: (near
initialization for 'qede_ll_ops.ports_update')
drivers/net/ethernet/qlogic/qede/qede_main.c:208:17: error: field name
not in record or union initializer
  208 |                 .arfs_filter_op = qede_arfs_filter_op,
      |                 ^
drivers/net/ethernet/qlogic/qede/qede_main.c:208:17: note: (near
initialization for 'qede_ll_ops.ports_update')
drivers/net/ethernet/qlogic/qede/qede_main.c:208:35: error:
initialization of 'void (*)(void *, u16,  u16)' {aka 'void (*)(void *,
short unsigned int,  short unsigned int)'} from incompatible pointer
type 'void (*)(void *, void *, u8)' {aka 'void (*)(void *, void *,
unsigned char)'} [-Werror=incompatible-pointer-types]
  208 |                 .arfs_filter_op = qede_arfs_filter_op,
      |                                   ^~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/qlogic/qede/qede_main.c:210:17: note: (near
initialization for 'qede_ll_ops.ports_update')
drivers/net/ethernet/qlogic/qede/qede_main.c:210:32: error: excess
elements in scalar initializer [-Werror]
  210 |                 .link_update = qede_link_update,
      |                                ^~~~~~~~~~~~~~~~

## Source
* Kernel version: next-20250428
* Git tree:  https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 33035b665157558254b3c21c3f049fd728e72368
* Git describe: next-20250428
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250428/
* Architectures: arm64 s390 riscv
* Toolchains: gcc-13, clang-20, clang-nightly
* Kconfigs: allyesconfig

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250428/testrun/28249321/suite/build/test/gcc-13-allyesconfig/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250428/testrun/28249321/suite/build/test/gcc-13-allyesconfig/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250428/testrun/28249321/suite/build/test/gcc-13-allyesconfig/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2wMJhRaVybixSxTSIyLTw8JqNxe/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2wMJhRaVybixSxTSIyLTw8JqNxe/config

## Steps to reproduce on arm64
 # tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
--kconfig allyesconfig

--
Linaro LKFT
https://lkft.linaro.org
