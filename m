Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05EE30C354
	for <regressions@lists.linux.dev>; Thu, 11 Sep 2025 10:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757587118; cv=none; b=Y5CY4Mbd4GZ0TL9vW5pc6SZ0Qqvg8gdflrQL+0BYVgn+PAvEyUqd+wGcRnQXfRZ7Rwb8ZKCCwa3dxR8MYS0ltf/mAIl/UgfwvBwcWjyvQp0ErDXbFBWGkntWYrV67nZS2QlHecdC2dXjQh6qAbD3x4bQrY8dXedU8aFJT6tRx4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757587118; c=relaxed/simple;
	bh=PzZndjRhCyfeDaH3rPUOnP5JNre8OuaxnyLSwSi5YvI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZGj/tCqMWIx6EO5ovJXInz6Juk/kVpnOtFy2CmzGBX/qiVsMuMS0VaCmEzx/rNzCpmtGFJRmSO48m8HLwdjNsGscE+x3kiB7W+FLglabAsitXPCbXvQ0akhhawnbqJpr8kWXk9RpWQpbTjeMTwRU40ehtT+XdgxY8AYleiyjKKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wdIWSOvk; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wdIWSOvk"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so486478b3a.0
        for <regressions@lists.linux.dev>; Thu, 11 Sep 2025 03:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757587116; x=1758191916; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hwCf+x6+iQDwlYTBOswpM6ZU+Uqffi/8oPlDvFPRj5I=;
        b=wdIWSOvkyMmUELdlTEp9yDgArHsAWkn2nCrC7hv/GCaryGlGm5UohzFd9OUqShCp/D
         ySGv4Qf/0Ir0l64iOT7lnrpN6qE+EjSZ+9JQc5Ncp9kYTumJT7BnzmgoP+PvsT/qGyPL
         Naj8DDapKdT5/2d/4FmjnRSZesHgau0rJD3/5e1nUQhR5xa2uJysD++gigQxznDncaHX
         2fyNue854+q9TEuRiT6DtdLXDaiWz9F4t3uhfTtMMG+nkevcDs+s/O+2UBNpXAtmpjjm
         PasFkwC6M95My8gplMxMdUH/Ec6fIE680qYU5GzSe/YerSKdCR2IrAxkelguuMDSS5KV
         P5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757587116; x=1758191916;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hwCf+x6+iQDwlYTBOswpM6ZU+Uqffi/8oPlDvFPRj5I=;
        b=v6rrdTqCYPwMiW5+THO9fTQSXn6ebHmYn9tJf27zpcuH0l02vt4wUTuwdrR63TNtAj
         2K5fRDrhMIAaVEibxjjuLaAfw83xeZpsonZjISVHDUDDh1bO92bT6hr0OCA5fANed0lj
         YVWaR/wd0PUBTrnguz3inSdWxo8B35TmE2eXJKerRjuoh0IvlboPa+3vst9Sb6YT5irg
         2w5LlK58A2UDZKy+wjv07go98zMnWvdJfL1zyFrqaMhl6L8rYgArs+Irxw0XYSNO8HDr
         Av3yWqGV32XCPxPF7GP7V6/61Qk/6IDh/h+9bMwiNI8OnL3QeoVe3WN+rQM9sAWQOPCt
         5cYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb/v6iAbEBYEBP4OfuvKHNxchXEGR4aCbp2hVILXB+PpFUGP1DbEA/+EbLNwIyByMXcQBPrF0Ok28Aiw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOdTc1VqlzRXkB7e5pL/jGaXC8km+m3/eviWIuZkat5cRAiLxg
	L0FYdAAQHmRN05MR2AsPKfir7OygRu1FBKcwnY6QnScdhBBFhnSf3wMjPye8/XTiWE+5TpMbudC
	R7t97Fssixx6pCpz11m3BKJvTUXkYQk3ozFoOOmg7avHEx5tH9HvGa58=
X-Gm-Gg: ASbGncvLHBhjm4mED2k8tgXzM+8lozvf+SsdEEJ8LRbHQ8asOH8Nhl+cz3GRYbxo9O6
	oOaPQkW8aa4LHC9OFbs9MzHzPG9SjRWx1CJX51ofWv9uKKTB5MgfHah2la3HY/TeSvzgJvx5IsL
	+H8zaZw+Envp6ix/jycLvkB4X1G9TMLZcki7KPnanuLHnj8bg1KnJQ9WbAwOl8IM0xE4nwOtYTl
	8IkZpaoWNeoGgmvzXEB8nn4V9/o6B6VfEm5quKKtcYi/0CdLKOsU6J8kxhQBbntr0mpb7XtHGkN
	VuGtFFc=
X-Google-Smtp-Source: AGHT+IFF9nLAlf5H5zTpQVUA1xDoSRqbppJFcEnC+SSt2NXKIJkElcllJglnQQoxzmnCvg9l74mXa81/q4BpW7N5QUs=
X-Received: by 2002:a05:6a20:1585:b0:24c:f8f:2b95 with SMTP id
 adf61e73a8af0-2534557a863mr28371984637.40.1757587115788; Thu, 11 Sep 2025
 03:38:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 11 Sep 2025 16:08:24 +0530
X-Gm-Features: AS18NWDU1yGbFPHd1Xuf1CRGujHNL9_s9RGs2SutoTfTFAoxI3RGpotdfxd9IuI
Message-ID: <CA+G9fYsenOs88SO8ZRYnuDXU8tk=o-kS1Q=fvLbV3=6WKSJR2g@mail.gmail.com>
Subject: next-20250911 acct01.c 123 TFAIL acct(.) expected EISDIR EACCES (13)
To: open list <linux-kernel@vger.kernel.org>, LTP List <ltp@lists.linux.it>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Jani Nikula <jani.nikula@intel.com>, 
	Jeff Layton <jlayton@kernel.org>, Arnd Bergmann <arnd@arndb.de>, chrubis <chrubis@suse.cz>, 
	Petr Vorel <pvorel@suse.cz>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following LTP syscalls acct01 test failed on qemu-arm64, qemu-x86_64,
x86-64 and rock-pi-4b running the Linux next-20250911 tag kernel.

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Test regression: next-20250911 acct01.c 123 TFAIL acct(.) expected
EISDIR EACCES (13)

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Initial investigation pointing to this commit id, (Need to bisect)
$ git log --oneline next-20250910..next-20250911  -- kernel/acct.c
   ccc54b556054d kernel/acct.c: saner struct file treatment

## Test log
tst_test.c:1953: TINFO: LTP version: 20250530
tst_test.c:1956: TINFO: Tested kernel: 6.17.0-rc5-next-20250911 #1 SMP
PREEMPT @1757575072 aarch64
tst_kconfig.c:88: TINFO: Parsing kernel config '/proc/config.gz'
tst_kconfig.c:676: TINFO: CONFIG_TRACE_IRQFLAGS kernel option detected
which might slow the execution
tst_test.c:1774: TINFO: Overall timeout per run is 0h 21m 36s
acct01.c:123: TFAIL: acct(.) expected EISDIR: EACCES (13)
acct01.c:123: TPASS: acct(/dev/null) : EACCES (13)
acct01.c:123: TPASS: acct(/tmp/does/not/exist) : ENOENT (2)
acct01.c:123: TPASS: acct(./tmpfile/) : ENOTDIR (20)
acct01.c:123: TPASS: acct(./tmpfile) : EPERM (1)
acct01.c:123: TPASS: acct(NULL) : EPERM (1)
acct01.c:123: TPASS: acct(test_file_eloop1) : ELOOP (40)
acct01.c:123: TPASS: acct(aaaa...) : ENAMETOOLONG (36)
acct01.c:123: TPASS: acct(ro_mntpoint/file) : EROFS (30)
acct01.c:123: TPASS: acct(Invalid address) : EFAULT (14)
Summary:
passed   9
failed   1

## Source
* Kernel version: 6.17.0-rc5
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: 6.17.0-rc5-next-20250911
* Git commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
* Architectures:  qemu-arm64, qemu-x86_64, x86_64 and rock-pi-4b
* Toolchains: gcc-13
* Kconfigs: defconfig+lkftconfigs

## Build
* Test log: https://qa-reports.linaro.org/api/testruns/29854528/log_file/
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250911/ltp-syscalls/acct01/
* Test plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/32XlIYnaqlBd51NRfEjNdOSzoa9
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32XlFRJ0UBKszjvazzyFA2gCmdT/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/32XlFRJ0UBKszjvazzyFA2gCmdT/config

--
Linaro LKFT
