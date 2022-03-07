Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB55E3B53
	for <regressions@lists.linux.dev>; Mon,  7 Mar 2022 16:15:51 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id h126so32030463ybc.1
        for <regressions@lists.linux.dev>; Mon, 07 Mar 2022 08:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=spwDtQzqov6xdiTHgUF8tLqNnixH1cAZ4fX4lvN00K8=;
        b=YMW8qBaid5dvLq5OwhT4QKS7JaLl4pwVUvKdJuM8oLuDEXzs3Ja8XsVC3LmRUmBA5L
         XixXz1apmC69SdQdg75afaQvgrXvXW64tVEJE5rDIYGcxaOVtrvwz0HQt4nz2ryVBjkf
         MOh+u6+W3QpVSxVH7Fb4G6NuD6XAdUgrVqJVd62a1C08QYUvmofdAEtD5Bw5B03qWrI8
         Of3ezMFve7k3YnARANbLVma/aTo2XxuRycQye7xkXZ4QTGluJ535teRfPWinMlZnqdC4
         cA5Slvdh63OrJGgvgBiOW4qBq+SI96rqP8i1S1ZUI1jiQxPRBPr95ecXkcP0egXFjSlJ
         mdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=spwDtQzqov6xdiTHgUF8tLqNnixH1cAZ4fX4lvN00K8=;
        b=0t8J3IKRxomvRFbCkKayv0aOMQMwLSM6sOyurt0NX6fINixf/a5C9mPjnuYovUXVYJ
         yFtshBCVbCqBnjOjpqRLicblGev3SxFn8xVVVHMA+LQRfBpoiaU5mPcEa/C4aGgjXdtX
         Ze3ZxTOLmLksNDRk2HQ5CJIo5nKmqxDg8XmShTPR4hEWL6IYE51l9yu+z4czS3rwp6Fy
         68KsAUln0Bxi9YqjVDhCBaXSanQY7sQ2x2G85iU6uvmfu5euKVve/3D5X1KskHnP+NKA
         SCVdgfaK1MMyL1vnf5maWYfBWweZy372lxTY6Jk3BAa4NKYOrhmGIjGiWflt1ugRKdpy
         IwXg==
X-Gm-Message-State: AOAM531Ae81AKAW0snq8E/d1ZPoWpBpM7MhNpBfsC/GWAWv84ufAj3fY
	QdJsJrmtaWYKjbPYO3NXC8vnery0KbPDjYtbC4rrQg==
X-Google-Smtp-Source: ABdhPJyH6OsbVtlkeAFYfqwo3AyM1XU37cjXeL8SCsyz/DMGLrisARoYY0Yp87mAHDLeNTkaC2kjPxReAEeFJoT+7eM=
X-Received: by 2002:a25:5090:0:b0:628:b76b:b9d3 with SMTP id
 e138-20020a255090000000b00628b76bb9d3mr8777009ybb.128.1646669750789; Mon, 07
 Mar 2022 08:15:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 7 Mar 2022 21:45:38 +0530
Message-ID: <CA+G9fYvPdufo6c3MgPjAMBrkTqoLDO+2LN1PV3V8rTsqN5XSFg@mail.gmail.com>
Subject: [next] mips: madvise.c:55:7: error: 'MADV_DONTNEED_LOCKED' undeclared
To: open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, 
	Michal Hocko <mhocko@suse.com>, Mike Kravetz <mike.kravetz@oracle.com>, 
	Shakeel Butt <shakeelb@google.com>, Vlastimil Babka <vbabka@suse.cz>, Nadav Amit <nadav.amit@gmail.com>, 
	David Hildenbrand <david@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Johannes Weiner <hannes@cmpxchg.org>
Content-Type: text/plain; charset="UTF-8"

Following build regressions errors/warnings noticed on mips architecture on
linux next-20220307 build.

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=mips
CROSS_COMPILE=mips-linux-gnu- 'CC=sccache mips-linux-gnu-gcc'
'HOSTCC=sccache gcc'

mm/madvise.c: In function 'madvise_need_mmap_write':
mm/madvise.c:55:7: error: 'MADV_DONTNEED_LOCKED' undeclared (first use
in this function); did you mean 'MADV_DONTNEED'?
   55 |  case MADV_DONTNEED_LOCKED:
      |       ^~~~~~~~~~~~~~~~~~~~
      |       MADV_DONTNEED
mm/madvise.c:55:7: note: each undeclared identifier is reported only
once for each function it appears in
mm/madvise.c: In function 'madvise_dontneed_free_valid_vma':
mm/madvise.c:789:19: error: 'MADV_DONTNEED_LOCKED' undeclared (first
use in this function); did you mean 'MADV_DONTNEED'?
  789 |   if (behavior != MADV_DONTNEED_LOCKED)
      |                   ^~~~~~~~~~~~~~~~~~~~
      |                   MADV_DONTNEED
mm/madvise.c: In function 'madvise_dontneed_free':
mm/madvise.c:859:47: error: 'MADV_DONTNEED_LOCKED' undeclared (first
use in this function); did you mean 'MADV_DONTNEED'?
  859 |  if (behavior == MADV_DONTNEED || behavior == MADV_DONTNEED_LOCKED)
      |                                               ^~~~~~~~~~~~~~~~~~~~
      |                                               MADV_DONTNEED
mm/madvise.c: In function 'madvise_vma_behavior':
mm/madvise.c:998:7: error: 'MADV_DONTNEED_LOCKED' undeclared (first
use in this function); did you mean 'MADV_DONTNEED'?
  998 |  case MADV_DONTNEED_LOCKED:
      |       ^~~~~~~~~~~~~~~~~~~~
      |       MADV_DONTNEED
mm/madvise.c: In function 'madvise_behavior_valid':
mm/madvise.c:1129:7: error: 'MADV_DONTNEED_LOCKED' undeclared (first
use in this function); did you mean 'MADV_DONTNEED'?
 1129 |  case MADV_DONTNEED_LOCKED:
      |       ^~~~~~~~~~~~~~~~~~~~
      |       MADV_DONTNEED
mm/madvise.c: In function 'madvise_dontneed_free':
mm/madvise.c:865:1: error: control reaches end of non-void function
[-Werror=return-type]
  865 | }
      | ^
cc1: some warnings being treated as errors


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

steps to reproduce:
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake

tuxmake --runtime podman --target-arch mips --toolchain gcc-10
--kconfig rt305x_defconfig


Build log [1].

--
Linaro LKFT
https://lkft.linaro.org

[1] https://builds.tuxbuild.com/2639g1Qugd13m3pgWwKp4I34Cb1/
