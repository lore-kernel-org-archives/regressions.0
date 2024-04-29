Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD911779A4
	for <regressions@lists.linux.dev>; Mon, 29 Apr 2024 20:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714423440; cv=none; b=E0gL+kHn23a2hGxXQ1a5WJj17GToNubelOVbcdy4oieQtBXV2kh7TkVpp0Zaguiq6KXo5QrqgT3v6KlaArLhQCvqLRYideSSCvNIsBQC4Kj3rvRS+Mp5kXiVD3Du3wjfU8KCAgY/AkOk4SFN5S74IQcMzjhTL3X64bSPfp9tYJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714423440; c=relaxed/simple;
	bh=DlJMFV/5TBkqj5Xgp0aq/ty+b2/P8lMPnJnVQ5Jw5rY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=O9apKE0w/vs2tnXdo74ImQeu4YE2KS5EytgO0nd9jD9ephGxfSXO4Xuyzw+hLcwZlr7tIGDbeSJxnVf3jqo+/Rye1Mtsg6FkVIc5U86IkuoUzFb9Muc+ZbBP3+UC4f2Rt0aXXaZ1ij5vV187m5R0YNF6njtT6QJs5l+1ThpLQew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rZAk/u/5; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rZAk/u/5"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4dac6802e7aso1083553e0c.0
        for <regressions@lists.linux.dev>; Mon, 29 Apr 2024 13:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714423437; x=1715028237; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nFLm7dyUtqCFeQ1Y3Oad/n2nmA3y2+DD3YB2hxxWLCM=;
        b=rZAk/u/5DvwEaUFc6PBqu0mCgFKKFL8JKiwYp5SgROhYKGqxke0CHX6q8T2JYKqa+U
         fUwYvw4n559P0xFHmNfUXkt6RE8Nm37guG0lJviDdF9XJcRRqwZvWQcV/aqHi7/gUqHp
         to7B5GW8XoScEeWRE6WGLE3qCfZoZofokp+b8s1lRldQ9WNP+ofiTrv+axyrX384Cuqc
         jDX7PQu0fmmDEauSYJIWpFRk32+2WjEOtjmydwrLTC8KCboJPqISrSEHQ6uAohaBmNRV
         teMEgOZqgMccaPCOtV9eYuY4LV9VtFcZXh/MsqSjkXb9KvyY3SogX7JsNt2/B7+ytIht
         RvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714423437; x=1715028237;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nFLm7dyUtqCFeQ1Y3Oad/n2nmA3y2+DD3YB2hxxWLCM=;
        b=Me8TXFzLRxwnNcv0bY0pfwUMI1LeLcuxfMIq+3yGYUWKkJUhNvpeyt/lzVVNcrl4zS
         HrOIX+2K4gD15ANdlFiJLQ1CIkHIv4vh/pqGUmtGhzV2KAKivvzwSRVysUzmgIexylyF
         PVrbc7VXmsJ92Fxqhi3cVCDh2otg+l++qb8IQpPhTLm3kDHX0mFiZLdVs9uC5uLt7vxY
         4sI3IhM6b2xQoaHA6nQVQk8QHiLoUbFOC49TDB5Xbn0/OtnQ/+lhBqlp1Bn9e5vAI17R
         UPRKoWe2BLlFTKeIP1jc+r/t4NiaR5yazICPz6MGFJU0CtFDX6tlGhbP/NAaKv2pCbO7
         dG7A==
X-Forwarded-Encrypted: i=1; AJvYcCUmx7zpifwpFQXuHzVuKqF8R9dVJEEfzdp/2N11kRwgF7PZqyJsNocQpA7rYngxZ7yuOUsSfuIrgNeAHonFC0LjnMAxX01VsWetTCQ=
X-Gm-Message-State: AOJu0Yz9eMZsbQmm4TOzMqCdLH9sCzJO2K8sbx10057AIVEFsuPJRaHO
	n5SvxORTXQS6fniG7gvNieJ391ZOEnzGFG5Nyj9ZY2bCTtHzxjsLztNt29jZsyoGt77KnWpGJj8
	GOqrwbWS9kJ1w/Ja/5rV9u4RzvoBVnsIEQvp0Nw==
X-Google-Smtp-Source: AGHT+IELY2zwLnQIzK1qbE3Sp9Z06BUgG4WlkmnHrcqV/8QmexyPMqSjZnChm2MVfRJ3gQJpaKv37A2s5enuif64LHI=
X-Received: by 2002:a05:6122:725:b0:4de:daa8:b8e2 with SMTP id
 37-20020a056122072500b004dedaa8b8e2mr9482653vki.3.1714423436022; Mon, 29 Apr
 2024 13:43:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 30 Apr 2024 02:13:44 +0530
Message-ID: <CA+G9fYuP7S+a89Ep5g5_Ad69EMwRkJ8nM+MMTzbEcP+6H2oMXQ@mail.gmail.com>
Subject: s390: clk-imx8mp-audiomix.c:363:12: error: 'clk_imx8mp_audiomix_runtime_resume'
 defined but not used
To: linux-s390@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, imx@lists.linux.dev
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, peng.fan@nxp.com, 
	Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The s390 allmodconfig builds failed on Linux next master branch with gcc-13.

s390:
 allmodconfig - gcc-13 - fail

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
--------
drivers/clk/imx/clk-imx8mp-audiomix.c:363:12: error:
'clk_imx8mp_audiomix_runtime_resume' defined but not used
[-Werror=unused-function]
  363 | static int clk_imx8mp_audiomix_runtime_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/clk/imx/clk-imx8mp-audiomix.c:356:12: error:
'clk_imx8mp_audiomix_runtime_suspend' defined but not used
[-Werror=unused-function]
  356 | static int clk_imx8mp_audiomix_runtime_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

metadata:
----
  git_describe: next-20240429
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_short_log: b0a2c79c6f35 ("Add linux-next specific files for 20240429")
  arch: s390
  toolchain: gcc-13

Steps to reproduce:
---
 # tuxmake --runtime podman --target-arch s390 --toolchain gcc-13
--kconfig allmodconfig


Links:
----
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2fmJ3qzFbmI2ACNTo81vzzgQaLS/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240429/testrun/23715243/suite/build/test/gcc-13-allmodconfig/details/


--
Linaro LKFT
https://lkft.linaro.org
