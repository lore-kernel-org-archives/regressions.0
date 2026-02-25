Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF54F2DF152
	for <regressions@lists.linux.dev>; Wed, 25 Feb 2026 18:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772045946; cv=none; b=dHNm+umZCi5ghq0bYdzGX1XETgAizMxB+2ImmNlguVkpfbvrIWrqmRfaFc3VOUWyGciRwKI/gLUA+SaogdYH6Qgr7xd+s1lz8CNxFWHUx657uo/A+NgGAa1kDxCoZZMKJeh97vuo8NRKM+sMtArSAFWsl1Ox1z2BgvKy5PnCC8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772045946; c=relaxed/simple;
	bh=IIFWxI4/xm/9MJArSe7B/vP3QzaE2u2z9J9PxBlwCRI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=GfUcNQ+4PlspwuCJ79TGv3T8uSTgRtUmnQuZyIoTAU7nYWvj1AC8pmQDGu1dCu+J1sQebivhTGUKhJQVvkHku4bUY2vKFaqS+KBG6yiO1OQoJzhqkHcC+hIfDBS9pXZQ4F3QNROQIZ6qyzsv8PvKqPH1GnAlkD12+qbouVsJfXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=BflEHiPw; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="BflEHiPw"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2bdb17511aaso3070619eec.0
        for <regressions@lists.linux.dev>; Wed, 25 Feb 2026 10:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1772045944; x=1772650744; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWi4WFAKbgRRzjrcgiHjdpqpwcDEWF//ta0ZSqcdU6E=;
        b=BflEHiPwxZsv/qgYaaVXdETXx86z6mcC3wmaG9/dTH0PpY0hI1SgWyASM51EG8UYg4
         nqf8F+hLS1ljEhr4KY95jnc/5tPT3Sr/rSr2mAJlPhF779o9Gyv1nlus+d5lFR4yHeiM
         TW+Q0XXBFGNiNVAaUXRfxcBmrAYfIftiwrs84M2+eHe8gpC+V5yTXReHdVCtuKvHSC5B
         Thk+TUEsT8XD+26ewInBS3BVcNjQU2hPdkjIkVfNjtr/Y2eYw5fuXkJDcDgtKC08dL2T
         fmB92SgPrPDf1oCwqeVq60WzlNbmJDzeyUOLaekBX6BvyiBqZG1WkCgGuqll3POhjvdP
         pq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772045944; x=1772650744;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DWi4WFAKbgRRzjrcgiHjdpqpwcDEWF//ta0ZSqcdU6E=;
        b=kc3h+tE0kZ7oogNOeCa/I7RmowaOi4B5FqILTr7Gyc8MYL/ZCwF+fIa5vOKNeCMVA1
         37B38YlteNK8vWYE10WrC/h5UwxRd141DImd1zwCcs3IUlWhXbPtIMxKC07L3gygt62z
         ic7eJfSgAOtO5zSS45K63YDbB5IhHcSBxSKdhN4ulbRCSnQY5s3TMyzhldzePcSsZEJC
         sr7MJrxJb29NLEtmk0iicEPBeTNOYlKU//9Z3hZn9xt4SObjlFaj2fWng6Xxjns5VlH+
         c9dL6XP7cDL92iLH1ciWJH3y3RVVRksYxFs1JMYli9rk3H3mxrM4vRI1m+aCiGL7Ftfl
         GD8g==
X-Gm-Message-State: AOJu0YyloOlJPaSQOhrfqTJM3Nve54uKP+oUarCFJxuRTqM+WrYktgtK
	9C0sibTi2NOAO8vl3Jpt2X5JNEhwLsgsh7razfaSwP69J4I/vtcM1W4cJshWZc6l9pQ=
X-Gm-Gg: ATEYQzypsM+E7FfJEwEe47CpXdxvy9JyFndAgsRGmu4RRY2M4HPuj39IwZbmDf3i/G5
	FfRESNxZAhrQqySIwlJ3zF/bQolCcBw/SelrgI/FNsz8yf3Yn/yt/0nypB6a9YpfjKbh06HAqMe
	GMYt0w2S5pxCcsVd+/Te96XYQPyGdE56LNFW4e19ds7YxHlieRmu+aLe9iHJLSKDHvMTz9lJJno
	nLFIiP7Ub+A8ZG3guqCoKIgXvj9sOhT/YHkuBo9SRwxvqmd5KCI7BbxiSMmbC1Z86SNoZwYqVTO
	2hQcWIR3qRx6Wan7QzmP/g2GZIdKq11ciXNv87kKX4S6AhG/YtOrvDz50vFyxVrmOMwSvjiOYQB
	3ZYSJ9O3YlRccxGPmFCK7Kls96xFl80/YctFthdLqX0PZaRSwP4wy/TPgGQ8h+pqr0hVAoL9Yum
	puYJ+xOEOPGk+OqdlP
X-Received: by 2002:a05:7300:e8a3:b0:2b8:66f3:2502 with SMTP id 5a478bee46e88-2bd7b9f084emr7565157eec.1.1772045943880;
        Wed, 25 Feb 2026 10:59:03 -0800 (PST)
Received: from d14e337afe00 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7daa35f7sm9827304eec.8.2026.02.25.10.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 10:59:02 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [REGRESSION] next/master: (build)
 ./arch/arm64/include/asm/vdso/gettimeofday.h:89:44: error: initial...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 25 Feb 2026 18:59:02 -0000
Message-ID: <177204594245.2922.15031164626959805297@d14e337afe00>





Hello,

New build issue found on next/master:

---
 ./arch/arm64/include/asm/vdso/gettimeofday.h:89:44: error: initialization of ‘const struct vdso_time_data *’ from incompatible pointer type ‘struct vdso_time_data (*)[]’ [-Wincompatible-pointer-types] in arch/arm64/kernel/vdso/vgettimeofday.o (scripts/Makefile.build:289) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:acf8242e63eea4d9f840982fc65be8d739de5428
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  877552aa875839314afad7154b5a561889e87ea9
- tags: next-20260225

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
  CC      arch/arm64/kernel/vdso/vgettimeofday.o
  AS      arch/arm64/kernel/vdso/note.o
  AS      arch/arm64/kernel/vdso/sigreturn.o
  CC      arch/arm64/kernel/vdso/vgetrandom.o
  AS      arch/arm64/kernel/vdso/vgetrandom-chacha.o
In file included from ./include/vdso/datapage.h:196,
                 from /tmp/kci/linux/lib/vdso/gettimeofday.c:6,
                 from <command-line>:
./arch/arm64/include/asm/vdso/gettimeofday.h: In function ‘__arch_get_vdso_u_time_data’:
./arch/arm64/include/asm/vdso/gettimeofday.h:89:44: error: initialization of ‘const struct vdso_time_data *’ from incompatible pointer type ‘struct vdso_time_data (*)[]’ [-Wincompatible-pointer-types]
   89 |         const struct vdso_time_data *ret = &vdso_u_time_data;
      |                                            ^
In file included from ./include/vdso/datapage.h:196,
                 from /tmp/kci/linux/lib/vdso/getrandom.c:8,
                 from <command-line>:
./arch/arm64/include/asm/vdso/gettimeofday.h: In function ‘__arch_get_vdso_u_time_data’:
./arch/arm64/include/asm/vdso/gettimeofday.h:89:44: error: initialization of ‘const struct vdso_time_data *’ from incompatible pointer type ‘struct vdso_time_data (*)[]’ [-Wincompatible-pointer-types]
   89 |         const struct vdso_time_data *ret = &vdso_u_time_data;
      |                                            ^

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+CONFIG_ARM64_64K_PAGES=y on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-64k_pages-699f38261f24bb69463a9fd2/.config
- dashboard: https://d.kernelci.org/build/maestro:699f38261f24bb69463a9fd2


#kernelci issue maestro:acf8242e63eea4d9f840982fc65be8d739de5428

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
