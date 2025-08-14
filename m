Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EBD2FF651
	for <regressions@lists.linux.dev>; Thu, 14 Aug 2025 01:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755136747; cv=none; b=mSE5TbRmD+9zmafxPvrQ+zYD8uEUCxcPL5zlEFtqc27BfKcaVKLx4Pfybqshlih/Soibojeu/Kn+n3gxuvLI7TEFK4N4MXGqrB5snVKKygn/suzelZLjp81loCTNdtqign0lmV07Vsct2L6WXaNSKzGyv74Rt+W0yekUNSyzy4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755136747; c=relaxed/simple;
	bh=DJQQnr7ESP5Nn8I3uqJgk8t1XpmeKx5WIrPpvxKCHOY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=H5DnS/gHvKq+9v9rOhbIRj1YNv9xvAmmeLyG+Arzd7LFr+NTauoAeA06PxuCjbnxkJchbrX1kl11QoaRAF1voCf2FBoqWm2qrNfPdsxtF98RByOL+x2IemarvnkRcfLi82Jtc6Qtnt/66BpsQ2zhnpSnIOD8JyAabxYCYD429jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=nHGnENzt; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="nHGnENzt"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e2e6038cfso874627b3a.0
        for <regressions@lists.linux.dev>; Wed, 13 Aug 2025 18:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755136745; x=1755741545; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nm1YdYpw7cZr42uTUu7r927cwPSI6CHJx4UhJH6tZg=;
        b=nHGnENztPsMRa3sSaeZL3Kx/DFXQRSBTEZcJ6KejtzpsDXjAeY5sCZhW46uSkN+ywt
         r19LtqXj4C8xhnh16EfQ1rsHskOq17PUTq/fvpMwnRBBJ0wY/sHW3vqDoH/qtArfbF3Q
         xqSwcsPsx1PWhb5o0FHlkZ61ad3IVB95wISgg17wG/kNuGjhaHjZdfqipNOJFeOhG9OK
         J7uuANtrYIzR0+5cc4YOQPIoO1zEBZCbWSnE0Y938jk7megHdwObfk77BCX59p0L5Op/
         kjBHGd7kPf54guFBY2ENpbM8VoUICA3S9LhYTfdtV0U3SBTr+Dch1qg+B7D86D7XO1Xp
         1xsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755136745; x=1755741545;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4nm1YdYpw7cZr42uTUu7r927cwPSI6CHJx4UhJH6tZg=;
        b=c8XiQeJGAlVKm0WiOOMUA/LdA5wMW0YwZPG8MRlHcD91ofUHMzkrBPF1FEYiKwyYrc
         YsistTKPvouWH6FN1UjEfyBz2C11QFvkZ2aKoIT4GpnrHpv7CCq8cgjEILIT7X2tQdSn
         NGFhsRgJI7fNhFWXS3m82Rx+BZf6MpO+ZZPTw8dHpcVFWbdU0yS8vDKCmipUK7cKV2U/
         G8y7V4tlttGJVf0r38q5hVG9mqCcY1UuIS2fssJz2y0KXL4IsmPz0Jeie0IUSWTZxPIG
         wljwJzNVeiTtqP4ewQWNH+J91mk2qu4iUhTC0jLX31fYQ095rnACyT2rZlQO/fVx9Lbm
         c6bA==
X-Gm-Message-State: AOJu0YwgsGlOlJziMOGuO93wiDtEFDIhLGgw5HPNm7OJwBAq+2xLvh1D
	boJU73gpQG0AhdX5si2pOuaEdOCsxEJwp47gyBvhvzShlPBLGXptr7q2MkU8v3WfAgE=
X-Gm-Gg: ASbGncu3XEI48WluNr6HcjySj0Ex+iPNNb1nWy5+6W9F0T8qu6NtwMf8iBuhlm0863Q
	H2jS0B/YbzyGgqgpiEGAUSGUFT4nJO0o+chWh8EpIOG5ZQRlUEqkcvAZAYCCfxUNBTeVkgqSpYg
	2lvxTD7Emwcw0U3eio6Y7Sh8aceTeukQq2987n/PzxJSJaeRwx2aMK1GBklxQDBiRHS7oc/WTYY
	BPa63CUwOA17vPdK3a+o+1iC1nfPm5F17LV55WVKDbMbsYIqzsHLuA6mMnc+WxMwvG3CxECNPt7
	7qZONWNllAaBVhKAQYBGls35CvE0ZeuvHrIkTcQiP3YgXfpG/GlRxpGZKMhYV7kll+DedfezZgm
	LMAsjeqdtSDy6Yj0t
X-Google-Smtp-Source: AGHT+IF5yo39E0u8V8S14AjFdRemc8iQY3OYRVyD4esZG5ox61CGTqO1p3ed4efCjU2r/HsYClPZ3A==
X-Received: by 2002:a05:6a20:734d:b0:21f:5598:4c2c with SMTP id adf61e73a8af0-240bcff8edamr1780389637.13.1755136745069;
        Wed, 13 Aug 2025 18:59:05 -0700 (PDT)
Received: from 16ad3c994827 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bac0391sm27956571a12.37.2025.08.13.18.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 18:59:04 -0700 (PDT)
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
Date: Thu, 14 Aug 2025 01:59:04 -0000
Message-ID: <175513674368.82.1504743662347433431@16ad3c994827>





Hello,

New build issue found on next/pending-fixes:

---
 ./include/linux/iov_iter.h:171:7: error: variable 'remain' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized] in net/core/datagram.o (net/core/datagram.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:82c48b655cc0d40e7033745ca11b932d4cb70784
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  e0eed1e413d2ef7c2122647cfa76de2809e42c11



Log excerpt:
=====================================================
In file included from net/core/datagram.c:53:
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
  AR      lib/fonts/built-in.a
  CC      sound/core/pcm_lib.o
  AR      arch/x86/platform/atom/built-in.a
  CC      lib/bug.o
  AR      arch/x86/platform/geode/built-in.a
  CC      arch/x86/platform/efi/memmap.o
1 error generated.
  AR      arch/x86/platform/ce4100/built-in.a

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:689d2d72233e484a3f944060


#kernelci issue maestro:82c48b655cc0d40e7033745ca11b932d4cb70784

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
