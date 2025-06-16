Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01480288C3F
	for <regressions@lists.linux.dev>; Mon, 16 Jun 2025 17:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750095151; cv=none; b=VwupfO6fd1uNChZLnrWeHqzuZU0o7f/Egx/yMV07w/aWEccaZQ0doC8zDmdCNtPuNPyEIoz2oIEylRnnJJlimIjc8cGIr8cmDaOuSF2uAjjQXMwLGZe9wH7qPAxnSd7+UHJc3v2mYw9IZ6RRP3E7wDnB7ueas+YZM78VRCHgc30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750095151; c=relaxed/simple;
	bh=53oFqP2M2cmobE/ugaCFp+IPUxUA0YjUIe8mxp0VACQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HJf0ov1R51yrix9v+pQfOGNXxR9F2a/PvNogKbVyozWuOOMZ0llgxKzkxDWjKMxzyeyukOHFWDcVfPqy6qtEpSl4vBWP1ypuKx+kEW1I2pnRd3xBzsrzargYNDb8a5rbqJVypiuBestMrH6o5d0YRxdEbIOfrN/e22Vgc30h9B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sDes+0DH; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sDes+0DH"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-87f1b3a3e7bso545917241.1
        for <regressions@lists.linux.dev>; Mon, 16 Jun 2025 10:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750095146; x=1750699946; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nOL9B0ArRDJ2HgV9zgRwhBeaYRAdymIm6FiPuyILxyE=;
        b=sDes+0DHD0O2C5PMek66mxXfhFn7yZSz4ElEkwWh0L301Frf2aKjj10IJYS+3LL5pk
         4gTBA0o1IsYchY4T2qnG9YhJyHzKCKxP2sW6OtXbcCkoFUhq8Wm8TBEm9mptCr19pnWy
         ar56sATo9IBqx4kXklISIn7S4ddCRa0n94+6PmlgE6+bTM/mJ1nqKQJgRQaM1+XoQOVt
         2z7UJ0W2zQw6QU9lld7cZFm6ttht1ctlkiF/TirgQJa+VsxmU74CUVuhOZ7yC0rWSI8e
         EE98VdfHEamIejtFg3cWUJ8HIXTWTYQdA/xuwMZZrjdy9HW6Alew+YZYWj5BhzPwHTHS
         j5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750095146; x=1750699946;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nOL9B0ArRDJ2HgV9zgRwhBeaYRAdymIm6FiPuyILxyE=;
        b=SCxMFp6n20m5w/qtLdTATVbMxKuM77Cnhw+MH0WPNdMiCnIMTAIRR/rwsD4+yJLrCv
         8ZPIHuo1KKpLBOW+iUfzmanzw2hjPMX5QRvJd5dimQ6Db8lj6eCtqEnuB+pPRgeGlA+f
         Go2VPQpOK0f/toce/8PnvsSHCy4iPChyU8sroIPsFfn3PExX586UC8JoSyLUpYGQ264r
         v1Yf18CVjpHRxT+M3SFiY8I4/3nYvNC5sCnkuiN7SIcRxROtcnUJvWELURdnDgjvwqwM
         JZcm8bY0ir/34Xu7caBFQVTDP4lxIgRVO9+GAK8flfHDbclaAXnXtMgiqN1JZzCtjVF5
         g3ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWwb5BN9I8L4S5jglpOBxNmy42EsYwstBxSzKtMwuqSDsCgFNcQfjscAiz8b1SGlfP15jRBDbeudUHabQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOj8Fu0OhgNq/MGhAT9IEg2iKjAUcYwbaaM6TGzLnFmMUSx8Ra
	zwSyUL7lKm2Auspgt0SmRi/lUH0FV1oVcv5g3BVgc5xJq06BFqHa7oaHntn6Z2Rh5+kTsTPEjVG
	ucrQ5n+tHtT3F3TBQj501XQHboR6Eyepup3e534QIsg==
X-Gm-Gg: ASbGncvMI8zZBv0u1sUixvcLHANNUJPPRCcRiCwIyYDJOugmR1ybq0aSawP3RXE4Lcn
	J8ygzxjrmCwVzWNRt7FkmglIW0nvl8tCYboodPHm/EhR8Otj7vLOGvrNvd9hNXTbeYHxTOj7+ER
	ZKKHc0bFp6M572URI9l/P3jJaVv/fOrLHRtVleW3iNyrIKQw8LGhpSfN/NaKxWS+9Gif5a1U+zc
	3kR
X-Google-Smtp-Source: AGHT+IHDbuGGx7FLDHd6SFF50nhpSRXNoX9Bm2Q2spE2ZR4tp7m+F74+pbpAxOfBAdUothMPOUPzPvXxKAsnmN6gtsw=
X-Received: by 2002:a05:6122:8c19:b0:516:18cd:c1fc with SMTP id
 71dfb90a1353d-531498af39fmr5799138e0c.8.1750095145850; Mon, 16 Jun 2025
 10:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 16 Jun 2025 23:02:14 +0530
X-Gm-Features: AX0GCFtIN6D4edi0dQDj2abPdHOYRSZcQmAsmVEcy9cnxJDmABW66gpRHqdgLtw
Message-ID: <CA+G9fYssELHcYKwgGNBMLrfeKZa9swGdLrH7gxqzd4P0kaOiZg@mail.gmail.com>
Subject: clang: selftests/mm gup_longterm error while loading shared libraries
 liburing.so.2 cannot open shared object file No such file or directory
To: clang-built-linux <llvm@lists.linux.dev>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka <vbabka@suse.cz>, Shuah Khan <shuah@kernel.org>, 
	Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>, lorenzo.stoakes@oracle.com, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, jackmanb@google.com
Content-Type: text/plain; charset="UTF-8"

The following test regressions noticed while running selftests/mm gup_longterm
test cases on Dragonboard-845c, Dragonboard-410c, rock-pi-4, qemu-arm64 and
qemu-x86_64 this build have required selftest/mm/configs included and toolchain
is clang nightly.

Regressions found on Dragonboard-845c, Dragonboard-410c, rock-pi-4,
qemu-arm64 and qemu-x86_64
  -  selftests mm gup_longterm fails

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Test regression: selftests mm gup_longterm error while loading shared
libraries liburing.so.2 cannot open shared object file No such file or
directory
Test regression: selftests mm cow error while loading shared libraries
liburing.so.2 cannot open shared object file No such file or directory
Test regression: selftests mm mlock-random-test exit=139
Test regression: selftests mm pagemap_ioctl exit=1
Test regression: selftests mm guard_regions file hole_punch

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test log
Linux version 6.15.0-next-20250606 (tuxmake@tuxmake) (Debian clang
version 21.0.0 (++20250602112323+c5a56f74fef7-1~exp1~20250602112342.1487),
Debian LLD 21.0.0) #1 SMP PREEMPT @1749190532

running ./gup_longterm
----------------------
./gup_longterm: error while loading shared libraries: liburing.so.2:
cannot open shared object file: No such file or directory
[FAIL]
 not ok 14 gup_longterm # exit=127

./cow: error while loading shared libraries: liburing.so.2: cannot
open shared object file: No such file or directory
[FAIL]
not ok 50 cow # exit=127

running ./mlock-random-test
---------------------------
TAP version 13
1..2
[  311.408456] traps: mlock-random-te[21661] general protection fault
ip:7f63210dbf0f sp:7ffdff6fca28 error:0 in
libc.so.6[adf0f,7f6321056000+165000]
[FAIL]
not ok 23 mlock-random-test # exit=139

running ./pagemap_ioctl

...
ok 53 Huge page testing: only two middle pages dirty
ok 54 # SKIP Hugetlb shmem testing: all new pages must not be written (dirty)
ok 55 # SKIP Hugetlb shmem testing: all pages must be written (dirty)
ok 56 # SKIP Hugetlb shmem testing: all pages dirty other than first
and the last one
ok 57 # SKIP Hugetlb shmem testing: PM_SCAN_WP_MATCHING | PM_SCAN_CHECK_WPASYNC
ok 58 # SKIP Hugetlb shmem testing: only middle page dirty
ok 59 # SKIP Hugetlb shmem testing: only two middle pages dirty
ok 60 # SKIP Hugetlb mem testing: all new pages must not be written (dirty)
ok 61 # SKIP Hugetlb mem testing: all pages must be written (dirty)
ok 62 # SKIP Hugetlb mem testing: all pages dirty other than first and
the last one
ok 63 # SKIP Hugetlb mem testing: PM_SCAN_WP_MATCHING |
PM_SCAN_CHECK_WPASYNC[  241.731600] run_vmtests.sh (456): drop_caches:
3
ok 64 # SKIP Hugetlb mem testing: only middle page dirty
ok 65 # SKIP Hugetlb mem testing: only two middle pages dirty
Bail out! uffd-test creation failed 12 Cannot allocate memory
12 skipped test(s) detected. Consider enabling relevant config options
to improve coverage.
Planned tests != run tests (115 != 65)
Totals: pass:53 fail:0 xfail:0 xpass:0 skip:12 error:0
[FAIL]
# not ok 48 pagemap_ioctl # exit=1

running ./guard-regions
...
RUN           guard_regions.file.hole_punch ...
guard-regions.c:1905:hole_punch:Expected madvise(&ptr[3 * page_size],
4 * page_size, MADV_REMOVE) (-1) == 0 (0)
hole_punch: Test terminated by assertion
         FAIL  guard_regions.file.hole_punch
not ok 80 guard_regions.file.hole_punch


## Source
* Kernel version: 6.16.0-rc2
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 050f8ad7b58d9079455af171ac279c4b9b828c11
* Git describe: next-20250616
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250616/
* Architectures: arm64, x86_64
* Test environments: Dragonboard-845c, Dragonboard-410c,  rock-pi-4,
qemu-arm64, qemu-x86_64 and x86
* Toolchains: clang nightly
* Kconfigs: selftest/mm/config+defconfig+

## Test
* Test log: https://qa-reports.linaro.org/api/testruns/28766026/log_file/
* Test log 2: https://qa-reports.linaro.org/api/testruns/28743077/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250616/kselftest-mm/mm_run_vmtests_sh_gup_longterm/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0viPHafKAe0u89drIv5fcwu2/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0viPHafKAe0u89drIv5fcwu2/config


## Steps to reproduce
  - tuxrun \
   --runtime podman \
   --device qemu-x86_64 \
   --boot-args rw  \
   --kernel https://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0wmVl0eHb9koWyQYC7myXjpX/bzImage
\
   --rootfs https://storage.tuxboot.com/debian/20250605/trixie/amd64/rootfs.ext4.xz
\
   --modules https://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0wmVl0eHb9koWyQYC7myXjpX/modules.tar.xz
/usr/ \
   --parameters MODULES_PATH=/usr/ \
   --parameters
SQUAD_URL=https://qa-reports.linaro.org//api/submit/lkft/linux-next-master/next-20250616/env/
\
   --parameters SKIPFILE=skipfile-lkft.yaml \
   --parameters
KSELFTEST=https://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0wmVl0eHb9koWyQYC7myXjpX/kselftest.tar.xz
\
   --image docker.io/linaro/tuxrun-dispatcher:v1.2.2 \
   --tests kselftest-mm \
   --timeouts boot=15

--
Linaro LKFT
https://lkft.linaro.org
