Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A1D304BC6
	for <regressions@lists.linux.dev>; Tue, 19 Aug 2025 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596290; cv=none; b=H0y1ZKqkDfftpZGJ0yXbxDMnRIfsdtn+foCi4rTWzVYuiThsFEjCcVVhntBaThypzgkXRhcf96423HQbmQujTpQyucwaMkbCFkdU2vzrHGgADmrOKqsYNBp+SmDEkhd6OZrNjZA3RgqJGpZhHhQaKiDM0RzpJj1Mj8NEfsqw8cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596290; c=relaxed/simple;
	bh=2V8M7LV7ljgsDumKXBHQhC4o9NF1oxLIPIk0ANfKKUU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=KTTJrNkF8/Vt1FNS89dQu3/8CL6TygaoGBzIVv6Kp5dFii+snQtSQ5UmNS6TRA566yRPlbOCya/6O371GQ3RH14Pi6ugvL6gW8A0PP/IZwc/WWB8qF7TQardarFtBI++9KA3QGM8lY8+7Qvjhzuy7DDJoW+C8nw95DkofAjXqU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tGm5Cu4W; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tGm5Cu4W"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24457f47000so41846875ad.0
        for <regressions@lists.linux.dev>; Tue, 19 Aug 2025 02:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596288; x=1756201088; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T6K8gy0h4bXhy9f6BhVNVyKHxXc0oXpO4f2ZuZ3PvLY=;
        b=tGm5Cu4WGiC9EtMaq8lYPrIJ1Xc/b/OMz6ASpCtEUUiyBjEv9CRrzRoRfGXusYG9iQ
         ETwQbx9DwejwPSj0xO8hWVnD9MSOKaQR8XCqQf8TclN/kopkwuWIZAo8+sN4rJdhw732
         9JOhfZrpS65asfi7qTnfYIHKbQqHZQGCsHoawrmlWhqDJ6ceSI6eW76kWTRdQqPSyZyW
         eiNaNAS6NH4dPfPr4cnzXxlFeJnNuO+voldolLEhYn5EP+PBwnBaOWtfHMBraYSobFN6
         pJA4CJ1o91YSca4V550wY+wKt0TOKePYnANnDIM6RpPcK1KwHjMXSsiJ6wX4du+xHVd5
         vwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596288; x=1756201088;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T6K8gy0h4bXhy9f6BhVNVyKHxXc0oXpO4f2ZuZ3PvLY=;
        b=Zt9FtIzoBWg+oYql8nu3eDD/8lZigBDT9VvISmB4D9CO7bwa9mIT0fBw1I1OEzr8Db
         HdqAqZLVfNphLxrzjAPte88amBSsL1N4ke6yOiRYblpEMgZWJ5VaVdAQB+GqqFETT7Sx
         +drZIGnI7t6v786qtRE9FPFtcD4FwQcZlEiffO8vaN7wxx282ICCZj4oKm5ze7YuetCX
         jIEK/kaLZ1gs7wF1XJ5PLoKeHPyX6drnuoczG5/BbEyDgrGOnT/DV5Akfm4RxAgZp3Nr
         3Clw+PBzNW5Ao+ESDqLbou3XmKxkojVrGmrjImFddJRhsFcsGVd+Fmuj0AIWz3TYtk7t
         yCmg==
X-Forwarded-Encrypted: i=1; AJvYcCW1oLDFt+cBTuQ+eHejpdIvxTy3gtfQsTnNFNu37ZqDN79oif45wMKyHIEr6/xwJnYqc5N286L9n0f5dg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQaqsii0Mj4lvH4GGR3Hns3sQzt9Zu07V1wbCOSBkBY2OFz1uk
	6YXA3mlkbmAFZC5suiRLyNCu6kz5tlaQxgDyToIjlrrqK8NYZgBj/rEIr9GNOi5Bo5q7ENB8AwC
	6xD9z78PT+1fpU0GYiA/KHzM6fCaDInaHX0GPkOyxog==
X-Gm-Gg: ASbGncsFMdXz9gOtJjpijET5NwGRIFCDuTd91+HEcBVu2vgJNikBvoFgndmpITDGiru
	VB77TqHlkcv6w++liy64RQ22Nf8/ah3MNaW1wtAYiJWnHzCnQ3z7qSsI5mt48DhmoL9PxN9xxXV
	sr+Wmji3Qgze9CIlGfAXvfl34r+ZTHjAwyrPMsK3udnzZ6OV3LhSUSfv/cSpLyOiXBKjpqEnMRz
	ytX0KZWokEdyf8SpBcTe2vheRI/GUjS3VzF4TVCjnIEZhDaVc4=
X-Google-Smtp-Source: AGHT+IFIxdv+Gumf/6w+v7ffwNzZJemUXI7WRTzzUiAmKNSzZs75iWdEANwcTsNoYtnMKamFklfbi/D3t+vz0EWJMZw=
X-Received: by 2002:a17:902:f609:b0:234:ba37:879e with SMTP id
 d9443c01a7336-245e049e36cmr28797065ad.38.1755596287861; Tue, 19 Aug 2025
 02:38:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 19 Aug 2025 15:07:56 +0530
X-Gm-Features: Ac12FXzSzL7CxVGEj_WaufEFOr4fMyspvQA0mI9KFbrlZz1H1yL9N-ZCIEodprQ
Message-ID: <CA+G9fYuY=O9EU6yY_QzVdqYyvWVFMcUSM9f9rFg-+1sRVFS6zQ@mail.gmail.com>
Subject: next-20250813 s390 allyesconfig undefined reference to `stmmac_simple_pm_ops'
To: open list <linux-kernel@vger.kernel.org>, Netdev <netdev@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	linux-s390@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Jakub Kicinski <kuba@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Ben Copeland <benjamin.copeland@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Build regressions were detected on the s390 architecture with the
Linux next-20250813 tag when building with the allyesconfig configuration.

The failure is caused by unresolved symbol references to stmmac_simple_pm_ops
in multiple STMMAC driver object files, resulting in a link error during
vmlinux generation.

First seen on next-20250813
Good: next-20250812
Bad: next-20250813 and next-20250819

Regression Analysis:
- New regression? yes
- Reproducibility? yes

* s390, build
  - gcc-13-allyesconfig

Boot regression: next-20250813 s390 allyesconfig undefined reference
to `stmmac_simple_pm_ops'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
s390x-linux-gnu-ld:
drivers/net/ethernet/stmicro/stmmac/dwmac-rk.o:(.data.rel+0xa0):
undefined reference to `stmmac_simple_pm_ops'
s390x-linux-gnu-ld:
drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.o:(.data.rel+0xa0):
undefined reference to `stmmac_simple_pm_ops'
s390x-linux-gnu-ld:
drivers/net/ethernet/stmicro/stmmac/stmmac_pci.o:(.data.rel+0xe0):
undefined reference to `stmmac_simple_pm_ops'
s390x-linux-gnu-ld:
drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.o:(.data.rel+0xe0):
undefined reference to `stmmac_simple_pm_ops'
make[3]: *** [/scripts/Makefile.vmlinux:91: vmlinux.unstripped] Error 1

## Source
* Kernel version: 6.17.0-rc2
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20250818
* Git commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
* Architectures: s390
* Toolchains: gcc-13
* Kconfigs: allyesconfig

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29579401/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250818/build/gcc-13-allyesconfig/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/31RcVYdjsdhroYxXs4TJYixUCaE
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31RcVYdjsdhroYxXs4TJYixUCaE/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/31RcVYdjsdhroYxXs4TJYixUCaE/config

--
Linaro LKFT
https://lkft.linaro.org
