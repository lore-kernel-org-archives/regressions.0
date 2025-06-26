Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AD8238C04
	for <regressions@lists.linux.dev>; Thu, 26 Jun 2025 07:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750921438; cv=none; b=QvHbzudmNYeGILrHjPySpW9fTnCz8XLF/cGCw0xZo6djGsyIIB0fNCXLXPlxMfHsalWzorFyvIDktBaRgFVe97jBF3v5wxCnMFAuFkewZTjNNN39jTzizUj/xDPgz5hoj0gDAcqX9uZoNErVk/3lfF0BX+r0ddlZE+wgknXm2hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750921438; c=relaxed/simple;
	bh=9C/yPC65dyt5L285Ad0r8Enf6n6g55IaUv+DoEN+0PI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Jd85UMOKRcye7vUiYhQd35jy+2iNWgsTfqFMoftnxG3QJZpJFXOf7wR7l6yktIDs7v5clye2je2YNHjZlHRO6q7TMmhHNssxfJ1HektvUaliNAeukuxRa0FmdQEzgsDFGSVBeiROS7U2mSAYwavQ9Zz99GYAWtdWPcp/mnmGksY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q4GPJQ2+; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q4GPJQ2+"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso706507a12.2
        for <regressions@lists.linux.dev>; Thu, 26 Jun 2025 00:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750921435; x=1751526235; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9C/yPC65dyt5L285Ad0r8Enf6n6g55IaUv+DoEN+0PI=;
        b=q4GPJQ2+2Iptwe1rQOb82bALfBnLNrgB190qhnMWBlNlo04KD9m8M5lULf/XoHMpiq
         Gb35wu/HJ6RRfuqh7fkdQlqRdAyg9IB/epk+28cSgI28d21hRgcCj7/+txpnDbXm1wGo
         uCc5tq631Fqra01K56Gz9N2gAyKMFMZS1xKzPKKWx+LPo14l52Dxar+aNzJEa8mbSaQQ
         ucpQFXsq+Z/EQNbofinPwfSV8Y2BG3SZ8NBUXHWVxDf73m3uAbMb0Q6pyvGw/fioiBpz
         HaDLMV6/8/1QmhQkiLpwWvBE9N4WkkuNMYJN2HJCrbMes/43a53H/+C/Zx++jNit+Gzl
         5t5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750921435; x=1751526235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9C/yPC65dyt5L285Ad0r8Enf6n6g55IaUv+DoEN+0PI=;
        b=JW6Dzc4VC8BhsVz3W7NQLzLrC2Su/uCi3zMtQ6ceksBOOcvD4lPtkMosXiWX15KBq9
         yJ0XpbVuR+XY5cGbWXzcKWfPRVzYMAbWhIpKRwfMkgIyGL2gUSjWqYuGBPEEDR2XKwD8
         tAURojRXZPfOznbr8BhlybrAysFa5TpkEXRTv7C9XcCtYtsuZjPgmfFx9mCr2NCYug4l
         mXBXLpBWlrUzNKi/5Kft3gyTBg0am4fnWDD7FIiNCEMUsS6jqX8ADbrUd+kmuTerEeW3
         LmCMeSZW++LwdUhU18d7l2JYdCkaUl7plcq4kOsrw4SW37LcMb9JVYNXI15cMaodmKHh
         PYfg==
X-Forwarded-Encrypted: i=1; AJvYcCUvnsUIVC5bsNjKmN9fU+4rTg9T3CCIs8JV9iGVecmXb2gTpGG+gzgtmsM4VPrdcUTDf/PznLaXHrxzTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3OMp5q8eypDLXLinQJGe3x6fdorRLfF02AH/U4WsLe7Gn/6vP
	tKhGo2yAaSIiPlHqAxB3fAoHiVzXvM4tKN9S0nWWziVOe4h41wBNZ6mLLeQ+k5Htafvc88/8ULw
	XGB/zTCa29AvyZMfOdmTTHJFuNR/JMnlSbJMXGOUwVA==
X-Gm-Gg: ASbGnctc8Bj+IRl/58WSwsjjmHvfztgeNJrg3MfZLL9Qm+xgrUjhoRaHj2mySpBFh5T
	94qYwVgSwKL194TlqyuB0v2VDgK4osQ1EHJUIVcXRSGKRVnJJLdImkRiQJR4MWVqwLbKuJpTBeX
	Z5VPucQclt0c+Pm0BlUYStkiM9TEHDHoLeliO1RB8rxCSu0Rm8FYnwI5E7KW51BRZG1ls3m7iOK
	heU
X-Google-Smtp-Source: AGHT+IGB3/XrVvwCiSKGcdM/uKLZZR2BBjt/EJ8TFkLwSBLUw9n1kq4/A/cuTaHIdw+LRFJ+QBCRjPhK4cZiYm51gdc=
X-Received: by 2002:a17:90b:53c5:b0:312:1508:fb4e with SMTP id
 98e67ed59e1d1-315f2675bbbmr9154353a91.17.1750921435517; Thu, 26 Jun 2025
 00:03:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 26 Jun 2025 12:33:43 +0530
X-Gm-Features: Ac12FXzrp0QOBUWJ7tIxkv-cgchxT19rQvDD483_utcFbw2DHpKfR-GbfFmMvSU
Message-ID: <CA+G9fYtJO4DbiabJwpSamTPHjPzyrD3O6ZCwm2+CDEUA7f+ZYw@mail.gmail.com>
Subject: stable-rc: 5.4 and 5.10: fanotify01.c:339: TFAIL: fanotify_mark(fd_notify,
 0x00000001, 0x00000008, -100, ".") expected EXDEV: ENODEV (19)
To: LTP List <ltp@lists.linux.it>, open list <linux-kernel@vger.kernel.org>, 
	linux-stable <stable@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Amir Goldstein <amir73il@gmail.com>, chrubis <chrubis@suse.cz>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Petr Vorel <pvorel@suse.cz>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Regression in the LTP syscalls/fanotify01 test on the Linux stable-rc 5.4
and 5.10 kernel after upgrading to LTP version 20250530.

 - The test passed with LTP version 20250130
 - The test fails with LTP version 20250530

Regressions found on stable-rc 5.4 and 5.10 LTP syscalls fanotify01.c
fanotify_mark expected EXDEV: ENODEV (19)

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Test regression: stable-rc 5.4 and 5.10

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

fanotify01.c:339: TFAIL: fanotify_mark(fd_notify, 0x00000001,
0x00000008, -100, ".") expected EXDEV: ENODEV (19)

The test expected fanotify_mark() to fail with EXDEV, but received
ENODEV instead. This indicates a potential mismatch between updated
LTP test expectations and the behavior of the 5.4 kernel=E2=80=99s fanotify
implementation.

Test log,
--

fanotify01.c:94: TINFO: Test #3: inode mark events (FAN_REPORT_FID)
fanotify01.c:301: TPASS: got event: mask=3D31 pid=3D2364 fd=3D-1
...
fanotify01.c:301: TPASS: got event: mask=3D8 pid=3D2364 fd=3D-1
fanotify01.c:339: TFAIL: fanotify_mark(fd_notify, 0x00000001,
0x00000008, -100, ".") expected EXDEV: ENODEV (19)
fanotify01.c:94: TINFO: Test #4: mount mark events (FAN_REPORT_FID)
fanotify01.c:301: TPASS: got event: mask=3D31 pid=3D2364 fd=3D-1
...
fanotify01.c:301: TPASS: got event: mask=3D8 pid=3D2364 fd=3D-1
fanotify01.c:339: TFAIL: fanotify_mark(fd_notify, 0x00000001,
0x00000008, -100, ".") expected EXDEV: ENODEV (19)
fanotify01.c:94: TINFO: Test #5: filesystem mark events (FAN_REPORT_FID)
fanotify01.c:301: TPASS: got event: mask=3D31 pid=3D2364 fd=3D-1
...
fanotify01.c:301: TPASS: got event: mask=3D8 pid=3D2364 fd=3D-1
fanotify01.c:339: TFAIL: fanotify_mark(fd_notify, 0x00000001,
0x00000008, -100, ".") expected EXDEV: ENODEV (19)


## Test logs
* Build details:
https://regressions.linaro.org/lkft/linux-stable-rc-linux-5.4.y/v5.4.294-22=
3-g7ff2d32362e4/ltp-syscalls/fanotify01/
* Build detail 2:
https://regressions.linaro.org/lkft/linux-stable-rc-linux-5.10.y/v5.10.238-=
353-g9dc843c66f6f/ltp-syscalls/fanotify01/
* Test log: https://qa-reports.linaro.org/api/testruns/28859312/log_file/
* Issue: https://regressions.linaro.org/-/known-issues/6609/
* Test LAVA job 1:
https://lkft.validation.linaro.org/scheduler/job/8329278#L28572
* Test LAVA job 2:
https://lkft.validation.linaro.org/scheduler/job/8326518#L28491
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2yxHGv=
VkVpcbKqPahSKRnlITnVS/
* Build config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2yxHGvVkVpcbKqPahSKR=
nlITnVS/bzImage


--
Linaro LKFT
https://lkft.linaro.org
