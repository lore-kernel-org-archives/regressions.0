Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C096E823D0
	for <regressions@lists.linux.dev>; Wed, 15 May 2024 14:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715782752; cv=none; b=lwm7+H8qjLyboAyKG+bxLL6VK43ywTap7ekigOV4mREgzzKrbCTRoXangzi4tP7FYkTwV6FQBia9x1K15E/4JTU+10As9Pxor24322+6860EMjQKlAo2dAcn2dr15u/g7bpn+DAIrhGBHWuuw105nl3KOkRG1MiKc9myWB000Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715782752; c=relaxed/simple;
	bh=iy7dLAEaL4vVGSeorVmj9DuvDO3ifOspxvrna6sksIs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=M/3i0Zx1oIx+TWJF/lrhbrSHkka9u8utXeEl4ihIstf4lEP3RV64Y8LGaNMWQnMksM2JNd2yAXKUji1Kwex1BmbuwbsdIFs6C+r3k9rGrrc787EaohhIJ6QWGEyf8yBv1iSl+sn3zuapuwbNbC7cRYKeY9IGc7K2NF4/NgjWJbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M4HDsSLk; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M4HDsSLk"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3c9a0042e7dso1934097b6e.0
        for <regressions@lists.linux.dev>; Wed, 15 May 2024 07:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715782750; x=1716387550; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a9+nEjIRGhMjrhSd4waxnxR1U1OPOKlFj61G/GYKSuU=;
        b=M4HDsSLk2DuwPK5kC7udGR+wloF67oX86Bv/ONhHln17iGuyUUVY2ltkCkj5GKOb/i
         Z+Kjzla2NwYcZ/Gxpk3JlHuxZrJTPXErz+R41x9ebPB5ViS1U+zPJ3+0OrHsJYbfQm0e
         EZdp1TttIaNoaPoW2KS881QmzId88wRG7vPmqMarGYBuILhTRO0L96CrzZmFsEGAs2vF
         HIM07iAJNhjGcTEfSdnkZ+96KMUDLwt3FUQcXq4ENYtSSs8OwZm67sqCIB08tPg/TrRe
         1snqNGunPqtt0nXG2wpmssohrdiCGAIgsc/w16KuMlXP+et3QDy2xpgCAB1DEkKzrJeY
         Cd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715782750; x=1716387550;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a9+nEjIRGhMjrhSd4waxnxR1U1OPOKlFj61G/GYKSuU=;
        b=Htlfntk/4i+HyLwqicFxGqv2usxflBjmkKuaTG6kSZtKA5DNRPRUnUN3PRcbKrI5WE
         VWhq0BQwXSZkPsyQbR66bOZOLlZt0FAdgru2Kl0BZ6GA5VUzO0bN2vnqL5JnViEhJnqY
         ySVYdVQ4KqLj/XpoUxOWvbYvyUGQ+5dwCg8ANk62D9bbqZbi/2bEFEoh6WBWwbHU55cx
         451WnCHKzkeA2+F+ZU3ou25LUKp2RoETduMNVEi4w5v6qm4u6qdYTi+DKK2PAKPBgb7o
         tbLELaim4/hPQZMp+zGN9ENzWSjFvPuYX433PUPGWIj10QJu5smhXEb0Kq0tntyB6vXB
         JrwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT0xKeJ44Oo3poJcZ5GxNnpBqGRb2AtXikfMqEqxb1eXBhYvQPzz63Gyh8S+Qp1b4REbvhIAOAzKxEOE0f60MHa+HZL1wV1Tc3jBs=
X-Gm-Message-State: AOJu0Yze41GA1A6eBXJbEx/RC6SLzwuxXp06wZpFgOcp4jxTozGFs5c7
	2KJrBtgjlBVGMtasMmJN/ErMTZqWEZ/vQelJYB3vx3fj5/oA2cJNZrppkjqSJjnsiEcmRJRQ4FC
	B0vkeoHk1UNbeKZiJE+wZmtSnB8RZ8xZ8aZ21/w==
X-Google-Smtp-Source: AGHT+IH/7/dqPY9r1lhR5haX5AIQ/98Ll9YuM9T0D4wFA2HFYmBB4m8nfB/jKUjlQdttEXRU3o5RpwBPOQ1s/m/TNvM=
X-Received: by 2002:a05:6808:2d9:b0:3c8:65ee:6795 with SMTP id
 5614622812f47-3c99704cfbdmr14936618b6e.22.1715782749719; Wed, 15 May 2024
 07:19:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 15 May 2024 16:18:58 +0200
Message-ID: <CA+G9fYtDtgb8zNGfDQPS2u_n_45rDiDgJR6ud3uuxkJBR0rUzA@mail.gmail.com>
Subject: riscv: irq-riscv-imsic-early.c:52:9: error: too many arguments to
 function 'riscv_ipi_set_virq_range'
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-riscv <linux-riscv@lists.infradead.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

The riscv builds failed on Linux next-20240515 tag due to following build
warnings / errors with gcc-13 and clang toolchain.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build Log:
-----
drivers/irqchip/irq-riscv-imsic-early.c: In function 'imsic_ipi_domain_init':
drivers/irqchip/irq-riscv-imsic-early.c:52:9: error: too many
arguments to function 'riscv_ipi_set_virq_range'
   52 |         riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI, true);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/smp.h:119,
                 from include/linux/lockdep.h:14,
                 from include/linux/spinlock.h:63,
                 from include/linux/sched.h:2142,
                 from include/linux/ratelimit.h:6,
                 from include/linux/dev_printk.h:16,
                 from include/linux/device.h:15,
                 from include/linux/node.h:18,
                 from include/linux/cpu.h:17,
                 from drivers/irqchip/irq-riscv-imsic-early.c:8:
arch/riscv/include/asm/smp.h:52:6: note: declared here
   52 | void riscv_ipi_set_virq_range(int virq, int nr);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~

metadata:
  git_describe: next-20240515
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: 82d92a9a1b9ea0ea52aff27cddd05009b4edad49
  git_short_log: 82d92a9a1b9e ("Add linux-next specific files for 20240515")

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240515/testrun/23894295/suite/build/test/gcc-13-lkftconfig/details/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2gUiKdxX7qM27ritMJT5pRyZhyi/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240515/testrun/23894295/suite/build/test/gcc-13-lkftconfig/history/

--
Linaro LKFT
https://lkft.linaro.org
