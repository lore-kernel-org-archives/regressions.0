Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6310328C5B3
	for <regressions@lists.linux.dev>; Thu, 22 May 2025 13:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747920607; cv=none; b=sd+aWKVZE11XrlyZy9fSebhbVrnAXHA6S42CIlBkMjKgeQz87xLC2lsUZwz9chRIOu2nieGRGpHBdfSW8iKmRYIcW9NKxfIwLMg9ZMYuYKDIjw8ySTefsn4p8us285O0M4t3rnayc9LJu0hANTjJyJOAuFlSz9r5u9b92bEL+X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747920607; c=relaxed/simple;
	bh=NHyEFssMjma0bg2s2drOqDgNRfGG15lqfqeZ7WbrMPo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WSx0Bur8FBbipaZ8Ag1OefXQoBrajrvd2q9rPanEIUMZ8dQSrAxiMqV5+oWqkNGcmFJ+SktsmYa8eAxj1c8QFOoeNZtC9Jml8V2MtffWHBpXmDBqR7tafwwmEwynl+mCuyOyOelbg1SB0SD4PvbSCiDXamw7v0OOylGLjhAuc0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mhO05wWQ; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mhO05wWQ"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4c4ecf86e8bso2641034137.2
        for <regressions@lists.linux.dev>; Thu, 22 May 2025 06:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747920604; x=1748525404; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tx8vZFDZpMbO+Kg6fLcfBD8qiDuWKhB/aBNAjV7446I=;
        b=mhO05wWQ9YqMh6UGU0abrk4mjom7qa9zInvbNFYaT4zDMrvpPZklknLrp7Icw6Pdms
         hsYuwgHWuVNMLHjSNz8DuwQ2c/ctYYuzhVW6/hhdeC4YWavRPn9uRpglubDZ7VACQ/JQ
         esF/h9I1ql/XJUm8V/sOKf2WEOAfT9oDsLd/5mnQ9qo80Ji+mM7RCDXigdJhqvh4EPwX
         a6bh//X6W4xYE5VXhQDsuXM8fQEm+pgT7nZ91jq5Mw2tU1Cn2tkcBr/SpmN8+V2INdyp
         GpXgCJoLosIPfuJtcpBzQ8doYx7r/C1x3KecnExPLKQ9fVKG7qSkvhlpxa7Oltgtw096
         t2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747920604; x=1748525404;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tx8vZFDZpMbO+Kg6fLcfBD8qiDuWKhB/aBNAjV7446I=;
        b=HlfsAtCciF0ls4CTCeHRISiQwxYi65xndKtZRUDx7G15R0BdUBsbBZ48zVGpXJY96W
         W/V4wPfr2DL6bHdqCgNFraypR3H78RCHo7ssz7BMMN4RTSVnb0VD17+lDr85L0oC/qJR
         JdNtB9UckRdHbWHd4KfPfj0wFQyhg/HY0krwj17D0Rm2U7fYwjFidFW6aNJuM9oBIkce
         kfUBqxBKTam3XkroEjXU/drrn6j/7eZs++9ZmNadRhurbDMwOyH5QROJWEWHKAgVMIb2
         NEORz2GFMHMfhmKGuHYxSCCb/ou1Tj2ttnizIjwjVQI1twRtiD9fy3JKCpSgWGgmmbOu
         CP+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7GamBlsUSLmSARCkfHrXE6bzTxGHmyt9qFbVW4VmYhHQj8tYqdq6St18R2xRzmhd5DZpdR1YDH4CXGA==@lists.linux.dev
X-Gm-Message-State: AOJu0YycTgClp/g2WlhW69N0NQ+9TqgJeJJcBM8SzmRHrC30GIR93yvi
	2Mc628hyb3BledqYqVwUcQeRe77G49i0zerQGkWoUiHJQmdeshH3l670c7x4f/CR/S642PqtA+I
	oQ8EI4FS4TPL3lP+mQ9KTrgEMNznzniQX2Sk+u4O3hQ==
X-Gm-Gg: ASbGncvZELREzL9OycY6yZxp4C7TKaB83OphoESJnFOIJiqUHyWmb7/HC0FqLWiQlTB
	QPV+lghWqSj04C+MlRvW4QQs2sgc8BK3UqA5ubmui1/KB5WtfjUrzW8/wuekg0q2QXrrSRw9FSZ
	pBCuVDXk/oTxJY9bcG4cNJNZ+5I5KJUSUbT32PSZSh9omRLYlhV3+vMKywb273X6xoeg==
X-Google-Smtp-Source: AGHT+IGrsi4YeCwF+gsQk3AjFpqFQrgmg+CFW2hddWEvAMNinJZ1EJNY3oA1upi+6Yf3kxEJfATUWZY7yhYbYr2g7fA=
X-Received: by 2002:a67:e701:0:b0:4da:de8d:9e34 with SMTP id
 ada2fe7eead31-4dfa6bfc5b9mr25918306137.19.1747920604094; Thu, 22 May 2025
 06:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 22 May 2025 18:59:53 +0530
X-Gm-Features: AX0GCFvDM2W9SugJkICsPS9liVtWMt8HZYA63Ym2Osx1MzkHItI7ZrZ35OaG-WU
Message-ID: <CA+G9fYv08Rbg4f8ZyoZC9qseKdRygy8y86qFvts5D=BoJg888g@mail.gmail.com>
Subject: riscv gcc-13 allyesconfig error the frame size of 2064 bytes is
 larger than 2048 bytes [-Werror=frame-larger-than=]
To: linux-bcache@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: kent.overstreet@linux.dev, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on riscv allyesconfig build failed with gcc-13 on the Linux next
tag next-20250516 and next-20250522.

First seen on the next-20250516
 Good: next-20250515
 Bad:  next-20250516

Regressions found on riscv:
 - build/gcc-13-allyesconfig

Regression Analysis:
 - New regression? Yes
 - Reproducible? Yes

Build regression: riscv gcc-13 allyesconfig error the frame size of
2064 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
fs/bcachefs/data_update.c: In function '__bch2_data_update_index_update':
fs/bcachefs/data_update.c:464:1: error: the frame size of 2064 bytes
is larger than 2048 bytes [-Werror=frame-larger-than=]
  464 | }
      | ^
cc1: all warnings being treated as errors


## Source
* Kernel version: 6.15.0-rc7
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 460178e842c7a1e48a06df684c66eb5fd630bcf7
* Git describe: next-20250522

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/28521854/log_file/
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250522/testrun/28521854/suite/build/test/gcc-13-allyesconfig/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2xRoAAw5dl69AvvHb8oZ3pL1SFx/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2xRoAAw5dl69AvvHb8oZ3pL1SFx/config

--
Linaro LKFT
https://lkft.linaro.org
