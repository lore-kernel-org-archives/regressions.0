Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B42229A9
	for <regressions@lists.linux.dev>; Thu, 25 Aug 2022 10:48:55 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-11c4d7d4683so24367161fac.8
        for <regressions@lists.linux.dev>; Thu, 25 Aug 2022 03:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=8yezS67UjohYjkR2uYPnl+2W/QH+CI5jH+JmDR2etME=;
        b=cBjJDG+O1Z5ulYzna6FATto9ambYkbLRB41H+alqYu6I9gbtY3lQuyqQ88fLmttp6n
         K0ayucRoib1hlI4UOdr54fAkwV+QfkIcKVFgVUT8cqtfeDXQ50nsF/Ka1nPJIU+VitTX
         F7n6jxrVphemL6oQrdfcnaua7jgDfp7/MauuWBLEuyXZVRIfdHinou7/Fnh31EFcwD32
         3ck7JFJzLY28Oy/AVrQvvxaVlXDiicsPIg1tYT57wphUU+hyKg0ibDg3Q6qelrXJlU/V
         mLiJHmNH4r0ZUtxydUgKV1zHsngveb5INiEUsEwx9/+jn1qh39g2uBMXui/M73NUsKX7
         m4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=8yezS67UjohYjkR2uYPnl+2W/QH+CI5jH+JmDR2etME=;
        b=u5mnuLAUbqr7LAWjLV30ACHqivRoWMsivxLjSRlpIbEh/8M/nkOwbvvAKf7RFM0lxb
         5myZwnXAvqaL5WFNAH3S3qPflm4okG/kZRJa8lSovBoXMhyQqafynS8DQ0zJ6pet7j1o
         2H8glhlcdlMhybg36/4T+kqYul+4OwguZ10xFg9p6gs8VRcgtC0JeYyHYLCs1JFXvlhb
         yU+2fd3+s12qoexg8Xh8D7nEiXdpx4tEnbX26KzJHPV3dy1hn4zp7X2SN664mdG7buLf
         9D92/fQ33TBVyDuY5ZFBbSZ/CzzzE27GrZjzkruPf0j7KpEY9XU9GCYlfq0SmvObZTUD
         iiFg==
X-Gm-Message-State: ACgBeo1X357wRkqomxqVuYod3hf8hgZF8cCMp15HfuKNdfrULtDKLTqq
	QFqx6wWYOAIWMXveF6Da0+mWpU1HnGT9HbcKMEk4Jg==
X-Google-Smtp-Source: AA6agR78Trz7cKkr6hrmRkMhJNnHKdXi0bmX/cF+W43D3720j2E8BabHK1UIMZcPxUEyCAyKdJBjPmgtEwfUbHjymtk=
X-Received: by 2002:a05:6870:a18c:b0:118:5b96:1cc4 with SMTP id
 a12-20020a056870a18c00b001185b961cc4mr1599384oaf.290.1661424534425; Thu, 25
 Aug 2022 03:48:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 25 Aug 2022 16:18:43 +0530
Message-ID: <CA+G9fYvHLy63+jV3qMtHtQLufoeEpAjrteQ7+2Dvdt8CcGk9MA@mail.gmail.com>
Subject: [next] kernel/smpboot.c:435:6: error: variable 'oldstate' is used
 uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
To: Uros Bizjak <ubizjak@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org, 
	clang-built-linux <clang-built-linux@googlegroups.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, "Longpeng(Mike)" <longpeng2@huawei.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

The x86_64 and i386 clang builds failed due to these warnings / errors
on Linux next-20220825.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

kernel/smpboot.c:435:6: error: variable 'oldstate' is used
uninitialized whenever 'if' condition is true
[-Werror,-Wsometimes-uninitialized]
        if (atomic_read(&per_cpu(cpu_hotplug_state, cpu)) == CPU_DEAD)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
kernel/smpboot.c:449:6: note: uninitialized use occurs here
        if (oldstate == CPU_DEAD) {
            ^~~~~~~~
kernel/smpboot.c:435:2: note: remove the 'if' if its condition is always false
        if (atomic_read(&per_cpu(cpu_hotplug_state, cpu)) == CPU_DEAD)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
kernel/smpboot.c:428:14: note: initialize the variable 'oldstate' to
silence this warning
        int oldstate;
                    ^
                     = 0
1 error generated.
make[2]: *** [scripts/Makefile.build:250: kernel/smpboot.o] Error 1

Build link: https://builds.tuxbuild.com/2Dpvef6uVvzHMztbfQRmxJfPXZT/

Steps to reproduce:
-------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake

tuxmake --runtime podman --target-arch x86_64 --toolchain clang-14
--kconfig https://builds.tuxbuild.com/2Dpvef6uVvzHMztbfQRmxJfPXZT/config
LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
