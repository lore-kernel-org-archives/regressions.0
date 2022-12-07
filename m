Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4395F2102
	for <regressions@lists.linux.dev>; Wed,  7 Dec 2022 15:58:17 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id j13so8735997qka.3
        for <regressions@lists.linux.dev>; Wed, 07 Dec 2022 07:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qs0nZ1rFh/s7MTR6+29xGDMlHk1tahA90qx6nUbU6w0=;
        b=W3sB3oJvRoNx0VC2yM2FQ6Ev/+nc13R58IJFJndvG5zrSCt4KXWHdZ6zV2f5P04vwC
         coYp7i/4L0D6qBB2/mM6gC8B5Hap5ikN4lYCxc3NuIUa5HEE4oGDq26/N2dHmz2j+6xW
         xTvds0opU2zCXTeoD7kWOdDY+WZHi3NFuBZ84RxKKSv84sq/tsjhKfs3IHaizDPOd9Ps
         ZV90N1vR/8LTGEYyr62UIaXclWH/qK1088y+O21hgS7g6HBOCXlupU4IX/C1w/UMEYSB
         Na7a2jWUpQbOwmVLiE8yXlpyo/WKygc+zlp4rghG9CldbdiwoayMt8s+1pKTrPW6y9vh
         Oq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qs0nZ1rFh/s7MTR6+29xGDMlHk1tahA90qx6nUbU6w0=;
        b=XdLJvCqoXCYa4eCbz/Piy7oY/FGGlNg6Sn3dznKBX9myJf9/6CoYgVJAqBmjf8yQuz
         VBADTZr0pcjwdmnbhkXaHACb0nTKj+EnzewRxUWKf7EOQB07ol/GS+OTh+P/ZycuPdbu
         KjRQhzsxOkZSqIa4BecNaPAyeKrRrjzfSWgkD8lYgYflqoSFrm/GqJNFxf7x7HpTlr/7
         oJUo30hzcu6GhE8FIv8r5QP69QeY241YFPcQ4L1egdEJ/YKhD+mxe2Ve1Do5+nDb/8Gr
         EYhHs6rrj4pplDkU3BFeqcESdZhmRwsCCbtUlNBmWLu+FBpO9gf0POYYEr8UUd9F+814
         Tsjg==
X-Gm-Message-State: ANoB5pmBoM+kGfmIzPukptoj3DA85iqm8Z0ItSHsnseOWekABFlesQuA
	RrfKWb1i7wRasjGI0YmKUWPMceyTw1HNUxPmYHCE8A==
X-Google-Smtp-Source: AA0mqf6MVYwoYOhFT0gxk5rqGIihkNKVqwUwRwH46llz3gEgyDjhmfIbn9BLQr53oVvP6jd52Fdnrhp6onLZcC0LK/g=
X-Received: by 2002:a05:620a:cf5:b0:6fe:c37b:880e with SMTP id
 c21-20020a05620a0cf500b006fec37b880emr9851138qkj.221.1670428695952; Wed, 07
 Dec 2022 07:58:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 7 Dec 2022 21:28:04 +0530
Message-ID: <CA+G9fYv_UU+oVUbd8Mzt8FkXscenX2kikRSCZ7DPXif9i5erNg@mail.gmail.com>
Subject: next: LTP: syscalls: epoll_clt() if fd is an invalid fd expected
 EBADF: EINVAL (22)
To: open list <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, LTP List <ltp@lists.linux.it>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, 
	Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, chrubis <chrubis@suse.cz>
Content-Type: text/plain; charset="UTF-8"

LTP syscalls epoll_ctl02 is failing on Linux next master.
The reported problem is always reproducible and starts from next-20221205.

GOOD tag: next-20221202
BAD tag: next-20221205

tst_test.c:1524: TINFO: Timeout per run is 0h 05m 00s
epoll_ctl02.c:87: TPASS: epoll_clt(...) if epfd is an invalid fd : EBADF (9)
epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd does not support epoll : EPERM (1)
epoll_ctl02.c:87: TFAIL: epoll_clt(...) if fd is an invalid fd
expected EBADF: EINVAL (22)
epoll_ctl02.c:87: TPASS: epoll_clt(...) if op is not supported : EINVAL (22)
epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is the same as epfd : EINVAL (22)
epoll_ctl02.c:87: TPASS: epoll_clt(...) if events is NULL : EFAULT (14)
epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is not registered with
EPOLL_CTL_DEL : ENOENT (2)
epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is not registered with
EPOLL_CTL_MOD : ENOENT (2)
epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is already registered
with EPOLL_CTL_ADD : EEXIST (17)

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


Test results:
https://lkft.validation.linaro.org/scheduler/job/5931196#L1367
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221207/testrun/13492039/suite/ltp-syscalls/test/epoll_ctl02/log
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221205/testrun/13412113/suite/ltp-syscalls/test/epoll_ctl02/details/

Test results comparison:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221207/testrun/13492039/suite/ltp-syscalls/test/epoll_ctl02/history/

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: ee9bda616d36d2dc864aa294c2656fad88c9efa0
  git_describe: next-20221205
  kernel_version: 6.1.0-rc7
  kernel-config: https://builds.tuxbuild.com/2ITqQKvBJSwcIYKcYvEdPjjrw64/config
  build-url: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/pipelines/713047540
  artifact-location: https://builds.tuxbuild.com/2ITqQKvBJSwcIYKcYvEdPjjrw64
  toolchain: gcc-11

--
Linaro LKFT
https://lkft.linaro.org
