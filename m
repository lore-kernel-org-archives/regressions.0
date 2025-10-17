Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C0B23958C
	for <regressions@lists.linux.dev>; Fri, 17 Oct 2025 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691130; cv=none; b=iu9rJr8dTht9sbkhFnmeQorp87obcCvQdDIyaxM6MaSXVd8acj6YeifB8AkQ/Him9bqOgbxq8YARNXr4WztrVQ+KPqtQ6g7lDwdINY6h/GUmOtQsa0tL4VuXiW/O3n2FeAybbzNvD0vlzc7nFgLPvEexNlH2EWNMlQAO7MHQ+Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691130; c=relaxed/simple;
	bh=2oLMnCZ23LLTDdFKDD3O2sUs72MeFy/tN37/VGxtlsA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JNLNab2RCQmESVjw2gk1ArpoY7T4/D+cbqwzgpsrjJnXVdxezT2BU3QBrfSLOSZ/vfXeVKmzC7jGo7vd+yISA8cF96c9CyHjvMXv71wBQ3Y/8KnCTWBQ4Ox7pmH6aVEnmRnDlv7SJ0hGm8xl7sQA9Rg/jFGNXCl1Wp9gE1LsK2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oPrTxAjp; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oPrTxAjp"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2697899a202so20001345ad.0
        for <regressions@lists.linux.dev>; Fri, 17 Oct 2025 01:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760691128; x=1761295928; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J+y1vB4iqnryB//UhMXxu9OFiqC1kDkx0s8+5S3KEFo=;
        b=oPrTxAjpfRNthh1eHeu2/jQ4e36DoEsHWVQ6oa4rBFzomz34quZFE7+S9OMmBNh4Li
         QueRzZL9FXkJMxZGyGcAcDrXz+v3gyDDNhqkoKsR7L5jmRyjRfwum940kDrsJ+RiB8qE
         TE4o+MxGcZypILLoG2gqCLIOjnbcKAfo56GXgnPLeV2BS9kHjADFTZGrikZfV5p8LX/B
         BU3pN5Nq0ISTXC8tYUMLKU57ep7tLZwAGjVOs+li3Jm9Wxm3lJkJcUKXQyY8ceRQ0GOd
         97WzD0cosjt/lxALwE7hVVF+s1nRLcGi0cw1wcvUJynPQM50QTtaznLPCNTHEfEJUHVb
         31mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691128; x=1761295928;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J+y1vB4iqnryB//UhMXxu9OFiqC1kDkx0s8+5S3KEFo=;
        b=uYmlOa00rleh50UNwA5NvpuHnvGvBdf/b3DVgQ3jLvVNeNMQ2nbftIfoVihaq3KlHL
         VOG6+ug+I06qQ8nmY/Uv4qjkGHUKdOztLc5P3gnMEyOxvUavMUSDQCe3poYauPogPhBB
         wKVrv8bEcKx4XZyL6Reh9ws//VlaMzjfxBqYca2DEJv800Nj2QGljsUHiNeyNacBOs/O
         uMUn1htS00UQOYIA85YRYHIWpI5adxoGnEcEwYKLNV4M+hJds+4ca4/OEwnod+soPYRu
         H+LE7WTMHTsO39GUsRoL0oLWtz/0aOVe1C3vXyqyk+j+8VX94yhQF5gr0xD4Xm0iTIDl
         3tbw==
X-Forwarded-Encrypted: i=1; AJvYcCUbBcBd8i9pQ/AvazTrrhAitwxnS4xd9c8dIXdFf1N6iolGtMQeLHENscABZwBgtOWbVm2UZYPZOpeeHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWQu8NCKbdhurvgz4DXygJyBxsoIDiYTdm5ZLfbrQE66tAuFzG
	Kbvc65/KD8PiyFtwPjKbzH/c5uCxCuI8SUO7pF0ST0lCgXTGNifgOMfTsxn48VnsPG9+Au8Nn/z
	5oC0HWH3NhJLEioXTw+SzmarL1iCvBPayTGR3QAvdXg==
X-Gm-Gg: ASbGnctiHR4NEOvQxE4q3JSi7bCtt6e0/Pd2OcoD7onjQtTXgBrQK7+muWQoJqokBtB
	/bw+xIwUHzmVdT0F30TsAWfpsCXfbX7N1KV/QE2injbo9F48aZo7T6H8reuCWPBCWclqfYK/s6K
	rI9UGCZBJReQk342PcdKslSsNlXAobVYhHrdEJAANNeSs+qZI3NyD1c+1SKu7kQ7YxXBzyXyCtS
	uNQOZb/JE0ZW6cC4A7nE9giwmFIWNJgSt9j6Dl9tgY60T2WQBhsk2Bj/+9GGx5DfjCktQaiAZpF
	RkCeFMKcy9q7lplXBu4a1PLIkMC+3FofVrew7o9mfuEH3/I2ir1nAdXHPj1Q
X-Google-Smtp-Source: AGHT+IHnzdCZiWkeq6B0nWCC7+Ta7WqnE/RTfJHl80GUdwDwM+iInU4JzJQ1fseC0j68aNlkWHaYLC2Le5AdhB426tw=
X-Received: by 2002:a17:903:2310:b0:290:ad7a:bb50 with SMTP id
 d9443c01a7336-290ad7abe3amr60139775ad.27.1760691127941; Fri, 17 Oct 2025
 01:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 17 Oct 2025 14:21:56 +0530
X-Gm-Features: AS18NWDmy4VY4bYGS9Uinoj_a_bgUwsPBK0TlYzxtMKYza6ex6eRnnUZiu6_1_8
Message-ID: <CA+G9fYuF44WkxhDj9ZQ1+PwdsU_rHGcYoVqMDr3AL=AvweiCxg@mail.gmail.com>
Subject: 6.18.0-rc1: LTP syscalls ioctl_pidfd05: TFAIL: ioctl(pidfd,
 PIDFD_GET_INFO_SHORT, info_invalid) expected EINVAL: ENOTTY (25)
To: open list <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The LTP syscalls ioctl_pidfd05 test failed due to following error on
the Linux mainline
kernel v6.18-rc1-104-g7ea30958b305 on the arm64, arm and x86_64.

The Test case is expecting to fail with EINVAL but found ENOTTY.

Please investigate this reported regression.

First seen on v6.18-rc1-104-g7ea30958b305
Good: 6.18.0-rc1
Bad: 7ea30958b3054f5e488fa0b33c352723f7ab3a2a

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Test regressions: 6.18.0-rc1: LTP syscalls ioctl_pidfd05: TFAIL:
ioctl(pidfd, PIDFD_GET_INFO_SHORT, info_invalid) expected EINVAL:
ENOTTY (25)

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Test error log
tst_buffers.c:57: TINFO: Test is using guarded buffers
tst_test.c:2021: TINFO: LTP version: 20250930
tst_test.c:2024: TINFO: Tested kernel: 6.18.0-rc1 #1 SMP PREEMPT
@1760657272 aarch64
tst_kconfig.c:88: TINFO: Parsing kernel config '/proc/config.gz'
tst_kconfig.c:676: TINFO: CONFIG_TRACE_IRQFLAGS kernel option detected
which might slow the execution
tst_test.c:1842: TINFO: Overall timeout per run is 0h 21m 36s
ioctl_pidfd05.c:45: TPASS: ioctl(pidfd, PIDFD_GET_INFO, NULL) : EINVAL (22)
ioctl_pidfd05.c:46: TFAIL: ioctl(pidfd, PIDFD_GET_INFO_SHORT,
info_invalid) expected EINVAL: ENOTTY (25)
Summary:
passed   1
failed   1

## Source
* Kernel version: 6.18.0-rc1
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
* Git describe: v6.18-rc1-104-g98ac9cc4b445
* Git commit: 98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
* Architectures: arm64, x86_64
* Toolchains: gcc-13 clang
* Kconfigs: defconfig+lkftconfig

## Build
* Test log: https://lkft.validation.linaro.org/scheduler/job/8495154#L15590
* Test details:
https://regressions.linaro.org/lkft/linux-mainline-master/v6.18-rc1-104-g98ac9cc4b445/ltp-syscalls/ioctl_pidfd05/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/34AVGrBMrEy9qh7gqsguINdUFFt
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/34AVFcbKDpJQfCdAQupg3lZzwFY/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/34AVFcbKDpJQfCdAQupg3lZzwFY/config

--
Linaro LKFT
