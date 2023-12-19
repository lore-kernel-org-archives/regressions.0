Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B93F38F87
	for <regressions@lists.linux.dev>; Tue, 19 Dec 2023 19:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JZcwcRus"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-67f02843e91so35290336d6.0
        for <regressions@lists.linux.dev>; Tue, 19 Dec 2023 11:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703013595; x=1703618395; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LnafHjmcxeMmG4v0Un/lPE+edElrILb4qaOIYdOvqC0=;
        b=JZcwcRusfmaIYYNgd1pZBsQlJf3NxwNlsfpwv2zwRhajV/VXCrXoeRJVNSc0gGnxM1
         9oPcJKA4NuI3y7MBg737xN6jqV1syql1AvYo3mqIp4IDEiuQEVRXnHWbwW1HxNfn4li1
         +d0VYOM95nWfvlqVcMTyMW81J64+KuD5ILch0nEwN8bFSt0niQ+DsgOb+u++B6DbxNsI
         UyHVdi9sR5eeanPL07xPbYVsHWTMhfuYF/NcE2DCNghThFqdz2rI+Iynkeey5l0D+ynT
         liXNTyJ1EbKdgKUd4t5LIweYY4QgazAjr5KrusFrGzJgjgkop5EIkMMhONb3aZmf24gZ
         suZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703013595; x=1703618395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnafHjmcxeMmG4v0Un/lPE+edElrILb4qaOIYdOvqC0=;
        b=d+Jc8mQPfFf1XGoGxQ8gMo2zsyBPNx8+sbAQXvx8/wkHPE9LcF2Uox7zOWf4uR9t8B
         EpecpbC0iqSnP1fqBJ+6rub/ZHe4Hsj6f4Y+jmnuvBFvbYcK0HmYNNheWJqBWUAlqmUw
         QdIMfQDiu59BL/pBP0vwhRw1MBjbn2ZEjBstCNNK3LJDHajRRf0uK23ckVCSuMQzYWpH
         0hTwUa3TUif0uOmwjh07tuw3b7+YaoApztgi2ULm8MJ+HNFwBvlyDKPfUm34JfK4CkNC
         VQT6Xy2lHmMo7Oaim7r8UYQqogu35eg3spKdou9r7qGWsu5AQVOi610rYZuC5WNKJ598
         tMXA==
X-Gm-Message-State: AOJu0YwW86Y4TMUKL88yL/PuJf9v5EJ50zLL4AM4sT52zgj6MxfmmVYC
	JUFZUWoaNBaYol6Ov4DdXj6TGoaxA+dk0WjSDogvOk/CLZU+siqZmWQ=
X-Google-Smtp-Source: AGHT+IHEN06gZQhvx9hx2X1q6gsFT3zElEgtRsulmJDIP/auIfG6UAQpQWNnJC4AUrtoxYpTG8Ui/j4C6aM++7oLyJs=
X-Received: by 2002:ad4:5d47:0:b0:67f:1883:7873 with SMTP id
 jk7-20020ad45d47000000b0067f18837873mr14247936qvb.93.1703013595078; Tue, 19
 Dec 2023 11:19:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvq+wdDhTjR2YkULF-_-nQNPGzCeOON-08EbVyidj-J6w@mail.gmail.com>
In-Reply-To: <CA+G9fYvq+wdDhTjR2YkULF-_-nQNPGzCeOON-08EbVyidj-J6w@mail.gmail.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 19 Dec 2023 20:19:43 +0100
Message-ID: <CADYN=9+0stxkNLkqcbodZD879r8DACT1M-3QyZrt4JsrAi0E1Q@mail.gmail.com>
Subject: Re: arch/parisc/mm/init.c:534:29: error: invalid application of
 'sizeof' to incomplete type 'struct shmid64_ds'
To: Naresh Kamboju <naresh.kamboju@linaro.org>, kent.overstreet@linux.dev
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-parisc <linux-parisc@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Dec 2023 at 16:02, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Following build failures noticed on parisc on Linux next-20231219 tag.
>
> parisc:
>   build:
>     * gcc-11-defconfig - Failed
>     * gcc-11-allnoconfig - Failed
>     * gcc-11-tinyconfig - Failed
>
> Build error:
> arch/parisc/mm/init.c: In function 'mem_init':
> arch/parisc/mm/init.c:534:29: error: invalid application of 'sizeof'
> to incomplete type 'struct shmid64_ds'
>   534 |         BUILD_BUG_ON(sizeof(struct shmid64_ds) != 104);
>       |                             ^~~~~~
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Steps to reproduce:
>
>  tuxmake --runtime podman --target-arch parisc --toolchain gcc-11
> --kconfig defconfig

A bisection showed this patch as the faulty 1e462c05f65b ("shm: Slim
down dependencies")
Revering this patch made it build.

$ git bisect start next-20231219 next/stable && git bisect run tuxmake
--runtime podman --target-arch parisc --toolchain gcc-11 --kconfig
tinyconfig

Biseclog:
# bad: [aa4db8324c4d0e67aa4670356df4e9fae14b4d37] Add linux-next
specific files for 20231219
# good: [2cf4f94d8e8646803f8fb0facf134b0cd7fb691a] Merge tag
'scsi-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
git bisect start 'next-20231219' 'next/stable'
# good: [0762a5de2bd30a12821e519cbe722df9914da98a] Merge branch 'main'
of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
git bisect good 0762a5de2bd30a12821e519cbe722df9914da98a
# good: [19ac9eb1d925e26d8828f8ab1525696bad1b54c3] Merge branch 'next'
of git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
git bisect good 19ac9eb1d925e26d8828f8ab1525696bad1b54c3
# good: [bf9602022c6726f0f8f888ba244d408661be5337] Merge branch
'char-misc-next' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
git bisect good bf9602022c6726f0f8f888ba244d408661be5337
# good: [9c6484cc7a133a7c54b8a1e195ec9083489e485b] Merge branch
'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
git bisect good 9c6484cc7a133a7c54b8a1e195ec9083489e485b
# good: [b3f7f46b85e7c1339cf2e55f1061a666147ccfe6] Merge branch
'rtc-next' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git
git bisect good b3f7f46b85e7c1339cf2e55f1061a666147ccfe6
# good: [db2aea8e313f69f90beadbba97f400fe255168d4] Merge branch
'bitmap-for-next' of https://github.com/norov/linux.git
git bisect good db2aea8e313f69f90beadbba97f400fe255168d4
# good: [14a3e64715ea0a5853dd6a6876737c845f8aafb0] Merge branch
'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
git bisect good 14a3e64715ea0a5853dd6a6876737c845f8aafb0
# good: [b5759b6b16cb2b34e909d74f7b7f0b9e9a7590a9] rslib: kill bogus
dependency on list.h
git bisect good b5759b6b16cb2b34e909d74f7b7f0b9e9a7590a9
# bad: [f0a0cf5525892479795a5d1e1b81115a12915dee] seccomp: Split out
seccomp_types.h
git bisect bad f0a0cf5525892479795a5d1e1b81115a12915dee
# bad: [ea42bc1b4b8f04b8467e38f3e44e71cce372f1ab] ipc: Kill bogus
dependency on spinlock.h
git bisect bad ea42bc1b4b8f04b8467e38f3e44e71cce372f1ab
# good: [cd862cb689a09e55debd107df26744027a5fff8b] timers: Split out
timer_types.h
git bisect good cd862cb689a09e55debd107df26744027a5fff8b
# bad: [1e462c05f65b452f0e2e996ec97484dba9e95358] shm: Slim down dependencies
git bisect bad 1e462c05f65b452f0e2e996ec97484dba9e95358
# good: [840b9d9bfcfdc5ca12ce1af35a3ea10f05fda799] workqueue: Split
out workqueue_types.h
git bisect good 840b9d9bfcfdc5ca12ce1af35a3ea10f05fda799
# first bad commit: [1e462c05f65b452f0e2e996ec97484dba9e95358] shm:
Slim down dependencies


Cheers,
Anders

>
>
>
> Links:
> - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231219/testrun/21768759/suite/build/test/gcc-11-defconfig/log
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231219/testrun/21768759/suite/build/tests/
>
>
>
> --
> Linaro LKFT
> https://lkft.linaro.org
