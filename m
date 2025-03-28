Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76059212FAD
	for <regressions@lists.linux.dev>; Fri, 28 Mar 2025 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743152349; cv=none; b=f0kt4heXF2YtO1IOL4ZGJFUoPBgN9H5oE/bC2WZbxoTYsyF3DIuEffBbJ9yBfL+Smwx8QN355biGjOQOOIuu28Quxt0UUMXBOIAatCh/h7hX1zx4+PVzPG5dZYxYeaZpWC+9C2VBiV+vVqqXehcklGdb/PDz45rNgGAMgbnniMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743152349; c=relaxed/simple;
	bh=WQ8tto9OSYdqIg5JpT7hhZg14D9bOy+LWjTVh8ISZ+I=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=Q/3OBM41FKkB1TCEePY6GKR54y1O65UoaYl4WeDdSpctpP3EU6QSVMpWLDdHKSO6Bo3l1FUuuIeRIW8vOFQjOpauVbb/dHz8/yL2nRuPKoYQps7fVz93rpd3H92rUVmzUuev9S5+btZgnp8LX9KDXcn1/aGItCEj2h3NiMDSJ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=cPAZ91rN; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="cPAZ91rN"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ff4faf858cso14514107b3.2
        for <regressions@lists.linux.dev>; Fri, 28 Mar 2025 01:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1743152346; x=1743757146; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/+mFxmAbCJZONlZ/t+V+OyqhwtzDZzTtZur4PG6mSo=;
        b=cPAZ91rNdKc86dnJ+Pd0H8EV02SPhA8W6YUETX1tlGvt2hBw6i0LV1Dd+w0/TtXiGt
         qdOV3hqldm5NfDdDtdDl5vEGCFNbiVvgk+gZDaW4MdRgmZHTK0PpCqKaVWArUGXyHUvG
         K2RWlP1aSLk0DlTcYi+texgTwlms2kl/SLCZvk6Tjq6bjCi1q1Loj3TOIaCbJiuQdBir
         ndq9f0h8Xjmcd64X7JJrHXJkhETxr4H3J492Cu7WbWKs6FlYe4VTR/YN51qusdz1GZkF
         hu2NmfEGyD4sftZ9ku9ySiWxEk5aArhCi8Djvf1bHi4HTV9jedqoOkzCh+qKhFS0S701
         j/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743152346; x=1743757146;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/+mFxmAbCJZONlZ/t+V+OyqhwtzDZzTtZur4PG6mSo=;
        b=JBgMTq1/IlvuOqXFg0SfV+DNLhFcC4NrMk68diAqCEUbtHpFLv1oRauKxUgsAEajHy
         VCJECFAPOcpXbHWlImrf5oN2fHNirjH6LM1UgSt6yVeU/wx1SNDwrzQIvBRGB5+NcU1V
         R6QtPapbhk8KwZFowZkFKNxK0BmdgRiDfyiPstkwu/zIOplbu/HuRLnbRzWr5HrcZMY9
         4E7nvaJmlQyTpL5YvlSmkmuN3j8lb7hAEqhQs1d8llvt5ofzwyMzETzaUi0lSOMAZcCX
         X60d+pnm60Wu12hoR69f0GDkCH85pp74XUNR712LrxAc/IaV0sm+mb0p27H/Vx46qbwh
         3NCg==
X-Gm-Message-State: AOJu0YzQ1hvE0Kk0Z+TJTKPvh7MSEjnNE1GwGsDTZVgvsenZKf7IgABH
	oEuJ53tJklo7LlsZQ8Aml7korye+ec8xIAAmlpVKRcqIiGQbae45WQ20XsumHoB0pesIF7YtE36
	e1G1WIoq+KsCdPIUfMV/PdekMmnW64IpbW9iJgTMeFmEv+Va9
X-Gm-Gg: ASbGncuKCmhwExTVdGqKu4l/xaNqGVhCK+DP9Xce2IU6E4Hm9wj9EoGilwX8DUJe11t
	UkB016WHfEmY4f5ZYH0ofyDs1Sedmm4L+CXJJKVp0B1q6NQYvR3R/Pw7oXcmwDCxmO8IVhp0udG
	SRjeJr/rV6jPuv5Hof1WDEAVDp
X-Google-Smtp-Source: AGHT+IHF8y00IeRym2Ez6aM0WTopHqt8mEEVlxlWzAOuiqDCgYPAqt/7XlfLqyqPggfkRdOnE28jso9EXcelZFa+hIo=
X-Received: by 2002:a05:690c:296:b0:6fd:4670:80c6 with SMTP id
 00721157ae682-702250d744emr91920367b3.37.1743152346123; Fri, 28 Mar 2025
 01:59:06 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Mar 2025 04:59:04 -0400
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Mar 2025 04:59:04 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Fri, 28 Mar 2025 04:59:04 -0400
X-Gm-Features: AQ5f1JqJI8JotjZifV_Q1MdmDn2VubnbFhULvlwc3DWy-M2Gxh-PC-JG313jFG4
Message-ID: <CACo-S-0A0K6OQtu_TZs3YNnAvc9e=DXau_LGLX0hb0=RfZv50Q@mail.gmail.com>
Subject: [REGRESSION] next/master: (build) redefinition of 'start' in
 arch/riscv/mm/tlbflush.o (arch/riscv/mm...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on next/master:

---
 redefinition of 'start' in arch/riscv/mm/tlbflush.o
(arch/riscv/mm/tlbflush.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:e8a8df1a8dbe4233bc72966485e414a11bfedeaa
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  e21edb1638e82460f126a6e49bcdd958d452929c


Log excerpt:
=====================================================
arch/riscv/mm/tlbflush.c:195:16: error: redefinition of 'start'
  195 |         unsigned long start = uaddr & PAGE_MASK;
      |                       ^
arch/riscv/mm/tlbflush.c:193:39: note: previous definition is here
  193 |                 struct mm_struct *mm, unsigned long start,
unsigned long end)
      |                                                     ^
arch/riscv/mm/tlbflush.c:195:24: error: use of undeclared identifier 'uaddr'
  195 |         unsigned long start = uaddr & PAGE_MASK;
      |                               ^
2 errors generated.

=====================================================


# Builds where the incident occurred:

## defconfig+allnoconfig on (riscv):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:67e6570a67593f2aa03b74fe


#kernelci issue maestro:e8a8df1a8dbe4233bc72966485e414a11bfedeaa

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
