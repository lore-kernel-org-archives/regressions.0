Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707DC1FC3
	for <regressions@lists.linux.dev>; Fri,  4 Jul 2025 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630347; cv=none; b=DY55x0t1KNi32tyjZToruACIEIj0eUBHsE8Pn3Ey3Tjw2QKtulcmXjikmVMJES+OZ4q4GTr+9wUkPGtCxozn2utJYadrLkkPHVXMHG68CwhEhsPEds7VBgVqMm3bgGGUxJhIj1ugpVdi8bBPsnhC3jVZLSiEO8/wxaS/AUBPkdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630347; c=relaxed/simple;
	bh=2Y6Or+M86IdLESd07gNvHYCL8FyjBcmjGfFoeNmRqkw=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=HguxC2Xb2Iwes3dObEKKaN0YdYe/c/SOf0tQJmwIYe6MDZ7S3/sE/PDiGpvTfaHK2jyavpLY16GeIOUaFX9up2pqyJqv3ufptSucrVBMXbTDojniW+YIMLqfUeqVTn0ecJtBgPBu0DDTvRrQw4lCYLZJMK4FVIK0mQ+FHG6LZuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=tYT855qK; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="tYT855qK"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e812c817de0so642797276.0
        for <regressions@lists.linux.dev>; Fri, 04 Jul 2025 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1751630344; x=1752235144; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QPyMWfcH5a3vIyqq+fjaezA7nXkC1s79HdwkjMy0bg=;
        b=tYT855qKHMT2nzWVftpuaKr9Ay4nPJLjITcsXFJuI7oNcH/n4Rzz0e2JSfKUZzJJXr
         gV5t51NvoT5hYDw7q73dPBT+oKJsMMpIsyXGyS88YKAy0POVs6p1UKy+vxFv91u3qcVz
         cETV/wMkjIot87iuujZMSSfcLeJkvcNuz4uoPFVnArxwrqWuUadGmBdd08+C/FVI9Vrg
         PgnZ6RIO8psv1r6t3gxX3xdKDhkgCzUXj9qkyi0X1pIGQBVLeaC9GyymsQSH7zxxCh/7
         5Q3+hpTLJeHbA9jiTAZOia/JUTnxbxhGXJYXKK8FhWBkIOvKtR9Izx84oJfyriVTe8MG
         vKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751630344; x=1752235144;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QPyMWfcH5a3vIyqq+fjaezA7nXkC1s79HdwkjMy0bg=;
        b=I/K2qwBcd7mvVxiy8eVTSRr4h2vo2SQr7xtY9glUB/bQCUD/TIqycDpix8QnIgZZQP
         vPVVWgw8cl9J8blQwlf7HKso3Sjfdl6coEGKIzxLBwL0n7KJL109XBE/F48J1bMQDqbl
         IFxQZB3HMh+2LwYafC+whNdn+WOYnd8jVJw9DOdfXDpTZKqQRp8oqjXJ9SPqYe2IceeV
         bWnmXxpGYf+cFv0vEncgiuGlB1S1+G/aSL1uuECCqv43LcR/zjXa9Jt/AOojisWnrx7P
         h6ucxZbD3Xz4qwFO9dHsCrVmQLjAHoiiga2bLtfrhaBh7blA6x+Gky0ISYXQrIXE7p6U
         wwFQ==
X-Gm-Message-State: AOJu0YxkJUcOQy6doZn2OgPkoJB+9iLPY22FXS1qywIMOYXyZOg/QdIG
	iFd7zq9Nx0WEv4sxP6FvlPWHJt7LojIWa/jvnQrfZpYOTnp7u4vGqH032ctEA3qTmdW895FLHWT
	8fAetJWTpABVtC7HpLF3+oAX/4h7UH4swttDpxzG7ZA==
X-Gm-Gg: ASbGncs3NmQAf9rtyZhhdMue0j+M33+kzYg7R0ESiiWg9Jl7Usc4VPw47s2Z7+mgSjo
	LQMASYWRvV0lYFFCUVaYVeJKiYRd2PFtQKkstoX5cq9IFFrMt7y2WT/mhlLJjYdn6cE05E5YCEd
	iJIUMJpQRYCZHnBarTqBjYv4laJfgXTucIYjIggjl2uw==
X-Google-Smtp-Source: AGHT+IH55A+FpRtVTsxcL2s6ZUjKccEAMQC/IIfj5Rkv/Wk93wVwmhRg9pMTwu/+TfuY2JpJXBWdCN0goNe0wCr0614=
X-Received: by 2002:a05:690c:4902:b0:70e:16a3:ce92 with SMTP id
 00721157ae682-7166b6cd929mr19042967b3.17.1751630344225; Fri, 04 Jul 2025
 04:59:04 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 4 Jul 2025 04:59:03 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Fri, 4 Jul 2025 04:59:03 -0700
X-Gm-Features: Ac12FXxc8vEKmVKNvsp3LWo-wEYC5PTDz35RunsmdZrBe4jA1S5b0eYDhX0Noe8
Message-ID: <CACo-S-16Ry4Gn33k4zygRKwjE116h1t--DSqJpQfodeVb0ssGA@mail.gmail.com>
Subject: [REGRESSION] next/master: (build) cast to pointer from integer of
 different size [-Werror=int-to-poi...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on next/master:

---
 cast to pointer from integer of different size
[-Werror=int-to-pointer-cast] in kernel/bpf/stream.o
(kernel/bpf/stream.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:8c418e432e074dbad60dd7a8c9656044427b1807
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  26ffb3d6f02cd0935fb9fa3db897767beee1cb2a


Log excerpt:
=====================================================
kernel/bpf/stream.c:501:53: error: cast to pointer from integer of
different size [-Werror=int-to-pointer-cast]
  501 |                                                     (void
*)ip, line, file, num);
      |                                                     ^
kernel/bpf/stream.c:505:64: error: cast to pointer from integer of
different size [-Werror=int-to-pointer-cast]
  505 |         ctxp->err = bpf_stream_stage_printk(ctxp->ss, "%pS\n",
(void *)ip);
      |                                                                ^
  CC      net/sched/act_api.o
  CC      fs/nfs/nfstrace.o
cc1: all warnings being treated as errors

=====================================================


# Builds where the incident occurred:

## i386_defconfig+kselftest on (i386):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:6867b3065c2cf250420083b1


#kernelci issue maestro:8c418e432e074dbad60dd7a8c9656044427b1807

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
