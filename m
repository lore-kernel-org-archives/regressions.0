Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7855A2C08CF
	for <regressions@lists.linux.dev>; Tue, 30 Sep 2025 10:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759228804; cv=none; b=W26cKEDn9u7vKZBxMnkHch3JvLKudPy83520BHA565p61yM7+5rKtYX0q0GfG+vV6UOfF/BJaUA1kpfHav6SnIryX8eEZDZ7VxNtqoLhve2HrY31dwI0Ouq6y8h4BmlOiwGKN1Rf4DiP3xNHDKcbTfwnKDzU5eH0ajV1PSK5uo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759228804; c=relaxed/simple;
	bh=madMCCpXf9roOD5eZkqbrUzSQr5guKNIA3QTRpCiy38=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GijcNXRLL39kfxhfJC0a0YkNaRPNN7VeL2xosHDxTOCxwTJJGSQUQRI6+RIybsFLnp2OmAPZNSVGCfOJenHdb+k1bZBLGlYyXOfAejIKdUAYuouAfBZS+vmKABTuaxUwbsFKCHYZyrO5d1roB6fzRA7NEly4vcocOXyhZRu3+/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fqcOPedF; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fqcOPedF"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b55517e74e3so6055929a12.2
        for <regressions@lists.linux.dev>; Tue, 30 Sep 2025 03:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759228801; x=1759833601; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tc0zQApF0WO4ZgUj5cHoP64Ut3mPNC7SB7c0om1scqU=;
        b=fqcOPedF6UrDP7l1WjoO3S/+q57Czb7kIYWSjrA/nvY0+O5t3pgZp/zlc8Xyvq4m2u
         FC7vZyuxArURgc7XWdB2+gjlgXGDdJbNSv3lrRiG+rGfdgDFxzwm6W5ZiMrkLvrea2wZ
         lohi4ByZlZzGQACqLY7n+9fCip4uEhB8ef93m11lwXhQ/O0kv5YCpnLe7lxQ+1CT/fOa
         yc4DT7dLndSx5E/u0NHi853bCiJBzhEEmbfI75r5M0IjrqpxsoT6AfhUYUlrX4mP/I5Y
         PhIfbUF6yMqVf8VfdgO5veQjpRcKaA5UWyIZP3AWiJY94eZYUSMg/B2stI3LW8tAIIHd
         G3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759228801; x=1759833601;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tc0zQApF0WO4ZgUj5cHoP64Ut3mPNC7SB7c0om1scqU=;
        b=TZPGO6LDRwH2MeolVfGgRK2bsiQ+XrVxosiWvL5u5cHztlRe3i3mWhkCJ91+0TTcDJ
         NV/sun0SfTI8JOiOr8Ezy+4HppXzPX6l6MS/tKDNFsXHwfYGwOZ9z2X808Dvab8MS5yy
         YymyLlHZhdkyClCJAECnidjy0gRNHbD82dhaYTwvBTX3cS3waq7M50to5Tgf3KBwak6J
         q1SH+jG46vbP0HjoIMWWAIUL4fOGe01lA7eoxfqfDJyfhT+IrTYC/E0yBDqYUZBBf1MY
         v0nJjh/scek8C0xk2wCaOfwwxSWYufW6AMAPtXiSdxbDb35K+rz/860uc1SIa2PVAl2r
         q5Zg==
X-Forwarded-Encrypted: i=1; AJvYcCX21gf645eBicXpsoBSbOYZpySP1+VObhOQJKGCvNUHkG3jnWu10VToP3yqqsSAekbpnRhiBvJ5BRgGBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4Y4ANAbcM0GeEzHzd98AHFHrgH/AmxcFJPflztGJ4KuveAIDQ
	PDf6EGb3jTUKfumRqy85R7t3SQ0RArUvLO3hQCQZXPebYGSL79UjsqxZFp69MdCuqtLcvgd0FwU
	ia9d1k4K+sYeoQ+VUVyuSRO1RBcplgyDZMVS5wCzfJw==
X-Gm-Gg: ASbGncugbapwkXDd9U5/DF6DzghIUY3eYLqfYS7ICvo8g8NOLsUBDDQBfuxPBToPkaW
	k5STb4brxTh2u+fO7ZagW2S0n1ADcgHjXHszNMdrZAer+7msF21864ZbMUhpZzdBMy+e0T/9uqL
	v4aXzSQYNIWGRFmkbLeMjdjiUss+kgK9tkl6zsWafkISjvCUvF+TtzbFYp+7ZbCWplCd5ppoT2C
	hnhcFQFHCWiT88Y84bwgbnlyNZCEIq/d+sAr7qfhu4jRMxyqKUFMXD40bFksbT4KSVEEQ4/9TGM
	DxDEeyydbMlHiVh1lG9gAE5wuo6iqg==
X-Google-Smtp-Source: AGHT+IHPY6eK3MHywKJURzS/I0UrL9t8viPGr6htqx4ToAI+8mmTLnKAaeTRI9hZkLb5EMHh5z7FlYyTqvUNFKADuYQ=
X-Received: by 2002:a17:902:d58d:b0:24e:593b:d107 with SMTP id
 d9443c01a7336-27ed4a5a856mr224706895ad.32.1759228801555; Tue, 30 Sep 2025
 03:40:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 30 Sep 2025 16:09:50 +0530
X-Gm-Features: AS18NWBzICskyp2rABk9ODkH4ArO_EhP6FnFBEP1dKyBVps0whfUGZOR_aFNgW8
Message-ID: <CA+G9fYtnXeG6oVrq+5v70sE2W7Wws_zcc63VaXZjy1b1O1S-FQ@mail.gmail.com>
Subject: LTP: swapon/off: 16K and 64K page size libswap.c:230: TFAIL: swapon()
 on fuse failed: EINVAL (22)
To: linux-fsdevel@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Joanne Koong <joannelkoong@gmail.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	Miklos Szeredi <mszeredi@redhat.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

LTP syscalls swapon01, swapon02, swapon03, swapoff01 and swapoff02 test failing
on 16K and 64K page arm64 devices and passed with default 4K page size.

These failures are noticed on Linux next and mainline master (v6.17).

This test failed on 16K page size builds and 64K page size builds.
 * CONFIG_ARM64_64K_PAGES=y
 * CONFIG_ARM64_16K_PAGES=y

First seen on next-20250821
Good: next-20250820
Bad: next-20250821 ..next-20250929

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Test regression: LTP swapon/off 16K and 64K page size LTP
libswap.c:230: TFAIL: swapon() on fuse failed: EINVAL (22)

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Anders, bisected this on the Linux next and found the,
# first bad commit:
  [bd24d2108e9c8459d2c9f3d6d910b0053887df57]
  fuse: fix fuseblk i_blkbits for iomap partial writes

## Test logs
### swapon01

libswap.c:230: TFAIL: swapon() on fuse failed: EINVAL (22)
swapon01.c:39: TINFO: create a swapfile size of 128 megabytes (MB)
swapon01.c:25: TFAIL: tst_syscall(__NR_swapon, SWAP_FILE, 0) failed: EINVAL (22)

### swapon02

Windows will not be able to boot from this device.
tst_test.c:1229: TINFO: Mounting /dev/loop0 to
/tmp/LTP_swaybkEDa/mntpoint fstyp=ntfs flags=0
tst_test.c:1229: TINFO: Trying FUSE...
libswap.c:198: TINFO: create a swapfile size of 1 megabytes (MB)
tst_ioctl.c:26: TINFO: FIBMAP ioctl is supported
libswap.c:230: TFAIL: swapon() on fuse failed: EINVAL (22)
swapon02.c:52: TINFO: create a swapfile size of 1 megabytes (MB)
swapon02.c:53: TINFO: create a swapfile size of 1 megabytes (MB)
swapon02.c:56: TWARN: swapon(alreadyused) failed: EINVAL (22)
swapon02.c:73: TPASS: swapon(2) fail with Path does not exist : ENOENT (2)
swapon02.c:73: TPASS: swapon(2) fail with Invalid path : EINVAL (22)
swapon02.c:73: TPASS: swapon(2) fail with Permission denied : EPERM (1)
swapon02.c:73: TFAIL: swapon(2) fail with File already used expected
EBUSY: EINVAL (22)

### swapon03

tst_ioctl.c:26: TINFO: FIBMAP ioctl is supported
libswap.c:230: TFAIL: swapon() on fuse failed: EINVAL (22)
tst_kconfig.c:88: TINFO: Parsing kernel config '/proc/config.gz'
tst_kconfig.c:88: TINFO: Parsing kernel config '/proc/config.gz'
tst_kconfig.c:88: TINFO: Parsing kernel config '/proc/config.gz'
tst_kconfig.c:88: TINFO: Parsing kernel config '/proc/config.gz'
swapon03.c:51: TINFO: create a swapfile size of 1 megabytes (MB)
swapon03.c:54: TFAIL: swapon(filename, 0) failed: EINVAL (22)
swapon03.c:51: TINFO: create a swapfile size of 1 megabytes (MB)
swapon03.c:54: TFAIL: swapon(filename, 0) failed: EINVAL (22)
swapon03.c:51: TINFO: create a swapfile size of 1 megabytes (MB)
swapon03.c:54: TFAIL: swapon(filename, 0) failed: EINVAL (22)

### swapoff01

libswap.c:230: TFAIL: swapon() on fuse failed: EINVAL (22)
swapoff01.c:44: TINFO: create a swapfile with 65536 block numbers
swapoff01.c:44: TCONF: Insufficient disk space to create swap file
tst_test.c:1888: TINFO: === Testing on tmpfs ===
tst_test.c:1217: TINFO: Skipping mkfs for TMPFS filesystem
tst_test.c:1193: TINFO: Limiting tmpfs size to 350MB
tst_test.c:1229: TINFO: Mounting ltp-tmpfs to
/tmp/LTP_swahnekXb/mntpoint fstyp=tmpfs flags=0
libswap.c:198: TINFO: create a swapfile size of 1 megabytes (MB)
tst_ioctl.c:21: TINFO: FIBMAP ioctl is NOT supported: EINVAL (22)
libswap.c:228: TCONF: Swapfile on tmpfs not implemented
Summary:
passed   0
failed   1
broken   0
skipped  7

### swapoff02

st_ioctl.c:26: TINFO: FIBMAP ioctl is supported
libswap.c:230: TFAIL: swapon() on fuse failed: EINVAL (22)
swapoff02.c:88: TINFO: create a swapfile size of 1 megabytes (MB)
swapoff02.c:53: TPASS: swapoff(2) expected failure; Got errno - ENOENT
: path does not exist
swapoff02.c:53: TPASS: swapoff(2) expected failure; Got errno - EINVAL
: Invalid file
swapoff02.c:53: TPASS: swapoff(2) expected failure; Got errno - EPERM
: Permission denied
tst_test.c:1888: TINFO: === Testing on tmpfs ===
tst_test.c:1217: TINFO: Skipping mkfs for TMPFS filesystem
tst_test.c:1193: TINFO: Limiting tmpfs size to 32MB
tst_test.c:1229: TINFO: Mounting ltp-tmpfs to
/tmp/LTP_swaXbUs2F/mntpoint fstyp=tmpfs flags=0
libswap.c:198: TINFO: create a swapfile size of 1 megabytes (MB)
tst_ioctl.c:21: TINFO: FIBMAP ioctl is NOT supported: EINVAL (22)
libswap.c:228: TCONF: Swapfile on tmpfs not implemented
Summary:
passed   18
failed   1
broken   0
skipped  1

Here I am sharing mainline tree and logs.

## Source
* Kernel version: 6.17.0
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
* Git describe: v6.17
* Git commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
* Architectures: arm64
* Toolchains: gcc-13
* Kconfigs: lkftconfig+CONFIG_ARM64_64K_PAGES=y
* Kconfigs: lkftconfig+CONFIG_ARM64_16K_PAGES=y

## Build
* Test log arm64: https://qa-reports.linaro.org/api/testruns/30048876/log_file/
* Test log LAVA: https://lkft.validation.linaro.org/scheduler/job/8468115#L28598
* Test details:
https://regressions.linaro.org/lkft/linux-mainline-master/v6.17/ltp-syscalls/swapon03/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/33LezR2rctMs0EwZpyIDqRhU7s4
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/33Ley5LZz1crQhBtb1KXJMuS2GB/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/33Ley5LZz1crQhBtb1KXJMuS2GB/config

--
Linaro LKFT
