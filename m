Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2BB4071C5
	for <regressions@lists.linux.dev>; Mon, 15 Jun 2026 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539146; cv=none; b=cQjKJrIigXrelGJB3TqiSZK41wXvBlgGhunKhL6h6yeeu9QFmcclQtvqlrlhkUkdFrK7z60sS1+3XGeQHYeP8Izvbosh1zg0h6mABiPXpg6chx32SYD23fW0a8NBvMh3HTVgDvizJ+5nNsUAoAWCU9RbAhYYgXzqmb5zQT8DIKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539146; c=relaxed/simple;
	bh=sfSIGQwStiORChwPt2I2iWkzmw7drQjhPcfEXA8xOCQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=EiVrS4Jx4mdQmNdy2lTPTRijnbdG0oM6gd2fsKHoG2lr0bvkEosR40DqEULc5QDupQVDuDdemEvtMmIsOv25emCvlPrS6fVWbZzZ2pRzQSU7CFU5LVn9bDHLv8FQjU6HN4Ui+WeeQIscn79XkRQoXtpNTxZznPjSL583/kZIE8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=LfNNgbb2; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="LfNNgbb2"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30b9e755555so628329eec.1
        for <regressions@lists.linux.dev>; Mon, 15 Jun 2026 08:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1781539144; x=1782143944; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0jP4D1/37egeflgroPA1/DBL/OYpZeu+j81uQV7tLA=;
        b=LfNNgbb2N/5HIOhB2j9u0GEUEjwF9n5E0SvUHjPwzlDnUSIBjCxw4LbL/bbQjoYKhX
         2kzgjCocT6RSRXRKUBQ57VVI9JgvZmAVJkIt1kTTUIM0SGQnHf0cPKbG1OOb73zebis4
         z30SUIkSw/1CCthqIpbgVqpAKn9zbA/HxlukR9Vy0NSQyvhrsckeNtTjwRwhLT6T/sXl
         AEq8XE64IeAv/ROJSG7SY9ylnzExMhzhxUJmkYGie6Nv4f8tvFJlFQAwhnwtQHKgxzq0
         P6aCOQJuHKDaXjhSAUHwRxW5rEh2foeXvPRe2lc2qNLSIhEmiFqwFE8BKKmPlXKpfHni
         fZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781539144; x=1782143944;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e0jP4D1/37egeflgroPA1/DBL/OYpZeu+j81uQV7tLA=;
        b=BPcVZjd5D1INL1HriQZcPO7wPvx2SAVZ1+Hdp76RwnXZqTy8fD2C07e0kIywTON9QG
         6yDG4HxU9RIscCp4hpN76Pa84H/cFaUzQAXr2/vOHpWl/0GVD2mxGz6obeSIbpihCAsu
         gNCBN0eYffVHFJ/9+SkizAAgjxpq1642i56Ybqth644EITExvtDmgn4AZ98ylwCuAJBY
         pSpzCJlQke5DU8morx6fh+1LHkI4s7f26fPLxV3LoexORPcGKEeSwetrw/xA9HBpYA7k
         nWs5fjL1l2KN7N5w3Jz9mCVhPkx/8fceO1WyKEHSr/6TOClIFuG+txR0rn932sZRDj9X
         KQRw==
X-Gm-Message-State: AOJu0YxEJg13MyKmj/5IUCsS8VTUqnOg70ioofdy+vhSvprFK4ckXXLm
	i+HJj91HkIOEvHimYx8Yg+HVv8ig3Pgt3ll/8Ko6YJGzNA8G2y70jDgj9CIu9EgjEUg=
X-Gm-Gg: Acq92OFXXxz6zxRwF4RjLwZWDBN6NwHwBCafHh3AC1rFbR3bN9gui2Ewxmi5eMU2wGB
	goRATa210Q3960GzgT97VFhkk5qCkHvw4DUHKqMnuIR3Q8/TWNdgH7RzeXX1PUxf1WuH288/fif
	a9BbQMtewRVnxaZqysoUjLjkmAcEYIYD02FOihlLR/GsQqsdzKoKChZmvxs3hFreQYMIZnYT1eO
	SBLjQPWQa0mipxBf6HpYIhH084XuOM8Ea4MKJYD3IuT0MnS88O94E4iEQu4UiDf3uvQcXIZKzw/
	V+PWE8BWENnY+bkaS9k+q5CvFd6S+c8HYKYz2YtmcG7zS6tOR4lPI51ucJM2pGYQ4mTc15SrXsK
	3+P4L7R9zHtecJ9akJRznsbXkHwDdTwOkuwHxtx5NhlyheVVIh/WGVOZZs8dh3dLfiIdXN4kRc0
	T9TKVXhVP/+766sSFV
X-Received: by 2002:a05:7301:5f02:b0:304:ab8:f899 with SMTP id 5a478bee46e88-309395a7d3bmr5560958eec.8.1781539143930;
        Mon, 15 Jun 2026 08:59:03 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d810fsm15632538eec.12.2026.06.15.08.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:59:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?q?=5BREGRESSION=5D_next/master=3A_=28build=29_passing_argument_1_of_?=
 =?utf-8?q?=E2=80=98=5F=5Fdo=5Fkmalloc=5Fnode=E2=80=99_makes_pointer_from_in?=
 =?utf-8?q?teg=2E=2E=2E?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 15 Jun 2026 15:59:03 -0000
Message-ID: <178153914312.15282.16457445640645228189@330cfa3079ca>





Hello,

New build issue found on next/master:

---
 passing argument 1 of ‘__do_kmalloc_node’ makes pointer from integer without a cast [-Wint-conversion] in mm/slub.o (mm/slub.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:54c89979f71a499b7aae008163ebb25cc99f6565
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  700f8f17ac2c84f94b7cf4420f306a23a5ddfd24


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
mm/slub.c:5552:42: error: passing argument 1 of ‘__do_kmalloc_node’ makes pointer from integer without a cast [-Wint-conversion]
 5552 |                 return __do_kmalloc_node(size, NULL, flags, node,
      |                                          ^~~~
      |                                          |
      |                                          size_t {aka long unsigned int}
mm/slub.c:5340:39: note: expected ‘struct kmem_cache * (*)[14]’ but argument is of type ‘size_t’ {aka ‘long unsigned int’}
 5340 | void *__do_kmalloc_node(kmem_buckets *b, gfp_t flags, int node,
      |                         ~~~~~~~~~~~~~~^
In file included from ./include/uapi/linux/posix_types.h:5,
                 from ./include/uapi/linux/types.h:14,
                 from ./include/linux/types.h:5,
                 from ./include/linux/kasan-checks.h:5,
                 from ./include/asm-generic/rwonce.h:26,
                 from ./arch/arm64/include/asm/rwonce.h:81,
                 from ./include/linux/compiler.h:369,
                 from ./include/asm-generic/bug.h:5,
                 from ./arch/arm64/include/asm/bug.h:26,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/mmdebug.h:5,
                 from ./include/linux/mm.h:7,
                 from mm/slub.c:15:
./include/linux/stddef.h:8:14: error: passing argument 2 of ‘__do_kmalloc_node’ makes integer from pointer without a cast [-Wint-conversion]
    8 | #define NULL ((void *)0)
      |              ^~~~~~~~~~~
      |              |
      |              void *
mm/slub.c:5552:48: note: in expansion of macro ‘NULL’
 5552 |                 return __do_kmalloc_node(size, NULL, flags, node,
      |                                                ^~~~
mm/slub.c:5340:48: note: expected ‘gfp_t’ {aka ‘unsigned int’} but argument is of type ‘void *’
 5340 | void *__do_kmalloc_node(kmem_buckets *b, gfp_t flags, int node,
      |                                          ~~~~~~^~~~~
mm/slub.c:5552:61: error: incompatible type for argument 4 of ‘__do_kmalloc_node’
 5552 |                 return __do_kmalloc_node(size, NULL, flags, node,
      |                                                             ^~~~
      |                                                             |
      |                                                             int
mm/slub.c:5341:41: note: expected ‘kmalloc_token_t’ but argument is of type ‘int’
 5341 |                         kmalloc_token_t token, struct slab_alloc_context *ac)
      |                         ~~~~~~~~~~~~~~~~^~~~~
In file included from ./include/linux/mm.h:34:
./include/linux/slab.h:520:41: error: incompatible type for argument 5 of ‘__do_kmalloc_node’
  520 | #define PASS_TOKEN_PARAM(_token)        ((kmalloc_token_t){})
      |                                         ^~~~~~~~~~~~~~~~~~~~~
      |                                         |
      |                                         kmalloc_token_t
mm/slub.c:5553:33: note: in expansion of macro ‘PASS_TOKEN_PARAM’
 5553 |                                 PASS_TOKEN_PARAM(token), &ac);
      |                                 ^~~~~~~~~~~~~~~~
mm/slub.c:5341:75: note: expected ‘struct slab_alloc_context *’ but argument is of type ‘kmalloc_token_t’
 5341 |                         kmalloc_token_t token, struct slab_alloc_context *ac)
      |                                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
mm/slub.c:5552:24: error: too many arguments to function ‘__do_kmalloc_node’
 5552 |                 return __do_kmalloc_node(size, NULL, flags, node,
      |                        ^~~~~~~~~~~~~~~~~
mm/slub.c:5340:7: note: declared here
 5340 | void *__do_kmalloc_node(kmem_buckets *b, gfp_t flags, int node,
      |       ^~~~~~~~~~~~~~~~~
  CC      lib/sys_info.o
mm/slub.c:5558:1: error: control reaches end of non-void function [-Werror=return-type]
 5558 | }
      | ^
cc1: some warnings being treated as errors
  CC      arch/arm64/kvm/hyp/nvhe/../pgtable.nvhe.o

=====================================================


# Builds where the incident occurred:

## 32r2el_defconfig on (mips):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-mips-build-only-6a301bb2a1ade4ad5d1095a7/.config
- dashboard: https://d.kernelci.org/build/maestro:6a301bb2a1ade4ad5d1095a7

## 32r2el_defconfig+allnoconfig on (mips):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-mips-allnoconfig-6a301baea1ade4ad5d10946c/.config
- dashboard: https://d.kernelci.org/build/maestro:6a301baea1ade4ad5d10946c

## allnoconfig on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-i386-allnoconfig-6a301b9ea1ade4ad5d10944b/.config
- dashboard: https://d.kernelci.org/build/maestro:6a301b9ea1ade4ad5d10944b

## defconfig on (riscv):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301bbaa1ade4ad5d1095b7

## defconfig+allnoconfig+lab-setup+kselftest on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301b62a1ade4ad5d108f4a

## defconfig+arm64-chromebook+CONFIG_RANDOMIZE_BASE=y on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301b74a1ade4ad5d10938b

## defconfig+kcidebug+x86-board on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-kcidebug-6a301bcba1ade4ad5d1095ca/.config
- dashboard: https://d.kernelci.org/build/maestro:6a301bcba1ade4ad5d1095ca

## defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-chromebook-6a301af9a1ade4ad5d108d3f/.config
- dashboard: https://d.kernelci.org/build/maestro:6a301af9a1ade4ad5d108d3f

## i386_defconfig on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-i386-build-only-6a301ba2a1ade4ad5d10944e/.config
- dashboard: https://d.kernelci.org/build/maestro:6a301ba2a1ade4ad5d10944e

## multi_v7_defconfig+allnoconfig on (arm):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301b35a1ade4ad5d108e29

## multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=y on (arm):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301b39a1ade4ad5d108e3b

## multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y on (arm):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301b41a1ade4ad5d108e7a

## multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y on (arm):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301b45a1ade4ad5d108e7d

## multi_v7_defconfig+kselftest on (arm):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301b4da1ade4ad5d108e8b

## x86_64_defconfig+allnoconfig+x86-board on (x86_64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301bd8a1ade4ad5d1095d3

## x86_64_defconfig+aws-ec2 on (x86_64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301bc3a1ade4ad5d1095bd

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301bd4a1ade4ad5d1095d0


#kernelci issue maestro:54c89979f71a499b7aae008163ebb25cc99f6565

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
