Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0D829A9CB
	for <regressions@lists.linux.dev>; Wed, 13 Aug 2025 04:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755061147; cv=none; b=juceSglIP/ad4edULyOpWMGgWlV32o7ysgsDJcsR7O2FWRnSnAxO+ihbkIyzW+g6BjLgcPOfYOkDv9U/Dg0W9BkC5+PBmgpgy1rH5noAnpDmPpOcHclQM/M1chOQz78JqR0z5seT57oVNIyTiCVrNel9EoOGfJ66fIoLuX6G5vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755061147; c=relaxed/simple;
	bh=UCKIbwhf6uvstIcUIZCOqEh6axnb7CKLlDgXzZHKcxM=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Ibs3ZAs+eJN2sNGFC8wIUn5sbtf+LxH+Exm9PfFNDdu/VTbOUhdfaIxlwoAMOYh0ywq1YGbzNUw00lE21U9loTF8De9jnUNWRqTRnpJhBa1BlecaLdgr29Lks7ur4ZkHqbR6rQrtjA3Hah+ON+IfGocT77cKyQwP8+oemPW0LSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=RSUpgkFS; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="RSUpgkFS"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2430c5b1b32so3949775ad.1
        for <regressions@lists.linux.dev>; Tue, 12 Aug 2025 21:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755061145; x=1755665945; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXbqQzre0I9aot+SgweTk1NUAuEOQ8POr6v/qgJLq5g=;
        b=RSUpgkFS7MHILLkIexx1u320gpX3hLPTd38bAv6L8B2lGjEoBznZXM2IrmEoJgM7HA
         51dcYCej2x27TI2pxDXRVn/ZIHvg3JbrBANYhwiTfwF6JeO9ipePmo9Md1OvJBU6cIGs
         ii1XGssc1r634C0lBFFPrWvnvEWe3K547yaR5qRf5jrZL8hH15TPKDquml9SFi4bymC7
         u8W7T+8c8LjC5C09dw9Ir5i0rqTzeaCYC6toSsOVqF9xqNJ8IoAJFtW18bGc0cNblHny
         nLblSH5XQWfKj9CyZAwJzjXB5FTD4VNC1igY5HbgApRWMbciGmOFO/I8NbgI44+NUXtr
         dZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755061145; x=1755665945;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HXbqQzre0I9aot+SgweTk1NUAuEOQ8POr6v/qgJLq5g=;
        b=QFNp9N0JLYCIO/D8Mx7IkdcOGoKULjjctJDVxARvsMhowf3DnT360MMT9Ke2sYHHMT
         ywN/Qi67D070RYgMI40/lqaGFD+oAWQN6bpI2uOZpe2+Xx0DUTR7itHjHJBo/T3To7Cc
         6BR0EYAsiGO2Ym+A6CF9RlIDaTPZok8K6e96ttaQQ1uXm0xk0Gxil9nuB7sOK1cXHPpQ
         hZBxefpngiHQjoVxmL6Ol0fDAveJ9JWcvghSo+fz4OdxeXNoaevR5UMGq14/kzYRlgTb
         zi2VDyov+jnR5CnNATd7swzE3qCmXkQwpkly4HZp2G9AVWO69R7XY8g0Ycw+RWV2Ep6j
         lZkQ==
X-Gm-Message-State: AOJu0YxmWHBFRsd2Q/4sMM7H2th9zX+PWjmcWRbX+s/KB0DVCZhBxKUZ
	q4EOKBeTNaM/tAZqGeR1wCvBWbpilI1/lE8TxyY2JzOzRGrQvjQEPbjyYihrSzoCREtPnfmewsD
	i4NYM
X-Gm-Gg: ASbGnctcSCCkv3znsKqZ4hdeOsZlGcwlI01XnT9tBT4eD7mJwSeaDb9tRj9lNBfmz4+
	W/K3hQwAR1vYkSZaCt4ji2JWTr8R0MnzNp3+IOABh7ub88FlvILNGiYN63vB/U3zV7gZ4t+aEh3
	sbCurXcgS+7ynJDOlFatwTtMKsQZgBAplHQ5ZQITCf7nymbdMCofFDMOJivLXpJaEEf8lgaXRoR
	t5+QH9vi+ODTkfFBq6OPmL16YvtwPJXjonLgk3YtRVHlYY2Fox3RVjpqFTXA/7f2BJWEccKMjHY
	W+8taWvP/vBq96g69ZF78+MML3VxcJYRSRmppW8IWbwcNbbuaDxIXklNFyTv3RaRZerzngO1dUo
	xSSxw61H+GmDkx358
X-Google-Smtp-Source: AGHT+IE70uDjTEdyeWd+C2sup7LRABQQn3vho5Md0rv+MJ5Rx9cXzm1VLhTjjwqtnzoXbduwZu7rPg==
X-Received: by 2002:a17:902:e74a:b0:240:72d8:96fa with SMTP id d9443c01a7336-2430eaa42b0mr18746945ad.20.1755061145319;
        Tue, 12 Aug 2025 21:59:05 -0700 (PDT)
Received: from 99cfaf6094a7 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef59b2sm316509585ad.7.2025.08.12.21.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 21:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/pending-fixes: (build)
 ./include/linux/iov_iter.h:171:7:
 error: variable 'remain' is used...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 13 Aug 2025 04:59:04 -0000
Message-ID: <175506114403.296.12737351814093118427@99cfaf6094a7>





Hello,

New build issue found on next/pending-fixes:

---
 ./include/linux/iov_iter.h:171:7: error: variable 'remain' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized] in net/core/skbuff.o (net/core/skbuff.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:e3e604796d8d054968bf2b979c7940708d16e0ee
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  1b07edbd37d5ab410613ebe09b0641d0f4fe717b



Log excerpt:
=====================================================
In file included from net/core/skbuff.c:66:
./include/linux/iov_iter.h:171:7: error: variable 'remain' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
  171 |                 if (skip >= fsize)
      |                     ^~~~~~~~~~~~~
./include/linux/iov_iter.h:190:7: note: uninitialized use occurs here
  190 |                 if (remain)
      |                     ^~~~~~
./include/linux/iov_iter.h:171:3: note: remove the 'if' if its condition is always false
  171 |                 if (skip >= fsize)
      |                 ^~~~~~~~~~~~~~~~~~
  172 |                         goto next;
      |                         ~~~~~~~~~
./include/linux/iov_iter.h:163:22: note: initialize the variable 'remain' to silence this warning
  163 |                 size_t part, remain, consumed;
      |                                    ^
      |                                     = 0
  CC      drivers/pci/search.o
  CC      sound/core/seq/seq_dummy.o
  CC      lib/ctype.o
  CC      lib/dec_and_lock.o
  AR      sound/i2c/other/built-in.a
  AR      sound/i2c/built-in.a
  CC      kernel/fork.o
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:689c1610233e484a3f9165be

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:689c1617233e484a3f9165c4


#kernelci issue maestro:e3e604796d8d054968bf2b979c7940708d16e0ee

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
