Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837FE28C5D1
	for <regressions@lists.linux.dev>; Wed,  7 May 2025 17:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638912; cv=none; b=SP6UDXMFj7uqPb+g4k3JD/GTVx9FgrR/hm5lQ6wAaVvLj+RCnoCK5ojre4PECfm4Q1htZ7eqffo6hJXHX/vnm0w0o1UUBBTN4jDWQea4HGOpi7Zj3PASouDqtcWngkTT27BwyAylBNqyLgPFwnOPgZCAPX1X+/tI+MnD3Ow2wsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638912; c=relaxed/simple;
	bh=FZheEln+DecdmEZZGrByjZ/STe0Pg6RlF1CAnfLpyS4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=tXCkk4IG1r2XuTH5DXV4XkwK0MOkcbCrufMayOjM1lVep7SzGOhnEvi8I3aBrijnGLHEpQAVn0Jn0DLokRBnja1ZNDlXwLMrmne+WZ0xEWq/mrPim0Biisv+laeH+YCGrye/8hGdaGFCPJMMCcn22Lpuc6oozASO79l+NrI8Dt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J5pzDAfL; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J5pzDAfL"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-523ee30e0d4so32286e0c.2
        for <regressions@lists.linux.dev>; Wed, 07 May 2025 10:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746638909; x=1747243709; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sJLTnvgsmSh2wyqfhON/8YMw/+czkU0YdZcT/idsIUo=;
        b=J5pzDAfLzlOcJexsZDZYSQ+tdxSVQQlUs8t0J4PYOPiwN86eDqPmMOAeHuw8HzhPap
         yhNEdbx+xRAxAG65v4mjFiFh8AfYQL7+rnjTQTfqPNaJQOxrwEcmtWZJYAdfr4NXo7xU
         B4Pte7gommKw9sN6skmB7apAG6eugdjY7FpcJ1OFsmCO2tv/XCa+XomKWpRmCJ0XeTXQ
         /Wia59Sac6BxNlEgAM7XMAZ3tyU1WaXveaIYan7EBTriJTzP21mDBzuz9Ncb0H0IglXF
         tmv7ErS1L6F8HQE25drw5UpFPAzM9G0nUeT/hc1LM444tf8hdoc8I08sWRaNgSlJRju2
         jphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746638909; x=1747243709;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJLTnvgsmSh2wyqfhON/8YMw/+czkU0YdZcT/idsIUo=;
        b=QjxHXwbpsInUtSA5QXMFGBBmYaMUaAEUahg41QdxJzz7sXycwWMWLpxM9encpSRPrL
         jFnyL6AWH7fo8KTjyMKe7Lxe6ojfdg1BKiQPalQLqYMiijDSmbLmAzOyRzU/Gst46fMR
         o/A9p+0bKWMbixvQbPrD//tCLl9No5GMRDowXAYvoWjvP+sRAnUZJaf5sOZ8cJ8DGMlD
         HbhBL8u4vHeJtIoxal6TZE7ihjpCQijGQF3TP1eMVSJK39yvEYOZQFA09VUa1xr/e3U9
         +C8LHfocA9PNeQYvJ0SINkrPxXenkjVdWcJy7baZdZhJfyTUNaIpLSekAXvwxqndTOeU
         tF0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV374qPcwZyG+zEKBVw8M+7LyJjmwffNdWRwjKxeWsv3F8OW/69tdFXV/TjakM50D7GR8BezX9xwLLPQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyETyZoJuHWKxgO1JQ7l7sUTXUlg2wSZmbUu4sBiqXXwBzp2dVQ
	/cr0jtk3uHonmds4jDN/Dgs/InoVBX2G5Q3hqOTrVzIRKgt4K+24yNm2uVvkwZWFB/BHe1u6YoZ
	jDMwGhBr6FW1mlzYE4USRE4PwIFxmFr6qblHg6g==
X-Gm-Gg: ASbGncuB/jYesMc6EW0tK5U+I8+9VBzUltPtwu53W0FOTnWffxHTAb5P1KlvmEtrqpN
	ZyJdT7KrxqEowcpMJbMgLiqN0aaNJr+iKnKq9u7Bl0jbyesxLbykjmJLXnQe8gWoS8fKXwVXXm3
	EXQ7Lpln55LavOeknRezm5wVZbIKyEGNNcvO5pk5j6YN0l/QVaj2L+6yDo3iG7vgiR
X-Google-Smtp-Source: AGHT+IG4IZaoNkvRVKDzjVKbKIFzE/3psVUcmLfbZLgj5FXPKyORsxzJGTRDuB6JKK04vnZMts+sE8XiaT4hAEYEAdQ=
X-Received: by 2002:a05:6122:8c03:b0:529:2644:8c with SMTP id
 71dfb90a1353d-52c37ab714emr3191911e0c.8.1746638909299; Wed, 07 May 2025
 10:28:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 7 May 2025 22:58:18 +0530
X-Gm-Features: ATxdqUEMZ5W4dbsisOcqI2zyoKIHW94ya2MhqqQpRIXO8khKuthGJXEdEPM65MY
Message-ID: <CA+G9fYvcXTuxC0ncXBQYh8FZE2BxGSuTi6dvN_sWxBRcOAN8tQ@mail.gmail.com>
Subject: next-20250507: arm64 local label `"3" (instance number 1 of a fb
 label)' is not defined
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.or, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Eric Biggers <ebiggers@google.com>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on arm64 lkftconfig failed with gcc-12 on the Linux next-20250507.

First seen on the next-20250507
 Good: next-20250506
 Bad:  next-20250507

Regressions found on arm64:
  - build/gcc-12-lkftconfig-graviton4

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: arm64 local label `"3" (instance number 1 of a fb
label)' is not defined

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log arm64
/tmp/ccRYUGrZ.s: Assembler messages:
/tmp/ccRYUGrZ.s: Error: local label `"3" (instance number 1 of a fb
label)' is not defined
make[5]: *** [scripts/Makefile.build:335:
arch/arm64/lib/crypto/sha256-ce.o] Error 1

## Source
* Kernel version: 6.15.0-rc5
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 08710e696081d58163c8078e0e096be6d35c5fad
* Git describe: next-20250507
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250507/
* Architectures: arm64
* Toolchains: clang-20, gcc-12
* Kconfigs: lkftconfig

## Build arm64
* Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250507/testrun/28349400/suite/build/test/gcc-12-lkftconfig-graviton4/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250507/testrun/28349400/suite/build/test/gcc-12-lkftconfig-graviton4/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250507/testrun/28349400/suite/build/test/gcc-12-lkftconfig-graviton4/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2wl9II1HZVx3jggzwK4WceUmGrN/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2wl9II1HZVx3jggzwK4WceUmGrN/config

## Steps to reproduce on arm64
 - tuxmake  \
    --runtime podman  \
    --target-arch arm64  \
    --toolchain gcc-12  \
    --kconfig defconfig  \
    --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/graviton3_defconfig
 \
    --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/lkft.config
 \
    --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/lkft-crypto.config
 \
    --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/distro-overrides.config
 \
    --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/netdev.config
 \
    --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/systemd.config
 \
    --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/virtio.config
 \
    --kconfig-add CONFIG_SYN_COOKIES=y  \
    --kconfig-add CONFIG_SCHEDSTATS=y debugkernel dtbs dtbs-legacy
headers kernel modules


--
Linaro LKFT
https://lkft.linaro.org
