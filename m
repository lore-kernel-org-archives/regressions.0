Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792439950;
	b=TCFLtvup1sQxxYzuu5FyIaRNELuVx38gkl3NBOOR6Y+DNBGkcNd/GOPJqFA+Ud5AeQCD
	 NQ4Vfm8R9Fap9dktZ6ASP7beUFhC+wSb1dlNOtYZN58uX1U/XUP51vxmq9ejFKhiseIcR
	 QKa9G+VLnnCP7aP2nB/b0bfYxIcga5b2866O7aZ4C1wQdqFCIrPEpjV3enAFHXKNIwUV1
	 HisW28qAqG50XCC1ZCFLk6MyG6IrjMeWUeRkKlc1hhe0CzktMR38xXA93vI7QyjqVihGe
	 jC04958Qctg8v+oAMAAdm8CpDDazSTXzF/nBP9meMI55Ym6W7kJzul7rcHcdVTKQaIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792439950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=Jwei/uvf54LUzn/YXRsen7eqj10kqMQunhk+FQ1OGJY=;
	b=LTz6Jd8a5HMmMzaqhbmOZ+5inwg1SVxqia9khFGC8/ZdWF1TSB6WeJQFm1F7smd0HBwr
	 KXnRtV/ZFKrGXkaXLrLxn4w9KsEft8Kx4NFZBKQDH9z+bjvJlOnpi/0LPZVD7irxeNEa3
	 Zaahe8ROCivTJgdcxTD2F2zEmfH64Uyq7e3eIDPLfZbUgR/KB6mpVPpHtAoAZMu6Nes3T
	 Yl+Yc/xHhH9zz+FfD24omDHgdaMWfHvGelu3t1dHDekMNypGwDdI5l3gFj/VMYetOAoVN
	 Jp+V1+V63J63F//nQZi8G4Wq9JGON4K6W+dFGdloWbEQmmZbDv7g81jB+wGZRI+azvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=VW9m2G+v;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA483606A326
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 19:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA483606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=VW9m2G+v
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1027057eec.0
        for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 12:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792439949; x=1793044749; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jwei/uvf54LUzn/YXRsen7eqj10kqMQunhk+FQ1OGJY=;
        b=VW9m2G+vMP4sc1WXBWS+iOek/RylTEwSpIJ/yExYsx2K35fHB2d5Ctv7Ab2D+zwysU
         e3DZaZAbjdmfB8Z4W3y+qbma+4vQgKC+8khm+WUXzaGrN3lKLRSiZ9Fgu71lTk3t2Hht
         sDxdEPRnOuIK23DQmdFlp5ZLONcKFUfT3k/fHHeVtUfo4d5uO/nkr45RGBpRSz7BjQrf
         2K67kM0ADuiKKiyb5APWQ8q7EG9Ron9EomYw8s4U6vqMKqjHpJe51/QmKwrhxb2+7/8b
         COgk/KDldSx72u9GW5fBT57hlnTj9xEkzVIlt2LZaXmXm0ewOGhDg0lRBBZmsNVB5wU7
         QheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792439949; x=1793044749;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jwei/uvf54LUzn/YXRsen7eqj10kqMQunhk+FQ1OGJY=;
        b=Jb740V7y7/jBW1WwGsKJHo1PU7nCaGmJIVbZm792k14+Kkx/JsZcJlCVPIvAl/6E0+
         cgDvC2gapTYTTRHQR3V3/j2BbEbxsUCCSGvwLVjcgHHBG7eTr3fUdqsUNQjPRu+NNmtI
         0wyFEmYCnnWstlLDBbVOuVPZkTg3p/psAkVi+0bvDzgc42a23LKZYusI/GCchl+N65XY
         q2JjGUcT5aNd1IiIyjdXoIxKFCJz6U7ZefwZ8suEATCsd50m2J4kei0oQjeOR7KTnHZ/
         oGtaaguIaktwj7dx2P+LuutN/vBb3x0jSee+eR/qKZMmc+8f5MY9t6dQKhsHgvjRItnX
         dVOQ==
X-Gm-Message-State: AFq9FYJKCwVswFu8VYZaxik5Y63/2Jj1WAy6nuyH8n60UW6Y7N5zAHiA
	zayLmbRWG+ptQevLn9uj7wD5jvuLDWB47QN27qYQOt0Pzo7mJXQwWljOKsj/VCb49WiVh8v3UXW
	XS+UB
X-Gm-Gg: AYBFou1BcHrEvvC7wWNBBCULuZbJHKE2kCHqDEFSPX+l0mU2UIgPwIxSPmH2GNy27Cl
	f6qDCNJLGLd3F2oQN6oFw8StpzFGNrYHC7QfFJidDoBTufRnvoM4GzrpLd+qXvEXN87vKbVQF6I
	dtNQHUzv5JobcK+56srX2B6oMlS7OCb4KyJDfNGSp3O4B9Cquk/7hL0B7PvLcvdH41tP1tldzWK
	yYmxjB6pdYvFgzY2mfJRa84TPJPDY7DtGBSjxcmra9pJIllUHKEmDHCzpm//DSFnZWWq2kg4AV+
	mI7VWxLUFjjS5IcN9cfJYO99DVn44gEobJI8/78KpzU0GlFVjTpQfitwsjdjLcnrVSvQA8wNtPL
	IMsM2hqejbGbWTmqPF4WvNSh/ooErrGqhkARn9JtlAIL/64+lVQOju5vH0FjAGF6rPi05nuqB6T
	vw1U6tHWfgi6C9vYq8Dld44xvvEtefCzKeHXBQvRQ/OwBjrdgQMSK3Udczwut/6qQ=
X-Received: by 2002:a05:7300:7a9a:b0:35a:8dad:6724 with SMTP id 5a478bee46e88-361a1f495bamr12539352eec.22.1792439948710;
        Mon, 19 Oct 2026 12:59:08 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a02b8sm37250606eec.17.2026.10.19.12.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:59:08 -0700 (PDT)
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
Date: Mon, 19 Oct 2026 19:59:08 -0000
Message-ID: <179243994757.157792.6578749550685907930@kernelci.org>

New build issue found on next/master:

---
kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
                 from kernel/sched/build_policy.c:17:
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
  CC      crypto/krb5/rfc8009_aes2.o
  CC      mm/mmap.o
  CC      fs/mnt_idmapping.o
  CC      block/blk-zoned.o

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179243994757.157792.6578749550685907930@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:73852e14f70c4fa20c57f8f41ccbe2bc6342d96b
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  3d229ce89862b8e82d71a9e11d6f840ca272a6d6
- tags: next-20261019

# Builds where the incident occurred:

## defconfig+netdev+nfs-root-boot+kselftest on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-nfsboot-6ad6683655fda5076042cad6/.config
- dashboard: https://d.kernelci.org/build/maestro:6ad6683655fda5076042cad6

#regzbot introduced: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64..3d229ce89862b8e82d71a9e11d6f840ca272a6d6
#regzbot link: https://d.kernelci.org/i/maestro:73852e14f70c4fa20c57f8f41ccbe2bc6342d96b

#kernelci issue maestro:73852e14f70c4fa20c57f8f41ccbe2bc6342d96b

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
