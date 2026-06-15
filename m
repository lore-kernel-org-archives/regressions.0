Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB24A4071D7
	for <regressions@lists.linux.dev>; Mon, 15 Jun 2026 15:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539148; cv=none; b=X9QcjnqE9X5PO8dNQQewgYnImVtdwDCVBtIEuEmqxvDnaCo9q4W8rC2KjN+TPqZTtcigzsLi7xSekjGTR3ALy4YS+ncqegIaFOrZk26iyM9fsxzosHX/ew0gmAyc8Tbg07R/L1go/5wt2RyqE2JRX3FPgnYuvREnrzITMFRxfZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539148; c=relaxed/simple;
	bh=02456t33kCanPwRPAPtTVAeMZgD9cqQ/ckBYvAOaCUs=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=fEqz4JFMEHRZdFuuI3duc5rVp9HR3zDxC/y5e5ItJ2DQMY22GRo3ErnpEZTLG0udawYI6VCrZctp7Glf2XZsw7nb7XsPgf3rgBq3vWPNE6rT4+zKez0O6dw6o0xlgI30dxwprzLQoYnLCRFaWuDxqL2/BbV+4Ofzlzy5ggHciKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=N0CwQU6I; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="N0CwQU6I"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-13721dfd471so3875013c88.1
        for <regressions@lists.linux.dev>; Mon, 15 Jun 2026 08:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1781539146; x=1782143946; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCT8etNXvK/IxtxeQpIRLNLGiEVJ24UbzqSH8HPG4oA=;
        b=N0CwQU6I4kyisMYfNgviTfnz31cZzWKrSrN/3739TJbpzvtXXQaVRYO2y8ND1xtZOs
         V8RvJy+Y6cCM0qt6UGTBF3MpSZSbWjeDbh/0YYZCDhx3V932IG6+I9LQVMFBWR8lFSX8
         mj80ah4v0CDwaZ+Whdce+2KOoaOEUYwnL8aX8X6WZ9L/BoZufqafFp+GIOAPR0fR38PG
         35SDHfDkbdx7l7B7XckWfXVBZ6eXBgXucmdFjBJ9ccbW1i/FAyiO57iWqwBJDlhxbqo7
         qWQj/ToA7xI4cBsDipthQncmW5jWsuOQR0kZK/C7H7UepPwYqXJ1yu/Ig3u+ZOeiSvjg
         2Oyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781539146; x=1782143946;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NCT8etNXvK/IxtxeQpIRLNLGiEVJ24UbzqSH8HPG4oA=;
        b=ZbnlSaHDBK+1pVm8B9N2ZRbj/lIrxlk1ehxt+2JdLjeiXORnO1kQFcPrKuh2TTreqS
         lSTEJ2kyQKhBxZmBYosYy4Jl7zybzHQQWZyeBcRfzBq/Kjl3tkjIUwT50xjZq2s0kT99
         S4gZS642KJZWbrKB6k2s6YF2nXQ5jFrxfexaNOI5qUcePheqYjjVIVFfkI7ENb8K+kA0
         fsDdKpdCRP+Uk3ueIvI+1D//cTi+8LDSi5fQkFQfbhQ+AVadbO523/dWicMY1JfRxL4B
         1+JwpIoxXc31r+4RJHC4CJw3Vnela55MJbhknNLqhUpu9LsVmPRKhdrfr0j9RiIt9M7S
         l0Dg==
X-Gm-Message-State: AOJu0YwrlKlkojAX7eSYWwy2CYFeaHzYRQ0Q00VDKbwiOD4Gb0NAKv8J
	pUY5j0JB7QZzvmxlbT5kROhm0BpgGkfzpK4VXkY0wyJYggh1qQKYxgbiTOmpr8+Ni25e/m8YcJO
	9Fv5q
X-Gm-Gg: Acq92OEyuOn6r36MLZ2wVCuKw1srKEeO2HgL6dSBGdBPK/06DD/iR+Ph2RuB0EUcMO9
	mqd9Wk5pw1NuGuAgG6UzyGC188W+AZdkV1ihlJD/ltJlwRj6+fqxLIHytbRnorGkCutz/UR1heT
	ulm/urvkMLXlbkgTk5N9HYZMpgJbG5tEH8yeDlFKVSXY/AiR9zhktaIrTdKFGngOg7b+hACjEza
	mpCQ1F58sTrFBEC1W8StqK41l5mHzmK56uJUNNmADLpnTGPS0jjWWXAUQsSGwUewP/G/ivfxoTO
	k/xS5HK0GM9zzjRPLlgRIZI5TINiXnRxTm3RrvS+ymeOTr13JbjOm9zPE2muwiqf3KX1jw3HnXn
	jupEtagfsqmm2YrWR29v0Rodu4yPOks7Aum3/DBEgyBkvChRptMywKnT6WqZJko6VljAnk0gZKk
	Jp0wSEwEnhXn56hiyf
X-Received: by 2002:a05:7022:2396:b0:137:ea7d:a5e1 with SMTP id a92af1059eb24-13878e2d130mr5218409c88.30.1781539146009;
        Mon, 15 Jun 2026 08:59:06 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b91a4c7sm10606835c88.8.2026.06.15.08.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) too many arguments to function
 call,
 expected 5, have 6 in mm/slub...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 15 Jun 2026 15:59:05 -0000
Message-ID: <178153914528.15282.16770125845520023465@330cfa3079ca>





Hello,

New build issue found on next/master:

---
 too many arguments to function call, expected 5, have 6 in mm/slub.o (mm/slub.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:0c4655a413ae8e279f9ba1fcb2fc80a3953d4dd4
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  700f8f17ac2c84f94b7cf4420f306a23a5ddfd24


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
/tmp/kci/linux/mm/slub.c:5553:30: error: too many arguments to function call, expected 5, have 6
 5552 |                 return __do_kmalloc_node(size, NULL, flags, node,
      |                        ~~~~~~~~~~~~~~~~~
 5553 |                                 PASS_TOKEN_PARAM(token), &ac);
      |                                                          ^~~
/tmp/kci/linux/mm/slub.c:5340:7: note: '__do_kmalloc_node' declared here
 5340 | void *__do_kmalloc_node(kmem_buckets *b, gfp_t flags, int node,
      |       ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 5341 |                         kmalloc_token_t token, struct slab_alloc_context *ac)
      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1 error generated.

=====================================================


# Builds where the incident occurred:

## aspeed_g5_defconfig on (arm):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301b0ea1ade4ad5d108dc5

## defconfig+allnoconfig on (riscv):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301b13a1ade4ad5d108dd5

## i386_defconfig+allnoconfig on (i386):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-i386-allnoconfig-6a301b13a1ade4ad5d108dd2/.config
- dashboard: https://d.kernelci.org/build/maestro:6a301b13a1ade4ad5d108dd2

## multi_v7_defconfig+allnoconfig on (arm):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301b0ba1ade4ad5d108dc2

## x86_64_defconfig on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301b17a1ade4ad5d108de4

## x86_64_defconfig+allnoconfig on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301b1ba1ade4ad5d108df3


#kernelci issue maestro:0c4655a413ae8e279f9ba1fcb2fc80a3953d4dd4

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
