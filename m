Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792439949;
	b=uE/yiBsAPojmP+HKFgNSmwUZpGIKXXeSPuCfvK4rjnPBWD2h/8k0AhXf7EXlYy8qTW3J
	 4rgQKDHm0zO4ya3mlK/i2tmLID18Cg4eChnndTVEl/h6wvgDzT0PUI3paa2LLTeCdxKbP
	 39HcVK51cnK7VF8DviO/Od9Dw0TiekrJoRqaeaZv4YKexSk1kmRRpIPaUgCunK29h70ON
	 9W9NHhccNulpsBrtUaJ/jDBO80sJbe5p0Lii54yIlhSm0t3tQrNOng5qNB5MQV0HC5W7w
	 ytcogtoJu9IudZhFIreyTInOSpeVesJHYyYn8kl5K/zL+uz3qx4kVCfp/FNePkU63Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792439949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=bBJYWUvPESVGuX/lS7oqePLjhOTUHs8lrLsluP6zz08=;
	b=l4f28uFUe3ymDtBnCO6dXuL7UBxxBZCPvI9AElcy/SYHTbuJ2PFe0uF+l/eLGdqNPxmM
	 3NRzMTad0e8lTUC+elO3ImL1JLwbtjXWnWAJr+JpQSlb1O4wcAjtPcELa8GcEwhfXqLQ2
	 V0NYHxmUlUIudQcvdTrbRUalwAdFRDz3l2d3PSQd5G7OUGlg+wKNsF3E5UmyKGjJeWtoC
	 YMSJRUc5PbpnWED0iwoZSvyP+RTnd0fhtSy6LRMLO+FlQEPz8LzqsrFbtHSRpBwFkRPWn
	 i/gFMAMNdHiRIwLk7r0Tio/yJzJyTzmDnoK3biKlgx8U9A05E4Vz++s9hPmBqmpZvyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=P+ebdpX4;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D224606A31B
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 19:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D224606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=P+ebdpX4
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so4193058eec.0
        for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 12:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792439948; x=1793044748; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bBJYWUvPESVGuX/lS7oqePLjhOTUHs8lrLsluP6zz08=;
        b=P+ebdpX46Gs+qWzP05FiBKdcXriUd8A+VYl3xG8EKBcldIlwTCrDLJOF+auCWBupBA
         VmRMt090UJmDU5OG6ZhnREGdjcH6ORgwZSzjmXdlz2vVkTYHyYNjlpZB/9tNlWhRCx4N
         /LQ2UHCDX5VYckfjY0gQFszB6MX2OcdIVK0IBw1JOUwsuT9NTXeYpwWkWxYmNLecyLSi
         gnBD8T/uRTjY2QAkZVvqxXDekyO8jLkRAJBMLtmYozaqipQ1yJJ+Fn9gn7plUBgstB2Y
         LROJI+meWUdeDT81PiJK80SL8WJZvN4YB9pSlOQPTsZwLH0rFmjkKiAgGaVqTKtq5oem
         nayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792439948; x=1793044748;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBJYWUvPESVGuX/lS7oqePLjhOTUHs8lrLsluP6zz08=;
        b=DcPpwpnrl2x+eDUZnyzz6fqja+DkWq2Q5fEsHi+lhgFVwdivLBQKajEL3u4+aC4kU7
         TYWm43K7uHLCi3JrAgaPAbhMvJoetYEBJdAW1LZDQmz0arZWhP4zOXOm25U6GQysOk+h
         CAaB8XZOOWbJVFeOhrHz+EJvHNg8HvLQbe2nzKbNXBiHU50dxcreNm1KtHlc4JBqMnRx
         P7dXd3VJit5G+hLnEmAXhA/8k7VsmEsB167NHn9Iup21jDmVDWxh7ywGBXqxHXO02Kg+
         g2KjXiDrU8dYH5URhPBCe6yltMbD6hsaDY8vEN0Co0Kadj3Z1uXSY61uk7WoPLckbHqA
         brKQ==
X-Gm-Message-State: AFq9FYJh71wEseGf8YFlIdYsyTcihI531wLpuPbSGEuZExOVKCHJaPnI
	Clins5ZIRQTxlI1d3JWqJAClVXzipP+WVc5a++IBQu80I/lQGGkzImf9hYTt0kFvWgA=
X-Gm-Gg: AYBFou2yuMUY5300G6nvGQIdcHfwqqK6LMSZVPsg/TBBwWUR8vOtUP3LE06AarJFDaE
	uGauxjEi4H77cIS3sZDqSz3p0ZujdrSn7F0ZLX4ctWnvo8aP0OJGNFques3nXb4UmHj69cNZF9O
	vjrVoR3tOQUTp/pcXgq/Qe7iPIsyJFx5jaHya6zVXkFU3B1ycpR16YTfblJ8QA9Wn8Vq3pcn/Yd
	ABRDvKOdk6jlibGp7zQqwfckwNN3Tq9YqITiWjG/SC84NPf7OT/cF4XDqQMe8M1myi9A6meEcv6
	FW0I49eCd6xitfQK1EH2dwRuS6mDg6tMzOGJKOtB/lglFLQ4RJQITtrELDBN881w9URFUyp0L1G
	VHq1/V+iBI3EZBuSuAH7AoOwIJ9bJ4uO4HeiQeWjvjSuTv0T8FQMxNRKjx8Cn/T0TLdlfUGhDro
	eGev/0Y8BXsFgmahGtBnWa8iDV9mwcY6huRG0s/oMEfRCs1TGB7tXxbPGQas02kQ0=
X-Received: by 2002:a05:7301:648d:b0:35c:813a:1c81 with SMTP id 5a478bee46e88-361a234233cmr11919174eec.18.1792439947329;
        Mon, 19 Oct 2026 12:59:07 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm36043287eec.7.2026.10.19.12.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:59:06 -0700 (PDT)
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
Date: Mon, 19 Oct 2026 19:59:06 -0000
Message-ID: <179243994625.157792.5761151975328981641@kernelci.org>

New build issue found on next/master:

---
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
                 from /tmp/kci/linux/kernel/sched/build_policy.c:16:
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
Link: https://lore.kernel.org/all/179243994625.157792.5761151975328981641@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:ffbd67ed9d45c04ccbd3e5f32cf5904fb2ddb780
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  3d229ce89862b8e82d71a9e11d6f840ca272a6d6
- tags: next-20261019

# Builds where the incident occurred:

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6ad6685e55fda5076042cbe4

#regzbot introduced: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64..3d229ce89862b8e82d71a9e11d6f840ca272a6d6
#regzbot link: https://d.kernelci.org/i/maestro:ffbd67ed9d45c04ccbd3e5f32cf5904fb2ddb780

#kernelci issue maestro:ffbd67ed9d45c04ccbd3e5f32cf5904fb2ddb780

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
