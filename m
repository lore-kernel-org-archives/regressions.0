Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA7E13B79F
	for <regressions@lists.linux.dev>; Thu,  1 Aug 2024 15:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722525142; cv=none; b=Nxz0tzH4mqnyMR+XtQ/plupDiyPNMP6CE+juh540kxR4s6VGKXlA6arXtCfXlhtJibHAdDPE+b6Y5PHu8EKzFbqS0xwILoR1jz88FgS4MfKPsuo+QztgG2nKTyRJVjxsUyS7vLTv3GS8Ze40H4MRcrtWd1pcZkoy+d0oiTAlLGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722525142; c=relaxed/simple;
	bh=4bRG4OE5LtNt0K4M2umlVKzUYhufp+M++6Ir2tnUXAI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CYB5R3zvro60v2Tf/TZRklw+JYBSfxuhVgZ43ZLmniBvOYANymAz1x8Ek6fKPvj7XA8txfFr6d8WBOvT8s05imksNkcc9U9QhrqvZCicC77wXs+eZiiWv1CU4sHMj7pXrEXE/SUjvBSKKkrI/1z+e7rv70gXp1tWbh0a/NgCo9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WaBvOiD6; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WaBvOiD6"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3db1d0fca58so4364590b6e.3
        for <regressions@lists.linux.dev>; Thu, 01 Aug 2024 08:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722525140; x=1723129940; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0EZ+3FD+e/PFQBsEAOnoseW0Xb2So+cYPg0oL/Wd7aE=;
        b=WaBvOiD6LPOcyPCuSaMlaMeLOaDwSSOR/BFPFnr8sviTVT/oA2kCsChXbJ7yzXCCRj
         Ep555HwmxcJ8GQTTxULqHx0k7CmLMui4ahJeson17sEYI7lZw1StFgu6ddpmi+V0qKn2
         WFCAs4tDo0ZnUcQQxUMlKUtp+2R76Nwn8DQxDsyc1k9Lfuht7lzZSl4+un6gk5vcjL6v
         RFAXourAbtYnAOtC05irNMRGhL5OQuGCceyfMybTRXcEPqwZ65pu64UPSqFMAwttsETl
         LasUk7riv8GonOGkbgxhEKnipTgAFusrzRnoxvojaO+XZnxJyMPsypn6Nu28iISv261y
         onQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722525140; x=1723129940;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0EZ+3FD+e/PFQBsEAOnoseW0Xb2So+cYPg0oL/Wd7aE=;
        b=r6iVtDBRlCZxtC+G2Bj2UBZOLKhK94LDIeu6NZxlgnwWtRLq76QHRoAfR8PWI61j0U
         5eDv5zA25FMm7PPoIW+Yge13X+7bTlBtb+JwE0ZZeJMdg5xtIWf+ukqPsM/WUsrBlJb5
         0KHSShEs0Sa3L4x2//XoIVlghdiEwyRHnbfRmIa16cpHdB07kyLPP/0lwIBJZdJGlxuY
         DCH2QC/hYLgr/crCoFYCEcr2UeX/TOMytO+N4z8nwHlP6Bzr3gkqpwW1QjNefXlzCv7d
         2aVuoMclKlo+uwkYlW4uaK6L4KusO6GSW74OsGs2WNqkNVTXb3uhV3SPycDhojfFUedM
         7g6w==
X-Forwarded-Encrypted: i=1; AJvYcCVnb5dwprS6UOULLDp/c4DQxRYPjd3DqFjEbhafTt2oQWWmNAMtLxhiPWtbprwQrWxz+hgvwPh7r6xtxEnGm0oJ+/xum4lpktxsqjc=
X-Gm-Message-State: AOJu0YyuuP1zbPIy0X15sOEu2OaWRd5Fn5CiQoN45j1yCs7eu1cd01Qq
	naxekuGXOhrmALwFVrBm1BCupasiLl1/ad4ZAcNlGNBEc61UQ05CrmRSov1NV/4ywaFirVLFpxF
	UWizMujt1ZeE7HiOMgjP0RDpRt67+gECgIo7lKQ==
X-Google-Smtp-Source: AGHT+IF7V9tCFIwkCTFvpkg2tD6zCwQ3/PSb+e7xTfUy/IT9doiecUYalC15iGBwlHWOLdgiTH4sDDJtHVM1HvUbDSQ=
X-Received: by 2002:a05:6808:120c:b0:3db:161e:8258 with SMTP id
 5614622812f47-3db5581770amr362204b6e.24.1722525138613; Thu, 01 Aug 2024
 08:12:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 1 Aug 2024 20:42:07 +0530
Message-ID: <CA+G9fYtE2GAbeqU+AOCffgo2oH0RTJUxU+=Pi3cFn4di_KgBAQ@mail.gmail.com>
Subject: i386: kernel/sched/debug.c:341:57: error: integer overflow in
 expression of type 'long int' results in '-100663296' [-Werror=overflow]
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"

The i386 kselftest merge config build failed due to following warnings / errors
on today's Linux next-20240801 tag with gcc-13.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
--------
In file included from kernel/sched/build_utility.c:72:
kernel/sched/debug.c:341:57: error: integer overflow in expression of
type 'long int' results in '-100663296' [-Werror=overflow]
  341 | static unsigned long fair_server_period_max = (1 << 22) *
NSEC_PER_USEC; /* ~4 seconds */
      |                                                         ^
cc1: all warnings being treated as errors

Steps to reproduce:
---
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2k2tW5pcf7uulmRCWIAWeormjb0/tuxmake_reproducer.sh

metadata:
------
  git_describe: next-20240801
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: 048d8cb65cde9fe7534eb4440bcfddcf406bb49c
  git_short_log: 048d8cb65cde ("Add linux-next specific files for 20240801")
  compiler: {'name': 'i686-linux-gnu-gcc', 'version': '13',
'version_full': 'i686-linux-gnu-gcc (Debian 13.2.0-12) 13.2.0'}
  arch: i386
  build_name: gcc-13-lkftconfig-kselftest
  config: https://storage.tuxsuite.com/public/linaro/lkft/builds/2k2tW5pcf7uulmRCWIAWeormjb0/config
  download_url:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2k2tW5pcf7uulmRCWIAWeormjb0/

--
Linaro LKFT
https://lkft.linaro.org
