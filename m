Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4946D380FD3
	for <regressions@lists.linux.dev>; Wed, 19 Aug 2026 03:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111952; cv=none; b=u305j5tijsqt7CB4QucSACUh/nfO9fB9ETHQJHj7dAaT3wvu0eGkOnju8cjXglVsq0/qEhmC7SYvaEJMkiqhwQ4qPNB66/aUMuRHyaio0lsXaNFj+gAt/Pl1d4GdID9/I+pFSRsecfQXCYgXBmL4p+xcuUz8KVt4rpHBQEHTt6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111952; c=relaxed/simple;
	bh=brdbnjPfqX0wOgvgV5yJ1GIBeaEAMqiTMu8VZzN7RyI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=pmqPhOwC5/GyWPSEVPWuAOj5HiWERtV6hSOrEvv1K14nA0dK+8o5hFQeXpvUyCPN3gPsjjRTSBiKKIm4IQoBnjJxSTNUNYhcgYSAK9kxAu36LZEIJTKx4hx7IXpiMAg4DftW/NwBZVRtP0yzjpSHUpU0fe3Y8fUbr5+Jdu37oBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=UlGxBpUC; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="UlGxBpUC"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso616450a91.1
        for <regressions@lists.linux.dev>; Tue, 18 Aug 2026 20:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1787111949; x=1787716749; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oqsDMGZJvW7d1z041r7/CnQyldcN2Y5BT/KChOSGhKE=;
        b=UlGxBpUCrfQaE0lYYjG5DahMD+o2CBYrMf8LmRYIhHzQ94K7cQu2ddeS/slUtLOv35
         7/33nYyCZGAcGawhLvky3fRbVmWjXGdRJY+dbfDmiEgMMUo8T0kOz6fG0Ql9Fo2hVWqS
         a67pVBjnlPSqgRxEr4wJBLhttH5FMbLd/1vzUThAfWzziORdfTbzcZGN8WvwA0+sd6WK
         qvfBFsik28dBiizlMIw2azZmzdruFqneOC8kCvv/dHdn/k04iLzZOm4YC6WOhzxFEam2
         xOx/fFdUzaEVzDSEXV2R4e3TtoFO5ORMoK7CSLEyQfCtQe/pWl0g2K/v9U3utEpahFdM
         aFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787111949; x=1787716749;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqsDMGZJvW7d1z041r7/CnQyldcN2Y5BT/KChOSGhKE=;
        b=jb+qwfVXydlrvbYL2+DDPwzZem+nDwVUdjI7OuNh/dXBOgJ30/93LrFSOnbWeto+xP
         D62UM8vb35y9ZkGvoMNElWxBmZgNImYMh/m3Ic8OQ7BwjWXBE3ADq6RST4vtrrmPVHJQ
         2DQcJZ4hiwRvRqbWIAHseFB7ovmQe+29O+32ItrbpTUX2grXP6mw8F81ClEAVqO4+4qT
         YKxLsSfa9JdbtqVa12RJfLdZsYVGkgHCFlVi7DX7chIwya6KjHBHXfPSC40CVj1QLSbJ
         czNutiHOdTON0GF/iaR/LHetkH9ZOWwdkoYLUC5AUNjUUqKXYipuq7eG9+3JO0GkyxYN
         tjAA==
X-Gm-Message-State: AOJu0YwukkYEcMHOwHDyO5jahPyGFhMMCLcy+ZCMOaEtanD/CgwSktwX
	BhP8XlUJaIW8HMVokGB1PCGNdfOToUDghwlf/WY/2VmZ19IzsvEr1MlueEG2VpRvjX0=
X-Gm-Gg: AR+sD13u19jfnSNddSriPMazONSFrQySfQ1vVZnyITkPWktZdziO0jwL+qiVUyM6q9t
	bJ3lSFizB+I34H33bY5k2UsTh/1ETMm3DKykORaCXU58OR1h3KNlLuAW8Vx4GAvMr+E2GBZq7z8
	xBWrjweD3njuffYPjBClSZxf5+cXdvU6BfGKz7WmFdHYDc7N60px8eucd8aU2LTZUW0+k50uGXC
	3dD754E7MzdERLTf2Nvdjc4aW76snBu2tTTFR+z2TRyaf77HD8gLcsHJAJpNj2x94WjN4W3vsTU
	HE9P+swm2ShlMA0/FyHSssjOMOmQomQnmkd8HnVntcl9r4zs5S3chkICwHg+KdZWktrVx+PgLZv
	xV6ihhUod/uGqFHRzUzgC0+TMI3SdPrtjF6PYLsuhRy6TWvuBdFOzoFc2YxkS/XCnx3RUh7pvWT
	ITU8vGnzXb9nBUQ4CCWdoT7Kxk/HHDBWbLwol2lg8Bep3dD0ztS0w/
X-Received: by 2002:a17:90b:3fc6:b0:36b:77b9:5c8c with SMTP id 98e67ed59e1d1-395814decabmr3186500a91.17.1787111949430;
        Tue, 18 Aug 2026 20:59:09 -0700 (PDT)
Received: from 7760ef875cbf ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef7a0easm2210673eec.12.2026.08.18.20.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 20:59:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) in
 arch/x86/include/generated/asm/cpufeaturemasks.h (/tmp/kci/linu...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 19 Aug 2026 03:59:08 -0000
Message-ID: <178711194407.380.4108589457572337694@kernelci.org>

New build issue found on mainline/master:

---
 in arch/x86/include/generated/asm/cpufeaturemasks.h (/tmp/kci/linux/arch/x86/Makefile:269) [logspec:kbuild,kbuild.other]
---

Log excerpt:
=====================================================

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/178711194407.380.4108589457572337694@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:e019eff33641f280144d13719cbbf59eb379327c
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  5808ac188949d7b49ed9e51f1ffcd096cac57006

# Builds where the incident occurred:

## x86_64_defconfig+allnoconfig on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a851ade62f33761c0e17986

#regzbot introduced: b126f6f5940f614cc06bba61c77dec2d75e8ceaf..5808ac188949d7b49ed9e51f1ffcd096cac57006
#regzbot link: https://d.kernelci.org/i/maestro:e019eff33641f280144d13719cbbf59eb379327c

#kernelci issue maestro:e019eff33641f280144d13719cbbf59eb379327c

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
