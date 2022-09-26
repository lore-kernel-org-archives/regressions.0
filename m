Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9865C3217
	for <regressions@lists.linux.dev>; Mon, 26 Sep 2022 13:27:13 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id r18so14022130eja.11
        for <regressions@lists.linux.dev>; Mon, 26 Sep 2022 06:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=u6JTozXkaxXd5dDyL6DdTZJyXx50+ggpWDL0I2wBcQU=;
        b=SsQaJIKhxrx7j/q13DR0D47KqLq3az7r7OjFmvoOBxgW4wAo+yfwgdAWxnwmIqq3xH
         NFdY8eZW3Y95qE+W1FCcsk8LqH4kRVzFclajptKCfPmhrmbWN4aShgLRSnqaefsZLbvu
         yH8CMYZT6ggl5CV/d4uyoOVJGbvBMrL5ltNLvNwyFbdMxwma+vD+uOlDzhQS7gMTApyJ
         pNWalA07zHjVmB6A7B/sj0k8M4DNc9MZwYrhGFurk7HkJ4SiO9C/sjNofByO22rpMfHm
         6qV5NYrwWpQbkcXFbOfeIKqXSPeKHu1xNN3xrdamlZBstRnI8v1EG2w6P/CkKxKidoO2
         2WdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=u6JTozXkaxXd5dDyL6DdTZJyXx50+ggpWDL0I2wBcQU=;
        b=xi8yUByjdiF+cNS3xhYCRm1DfC5J+kCpT1/dCnoQ0AcuUrNIiCe+JjzSTYU0cisOBH
         ocjBckYD/VWxg9bcfY4N+6OHdvsir1h3xcMagCQ9nMdA07mrB2dLeWp6zLfKPvrhO6Zn
         japcV88nxa8qMmXraIoS4C3BwwU+Upt3oRCLillEmdFhMfN/ctTkYhgbEOJBScMRV5Bq
         IM7snaZtQItzKRljguKUlQTumMLNFDlH+jG/5QMwM8RDKEXv/od2XSHd/hKjYMPDGVPd
         TVkZZJXdGjcR8oRM7L3V9T5vO1sXQLeiC0CvGKKH7bZY62JvQPElWEaXwnayTGTQMmlx
         r7XA==
X-Gm-Message-State: ACrzQf1zhTmgHEd9pVd67XZVZG7jAgtCEbefaMjgqvUyfutdk7CA5l5d
	J/0Eak1/kT68a9+Xipzpj1wlTLczQc8VqVnKso7K4A==
X-Google-Smtp-Source: AMsMyM4xbs6QkPMZUssp96ywiRoPnHbhhDadj6GaYovJ1TEbuwTk7ysNh+k94OuaEnPAp92gPeMRgsrCipNQb+tXFcg=
X-Received: by 2002:a17:906:fd85:b0:77b:b538:6472 with SMTP id
 xa5-20020a170906fd8500b0077bb5386472mr17913125ejb.48.1664198831674; Mon, 26
 Sep 2022 06:27:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 26 Sep 2022 18:57:00 +0530
Message-ID: <CA+G9fYvyD9OWF53ua2EZmyf+=YTx4f1mezDNkVLMxf3BKXW=_w@mail.gmail.com>
Subject: arch/arm/probes/kprobes/core.c:409:30: error: .fnstart must precede
 .save or .vsave directives
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Nathan Chancellor <nathan@kernel.org>, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"

Following build warnings / errors noticed on arm with clang-13 / 14
on Linux next-20220923.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Regressions found on arm:

   - build-clang-13-bcm2835_defconfig
   - build-clang-nightly-imx_v6_v7_defconfig
   - build-clang-nightly-orion5x_defconfig
   - build-clang-13-keystone_defconfig
   - build-clang-13-omap2plus_defconfig
   - build-clang-14-imx_v6_v7_defconfig
   - build-clang-nightly-omap2plus_defconfig
   - build-clang-nightly-multi_v5_defconfig
   - build-clang-nightly-bcm2835_defconfig
   - build-clang-13-imx_v6_v7_defconfig
   - build-clang-13-imx_v4_v5_defconfig
   - build-clang-14-imx_v4_v5_defconfig
   - build-clang-13-orion5x_defconfig
   - build-clang-14-multi_v5_defconfig-65236a87
   - build-clang-14-lkftconfig
   - build-clang-nightly-imx_v4_v5_defconfig
   - build-clang-13-multi_v5_defconfig
   - build-clang-13-lkftconfig
   - build-clang-nightly-keystone_defconfig
   - build-clang-14-multi_v5_defconfig
   - build-clang-14-orion5x_defconfig
   - build-clang-14-omap2plus_defconfig
   - build-clang-nightly-multi_v5_defconfig-65236a87
   - build-clang-14-bcm2835_defconfig
   - build-clang-14-keystone_defconfig
   - build-clang-nightly-lkftconfig

arch/arm/probes/kprobes/core.c:409:30: error: .fnstart must precede
.save or .vsave directives
                "stmdb  sp, {sp, lr, pc}        \n\t"
                                                  ^
<inline asm>:3:2: note: instantiated into assembly here
        .save   {sp, lr, pc}
        ^
/builds/linux/arch/arm/probes/kprobes/core.c:412:29: error: .fnstart
must precede .pad directive
                "stmdb  sp!, {r0 - r11}         \n\t"
                                                  ^
<inline asm>:6:2: note: instantiated into assembly here
        .pad    #52
        ^
2 errors generated.
make[5]: *** [/builds/linux/scripts/Makefile.build:250:
arch/arm/probes/kprobes/core.o] Error 1

build log:
https://builds.tuxbuild.com/2FAyD1qcTlzjIYE7mjrugjCsxu1/

--
Linaro LKFT
https://lkft.linaro.org
