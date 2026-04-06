Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F6739FCA9
	for <regressions@lists.linux.dev>; Mon,  6 Apr 2026 23:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775519948; cv=none; b=kjUcDZTOhalPckmfrDA2ekmIdt8bElijod768Vd4pN4H2C8q7kYnoNVZ5cC6Qk7YxjRBBS0Gbx9DpydFLGcTbGJ0k4KCnyEy+zcJBUk+WnK7lcQqdgV7x6Qda4gl+/FAX/lFhbdUyOuoYiJBfths+jJw9jPcE7ZeXJ2Kyu11shY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775519948; c=relaxed/simple;
	bh=4cAKL4ayXGlMuDTMMR+t5eNAFiUJUG3n3nhkKbL/PNw=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Zt8+TDNtPQCu7U96LAyyrhOQDVyqdoxRhGDRmQmXB6Z5nSpbZo+W9+s/SFqYfh8S71OQcIUqxO32wFKCobMMcF6LoGG7yYwiUTG5XGnLniE4nFEraU4RBeMOUbVnoLmMjduGq2kvtG7uvjELJaXvlsv6pIvCXcxKu7PeGc5VjDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b=gPmOp/P2; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b="gPmOp/P2"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b6b0500e06so6318281eec.1
        for <regressions@lists.linux.dev>; Mon, 06 Apr 2026 16:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20251104.gappssmtp.com; s=20251104; t=1775519946; x=1776124746; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ie57W13hOvM5MZvwRrxU/IpWDzgPMoxoDUwbFa0hWQ4=;
        b=gPmOp/P2ymgnybL0mWZqXGGbF0UogULhu0y+K5wveSCjGzMZ0gnUPBnvCaI1YEubdh
         HVH1xy8vklb0uxPNCBd0WZrGKBtakLy9x/XqqoxPwVfSFLiTL6+bAqbexQae7E5nf8i3
         +X0AhLAwfavTKSL83jSjD7pn1f0s6yTX1HB08nk628cgYsFyOFUFfo/sj1W2JXljKo8n
         VY0FCpwImvK75wriMP5eMHHpMRQl8NTRt1437Ij8cohI73AhKt+2hDS8x4QbmuAWwEHp
         xvAmFoNggQdw2f/EGAEK0C2Y+bGAX2cfZCyQubG92cd0GtccGzyPlHvDLcD1VczbZPxS
         B36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775519946; x=1776124746;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ie57W13hOvM5MZvwRrxU/IpWDzgPMoxoDUwbFa0hWQ4=;
        b=Wt/3BUstBv5+DplPWwzXTKWWvj1wfKqIoAZn2Hs3rQV4SNhc3ZeLCOcPaXySN6CQFl
         HUEUyN7wc1R+D+Wqg9qKsn7aTbZ2nlt3gcW5aosswUegXF7LOYGa82AyhipFuLZV/A3c
         51plaJeqfQzShkamorfLbV00qZ+I7gfF7G7DfqzmeXyhSvrEa5OHWdv65+Ex41uFrnm0
         7ygu9oIUmg3re4nvWnRW4QrR6C8IMskG4fQHUi4v3mRBMhNzVltRgJGSLkcVgHb0CZlp
         fqcvGJ38A6AXRH6m0XbxkUnVCWeBxNTSuYkVhqJHIWO10yILGjMbP56c8Rn6RZ0D8IHQ
         N6mg==
X-Gm-Message-State: AOJu0YxdkIUjNXWPqLgtzqf4LhDRQ1y2nKaf3Op63CUD/VszbWmtsnKU
	4gxMLIq4WD1k8gJX2Zn3wx2+m7/A2bcv05YiAdJzvjeU14ZaOxCZTWFEXWjlyppSv8Y=
X-Gm-Gg: AeBDiessj9Rs77gQKKTehmlyoo2iZ1Jrr99xO3sIPmwvkcnkwzyXTut8HkvW6IKMJRQ
	WqKUtCnflNsoBVMc/plsKvi9sy2mAQtCEHgY6wmHxV0G+FYSN0PGsHlAqoNxduslU5I0ZV3nhk2
	oY66CDFcfQ6H08spaH5mJHrxjHCQKhx6c5sv+6De3pcqZu6JzTP9hH9PBaAMTf4eBMb8OtP2+lk
	0WFNZbzW8WPHgT7mwKiMUIeaB7wBJlC4tQNRYYFls8Ec302WHfLNd0RfgeOgrHzk9S4Zdv8x2vr
	OoE/8tx9BkL7T8uC+W9rq9Rh7GjkXxCB01B1SW48Ac9dKyRyLyWSiK31LiqiaUcR7LPC51v9sP0
	u/Jz0kw4owGCfVr9coSYBrlppRNW16GlhwoHmz+2GhG8vJym5HMk6MiTjckoNMAltHqs5q9TGT1
	YVXW2d7/kqA4FiR/Bl
X-Received: by 2002:a05:7301:1f04:b0:2c5:b23e:48a2 with SMTP id 5a478bee46e88-2cbfa4c48f0mr7608021eec.8.1775519946417;
        Mon, 06 Apr 2026 16:59:06 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7d00f5easm13482499eec.29.2026.04.06.16.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in testcases/fpmr_siginfo
 (Makefile:31)
 [logspec:kbuild,kbuild.other]
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 06 Apr 2026 23:59:05 -0000
Message-ID: <177551994531.2129.13510513122159641255@8692ffc4d55e>





Hello,

New build issue found on next/master:

---
 in testcases/fpmr_siginfo (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:c905629d4de8f0d67e3bbceb3629696219daacc5
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  816f193dd0d95246f208590924dd962b192def78
- tags: next-20260406

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+CONFIG_CPU_BIG_ENDIAN=y+kselftest on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69d3d7cedcae953c056c1b52


#kernelci issue maestro:c905629d4de8f0d67e3bbceb3629696219daacc5

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
