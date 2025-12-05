Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19340284690
	for <regressions@lists.linux.dev>; Fri,  5 Dec 2025 07:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764921566; cv=none; b=MCnVoCGzp4jCy9khmdqER5GcE4xnk2EyAuj7D+p0kaOPxT5oFtiMs6mzuBb5pToOSQeFGsQfxyr5qpuFKhgCZy3KG8Lr99/JisZ1tNTjx0H4L6TR+D1+RVkfx0RnsfjtafSfdgt//0EHspf4o5UVx1HI2mdEo8KaULR+8DH97kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764921566; c=relaxed/simple;
	bh=PFvLdGw5VtaDch1yuEfH4676a7Y+dW028dNOz9N16EU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=XY70e4c0/ODvESBbAvmcjhJWy4Ufz6Cw8mLxIi3bTkXDmGfH/6PIe2UmButtWWUnxIcSd9d2U8EeMW+v7NfiJBG+msuevN2SG0HDYfZbtUjk79GsK6196W4Y5037vdciskWB0ILOJ01FYytt1RE57oPB1VEGT2nzIls8CnbHK9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=IUuAAxzs; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="IUuAAxzs"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso1504980b3a.3
        for <regressions@lists.linux.dev>; Thu, 04 Dec 2025 23:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1764921544; x=1765526344; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJl6A3Vih4/JRBAb2Lh8exZgeiU9LqSo4q6v9J9ORQE=;
        b=IUuAAxzstWDYjkmnNVebx9N8DxEACHCzZbUaI7KQmyHlxzO198v7nu6cqJ+VQwJln6
         6eZcRqQu9mdfrpkdTNiZVnaCkPTad7DjF6XMKL8zy7iw8XR7sKsuS6CHd15iLbTCGQSv
         Zu3FO9v/uX3IoEbWfMgQdou0ueOR4fLQJBf0coGQaJOP6Q1l2yT/bVCRasB3zrFrXaXs
         dy9QlujkhT4itiIe6ay2bi0Kf/LYwaiggPT/8CulMKloElL6c4nV0gv0aQXwKXRwVUsx
         epaOZCVWoup+AvNMVO9MZeTliiRRO5lOATxO4YPSE6abYMLhM+SJ8er10KrDHUFxEyoH
         hKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764921544; x=1765526344;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EJl6A3Vih4/JRBAb2Lh8exZgeiU9LqSo4q6v9J9ORQE=;
        b=buh2FI7PLqde+UrUr6nS/AA77gETcdRtKs+9Wddcq+l50yyBUzSo4t3ULFvdkH/YAU
         HAENYRxpZR2ubWMS2xYUoAMob+8VLNGYLd/25AfMzkCBN+kNwvuelXxHRzgelTMcwXcZ
         qFP0xXzdBdn5uFt462/2KOfKL9fMHVJY5y14C3LD/bL4jG35nal3RD+dX/7qtfXd2z+m
         nXttWAfTvIkC7VQPysFoasJWBzTZW22NCGA/0VI7qNvVIc74GE0lGP63PK10XOTnyVUT
         t2Hw4OgO51HS0S8FUeHm29AjC4nd85plElfgjo+wq/zI+bQpr9wy330/XZgayC5lyPU0
         J0dw==
X-Gm-Message-State: AOJu0Yzrv7qsC1+PohrOP/++sk/P3w9YFNHJU8Dzfd710qP1f7NhVbRJ
	9z/8eQlEXxyBQJwirKwKeRK/N4Znw0RNcYZ+eSG5d5fS4oEK60PPApJ33mIgoX1X4Yk=
X-Gm-Gg: ASbGncvmfaCEg7dkVJM/f3eFj9zflzRh4b7HxVXakV5Amj8mTUBGDJQPSPW9KOtPouk
	ljb9hNckMPfPUdYhGlShoOZTSghu+Z9/gBYMeJGonFTfOjQkUeegsWW+hrNR7cWco2eCccraKDJ
	q6lJZ5DFYzSiP0nm+RmH7NFVOBlfzGj2Dvv8jhE7JlBEvYp84ml8ZXamVXwLZDV+KBdynbC6tfd
	A/3KwcIOzXCDXJg3y9cZTN8YL5/3+V77EnkRp5A0quu9phPvaa0BliDMgmQ+oFCR/VC04e7z6jw
	PNF6ocQ3msjP8dczbeHhwXx3ESVoqwVNG/aLa/Mjfpajt0tK6XnDD6qYPX4kgFHwdxJVWAlzy4G
	hBLOEOkM5DxDNa/dcNBwF2Rw5x2b5VEHG28FnEb6MGMTWeuJVIh3KKEZKL/EnySAy1Q9Uewk238
	1F6V1D
X-Google-Smtp-Source: AGHT+IGmDEUgbjjQyJixvvNUID8T3M2Z5SjQAmtBxXJNuHPhKcRjw5C8gz9lVor80zAvOAWYcBQmNw==
X-Received: by 2002:a05:7022:6187:b0:119:e55a:9c08 with SMTP id a92af1059eb24-11dfde4b888mr599421c88.36.1764921544359;
        Thu, 04 Dec 2025 23:59:04 -0800 (PST)
Received: from 1ece3ece63ba ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df7573508sm11794391c88.3.2025.12.04.23.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 23:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) variable 'n2_max' is
 uninitialized when
 used here [-Werror,-Wunini...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 05 Dec 2025 07:59:03 -0000
Message-ID: <176492154301.4738.6647175702618264062@1ece3ece63ba>





Hello,

New build issue found on mainline/master:

---
 variable 'n2_max' is uninitialized when used here [-Werror,-Wuninitialized] in sound/soc/codecs/nau8325.o (sound/soc/codecs/nau8325.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:6781e33529bd277afaf2b3ab6c3c339ef1458b0f
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  2aa680df68062e4e0c356ec2aa7100c13654907b


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
sound/soc/codecs/nau8325.c:430:13: error: variable 'n2_max' is uninitialized when used here [-Werror,-Wuninitialized]
  430 |                 *n2_sel = n2_max;
      |                           ^~~~~~
sound/soc/codecs/nau8325.c:389:52: note: initialize the variable 'n2_max' to silence this warning
  389 |         int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max;
      |                                                           ^
      |                                                            = 0
sound/soc/codecs/nau8325.c:431:11: error: variable 'ratio_sel' is uninitialized when used here [-Werror,-Wuninitialized]
  431 |                 ratio = ratio_sel;
      |                         ^~~~~~~~~
sound/soc/codecs/nau8325.c:389:44: note: initialize the variable 'ratio_sel' to silence this warning
  389 |         int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max;
      |                                                   ^
      |                                                    = 0
2 errors generated.

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig on (arm64):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-arm64-allmodconfig-6931e5dc1ca5bf9d0fcc2f66/.config
- dashboard: https://d.kernelci.org/build/maestro:6931e5dc1ca5bf9d0fcc2f66

## defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (arm):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-arm-allmodconfig-69325bf21ca5bf9d0fce15e0/.config
- dashboard: https://d.kernelci.org/build/maestro:69325bf21ca5bf9d0fce15e0


#kernelci issue maestro:6781e33529bd277afaf2b3ab6c3c339ef1458b0f

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
