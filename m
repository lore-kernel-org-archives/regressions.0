Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD25311CA9
	for <regressions@lists.linux.dev>; Thu, 28 Mar 2024 13:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711633360; cv=none; b=LvfxRdSj+80IJtlxcYocmP9wM8ToVocKch/A0nK3LJBLwBlguOYZmmEZqB64ipeIlPdEU2cWNalG5TXQKXIFe5MH2F7/rNjjzAWZRdYJSfkuUvIBF399MXU/9xpYSrjzeTOxTS88Vp0M8YeQdaHQctQxHuO/X853gFpUXpNSKBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711633360; c=relaxed/simple;
	bh=hhRlYplAngPEQbPQPZoDSxo+OkYmG1EWXwIVdXRC3Vs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=n3wHtahNlq98KtYe0MQLuDiOKHSK0uJThIkXQBLCMcIf0Bj0buJl1IPXPd32xSfJouDB7439Ig2MyfKEWDm4x8BftyCgKEicKDHjuOsrgiqloHnWBJydtnYp0E4iBYHxkrtg+O38mF5w/kjePRlRpK35ktJQH7ixH1oOf/5kzjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZlJOimcJ; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZlJOimcJ"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7e083af7ceaso236845241.3
        for <regressions@lists.linux.dev>; Thu, 28 Mar 2024 06:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711633358; x=1712238158; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5CeNIBGwaVDgfO73ZfAkhp4Wwo/FpVfC31xG4w3suuo=;
        b=ZlJOimcJTiaYCYGMZGMAB+CEvKxCQTqD3+YX9UhQ3NpQIiznt7fijPZDuOUABVi1vs
         71hFXNx+D9DViPrqi2lSxl+/EfAXSeZTNlAs28JtJllhrKoD1Hu/dekEjp/3ETrJnpXN
         jeehoB1ODHaOJ//433FcvX52OT/Pgqr/97lrVDbVjcEwo7oSg04V1a3POuB6SQG+ujIZ
         erkpZJzRe3Mg2pYDCio/NbO5GAnP+nRZ3bpsBzUhZqHCSCU3kwuwZbb5Nu5ZlITSTJCv
         6GG4ejz+j/XXY1VxxDh9jULIvSmoc48aM2LrqyU4kxbYk/D91gp4cfqaLvFD1aYKjaH2
         MTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711633358; x=1712238158;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5CeNIBGwaVDgfO73ZfAkhp4Wwo/FpVfC31xG4w3suuo=;
        b=hsB12cuDOvKULVWJ4FZLdr0Oi5tw9+0+6W/M716/9ivbQyf1Sb9p7JaDOZ3yI5i4HR
         FQPzxQwm6ueISQMzo2P/fzDOU9Md2JTPKfChro1ckFw2F9zOK1uZclx+buocLTmYS43j
         z2KhRMvksCaPVi9T4zlozUjhCtt4BZjhVm9yp9Q2cZrosX7XZ4a6cdVC/Qxe12wio4hq
         PsPafMzxp0X8DVVQJXhXjUfsHGrQHeSkbgwMWHIMs6iMEOIquK+MWi1O5AXH85TToK5b
         lN0MrKNH6Cm0fRyR/kbsEGeZW/9THN45qEytM70u0VGqUEZWIc9gEWJnlNWcvl8OWcNQ
         U/pA==
X-Forwarded-Encrypted: i=1; AJvYcCWprUTLUi7CO9G6qTUZxAHvStu34vpx+CG3fU7uDyJB/H4lfeVbxFAfK80Y1ZsYns2DFWeqKjngFYE2lbkbdflnq/YWNPHfofplCM8=
X-Gm-Message-State: AOJu0YwGB+uIsWz/ngJnIYjy/+gG2nV2vAMwCRV8QzjTk27qhy16rAmQ
	uq9zQVjF63i0hHxNu6Do1RhlvfuSfL6YAei4/fCFY7RNQVRXjOBHdasLsx2JEYTZ3lXm4UHlJIf
	+2SMjhXuY1i3Lfb9bGPB/1oDPMhhTRTlsYBP88g==
X-Google-Smtp-Source: AGHT+IGCQwVFe0hrVaXjlFER1xvXN0uGdEjUdmEts8/9uJnSVwOGSKAOOHh35Vp2giMo7mQCITi+xEA2fQUNpHq1clk=
X-Received: by 2002:a05:6122:d9f:b0:4d4:19e9:db0 with SMTP id
 bc31-20020a0561220d9f00b004d419e90db0mr3400240vkb.0.1711633357669; Thu, 28
 Mar 2024 06:42:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 28 Mar 2024 19:12:26 +0530
Message-ID: <CA+G9fYvB6unkhzFomVcg+M14Cc7xSKkzhMuXaWqZQbDej_aduQ@mail.gmail.com>
Subject: next: sh: mm/cache-sh4.c:250:51: error: too few arguments to function 'folio_flags'
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	linux-mm <linux-mm@kvack.org>, Linux Regressions <regressions@lists.linux.dev>
Cc: willy@infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

While building sh defconfig with gcc-11 the following build warnings /
errors noticed on Linux next-20240328 tag.

sh:
  build:
    * gcc-11-shx3_defconfig  - Failed
    * gcc-11-dreamcast_defconfig - Failed
    * gcc-11-defconfig - Failed

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build error:
---------
arch/sh/kernel/cpu/sh4/fpu.c:389:6: warning: no previous prototype for
'float_raise' [-Wmissing-prototypes]
  389 | void float_raise(unsigned int flags)
      |      ^~~~~~~~~~~
arch/sh/kernel/cpu/sh4/fpu.c:394:5: warning: no previous prototype for
'float_rounding_mode' [-Wmissing-prototypes]
  394 | int float_rounding_mode(void)
      |     ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/thread_info.h:27,
                 from include/asm-generic/preempt.h:5,
                 from ./arch/sh/include/generated/asm/preempt.h:1,
                 from include/linux/preempt.h:79,
                 from include/linux/spinlock.h:56,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:7,
                 from include/linux/mm.h:7,
                 from arch/sh/mm/cache-sh4.c:14:
arch/sh/mm/cache-sh4.c: In function 'sh4_flush_cache_page':
arch/sh/mm/cache-sh4.c:250:51: error: too few arguments to function
'folio_flags'
  250 |                         test_bit(PG_dcache_clean, folio_flags(folio)) &&
      |                                                   ^~~~~~~~~~~

steps to reproduce:
----------
# tuxmake --runtime podman --target-arch sh --toolchain gcc-11
--kconfig defconfig


Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240328/testrun/23229659/suite/build/test/gcc-11-defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240328/testrun/23229659/suite/build/test/gcc-11-defconfig/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240328/testrun/23229659/suite/build/test/gcc-11-defconfig/details/

--
Linaro LKFT
https://lkft.linaro.org
