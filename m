Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FE428C035
	for <regressions@lists.linux.dev>; Thu, 22 May 2025 13:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747919527; cv=none; b=eWdIeowZzsgsMOSqxezVNLSyVvfe7zcI0dhZP3bAWNBySMNfTlSu0ZM1TcTOu0AuqtEpZWHXRA35STkc6wmbJsYBqIxHO86WBBIsIJPuw/Pk+FfqXaNIHrFPy2uoQGCKqMEdh43KGf6WdjXj/b4qXoQ5t4d8Nkc3KUZBTb9Xwd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747919527; c=relaxed/simple;
	bh=VwD68oPdZR7QMQCqJ6VWvr3muJ2LNlzFhJmXibbXOuE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Fl8OsUL7BwJiAiWY2IO2fokGBuctWhXbZ3ci4Deb4hSd5l8C76M7mbzoliDWexwBTPes+XBdrkBiVNIU3OGszWlYmQ/TnaST7uvEb+hMonvtBOFE+uRMV+bZ5Zm7futIsPEefncsF4NPDGG6zI68bu3ahk2mmIXS7X5iQYX2Pvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u85k8iFT; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u85k8iFT"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c5e39d1e0eso863770285a.1
        for <regressions@lists.linux.dev>; Thu, 22 May 2025 06:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747919525; x=1748524325; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vVd3U96Y4i9Vlcsd5gesH7KRFcK58OXYVflQsNrla/c=;
        b=u85k8iFTuN+ffagB3fQxn91+Ko82yCjju3x6mz1xHTBa/4WhxA/KbVbOfdi2qLTWRG
         Auxvgx2P6aMjD/MSwuBenRobs16y7ucpDTOHbMzG25/pb0308A79ZKBeDqXOxqy9hEq9
         JDAn94D6UHbbAimSDkR1tZ4zUCzW2b4Z9SJyg3DZpnYtoGbvOD3floE7Va7u6pr5/F1a
         NoSyqm06eOEax7Gzio3ZqdDw7J73h1xZFbwoG10+F4RRshzRRqZJGHKw1pis1Cw7UN78
         D/RCyLnd+jDsq3o2b1ql4HQXBPAJj0mDYZy1pimu1cd4HiEJ0oslA5COPgce3YgxPHjY
         3phQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747919525; x=1748524325;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vVd3U96Y4i9Vlcsd5gesH7KRFcK58OXYVflQsNrla/c=;
        b=M60KmVrJliF/H/c+Oe15GHEpE8muBE3i+ldIlq43/G9tDcmbJYe+Y2wbfB1xDW/CIb
         nTcJm4BhYKF88yoXgbY5OrTF3a2hS92gWNm4PfYkvZ/Pa/tazCNMllgVGZXdSeyzdWFq
         p3B10ad/2J011TJLGFpJq/9EG9E1lfXJ8FO3i3H/E2NrOmoOylbl3mq4xktP9E368cMW
         nV3GQmmkUoNSCQyuWwiwTuYdN1mF3KNE/ktEIEipRR+bZ8NkGxYMwC6PnMniYWowr+xQ
         gTnobDvjcOsVpoUOEa6NfD06kCIer2gImm2R2sIV6/0wiU2mL0wEO4vc4VrEf3LRpPsr
         iKMA==
X-Forwarded-Encrypted: i=1; AJvYcCVexEoC6+5hl0S226v0jFV6+eK7Z9gFWG6/YtDNnw+tK3t869VHncsvaNLS1mQJKmsJkmIwr42dD232cw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5yaUeTTBr5BCIKN6vsfMWUgl611NQfCl3akmCsrEhe2+FDqiU
	f39GTYOanwmSoRsPisOCUIofwZ5dD4X0NBtIAeYw564nR1eXjE4E/BGdRpNawS3ehlxTo7XE5Ik
	GYiVTW6/rUYb9hdEaZEMoNRYgvPwFwTAC3AnvpdQZNQ==
X-Gm-Gg: ASbGncv+nqdiq7pPqZR3wgsR6fcdGOgVb4PLMLrvvZmHHmgpCL2R2QPbHhZNo4AFKaT
	Dqtrg5Wi62B0MXy+l0wTGwLHSBFfDhdXeq0bCXV9K70j2DEsBCbOZfFAhesNaBXcmp31BcE2KEO
	UdUyoWbnqriOf+slMaCkD8SbmRiNFdV+qIcBGEL+CjhALkqvCGL+QUT3hOgXRTbj5V6g==
X-Google-Smtp-Source: AGHT+IFer49uV/0MlFOwzViAxidhmUTCovTOCELPmnDhegazhsSbbMo1dxe+RgiFPEHTV1iqxE1ZvAzIrmUV7Y4BUPA=
X-Received: by 2002:a05:620a:4405:b0:7ca:f3d0:e7c8 with SMTP id
 af79cd13be357-7cd47fed6f9mr3472211685a.52.1747919524812; Thu, 22 May 2025
 06:12:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 22 May 2025 18:41:52 +0530
X-Gm-Features: AX0GCFsHvByQyFYjjj2yI43kVVdpVcQ_KO3AH4tPajR5bk66xedIzcAuV4seOEA
Message-ID: <CA+G9fYssasMnOE36xLH5m7ky4fKxbzN7kX5mEE7icnuu+0hGuQ@mail.gmail.com>
Subject: arm64 gcc-8 defconfig call to '__field_overflow' declared with
 attribute error value doesn't fit into mask
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-wireless@vger.kernel.org, 
	Netdev <netdev@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Johannes Berg <johannes.berg@intel.com>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Content-Type: text/plain; charset="UTF-8"

Regressions on arm64 defconfig build failed with gcc-8 on the Linux next
tag next-20250512 and next-20250522.

First seen on the next-20250512
 Good: next-20250509
 Bad:  next-20250512

Regressions found on arm64:
 - build/gcc-8-defconfig

Regression Analysis:
 - New regression? Yes
 - Reproducible? Yes

Build regression: arm64 gcc-8 defconfig call to '__field_overflow'
declared with attribute error value doesn't fit into mask

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
-----
In file included from arch/arm64/include/asm/sysreg.h:1107,
                 from arch/arm64/include/asm/cputype.h:248,
                 from arch/arm64/include/asm/cache.h:43,
                 from include/vdso/cache.h:5,
                 from include/linux/cache.h:6,
                 from include/linux/time.h:5,
                 from include/linux/skbuff.h:15,
                 from include/linux/if_ether.h:19,
                 from include/linux/ieee80211.h:19,
                 from drivers/net/wireless/intel/iwlwifi/iwl-trans.h:10,
                 from drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info.c:6:
In function 'u32_encode_bits',
    inlined from 'iwl_pcie_ctxt_info_init' at
drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info.c:208:3:
include/linux/bitfield.h:195:3: error: call to '__field_overflow'
declared with attribute error: value doesn't fit into mask
   __field_overflow();     \
   ^~~~~~~~~~~~~~~~~~
include/linux/bitfield.h:215:2: note: in expansion of macro '____MAKE_OP'
  ____MAKE_OP(u##size,u##size,,)
  ^~~~~~~~~~~
include/linux/bitfield.h:218:1: note: in expansion of macro '__MAKE_OP'
 __MAKE_OP(32)
 ^~~~~~~~~

## Source
* Kernel version: 6.15.0-rc7
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 460178e842c7a1e48a06df684c66eb5fd630bcf7
* Git describe: next-20250522

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/28517069/log_file/
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250522/testrun/28517069/suite/build/test/gcc-8-defconfig/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2xRo9LbWebbQqL9EYIT8oB7qmNj/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2xRo9LbWebbQqL9EYIT8oB7qmNj/config

--
Linaro LKFT
https://lkft.linaro.org
