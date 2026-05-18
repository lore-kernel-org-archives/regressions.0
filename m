Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9B147D938
	for <regressions@lists.linux.dev>; Mon, 18 May 2026 13:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112747; cv=none; b=IEDD5dTnFJ1q2a+kXzE9I5yDjf4E3Ut/8OMjo2a8Mr5HHHTzl5pce5D9dQ9jT7uRfwiUWYYTxaq/VT/IYuCzXgF67Aokkljdhn0NBP8N6ss8ZayGhuvTZNzVdS+k79QTXyt1iefCcyjoatLlj4llIosqN384cpffGIgFE0hvDBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112747; c=relaxed/simple;
	bh=byBSY8/p4MUqq7nTg4fDT/uexWJQLmz/HqHZ0zlkuWw=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=g0gID3D6jt6Hb6sT42sERsjaTac+BYXVToNsDFX1MfFmJDQL61IT6HPr2B9BQe0eQnCPDz16KQ42VsPusiXtUGtwWzQgdqAafxJukI8xM2FWN/m5MGXHM/cd/aqFvGK/ZFrz3NktHfh9iMx7wHB5KMd+WbyAFJb1ZqfEGeVafR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=AlqmrRIi; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="AlqmrRIi"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c8f9846c8so2602700c88.0
        for <regressions@lists.linux.dev>; Mon, 18 May 2026 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1779112745; x=1779717545; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLihxZ3CAf0WAx03zk131v5nnNf6cERDVla+NTBzN5g=;
        b=AlqmrRIiv1+67kEs8H4EpmNFUVJQvNha+kokn/yxBtfZRGI4LqO/gDuoaasGP7vNFU
         /2THypdkNiIqVHDrjWA6iucY17pOeC1VUQvhIT/W1NJfZwut0Cxqt/rEizqCK7gh/bRF
         2i+4LbAnyfir/aitaHVQhiZ81l8nKMHEvorwS+P/TpZCkuh7uVi261MNR9xkWmUiQ9k3
         t+8OJ3eL4SA0ld4oMza6T21qfXePqXMqQzyUjGNMiu3MdVPYtFJ/JLwbz2EXKxTIFH6K
         RDHGXIWFUU+IGDP0jlposd23cs/lQrUzhUCtEPoj+TnBdnjmMkDgO3xHDOiM2uCWdeN7
         TC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112745; x=1779717545;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CLihxZ3CAf0WAx03zk131v5nnNf6cERDVla+NTBzN5g=;
        b=Ae09sxozS90bOExLsq9BOc/Cj20jFLJTOBUhScvga7TolnPNo+5Jf0BcYKVHSqQb93
         S50alGGPhstRHrTc0iQdJeS2lm3KCwnmWEDTOGSz/FDQzjhm5SSY9vR+d40CfahoUbau
         jVbDt/AjkMkuaakcx4k/6LObaIVflmaGeNN4c2IY91rwZeE2mj1kxUgkMizbn0vil/be
         q2x4VqK53fc6hiGrAv0s4L6kKAPtfmTikRbvjNnBrfqpTI/frgmqeMu3jK+NGzcud9TD
         YWdZszR4AHe3EDZYbbKtxMyK8Se3qUqvSTl6nvt7EEyYvUdw3dWUiPQuU3CVqcfURc4z
         mqIg==
X-Gm-Message-State: AOJu0Yw4cisCwog38Bua5E0zpLaTOuphkhG9eDw2RIRqlnFo/lY7XD8H
	32wo/jrsidquyUHxLVh+jT82QCRxVK1hZdsWQVV1RRY41XlR0nfIKTchFB4TQespo8k=
X-Gm-Gg: Acq92OGcO8QqwMQC3EGLrYHMlOqYDdZCN9k6G0YWYBbYPU5T+IRQO29xeEn0a/Q9FJN
	kmooXliP66JuaoLXjarjNsgUMDz9uRrGN3EaG1fK0w3zF/LRSStETI3jkYl1lh2vI/gcMMYVnqb
	VqB/GM30J2jV9i2STY8BUSmL1K5Z+QbcTqU6vO4+aC/KU0W/pFC0gbQq5KC7uzvbjn0NehgTKvs
	INMx9ltFerGK3arLzJi3ckqq8VwT0B3+yzURWr5RpY8kgS2FwFzoA4psKf8atCLDUEY/PTtGekb
	9THl2nmaYXP+FcFrTY4UoJKUc5y5qO9uHtvO7ChGWdJ3GV4e7z9a/bBElOl6hHpxlVqDPmdnrBn
	UC+WBP0UG3k4YhIJmaDPad+BtzvmAYVfdQxRy2HpUVr2XFL8Jc4lAwnHNVR3nLckKQ/P/xy3bkz
	HE9523ts7gZq88uUKzfLV5oV1Mc2g=
X-Received: by 2002:a05:7301:198e:b0:2dd:144b:6c2 with SMTP id 5a478bee46e88-303986a03b9mr5812003eec.27.1779112744876;
        Mon, 18 May 2026 06:59:04 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcc458sm16517523eec.18.2026.05.18.06.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/pending-fixes: (build) call to undeclared function
 '__huge_pmd_unshare'; ISO C99 and late...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 18 May 2026 13:59:04 -0000
Message-ID: <177911274362.2366.9336793608219101169@330cfa3079ca>





Hello,

New build issue found on next/pending-fixes:

---
 call to undeclared function '__huge_pmd_unshare'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration] in mm/hugetlb.o (mm/hugetlb.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:2586999164f3c8a7d01dd3db2d8850a7c0865475
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  298cc5aa5aae60cc009e3cd66ff730bb53e3e1ad


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
/tmp/kci/linux/mm/hugetlb.c:7281:3: error: call to undeclared function '__huge_pmd_unshare'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
 7281 |                 __huge_pmd_unshare(&tlb, vma, address, ptep, take_locks);
      |                 ^
/tmp/kci/linux/mm/hugetlb.c:7281:3: note: did you mean 'huge_pmd_unshare'?
/tmp/kci/linux/mm/hugetlb.c:6973:5: note: 'huge_pmd_unshare' declared here
 6973 | int huge_pmd_unshare(struct mmu_gather *tlb, struct vm_area_struct *vma,
      |     ^
1 error generated.

=====================================================


# Builds where the incident occurred:

## defconfig+CONFIG_ARM64_64K_PAGES=y on (arm64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a0b05bad06a47b7c8f81a2c


#kernelci issue maestro:2586999164f3c8a7d01dd3db2d8850a7c0865475

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
