Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792439951;
	b=q8wofVEqqiVWEQTpW6oLs6/Ev8ivqOiBDrbg5UAPETpfXkCNoWOsp6jkI2nPC3g2Xlb4
	 pPyqrgbg7J78V9pliDZT4QaQlIWdXCHGUUj22HPClTHPljTXRKF04ZZ1Yryr2dszBGs7o
	 egA/+RwScPaJqLIue4HNDXFp+15i/rei1MewrUIpUmHw1q5NGxXg2RDqxoNZuEYqiZnbP
	 bOhW26nDnVQNfJsDnjtYHGHIZE+E8exTi5W4Ldqwq7xqMU0VnQFo6Z5lAcRLk04EVdzce
	 qpqfmNs5Q6noJYmjGn9voZl/4EIo/AWqBY003fuhiDhbVpDw3eNyYwZmy3ToKAJbhjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792439951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=NAZJsKWtcIwD0Z2t17dZ8Bj3h4xKz9TEQCr7wm06Y4A=;
	b=u58yDSkMCQMHm8Gfm3eWQzRPH5AI1NYKiO+hWUp0iSLGjoFxF8U/gi/FEjLoiqBj9y36
	 nNt13f0PF91gcIgoXV80YZT5pJyaNVWlSzp7amCxWygfVzcn1Jw8qWHRTs/+x0X2bcpYv
	 OsRAtOLE5pINTVFBZS5I3qagfvHAcuTKsmnYO3XSVnOBRiULc26vCVt8sNqN64ZdACuvU
	 XiHhNrglXBnd+o+FJtkKBP4u/Mmou9wnOFspFNNRLmG4t6qKOG/XNoYi5FpJGkuUzOI/H
	 E0bHr23aPs1oKyHzIETvk4lmnDTVecZW8fbDrz17QA1KA9TqNrl/qNrohLGoavSUR0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=hDPevz7j;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87746606A31E
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 19:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87746606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=hDPevz7j
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-354ba08cfd1so4571476eec.1
        for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 12:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792439950; x=1793044750; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NAZJsKWtcIwD0Z2t17dZ8Bj3h4xKz9TEQCr7wm06Y4A=;
        b=hDPevz7jtYNDtpqM1r4KGl53zAj6QyGjVmEISu00VThk0i3CGQl22afZeP0kjy9pCm
         5PjUMJyDufVotoJjqv6kVXtO1bcPC6QRh4R1H7Sad3BCu++ew7bCMCkQqYR+FY5RFeCa
         Z/18YVQ+aft8ozmhKLnWBpVv7mHq/PMyVE9XE877DDJ727kGmhAZmPLQuzGfkPBn0tjN
         8ACnVIZalRgo4ahBI0+wVE/hEeU8G9iO5+lUkPWMS4ODiI2/6uIAGiK/BPBg7KXrKHo+
         PSdOynOJPsqHVLcme86JIxflQj4+l91hdeYEr1tTlSFyP6kOHakg91zYg3b5WFnRy77T
         1kJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792439950; x=1793044750;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NAZJsKWtcIwD0Z2t17dZ8Bj3h4xKz9TEQCr7wm06Y4A=;
        b=OBKeyV4mxN463EH6jHroV2TLmskDvH87xQJrbuq+mELmbjLVocEVVzj4bhcNDaCQWE
         +GM6Tz9yiBxVcIHm2CjKyhn7jaAAaokIpNzYbZ2aZzaG9MRRDZnEUmZJzp5qXhbDC7hO
         Ir1NbmdKrGVIJD22MBWvdp0YkipP9Y3WTxttgbNjrDwFzr1hk+Q7P0TB+WP63TtK88f1
         iTUf6xyWtstJ+oSlZT+ZVHYK+iXkPkLawSlqxfaYNFKVrZUN7KV5LjZppk8q34KnfScJ
         nVcKT4/X01rgCugPUrVPZR3m/R8eyMKX6sYS9APZykMbhISuUr+bpTD0+VuBxkKlhvdx
         EYCQ==
X-Gm-Message-State: AFq9FYJIFtiHjecurkZm2yQi9VCEC7MtEqS4jl999heFJ2kv3l6Z424d
	q955XpzhjFACfb4zHdH3S7DF9/CqK1W/JXjwPcIDLZpqp8x+Ng5tjN9eiudDC8DG9dTkWyW0OUW
	29iwp
X-Gm-Gg: AYBFou3H0cCQF62BgHj0boF0HiKltE0hAbYUSqofqmiE1wauNEaT24Z2xL35k7DuRte
	KKr23NFm4SAgkEGoj+ad4fTT4dS5PBkjGBnaXk6aaXeHE9Kd8LXUsWIDH+XvRHoL97duv72FxVK
	+aaJTNB96l3tjHAb86wsDmgz7ceGOOEa9bg32k/ynhFlduDXUbmJ3U5Dhb4xH0eY0MQqr9O77SE
	zP9rm9Z+qQrQe8b06BfVLwZTWXfcTdM4rp8/RR0OJztLCt3sbdktvshLxTy8iX1dwVO+dSbMx8C
	bg8DAHnAaWEpvYfP60mt1vJL8jMX9FVN4f0IrzvYUtGqMnnsP1oLbdbz6ukB7qMu00vi+Aa5Mxp
	vw8R5KFwSHbpuJN2AuBxGx/9O6TBsEzMOnYQjtvps9PoPQk5sScsButk8FclYaemq8hJ8atmUou
	HO4I/oLmvi2DqikUhJ2pdfma7+qZUlvJ3VmHfADIDUFFFsU11tcSe6gyXekkphkIA=
X-Received: by 2002:a05:7022:1583:b0:158:b51c:4502 with SMTP id a92af1059eb24-18512f1ee00mr12977891c88.34.1792439950246;
        Mon, 19 Oct 2026 12:59:10 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm42397844c88.16.2026.10.19.12.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:59:09 -0700 (PDT)
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
 =?utf-8?b?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpa2VybmVsL3NjaGVkL2V4?=
 =?utf-8?b?dC9leHQuYzo1NjkwOjY4OiBlcnJvcjog4oCYc3RydWN0IHNjeF9kaXNwYXRjaF9x?=
 =?utf-8?b?4oCZIGhhcyAuLi4=?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 19 Oct 2026 19:59:09 -0000
Message-ID: <179243994891.157792.7812879229965993143@kernelci.org>

New build issue found on next/master:

---
kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
                 from kernel/sched/build_policy.c:16:
kernel/sched/ext/ext.c: In function ‘free_dsq_irq_workfn’:
kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
./include/linux/percpu-defs.h:216:54: note: in definition of macro ‘__verify_pcpu_ptr’
  216 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
      |                                                      ^~~
kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~
In file included from ././include/linux/compiler_types.h:173,
                 from <command-line>:
kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
./include/linux/compiler-gcc.h:34:41: note: in definition of macro ‘RELOC_HIDE’
   34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
      |                                         ^~~
./include/linux/percpu-defs.h:221:10: note: in expansion of macro ‘TYPEOF_UNQUAL’
  221 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
      |          ^~~~~~~~~~~~~
./include/linux/percpu-defs.h:230:20: note: in expansion of macro ‘PERCPU_PTR’
  230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
      |                    ^~~~~~~~~~
./include/linux/percpu-defs.h:235:9: note: in expansion of macro ‘SHIFT_PERCPU_PTR’
  235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
      |         ^~~~~~~~~~~~~~~~
kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~
kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
./include/linux/compiler-gcc.h:34:41: note: in definition of macro ‘RELOC_HIDE’
   34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
      |                                         ^~~
./include/linux/percpu-defs.h:230:20: note: in expansion of macro ‘PERCPU_PTR’
  230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
      |                    ^~~~~~~~~~
./include/linux/percpu-defs.h:235:9: note: in expansion of macro ‘SHIFT_PERCPU_PTR’
  235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
      |         ^~~~~~~~~~~~~~~~
kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~
kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
./include/linux/compiler-gcc.h:35:17: note: in definition of macro ‘RELOC_HIDE’
   35 |         (typeof(ptr)) (__ptr + (off));                                  \
      |                 ^~~
./include/linux/percpu-defs.h:221:10: note: in expansion of macro ‘TYPEOF_UNQUAL’
  221 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
      |          ^~~~~~~~~~~~~
./include/linux/percpu-defs.h:230:20: note: in expansion of macro ‘PERCPU_PTR’
  230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
      |                    ^~~~~~~~~~
./include/linux/percpu-defs.h:235:9: note: in expansion of macro ‘SHIFT_PERCPU_PTR’
  235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
      |         ^~~~~~~~~~~~~~~~
kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~
kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
./include/linux/compiler-gcc.h:35:17: note: in definition of macro ‘RELOC_HIDE’
   35 |         (typeof(ptr)) (__ptr + (off));                                  \
      |                 ^~~
./include/linux/percpu-defs.h:230:20: note: in expansion of macro ‘PERCPU_PTR’
  230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
      |                    ^~~~~~~~~~
./include/linux/percpu-defs.h:235:9: note: in expansion of macro ‘SHIFT_PERCPU_PTR’
  235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
      |         ^~~~~~~~~~~~~~~~
kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~
  CC      fs/notify/group.o
  CC      crypto/krb5/rfc3961_simplified.o
  CC      security/landlock/audit.o
  CC      fs/notify/mark.o
  CC      mm/madvise.o
  CC      security/integrity/ima/ima_queue_keys.o

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179243994891.157792.7812879229965993143@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:0b3c665aa5978c471800ab879201d48f07e28d7b
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  3d229ce89862b8e82d71a9e11d6f840ca272a6d6
- tags: next-20261019

# Builds where the incident occurred:

## i386_defconfig+kselftest on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-i386-kselftest-6ad6684855fda5076042cb7d/.config
- dashboard: https://d.kernelci.org/build/maestro:6ad6684855fda5076042cb7d

#regzbot introduced: d419d682257d813f6cb7a28e42b35d0edf4ad038..3d229ce89862b8e82d71a9e11d6f840ca272a6d6
#regzbot link: https://d.kernelci.org/i/maestro:0b3c665aa5978c471800ab879201d48f07e28d7b

#kernelci issue maestro:0b3c665aa5978c471800ab879201d48f07e28d7b

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
