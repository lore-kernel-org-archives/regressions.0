Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AEF317160
	for <regressions@lists.linux.dev>; Thu, 16 Apr 2026 14:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776351548; cv=none; b=K2IQlEY8PpLJ5gk4h2cZo3g9c4DQh2A+XURozwkmFUOUDEO9sEiPzB45t1/oJ5gyBU6LTuyX+laCnXl6aRAs3CFE//R4brIUmW3ykouiy3EDgsC2AYS5GiE7e3p5BRo3UZ41ssV3Y3vbvaG7ehc1pB4fXQgCGZQ2et7Y5I36OYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776351548; c=relaxed/simple;
	bh=nEZcCTbMV54noQ7HylpoVGyqeEZCV1ATyFsiiMR67aI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=rhzoIDOOilYHBb8XmtURzxNqk/6QCjhOoGI3k3vJdfinQyBDWhXGaN6SRvv0U+2lhw1ZQ8V5mLT9a+7DRmoiWmE4zQUxDdtAZ84ALQ2U9wtkRV5ka66S2sBw4nbwQu1oNGxFYHjljxDfjXFnKR0d31+y6kGlQJgIUgyG1GK+58g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=MNKm5Bjc; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="MNKm5Bjc"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-128b9b7e3edso7973015c88.0
        for <regressions@lists.linux.dev>; Thu, 16 Apr 2026 07:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1776351545; x=1776956345; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V384+pK9nOIGW9ZWI05sugBChJBTGGbB1XgQN6V/XAw=;
        b=MNKm5BjcKoLeQu7Wnt358D4qhpCfTm/tQQbBM+t4K9QFojumCsiybQWqbkLcw+ZRhE
         zceUOpuuKkCMXoxzrFoXjn9kVTTfiRgM4ciq2DDgX7hvahzLYqlxZ23Jv+PZR1UxJHPu
         ahfOFb+ILtlmUAGMuiGfiw+a4z3R+NoJEceQirNF4zvQTyVpYc7Uk81FS+sTlw4wOnvk
         cJY2koGX1ucbDjIhprUJuo9YpBIVNNTvhOa7duduv5n9WnvA71Xulvffzr7M4KWZkNPP
         FIkSWzDnwkZLdISy8onkc3JHhtSc2LqlUMJ0xJLXh5DW1nMSxz7ghSTwpvsbwRSoNS4C
         LjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776351545; x=1776956345;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V384+pK9nOIGW9ZWI05sugBChJBTGGbB1XgQN6V/XAw=;
        b=Vq3/f6MS+k1l2Zv/1KIZsCVjmIiU1sL4UJEQpC8KmgzeBc1m++KnwRyLlayUSrHp4B
         jPd5swUoXNO56HKOCGushRDFDXZhe2yGaU8mmcg2ZNe6aZaMsitlWwYXuAlSlTSxIyWs
         qYbABfN3O3bpO8daxsSV4ndaKXdSmNvlSXa2OkQILiSPrEv0WDp/lOJ2lZZqYWxOhIhL
         EguJz5ao6xqYIT1k+bP4sDJFX29TA9Mia/j5Qe9xHjh2xcQ3QEBMMCtHYeZkrQ7qwqhx
         otA46AfBeV4/du0L8EoxfwK1Ly5BMPKrIKHMnCu+jxT1BAp+/fWg9IGWExf1Fbphma4d
         VjcQ==
X-Gm-Message-State: AOJu0YwY3UdU+OR1Wq2HhdGAO8SPVqyTyCwUPt7MQlLmOILaBbJCu8KV
	wCsi0ATJgQg4ZILmS9keoY/DEc9PnEuuUWjdcfm8F5YNC/AnflWA885qJnWx8xwEVIdTtADP/Jh
	lL6o7
X-Gm-Gg: AeBDiesUQOuEEYh12uGMNw1JELWHQcU/ciJdHJguN82B63LdGNxYT2NbaQqZHoZ5AKw
	5CDsxjTPyHe2O6O0AeQRF8rOAIVpfCCN720nAQanxuspI7odEX9dUAZJMhD9uCoQWmWb6a3JSZV
	hqLFbl4lLhVB4qNwgpxDbJmgMbGLnX3cakkvCiQhXymx9XhcCHz5ivHOaIrtciusY5/oyMJbl7o
	ssa+uImhmpj41SHfYaiEGFHBbHpOSsgKeBEMAu2jW05tTuMUdH1D5FNRNtwx5VTBfah0Qa25TQp
	2sBcCOJvgf657o+CelIH0qfLykReXiB7jdEJWy3o0RgTtTTWZGkKb6KvSb1eLFp/aty+pPNGo/6
	YINpODv/qbwbupWi3IFPR9qpuN1wayuTGq7uQ/xWoUk6pIo7wSketJSG2kst7syX1IYuM3lN9pb
	GAg0mFvQh8JFuCP5EUoYegRMgPGkQ=
X-Received: by 2002:a05:701b:2219:b0:12c:6da8:8570 with SMTP id a92af1059eb24-12c6da88750mr586006c88.2.1776351545082;
        Thu, 16 Apr 2026 07:59:05 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8fa5efb6sm7926116eec.28.2026.04.16.07.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) "byte_rev_table"
 [lib/zlib_deflate/zlib_deflate.ko] undefined! "by...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 16 Apr 2026 14:59:04 -0000
Message-ID: <177635154368.6552.7060101263009785041@8692ffc4d55e>





Hello,

New build issue found on next/master:

---
 "byte_rev_table" [lib/zlib_deflate/zlib_deflate.ko] undefined! "byte_rev_table" [drivers/net/ethernet/spacemit/k1_emac.ko] undefined! "byte_rev_table" [drivers/net/ethernet/stmicro/stmmac/stmmac.ko] undefined! in Module.symvers (/tmp/kci/linux/scripts/Makefile.modpost:147) [logspec:kbuild,kbuild.modpost]
---

- dashboard: https://d.kernelci.org/i/maestro:48f931aecdceb03cad626bb809f8965302b7fc91
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  452c3b1ea875276105ac90ba474f72b4cd9b77a2
- tags: next-20260416

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
ERROR: modpost: "byte_rev_table" [lib/zlib_deflate/zlib_deflate.ko] undefined!
ERROR: modpost: "byte_rev_table" [drivers/net/ethernet/spacemit/k1_emac.ko] undefined!
ERROR: modpost: "byte_rev_table" [drivers/net/ethernet/stmicro/stmmac/stmmac.ko] undefined!

=====================================================


# Builds where the incident occurred:

## defconfig on (riscv):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69e0eea19b5a968309e4e915


#kernelci issue maestro:48f931aecdceb03cad626bb809f8965302b7fc91

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
