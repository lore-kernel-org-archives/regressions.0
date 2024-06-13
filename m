Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CAF143747
	for <regressions@lists.linux.dev>; Thu, 13 Jun 2024 13:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718284565; cv=none; b=QWOV5Ze+ns6WMuz4+zmnazJFTKcMMdvfoRDQsJYtLc0olJGFC17skF2OPY7JEsrxZBrwsNTCQeiDxBr563FJ4ARgo9lqAwgiQbs7I59NzOGn27R8EBZMZZQcIL7S030bBFQ0ZPYXKHFwSNQuT4QgbGAScfXOjaumRdhJ8Sgdvkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718284565; c=relaxed/simple;
	bh=V1MODXg2FeVlGh8cU9j9/KuGFRIBbgRDLnpu/K0rcBE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=oE10N0E64WdB9xcHBNpraPJZmkUjw0wt8SnwRTIjirJ+341D1nGvFOoRmXWwtKsjjudFPsA8xCF6PzOEfJhxZTND/s3i1ryiqtWLHBTfBRcYGdXyeuRNO6wtPzyBbnZ36/8stHFOnvQN7x0jEy8zMOgwNgzbvkVlIAnCZyHxOsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HBEd9/nS; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HBEd9/nS"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-80b8d0d19e8so290369241.1
        for <regressions@lists.linux.dev>; Thu, 13 Jun 2024 06:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718284561; x=1718889361; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=61ouTCt8HWN0ZdDws0+ptI7BCpGd4+Hs5oquQFyzwjk=;
        b=HBEd9/nSPsP/rDsX8sKX72HMkBGj2p3pMWJDMiAL2BAo0PjCarcmSiIeeZX1lTxJeF
         FPVEF6HtZ+lILzvR61L3YDuy03G6OFCtBQ9h39ot0WYDtx8mpFIGojE6tQIQtcGemUBJ
         LazZrvqTRhNPxzOdl0obHTE3frAU/1wHYcb2pCkEaryHnBYftOHabjpmUysQla7+Psfx
         9RT7GHN/BZj0db9vSIzGMC1Q0m+Mf1SgnPJPUCdWiWAfFOu21YMYH3P4/EolFSplvwLM
         RBdiXu77bnwjGeRCrLYCr5KKSu4hVOVwbGAFVTdNIlZDXkd8ElSX2vnUrlo44RZk//ve
         UuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718284561; x=1718889361;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=61ouTCt8HWN0ZdDws0+ptI7BCpGd4+Hs5oquQFyzwjk=;
        b=GSg3AgnWSj7qwbtHPXWQd0GKjY347/sxsEgTQFsqYJ8zt9nX1dG7VBw6796z1CAo2h
         mP8r/2ld2eMRpAllu+qwmOCirNGuEDQ/n4EN2ZI9g2WDbtN7NgfUapSqUwhX8n5Y35Xo
         YYxX5Kt3pcPWrgtDe7GN3dOSQNatApHPiyA9qR4wttnMdQUAyIjIOBRhN+DYXJok1gjq
         +OWXF/4LsDXAptDg9kSsJzpkgMb76h1bxRumJgF98glZH/gr2iZHCUScjd9B4bdWxQr3
         5JveIrY1VP8PACJj/dmAP7aDtu2POgzoZVcbFF04JFrq1NbWIeX/V8UWwcI/MMsX/HNh
         TIlw==
X-Forwarded-Encrypted: i=1; AJvYcCW/V+yHGMpL/RLj3tjEJ7xiHCiyEB3NNjBGxzwrKJFRgQNmbxnmu6I80pDDr9GF0nJc6unEt8q59+UQOfml9YdQc73vMRECURjW3P8=
X-Gm-Message-State: AOJu0YxLfdJQyCdBgi5wUWZ+HJA7XkbiiXm0G2GatZsHsfjILMtDD444
	YeKcYC+bu4rP4DcJJqvk0pymWFvDKIYKD5kmVcQZgHM/aagoqxAh2YywJ/JW90nGZH7daMsZ5ep
	6NDTDBwMC7XnjpIMpENU35BinrVvXXZAVbO7EPA==
X-Google-Smtp-Source: AGHT+IHv07AcEdT7ldaMS72kgcQ+CTnBQHmRnZDjUaiVpeh19fhu7+o9thMU27bhoaNTxcsaw8QJ+jw+l4h61EPdyUY=
X-Received: by 2002:a1f:e4c2:0:b0:4ed:f1:e0b7 with SMTP id 71dfb90a1353d-4ed07aad6a4mr4561204e0c.2.1718284560997;
 Thu, 13 Jun 2024 06:16:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 13 Jun 2024 18:45:49 +0530
Message-ID: <CA+G9fYveCjzej3SDZR=PBASc=ycdL7xvWENonYCOXCjRJe8+oQ@mail.gmail.com>
Subject: selftests: ftrace: WARNING: at arch/arm64/kernel/stacktrace.c:112 arch_stack_walk
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Nianyao Tang <tangnianyao@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <swboyd@chromium.org>, 
	Puranjay Mohan <puranjay@kernel.org>, James Morse <james.morse@arm.com>, Will Deacon <will@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following kernel warning noticed on arm64 qemu-arm64 and rk3399-rock-pi-4
device while running selftests ftrace tests on Linux next-20240613.

This is always reproducible on qemu-arm64 and rock-pi-4 device with
kselftest merge configs

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Test log:
-------
kselftest: Running tests in ftrace
TAP version 13
1..1
# timeout set to 0
# selftests: ftrace: ftracetest-ktap
# unlink: cannot unlink
'/opt/kselftests/default-in-kernel/ftrace/logs/latest': No such file
or directory
# TAP version 13
# 1..141
# ok 1 Basic trace file check
<4>[   96.183553] ------------[ cut here ]------------
<4>[ 96.187100] WARNING: CPU: 1 PID: 538 at
arch/arm64/kernel/stacktrace.c:112 arch_stack_walk
(arch/arm64/kernel/stacktrace.c:112 (discriminator 1)
arch/arm64/kernel/stacktrace.c:155 (discriminator 1)
arch/arm64/kernel/stacktrace.c:172 (discriminator 1)
arch/arm64/kernel/stacktrace.c:243 (discriminator 1)
arch/arm64/kernel/stacktrace.c:267 (discriminator 1))
<4>[   96.188005] Modules linked in: crct10dif_ce sm3_ce sm3 sha3_ce
sha512_ce sha512_arm64 fuse drm backlight dm_mod ip_tables x_tables
<4>[   96.189034] CPU: 1 PID: 538 Comm: ftracetest Not tainted
6.10.0-rc3-next-20240613 #1
<4>[   96.189183] Hardware name: linux,dummy-virt (DT)
<4>[   96.189366] pstate: 624000c9 (nZCv daIF +PAN -UAO +TCO -DIT
-SSBS BTYPE=--)
<4>[ 96.189529] pc : arch_stack_walk
(arch/arm64/kernel/stacktrace.c:112 (discriminator 1)
arch/arm64/kernel/stacktrace.c:155 (discriminator 1)
arch/arm64/kernel/stacktrace.c:172 (discriminator 1)
arch/arm64/kernel/stacktrace.c:243 (discriminator 1)
arch/arm64/kernel/stacktrace.c:267 (discriminator 1))
<4>[ 96.189562] lr : arch_stack_walk
(arch/arm64/kernel/stacktrace.c:109 arch/arm64/kernel/stacktrace.c:155
arch/arm64/kernel/stacktrace.c:172 arch/arm64/kernel/stacktrace.c:243
arch/arm64/kernel/stacktrace.c:267)
<4>[   96.189593] sp : ffff80008000bdf0
<4>[   96.189610] x29: ffff80008000be80 x28: ffff9969bab84000 x27:
ffff9969b9c53b98
<4>[   96.189702] x26: ffff9969bb6a60c0 x25: ffff9969b9c53b98 x24:
0000000082000000
<4>[   96.189775] x23: 65cf9969b8823ddc x22: ffff9969b882e518 x21:
ffff9969b8836200
<4>[   96.189809] x20: ffff80008000bec8 x19: ffff9969b8823d70 x18:
0000000002000000
<4>[   96.189842] x17: 0000000000000000 x16: ffff800080008000 x15:
00001e8480000000
<4>[   96.189876] x14: 000000000003d090 x13: 0000000000000000 x12:
003d090000000000
<4>[   96.189910] x11: ffff9969bb764150 x10: ffff80008000bf30 x9 :
ffff9969b88b2970
<4>[   96.189958] x8 : ffff9969b882e518 x7 : 0000000000000000 x6 :
0000000000000023
<4>[   96.189990] x5 : 0000000000000000 x4 : ffff80008000bf30 x3 :
ffff80008000bfe0
<4>[   96.190021] x2 : ffff9969b882e518 x1 : ffff9969b882e518 x0 :
ffff9969b882e518
<4>[   96.190145] Call trace:
<4>[ 96.190196] arch_stack_walk (arch/arm64/kernel/stacktrace.c:112
(discriminator 1) arch/arm64/kernel/stacktrace.c:155 (discriminator 1)
arch/arm64/kernel/stacktrace.c:172 (discriminator 1)
arch/arm64/kernel/stacktrace.c:243 (discriminator 1)
arch/arm64/kernel/stacktrace.c:267 (discriminator 1))
<4>[ 96.190269] return_address (arch/arm64/kernel/return_address.c:45)
<4>[ 96.190335] trace_hardirqs_on (kernel/trace/trace_preemptirq.c:56
(discriminator 1))
<4>[ 96.190372] handle_softirqs (arch/arm64/include/asm/irqflags.h:26
arch/arm64/include/asm/irqflags.h:48 kernel/softirq.c:538)
<4>[   96.190744] ---[ end trace 0000000000000000 ]---
# ok 2 Basic test for tracers



metadata:
------
git_describe: next-20240613
git_ref: master
git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
git_sha: 6906a84c482f098d31486df8dc98cead21cce2d0
git_short_log: 6906a84c482f ("Add linux-next specific files for 20240613")
arch: arm and arm64
config: kselftest merge configs

Links:
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240613/testrun/24304248/suite/log-parser-test/test/check-kernel-exception/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240613/testrun/24304248/suite/log-parser-test/tests/
- https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2hoMyyk19L9y5Hg3AT2V3yaedPU

Build reproduce:
--
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2hoMxP9HQelutO3feaEW1G9KhDz/tuxmake_reproducer.sh
- https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2hoMyyk19L9y5Hg3AT2V3yaedPU/reproducer

--
Linaro LKFT
https://lkft.linaro.org
