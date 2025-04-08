Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE1526A08C
	for <regressions@lists.linux.dev>; Tue,  8 Apr 2025 12:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115736; cv=none; b=YPKcmyxpzvVF/r+bjfbKYL1cCihiYxkjUUcpYYlTiv/TiEcGKJlOmGBm+Uc3Bos8q6F/iO8hV6nc2TSnKmGLQiQpnnNpp90xwRnZZbiYH9AmvuyHNzlOK6X2d8xiTqRkka1z/96G67RO41Bv9W39E6cR1Oa5Qo0WufxQ2btSPWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115736; c=relaxed/simple;
	bh=fo/D7Vy/bHCJLwja2xD/bb/2rXotbdfX/H7Zo3+wDT8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gxxbxFqhPA2pFwX5ivjYLu2307izUgsdGUcL0/NgzzE2daetJtO1jnPjG6seS9HBEhtsrbtMrmZlHSbY+jJQP0wv702OWc13nJbWe33L30pEiPdUukqbTE5qdiZJyAhKEP4/RfE1PT5ofCgMMyNcbQ07wDa//5tFNpHDcvA7g5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A3EW4pW8; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A3EW4pW8"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86feb848764so2274010241.0
        for <regressions@lists.linux.dev>; Tue, 08 Apr 2025 05:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744115733; x=1744720533; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/U112c3eNoEpdOFrvh7CcjezylBSmoKAUzWeh1M4C48=;
        b=A3EW4pW8KAjePqKSsqEm48ORR6wC3uYCposhDejstj1+cSiMim5I2Yx/FBqoJ/0/lt
         1DYN2qNXTvnE61cwb6WP2HxUR9ZsBlMnQ//1qs9xxJVD2vr5uHDUb4955J7p/7xsSD66
         0WahokzkbeeOo/AvdpwugLotM5wQ65EQM6qYiy5q3VvJOKtEZ7/9hqJBcQ5rD5g1OGtH
         rFvwP7ZXzHTsz9NxPnVh/gLGru6WEoAeqSUVzmEYx6QA39XdN57vli5ktKnDiEcBXkMi
         Xy5zW5aecNck+22WyxUtsw2PgB1EZcM6LqVX2XtWzznjbKgQp6Pu+u8GfbrsTti6AXrn
         fyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744115733; x=1744720533;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/U112c3eNoEpdOFrvh7CcjezylBSmoKAUzWeh1M4C48=;
        b=vx2dft686TPxM8fXzmV4oXdBpCmLXlSKO6Mbg4EsnNtzuspFnUnHBrJsKDdWpJZH9j
         UHH0a5c/H0jXEcDG3302wDPc2jj/aAmsYV04o6a6tI4IssKDo7TZ1BKaRFaQ6b9q+D8U
         Ov6ZrTAFIdmbiRs8pveuixVw/iZbAEEDr+teVFR53Jz3h7kIER9umJkLCGg03ChhQOHT
         JQIY0JaWp/hapD8t0UG++H+fMnnshG1qxlmFJ0fbgncETDXcXeiiIPtCTwgxwLu6vqmx
         yaJ36ZioiAz3QuQp5LWOzNzpXVbXi3Y//QFtfRAWx/raQeiv855ujaRm5xq7srJk6bAR
         hiMg==
X-Forwarded-Encrypted: i=1; AJvYcCXQAXecAXi0qpWoMLFt727sXzG4Q7S59vHd9VsSYVVb4+uS5r048mTZK1k1PaWOt/acjgiYmMRfc9RQPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzH1pp9kgJ2oj3kvR64y1q3Xdy99RNRqQ3T0UQCn2UhMKOmPTod
	a4vTJP9HQ1M059ocecwqkuZ+zwnsNrQnJmqqxkJ6YOi+vxpvjNNnnSDJLn/aV1LlACj1CqYFSTd
	rsgzelXMpwy/lHu+qSkatkBCzZJz4aMguEdyiFQ==
X-Gm-Gg: ASbGnct4UtKFLviG9Nh0bGN21Aab9zRiK0JRTD0JZSWnE/MS9zIWrWErEDjht0L5a+j
	3cRXG0mq/R46D4iDi70KU63gn2VEAT87iilUiDVyv2JJmabELGC+IrL/o8hqZQU/KWNVtpkHtuY
	I68ZTVmIcNjV4AodwcbfQXxjNpEZEolCaw2dF3EHuskt53/djL2Gi8+JwoJahEcMosz70=
X-Google-Smtp-Source: AGHT+IFfrUZA9P0FlfVvDGw+QCkUVYYIjMI5wcSJPSzAp7n+zPY08mgfTxQqvgd8poJltS31C52pfXlDC6xYxKM2j78=
X-Received: by 2002:a05:6102:504b:b0:4c1:9738:820d with SMTP id
 ada2fe7eead31-4c8568c0b92mr10407478137.6.1744115733375; Tue, 08 Apr 2025
 05:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 8 Apr 2025 18:05:21 +0530
X-Gm-Features: ATxdqUEWaftFPwcDydUZjRrXkKZePynV0fvjVXPcjzvBxMxN2KkMbyUQeWe8Fe4
Message-ID: <CA+G9fYsNUbN0PsDQBqVAoUSjSXa5igOjntBFh_TF6m8A4FNDsw@mail.gmail.com>
Subject: sound_kunit.c: error: address of array 'card->id' will always
 evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-sound@vger.kernel.org, 
	kunit-dev@googlegroups.com, clang-built-linux <llvm@lists.linux.dev>
Cc: Pei Xiao <xiaopei01@kylinos.cn>, Takashi Iwai <tiwai@suse.de>, 
	Nathan Chancellor <nathan@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Regressions on x86_64 build allyesconfig with clang-20 failed on the
Linux next-20250408 tag.

First seen on the next-20250408.
Bad: next-20250408
Good: next-20250407

* x86, build
 - build/clang-20-allyesconfig

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

Boot regression: x86_64 allyesconfig address of array 'card->id' will
always evaluate to 'true'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Boot log
sound/core/sound_kunit.c:271:31: error: address of array 'card->id'
will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
  271 |         kunit_info(test, "%s", card->id ? card->id : "(null)");
      |                                ~~~~~~^~ ~


## Source
* Kernel version: 6.15.0-rc1
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 7702d0130dc002bab2c3571ddb6ff68f82d99aea
* Git describe: next-20250408
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250408/

## Test
* Test log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250408/testrun/27937063/suite/build/test/clang-20-allyesconfig/log
* Test details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250408/testrun/27937063/suite/build/test/clang-20-allyesconfig/details/
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250408/testrun/27937063/suite/build/test/clang-20-allyesconfig/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2vQpM7f8SQvntzGG0Tdgxj2amGb/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2vQpM7f8SQvntzGG0Tdgxj2amGb/config
* compiler: clang Debian clang version 20.1.2
(++20250330123306+5ba194972878-1~exp1~20250330003423.94)

## Steps to reproduce
 - tuxmake --runtime podman --target-arch x86_64 --toolchain clang-20
--kconfig allyesconfig LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
