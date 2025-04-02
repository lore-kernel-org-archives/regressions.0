Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13860233D72
	for <regressions@lists.linux.dev>; Wed,  2 Apr 2025 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583508; cv=none; b=aJhvn8j5tNmSrPyOdUrEtp4wQ5PeV5pRFIwMF4UZVO/OP9EcbpnlwW8KVYDtdXzw90r0S5HXiK0r1ozMPlqulFIfktuWVXWHYtgcxZhYY4ilcQaa1hio9DF1pTdb6BP8G8gxzcwtEUeTypV6+1oj3L+ahHoEV1G1BSD/IV/HgdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583508; c=relaxed/simple;
	bh=MYXtt+F82yFU/HF8RGrdrV4yjQ+SYvY33Hbn9q1VIBk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=tSVERksbkiv+TQNi0nuvG8jdNjXpdHrzgNOcbc9retOJwuCSaSN5rhnQhbu4g7D/t0nHdOZtn+GdaITVvcXHjnXR0bX+Bntbffy8b4cjgS15yRok62ZlLdWyVr6yoJrin2mgb5UxG6kG3cSskL7nExRMX4qbod27GgdJFAEykC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wR4QjxTz; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wR4QjxTz"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86f9c719d63so2662408241.1
        for <regressions@lists.linux.dev>; Wed, 02 Apr 2025 01:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743583506; x=1744188306; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hgDb3fVVBUB/IfzwnOD3L78L7lK+HAMvWH+VtOqC03g=;
        b=wR4QjxTzcMVw9+QAvfwjM9yk41SaoASXXN5JXRHSBpYQnfccFML5s5McGleAvu1KZ7
         vQuY5PdRtIwbW4/Z+gh8/p3dZvvYoD7NeYzuBFW+XGgGE+Py0BIOde3LETXCEAYl2kh5
         /+atH70mjvlw5RffFLQScbhY5rlpP3ro4eTY5/9PxiaLEaykQFdxWKCQipTjdcrnWodv
         xIpBkT+CH9esYJ8HXUrHc0Hx2DCCPHbyUOM848gJCkY4XvGSsCLBtB1K1FVAWyZM74FL
         gGvla3vYGn0paLlAvt8Nnlw5nVpm+km9emL4pJDqy9dPxDSnD2GYf4AQk5P8Yzd+/sdg
         gGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743583506; x=1744188306;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hgDb3fVVBUB/IfzwnOD3L78L7lK+HAMvWH+VtOqC03g=;
        b=EUSWT7L+EKsbnJaSCSMgQF51KwVyEcio30ferJ67ouT1AfdBgp4aN7Z8MIC4c/ILRW
         H5bLP4ugu5dkqGMnkwwtdme/I2qf7quZiybNrRlBB51+tj+E544D56ySgoLc+2l79MQE
         WJjrxn8DeHA+DLzkTaeibxsuaI71w6t5REXPNmNwQIoKyk/AbXeze9ZY+eBPMcD95Yaj
         bTmhShqjj8IWmQhz9W1ciW2tUJ/HrSPUAFvv2dZt3Ihm8qLKrQauAcjfGWE6V2nLf3sl
         I3UTkQBJh1k0vpN0bIjQSJzuuu2ytvyGAaOE6+Ob+69HCv62MSAnXJ7zlgGO8hrPT3QR
         oAHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/7XurWj0Nqp19LnCbx4FWO7u31bODnt7Qod3JFU5kQ/T/O9/QMZlDj4VvqiTYimzzlehn3hJqveh6zA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgSn++7iT9j87p2HLx+Q4lhVZeKa3jmbUYoWMUK5QG8SwWwKNd
	QieK0aWXlUs8uhXlzIeWVt9XbFz8G8dcCGbCEye7kyfLwQ59J1QcJnwOnbelwJCWvh2F+Z7ku0s
	CN5VEfkENZjRoKYG5G5XPNSOZOQjGK6lunKcRXw==
X-Gm-Gg: ASbGncsxD/ZYk/rhEOLA3XCs5swPGqWQARusqWQEFg/Rn/SQXvADf1Hfhj9nk5Nw+fy
	UQ2gSC9fUTJoKlBVFPUSZ8I+6yLVsNw/ggWnosV8QpvmyxCTYdOuwax2hWV/a+VDxxIx8Rdpysk
	Cc4WYJHMRnyHuIAQssqWt81XvjUlxg5G8ip0Jcf9Kg1hUaTmX7HLJccBokLUs=
X-Google-Smtp-Source: AGHT+IE8fq6fgnNiBlF4pjBGjNOCQgZFHKYt+jyYnPaGvFt9HHKIIGxzApITzblIW2SBZ/TFBbSfqRsVUBxL6jzuEN0=
X-Received: by 2002:a05:6102:c12:b0:4c3:9b0:9e6b with SMTP id
 ada2fe7eead31-4c6d384b3d2mr10951298137.10.1743583505840; Wed, 02 Apr 2025
 01:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Apr 2025 14:14:53 +0530
X-Gm-Features: AQ5f1JosHeaxk-JjURpm99TBi1ldYeuLUsjGtGWwli-pgYAQe5pPal7OZ5w-kuQ
Message-ID: <CA+G9fYtdXHVuirs3v6at3UoKNH5keuq0tpcvpz0tJFT4toLG4g@mail.gmail.com>
Subject: qemu-i386 boot failed on mainline master - no console output
To: open list <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Vinod Koul <vkoul@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on qemu-i386 devices boot tests failed with defconfig on
the mainline master no console output.

First seen on the char-misc-6.15-rc1 merge 25601e85441d ("Merge tag
'char-misc-6.15-rc1' of...)
 Good: [08733088b566b58283f0f12fb73f5db6a9a9de30] Merge tag
'rust-fixes-6.15-merge'
 Bad:  [91e5bfe317d8f8471fbaa3e70cf66cae1314a516] Merge tag 'dmaengine-6.15-rc1'

* qemu-i386
 - boot

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Test regression: qemu-i386 boot failed on mainline master
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Anders bisected this to,
  # first bad commit:
    [eb0ece16027f8223d5dc9aaf90124f70577bd22a]
    Merge tag 'mm-stable-2025-03-30-16-52' of
git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm

## Test log
<No console output.>

## Source
* Kernel version: 6.14.0
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
* Git sha: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
* Git describe: v6.14-12245-g91e5bfe317d8

## Test
* Test log: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/anders/tests/2vAGjk1bqJ8kqDGEyo2jXerYOcR/logs?format=txt
* Build link: https://storage.tuxsuite.com/public/linaro/anders/builds/2vAGjX8EjBsjTTOgIxZswnitDbF/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/anders/builds/2vAGjX8EjBsjTTOgIxZswnitDbF/config

--
Linaro LKFT
https://lkft.linaro.org
