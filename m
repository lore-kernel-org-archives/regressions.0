Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF2179CE
	for <regressions@lists.linux.dev>; Wed,  3 Apr 2024 08:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712131438; cv=none; b=I+BsHGc2d8dfq6HD635DMgt7lzB6/E5mvOlcaooIotcgtzemxktxe6AdBZeOn90purX8F+HKtnD7xzM9n/JD0VjfVqfd0HTIBPeKCoPp2B21HCVr5BnwDYUwyf1esJnhx/VUGS1KpefX4M8IY+WCPbLXlGP4WJVHNB7JgkLiEgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712131438; c=relaxed/simple;
	bh=KjDKKZQAsR2x90HWBcTUfYwToWStcC316tpU9s74CdM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dy9mmSWonQwL1xqifR0pt5vwHzuCW/DRpmgIRe4Zk3LvzgD69J6fmLtyEdCCfuEHmnMcex7e9g3HKjjRKFb/DaMLiKuOQc5Qm5Zn0AmRDIxkCVQEkYj72Z2uW7s3UAZMAmZsvSxasd4mr2fPSo9rjfrRGuPa5JF3gEYIM5D4WWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q23rkjt8; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q23rkjt8"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7e376672375so1024618241.2
        for <regressions@lists.linux.dev>; Wed, 03 Apr 2024 01:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712131435; x=1712736235; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KF5rMcRDqQoWBU2qheNbp11b4MuIV67CJIqxgZePRvk=;
        b=q23rkjt8uj1IKeAnsIMEyoC8t2u028i4zfjekhKAaSTwUSP5dQYy+Z1orSN3dmAvSa
         Fcoq5K9CbLD+MY1mKhIQnoyXpKGsxNcgui58Dztp3p3sw16lkyWoNjdXMFYdCVXcXCqi
         kf5dIWDWF2bGQloRECiNaD2enoDg3UufW5zKQpDcTQLg31lGaXfGc3BoXfSESKNoFZ3q
         PYkY0p9f8CBU/mrLnXqwJhhRTw0aAr0empVMdmzn3nCNa7WfxAtvEBnecYNjOOmZqEvC
         mNWPOKRid12c96IU8r47dHJuezC27u7FHl5Df8eavBHQ4oTxZKB+UpWw1MzgckrmApVl
         Nr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712131435; x=1712736235;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KF5rMcRDqQoWBU2qheNbp11b4MuIV67CJIqxgZePRvk=;
        b=Rx+qwgvQW9BGb4Ui61lXh3r/vVPB4uEmTar7F8Huo75ktXbvwjnCErPxsQTP1MNC1A
         Xuo2TwhJGj3xP/nvpyBsSL3uDHPwiZPLkIv9TEsb6LHaXAKRHMmQd7EZXS1h3mgcNDqU
         VGfuGLmxaYPbNeAxzyw696TK7WeVVV6JZ7bd/NewsljWhzUYRPRQSABEbUC6HfW+zlTb
         gUUf9OqNncY4DIeAt0+NQAH2wEYrJmvEu3QpFbHccZd6HENgHLFhRQtrVZMy7Tq7UeAN
         w5wJx98SdXjmlU68mWcZaEDNxXeYLT1XUo5E9U1PS7U9gnwgmlS+bjLOEV/X4iw0JtDv
         8CIg==
X-Forwarded-Encrypted: i=1; AJvYcCX0bKzumZfWmeJPHBcbuMBE+rAksKbNMbmJ+5Zd6hzf6jKR8dlzDo4EfC6nAMXDrvZf6IaWZxqdiwWnd4R8BRAhn7zGjSdFZHFRG0I=
X-Gm-Message-State: AOJu0Yzgu42EqPwuPeNj/usrVSPm+bXoNd11RGXBRUn7iVWqvbnrfiHn
	OgZzbBbJbsF02DosfyoEzfh/1e2/fvr96mZkhrF6363KM9dSVUbEXNQFkO/1tDY+5E6Q3cxL7MA
	RI2Mng9yF3wJh6k4X7Tbdw0kPvVV53moFjRwtAA==
X-Google-Smtp-Source: AGHT+IF2bSuMQc4R8MCFBCOJr83VFrCimkABelAQd1QiE/nIT3+sNxsbnogNduwIzLN2Oc0WhC2CzgR9vBfGuKNzyv8=
X-Received: by 2002:a05:6102:3753:b0:476:fa5b:e826 with SMTP id
 u19-20020a056102375300b00476fa5be826mr2565038vst.4.1712131435492; Wed, 03 Apr
 2024 01:03:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 3 Apr 2024 13:33:44 +0530
Message-ID: <CA+G9fYtsoP51f-oP_Sp5MOq-Ffv8La2RztNpwvE6+R1VtFiLrw@mail.gmail.com>
Subject: include/linux/build_bug.h:78:41: error: static assertion failed:
 "struct bpf_fib_lookup size check"
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anton Protopopov <aspsk@isovalent.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, David Ahern <dsahern@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, aleksander.lobakin@intel.com
Content-Type: text/plain; charset="UTF-8"

The arm footbridge_defconfig failed with gcc-13 and gcc-8 on Linux next
starting from next-20240328..next-20240402.

arm:
  build:
    * gcc-8-footbridge_defconfig - Failed
    * gcc-13-footbridge_defconfig - Failed

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

In file included from include/linux/bitfield.h:10,
                 from arch/arm/include/asm/ptrace.h:13,
                 from arch/arm/include/asm/processor.h:14,
                 from include/linux/prefetch.h:15,
                 from arch/arm/include/asm/atomic.h:12,
                 from include/linux/atomic.h:7,
                 from net/core/filter.c:20:
include/linux/build_bug.h:78:41: error: static assertion failed:
"struct bpf_fib_lookup size check"
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                         ^~~~~~~~~~~~~~

Steps to reproduce:
------
# tuxmake --runtime podman --target-arch arm --toolchain gcc-13
--kconfig footbridge_defconfig

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240402/testrun/23264362/suite/build/test/gcc-13-footbridge_defconfig/details/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2eWtBPKv1yM8gfZJC8GkEkxN2j8/

--
Linaro LKFT
https://lkft.linaro.org
