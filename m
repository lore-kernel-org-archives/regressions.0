Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1839A1D5ADA
	for <regressions@lists.linux.dev>; Tue, 26 Nov 2024 14:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732633133; cv=none; b=q4QHE2FH3CE1aAReXrV+UxTOR7Y5SHL/vGvCrzWC/I5EwuvsM4KHJsr+WwHNczrBw2tFVUx4OLvldaSAqiFtE+mOKSrPBAHaKMNwWYBnLCraJEzpl0hSyoE4hxuB06wLYsasoaF+yjtpo9oHniJfzll4I+MEIuBQUNFwbRQnCQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732633133; c=relaxed/simple;
	bh=f1O+zS6/2cw4GKBLIQEa42J3lPvxfz8RoK+Zaaqew1w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HrYChbyl9ev54S2Q5utPGhovMAvCcOTnP4LIDVEjD9MGeoQP8isdwHv2ikz5Ky4itVkrGZ2URLW1YCEdIXf2x5ETNjdmFR1+QvIy4MrsQXIb2JRZEVB8f3AL+sXtXrzXU8nxk6PoW0xuDFc0lrWm5FXQdnofTiURoNe5UEbCKA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=InPD14mq; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="InPD14mq"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5f1dfb0b44dso1090441eaf.2
        for <regressions@lists.linux.dev>; Tue, 26 Nov 2024 06:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732633131; x=1733237931; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7nCMLG4jiyHQ5656b8U7nuMRUbyTISDMqgTqAM6PrCg=;
        b=InPD14mq8PO+hFOfEOnwwI4NsvQjXbFNAgJ4cqRLJ8qXTfjENICuOzYqKvvnTcAHFl
         VsScDLvePDdzggcTAV9S8RlRQMUgs4LnkvVCtbPl7sUiUWEwC9pNNX7p9g0fkGANlDDx
         7FYAPFvhjxTy/Oj6zCVCj/cS8trrANdju2wHvzua4r7CotWTq30y0/EHJHALbsTdH0xa
         xH/+qG4eOOXrNGYDYujatqitHJeiiLIkRDkzdzj6Q4gSOOyqzlGhyetKQt8MiLzOdeIz
         lZ2hvUH1LBZfeWR8Izak5PwYDOwBKblj+IIf2J5hm8HnVjFwaIHsDluDKdqWClpeikIH
         ilUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732633131; x=1733237931;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7nCMLG4jiyHQ5656b8U7nuMRUbyTISDMqgTqAM6PrCg=;
        b=WP9B2pX/Xmex8c/rQ0CKPojqqV+csEf5dspQ2TBU1jc2CREqYhjY9UsKSWE7uXxViO
         8nrAmG+RC3JQ+QzVaSsECremEXz0rQIFPldITIBK2F5ubTXjCvyz8bL726tOZ/HdmKSs
         9NNVbeMOs4B11Ig4qW/phrb5LfetxIu7I+qi7VgAO3MqCPOprNpJ53SlP8JV6M59XfxI
         MDpjxf3gGO0qILzmL7Q3L48bo+LtbIK/gJbHNxOwd2hy+MUeyx4i/wF4Vz2attZUTyw+
         n+dSn3xFIA7O/VbzmJFKym9dli3vP3W2ha3EgRz7l+/JSAYQyqwHHVEgocBhoDRa1Fku
         BSQA==
X-Forwarded-Encrypted: i=1; AJvYcCXCRniZO7hA2khuW+dtYZMen9ma4DgTvvxJoBwf7Vr2483E8mx7hOwbQFK1GRV95Zxx5xVeQz0zzd6M9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZdHseyeGmcTTGH3Mqe24+tmctG/uonLR8JlAQq8AEG9QxcZXR
	rY+HHPZ7XehCL/LnIOtI1wVfZLk9mIV4TpmVC9JtmM1v5AitUtQzZ976kdlWqbRKdX0AFrirqI3
	86WsjOdCcj4N5PZ22ZGSFlXzxSruyf8bNp8hgUA==
X-Gm-Gg: ASbGncsErMVXEAjSvgY1oL/IGPk+76dsOOwU9bK3oeW7WZb70o7WhJwWFx51jHD1B7g
	FnV63af+KYvn1LN+I7TH3uyChDiZcaKD29hrtoz5nMWPgUNaS2IwINTsZEBer
X-Google-Smtp-Source: AGHT+IGRSy8nLCOB5VUyzmDCr9fGOBYudcymDUxbY3GaTKPYQmQrsAEqrNE0VfI0dc92xgcP+9l1NMxeYbAjVcNZnXQ=
X-Received: by 2002:a05:6358:3120:b0:1c3:7275:491 with SMTP id
 e5c5f4694b2df-1ca796d0650mr815761355d.1.1732633131139; Tue, 26 Nov 2024
 06:58:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 26 Nov 2024 20:28:40 +0530
Message-ID: <CA+G9fYvWkS-8f9kOBTzixjGSNN8262StoVv2ERk7mRKcU+p+BA@mail.gmail.com>
Subject: include/linux/fortify-string.h:293:17: error: call to
 '__write_overflow' declared with attribute error: detected write beyond size
 of object (1st parameter)
To: audit@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: eparis@redhat.com, Paul Moore <paul@paul-moore.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The arm64 hardening.config builds failed on the Linux mainline master
for the arm64 architectures.

First seen on Linux mainline master 7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5.
  Good: 9f16d5e6f220661f73b36a4be1b21575651d8833
  Bad:  7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5

arm64:
  build:
    * gcc-8-lkftconfig-hardening
    * gcc-13-lkftconfig-hardening

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build error:
---------
In function 'sized_strscpy',
    inlined from '__audit_ptrace' at kernel/auditsc.c:2732:2:
include/linux/fortify-string.h:293:17: error: call to
'__write_overflow' declared with attribute error: detected write
beyond size of object (1st parameter)
  293 |                 __write_overflow();
      |                 ^~~~~~~~~~~~~~~~~~
In function 'sized_strscpy',
    inlined from 'audit_signal_info_syscall' at kernel/auditsc.c:2759:3:
include/linux/fortify-string.h:293:17: error: call to
'__write_overflow' declared with attribute error: detected write
beyond size of object (1st parameter)
  293 |                 __write_overflow();
      |                 ^~~~~~~~~~~~~~~~~~
make[4]: *** [scripts/Makefile.build:229: kernel/auditsc.o] Error 1

Build image:
-----------
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2pNLRwWNgNgfh4C67CGISDtalxY/
- https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.12-9567-g7eef7e306d3c/testrun/26066025/suite/build/test/gcc-13-lkftconfig-hardening/log
- https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.12-9567-g7eef7e306d3c/testrun/26066025/suite/build/test/gcc-13-lkftconfig-hardening/details/
- https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.12-9567-g7eef7e306d3c/testrun/26066025/suite/build/test/gcc-13-lkftconfig-hardening/history/

Steps to reproduce:
------------
- # tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13 \
--kconfig defconfig \
--kconfig-add https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/netdev.config
\
--kconfig-add hardening.config

metadata:
----
  git describe: v6.12-9567-g7eef7e306d3c
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
  git sha: 7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2pNLRwWNgNgfh4C67CGISDtalxY/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2pNLRwWNgNgfh4C67CGISDtalxY/
  toolchain: gcc-13 and gcc-8
  config: hardening.config
  arch: arm64

--
Linaro LKFT
https://lkft.linaro.org
