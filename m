Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AD81B6D1A
	for <regressions@lists.linux.dev>; Sat, 23 May 2026 01:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779501548; cv=none; b=auhThdsn6fmtm9p5qJ6gM+OaUsqo8A0Vgp0X6aheYEa/1Qhh/pe404djERn8nTcJhXQNsq6Yts/8F7rPpBRWjRpYGYnVJbs1SJb1pjn+0KoXbwFynlBjBOy7MiAH1apR20aCltImbhplsDjV6ohd94y6dn4LYgZIcI7Jzh97NeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779501548; c=relaxed/simple;
	bh=2iktPfJHs/5VL3RvyV3gEFJ9pZowo8ZHx9VaqqSetrQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=I7BxomDN9S0KFgh1PTEAsfik5Kmn8AiF0RaK/WLsbOWq5IOUhmGqgHCoLyN08pBKdTQhzuAxHXMsKH6XKNj6z2LuBrX1nDpewwefHZdesYjmOrm4m61/izQwH5mDNVM7iKBJXEtF/+lpmhA9NjA6Zf4QBZVkoXV9lFZ8uOWl2No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=bVsb1Ecl; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="bVsb1Ecl"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-133466cf955so23538433c88.0
        for <regressions@lists.linux.dev>; Fri, 22 May 2026 18:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1779501545; x=1780106345; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcIUocxYH8HE5EE3kEUWaQO8MrsqBwXNGVoZRgWzEGo=;
        b=bVsb1EclowP0AvPhoITg87JgRxAN5rSKY5Atjme7kqo6mgLPvQitMDrhM86k8TCch4
         J0y7RfTI+y+7/aSopeKYMhBGoK7s8yOT/p+yUhIvd+ubSyQBxUUhFyfLKOhZrT9d6oUY
         NB3TGCy/mmfIHv5PuKB68U3PHo9OlpTrc4eO1j2pmCpt2hc+/68JKDwNdBACV6JQsxi4
         cbF72MZIGH+lXjk3FPed/d0eNAToMJiradwd8VYuM31fJabZQNL/WQhOuwNWMxZ31UsM
         r7I9q59ITwT8QkW9S+VSYV2fJ6F25ZOXo4a+x/WtbPcgtq6YHlO1FA+bq9VYvvfryZRy
         JVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779501545; x=1780106345;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rcIUocxYH8HE5EE3kEUWaQO8MrsqBwXNGVoZRgWzEGo=;
        b=knT6maEzuLLK+DDNdlwOrOsYMNLK7B9YEL5TGw3RjhZVSVz7GKOj1+jLgbaqd/q4b7
         MQVhRxW4pmwAYxB5REIDbAfc0Vx9sBb/71/r0v1iluUJEvP/hGisb78XRkTMfm5D7C3G
         kwMxADzVHtNZZvBKaERKSUMqdMbCf6Z4RhoeEpHTSPyGRXdxsZLkH8MbXLlLOtUnQcta
         FLSXF1R7NvrO2qsUni7lo7lOuOYNUWf5tYm3ZhLxE7eynAqLDKONW1nzGKTGeowkablc
         ksSqMp30rxsbhZW73abSB3NxYD4WU8dskkkmZtYenGO5oW01lnUrFFZ4PpCALui6zBDO
         aLaQ==
X-Gm-Message-State: AOJu0YwT3Oi0E8m2TL11Ieo+zYG4upherN/YTBYCPt2soOkk4KeHKiDQ
	WX/aAInnPjGY35ORbj0cdStqr1D/CO5j3f+XW3GCWpf84DJejXtClycSB2/H5/xf/XA=
X-Gm-Gg: Acq92OEEi4WQjqZX51qC2OBYZ/QTOHUfeNg04aTH+HuiK9IMSl9veojq5ZPGimouX4n
	Ng8+/rl6YxVvVTYHbMiI2QYHLrna5wpm7lWz2ku3L2rb6474ixmySLgd4lmtm+Z2FYYc1/UV5ic
	/09HdvAaPQdhCR8MwSH4nFblZIf41Eq96/f48QpYxUy9gU8mK6kmdwcPAi22wdguyj9c/LRA6vI
	LzcAZtLO1SLYZfW2evuJVy3uvPdpwSBVVs0P7aXd3/RrkMBjrcN4r9I5pL+9RjZGcw6OPr4SBEZ
	4bz2iqTALlhqWLStfsN/yghHq2uYwal6WWh2DfkyYdLGOQRyQjLuxL6RnonFtSkTo4bEGWhl72y
	njpAyXStJXmvewYIh806IJ8tDAWkEQMN3qI4rBHWawtDvmgL48waFSKRHqkZQ12lvqtWNkHaGt3
	fl8wIgJiWcUska1bFJ
X-Received: by 2002:a05:7300:818a:b0:2ed:6f94:9d94 with SMTP id 5a478bee46e88-30449156e51mr3186375eec.19.1779501545368;
        Fri, 22 May 2026 18:59:05 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045245d6aesm2214650eec.26.2026.05.22.18.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 18:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) omitting the parameter name in
 a
 function definition is a C23 exte...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 23 May 2026 01:59:04 -0000
Message-ID: <177950154440.4433.14069879562080222690@330cfa3079ca>





Hello,

New build issue found on mainline/master:

---
 omitting the parameter name in a function definition is a C23 extension [-Werror,-Wc23-extensions] in drivers/gpu/drm/msm/msm_gem_shrinker.o (drivers/gpu/drm/msm/msm_gem_shrinker.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:2f5f68fe5a378a5f91c53b2ded9eaca026d2608c
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  79bd2dded182b1d458b18e62684b7f82ffc682e5


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
/tmp/kci/linux/drivers/gpu/drm/msm/msm_gem_shrinker.c:105:58: error: omitting the parameter name in a function definition is a C23 extension [-Werror,-Wc23-extensions]
  105 | purge(struct drm_gem_object *obj, struct ww_acquire_ctx *)
      |                                                          ^
/tmp/kci/linux/drivers/gpu/drm/msm/msm_gem_shrinker.c:117:58: error: omitting the parameter name in a function definition is a C23 extension [-Werror,-Wc23-extensions]
  117 | evict(struct drm_gem_object *obj, struct ww_acquire_ctx *)
      |                                                          ^
2 errors generated.

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (arm):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a10eccf5bf5d05c97423e72


#kernelci issue maestro:2f5f68fe5a378a5f91c53b2ded9eaca026d2608c

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
