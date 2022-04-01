Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38937C
	for <regressions@lists.linux.dev>; Fri,  1 Apr 2022 10:45:15 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id x20so4283719ybi.5
        for <regressions@lists.linux.dev>; Fri, 01 Apr 2022 03:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=i51t7FNJ9+QcmjhelBx4JQfcOmCqGDCu4rDYNauTwFQ=;
        b=s/cxZlHAJoTX49JQdlheeMLJvHJRA0wyYzTM5DOJGJcBUwyJO3sGo13o4iUIuhNfja
         HVWb2sU/jo2AhYm5vdUmiuZ9cl5y878cnk/BjCFJc8QwF2wAWB8ubnVCAoKzN+hyXWNM
         lER8e9GlTWB7mUs+CHHhHBG/f9RelMg3q2JCgkSqpdKUvkQiQJ87ETmkDsx9fQnDEop8
         XZyJ4SeUJ2DqRx10NDlwxxWWx3U5NZJY7dcN/Fuk0Sy65McUzQiLmd9qF1sp3zwLNmbb
         SUDO19fMXJoRgqE5h6WxJpAtc5EN+p4THqHfn7cNnsPnyx2ajXx1kQ50ehckAe0VpdJO
         4iMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=i51t7FNJ9+QcmjhelBx4JQfcOmCqGDCu4rDYNauTwFQ=;
        b=tUM7ojKIFjzmfHW6SaRIdits70xj8I818GMDPm0thZHGDQQRDpwC3aGKGXsojJdTfR
         WLz9VTX0zutnKz7SllxD7Bd86Fu00Xc//kq1/FtXL26r1a4rBUCagYvflJbEKjE2w4O1
         VjoziyVWh6vzXxYGLefHPPby93mVqKGqpIEtRE3VeEr9NXH8iHNfm2cvhbQnJYWcrrNM
         OkZQG1G8pBGa4kUEJOREL5IIh6G/gryekHJmJlv07s+tCv6OsfvkQpcFDoqRqnmmSx35
         /WkPxctgrU4H09TxtXUnezDZJPlTplUV3DALGa5e59QoBBV4U1PGFVunD/ZsH+Emtwhk
         UuLw==
X-Gm-Message-State: AOAM532Pk35dh+DlpLRKjkksJKYg8ch+6rKLoXbkovC342voWW/xp1gb
	9OcaHRzMguPlSGS1gUEWnnEqNprWv2PQFaeZZKqHUg==
X-Google-Smtp-Source: ABdhPJzScJKvsv32YQveTIXuSwMJ0TpF9+kWeSbugq5Qahkrnfk4AM2tzwPm9+OPid2JzHTis5f3aGE1u/aYrecumOA=
X-Received: by 2002:a25:548:0:b0:633:81bd:e319 with SMTP id
 69-20020a250548000000b0063381bde319mr8407972ybf.603.1648809914566; Fri, 01
 Apr 2022 03:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 1 Apr 2022 16:15:03 +0530
Message-ID: <CA+G9fYs1kL4MKs67p_yCuOH=ZXXVn5E48tRnOgtbsJ0hO2GP0g@mail.gmail.com>
Subject: [next] arm64: sdei.c:124:33: error: 'sdei_shadow_call_stack_normal_ptr'
 undeclared
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

Linux next-20220401 arm64 allmodconfig build failed due to these
warnings/errors.

git log next-20220331..next-20220401 --oneline  -- arch/arm64/kernel/sdei.c
a8c807d80cd8 arm64, scs: save scs_sp values per-cpu when switching stacks


Build log:
---------
arch/arm64/kernel/sdei.c: In function 'free_sdei_scs':
arch/arm64/kernel/sdei.c:124:33: error:
'sdei_shadow_call_stack_normal_ptr' undeclared (first use in this
function)
  124 |                 _free_sdei_scs(&sdei_shadow_call_stack_normal_ptr, cpu);
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/arm64/kernel/sdei.c:124:33: note: each undeclared identifier is
reported only once for each function it appears in
arch/arm64/kernel/sdei.c:125:33: error:
'sdei_shadow_call_stack_critical_ptr' undeclared (first use in this
function); did you mean 'sdei_stack_critical_ptr'?
  125 |
_free_sdei_scs(&sdei_shadow_call_stack_critical_ptr, cpu);
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 sdei_stack_critical_ptr
arch/arm64/kernel/sdei.c: In function 'init_sdei_scs':
arch/arm64/kernel/sdei.c:150:39: error:
'sdei_shadow_call_stack_normal_ptr' undeclared (first use in this
function)
  150 |                 err =
_init_sdei_scs(&sdei_shadow_call_stack_normal_ptr, cpu);
      |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/arm64/kernel/sdei.c:153:39: error:
'sdei_shadow_call_stack_critical_ptr' undeclared (first use in this
function); did you mean 'sdei_stack_critical_ptr'?
  153 |                 err =
_init_sdei_scs(&sdei_shadow_call_stack_critical_ptr, cpu);
      |
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                       sdei_stack_critical_ptr
make[3]: *** [scripts/Makefile.build:289: arch/arm64/kernel/sdei.o] Error 1


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: e5071887cd2296a7704dbcd10c1cedf0f11cdbd5
  git_describe: next-20220401

steps to reproduce:

# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
tuxmake --runtime podman --target-arch arm64 --toolchain gcc-11
--kconfig allmodconfig

--
Linaro LKFT
https://lkft.linaro.org
