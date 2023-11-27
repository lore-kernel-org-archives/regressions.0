Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD7D6AA1
	for <regressions@lists.linux.dev>; Mon, 27 Nov 2023 10:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eybDUuv2"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-45f3b583ce9so2919443137.0
        for <regressions@lists.linux.dev>; Mon, 27 Nov 2023 02:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701081805; x=1701686605; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R6TSIoz+H8JLiNUcGCIq1Csd5pwnS8su62/9RaC91nk=;
        b=eybDUuv2HtNbT0SLFNqzB9BVII8bALBFdCyxWybUcPZWWxBhyCX12bCOuTwvV7I96S
         6fAtkfKqZcRbcsNVn2pxvZCTKkNkVID/g8+XOU1YeHnwG6nlnu0j1xsMlZ/BHHigZDB1
         TeXotcnZPIBvr3QJ0eX3A08/6s1DgItO9gy3r41X+cT1gqK/1S0QNSROSpD6hCNXeOLE
         zkmlEqEx3QbxzcOb4EDJd/zNxO/x23CMIIfF7d4yQsAbSyBQ/9PnNjNipkhorfv+MwLP
         jnGnbPufaqST9YS/Qkl40ijo0qhi8ovwj9h+jnSyI3rto//A5fZUTj1KgVKoCCN2e/Q/
         g6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701081805; x=1701686605;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R6TSIoz+H8JLiNUcGCIq1Csd5pwnS8su62/9RaC91nk=;
        b=oo25XLEfGDV0lU+IAWmsyGYBl6TwrGeEzn+hemnGzlELhMqYQW/u73wb6u4nVKWUWE
         anYan2E5fyIaNghvakMbt29BfX8j5Dsz/LzGz+gOoYn2Bzdz5wK+QWpZgI6YfTLKYXuB
         iFbwsE8LXk6P+G9fuuTVWCWXh1z1EaM9bq2N4vWtcWKcTW24pAfpGH33PkbOuaQeFfKt
         3i05feMPS+9v1yAtFiYS94pLjpjbPCNbSFOi/cIP1MLyrywLjizJjtESS4BtaOdog1yk
         SXscWWk3Tj5hWnc3JDFRvpwyGKWhswktL7Vv/krXhXfmqFfJltazIVDeQf2CgpDpT4CR
         KqJA==
X-Gm-Message-State: AOJu0YxzHPKOOgJC0pXxkJgCTMvRrq/D4bfWTQUoX5BYyy+FxW74sY5h
	45zPNh4aHjn1yj3XbFGf+IUsno4E9UEtHpKi7tO0Bw==
X-Google-Smtp-Source: AGHT+IGMKNRQ2wePxRC4PpDnj4YoN1p1HWwhKXLnzyZPaFNOeCXmqVoolj5+388JcmcpA13+Hkz5NYjQyYeR/zR/n8Y=
X-Received: by 2002:a67:cd16:0:b0:462:f13a:286a with SMTP id
 u22-20020a67cd16000000b00462f13a286amr2897810vsl.4.1701081805658; Mon, 27 Nov
 2023 02:43:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 27 Nov 2023 16:13:14 +0530
Message-ID: <CA+G9fYs6WafDBtSbcLpoyWehQyBPNeX37PvsP6HzSotXr3dYLg@mail.gmail.com>
Subject: lsm_list_modules_test.c:104:22: error: 'LSM_ID_IMA' undeclared (first
 use in this function); did you mean 'LSM_ID_YAMA'?
To: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev
Cc: Casey Schaufler <casey@schaufler-ca.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Paul Moore <paul@paul-moore.com>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Following build errors noticed while building selftests lsm tests for x86
with gcc-13 toolchain on Linux next-20231127 tag.

Build log:
------
selftest/lsm/lsm_list_modules_test
lsm_list_modules_test.c: In function 'correct_lsm_list_modules':
lsm_list_modules_test.c:104:22: error: 'LSM_ID_IMA' undeclared (first
use in this function); did you mean 'LSM_ID_YAMA'?
  104 |                 case LSM_ID_IMA:
      |                      ^~~~~~~~~~
      |                      LSM_ID_YAMA
lsm_list_modules_test.c:104:22: note: each undeclared identifier is
reported only once for each function it appears in

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Steps to reproduce:
-----

tuxmake --runtime podman --target-arch x86_64 --toolchain gcc-13  \
 --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2Yk9XptRIQra77bvzZHcgyzkH7w/config
\
       debugkernel cpupower headers kernel kselftest modules

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231127/testrun/21324802/suite/build/test/gcc-13-lkftconfig-kselftest/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231127/testrun/21327065/suite/build/test/gcc-13-lkftconfig-kselftest/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231127/testrun/21324802/suite/build/test/gcc-13-lkftconfig-kselftest/details/


--
Linaro LKFT
https://lkft.linaro.org
