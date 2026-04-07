Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FE525A321
	for <regressions@lists.linux.dev>; Tue,  7 Apr 2026 18:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775588347; cv=none; b=jORCDCdM0dUy5u+gmEKlwqrVZwJ/yIAxhLbPGxpWFIYD2g2X6feg9SRVj2P8SYd3yOyz+lymjhDMaqAT9mlAj42hLmE2mx42qy5Fdfvbp83jLPLvrxiHwygqluLLrUc97nSxsuAv2vf8xZhGxtCEQnlW4RR1xTlfX3oHsOBcrho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775588347; c=relaxed/simple;
	bh=ri3KVWEjWeqq7sVDPoXfzYBoBu5eYsbDcP2PX+rgTOE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Hunr61xF40z+eQrdmk7zrlu7K9sqHGJLDtkj0BfvvKZofwT2PUayUH/l8pdVHobGxFl1voVkQuPLsKw/94rHeiqWDWcwOtAfEmB24Y4RACYHvP+DA/6GgOTh0S1OnAsex7LyTVHZWGRFRYIp7g3sb6bv6Fo2UJk7TkrZfHsRsGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b=wWjOHOd3; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b="wWjOHOd3"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c20010f10so144293c88.0
        for <regressions@lists.linux.dev>; Tue, 07 Apr 2026 11:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20251104.gappssmtp.com; s=20251104; t=1775588345; x=1776193145; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QL5cfqmnIwgU4uH/kEcSt49/BExY5TYAgpnnilZPUj0=;
        b=wWjOHOd3OIlt6PBe8JsGIX8n7+o3ic63td8AVLd/kW6KN+ZdQHPECJLzpL9MFmuniu
         N9Y6QVV8RtEqCjf+kkbNqvVn5iyyV73vOjLzgVlhcIbGoS8Mx5nPNLTQLEZYrovfcoG6
         gOpjS6u/Tf0gHXwP3/tdXSYEP8B01A6URqPYQISYruUknjR+LNy7tHubYNizizRQ9S1n
         K/xersGDxg1CkLZHU1MFLRvB4R0D3CwDJX2UIlDQo07XbqIM8Ch20jJyEZ25j0VGc/G4
         rKPB+PYDDu9jAOlVgF/hS/FBe2qx2/mM/ANn2wcdR9QtFAkY9kCeZoPV9FMBpfmIHeKr
         ojgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775588345; x=1776193145;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QL5cfqmnIwgU4uH/kEcSt49/BExY5TYAgpnnilZPUj0=;
        b=R7Fa0P5Jcn/VGjGiqKEO99JOEffkcGxSq+loLsVfTrkWQLG47gnbjB52S1mQU2JpkP
         ryqGUhGuhUsGAg2nRQGV2eabEFygvuqzlfs6QcQtip9UlgM35PWdKmknpB8xcVAQDpBq
         dxsooocht0Y+79NsayHtFO8Eh7L9z2N6vDEt84sLkxMD/q4umm6cgfzEAh01YM+e/Znw
         InBSVZQjxOnDNMDAfcl0ylIS4tSz2wXWnc1CxH5F26+2I+mlCSHpoFFALojWRclKqsZ+
         /XVivrP9F6uEzBKZ7zln6KnOaf6B2NoFDXUMnHW3RUTOdLGAYdMPzGKMZL7qz+htx+KP
         MYFA==
X-Gm-Message-State: AOJu0YyScxmRHNUnCnZxO5zrnJhwfauUb918+uTCdOZbZaHfke2lcph6
	zOqrPFervTVwF2rO973qdpZPd5R2wD1h/67fyJFE5VcL7xQubcPDn/jvcNur2Y1S6dQ=
X-Gm-Gg: AeBDies0k79Se/cI23J63ndT6cmF/VsUOSi+V8T2up7h5dQO+UXxTVYOSb7c9BYXRV5
	5OcT61amRHNXWr8g3I4bqdJQvGRltQ6Q4mZNnlhINC6wLT8CKSBfPqAwQSVZjm9MK/6DA8N0Ze1
	H0NuhTFDWmo0KWNoUZyhEJiwpSgJZ5X9HG5pZY8aKCPWFUMJd+8//Wx5KNdwtneEu7GgpOK95EN
	nBCBjD23aHzNOqgLzNOIHLzlqHL0YfLR5NgmzwxiG0E1T18nP+rMx2ylx2SPE6b1XKW5UFOFET6
	lHT010TLQw8Z7zsxxDZCDaURtW396fZuqORrzxgQweKkVup1g00lsKSee9TXCFHvtTHqIkm0kjt
	15rExLoZrSVh9aWpLChpBea7soYHEK2ClIIkjWEqJtGczniQ5LcDH7UiZfTW5gneUetSIy4o9cZ
	/HWTipdN3/g32jM5Fb
X-Received: by 2002:a05:7022:260b:b0:12b:f9b0:21f4 with SMTP id a92af1059eb24-12bfb779426mr10364415c88.36.1775588344874;
        Tue, 07 Apr 2026 11:59:04 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede54ba8sm20739587c88.10.2026.04.07.11.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 11:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in testcases/gcs_exception_fault
 (Makefile:31) [logspec:kbuild,kbu...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 07 Apr 2026 18:59:03 -0000
Message-ID: <177558834361.2493.10021359695033804908@8692ffc4d55e>





Hello,

New build issue found on next/master:

---
 in testcases/gcs_exception_fault (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:50d72b703d41b945e32985c537b9838bb2aec986
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  f3e6330d7fe42b204af05a2dbc68b379e0ad179e
- tags: next-20260407

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+CONFIG_ARM64_16K_PAGES=y on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69d51d57dcae953c056f963b


#kernelci issue maestro:50d72b703d41b945e32985c537b9838bb2aec986

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
