Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AB3188A0E
	for <regressions@lists.linux.dev>; Fri, 28 Mar 2025 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743152347; cv=none; b=kg+O2j74S8fI80XBDjWE9cCbhIMhTOjomx4C+vRJ2ZSkrMHogFAk2KYR+U23Z2BytlhiXh54HlvmZp/MfQaTro7XPFzAvDTEEh0dcodd5erBPOfOdbp9iaGp/75xzCl4FOJOhFrNNrLfNQ6p0jz3tVbghkJUJE13+1u/Z4zERqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743152347; c=relaxed/simple;
	bh=e7h5M4zZjjokYk2lu7+YFfhl77YDdecLXAeBc2fJ1i4=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=lh0Tm4x7X0LEwf70XhLUhOOrO0yzjcBK7gApKcp/QGNDFvAvdGBGxjRESev/PsntTJVQVi7RWXzcOUCT+TboQruZi2rrlJbPjTZ4GxdOn3JDe6LQKRNhkOjWYQav2qtsIZxsBkIJ1cN1ROrDU8BI9Y/gpQ1za2eV2io9dXPVqeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=KIiR3do/; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="KIiR3do/"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ff37565232so17482517b3.3
        for <regressions@lists.linux.dev>; Fri, 28 Mar 2025 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1743152344; x=1743757144; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0X5x7QP97GaZ+wW8i0ZoOU1My/1umgrP5eqkkPqURi8=;
        b=KIiR3do/cbtMZsnACzkaIWNbNpci1YKjcLBtC1QNLZjVVBslmokPXatvRX07QDO4wb
         phpO0yy7hwmgPsCsy9f+r+KFKtz9eXrH8VKKcp8zmDG1acUWbKogbnxe2a9HSTCSKZdd
         cUaaky4yA68VE9F0qlR6zcTSjaVCxuZWq8B6z5HcRELHPl9Sqe7odVE3NiG0QTQYhfv5
         oVl1FCVNNPnE0AWgr2cJmR2gFiK/igk95emZ+uN749onnSQbybNye6lAVWKz8NJl1pMc
         +hZUcciSLDh7Fjw4cfYL3siezGJKR3UKxUoBNSNE6yH68em8WctFF+naMXGImM8t9OOi
         targ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743152344; x=1743757144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0X5x7QP97GaZ+wW8i0ZoOU1My/1umgrP5eqkkPqURi8=;
        b=w4ZnWHDu0D9i2L2yoTo/+WrvV08/zVClKryDWEjVHbqgKBZgwtE2YZhzEhU8xV1e+O
         Dtc0PYhgs3KXTz3Qy4ZXs7dpqtNOAQAW1nmzjVk89wCifc5b04MT4rXy/4Olt4jOl7XM
         xneRmTpnRsZdxjfuHrjtRQQrdCJhJ1/lPHMArCxEJ2dDOewO7wBSh8ht1WBkE20lB/5U
         0tS7gIWtfLAzYIN5AuDIN5GjC0aEjnpO0nvLP3CujJjEh04GmXHFMqzAcg9OAAdpkcVe
         LPjrcVR+Lsw1Xmn+RU7ftPJax97ZtiDgBL2yqtEgNLCJHSy2o99Vlw604YFM8NwM7wZQ
         8BeQ==
X-Gm-Message-State: AOJu0Yw7cru4NCP3KprsTQ4EaTypH/ZzjGeUaQt2eTqypBuui4f4dVUh
	xF5k/Y4feuPG+/rTuUIn7w+Yx4mPwa+rDr/iZR5K7S4DAG59guP2IJW9TD2pjXKiQtqzEQsp68K
	++djxODLl92qoqtozgIQLCZ+X+8Fanu3BoHfJXw==
X-Gm-Gg: ASbGncvlr8S4tctLee8I1YuOnJQ+J/+tlmfA2UQP3WwSqQ4jedksVRgSnIdYcpmgpf3
	owN0zdWBp4s5vkCBsplWqAGHw3YwLQeua2SeIzSvP3pE69Dvm+P8XPCfLl251huVtmV5m9BmhkO
	5rxLww4BBM2Py5LpdgaxpfaZDi
X-Google-Smtp-Source: AGHT+IGmpiWrZOt8zhyo9v+bips4TE2abNwdubmY6ZzVqGoBWpovtyQN5yabIUBMnrgZfI8Qyqv421IWqrQ6Tg5D2Ws=
X-Received: by 2002:a05:690c:3589:b0:6fd:33a5:59a with SMTP id
 00721157ae682-70224fcf2f8mr90042037b3.18.1743152344486; Fri, 28 Mar 2025
 01:59:04 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Mar 2025 04:59:03 -0400
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Mar 2025 04:59:03 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Fri, 28 Mar 2025 04:59:03 -0400
X-Gm-Features: AQ5f1Jotcje3x3DVA36AwlBF0UE8l5X2D-zt828I3ZwOozWF4c6Oxt4BZMbdV7A
Message-ID: <CACo-S-1H=k5F30hq_sdyvjFTyu_0kkWrN75R2qz0f7Ljgtqd7A@mail.gmail.com>
Subject: =?UTF-8?Q?=5BREGRESSION=5D_next=2Fmaster=3A_=28build=29_=E2=80=98start=E2=80=99_redecl?=
	=?UTF-8?Q?ared_as_different_kind_of_symbol_in_arch=2Friscv=2Fmm=2Ftl=2E=2E=2E?=
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

New build issue found on next/master:

---
 =E2=80=98start=E2=80=99 redeclared as different kind of symbol in
arch/riscv/mm/tlbflush.o (arch/riscv/mm/tlbflush.c)
[logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:9f0980b6a5fe11c4cb2602f25e07c=
80c152b5690
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
- commit HEAD:  e21edb1638e82460f126a6e49bcdd958d452929c


Log excerpt:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
arch/riscv/mm/tlbflush.c:195:23: error: =E2=80=98start=E2=80=99 redeclared =
as
different kind of symbol
  195 |         unsigned long start =3D uaddr & PAGE_MASK;
      |                       ^~~~~
arch/riscv/mm/tlbflush.c:193:53: note: previous definition of =E2=80=98star=
t=E2=80=99
with type =E2=80=98long unsigned int=E2=80=99
  193 |                 struct mm_struct *mm, unsigned long start,
unsigned long end)
      |                                       ~~~~~~~~~~~~~~^~~~~
arch/riscv/mm/tlbflush.c:195:31: error: =E2=80=98uaddr=E2=80=99 undeclared =
(first use
in this function)
  195 |         unsigned long start =3D uaddr & PAGE_MASK;
      |                               ^~~~~
arch/riscv/mm/tlbflush.c:195:31: note: each undeclared identifier is
reported only once for each function it appears in
  CC      init/version.o

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


# Builds where the incident occurred:

## defconfig on (riscv):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:67e6577667593f2aa03b757c


#kernelci issue maestro:9f0980b6a5fe11c4cb2602f25e07c80c152b5690

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
