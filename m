Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8CE2F5A39
	for <regressions@lists.linux.dev>; Mon, 27 Oct 2025 08:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761555411; cv=none; b=Fos9k49Uih/t7yPqaARezuABSPWHnm2lbQsnFKMnLmjGTj2uD1wDIC4u6OGeM6jlz7VLEpSYnRogvblvDc7llmePoTd3xzubFbyocpVuMT+HIeluNzb4orM58ZJjiZlaQWZNBTSkl0iH6L0Y6hVVJBirV4qq5atXaXVoHwqtrfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761555411; c=relaxed/simple;
	bh=GfH5HSIKG5vJgzEj+X68rTPCf27ssZ6UVJw48ldkXy8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=riwFBHYNLM4x+CdbzWSor2tj5V9y4YoNuZRyro/BI8EGIEHAnGb3a6De6PcNQauEIz022gVfKVe7RkTUgimxMi0FTNUt2n+kyZR1TL//vXl65gd84fars/43V6creA3vbWsVfDK4iUDMHw7VWwdv/zP09sWtWu+Oaj/WS8C4/Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EQk+sqt2; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EQk+sqt2"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-273a0aeed57so59394155ad.1
        for <regressions@lists.linux.dev>; Mon, 27 Oct 2025 01:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761555409; x=1762160209; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KEKtCxt8nIo5AAXBRjH/5vryo/ZaVKRjuXDR6Hi5YuE=;
        b=EQk+sqt2oHUzu4SlEVfS2/Mbm6su+t91uGx2cZsO8BvtYcshXqw6OW4MweAsmQ0rf6
         Rfu209dZaNYDr2YJqqVhcvglNzaVXX6s0PYQxWC5lj1gz5VNOmV/iT1QuAGBggxtlr8h
         Rpn6ERTAocNeK6OdJrVeHvJzdIbwc1vRSpxO7WYdhMQWCEg9/xBYDt1teWplebVtJunC
         gBNChzAIXj51XnkzWAwqR/OhthmWrArlOywWQbgm5NH3x/BzPjWOWa46HLwALxRrBhmm
         uIQba894yleSOp2zPhsIZixOU9BlPHaJbWZSCkpjPFDqMNlzSC2Mf6RckCB8xA89DRNx
         eN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761555409; x=1762160209;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KEKtCxt8nIo5AAXBRjH/5vryo/ZaVKRjuXDR6Hi5YuE=;
        b=keiH/JS8rwpPHi/NItW1MOTDHeAGzPyMHC5heKZ8U7p8tCBaKYTuzW9SQwsnw9B5/+
         o+uytJOwK505POPeXtXXQ5igDjErpyLTllk0IgM1ywS6vAv9BurAKWmyH2/Dj92Yw4V7
         P5eGgYJdKYheibV5SkEaojgNtci6CIQOYGg7NozZ8VWXvEM7fElFxprnHYh1RTu+A9jH
         BtWhMzArm1g9QVEf7+/BoM03LkXLmzN/wQVWfOKHo1zhhuXADU682nkRNGUJwuNQT0hG
         IRMAsWAkgzIFypDpUebuvtWD7sNyPQOzjS5k8gmDApyQ4C1NaiD0I+H0Qh5CcR054OK+
         oRkw==
X-Forwarded-Encrypted: i=1; AJvYcCWpj7zOF3HdrHihvlfmSCUfCFfqEP94pkuujGcMGxtwnJDvEQF4AKib8mh9FZoB8exXlpgvrzxahR5CvA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa5ZkHjtdDGl5YP4F5ynVR1OnRiM2hgVDgxgfDoGB2Ur58rNnK
	BZx661qCGopLBDkyw+l+bhXXE/7GXVa13UIIDnMaSsMzABC7faOhrcHAx5ZACgdPSOKa6Ql1MhT
	Gh+D58Kdv1jIdSeiPNMxT8MhCZEfHIlOU9GsOhE0ALw==
X-Gm-Gg: ASbGncts0UxqMvJ+sjOAdSARfV43+2kJeUkbWhx5IWET5MgL1ywHaEiqF367b59Og/V
	8QW1oy3veGOySJVzRgRUs6yQ3iSMXxvCzOWuSBC7GFfVu4tx/ksvXVnLiZDAexE/cCdbfcRkAD5
	2cgVDuAiXT5I9hsyxNM9zGB7WSaGYv+vxCCd2Pt290q386jQOU/E6Ax0SzE99l01Yvgt8A8S0CS
	CuNKm+m/3vVr6qX5Np7qeFHP8EgtYULYnCHQ4dGh6XQ0JMgO6U3gIV0tvEEd/d7uD7X+TqEwuaA
	YzuNeggs19SdCPPcC2hU6VAhRTsUq2428wTgjo2ZZikXl46x+4LkjLgupa4P5Q==
X-Google-Smtp-Source: AGHT+IHMTIIFLA5mgk1HP2tn5C+IZfCTCdQhL9lHvE1auNKQlgk4Tb9Ecb84rLUsDS+i/shyTUFa12dikG6jGXBHIh4=
X-Received: by 2002:a17:903:244c:b0:267:c1ae:8f04 with SMTP id
 d9443c01a7336-29489e15ea4mr133599525ad.20.1761555409385; Mon, 27 Oct 2025
 01:56:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 27 Oct 2025 14:26:37 +0530
X-Gm-Features: AWmQ_blJuZ42rueT3RfdCwJIhx-741RLJJ31SSl37TaWRIG6sy6Xm1B0UeYV3a4
Message-ID: <CA+G9fYsL+w_XaOPaBaN5xMr6Ssrq_hh2_g8AgNxNmu0jCpjwxg@mail.gmail.com>
Subject: next-20251027: s390: pf1550-onkey.c:154:12: error:
 'pf1550_onkey_resume' defined but not used [-Werror=unused-function]
To: linux-s390@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>, 
	Samuel Kayode <samuel.kayode@savoirfairelinux.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sean Nyekjaer <sean@geanix.com>, Lee Jones <lee@kernel.org>, Heiko Carstens <hca@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"

The following S390 allyesconfig build regressions noticed on the
Linux next-20251027 tag with gcc-14.

* S390, build
  - gcc-14-allyesconfig

First seen on next-20251027
Good: next-20251024
Bad: next-20251027

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: next-20251027: pf1550-onkey.c:154:12: error:
'pf1550_onkey_resume' defined but not used [-Werror=unused-function]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build error
drivers/input/misc/pf1550-onkey.c:154:12: error: 'pf1550_onkey_resume'
defined but not used [-Werror=unused-function]
  154 | static int pf1550_onkey_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~
drivers/input/misc/pf1550-onkey.c:133:12: error:
'pf1550_onkey_suspend' defined but not used [-Werror=unused-function]
  133 | static int pf1550_onkey_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[6]: *** [/builds/linux/scripts/Makefile.build:287:
drivers/input/misc/pf1550-onkey.o] Error 1


## Source
* Kernel version: 6.18.0-rc2-next-20251027
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20251027
* Git commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
* Architectures: S390
* Toolchains: gcc-14
* Kconfigs: allyesconfig

## Build
* Test log:  https://storage.tuxsuite.com/public/linaro/lkft/builds/34dKrowtK5wNPnem1T5LSEjjq5o/build.log
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20251027/log-parser-build-kernel/gcc-compiler-_drivers_input_misc_pf-onkey_c_error_pf_onkey_resume_defined_but_not_used/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/34dKrowtK5wNPnem1T5LSEjjq5o
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/34dKrowtK5wNPnem1T5LSEjjq5o/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/34dKrowtK5wNPnem1T5LSEjjq5o/config

--
Linaro LKFT
