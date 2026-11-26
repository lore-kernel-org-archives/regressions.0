Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715947;
	b=c+wlMRTteS0zIo15pPXoplEqAovxYEVMnautJyzcv3h+T2LnQnhrXXHEI8ReBkiQds+o
	 HzOSlCuRjEL8NwsYOtKeW/MhTfeCYrry5k9Hfj0sPVIgnVzyeRmTfHWk75YahzgQndPCh
	 s6Q0AacElFeMkxYTEVgG7NjOrzu9vCE+Uq8mZ686zp+W6/9EP4qfOKQyqTgesVL1Sqa5Q
	 JhKQILgtv6BNthfB4FzftV33r5EoqDTnLsdiDqttAdb95P8LCCJfHJPVCGbiy6p/eDx/a
	 XLq7lvamPx4wSrrA7+CIYSVSDbny/51naiJiAMBs3TJT8rx0lasvj68uTh7GUONFHRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=4erU2ocnLd41FFsf4SfKrSJe0tbRlNaGbiANYLjYItA=;
	b=Y2RNfNOdCMs+tNJgp/IGbBDuU+uj4tf+T4fzK7fUYCLpObTvSdJptx4fpA+AdsHqUlyK
	 kcW1RkATGtRaez0XyzPSrWJ5BxmDOciZPJQuuz6xyqTYnwJkWCKcqkdTbBCKk5zFIJXBk
	 WJ18rKqD1ROF2xDxlqxHP2S2fXAP51cMu918Lnk5QUDO47778xaJHaP868xIvBgYYKbh0
	 C4/3WuFUBiPVvh9cXVlUXb8CMbZD8hn8M/g7/aO58Fsbkl97ZHVZenKJ4EaN8dMu+cpXi
	 SvcC2uqovnlv3CT8KBA9KQeG1AgrwGmGLNO4KrB+Y/DhkextSB+6W516uX3K8h6m4iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=O0EobVfL;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F22606A31C
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 17:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6F22606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=O0EobVfL
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso15392251eec.0
        for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 09:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1795715946; x=1796320746; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4erU2ocnLd41FFsf4SfKrSJe0tbRlNaGbiANYLjYItA=;
        b=O0EobVfLWcpHsQF4OOfQw0+eY+gjCK/N2MGWC+/hchwfpWZmYmlWm9spLAwI0BxmJe
         lgGOh8i+07lldrLk7+g/hLkWG8ZaHiFjGHFS4V6HbigqdBLU+ruMWNrjWgury/Sf+OWb
         4GpdfVSXNNN7j313dofXpEUdjerBvcCiCXnS2E72TPa+zoUw+N74khMylpAMk2lzpsAc
         EzIoUMr7jSjIbt2DhY7B/KQhD/uvjK1/ZyJiqvf8KOThhvFGzbqVYWYpWutBJp1ZD8zr
         smvEqYDjqrbY7iKmg8TpGHAaswQqKgyya2VutbnyeKiOHHsfNVNcGF2BE+nPbSXiWwSO
         pWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795715946; x=1796320746;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4erU2ocnLd41FFsf4SfKrSJe0tbRlNaGbiANYLjYItA=;
        b=YF8OnXkpGneCtE/qwZ6QY8xcR6iVfPrVU8Yqw6wnAYvwEN1t2c6nnpMffnjL6EoSGO
         Uf98FUsmo8Ze4sFG7THGgGtfh7TSolGAyehuqj3xqUMrujjw0HmrSQ812DoWH4nUZx2X
         JRN1y40JgCu+CGaZq9KitJ0VitFEaU/poVeIW0ApNe4nkHJ14GYNkKZRA4No4BUyxGwB
         MbomfQLk0QhFeNaAHbl1ltJkOzhY0gDTXZbie/7DeREpDN5NPgKxEjuQJnu3bFKyB84v
         BKuu6nTHhNMJyNlzbMjcxiehwnIqbZ+PQxD8aj9wxpMaDq2p2lLUrf5ihz4JsqyY4bqg
         MqSA==
X-Gm-Message-State: APuU4Z8lhC7MPUYn4oA8Q55n/V0fnL3eQWE+7KD4RYmXozFT7MwVkG+7
	WqJzuJ7Qk4KsMf3hyon8d5IyxJ9XLFuoZ7kfKCQq13Cq3YtZU+16DvM3Ww9vxr92Obg=
X-Gm-Gg: AZFdTZeB/aT66b32mLGaoMmoyqGv+LSW4c/3dWKD6amxSwI/Hd3MBKUxfNygzHNzRz/
	5vvkZtzpB9fltK4zhk8HLgpWqbEO7sAdBL08f753vOW9qdPw5IL0lUbfgiyGUcVZd7mZR0sJd/d
	gPcAHEKpp/xrTBFBuO0O8ckZvOrYvfYdFUuo6J3HyG5+SmtCB+D/5c5bDkHfduc42jGTeCCrfdj
	dZ5hTs9FzU8+AyKcgsOPsMuidsuYp8FfUIhrF//5iRlnvoC6hKvKYeGfGw26HPOgsRMiV6Ek3V2
	hIGuxdaqvQP81wFnI5UIbsGkV4ogfHtHsFxuoDGdB9OchMA37+ASufyLpPpLh5s5tcUdU4YFAmv
	h+DM0oYCfNg+JIYEzhbnCWTLcXn+QM1TCUJvxJZ9OXugR57JTpdu6ywx47DhqUbqk4e58P75pLF
	cBtBS9kXp9pp8dX2eoLeUc6I0QLgpPpgUB6V7w7B0iyIp8U3cxNOYBZ/l12rZdgwF399vcckM6G
	c6RfteIs1M/TUzPaZtP1WCGvkt/wesFPs6Ry+7em/7VvirKZwXQEByzttjYZRDpL2EYYfaMdSdG
	fmrElRQ6HK7SvKCbHBRpc96L9QhZwxcQuv+GNClhKKQ=
X-Received: by 2002:a05:7300:f0c1:b0:386:9b72:274 with SMTP id 5a478bee46e88-3869b7211e9mr18809885eec.39.1795715945716;
        Thu, 26 Nov 2026 09:59:05 -0800 (PST)
Received: from 52d83ede7c60 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm67751165eec.12.2026.11.26.09.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:59:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build)variable 'data' is uninitialized
 when used
 here [-Werror,-Wuninitia...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 26 Nov 2026 17:59:04 -0000
Message-ID: <179571594356.162775.14762570358001870919@kernelci.org>

Cc from: regression/next.yaml

New build issue found on next/master:

---
variable 'data' is uninitialized when used here [-Werror,-Wuninitialized] in drivers/gpu/drm/amd/amdgpu/imu_v13_0.o (drivers/gpu/drm/amd/amdgpu/imu_v13_0.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/imu_v13_0.c:264:30: error: variable 'data' is uninitialized when used here [-Werror,-Wuninitialized]
  264 |                         program_imu_rlc_ram(adev, data, (const u32)size);
      |                                                   ^~~~
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/imu_v13_0.c:256:17: note: initialize the variable 'data' to silence this warning
  256 |         const u32 *data;
      |                        ^
      |                         = NULL
1 error generated.

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179571594356.162775.14762570358001870919@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:519b71c76284c9e0a0e9ed341a6f47f0acfcf144
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
- tags: next-20261126

# Builds where the incident occurred:

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6b086842286e1965ecc2f2e6

#regzbot introduced: 9437046953b2fb3bf55b36582450ea0267df82a7..a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
#regzbot link: https://d.kernelci.org/i/maestro:519b71c76284c9e0a0e9ed341a6f47f0acfcf144

#kernelci issue maestro:519b71c76284c9e0a0e9ed341a6f47f0acfcf144

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
