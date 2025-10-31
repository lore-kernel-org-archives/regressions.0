Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FAD32ED4B
	for <regressions@lists.linux.dev>; Fri, 31 Oct 2025 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761904747; cv=none; b=Hy9Mq5kjuygGTD444W+qolObXnpnREw6YWGmuV+kPYxh3PC2zW2xhB4nDQnd8xAOmlPYTO+wJJ+1aOLH8M/aBR86VXeqHo9ItcSTdTKlVBLfIsuwaWD9R4swL/bufJ/Or2f6qmgGRogTk6Egy7iX73E5yfCkSF+615kem5fvAgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761904747; c=relaxed/simple;
	bh=x/3eBVamsc4GqUrJq5weZRDQbBkuwwO8bW175DzPy7Q=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=NV+n6ohE2SBNwqm83jTBV8ReOvcvVKHpKbbQLSBaSyiHgqfD35NtQ2aKoWhG4ls4Rh2BerxU/gxF9OFJS4JIlSFaqLTde5JBjSKtfDRq8weCzYkVD01osps+19RIGVKikVFgsqG3ml/ljdFLs5xlsOdYxpZaHi8vmypKnfB6xdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=CwiR+7CC; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="CwiR+7CC"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-294fb21b0dcso24991185ad.1
        for <regressions@lists.linux.dev>; Fri, 31 Oct 2025 02:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1761904745; x=1762509545; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+KxFg2hHmVV0FcfqSk/4uQgiBa9mkwAKfZcNRO5L08=;
        b=CwiR+7CCWnU+uCXWhsNDcsxC552HdZFcMky6LFIETzDSyeUB7jip9V9p+O7SJg228t
         Rts1fAUFvho7suje6JM6jsarKxE5kIUhBERPzQsAbKxb52Ttm7aeJ4Wt6uOna24sVeV8
         ymd/3kuPCU5ako+UTuj23xElKM4RHgvlca9Esl6bR+LoAXfwoMXrkLPai/HnEUpxsXxz
         XhouCD/4StLWhJPy7CbBJ4GqeOHN/p7+8kQZW7gJkwZb2xH/dy7oUj03tmdgRsG7OTtI
         drOBre75edvEv3DezFLB35zsuYhIA0VuWphNLBrUkvT05xGLuGiaJDAs3oqgXpb/aoL2
         /i4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761904745; x=1762509545;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c+KxFg2hHmVV0FcfqSk/4uQgiBa9mkwAKfZcNRO5L08=;
        b=R4fYod5nSw1otoGwY80kBFM1RVcZp2Cwup5Cd8o2sAxlDGTLkiADcUD826QVjYwGDE
         GWaocg4ODjLZ/0E38tbcrn5tFkuAotAv0IyR4C8OOSXGOQYIFEAHeNbuNwtmPuMcI51r
         7aRxcd+HW08+1EhVvqWWfIa7dVI/ZyO94ZGe1mfNY/1g/vWiSi6sONMKeTdAnel+f1tT
         1rthUUBdSRmdT82IefciQUGFnjUWRkR0Ki8C9nIRousg0lRem9PLsMBo7cmYx+Ly7vNY
         kbr9Pi96sUNbEQhv4K1br9ndhq4ftLSyyLVglOcSk8yqR//4zLZAlEqViRFr1MdHwBog
         Ne+Q==
X-Gm-Message-State: AOJu0YyXYhPvI9CWWWktvPS6c/3T9E0l+ohQEwn8Li/j7HsrDVpiANfX
	sn4HcIomVD8LzM/sf/MfcpcJ+MO6skiS6djWw9K1fXXdhlkaO+iYduuQwKrVsNOngJAgOpQJ7TX
	/Mxz4RyE=
X-Gm-Gg: ASbGncu/pSiHlvHqZ1kSgDHGUZYR5hzn0ATdOeOtSWzAuJwwueeVAVRLJTZqpLiaFzX
	qYg3+Erxd/8x2VANUahNGiP+a8LTYezFxquz6oUKRQt7ionc09xUO5oU35VX8Py8MxGgvzIQE9D
	Ty+/4tVNU469rHD7iU/t/W2kwuyqjajnW3QFAh1Momg95J1c3J6915ysF8tv+QX8+n1/bBzDlCS
	/7nu6XN+5OH/y9WvnGd6hwnmbOE+JpQ96gvoi/4MGlaUPRLWZXJ/XHMOIQ7TNqDiH0dUiTLML8W
	Bl8odTScWu/qVtQ5wpGb+1hfjfcgmyHUFKIBaxzcFbEFV1CE2PaYp7kBSVdUjtWYeFgAdb8InGO
	jPWpnpKDoEKY7TBSE5uhKXPJWvfX56GKahu+NmFX0lpn9DhF/z6ub0ZiR4178s1GlaGMJzA==
X-Google-Smtp-Source: AGHT+IGhx+G3o9Z0D8X22dILTC6yUkzqdjqbZ5enawSqrYUe8rajYu1ZzF+A8K1y7RUa/nhOEVyrvg==
X-Received: by 2002:a17:902:d485:b0:269:6052:3536 with SMTP id d9443c01a7336-2951a4ffb0cmr38441365ad.45.1761904744850;
        Fri, 31 Oct 2025 02:59:04 -0700 (PDT)
Received: from efdf33580483 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268b52dasm17711105ad.38.2025.10.31.02.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 02:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [REGRESSION] next/master: (build)
 ./arch/riscv/include/asm/vdso/processor.h:23:2: error: expected in...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 31 Oct 2025 09:59:03 -0000
Message-ID: <176190474357.1783.9326055147559573063@efdf33580483>





Hello,

New build issue found on next/master:

---
 ./arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format in arch/riscv/kernel/vdso/vgettimeofday.o (scripts/Makefile.build:287) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:cd79512a03e4fd8760092dacf80363de08e082d1
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
- tags: next-20251031


Log excerpt:
=====================================================
  CC      arch/riscv/kernel/vdso/vgettimeofday.o
  AS      arch/riscv/kernel/vdso/getcpu.o
  AS      arch/riscv/kernel/vdso/flush_icache.o
  CC      arch/riscv/kernel/vdso/hwprobe.o
  AS      arch/riscv/kernel/vdso/sys_hwprobe.o
  CC      arch/riscv/kernel/vdso/getrandom.o
  AS      arch/riscv/kernel/vdso/note.o
  AS      arch/riscv/kernel/vdso/vgetrandom-chacha.o
In file included from <built-in>:4:
In file included from /tmp/kci/linux/lib/vdso/gettimeofday.c:6:
In file included from ./include/vdso/datapage.h:21:
In file included from ./include/vdso/processor.h:10:
./arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
   23 |         ALT_RISCV_PAUSE();
      |         ^
./arch/riscv/include/asm/errata_list.h:47:3: note: expanded from macro 'ALT_RISCV_PAUSE'
   47 |                 RISCV_PAUSE, /* Original RISC‑V pause insn */ \
      |                 ^
./arch/riscv/include/asm/insn-def.h:259:21: note: expanded from macro 'RISCV_PAUSE'
  259 | #define RISCV_PAUSE     ASM_INSN_I("0x100000f")
      |                         ^
./arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   16 | #define ASM_INSN_I(__x) ".insn " __x
      |                          ^
<inline asm>:5:7: note: instantiated into assembly here
    5 | .insn 0x100000f
      |       ^
In file included from <built-in>:4:
In file included from /tmp/kci/linux/lib/vdso/gettimeofday.c:6:
In file included from ./include/vdso/datapage.h:21:
In file included from ./include/vdso/processor.h:10:
./arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
   23 |         ALT_RISCV_PAUSE();
      |         ^
./arch/riscv/include/asm/errata_list.h:47:3: note: expanded from macro 'ALT_RISCV_PAUSE'
   47 |                 RISCV_PAUSE, /* Original RISC‑V pause insn */ \
      |                 ^
./arch/riscv/include/asm/insn-def.h:259:21: note: expanded from macro 'RISCV_PAUSE'
  259 | #define RISCV_PAUSE     ASM_INSN_I("0x100000f")
      |                         ^
./arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   16 | #define ASM_INSN_I(__x) ".insn " __x
      |                          ^
<inline asm>:5:7: note: instantiated into assembly here
    5 | .insn 0x100000f
      |       ^
In file included from <built-in>:4:
In file included from /tmp/kci/linux/lib/vdso/gettimeofday.c:6:
In file included from ./include/vdso/datapage.h:21:
In file included from ./include/vdso/processor.h:10:
./arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
   23 |         ALT_RISCV_PAUSE();
      |         ^
./arch/riscv/include/asm/errata_list.h:47:3: note: expanded from macro 'ALT_RISCV_PAUSE'
   47 |                 RISCV_PAUSE, /* Original RISC‑V pause insn */ \
      |                 ^
./arch/riscv/include/asm/insn-def.h:259:21: note: expanded from macro 'RISCV_PAUSE'
  259 | #define RISCV_PAUSE     ASM_INSN_I("0x100000f")
      |                         ^
./arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   16 | #define ASM_INSN_I(__x) ".insn " __x
      |                          ^
<inline asm>:5:7: note: instantiated into assembly here
    5 | .insn 0x100000f
      |       ^
3 errors generated.

=====================================================


# Builds where the incident occurred:

## defconfig+allnoconfig on (riscv):
- compiler: clang-17
- config: https://files.kernelci.org/kbuild-clang-17-riscv-defconfig-6904853b9df0fb426d143b46/.config
- dashboard: https://d.kernelci.org/build/maestro:6904853b9df0fb426d143b46


#kernelci issue maestro:cd79512a03e4fd8760092dacf80363de08e082d1

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
