Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792439948;
	b=uzYk/zbpt4Q0OwtAW72WNCkePXvX7wxh3jgZI98pqGZVUjVcH0Oyw7ZqAQhoMC3GoWcS
	 srWRFSmSvcHbNR8XO4v5fQoiB2417JAg/zCrAzn0qoBRxwpRkTAaiE3b52bb4sNbfDZVL
	 TEob1hRd2zkki33RvsEn83V7NJGTL2hrAtOWUQOOBhBDQITjGmxZaxEjspLjHs4cd5TEn
	 +FR4z3Wr3egYUTh4wXBgzF57LuznN41MTgILK9HoN2ErIsyrdnDfFKScKD/1brqAYFDHX
	 0Ms1nXGSmFWNjOPdkqBKTRA51CCRPu2B3JKMooGmYXciTAqV21RYCcZxSq56vIbdnkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792439948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=ZK5hFEIM2dKQb+E5njV6DP8czgM9WeGNd36c+l7VLmY=;
	b=wHaquBdDWagDeQfS9JTOeGhqx6ED2bBQv5f0X7u5ZPCgUeyLdRfCoTrvBGMSzMqwHRre
	 WeBaRsUG9UnQTXmXjx7LLrxic23sX8+06YgQH+8gNqr/r3BB0eXoClrzP9EeOfWiST5Kf
	 dB5g+WtI/UcVqnfnvTRdopE5bqxsase/wN1KL8tklx9OzhsrJ0PVhxVRgrv5/cNMuMjpx
	 2fDup8yjfnH0rb4AxAJva+yhx+2kyCk6Q2tiJEomBWYnZrVXVam29bLI7dTj1XZg/EoWi
	 7SIiyGhzre5dBCKFPsa4eMOtAPO+WFDJA2IQwMQS3AwhmhkXnsV4q2M2eJmkeOWH4+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=BALH72et;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EF6606A31B
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 19:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53EF6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=BALH72et
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35f1f76ea84so4585414eec.1
        for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 12:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792439946; x=1793044746; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZK5hFEIM2dKQb+E5njV6DP8czgM9WeGNd36c+l7VLmY=;
        b=BALH72etFIdSTfl7tb/0Xs5ODm1LSZRetKXquFejcL98ADQMRWTkyH/grhX58Gq4b4
         LHlhwtcbgWkBzjwX9sjhJOVxOHaGHS/rSrLR6zeUfOJIGGJbM+2S/9hEQpwL9x1VNu8n
         gCRSrQODiIigR3MsDl9+gTp+MbF3nei7a6QzkngUMIm/OfVTI8kBtHQWgzYx0S1naC3V
         QDhPIVhV3gjxVkMVE+pzH19jcTsXv/7ZWEVfCXY9uozezI0AyJz9AdB6g/tJMUJn/kjx
         yASshdIL0JeflfckXJiN3ZeAaLzU+YRH81yLy4NjAflgm084dk27sEPJb3iqprDxEGum
         HI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792439946; x=1793044746;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZK5hFEIM2dKQb+E5njV6DP8czgM9WeGNd36c+l7VLmY=;
        b=aDeJ+/nATeSCk88+Q1jGJdLQ2KAAo+eOsVNr+pChGm2ZfLKDxUcmFtQ50+X7N0ln8G
         0I0lV3xzxIbEvtfW/DvuFs8pnkCFs1ffWFiLDSDz6JKlIhC/lDNZ7g12kgOQ45a/CP0E
         nwa9HGcj524FbkzIfKZ2JnNiI280tI8dwb/cK09EOINZLZATSTJk6Ab3/TmeLn1jEEYb
         2TCT6atJIqg/NUfsBZINhivugzv0hFYKXei1RbqeN5RjdkDGXPoZvNgda2Iux/a9rz/H
         9Zu8sCdfnASsqQXu3hFD82tP2AsrS4EmjPnQzVxbhHUYt+66oUAi1pSVtxM+fdR5zR+0
         uXpg==
X-Gm-Message-State: AFq9FYJsFAhvwShqXfBDwxkz30qWB0WoqSVGi0aDcoFLbQUiPXl6catf
	BNZzm2a3bpWhWKEZEqWDlJ7y64d0y3LhUWQef8DXylscnoBSwE2ZGmzkFiKFi7Rm5MyU9E5ylYc
	xK57A
X-Gm-Gg: AYBFou0BvhBaZgF7n1CCXpbugd18ZdfdiiREIsDUNIEXFKyqP9wUkmtHkAW2Pkc8Gxm
	+HzH6RQK1dIVRKTKKaBWF2tL8yC39ICE855f7M0zV6FV5Sxrsyxr/00hkmvRPIkRpfLxL47W8od
	rGlVD+es+qSopt6vamjYpx0TgOKIfbTPVD6C6JHHDE+stH1Cslm3OP/+8fyrFJRJ9o4UQB0hgOs
	mGeYf6NgFYon03yNgbdvbLW5tTMiQn0hwLANkBrBf105NVz1dkC5sTfGoVRys4o0yvAXeyhrtB6
	uyU/KqARo84otTwhCxWNSa9GL7bdHBATnYQAkCueXhXA6+ej054AXnHN9sC3igV5/fUf9bJHbya
	o/Wqslsx9ENRH7LzlOYCY4gZnLF9ovHlV+F2H0TzGv4YWqm5Vq2vGynwKHjHROVKnPt2NV9SKmD
	xcbsOEwWV7xoUIGYqTzrwi4F4CsL1Lcxrlk6mmdCHh9979kXBYgNwk15yN56M8jFg=
X-Received: by 2002:a05:7301:6447:b0:35c:3941:c7bd with SMTP id 5a478bee46e88-361a136ac8bmr19469007eec.19.1792439946058;
        Mon, 19 Oct 2026 12:59:06 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ab80f9sm55704415eec.12.2026.10.19.12.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?q?=5BREGRESSION=5D_next/master=3A_=28build=29/tmp/kci/linux/kernel/s?=
 =?utf-8?q?ched/ext/ext=2Ec=3A5690=3A68=3A_error=3A_=E2=80=98struct_scx=5Fd?=
 =?utf-8?q?=2E=2E=2E?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 19 Oct 2026 19:59:05 -0000
Message-ID: <179243994358.157792.10951804910694087418@kernelci.org>

New build issue found on next/master:

---
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
                 from /tmp/kci/linux/kernel/sched/build_policy.c:17:
/tmp/kci/linux/kernel/sched/ext/ext.c: In function ‘free_dsq_irq_workfn’:
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
/tmp/kci/linux/include/linux/percpu-defs.h:216:54: note: in definition of macro ‘__verify_pcpu_ptr’
  216 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
      |                                                      ^~~
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~
In file included from /tmp/kci/linux/include/linux/compiler_types.h:173,
                 from <command-line>:
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
/tmp/kci/linux/include/linux/compiler-gcc.h:34:41: note: in definition of macro ‘RELOC_HIDE’
   34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
      |                                         ^~~
/tmp/kci/linux/include/linux/percpu-defs.h:221:10: note: in expansion of macro ‘TYPEOF_UNQUAL’
  221 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
      |          ^~~~~~~~~~~~~
/tmp/kci/linux/include/linux/percpu-defs.h:230:20: note: in expansion of macro ‘PERCPU_PTR’
  230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
      |                    ^~~~~~~~~~
/tmp/kci/linux/include/linux/percpu-defs.h:235:9: note: in expansion of macro ‘SHIFT_PERCPU_PTR’
  235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
      |         ^~~~~~~~~~~~~~~~
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
/tmp/kci/linux/include/linux/compiler-gcc.h:34:41: note: in definition of macro ‘RELOC_HIDE’
   34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
      |                                         ^~~
/tmp/kci/linux/include/linux/percpu-defs.h:230:20: note: in expansion of macro ‘PERCPU_PTR’
  230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
      |                    ^~~~~~~~~~
/tmp/kci/linux/include/linux/percpu-defs.h:235:9: note: in expansion of macro ‘SHIFT_PERCPU_PTR’
  235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
      |         ^~~~~~~~~~~~~~~~
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
/tmp/kci/linux/include/linux/compiler-gcc.h:35:17: note: in definition of macro ‘RELOC_HIDE’
   35 |         (typeof(ptr)) (__ptr + (off));                                  \
      |                 ^~~
/tmp/kci/linux/include/linux/percpu-defs.h:221:10: note: in expansion of macro ‘TYPEOF_UNQUAL’
  221 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
      |          ^~~~~~~~~~~~~
/tmp/kci/linux/include/linux/percpu-defs.h:230:20: note: in expansion of macro ‘PERCPU_PTR’
  230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
      |                    ^~~~~~~~~~
/tmp/kci/linux/include/linux/percpu-defs.h:235:9: note: in expansion of macro ‘SHIFT_PERCPU_PTR’
  235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
      |         ^~~~~~~~~~~~~~~~
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
/tmp/kci/linux/include/linux/compiler-gcc.h:35:17: note: in definition of macro ‘RELOC_HIDE’
   35 |         (typeof(ptr)) (__ptr + (off));                                  \
      |                 ^~~
/tmp/kci/linux/include/linux/percpu-defs.h:230:20: note: in expansion of macro ‘PERCPU_PTR’
  230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
      |                    ^~~~~~~~~~
/tmp/kci/linux/include/linux/percpu-defs.h:235:9: note: in expansion of macro ‘SHIFT_PERCPU_PTR’
  235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
      |         ^~~~~~~~~~~~~~~~
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179243994358.157792.10951804910694087418@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:7ed368722038f8a902f4a6da878dc48b8ba88c66
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  3d229ce89862b8e82d71a9e11d6f840ca272a6d6
- tags: next-20261019

# Builds where the incident occurred:

## defconfig+allnoconfig+lab-setup+kselftest on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6ad6683855fda5076042cb1e

#regzbot introduced: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64..3d229ce89862b8e82d71a9e11d6f840ca272a6d6
#regzbot link: https://d.kernelci.org/i/maestro:7ed368722038f8a902f4a6da878dc48b8ba88c66

#kernelci issue maestro:7ed368722038f8a902f4a6da878dc48b8ba88c66

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
