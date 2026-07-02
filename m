Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6956D3B9D94
	for <regressions@lists.linux.dev>; Thu,  2 Jul 2026 19:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783022348; cv=none; b=nxgyb6vdc1FR/1tt6nk/8NikfLO36kMceDY+T2xI3B6TnTP2viH+XFp1bTLRhL+5MK7fYtW3h6WraEQBwh8wIHqB53ITeeAc2HryUK3s61+OmBoPmbmd6b5O8NWkVeORZKLhR8/ZkMlR/tSD3dopmBjFbZ22ddYXgspXU7vOaaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783022348; c=relaxed/simple;
	bh=N7sMNYyCdCft2/HVgtIUsYBlO8H6aWGUMR71m1Io/8E=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=MgPJ6SnvXXHBlQMjfQrm0s4c71reZtUci9Lp5zhECtLHSDyB8v4YWEKDYZO2zHeJFrJ2taGf5cVYXsBJsHdrrTvezD3z8+/Vuj8xmVeYKP1Ij8Y0VFjN11cefpfsQs4/eSJ0iCSQsGO94WYRmAd70Emh6iux42Z4k0s1jiOZMZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=WGF6/v7t; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="WGF6/v7t"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84592b55832so1922514b3a.3
        for <regressions@lists.linux.dev>; Thu, 02 Jul 2026 12:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1783022345; x=1783627145; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//smDyZLyaODru6WgzI4bTaPmxdDqgn7r/y5mi+8QsA=;
        b=WGF6/v7tYmVve77gwkks4y8yxJn/vDlpdhuHIXd5vr7286KxGTcQYHHjYBcn+US9pi
         wE7Kg0WLQ6FyzcUeoSOVEfMl4Bm6T89v17uTUv08gH4+3y0TcJgVIYnhxT9uiJlv3yuk
         WWeRTsY+E5DKDOHQ3j4WzkUtA8J8PKW4dxsfKBIq0279OxlAlTkxFjfde2fntGke9E6N
         04oXHsfX7WVnUE48rjCvhRDxG9CK70iY4owOtoaWaSgg8LMQ6ibMxcYXfbyWyGtzH6nJ
         DhiBop7pb5wa6+v3xSdQI6svXT098A4/5E6xkviKYvPUfKaww39CO0SRckx93XY49maX
         vXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783022345; x=1783627145;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=//smDyZLyaODru6WgzI4bTaPmxdDqgn7r/y5mi+8QsA=;
        b=BDNGAqok2pSBOm7DeBmL1Akg2ba2j0q2ApvgiARDlM3oFEFm1SIM8pnZtyn3TUsAGA
         nt8wAmKCfQqR6+g+fsJ0Lbs8D7zvdHu4GiMjNJeh5UIi9HgMi/dNuKyNnUB0QiFjFzVv
         0HSxw24ZCXhbDb3MYJytdLNCg2ktAO71yP0XQZCfidQdK5Gi1RIKkHXbyPA6v3LBMoow
         SNVYGc08hXwjDdIut8P4bewI3F31tfGUPFUtTAi13EDJlk28RpXhxouZnUIk/Lrsx5+G
         Az4IdvE6UojwGl0YPld9VnLIEZpTTAtexivnTJkZ3bCCbBS7zACZM7y8A1Fbun188Dwe
         0Ddw==
X-Gm-Message-State: AOJu0YwgDJo/KZqMjkVwzAGW10C3tLiyF1iMHBAOFdxii5hb8oLf5O1G
	WJjam4OK9dQvufEYQ5z1oJOsBA86DoS4kHOV6CC2vlxwXJov2nFXN9vLNvRsZR/uy6Y=
X-Gm-Gg: AfdE7clydqe9Lf1wG1tt5IPfAABz7VlTz25Y0H4o5SdQspdR53ZbYj2fEKezSLgdRE6
	uQ1lNqburzOVdFhJuCCF0tx5Pp1ZlCS1zAseJbWlK012owIb6U8BAeGI0Tt4vNT7AFMMxO1P/kb
	u8TJPna3l0cmUY1vfaZz3TEn3H0PrKxrJ1Bjn+TiwDE0Um1cXQrMWhAbubvvESXLMio8pTsxKXR
	2kg/4w8BYa/tVVYdGC/ZGqmRI5vugUoZGzEBZynwosNP1MD6UHUjzUqCmgmsS61gK4Vr9eBUHWu
	vyABE24X0hQXGpFWC3Fu9SWfHRwTT6GdQVczXL54nNA/nJODVevfEDz9pV7SsYwjPVGm1PPoga7
	OgulQsEhWb4Qb/GgmsmWVHkRa2TjzhWSXvlKWGIlKgeM2w8XOI4JCNnrXUSr9oqHMbYCjNx5WRh
	p2mYZe5A==
X-Received: by 2002:a05:6a21:4d92:b0:3bf:96c6:78c3 with SMTP id adf61e73a8af0-3bfed1c58d8mr8829772637.8.1783022345300;
        Thu, 02 Jul 2026 12:59:05 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb84405sm17531963eec.17.2026.07.02.12.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 12:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) module random32_kunit uses symbol
 prandom_warmup from namespace EX...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 02 Jul 2026 19:59:04 -0000
Message-ID: <178302234435.4082.10623859604470804974@kernelci.org>

New build issue found on next/master:

---
 module random32_kunit uses symbol prandom_warmup from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it. in Module.symvers (/tmp/kci/linux/scripts/Makefile.modpost:147) [logspec:kbuild,kbuild.modpost]
---

Log excerpt:
=====================================================
ERROR: modpost: module random32_kunit uses symbol prandom_warmup from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/178302234435.4082.10623859604470804974@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:e1cd3f9474953bfa22c13e3e3b216ed721272880
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  6eb8711ece2ce27e52e327a5b7a628ed39b97f45
- tags: next-20260702

# Builds where the incident occurred:

## ppc64le_defconfig on (powerpc):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a46b0edbb83f6a3e87f2264

#regzbot introduced: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc..6eb8711ece2ce27e52e327a5b7a628ed39b97f45
#regzbot link: https://d.kernelci.org/i/maestro:e1cd3f9474953bfa22c13e3e3b216ed721272880

#kernelci issue maestro:e1cd3f9474953bfa22c13e3e3b216ed721272880

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
