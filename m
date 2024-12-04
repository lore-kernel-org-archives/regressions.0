Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48252BE5E
	for <regressions@lists.linux.dev>; Wed,  4 Dec 2024 09:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733305134; cv=none; b=F42fgIjgsipRVeOym80mKb5pdeSKxo0EFdIJrqdyvQ2KWZGkOrPw50zKSwW/gjkmDSKCmYBc8bojB78ZIkmc8kpXPS80zd5N9xZO6SsNDkakrtavhyK7SPdP7kIcBYYs3kdyrmQ2bHTsPU18h7ChYYpkZN4y2R7WwXBkDVVj7T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733305134; c=relaxed/simple;
	bh=cVgZS49s0jK7LoEEPdTFlt626ZfF0wPZnTB0sTR630c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=l5iIW+flTQfKIipbsRi+nPsPOSdV5aE/kC932IZYLmzS6VXInHfTac0ysn8eJtyYXJtSHHvWISTTzdNm1eqaR4NlzC3ksOkjPHviUdHh+/I0idtyw/5fgU5ne1RkLziTQvm6sS6UQtb0/LiQ8NHyo7vDhEHBQ9wIetyGhOuf8pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fe/FShD8; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fe/FShD8"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4af60a0478fso389344137.1
        for <regressions@lists.linux.dev>; Wed, 04 Dec 2024 01:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733305131; x=1733909931; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cWUJzDJGc7Svmrjo2Yx287BIq8DOoijbqXVcFkV/Th8=;
        b=fe/FShD8ZNJzR9yHlkT/daQSIRt6dzApulZfdUlGiBkgpjFNe7lIBkSTF2u1FJSyAq
         J3QyUUqUjZNvkzGC6A33/j3qublrQ5oLDfXhvG/e+ke+NJILBdRVdHY+eZN7j9TQEbsl
         P0/K2dmv3ljQVvAE5PU4KeiGOrob/TEKz/jyTeH94fdRSrnnp8LHbv+NfoBIv6NGuO/t
         gNbCvAXx8Opy8cMvSxX2gFPCL2fmFUNXBV0bKHFuDc5xTONVnBQkt2wwXpqB+HhD2b7/
         34zrQjHXjdxvwXoF88XMNcoQj+XX/1Qe6NUkRFmJjiUXpxohF809UZ/EhJWB/o77AL5D
         QOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733305131; x=1733909931;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cWUJzDJGc7Svmrjo2Yx287BIq8DOoijbqXVcFkV/Th8=;
        b=fGI0FG8UA7apfghVfV/ibo39YcEoVgGqT1J8L5H6SYpVgSb1TVIJN9K7Q0PanR+jaU
         6v/9QJ9tnFPBx0Ybf1hS++y4S1fiHJT/SQo2uZ7G80eX2cGgRecOf3HqhkzlMdG69CA6
         EGkk8vltqtX73gvh5JRI2cT32ePFMNP8VwjihzwIRRhakjcn/KzuaGfLymN+J+nl3xRB
         ao83w0SFQ/YhDnKMwqnEqfsaDBVfDt+Fmb5RJtTN1FaLiHZiNK++3szg3WScIu3YvSnV
         t46DsxA3fV6I4ODjd46eVpuKjurriGoyb4/IpO2QloWR0yiwlVVg4AucW7BnoaY9Rc7q
         UHoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNjc6dpmwHTKBnYoEMVAhwpzTb8OKLytvv2oaPQnOM/pV/fRwmkFk623KaUpaPpEqEEgPqLP6DAYyfLw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAijaXthW9ct4MFUCzewb1gDaNbqmClxYRRUOFQz0dWZi38Gj0
	uW1OPW08fTOdffuf/a4B1NIRvuJga/Xiz7IiG1/LJYyGy4/uZr2bPxbnr0e6mYybHC1Cc8WezKM
	ovOxExWM1DJsvTwfHpSY6+/WVjfLNjaRB3ErC4Q==
X-Gm-Gg: ASbGncu9NR1kLXwqt2QO2qINV8rrMXmsD66dGeSWs5fypnotDKaxfFPrqUW5GFGMhEv
	U9qBqwVqXF1n3zUwnpkQ41znjXbtp1ZM8
X-Google-Smtp-Source: AGHT+IHa2s2KZFVXgBuDE21MW01ekjk63BnpZQJJFVpTdT6Md53yNFIsgwBWlwO6BnTMW3wblvbpS4cjY/IyxSO907Y=
X-Received: by 2002:a05:6102:945:b0:4af:1614:858f with SMTP id
 ada2fe7eead31-4af98869826mr5567377137.12.1733305131087; Wed, 04 Dec 2024
 01:38:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 4 Dec 2024 15:08:40 +0530
Message-ID: <CA+G9fYv4tUvUj1+rv5AU98QT9P8-RYVTkLAc-fCbLvy3wLtpJw@mail.gmail.com>
Subject: next-20241203: LTP syscalls: name_to_handle_at01 and
 open_by_handle_at01 failed
To: open list <linux-kernel@vger.kernel.org>, LTP List <ltp@lists.linux.it>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Benjamin Copeland <benjamin.copeland@linaro.org>, chrubis <chrubis@suse.cz>
Content-Type: text/plain; charset="UTF-8"

The following LTP syscalls name_to_handle_at01 and open_by_handle_at01
/ 02 tests
failed on the Linux next-20241203 tag.

First seen on Linux next-20241204 tag
GOOD: Linux next-20241128 tag
BAD: Linux next-20241203 tag

List of device :
  - juno-r2 - arm64
  - juno-r2-compat
  - qemu-arm64
  - qemu-arm64-compat
  - qemu-armv7
  - qemu-riscv64
  - qemu-x86_64
  - qemu-x86_64-compat
  - x15 - arm
  - x86_64
  - x86-compat

ltp-syscalls:
    * open_by_handle_at01
    * open_by_handle_at02
    * name_to_handle_at01

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Test failed log:
=================
tst_buffers.c:57: TINFO: Test is using guarded buffers
name_to_handle_at01.c:102: TPASS: name_to_handle_at() passed (0)
name_to_handle_at01.c:98: TBROK: fstat(1,0x7fffda449ce0) failed: EBADF (9)

Summary:
passed   1
failed   0
broken   1

tst_tmpdir.c:316: TINFO: Using /scratch/ltp-B0Mf6pVtaR/LTP_opehXJa6X
as tmpdir (ext2/ext3/ext4 filesystem)
tst_test.c:1860: TINFO: LTP version: 20240930
tst_test.c:1864: TINFO: Tested kernel: 6.13.0-rc1-next-20241203 #1 SMP
PREEMPT_DYNAMIC @1733269464 x86_64
tst_test.c:1703: TINFO: Timeout per run is 0h 02m 30s
tst_buffers.c:57: TINFO: Test is using guarded buffers
open_by_handle_at01.c:101: TPASS: open_by_handle_at() passed (0)
open_by_handle_at01.c:97: TBROK: fstat(1,0x7fff409f94e0) failed: EBADF (9)

Summary:
passed   1
failed   0
broken   1
skipped  0
warnings 0
tst_tmpdir.c:316: TINFO: Using /scratch/ltp-B0Mf6pVtaR/LTP_opeN4blFw
as tmpdir (ext2/ext3/ext4 filesystem)
tst_test.c:1860: TINFO: LTP version: 20240930
tst_test.c:1864: TINFO: Tested kernel: 6.13.0-rc1-next-20241203 #1 SMP
PREEMPT_DYNAMIC @1733269464 x86_64
tst_test.c:1703: TINFO: Timeout per run is 0h 02m 30s
tst_buffers.c:57: TINFO: Test is using guarded buffers
open_by_handle_at02.c:98: TPASS: invalid-dfd: open_by_handle_at()
failed as expected: EBADF (9)
open_by_handle_at02.c:86: TFAIL: stale-dfd: open_by_handle_at() passed
unexpectedly
open_by_handle_at02.c:85: TBROK: close(1) failed: EBADF (9)

Summary:
passed   1
failed   1

Links:
---
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2pjAOWmHmfmcNEt4XL6h7GdVCZf/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241203/testrun/26192368/suite/ltp-syscalls/tests/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241203/testrun/26192368/suite/ltp-syscalls/test/name_to_handle_at01/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241203/testrun/26192368/suite/ltp-syscalls/test/name_to_handle_at01/details/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241203/testrun/26188858/suite/ltp-syscalls/test/open_by_handle_at02/history/

Steps to reproduce:
------------
- tuxmake \
        --runtime podman \
        --target-arch arm64 \
        --toolchain gcc-13 \
        --kconfig
https://storage.tuxsuite.com/public/linaro/lkft/builds/2pjAOWmHmfmcNEt4XL6h7GdVCZf/config

metadata:
----
  git describe: 6.13.0-rc1-next-20241203
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: c245a7a79602ccbee780c004c1e4abcda66aec32
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2pjAOWmHmfmcNEt4XL6h7GdVCZf/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2pjAOWmHmfmcNEt4XL6h7GdVCZf/
  toolchain: gcc-13
  config: gcc-13-defconfig-lkftconfig
  arch: arm64

--
Linaro LKFT
https://lkft.linaro.org
