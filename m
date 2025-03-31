Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA493C30
	for <regressions@lists.linux.dev>; Mon, 31 Mar 2025 04:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743393832; cv=none; b=ssZM0E2Adh3usiDmcn8cqQ7e3WTLcF51VgftTj2UUJgElrmANnEvxYOvej3RuqxZJa1mk9XIrTqq0umAZoKWbhZB+aeiP7oayyqSDDcqJ2A4oEjBLKErd1AiXKyg+XIBsGkd4qA7NYadXUVdUonALb1zhH8W97fWQBXYgizHaKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743393832; c=relaxed/simple;
	bh=Ovriw1fRv9VQH8DhEJ92/4OemBiWmNygkfONdXwMWo8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=oqgwbO7Dw8Pkh+uQmPO77xD15vijVzjEemJU7EdxfLX0YAQb18dKaMbAOUPjKdJTkJJQUT+4GVOcQO0QxwMB+BRiL6GqW6kSxgfnHG4qUjg+ilCB4xdKIoA2YbSJ3t8w/5fcyE1uIq8eTjYT9BrfVDhbIB62V6A/Ab8cSmngTqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bosEQDJD; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bosEQDJD"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86d36e41070so1762576241.3
        for <regressions@lists.linux.dev>; Sun, 30 Mar 2025 21:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743393829; x=1743998629; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Eoi5ctOlZBCBuG5n3/dJiXOfEGeAUQNLilO/2EXgbE=;
        b=bosEQDJDK7Jey20xaAawjcrAD2Qv5M12Yf5THNzHF/nz2sGKbnyZhF9S7TqBAULtGM
         gfH/KFM9onqCDqr1otruALYXM/WfZlNI5sCzXlMrdBTlGl0wK2eoXWyW/LFn+hPyUQpy
         1dUlHKfXzPDuHQMiJjB0+eFLv9MJL7ed7zsK9kkJM8/2vLY/3dDaeCFWPUuoCksrIGVy
         MOOlHAqrkHI+gROVkDQbTsKISDPyphD1Y4GmyFQMMk0ylbM8WpCU0KZ21sMbAoNvcqFk
         7tMNtrreLa9IeLNeAmKAOxMsfY+/+Kwk9HlycqcgM8N0Md6dfgZedB1IjfId8eSdJH7w
         D/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743393829; x=1743998629;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Eoi5ctOlZBCBuG5n3/dJiXOfEGeAUQNLilO/2EXgbE=;
        b=urNnu/vPT/vbJ3VxgVXpIg9ajyt2ZhrMGFbVagOei2oTZBeOUgP814dALz1mzW4jdH
         OHfY6VtmPsnnXt8FZ8wQaP33zwmL4Lsp6+/LGC0f17vIFjzcPV+KUhvJcdavMu+ywVo2
         Oe8+HUTqONGL9WPnrVi7IZs5SUyT0E8T0dGkYp2pqdhaZv23bmsnaP6qOxOQBZZc81tv
         oMxCIN5N1zen4cBP10EyZKYsQUm2h+/7W6M9rDu4KAybBtI35iY4Q4cunAB8DsL9m14X
         7f3NjS4Drul9Ie4s5VyxgooTZWqgsT2y97CQfvbYiG6jG0UPLEZ/5BkDyB+xn+iSqFUm
         Csqg==
X-Forwarded-Encrypted: i=1; AJvYcCVWFr4MAP9AARM6QbeF6cjIZEikExZFQ677bpNGJ4OBUC3jgHMT59IOUyYB5je6jJ33dxnR3U95L0RGkg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhvJit+hCiBkdxf1Tx/hSefk4pjsrhwx3ZrJgPoGh1aXR3fGtM
	5tZNfOL8mML/hIw04TX2qG6iilQ6tkpwPsIDoGMrNR67ZG6vg1GLyV5M2zgLUhwoF4eF4oRCKBb
	tlcrM5SANbCDCt5mMzR4FaY3NzrP/GIOWijZaIQ==
X-Gm-Gg: ASbGncv1gkFEnrJAXSgMVf0UxSYzBSfKJAlbdT6IxbqXcMBdYwCTws0GHhSyj3x62C3
	1mjnRw6Idtk2431Jc+zlx+RrcZBjtqie3spOdjkLP523oZm6PCF3QoY58kIZDHqlL2oQk+ig7cx
	4jJrubAaUQPVGv7/lYcGziMW6HhOrxkvxwvdXnZJPclf4j4iqcCqbRCaRQpA==
X-Google-Smtp-Source: AGHT+IE+omrjH7GYgvhNd+blM0ysANeUmxf3FkJnco8pyeAxxM7AfoCsUeEAKslkGCMtq8noDXdfL+o2qkrwgip+9BE=
X-Received: by 2002:a05:6102:3e8a:b0:4c1:90ee:ab2 with SMTP id
 ada2fe7eead31-4c6d38cb31emr4067233137.14.1743393829232; Sun, 30 Mar 2025
 21:03:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 31 Mar 2025 09:33:37 +0530
X-Gm-Features: AQ5f1Jry1FfmI-B89oqlgm9LhT3dGEDfFcdu18qH63QTqu9-bEzvTnC6C9KspFU
Message-ID: <CA+G9fYt0F_vR-zOV4P8m4HTv6AecT-eEnrL+t5wgAaKPodi0mQ@mail.gmail.com>
Subject: arm64: juno-r2: SSD detect failed on mainline and next
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, iommu@lists.linux.dev, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Robin Murphy <robin.murphy@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on arm64 Juno-r2 devices detect SSD tests failed on the
Linux next and Linux mainline.

First seen on the v6.14-7245-g5c2a430e8599
 Good: v6.14
 Bad: v6.14-7422-gacb4f33713b9

* Juno-r2,
 - detect-ssd
 - mkfs.ext4-ssd

Regression Analysis:
 - New regression? yes
 - Reproducibility? Yes

Test regression: arm64 Juno-r2 SSD detect failed
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Anders bisected this to,
# first bad commit:
  [bcb81ac6ae3c2ef95b44e7b54c3c9522364a245c]
  iommu: Get DT/ACPI parsing into the proper probe path

## Test log
  mkfs.ext4 /dev/disk/by-id/ata-SanDisk_SSD_PLUS_240GB_223004A01292
  mke2fs 1.47.2 (1-Jan-2025)
  The file /dev/disk/by-id/ata-SanDisk_SSD_PLUS_240GB_223004A01292
does not exist and no size was specified.

## Source
* Kernel version: 6.14.0
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
* Git sha: acb4f33713b9f6cadb6143f211714c343465411c
* Git describe: v6.14-7422-gacb4f33713b9
* Project details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-7422-gacb4f33713b9/

## Test
* Test log: https://lkft.validation.linaro.org/scheduler/job/8188382#L1538
* Test history:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14/testrun/27742015/suite/ltp-cve/test/cve-2017-2671/history/
* Test details:
https://lkft.validation.linaro.org/scheduler/job/8188382/definition
* Test link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2uwduIsT14Pz3XEoUQQIS6ndlQK/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2uwduIsT14Pz3XEoUQQIS6ndlQK/config


--
Linaro LKFT
https://lkft.linaro.org
