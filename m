Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD974A06
	for <regressions@lists.linux.dev>; Thu, 19 Jun 2025 00:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750294748; cv=none; b=OQPga5L7fINt+jk/Hz2Idlb5LpMM3z9DRUuGi2oYpWidaThwSAruAmm2MLwKQfepIjQFqlvbQegrs9J/r4VXxKG372rA9zc6SkbgigoMFiDqJRl+bb0ai2bx5qgDDHSoT4Ax3fmmgQLVQ4qMDGsuUtoYmqW1DeUhK+6Os2+NJbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750294748; c=relaxed/simple;
	bh=2dXouculRqdz2FMdmNiFIvn7KyhboOX0h4Pp6Q0OmcI=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=doM7j3dvSzKNlAIhSwTw7ZACd/HuYD1Yerp7KkmQKgr0AL30hLrcBrSIFbQVXWd6SyCpqxHtT/e07LPI7+ibnow8JgRe3SnNoqQtc94XDOI7fE1r+KNX4FXLCiO46QNMX/6xMcKzRFTAqyDMEItNfjp8OPa8milGMf8zqDOiCJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=DotG3RoR; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="DotG3RoR"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70a57a8ffc3so2548987b3.0
        for <regressions@lists.linux.dev>; Wed, 18 Jun 2025 17:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1750294745; x=1750899545; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmSSaSLr73F4jwodMOTCopbNY1Xc5f0H+u7H7cz4Op8=;
        b=DotG3RoRqsuvSD/OITbNMZ5WUWBwW9GK1Eal/9WfzF6mQ99X+HQXaFINAA56S7BKsk
         2BRREzF1nIEKnKPBlV8Yjko2ppzMfvyMWVEqzf+Y+XXXUU1z8sOQluMP55pBRz+89sAL
         4FXmEPPU4STFC4LtuRAQTBC/h++rXL3NFUjyXcPVjY/BZoCaJHtXXRxoiTuoR8nKOlft
         jHB9vHeU4GDGN8S4+VWsJ3zfmP0agUKACdansTfPbGFU7D5m7IEqZ0CpIYRRDeyENJtF
         pr+2zMRjz6RTcHl7qXOhpkQxm6MHsiWg6+uCGg6SAPju6dJVh7CDxnu74l3Kh/m1sn9G
         9ncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750294745; x=1750899545;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NmSSaSLr73F4jwodMOTCopbNY1Xc5f0H+u7H7cz4Op8=;
        b=uLdb8RfYIES2+j0YsqJxYp4zwxoHuQmIseRHHw8weLN1tVwm/Gf/6quRWh2h2ZXuLK
         2VtIFsVvxXVhqqEn9YDEW5bAL74Bg6UXiPHUOewznnLbeT5ANTPP4tDGQJFNUiUPCfPK
         evXjZIxzVCijei89X/Y4x4ZxN6ndS6nnxfEWFIjV3xobvoZrQSPub51AaOQBE8e7ZnIh
         O+p+orzb5V/+i4XsrKlYwMr2ZEtGR4twDY6ulOF61RsiDyoyoLch7s88Ib+Yth9GPzo6
         t8VamR2sB0iB2F9cRuDbXvOdFjKBFVMQDmiSZ5+HObjvVT4ul9NybsqjQl2mLEOFN7X7
         Rdeg==
X-Gm-Message-State: AOJu0YzpW2La71oUjvHhoSyeHCpkt2ctBKA3iW+5Kr/5KMFLtiYhnxOz
	jDSPIEpSo2Hu2otG4eKjXSuVsE5FQptEyZopl3S0koiUBqytDvb6llM0o/YK8GrqzK+4mugNvxt
	3ncr/Ry5EP1C8vvRnIk3qNv6/w1+diIuT9WZacXzR7A==
X-Gm-Gg: ASbGncuzTJ4cgTiMOQjsGN8nKrgGVjYjJR7H/2DZv5r/YZMNYu9ib+dNsqC12zOXCgG
	YTzyn0hSkAUEj1LGRNbXcS/Qel22y+ME6SAphnc8T5gIFc1ci9OokfZLKghyfh2iHRU+zP+Cxc9
	bnQyOWcUI2xkFGh8nXZ6zR03nlp82GxqE1qFpdTzFUBw==
X-Google-Smtp-Source: AGHT+IGcHsrd+rDMDw1r5DN1tnseLZ2OI5pAYYREf3DTAsmVlF3onKtIFnXRU4EyNVRx0T1w/7+LzaUDjpOuKLZzX0k=
X-Received: by 2002:a05:690c:6903:b0:70e:2a0c:bc5 with SMTP id
 00721157ae682-71175521e78mr276225687b3.38.1750294745619; Wed, 18 Jun 2025
 17:59:05 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Jun 2025 17:59:04 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Wed, 18 Jun 2025 17:59:04 -0700
X-Gm-Features: AX0GCFsFTueKSCqM2pUkM5eceT9OJOc53uOeR2L4SgSjzIP9hRpBwQGtsDVpy08
Message-ID: <CACo-S-2e1LQ76p9usC3=PWQQKS0UunQ=cMPrjO6JTBNpC-b9TQ@mail.gmail.com>
Subject: [REGRESSION] mainline/master: (build) stack frame size (2208) exceeds
 limit (2048) in 'rtw_aes_decrypt' ...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com, 
	shreeya.patel@collabora.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on mainline/master:

---
 stack frame size (2208) exceeds limit (2048) in 'rtw_aes_decrypt'
[-Werror,-Wframe-larger-than] in
drivers/staging/rtl8723bs/core/rtw_security.o
(drivers/staging/rtl8723bs/core/rtw_security.c)
[logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:c94df34fc8be78cc1aea40b95e9ec46e5832ce4a
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  74b4cc9b8780bfe8a3992c9ac0033bf22ac01f19


Log excerpt:
=====================================================
drivers/staging/rtl8723bs/core/rtw_security.c:1287:5: error: stack
frame size (2208) exceeds limit (2048) in 'rtw_aes_decrypt'
[-Werror,-Wframe-larger-than]
 1287 | u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
      |     ^
1 error generated.

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig on (arm64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:685338dc5c2cf25042bf5ac1


#kernelci issue maestro:c94df34fc8be78cc1aea40b95e9ec46e5832ce4a

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
