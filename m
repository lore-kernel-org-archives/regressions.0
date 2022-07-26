Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180007E0
	for <regressions@lists.linux.dev>; Tue, 26 Jul 2022 06:58:41 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id f15so8154295edc.4
        for <regressions@lists.linux.dev>; Mon, 25 Jul 2022 23:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=VO93DLDSyuiE5m/h3CZQjoxqN5ZUewPL97M2fFnH/Ms=;
        b=xxDn2/5x1eOM3bJXBPJHTeh/x6nTyx4S7ffCNaq1gtDhyu/yl8+ARXDntYn5WK8nim
         Pb0wIGNCiktlQg7lpbUJGPCSIPnaZtTr3JxL/aMrfS7eUPsxD8Dns23byMqhme8SvZq6
         qvpI+EaYVEZJ5mZesrko8p1c7G+yqwT6D3EvrtQdD6wgIT7s1p0iV0MVeRbgYVpkY6vN
         FBtTxHvbDS0eh/ZGmzKi3s88hAj+8DmpOuvconLElTRiF6UclozLDBNDYTudFeET85H+
         igNVpA6fnDiZY3+91tO5yBBso5q9ajnoJs01C8gzRKaftG4iS4c2E8SVZXhIiYUVcBQy
         ZSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=VO93DLDSyuiE5m/h3CZQjoxqN5ZUewPL97M2fFnH/Ms=;
        b=XaiXCWzpxMK2IkwqPR7Pe/X4a57pLzCGByGXZGYW0GBU1DmKYNyaRUwfTyUW0K5sgH
         sMwfpfsQKMV9m2NtKlRehXLCEFyYUylGNsFNt3orbvhkhdVaDdikhEl45eGoO+h+X9VO
         OOmD+JMXSdRdCnN22cn08AolWcJe1xPn5LhyqABxjl80gFFPgqNvDKB7EzDFNYp8uPJe
         Od/kLeK416x8GJBCHDRSMLcT1LgB6mWwS0IRJiaGlkldWiFmpm5gJZTPsBJKUtY0U60x
         UQb+37oehytfiwQnOlKl8aeWd3PU81nDhmBAA73jN054yq4uumhEbL+nh8N4Uf/tTRmK
         I+0Q==
X-Gm-Message-State: AJIora/QRbZMDG+zjiXZ+fBi6Fy1pE2vx28vqfyo8WDBXvufhKMUekrj
	PzbJ8oCN74X6wqbP6Ecb3UKUhxHNJnIdwMt5/DRJKQ==
X-Google-Smtp-Source: AGRyM1sHcB8im8ckzbaXWEnk89N66dulZhudukS3hn368DoQg0apkNatvAJ3/pqjz/MO7qPI7bcFw5PaHE/jpF0/zuc=
X-Received: by 2002:a05:6402:caa:b0:43b:c350:18c7 with SMTP id
 cn10-20020a0564020caa00b0043bc35018c7mr16973239edb.193.1658818720183; Mon, 25
 Jul 2022 23:58:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 26 Jul 2022 12:28:29 +0530
Message-ID: <CA+G9fYuH+Jo3xFypJc8+F6juT783StO=oe0P9ZMMLE7nM0bQJg@mail.gmail.com>
Subject: [next] clang: drivers/gpu/drm/i915/gt/intel_region_lmem.c:94:23:
 error: result of comparison of constant 4294967296 with expression of type
 'resource_size_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org, 
	clang-built-linux <clang-built-linux@googlegroups.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The Linux next-20220725 i386 clang builds failed due this build error,

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Regressions found on i386:

   - build-clang-11-defconfig
   - build-clang-14-lkftconfig
   - build-clang-13-defconfig
   - build-clang-12-defconfig
   - build-clang-13-lkftconfig
   - build-clang-12-lkftconfig
   - build-clang-14-defconfig

Steps to reproduce:
-------------------
tuxmake --runtime podman \
        --target-arch i386 \
        --toolchain clang-14 \
        --kconfig
https://builds.tuxbuild.com/2CQwgxqR0lJKwPMl2LxaDTNwsq0/config \
          LLVM=1 \
          LLVM_IAS=1

Build error log:
-----------------
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
ARCH=i386 CROSS_COMPILE=i686-linux-gnu- 'HOSTCC=sccache clang'
'CC=sccache clang'
drivers/gpu/drm/i915/gt/intel_region_lmem.c:94:23: error: result of
comparison of constant 4294967296 with expression of type
'resource_size_t' (aka 'unsigned int') is always false
[-Werror,-Wtautological-constant-out-of-range-compare]
                    root_res->start > 0x100000000ull)
                    ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
1 error generated.
make[5]: *** [scripts/Makefile.build:250:
drivers/gpu/drm/i915/gt/intel_region_lmem.o] Error 1
make[5]: Target '__build' not remade because of errors.


Build link:
https://builds.tuxbuild.com/2CQwgxqR0lJKwPMl2LxaDTNwsq0/


--
Linaro LKFT
https://lkft.linaro.org
