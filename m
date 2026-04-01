Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4797B2D7D2E
	for <regressions@lists.linux.dev>; Wed,  1 Apr 2026 17:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775066349; cv=none; b=QqPBYpJ5Mv33riLdQ6mwhvbyGtBKvQe5u4l4qUwjdZ1j8OcbAnaljKi1098c3u2HEm5TueboMaWLBunX6IMh6jG7sKMkBSuBpoRSBawVwN07Fi0z80YGSfmXVJPEvBXbrKazhYtGc2NQQDGpc3FM13DdNWsD5BP8fIQYwGLiJVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775066349; c=relaxed/simple;
	bh=PMimV6IRAsexYz+Az0EiPykh6H8AahKSick+vi1orGU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=qDzM3Usz1LDKiyfZ2e6LCF9MHMvZE31iCL3dYOrlh056NtfIMDO1okciWLMeH2Ahz+inDb+IWMpvl06vUaY93woLIUeJIkYvvPfw3uCPJt+d26lI/rQUh7gHlCnOMAtwz0CLLlTSQptD7Px977ymsMA68Ic7Ehkihia4iFvH9Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=aPTVkMKc; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="aPTVkMKc"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1279eced0b9so126644c88.0
        for <regressions@lists.linux.dev>; Wed, 01 Apr 2026 10:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1775066347; x=1775671147; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yP2iiD9aKCDLJNZ1U9tRTu4eZhu623OFxYrwrWWUaXM=;
        b=aPTVkMKc9rVtXZUkejEvpfZ4vZBOfLWHUXSu/h72OUnFxv8BbMVXPpxEHAE2mlEUOM
         61w7XuTK+GCTxzCycr4rLn4APenZajux7hM8x2bX2wbdQOlXjsnVqPv8BIGsaI3X2UVo
         Wad2XtQbZ0R/jT1jaAU23dTrmTVBYDouzwj7a0iJYEYiyWXZLAub6ySeycgFh122bisJ
         6ptK7q3nY+rmNYheqSMGxlPXroQAxkhFDflw6H8d7JokLA1hljbi0DWt9jdKyZhBvqHr
         SL2Rxu572eyG0PqtgXXCO9r8CZvdrd3z3VdIuk/UBBUIJoXg0sTdp57RSGwEs8TTwmTl
         oeyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775066347; x=1775671147;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yP2iiD9aKCDLJNZ1U9tRTu4eZhu623OFxYrwrWWUaXM=;
        b=fNAg2uuoQd0Xi8JT+5DwFOpscwu8/IWWFr5qiRMSZkvRe36tNXeed6wwhIM3hZ+j0J
         S3NGDl5uWcUWxAPuYI38eQrLLMePPp/ea/9gRzpxx5Wbg6T7Ylgsfhx7qzTC0b8nQYBk
         J2RhEo6Kbrun4rxO0urc++YwUOh7rRkXLrnzc4nE3mm1i3zBj31ZsNBKe1XOrWzcEC11
         kar/aIuvbMBo5QW6lWjEsIbe6XikAxCK4XtOk8gNJamPy+dFRjr2HbruSmBFxkV144Ly
         D0HBAu7fDJoNY9pNwN/nBzK0w++jtF2cJ3H6goRYmv4Dc7JrD4Uspb/9jAZEezYrap3o
         APQg==
X-Gm-Message-State: AOJu0YwuXVaB9aNJPegiIXdF0S8UczsDBxZfYMnBSEHCNXdg5AGbfpah
	l4nKBCPNSTOtCVWUrqLlL/XArnWezOAlqykbh9c0FfKm7AmGTGvmSc84kgRaOwkscRsBGX7AVoZ
	J7ccd
X-Gm-Gg: ATEYQzz8wmQdtmpgvNrZ5aT0XTD7am/tIxm4/VyLA94bZI6O7nNBv8Pmc0bXINzz24h
	pbf5HFNhQdSeP+zWu7DFKevYe3hm/lRChfI44Gu5HZlVHfvqKAGhHrQVKysz8qpvc/e/JdSk5ak
	FPYu1Ujm4xi6pMWyVhposrt3OFTb16dx8PUQZ6EPA8owPLgicMx5FxtTtIIi6grei8ryixbz42b
	VdtsmTFRoA6D7sTK6dfB8KQ996M2/ixoR6IWPvF5YTA04hUmEpbvS+FPpL6rJHZn+6qqXH9hBje
	nJeVkVjDXTEbtPpX/tAWWtlSfIMphZSMzzrQrCZd/1PaIC3eJ5fDt/nBDPiVeFm1bZ80FexPyKZ
	6aaFvHpCWhSXmTKrAXKlJnLnFq//jd2NAMoHKJYf79i+bXOvmq9CaDQN2OIpBxnMpekAlDz2um6
	2K4w1rgrEs/+o8P7Hl
X-Received: by 2002:a05:7022:2523:b0:128:d6c3:9b25 with SMTP id a92af1059eb24-12be64bd618mr2507191c88.24.1775066347309;
        Wed, 01 Apr 2026 10:59:07 -0700 (PDT)
Received: from 984b78e0ad75 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede5a225sm752775c88.9.2026.04.01.10.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 10:59:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in
 testcases/fake_sigreturn_sve_change_vl
 (Makefile:31) [logspec:k...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 01 Apr 2026 17:59:06 -0000
Message-ID: <177506634606.1099.546089884145130192@984b78e0ad75>





Hello,

New build issue found on next/master:

---
 in testcases/fake_sigreturn_sve_change_vl (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:813995b419d351e54e42e134b324abd91da5cf11
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  bd0f139e5fc11182777b81cefc3893ea508544ec
- tags: next-20260401

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+lab-setup+kselftest on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69cd386ddcae953c056b53c7


#kernelci issue maestro:813995b419d351e54e42e134b324abd91da5cf11

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
