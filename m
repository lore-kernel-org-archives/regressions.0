Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A9118AE2
	for <regressions@lists.linux.dev>; Thu, 16 Apr 2026 03:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776311947; cv=none; b=gsUjPj+igVNns5D5D2VuuA3W35oKblV/8kAX940X3dcnova0DC7f+LLKRSgkt4Ik4TQhG9zjxAA+3lBLRckYMNRWIizY5WTxGH4AR8uZOiLkvg44KIcbiMX0AHNA/ThqvoEpNuK87wuTsWoheDrE8U4X2/6kmGvJ+FPpH9mxTMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776311947; c=relaxed/simple;
	bh=bkdazd3xQ6b/W6aPc1tyCWNCP32lgCTzlY2gGLluHP4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=jRMYet6h5Wdo2f9rlwTAgUpE6+gpEeUCqEux8vzSHYseLUlOc6JGlB+NLo+zucpyDeLc0ONNaS0TT6i0BDf7Elp3qzm8yCcMB3xNkQMkKEAu1ZYWdTU2kiNXKyAcdD1+Gi9aA0ih2XbH+p6CVrE1aWdFi+KreMGUY1fxHtpjGRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=LssNPbE2; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="LssNPbE2"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2e221a71e19so7490eec.0
        for <regressions@lists.linux.dev>; Wed, 15 Apr 2026 20:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1776311945; x=1776916745; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJ6SrrIHtj1HhDyHgi4k19oE+I8VvyQZ5gvES52Sx9Y=;
        b=LssNPbE27ZbGlY8M5uzyhO8kteenx7sU/ECSjdPVExUgndFPE4zZtVZe13nEElubEL
         ZQTjPnTjnfT29aI+xiRLVyvo8ZQKiWxts8Dh9Jo1XBLJwK50K9P3/tdHfCnUqIhXQsGf
         DuA7Af4T1uLUm5ONwtkWFvkj96WM9+FO7N5/vy6SXOvY2pDGUQ/DWn8B78eHqfcVYekY
         6LYXJmp3b6rF8/zEvUcHLF4EG4rvPKd2UKms8kh4FF3rhkAJIfi5VOJ6z8GRhARegCDd
         eabAapcbZLvF3Cbn4n1tO1nJb0JU59cBRO3r0kyiVGcTiQhwq5XSP4BqxOdD73hpYt8D
         OsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776311945; x=1776916745;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JJ6SrrIHtj1HhDyHgi4k19oE+I8VvyQZ5gvES52Sx9Y=;
        b=ltCXmUAWLKIOZU466zP05ow1RoJGuf0VxAfa4nVDiX/rF2Oxc0BtIYBgJXT/kZVUdf
         9ALVIJrELxEhBW0Cx4gZuA1BDkKSZijwru+27sW+lQAWZA914k8GEK/KZYlfGzi9GONp
         vdGfxi6U5O74J+qHrchmbVG6c4a1XAgwY4bSBva5clI/++5IKyhnJSwpQLXF8BZ3ytAi
         +H36Dv9mqzO7Ic23sFQvisVNS8t9ALcXsQz+1QMRAo7eOcSqvuZpCM7hXS/SJCrrWNdX
         +2Gnmntyz1H8vmiUI4UA8sDtEhIgWxtFcjV9xVnWN8qmiyVZ0ji1aZui1N1eU68ZWxzg
         9bCw==
X-Gm-Message-State: AOJu0YwtxCSsxL3XEypEGYJYU26Tu4byA3CIAfnltQm8V7b+9d94jMdh
	1yRv7Hf2Dzf/64vF4ujXyGcyqhkV8R2XBdDT5B08eVxELJ3p913ZnJ7nNoyxkP3j6jk=
X-Gm-Gg: AeBDieuTgZycrshc2koKqmnxTl9zDUmGxGYYnmVlcCztKV4nBVPnJCQJQakrCALBRhj
	iUwHHjNXf3Yx3qWq3065C07GFz93y0QtObbvFOaLAfqTm7MvqPLnPvPIJTO9Z7bakPX39O2EYpl
	kqq0ahdGaAg95pHhmo7WDS01CgmrOQh5Me//W0A09lCGZ13Sp5cr2ZGL8oDaqzoD5m18dZ/zZI2
	j5ofPRbCtpJht8i082s3n9ebG/vTjCPoyaSMq8guTsC+FIR04LCsIHDQNOqni524GclWE7yqHYa
	yx8ki7JJ/PHjE9opuQcCuTt3YcQ6A/FqAu8TecB1awvcT/KjIGz6i3Oz830ZqHu4UkR7nawRtV+
	oU1wT3sd5uoFyUZlOG17f5eTPgkcc7kPvceNKjw99bUqTvbb9xNlsQaUupUeiaCYEZ2Ggisk5nu
	73OYVusTOaIXiY6dcNlDc58A8A3D4=
X-Received: by 2002:a05:7300:8609:b0:2c7:3a7:c792 with SMTP id 5a478bee46e88-2d5894628d1mr14059968eec.20.1776311944842;
        Wed, 15 Apr 2026 20:59:04 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8fa5f221sm5643873eec.27.2026.04.15.20.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 20:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) in
 kernel/trace/simple_ring_buffer.o.checked (/tmp/kci/linux/kerne...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 16 Apr 2026 03:59:03 -0000
Message-ID: <177631194364.6342.5358444760042595921@8692ffc4d55e>





Hello,

New build issue found on mainline/master:

---
 in kernel/trace/simple_ring_buffer.o.checked (/tmp/kci/linux/kernel/trace/Makefile:147) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:76d4ec715fd28e2b45e3a8ccf6d7a053fbe5821a
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  9e1e9d660255d7216067193d774f338d08d8528d


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (arm):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69e03fc19b5a968309e4cfb9


#kernelci issue maestro:76d4ec715fd28e2b45e3a8ccf6d7a053fbe5821a

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
