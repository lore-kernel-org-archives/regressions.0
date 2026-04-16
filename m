Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77068199E89
	for <regressions@lists.linux.dev>; Thu, 16 Apr 2026 04:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776315547; cv=none; b=EQW3XJNgDPgxZrdb08zSGd8AGhq0nLNt6muCcoV7YatRGoZMB4AjbfH0Swm5goP0ksTpXBU8whLMomuE5Oal0as+6hgR0WQGe2uKGCRKtx1X/WgCF466YLEcJ05YEqAMqPjCQWobH+zSr8/QIqd/Z0y4bF6hu/L3zO+mwYEuRD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776315547; c=relaxed/simple;
	bh=FS/uE5yui7IFQ1XLU18v+aFfRCZ1s2h5PEOB6/YOoZ4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=M+QUfNbAdc/qpO5ga2E6DWsKaJjmlrdddzY1HLjok9hV9PlBLGSuF8jmUDaAic8rr2pAfZflApgCDpXHCHiPAa9FeBu770Rsr+go96n9z0x3Uskzcncdm0id5PcOEMMSUJ4rPWTEKN1QmeLJs0VFWIQ02fx4W4eYJvK8L7nqBCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=H3buTqF/; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="H3buTqF/"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c15849aa2cso9010190eec.0
        for <regressions@lists.linux.dev>; Wed, 15 Apr 2026 21:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1776315545; x=1776920345; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzpnAkdsoi2Ex2ZmMhsu4dkIqSOp7pyrenjEwFPJ6NM=;
        b=H3buTqF/HQ1ButiXksEQsA4flLUn1a5ROZa+F2w2sxQBU8eq+9i2qngrKW7zAIiPnL
         LhunWJ4R8XGkryCqDWYEeVWuOM9YfX61xu2njkuX7n7C8r+kaP5ozCjuWEbE8wgbqdHL
         bCkhZg0JiwooTG/xE5C7IUZ8Tr1gEttwF5362s0niWE4YoSLmmU0DaG4F2aRU06c9n4j
         AS3ToLYedS1telE0odWQV6GvecFwQyqKvZ7GRZO3O0g+03o8FQjcFgmcdcjeJezYMnAv
         2RIn1WncYGCD3RSdNzJ3kH79THmnDwbhnTtQfUUbfEYbGa8Tw/S+u+o+UVDjME+OCYlV
         dFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776315545; x=1776920345;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yzpnAkdsoi2Ex2ZmMhsu4dkIqSOp7pyrenjEwFPJ6NM=;
        b=tGJBbTL/25ogKoGSXTc9hfs641zfJwIyw1PEUhbUP9nfNVN4agSvE4488Az9/fNYdG
         AoUV/0rhwzS+JeIjlx1rHwON8HMH4lQbhZkaxBoXjgmPdFkMHhBa5SBqM3cHFcIkkWSQ
         8ZjrUf3DZiL5UkJ2sC/zKS8FuMHupH1hRI7l6iNhqkpk2iKlfdo5Qs1AYiXLDkvpjd0R
         2RJt5iU7e/g7pVO/afVPCy5jgtPjfg4JxJMuoC9HMc/18M7dJAXAFCW/3RzrJzQ2mYV3
         J/pK4Zbm/4ozps+6jjLRjD6AdNnKza42uIQ451yJPqR/64Mxqqzl6msFeDaaZwIoXcP7
         iF1Q==
X-Gm-Message-State: AOJu0YwlCrwIsM11MYEBfqIZRBeqCge0raGX0ACiIVk5gZRz+52QZ5Bm
	o+Ib0srmz2/d910l8v5R/Jr7iwBPF4Xk/YKkHtdWtMWPZZ+RGmnWkbpGJgcMIoRkqTo5hAoqN4K
	9iyYE
X-Gm-Gg: AeBDiet1azb9/UP7xpLuRFP57OCxbqOU5oRgfNhURrdN1iM65vBgJZpYzuJAYl7FHsk
	n+jxZ0Gm2bLVou6Pl0w0PGNOCQIttIb2PtfXzOIiY2O7nmOQnj3sUc/aAAA5wStaHdJhdTsSmDi
	JCpirY32PjH2o6Wiy9sUeu7jT5wsiOnWt6d9hAzvH1GwEg1Ei9zvWZSn+a6qlIP6SYYEzWArsNb
	FvQREWX47DWneunZ8s9HuMHutqlQq2KCL+O721TdPlgQmB1D4/TXmfJlLAcnBZUtmfkAlzXT//W
	71Mf5XWEhzAdmxKG8OK0kYHZqVosulv7EgCc0S6Zh/h9CAa44pWTRrmy8b/5k/PoYWh9k1lDntM
	5xNnz1pU788B9YUdd/gYLX+pVlTXqFjqOSX8QXeoACQiWVXZP9Pv+tQk/amnoPCTeZQarXHz5IU
	3mfkrO4Opne81xZBTNzywMhBNu5A58QuThkiM79A==
X-Received: by 2002:a05:693c:300c:b0:2de:1508:937c with SMTP id 5a478bee46e88-2de1508953bmr3678581eec.24.1776315545471;
        Wed, 15 Apr 2026 21:59:05 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8919f9a0sm6023576eec.0.2026.04.15.21.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 21:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) in
 kernel/trace/simple_ring_buffer.o.checked (kernel/trace/Makefil...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 16 Apr 2026 04:59:04 -0000
Message-ID: <177631554406.6361.12830638488424544998@8692ffc4d55e>





Hello,

New build issue found on mainline/master:

---
 in kernel/trace/simple_ring_buffer.o.checked (kernel/trace/Makefile:147) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:dc6932917e2ae83920fc826fdc9ee564f956f14d
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  9e1e9d660255d7216067193d774f338d08d8528d


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## i386_defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (i386):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-i386-allmodconfig-69e040569b5a968309e4d052/.config
- dashboard: https://d.kernelci.org/build/maestro:69e040569b5a968309e4d052


#kernelci issue maestro:dc6932917e2ae83920fc826fdc9ee564f956f14d

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
