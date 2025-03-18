Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0812080D6
	for <regressions@lists.linux.dev>; Tue, 18 Mar 2025 16:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742316068; cv=none; b=MLgWV3kah87T62Kh72n0rWkuHA0ITuDgbNi/M5RYsNqSkrKBiOCxxoeNR/anQI5MfhWrlDK4tKTo3SPl9LthWq4r3uLQKTQs/DOCbAQwCUnZWzSrhhZx3RuHkxKRHiqJgQyV76epeZoB67lWI3ageWI8RfHL06MstjRSese+z9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742316068; c=relaxed/simple;
	bh=40sHLKCbd1ad7h7xO1uBZYe405CEZtm+WQKhilJm+EA=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=AmHihyryS9n4MyBegDpLMUOizaJ+u/WqlA3feQFaaZMM0BgXVhjfMVpqM5V2ycMu1iIj3/L9C9mM2w9QWBDNGisynQMhIL8zoTTWMx+cXyXdVSytQj83QNRiPclGt8iyxzcXLWAgfHK4H8gVoYcWhvJH9alc0eJo/ca+j+w0gK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=F80WG84b; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="F80WG84b"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ff07872097so15977707b3.3
        for <regressions@lists.linux.dev>; Tue, 18 Mar 2025 09:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1742316065; x=1742920865; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gocTzu0HhjmbRVCNNQreGHCQ7FQZM6QffyKQDmJhBCM=;
        b=F80WG84bpD2cNbaKN2xUJbu/fn9lhTvi1lE6yRISyOTNhz4kL5KxzAHjBq/44FReNY
         vyjG1xCAEXV1c+Ai7iSlhLrjoW6hlyQCaC5HC1mErNG4DLt/X5CM1GhjaSoqt21KQxS3
         2r/rLjIkPWC19rGV8QJ8qZMKhdpSV3OnF1I82VQkMEDshApXdBPw4Od5eDLVSJz2KG3m
         zpQsnu7WOq+S1FQgNkN9x15TrGQlau0fT1m4/2xX8+BkZVRbWOG80D5K23g99yGT/RBn
         MF+qLkd619ks5ZGkcuxYNCmCMt6MxKQQr5BbGCiLcVLUhoCqiptEmB2npHxsq/ag6QPv
         sEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742316065; x=1742920865;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gocTzu0HhjmbRVCNNQreGHCQ7FQZM6QffyKQDmJhBCM=;
        b=ZI0OGwUWXy3Lubkk/fsv5pM+XotO+fYIY0uRzh4+qQEoYWElwmu5xI89k+x5/h5gQR
         ywmJo+iJoNqTKhjrgGcl0M5Mk0eg2fh1BCW0H8ovve1XloEj6AgfMBtpiC0RX7z4x2Hx
         QVw3aSZfb3tPnpe6oOS4S7/DBdNWQ/CetsSuO/scnZB+ER9OU343oh2fjhmS8zyHPmJ5
         Ok3wE7mEF872kEKXFdcwHyiapRQ3iwIGx2g+ZoQaJ3HZeEhRFh98nLhfwbeJyVQ+YjGy
         ntQ7eY3UK8cnec1rtaCF5UlOBkaQnsARum1ZSTHdOoyr9XffMo/E6RNMY5BMkc1hIWHI
         cscg==
X-Gm-Message-State: AOJu0YyTfOxYPHmj6BmYK3vZFr1sNE2CLmlnR50h/a5RG8hqcJRu1cX0
	03NjdwSUlml8a26ueHkiieINtG8PEKmNIKKSkxoSVVkITyqbAsJbHM21IgkBsO8vZyuq3C2d/vJ
	Q7Vwm/zu0D6Jd3WzvK/EFuzVEO0xSeq2CJsvnnw==
X-Gm-Gg: ASbGnctxCypp9r53w++uPTjIKznBdozYuzLZ7tXkjSv5kE8dzlTWjpMJUtxSzxiXVoJ
	orgdEZn+xKwOD5Vk9xXI7JhJ/qo22whi/IXHpdbOpgFti9Oh8jesJd11EUv283xgKmvT9GlvQb6
	mmsy/1jUOQOgSs71oD2K4XYLaW8+8DruJ5pNp7YkfqPVCEhEFayGDLOsKNm+w=
X-Google-Smtp-Source: AGHT+IHAzgrf/uByp5T26RqiUUW++qDMMmczsIA8VL0WDigAhS44Z1vrsDutMjfCPpIP1DGe+s4KclBKauDc1p1jXi0=
X-Received: by 2002:a05:690c:6185:b0:6fd:4718:9bde with SMTP id
 00721157ae682-6ff45e8bc4bmr232542827b3.9.1742316065515; Tue, 18 Mar 2025
 09:41:05 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Mar 2025 09:41:04 -0700
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Mar 2025 09:41:04 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Tue, 18 Mar 2025 09:41:04 -0700
X-Gm-Features: AQ5f1JqPH_xGwNMXj9PyRkUv2hUygvuYhJ-5ri4A1gW63CNSRiui1Ngw_pz6ZZo
Message-ID: <CACo-S-2XihmowZjwwrh6P6dGX6h6vrmQh_jbFrfOkkoxVohMUA@mail.gmail.com>
Subject: [REGRESSION] next/master: (build) incomplete definition of type
 'struct module' in kernel/trace/trac...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, tales.aparecida@redhat.com
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
