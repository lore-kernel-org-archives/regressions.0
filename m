Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587832D0C80
	for <regressions@lists.linux.dev>; Thu, 31 Jul 2025 14:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753971124; cv=none; b=eImRhoe4WeFDlncEA4jJyUwsTBVTvXF06PbZfsa/Q/LtF1FRQoCRt9qa5RP/cJR25NWvxAPFvbg7vEfvv1YsNOOpG6K/R1iqcFygG0fQE+t6tiT4uGq30OwQaEFJgG4PJW15aSfdn/LNylL1S1EVxrT1mqwnBHkwLvJMzprPNpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753971124; c=relaxed/simple;
	bh=TH3fCZPCy4YyphExJVOAQdZ8iXnIWWWw+CoAeuxr3Ps=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=aT6Ztdi9fLnFiNMAtzRm3kIx7GCD133VrQ3CymuPdQyz6dQ/Cuv3lxmK3gM/EuLqOYKCQSdZ12S+ik1YIUQ2dO4FlrpLShoENK72vNWxVH1kkE4I1LcqWANlWrTWawCCypaoetfr0XrRQQFRkNK/MDV9qhRXzins3+jzWfHXPek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n2qzdW86; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n2qzdW86"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23fe2be6061so7498685ad.0
        for <regressions@lists.linux.dev>; Thu, 31 Jul 2025 07:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753971122; x=1754575922; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=REQVjpTsrsLvJl/SEHd88cRQSz2tJb2a7A9OwH842ak=;
        b=n2qzdW862aUnMyi48ZrhI6P+l8NqOc2AI4IsiIqSTaG3MfFfvX2UMbwgEGSpb8uSHV
         hqLXU2WVYmPnw/NYHctPdtX3iF+qXE4Jli/Mud0MEh7ez2OC6rCh55JoomHPV/DW/1G8
         QNpYjGP9nlBSmmGNSSyZ1MsOeadW8T0zaZ46k7RxNjPgQpGoTNfBcjF6pqThYMiEtMvI
         ic/VxByJe2SvrEDUcXJIhWA2vGUqSLJ30tATfWVZdVwgL1ofzHXn54DWM5MIx/2f1u/4
         NUMUgxWXzfQg8aDPqSuym5UzZwmL63N6jywomS/EFmSEi1/aVIFnvWQXScr+OJ/wrYQK
         bAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753971122; x=1754575922;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=REQVjpTsrsLvJl/SEHd88cRQSz2tJb2a7A9OwH842ak=;
        b=Vu0gbDNCDU6Fge9CpY5LoxOqLewg77Fj45Iy/ijF0bbw2zHa+oLVbcU8KWyN+G1jk+
         l7ZDRz1bW84PrTLuz5nyOlX5TQG0aczLUX8GD9C9hylDTFKnwWFsc+1oRd798PXGy4jT
         N8vSR1GlcKoi2HP3WvDRCYEEf7feNJvMA9LWHVGXPxw/jr9UXe9V98O+e64AgpTjKtbz
         7GVmXyQU1tmSFw8w8rP1iz07AKrizZ/1jGnof8TzAb5WqjU8AFgC0QpirKq5vBB1oALZ
         qC4MQES1FFFLNcdcO2eGFj3ezDpm6hmzOvcHM3ED1ozIG32Km12ARpM4tnquYlUmsQCi
         eIdA==
X-Forwarded-Encrypted: i=1; AJvYcCXcpSvz/Q6FHIgbOrSA4szKTb196nobb9jtWIjFBTv+rjFgbdrF8UneGB3YZJaQLQcRfJFDUoscpcticw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwC+QgNDOdLAJUpdN1ogSyBB2hs8FKBEfLUdqwZoL+Ph0bPxq7a
	6b/MFAl2/2QoJYVbSaZpdHhyHLM/3r8OHKIBGMivjdRmjilZ938Wsvlk5ca20xM7df6JV6PoSfC
	Tec7ROuFwhkzM0VsIC8asrxlRT/D0FR4MYB1KDfGYqg==
X-Gm-Gg: ASbGncuzSRkZPO5QF2nQV5u/Y8OqMaLypFsZzLV9E7sIIqHJWrE9o5Eh7mBc1YYK8bS
	sLSZfMt1+d/DhKGJl6hNtlafvBhb1oHE/2AjxuWw7szOdGsuBS3TVNEY5DuSAfnCk32/Mh9yOTF
	1rQnDvEm4HYieDqGFvbrEWRw/OxDIdrRiGoZizz4mTUwCYI4Zfefw3eMdxjqrod80444O3FyMMh
	vyB9sq5CkRJfSCvMM2GQhUGBbHndfjlFdDOH3iC
X-Google-Smtp-Source: AGHT+IHFfipkwRQ+1K4xVlGJXDzqCVyVvmjQjtepMnIjmmMksReYrNJ2xhZLKNYVlub943plRlIYBtrdspjKLTHKge4=
X-Received: by 2002:a17:902:ce8e:b0:234:24a8:bee9 with SMTP id
 d9443c01a7336-24200a0a192mr33923355ad.4.1753971122562; Thu, 31 Jul 2025
 07:12:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 31 Jul 2025 19:41:50 +0530
X-Gm-Features: Ac12FXxL-rGTjN1fNAMIPyVHVoE05EOo4i2s7AKGH0E5aPdsscvXESoyUk_z0Hc
Message-ID: <CA+G9fYvMS94GL5kMmHKSGSQqTS0XgwiYnETf_bLYYu6nTRNP-A@mail.gmail.com>
Subject: next-20250731: arm64 arc riscv64 parisc vmlinux.unstripped warning
 empty loadable segment detected at vaddr is this intentional?
To: open list <linux-kernel@vger.kernel.org>, linux-hardening@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Masahiro Yamada <masahiroy@kernel.org>, kees@kernel.org, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Ben Copeland <benjamin.copeland@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions while building arm64 arc riscv64 parisc with defconfig
on the Linux next-20250730 and next-20250731 with gcc-13 and gcc-8
the following build warnings noticed.

Build warnings with gcc-13, gcc-12, gcc-11 and gcc-8 defconfig

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

First seen on the next-20250730
Good: next-20250729
Bad: next-20250730

Build regression: arm64  arc riscv64 parisc vmlinux.unstripped warning
empty loadable segment detected at vaddr is this intentional?

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
aarch64-linux-gnu-objcopy: vmlinux.unstripped: warning: empty loadable
segment detected at vaddr=0xffff800082720000, is this intentional?
arc-elf32-objcopy: vmlinux.unstripped: warning: empty loadable segment
detected at vaddr=0x80306000, is this intentional?
riscv64-linux-gnu-objcopy: vmlinux.unstripped: warning: empty loadable
segment detected at vaddr=0xffffffff8202d000, is this intentional?
hppa-linux-gnu-objcopy: vmlinux.unstripped: warning: empty loadable
segment detected at vaddr=0x11400000, is this intentional?


## Source
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 84b92a499e7eca54ba1df6f6c6e01766025943f1
* Git describe: next-20250731
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250731
* Architectures: arm64 arc riscv64 parisc
* Toolchains: gcc-8 gcc-13
* Kconfigs: defconfig

## Build
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250731/log-parser-build-gcc/general-objcopy-warning-empty-loadable-segment-detected-at-vaddr-is-this-intentional/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/30cmZFV63SOEwwWoGiSHEsDR63Q
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/30cmZFV63SOEwwWoGiSHEsDR63Q/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/30cmZFV63SOEwwWoGiSHEsDR63Q/config

## Steps to reproduce
 * tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
--kconfig defconfig

--
Linaro LKFT
https://lkft.linaro.org
