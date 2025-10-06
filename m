Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BD925949A
	for <regressions@lists.linux.dev>; Mon,  6 Oct 2025 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759740216; cv=none; b=LXYDjgHbtWgzX6TuuuZUBx3Q56jgQ24CS7AohPf4sDSstnTdsRLimWnbd2QW5AZsEKJNAxraMVq5v6mWUSbSEyZ4KxDt9ZQZStWS1n3ZSU/T4Ak2Rq0khPA1H6CV4wV3eukKf+EJN8GADsvqECvH3QNbUmhhlDkfmPSpZitlsr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759740216; c=relaxed/simple;
	bh=0rqNTIzuAUmGUZmDFajGT6N8yRPrwxMpdo1LXU+gh4k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rE4S0y41cE6lrv9XBXqdGuApLzuEsmqDPQJK6QIS36w3FR2jbgT7QabqZgjEJ84yTk3/JEPB1htQIyPsfqtyU9P9uhsC9PNFW9zehpSehThefIpejwNaIyT5G5a+Oe22OXQ5wVbXGySNug47mi2TnywtFQloMnKbCw2DgkSdcG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rt2CHFqj; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rt2CHFqj"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b62e7221351so1841901a12.1
        for <regressions@lists.linux.dev>; Mon, 06 Oct 2025 01:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759740214; x=1760345014; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XbkOLsSeEc4de19QVHiox7c6UUo78PKyegeBXplGkhg=;
        b=Rt2CHFqjqdlyL2/54L+zdHlnghhNEZj14H+hcFqjFs7W8XOd0cnb4UVW3LGVQ8YWaZ
         DMvPeXezjrcNDuv0AVXSWHXyz5pbt8POyGqQKtQcp298L18Cg6x5evsClTfPhtXA/nns
         KI84wJpvmfdjAYjVCgUOsnBSq0EsWnF+1BT1dXF0Je+R9qDaqvqhnuq7DXcx0/X51F5M
         G0IS+SYcwRzWZWdycEYFnrLkeFDMMcGf22XE0WzpuNZMCaaD7x92x7dLBq0df1xmu6GK
         88wLYQ0vNYoWhaG05q6MJCq3x2QXhiqbzoj9JmX5Z84iAM8jzlRXHacUZgjzN01jEYSW
         KN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759740214; x=1760345014;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XbkOLsSeEc4de19QVHiox7c6UUo78PKyegeBXplGkhg=;
        b=CXZOu4hm8j42TSqlPAykh609RaB2KIro83IekawUE7FO8vSoNNJ67e2LUf934h2q1E
         13E1pvMsarcnsPxCQSupQD/ydbrqRNnyIj64VWuaRsMHCQ9BFUoR27zAxoo5k069P8b5
         8AVAuiqA81/+jt9kg2Cz5RBYKJpIB/PbGASWMcNc49cirW+0r+lFhvE7o06qxs2ClpbH
         4f7pYnsEYlaeb/puVkzIf4X2mUc8j7jAd6emcPf52ICWCQDfRcAWSjddmf5KctEnIGWC
         h+RlCBPEJwg6s4+PcSbg7n0qBSf5TOa0xTsuxXsmiQu/sevO1NTYBPtKn04kVtb0c6Qk
         DEtw==
X-Forwarded-Encrypted: i=1; AJvYcCX/DOO1n8hWo1nlNdfzTRIrhIIM0K2WgEP3w/mfmxOtv3YVTX7yNWwpGFVi1c4tW40RAdACbUhmxN7KNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyEl6iIUYOYDSQP/ph5Y/scqE/fFZA7SbIpQR9+dRkYwI1pJCE
	lG/6By6wr3A5pu9nSYaHMcsBpRxc0JsSmCuDqe60ZHKC3DY9N8N6z/pVdr7RhQXR/Fd60N/IIJV
	OhuVVf7npkscjySJ+WrQv/jhBWp9nj7C4VeI0l3hXBQ==
X-Gm-Gg: ASbGncuiWZAuju4W8a3h5XXOkxuh8bCQKbg9jJTa2B3klqofx0DGL3ud93GGOBgsJDU
	XSTDRxZfY2PNySaOJKOFtMv+Q1G3vbMZhm/M5Ydy9IPMa3I5+4xv8UAwMI3HRF7OhjuBrqUpfGg
	HViLsdYw0/rGCQfvR8G2ZDtbKTTCwYFkwJE9eSzdHGuDPo1dOv+WJNHL/Cs3Aa7/nRVsVT24lxN
	QLtZ9sxlSzkVjC8YOVlEFxYoEti86cwSCpBqCuGOg9w5nITGyJzFvoEK+l5cUsv1XlzTMT3ZW7I
	E5Z+Nu91EVpiLITjqR9i4pfOCFB9OuE/ubZImBHVX6ZCsA==
X-Google-Smtp-Source: AGHT+IG70fTPRSenFkY+h0Ci4bsOWclGRtd5+NQm5QtlMXDZUWAfWyV7v3HpmAz+QpEftxA1fNt3+ZAYzqOOG5usHHU=
X-Received: by 2002:a17:903:2f4c:b0:27e:d4a8:56ad with SMTP id
 d9443c01a7336-28e9a6a2eb6mr138892325ad.61.1759740213842; Mon, 06 Oct 2025
 01:43:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 6 Oct 2025 14:13:22 +0530
X-Gm-Features: AS18NWA6yLhMUIQR5RWLa0LAv-ggCbP2Rb4RY4ONcT6ZxSvFVMy57u3jDGKEbJ4
Message-ID: <CA+G9fYsZvF1f25x10oL=Gs=+f_AFmaUFtUT8Qs1bXugEaJeoMA@mail.gmail.com>
Subject: next-20250102: arm64: gcc-8-defconfig: Assembler messages: Error:
 unknown architectural extension `simd;'
To: linux-rdma@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Patrisious Haddad <phaddad@nvidia.com>, Michael Guralnik <michaelgur@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The arm64 defconfig builds failed on the Linux next-20251002 tag build due
to following build warnings / errors with gcc-8 toolchain.

* arm64, build
  - gcc-8-defconfig

First seen on next-20251002
Good: next-20250929
Bad: next-20251002..next-20251003

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: next-20250102: arm64: gcc-8-defconfig: Assembler
messages: Error: unknown architectural extension `simd;'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

### Build error log
/tmp/cclfMnj9.s: Assembler messages:
/tmp/cclfMnj9.s:656: Error: unknown architectural extension `simd;'
make[8]: *** [scripts/Makefile.build:287:
drivers/net/ethernet/mellanox/mlx5/core/wc.o] Error 1

Suspecting commit,
$ git blame -L 269 drivers/net/ethernet/mellanox/mlx5/core/wc.c
fd8c8216648cd8 (Patrisious Haddad 2025-09-29 00:08:08 +0300 269)
         (".arch_extension simd;\n\t"
fd8c8216648cd net/mlx5: Improve write-combining test reliability for
ARM64 Grace CPUs

## Source
* Kernel version: 6.17.0
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git commit: 47a8d4b89844f5974f634b4189a39d5ccbacd81c
* Architectures: arm64
* Toolchains: gcc-8
* Kconfigs: defconfig

## Build
* Build log: https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt/build.log
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20251003/build/gcc-8-defconfig/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt/config

--
Linaro LKFT
