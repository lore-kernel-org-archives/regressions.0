Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE427B
	for <regressions@lists.linux.dev>; Tue, 23 Aug 2022 10:26:56 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id y3so125178ejc.1
        for <regressions@lists.linux.dev>; Tue, 23 Aug 2022 03:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=tDoKHJNCxvovH/OdGSUDSJIA93fGME4N3+WprjnQxsw=;
        b=iy5C4EFbb1VSRZHG1k7DNq8EVOcOse15as56mgI63fVSvBtJWf0mRirwQie4lPceEn
         zBbPdZ+yNs4YcmaEuOAA0Cj/lben3WOd78Rhu7t4cTiL3FhOmC0p9FjRH/dVmPXn+SUV
         BwJ9ywyeAUI6yIGpfmqOgSQ9K6Tm6onWBTRR1Tf1XVVv7U05adHOI7u06xWRiGhOgN2k
         OagBBMGShyhXjFhrL1VL4aZBb2EmwiXNfhIakTyWquoE/eiCbCkX0B6Qob+VxSYwq1L3
         DTX2zHJvGV61RptgNj2fF/R7RhNIUSizPxuzNEcuCAVgz7ue6re1x41b6d+1oEBrJa5E
         s1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=tDoKHJNCxvovH/OdGSUDSJIA93fGME4N3+WprjnQxsw=;
        b=0fGkVVxXh91gtnhzVgx6M3VTA/OKhde//aVK5bYJsEb4FbusyRd74eOpunyv2YyZZA
         77frhy1Jag/MAGsccacqzeBhWmRMZ5uUsPjSe3/9jOZBjBBnofTSB57F+XslfEVeXD0R
         W6AzeWvGv/Tale+BQlHTByx43LLu7gzcmPaQttNiCY99kCQmSXV8Uc8wXbCSC9oSmkS3
         LQ9j0xwsZSO4MK25IVY0x7qHT6k9OvtcW4m0m3F8wZD7XwqqdKADmlKALFkBzHZoYsLp
         VHpMI6K4OqgYZjQe2QhBLiIWLxKeVk7Mjzm1kKR1ORBXwBgiU7Waek61SrjIQQaFZ2hD
         Y4yQ==
X-Gm-Message-State: ACgBeo35FJczFuV5TT3tNlSWO9YFgAf1ShUAwRCEiHAHusr6ZnjySWRK
	KfiCb6Vjqss0EC+bTCI2JzRM29Cje/MQSo0alcFYqxCOMSN4nQ==
X-Google-Smtp-Source: AA6agR7THiCEgefB2sdBBcvdIqgG2vu6qMqwFvww/Dwz6e69ZMVbaQHWEyotbW7T0Rv1YiQcTrclrQ4Eo0hJrTZ/3Nw=
X-Received: by 2002:a17:907:e8c:b0:73d:8146:9aa1 with SMTP id
 ho12-20020a1709070e8c00b0073d81469aa1mr6396366ejc.253.1661250415034; Tue, 23
 Aug 2022 03:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 23 Aug 2022 15:56:43 +0530
Message-ID: <CA+G9fYvos=FHZwtGj-fo3TEdWGnw7rZQ=+Gavn=ZA6LCC2_zJw@mail.gmail.com>
Subject: [next] arm: drivers/net/ethernet/ti/davinci_mdio.c:649: undefined
 reference to `free_mdio_bitbang'
To: open list <linux-kernel@vger.kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	Netdev <netdev@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Ravi Gunasekaran <r-gunasekaran@ti.com>, Minghao Chi <chi.minghao@zte.com.cn>, 
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	"David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"

arm builds failed on Linux next-20220823 tag for the following builds.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Regressions found on arm:
   - build-clang-nightly-keystone_defconfig
   - build-clang-13-keystone_defconfig
   - build-gcc-10-omap2plus_defconfig
   - build-gcc-8-davinci_all_defconfig
   - build-gcc-11-davinci_all_defconfig
   - build-clang-14-omap2plus_defconfig
   - build-clang-14-keystone_defconfig
   - build-gcc-10-davinci_all_defconfig
   - build-clang-14-davinci_all_defconfig
   - build-clang-11-davinci_all_defconfig
   - build-gcc-9-davinci_all_defconfig
   - build-gcc-9-omap2plus_defconfig
   - build-clang-11-omap2plus_defconfig
   - build-clang-12-davinci_all_defconfig
   - build-clang-13-davinci_all_defconfig
   - build-clang-12-keystone_defconfig
   - build-gcc-8-omap2plus_defconfig
   - build-clang-13-omap2plus_defconfig
   - build-gcc-11-omap2plus_defconfig
   - build-gcc-8-keystone_defconfig
   - build-gcc-10-keystone_defconfig
   - build-clang-nightly-omap2plus_defconfig
   - build-clang-nightly-davinci_all_defconfig
   - build-gcc-9-keystone_defconfig
   - build-gcc-11-keystone_defconfig
   - build-clang-11-keystone_defconfig
   - build-clang-12-omap2plus_defconfig


Build error:
-------------
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/davinci_mdio.o: in
function `davinci_mdio_remove':
drivers/net/ethernet/ti/davinci_mdio.c:649: undefined reference to
`free_mdio_bitbang'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/davinci_mdio.o: in
function `davinci_mdio_probe':
drivers/net/ethernet/ti/davinci_mdio.c:545: undefined reference to
`alloc_mdio_bitbang'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/davinci_mdio.o: in
function `davinci_mdiobb_read':
drivers/net/ethernet/ti/davinci_mdio.c:236: undefined reference to `mdiobb_read'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/davinci_mdio.o: in
function `davinci_mdiobb_write':
drivers/net/ethernet/ti/davinci_mdio.c:253: undefined reference to
`mdiobb_write'
make[1]: *** [Makefile:1250: vmlinux] Error 1


metadata:
---------
Build: https://builds.tuxbuild.com/2DkF0UFq3NZAwUKNFLTyWfDPqem/
config: https://builds.tuxbuild.com/2DkF0UFq3NZAwUKNFLTyWfDPqem/config
git_describe: next-20220823
git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
git_sha: 05477f3653b82d8b3bcf39d2937d9893124976db
git_short_log: 05477f3653b8 ("Add linux-next specific files for 20220823")

Steps to reproduce:
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake

# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.

tuxmake --runtime podman --target-arch arm --toolchain gcc-11
--kconfig omap2plus_defconfig


--
Linaro LKFT
https://lkft.linaro.org
