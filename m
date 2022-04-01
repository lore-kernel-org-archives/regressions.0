Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F88ED5
	for <regressions@lists.linux.dev>; Fri,  1 Apr 2022 09:42:31 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2e68c95e0f9so27177977b3.0
        for <regressions@lists.linux.dev>; Fri, 01 Apr 2022 02:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=5bM14LmT9eRhJ5g9FBd/mcC1NH/E0MkGxXLU7hV68CA=;
        b=OVXxMgnbHKEcpL6VB56qJFQSUZRSCOC2i9d7BL1Q7GEEoTscqfHQSBl3ZRquGCios8
         TLbThyEFhwt6KQPteBuc5Jly37E3poF28saJYMuzjLbtIhX7sJyEC4B4iZle4XvssIIs
         15FrIVwkDJaEJhzxFhpve+w7VPx7CzGrhu44CPdntziGZ09s5j1VeMwce1a1jULtb0nF
         +lwPRcnJSy0CMcVgf+8D5ZkiDpUbNbY/XbnA/07jj4J5gXE6jm16g5YUU6gGosH1lc27
         0Qiu+ktdeu2xrMqLdt0Izqdm6d/JuQXry3yVSnL8j/flpt0GSFfq1gnGQCL2X29FF18F
         mp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=5bM14LmT9eRhJ5g9FBd/mcC1NH/E0MkGxXLU7hV68CA=;
        b=3OmvgOt896fRAyCT7plKW7WlfCxmlg0Y3qwknatJRDydctrYqvvmYBDVQZWt6gOmJo
         GTykpT44uAYIvsbQ2rRPQ2QrkvCNT076FB+YlH0np/UpaW2VlNssmGz1Cb1+YLIHp47N
         8hdX/GjVPxf1+/Ew37mqSvy4G8pAe4+3KSuJVLpOZdCLjvhsNuKCXirqmBG0ltKGvX5H
         4vBROKrpiedYsN/Iq82YZztdEbRqXLypEh2tiQc09VBopg5dJMuCnR0+UJrZ8dfMbGuB
         6uvPQAQvWClo4snttENBD/RoxZqM8HK0wfVQG3DtDOdr/Sz0o3CYANAPzyMgWzmptLjY
         msvw==
X-Gm-Message-State: AOAM531Odz8W3Wh/NQ4JCX2LVxEWsB3MOu2Zb2KPCiAXBHO0ab58ItSb
	NWzoTqpGCGSoMza4Iq5aSfmVRBw3Bm+mEX9biFv1jg==
X-Google-Smtp-Source: ABdhPJyuf+EdWUjGBxYG6TPeK8QDsyTYR18oa3YGHbqLeAsM7axMRB8HB5lTnzreVqQvYezbzNoPFFTJA6qYaH+Z0Ug=
X-Received: by 2002:a0d:ffc3:0:b0:2eb:2327:3361 with SMTP id
 p186-20020a0dffc3000000b002eb23273361mr1300759ywf.36.1648806150538; Fri, 01
 Apr 2022 02:42:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 1 Apr 2022 15:12:19 +0530
Message-ID: <CA+G9fYvy_98dCAtCiu_SkieKXzya28CKzOmhq0d_RcJkMYYFTw@mail.gmail.com>
Subject: [next] arm64: builds failed - stacktrace.c:(.text+0x55c): undefined
 reference to `arch_stack_walk_shadow'
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Andrey Konovalov <andreyknvl@google.com>, 
	Marco Elver <elver@google.com>, Alexander Potapenko <glider@google.com>, Will Deacon <will@kernel.org>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Peter Collingbourne <pcc@google.com>, 
	Evgenii Stepanov <eugenis@google.com>, Florian Mayer <fmayer@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

Linux next-20220401 arm64 builds failed due to below warnings / erros [1].

Regressions found on arm64:
   - arm64-gcc-11-lkftconfig-kunit
   - arm64-clang-12-lkftconfig
   - arm64-gcc-11-lkftconfig-kselftest
   - arm64-gcc-11-lkftconfig-rcutorture
   - arm64-gcc-11-lkftconfig-kasan
   - arm64-gcc-11-lkftconfig-armv8_features
   - arm64-gcc-11-lkftconfig
   - arm64-clang-13-lkftconfig
   - arm64-gcc-11-lkftconfig-perf
   - arm64-clang-14-lkftconfig
   - arm64-gcc-11-lkftconfig-debug
   - arm64-gcc-11-lkftconfig-devicetree
   - arm64-gcc-11-lkftconfig-64k_page_size
   - arm64-gcc-11-lkftconfig-debug-kmemleak
   - arm64-clang-nightly-lkftconfig
   - arm64-gcc-11-lkftconfig-libgpiod

aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
aarch64-linux-gnu-ld: Entry trampoline text too big
aarch64-linux-gnu-ld: kernel/stacktrace.o: in function
`stack_trace_save_shadow':
stacktrace.c:(.text+0x55c): undefined reference to `arch_stack_walk_shadow'
make[1]: *** [/builds/linux/Makefile:1250: vmlinux] Error 1

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: e5071887cd2296a7704dbcd10c1cedf0f11cdbd5
  git_describe: next-20220401
  kernel-config: https://builds.tuxbuild.com/27BBxWVk7aUyuYUrHdX9sgzoz3h/config

steps to reproduce:

# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
tuxmake --runtime podman --target-arch arm64 --toolchain gcc-11
--kconfig https://builds.tuxbuild.com/27BBxWVk7aUyuYUrHdX9sgzoz3h/config


--
Linaro LKFT
https://lkft.linaro.org

[1] https://builds.tuxbuild.com/27BBxWVk7aUyuYUrHdX9sgzoz3h/
