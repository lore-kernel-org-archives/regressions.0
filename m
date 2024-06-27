Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC934178CC5
	for <regressions@lists.linux.dev>; Thu, 27 Jun 2024 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719492577; cv=none; b=P077HV4n1urDAYudCZlCX8FRCCdimBSK8dTRyyLpi5yieRnZcY1nFnegSNMO13NyecpVfurT3KHIx9cypMXZ1SZhLDfRnQSfqli2r9NSHmn/cQTwzlsZUpx0wE1meDg1GCPZtgm5S14e1sHHn4dDUg11dv80AhQyx8neiZCI/vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719492577; c=relaxed/simple;
	bh=Cu5bT6sPCCfDQjQRjkhShbiDXjp7BjV1vPvAfCQyeCg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ohd4fhaYiH+6rlmU3EQkk5baBT+/cfCvi+fpDSqWEMj8Q+yrDIhrKlTizQ2bXUkpMlKusqCDtN1zbBd1XzcL3Taw+OsAq7doRL/eJi3aqsZxkpMhYTUG36cwzZF+GAK2bTO2erqHnl3gJ2nNlxnqzyqpFNL9oC3lh/1h09R9ACM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zqGXQ0s+; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zqGXQ0s+"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4ef7fc70bdeso1534487e0c.2
        for <regressions@lists.linux.dev>; Thu, 27 Jun 2024 05:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719492575; x=1720097375; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+7Qni7r/WgAD7DkgtwtmtiwAZVFbDMDzC460DmWWyAc=;
        b=zqGXQ0s+56HAVwv6HP1CuRtEOFKVMSzYsB5XMcmjAsRhYwTsK0VPvX6RMgvBw2MoKF
         KfTart3iP7oDN1CM1AonxH2225EwGYHm+9r8uQHFGNaJYJTOB/fF7nmcBGiOeHSlzJhd
         SfsVI1qKRd8gF1WDvsMKKHmTCnlyyWv0Ncyiw1ql5pAjOkdeGB/zldoAZXC2NaXkOovo
         mO/NlN2XhjXFhleoQI4cVw/SJrLHnd7U0wuBD7hV5XgvDN+88C/l6Avm8mKwSXamTbib
         fOMIgjeRd2DnHiHKun/jFXg4K5uRETfxihwmmQQcXSf8qa/4dejZXckmpY4dZsXcN0rx
         GJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719492575; x=1720097375;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+7Qni7r/WgAD7DkgtwtmtiwAZVFbDMDzC460DmWWyAc=;
        b=lgAPSC0wH/E+KImOBFjjS6fP82owfwtuj314DGFF+uU22AIOKM+ENAJPpXLqwM1W72
         JUi97AH4f+k321gSJtseNCLY/E51LbWntLPd+b8i5iSEoswF2LnfID1zE1Sbh1jCQ/Xi
         x28ZCbc/9a0HHZCrd5+Bnoui11ba2Hgx/HfhAsDzPGo9zMtG3Xxc/xpa1RjJsncH2OtH
         rAqp/aKSDt23s8O0V+ei5r12BznX3WCS8EFqjrrouqWRbpoIMmN/cDt9R7gaqPbTSICk
         8uPhMwDxhSD3NiYcDSW4D+ay8bMa3ZPA2+82nCNRWQFRwtC2hF+ZcZNCsvUVumptJJDv
         2rIA==
X-Forwarded-Encrypted: i=1; AJvYcCWCMp9SrdvtmXyZJ5vKPZVoipgSlMSpBMsD0504KJ49WMhh1xcj4LNOZ3bYqYXnQ4l+gZkh4RkNf65VO+089iQ9tnAGWBBsIW/zQuU=
X-Gm-Message-State: AOJu0YyJC0m1QdyOZIzdvTIN26N+BYrvTX3XgXHcluy7CWL0+9kBMNNO
	TsXbyZK9auB5Vc72I09n5lhe3oj8BhWwEVCI6FlQ8zhRphLMOSNtZuQHKbS+3UW+b2+2ELaCe4c
	UAqHakPYbX0udC0iFjwTEx32lnvKJtVz1MT8FNg==
X-Google-Smtp-Source: AGHT+IGiITpyURlNbsXp5GME0V7s81ygGcIa99Yj2pi1rna6IbK6cbK7/bfy993EzWRjVk+838aCUMLn0wBd+QXyZjY=
X-Received: by 2002:a05:6122:921:b0:4ec:f758:e514 with SMTP id
 71dfb90a1353d-4ef6d8ad6e8mr11872712e0c.11.1719492574631; Thu, 27 Jun 2024
 05:49:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 27 Jun 2024 18:19:23 +0530
Message-ID: <CA+G9fYtiWKuQzwoBVaBA6zp304uCw5SsHKf3484CY-kuuOgnFA@mail.gmail.com>
Subject: powerpc: nvram_64.c:75:13: error: 'oops_to_nvram' used but never
 defined [-Werror]
To: open list <linux-kernel@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mm <linux-mm@kvack.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

The powerpc builds failed on Linux next-20240626 tag due to following warnings
and errors with gcc-13, gcc-8 and clang-18.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Regressions found on powerpc:

  - clang-nightly-ppc64e_defconfig
  - clang-18-maple_defconfig
  - clang-nightly-defconfig
  - clang-18-defconfig
  - gcc-13-maple_defconfig
  - gcc-8-cell_defconfig
  - gcc-8-maple_defconfig
  - clang-18-ppc64e_defconfig
  - clang-nightly-cell_defconfig
  - clang-nightly-maple_defconfig
  - gcc-8-ppc64e_defconfig
  - gcc-13-cell_defconfig
  - gcc-13-defconfig
  - gcc-13-ppc64e_defconfig
  - clang-18-cell_defconfig
  - gcc-8-defconfig

Build errors:
----
arch/powerpc/kernel/nvram_64.c:79:17: error: initialization of 'void
(*)(struct kmsg_dumper *, enum kmsg_dump_reason,  const char *)' from
incompatible pointer type 'void (*)(struct kmsg_dumper *, enum
kmsg_dump_reason)' [-Werror=incompatible-pointer-types]
   79 |         .dump = oops_to_nvram
      |                 ^~~~~~~~~~~~~
arch/powerpc/kernel/nvram_64.c:79:17: note: (near initialization for
'nvram_kmsg_dumper.dump')
arch/powerpc/kernel/nvram_64.c:645:13: error: conflicting types for
'oops_to_nvram'; have 'void(struct kmsg_dumper *, enum
kmsg_dump_reason,  const char *)'
  645 | static void oops_to_nvram(struct kmsg_dumper *dumper,
      |             ^~~~~~~~~~~~~
arch/powerpc/kernel/nvram_64.c:75:13: note: previous declaration of
'oops_to_nvram' with type 'void(struct kmsg_dumper *, enum
kmsg_dump_reason)'
   75 | static void oops_to_nvram(struct kmsg_dumper *dumper,
      |             ^~~~~~~~~~~~~
arch/powerpc/kernel/nvram_64.c:75:13: error: 'oops_to_nvram' used but
never defined [-Werror]
arch/powerpc/kernel/nvram_64.c:645:13: error: 'oops_to_nvram' defined
but not used [-Werror=unused-function]
  645 | static void oops_to_nvram(struct kmsg_dumper *dumper,
      |             ^~~~~~~~~~~~~
cc1: all warnings being treated as errors

metadata:
--
  git_describe: next-20240626
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_short_log: df9574a57d02 ("Add linux-next specific files for 20240626")
  arch: powerpc
  toolchain: gcc-13, gcc-8 and clang-18

Steps to reproduce:
---------

# tuxmake --runtime podman --target-arch powerpc --toolchain gcc-13
--kconfig ppc64e_defconfig


Links:
--
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2iQqkMfvFPihkYnvWC7UxrVhb1X/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240626/testrun/24453163/suite/build/test/gcc-13-ppc64e_defconfig/details/
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2iQqkMfvFPihkYnvWC7UxrVhb1X/config

--
Linaro LKFT
https://lkft.linaro.org
