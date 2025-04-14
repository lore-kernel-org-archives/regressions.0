Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC44727B51A
	for <regressions@lists.linux.dev>; Mon, 14 Apr 2025 16:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744646885; cv=none; b=EOPWckqn+Z5KVN9JPSRMtCjSa2IYN1EjdF1Lyz8yDF9b37LVuZMq0myepLj20jB2r5f7owJjDaEkyudlQav+DRjEqhiGBf6b6NXY3wZNzX6AvAVNl/KjoXqlb8L5+unYG279YET4ssKmk7B4wuUSt7JRZfpgszsFtsJkbVJAtR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744646885; c=relaxed/simple;
	bh=YsDDrqdiKPewJFDI/ZaIPX3S15luwx8n2Mto/qWn4FU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nVaokuRc0wghQrv+0IPR8VK6JyWrLtr0ic+IL/ckyZPyr3DzTYEXuGacw800SxSTFq0mo6/hfTIKHghGfCCP93aRbY03JlifXqs0FDzKHYzI5WtY82bn/HKQe9uogQdVDKFOrnMERHKrIGhBAOnLhg3mLbDglT4jYMPKjqRIKCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K+UGElNk; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K+UGElNk"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-525b44ec88aso2132193e0c.3
        for <regressions@lists.linux.dev>; Mon, 14 Apr 2025 09:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744646882; x=1745251682; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GVdhvs8iCKF+l1CgTbrVGuUPsMa5kPGA5aq8CngfGco=;
        b=K+UGElNkQBIKt5ZI3JVaZXIKbVxs1qvo4UMe7lnfGnOIIrUiavha5nCQLAuZc48/Ey
         Wo0jxhSW+7rAwaZc/C+eXj7uFAVQiBNepXU+kJLmpVlW1VwwSXAjYQhrMyCIPWUaQ90s
         kwQhnoYjWM1aWAE/B1EkK7o5MXSQaemBUzeuverq3Ct0NRKAuOwRswQUrXD1swwyvO/I
         FMGbjp2nRp8oLA7+H5Y/gPwhqFafquE84Zocn1Jd0Kv1m2w7LDmCu17CDrgNleBr5U9I
         aGUZ7L8Y+AxclASBQ7jq027w6whvQaCN7bOtgGwJSfhIDwY9Yxk7gr7QuH8kzLwTxbGE
         e/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744646882; x=1745251682;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVdhvs8iCKF+l1CgTbrVGuUPsMa5kPGA5aq8CngfGco=;
        b=kv2yQF4mtgPiwFldpuhKAARuagfym8Bimofy6Ndh2F5/KiuPLyNCNRnGmXf2qHCywQ
         TkxtPhim9syUjMs1CKpoChs35aPP+HXIqhpJptbEJFQUz8oN4FauRK+rW5Pua9KLZu3J
         MwzcpapcymL7eyrNHTuqgGiWXWhivhCh02YGGWpFekjykn+gM8uhhSaSZCasubE7al9v
         PvGAD1GBvvasiFa/wYGObSNjkwnWB13MfVB3CW+wFKbooEf2o7l0G3XIik+1Z1X+q+/U
         alnG+EdpxQeLHu5baYoQHmvEejpKbYY7Jhwp6855EAaHTJeMJoVNXkLNXZmiX8zT0SLi
         /7Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXDTmsSorCXf3ckAiAvqABwmdcQ1N5rXfkpqJmd57KHMqK6e6P2m5AUPmiiRMV9E7lxZIj4fVL/6ytxFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAeL2IRt9wgHlmzV55UpqRCKDIO0RRZwfb6mo+5f6/r3Y9V+HF
	C02LqT8ikq2BtOj06SML0heWmDqvg08afNUE5h0Wzv/2cJKhV+5Fn9ab0gpANZ0HDftrtjN/a+k
	tymGI3/YLX2axtGVcOjoDC8QeR0eDhnhbBqzMpg==
X-Gm-Gg: ASbGnctHDyKOhiB/x+izgCBH5TuznHF0//6RkVewmgA8KcyRaxWrGXCqA4vduOA93R7
	HeyAPCjQr5zJoYOE+t6sixXXo49Sx08GBBIJcE+SqxpVPxk+NPj/o/n9nq5tOb2e//a1F9qxDqK
	m9EbQR8J5Q+W9ytlhBmnhm+Y5H3xqOs9gacjBdTsCrUXFc1NxTLuKVqGY=
X-Google-Smtp-Source: AGHT+IHBAGkweFTifi1qPgR9IAfMLmuSmWZaZQ6DuipMBRn0J0LfwS+rc70yp8/jIym5PdQxz5lfL2wrwCdthfYvTjU=
X-Received: by 2002:ac5:cdf7:0:b0:528:6ea9:bc45 with SMTP id
 71dfb90a1353d-5286ea9d6a9mr5875777e0c.7.1744646882420; Mon, 14 Apr 2025
 09:08:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 14 Apr 2025 21:37:51 +0530
X-Gm-Features: ATxdqUEU9CbNcg5O-P00XITiRp_i9HXoSVbIKt6BMPS9caFWsHNxBM8T9sm2aH8
Message-ID: <CA+G9fYvnun+bhYgtt425LWxzOmj+8Jf3ruKeYxQSx-F6U7aisg@mail.gmail.com>
Subject: x86_64 clang-20 clang-nightly config lto-full failed - ld.lld: error:
 linking module flags 'Code Model': IDs have conflicting values: 'i32 1' from
 vmlinux.a(gdt_idt.o at 1321040), and 'i32 2' from ld-temp.o
To: clang-built-linux <llvm@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on x86_64 config LTO_CLANG_FULL with korg-clang-20 and
clang-nightly on the
Linux next-20250407 and found again on next-20250414 tag

First seen on the next-20250407.
Bad: next-20250407 and next-20250414
Good:next-20250404

* x86_64, Build
 - Build/korg-clang-20-lkftconfig-lto-full
 - Build/clang-nightly-lkftconfig-lto-full

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

Build regression: x86_64 clang-20 clang-nightly config lto-full failed

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
ld.lld: error: linking module flags 'Code Model': IDs have conflicting
values: 'i32 1'
    from vmlinux.a(gdt_idt.o at 1321040), and 'i32 2' from ld-temp.o

Clang-20 versions:
   "name": "clang",
   "version": "20.1.2",
   "version_full": "ClangBuiltLinux clang version 20.1.2
   (https://github.com/llvm/llvm-project.git
58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)"

Clang-nightly versions:
   "name": "clang",
   "version": "21.0.0",
   "version_full": "Debian clang version 21.0.0
   (++20250402105505+c57b9c233a87-1~exp1~20250402225526.1363)"

## Source
* Kernel version: 6.15.0-rc2
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: b425262c07a6a643ebeed91046e161e20b944164
* Git describe: next-20250414
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250414/

## Test
* Test log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/testrun/27929871/suite/build/test/clang-nightly-lkftconfig-lto-full/log
* Test details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250414/testrun/28114606/suite/build/test/clang-nightly-lkftconfig-lto-full/
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250414/testrun/28114606/suite/build/test/clang-nightly-lkftconfig-lto-full/history/
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250414/testrun/28114590/suite/build/test/korg-clang-20-lkftconfig-lto-full/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2viBgnFQjsmdmrsmASvlyYWisRa/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2viBgnFQjsmdmrsmASvlyYWisRa/config

## Steps to reproduce
# tuxmake --runtime podman --target-arch x86_64 --toolchain korg-clang-20 \
   --kconfig defconfig --kconfig-add CONFIG_DEBUG_INFO_REDUCED=y \
   --kconfig-add CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y \
   --kconfig-add CONFIG_IGB=y \
   --kconfig-add CONFIG_LTO_CLANG_FULL=y LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
