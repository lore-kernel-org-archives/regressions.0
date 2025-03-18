Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535A41A08B1
	for <regressions@lists.linux.dev>; Tue, 18 Mar 2025 16:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742316213; cv=none; b=g/o06U2k8HHpH2FU+heNX5S/b1dUiajjCYcKyECl8TyT2iZ0FxtJQRdeAoG52OMtIq9jD/IramT3+NfLkQVBfPoL4n5Kss4mVzHonHilwXCR4pG9UNGfssbAj0dSOyMYrPwP74PVB7yNRWIF4KRbex/cKFVMrGRkwPp0JYxFBgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742316213; c=relaxed/simple;
	bh=40sHLKCbd1ad7h7xO1uBZYe405CEZtm+WQKhilJm+EA=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=czjzRujF+nx5TGDBFmF06sR6ym6WFhygBVyJdefOJ9KOt2vyYSiaL56KbyXUrk9YkBrkWIHd8xWYysHXOZ1PEVJYzbm1JIBHacIHZouP83XMhMghA5bXmjRGswzefwkfMoj1qaW/4QnOQ0fAg/LCIY8EPDpoW/mWz/OADXNkAIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=3XPuM6KW; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="3XPuM6KW"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6ff37565232so48587277b3.3
        for <regressions@lists.linux.dev>; Tue, 18 Mar 2025 09:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1742316210; x=1742921010; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gocTzu0HhjmbRVCNNQreGHCQ7FQZM6QffyKQDmJhBCM=;
        b=3XPuM6KW9hT6bllSzis3ctZEzxMXlHKZyEg+GIewfdo826iOEZKtbHxKG9zb1E/rSJ
         QRsbsvDd3MEe0ObscVuajfPtBqzqVIm1LdJL3e7SH+wIm8fTBQ7sq55mbszoeVGmAxOU
         5fwXHD5IXYr0FC5LMIz1a7PGAb649BiiYF1yLK/e+Dx0/yeD8mRL6wQUIEIvocgPE6Sn
         khJ1lUnrEkodTZMeKnVMBKyeF4Spdtr530HoaBjjqSOZsK8pj4zYmtnVFZMoa01+WzL/
         PB9Ki0WUmdJ5ATqJN5PEpypQ3KoqXMaq/rOXcjsHogOMB+81l+x5wa1ILPB3yOvlXPwN
         tCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742316210; x=1742921010;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gocTzu0HhjmbRVCNNQreGHCQ7FQZM6QffyKQDmJhBCM=;
        b=osTEWDWZnVLRo7tBrLk42DCYHbL8CzTgWhD9+emHZV1thwl1lHAZShxio1m0lfNS7z
         ol9VSosCLMt3qTBathwYgzdLGUGr1FpBrozpxa+wAP6JRxFjsxY65r2xgzorZLCPKDZQ
         PH4Yrvjtr8TvMhEqgelrzLdeOt5Eb31fPGUJKvuEBJXJoq5lqJvQ+fPwpUgURg9K7QVf
         N1V4ieett6akfZLcws4//eXFvPiAg6I0QVaZ8VVQN3oOEbiUtOiodNyhnezcL8svd6S0
         CSmlUkZjFawUyNTZReUpa1+AvG9VYQsTBaONsysAvH7x7f+B/FzYRzdW0n0zn1RhkyDu
         L4jA==
X-Gm-Message-State: AOJu0YyIkMSpK/xdDO/v6YNG184MBIl/lCARIUMc1Z+g5Y49T6azal0z
	IRNmlqy3DxjcFMUAgHeXC/7aHJBtT2+fISjkxV3HwrkI5uQN4A3BuMg3iIHrwWjhfhedHLecu2L
	ntApOyu7VinIP9XSAlmKwuf6WfvEPARrsUPnXix/uKPtrbbMrWjY=
X-Gm-Gg: ASbGncsyqQTZaSpFpJdMYO4dTKJeRm5IhJSkex+dWUG/wkeVFfLChI4AOq9ADgZojG2
	tiLbKDtCiz7Td3HA4hcOGCAwvRP0aWKlQzyra2K7Cu0t//BH/Bq4JQeHKLmaL4ysXIz/uPzd6bE
	u9zBpf/y/fhBAZPg+SQ5dNS5NXZaq/4JqBBCIPRQByPLOrtB2IeJ41UQtXTdc=
X-Google-Smtp-Source: AGHT+IHs4PCG7T7tIq5cQN4eGM0I+GS501mvp6eWquQ7ObyHjsdYjfv1uE1mSrlpOSbYG4tij7atG7wsVs6ozAlLlcI=
X-Received: by 2002:a05:690c:380e:b0:6f9:97f7:a5c4 with SMTP id
 00721157ae682-6ff4600ea1emr227820757b3.29.1742316210189; Tue, 18 Mar 2025
 09:43:30 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Mar 2025 09:43:28 -0700
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Mar 2025 09:43:28 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Tue, 18 Mar 2025 09:43:28 -0700
X-Gm-Features: AQ5f1JpUZRs7LPlEF5EwxzzwbOsN56Il6Q7OevL7kXkk_X6yEfJxuq6yprH1ivw
Message-ID: <CACo-S-0p4WymGFLTmsKtHbZjQ8KfD=3taH-YHa-evajpMwwjNA@mail.gmail.com>
Subject: [REGRESSION] next/master: (build) incomplete definition of type
 'struct module' in kernel/trace/trac...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on next/master:

---
 incomplete definition of type 'struct module' in kernel/trace/trace.o
(kernel/trace/trace.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:8704e0e8fecdd13f66a5e7c9411bd24b5a5222e0
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  c4d4884b67802c41fd67399747165d65c770621a


Log excerpt:
=====================================================
kernel/trace/trace.c:6036:38: error: incomplete definition of type
'struct module'
 6036 |         entry->mod_addr = (unsigned long)mod->mem[MOD_TEXT].base;
      |                                          ~~~^
./include/linux/printk.h:400:8: note: forward declaration of 'struct module'
  400 | struct module;
      |        ^
kernel/trace/trace.c:6036:44: error: use of undeclared identifier 'MOD_TEXT'
 6036 |         entry->mo  CC      lib/zstd/decompress/zstd_decompress.o
d_addr = (unsigned long)mod->mem[MOD_TEXT].base;
      |                                                   ^
kernel/trace/trace.c:6037:30: error: incomplete definition of type
'struct module'
 6037 |         strscpy(entry->mod_name, mod->name);
      |                                  ~~~^
./include/linux/string.h:114:55: note: expanded from macro 'strscpy'
  114 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst,
src, __VA_ARGS__)
      |                                                              ^~~
./include/linux/string.h:80:21: note: expanded from macro '__strscpy0'
   80 |         sized_strscpy(dst, src, sizeof(dst) +
__must_be_array(dst) +    \
      |                            ^~~
./include/linux/printk.h:400:8: note: forward declaration of 'struct module'
  400 | struct module;
      |        ^
3 errors generated.
  CC      fs/ext4/resize.o

=====================================================


# Builds where the incident occurred:

## aspeed_g5_defconfig on (arm):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:67d9852e28b1441c081c47d0


#kernelci issue maestro:8704e0e8fecdd13f66a5e7c9411bd24b5a5222e0

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
