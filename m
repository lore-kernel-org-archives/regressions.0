Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9103264D0
	for <regressions@lists.linux.dev>; Fri, 17 Apr 2026 13:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776434347; cv=none; b=VgejjczPrLRAaqwN9bJKmKcJaRCdHKXHxXJWTUZSzdkqA+xE5DvMZHxol3TeQZzRWiCqRSE0UJGjyA3FfXpMOxxlBHZ7EJ9oLgAGBe+OGbzMp3OrOR8EuDc0uNRmKGgfmugWkgBDo9pigeLzw1k1aTrd9b7nGayo4sv+7uHZnIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776434347; c=relaxed/simple;
	bh=Ws7Xa9KEaYmSddK6P9t+airuD5pEYV4+PwU4u/5xjxg=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=LsppJadneotPCXvscGvxYR5/VnsumnTEbXwNShnCeB5p7bigsxvWA0FjPOoYY0v21gWTdgwo+iNYR4eGaSL2pYcPOgqCDea5TMIr/RTInDsnyGgkeEPiZ5jVuXU+xRUoQzi/SW+9GyUz+PwrshQv24leuyl1CdkBmJ7IMmTLpDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=PXps/YhC; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="PXps/YhC"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso611252eec.0
        for <regressions@lists.linux.dev>; Fri, 17 Apr 2026 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1776434345; x=1777039145; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LO8PgW2PfAuIwu+ycMUGMbnWKP5/gsHv03hfidGgBvk=;
        b=PXps/YhCcMwsIriZC2fVD/2U+60mCWcCorYO7rF7cINBjL+PV4cBi8LYRRQlEsTUD3
         kp0ocJw/nD9RuAZ2fYTG7tUW4c7kXVTa+UELjXt1tQuo8eWfysRDvvTTv72LWtyiVHqv
         au1VPJB6AtqTK66ABAwYpr7FMvGo4bikwDiB4nnBWOZ7UZnfNx7pj2unCN57OqcVUTjl
         xfueIeLbzcYZBQd9+uNnP+JGQ/k/Sg2e1yjgnDzIRT2ksTYZ1cwOPPI1OG6vtfBF7X8W
         RkVmxV/Qt7V5y1QXoX3QSyfVp1ocytnPuOUqIKClpW4jYu8VQwPtiGvRSmA1zqBSMNQI
         2ovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776434345; x=1777039145;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LO8PgW2PfAuIwu+ycMUGMbnWKP5/gsHv03hfidGgBvk=;
        b=B7vYbyb5pbFYqTME5WrXQR4YHcich9tURJ3cdeiIU+a22UwMGjGFGTQdTo6pj24Ezc
         JMyLo4swX9vL8A9YtECdLVyvdjg4zTWJnzRCOhtKs95TGSvo2ubkRUT0/qnfj+xc2AqD
         JRN3DzndsYuUvfZEvmL+Po09Y0PcNy0DghmYdtYnebFlWhk+/0Or4c44E7zj39fvFsqM
         q5PeOFjkYZHKVlwWhqRtshPr6HHrL8w04D3SNBgHy+Jw212MPygjncDqdM6pTVhMYsyz
         QYXtAo6n9Xvec0tlwvF31TMUk9PjzgXAVNXNf9aIcwq4+Gpz4I4shjQqWVzIH0kvMBbb
         MKxQ==
X-Gm-Message-State: AOJu0YyzTT/IraJXorn0XneKkX1WzGcCYKGNu99CMo2A7Ig1NCC1KHbn
	Um9brDyktLulnMz2n7Ok068Ge0+WGtElzhlCQfkXOLAZgBjdFdOg/4hHDyFqjXlnNbY=
X-Gm-Gg: AeBDieuxyttpQY0Cc6JmX1mKDKAlXT3NSxQq4UNWIVyc7GDERNxbRMnE4DFfPBXFofi
	KlwbrdWOvWuhBfMGSeJwBs0sqZY2aiWvsvgYq+lI92QU04Os2R1+yLcHocr77Ol09oHdf94WOzJ
	X8USVFLgTWC0N3Icc9HPfVqfsAutZEcUr+YXqEtTWTJ0zg/zOhlL29v9fggkb9eExFABbPeyeHp
	NeX35eYIfhzmSJDSRr5sFxW97nbzOVLviDid87cEPThYHqhBPeVpEtpzWzj0ubkDJQ6wZjPEsqF
	mDKsENVBOH+Ouj2kF0bLEESlPiCmF4Qmt2dPuFgFVre3hP3bMKZXfOcKn+cFgYB/8gO0RM9IG/v
	on8nGIjKVY8nd4Zx1lOJgkBJjvBGSbTSCKgNbDo4P/mS1OhL+AClexigGObNvA58+hGw4IKgiZT
	PQ/lCRuc8d6jxogmAp92xp6WNN7Ms=
X-Received: by 2002:a05:7300:e12a:b0:2ca:bd22:6102 with SMTP id 5a478bee46e88-2e42e200939mr1103722eec.14.1776434344414;
        Fri, 17 Apr 2026 06:59:04 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccce426sm2271911eec.16.2026.04.17.06.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 06:59:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/pending-fixes: (build) in
 testcases/mangle_pstate_invalid_mode_el1h (Makefile:31) [logspe...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 17 Apr 2026 13:59:03 -0000
Message-ID: <177643434320.6991.5055370416927110654@8692ffc4d55e>





Hello,

New build issue found on next/pending-fixes:

---
 in testcases/mangle_pstate_invalid_mode_el1h (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:ec180fda1c0b1d467ccb20161a74c09a0c2c25d5
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  db41a388b15c9bb61a1f6535b82537ff4081ca4c


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+CONFIG_ARM64_64K_PAGES=y on (arm64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69e21e839b5a968309e51dcd


#kernelci issue maestro:ec180fda1c0b1d467ccb20161a74c09a0c2c25d5

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
