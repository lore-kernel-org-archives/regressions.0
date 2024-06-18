Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86B313D27F
	for <regressions@lists.linux.dev>; Tue, 18 Jun 2024 10:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718707192; cv=none; b=RYIMJwXwFmECDYgjmHl7zQig5sq8KoRqQIbGE4JSUs7tLVUP4K+D3yo9SAIooCX8OfNZA6dGXpVc+BBD2y7zUtj/V5oSTrmCwIN1Yem6KDTVbaoOLqvbkWrZ1pv8b+BsbBFQ4cSt/s/CObwqNYHDd0YNvVfgxS70sNC9bw2qnS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718707192; c=relaxed/simple;
	bh=lPQaPdityDLfZbHzeDC8ojdjE2XvWy7QdXEXphUNQpc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ja33nlbEdXWV45msDCKKUkXhKooNfly+EGiAYxpH1yGPUz1TypFbbvyr0rHSreATQN8RQDZxaN1mePgs8Nz9XcxOJKQnHZgGLDrmIDULMaDQzQfxaWqCGjQWT8Ij00nF1LHtFoETmsWa+9cIOCw2rAhNEFj4QtVUexHXUPOgOXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FmZpCVav; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FmZpCVav"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-80b841b1b80so1348492241.0
        for <regressions@lists.linux.dev>; Tue, 18 Jun 2024 03:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718707190; x=1719311990; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QEljk6ggn8rJlURGstQGLdKQqP2HSFqBtnN4P7FNF6w=;
        b=FmZpCVavPie/BJpYuQleBI9EOppcb+6MdkrB0/YoVfK77O4hyVsxFM+vNUPgsrRFnT
         P/baQjb9/LC99tpSbCiaI6A+Kfn6TTEoMQU39ZrkgfBHt13DS29l8wit5zuj2IlrXLTW
         8FrbFIeoVadc15mua58/ziQ/KlBKBZmbfuqBrglktQcBFqMcfvJ8wvK/NiWOr/FrHEmb
         DIfwq3MvdndysBXgbLzr/U5/DdqmznrPCMyrdAFI65jCzLEx+TZEfSzmjqfSxyQzIMbH
         VJ73HdCE1BNn/0T266QM+tnaPl27nx6G90VMwsrv1O0h9HJknlJTuqvZlqBACwAb9UMU
         T6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718707190; x=1719311990;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QEljk6ggn8rJlURGstQGLdKQqP2HSFqBtnN4P7FNF6w=;
        b=fowd41wo6YsTLrtMPn39bPlxpmho5OQ1pTGzUtrYnfAUoTI+V3ogdS5GV244JM0LRE
         ZcPaMMbdpIijnLq7GAALnDL0yrOVnEcq1xNvM6vzwMomNg/h30NaUsHvVYH6f+T+YPwo
         Ps0vvhdiDojUh+KNk7ypvlSgNbQydhtsJ4dsfsye4KVsZ3LZMmnwZgHyfxbevYec0/v5
         Rbly8Ab2znJNi1nRr/UjVtsa4IZdPwkDMSRZLygyxZ41BBpaw6P/bWXxDsSxM2K5yWnQ
         5+4Jwo41Ieb3cD8YreGTxJWOsPW7uJWtCM31DSOvF7BdjdsVaDqB+lOYVXAOvlT4FoTw
         Bcbw==
X-Forwarded-Encrypted: i=1; AJvYcCVnuD9MnWdXpjsOlAFakR63aRAogeEBwY+Jt8X31xIOwGJj0CxJ+trgblDCiprl1I0fneUAWKaPN4nPWScERPIgCKbzMK2lCzO3sss=
X-Gm-Message-State: AOJu0Ywf0zkSBFWuXMmhomgaioRYxtaH9qDZyj6qprnBhl+UnqU/aBBA
	CT5UhNGVkEzm2eUeDtM+9L8EPv4KrzDHxVVzbBdRU/qtN6mjqdki5THh8sN5qL7FEsc4YlLKYM6
	YIaIGvO7ApfS2n5IbOHB1jyAEfe6XpHScipiOSg==
X-Google-Smtp-Source: AGHT+IGlfvQiDWgG3QUajDlpAVMqRKc0CBGEed89cfHiSCFaLDQXr5lx8fTA31fnYSylIf9pn2jzMiwAhKa5hARvZYA=
X-Received: by 2002:a67:f88e:0:b0:48d:920a:bd41 with SMTP id
 ada2fe7eead31-48dae38578dmr10393370137.16.1718707189697; Tue, 18 Jun 2024
 03:39:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 18 Jun 2024 16:09:38 +0530
Message-ID: <CA+G9fYvULzMHHQo3OKkcFYU+Tiw1fFU6LKbt3zHfX-E-ozcsdA@mail.gmail.com>
Subject: mm/slub.c:1163:17: error: implicit declaration of function
 '__memset'; did you mean '__memset64'? [-Werror=implicit-function-declaration]
To: open list <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

The Following build failures have been noticed on Powerpc, mips and arc on the
Linux next-20240617 tag.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Regressions found on mips:
  - gcc-12-bcm47xx_defconfig
  - gcc-12-cavium_octeon_defconfig
  - gcc-8-malta_defconfig
  - gcc-12-malta_defconfig
  - gcc-12-allnoconfig
  - gcc-8-bcm47xx_defconfig
  - gcc-8-allnoconfig
  - gcc-8-cavium_octeon_defconfig
  - clang-18-allnoconfig
  - clang-nightly-allnoconfig


Regressions found on arc:
  - gcc-9-allnoconfig
  - gcc-9-defconfig

Regressions found on powerpc:
  - clang-18-maple_defconfig
  - gcc-13-ppc6xx_defconfig
  - clang-18-allnoconfig
  - clang-18-defconfig
  - clang-18-ppc64e_defconfig
  - gcc-13-defconfig

Build log:
--------
mm/slub.c: In function 'init_object':
mm/slub.c:1163:17: error: implicit declaration of function '__memset';
did you mean '__memset64'? [-Werror=implicit-function-declaration]
 1163 |                 __memset(p - s->red_left_pad, val, s->red_left_pad);
      |                 ^~~~~~~~
      |                 __memset64

The commit id:
  ad5dde7da5f9 kmsan: support SLAB_POISON

metadata:
  git_describe: next-20240617
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: 76db4c64526c5e8ba0f56ad3d890dce8f9b00bbc

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/  -
next-20240617/testrun/24380474/suite/  -
test/gcc-13-ppc64e_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/  -
next-20240617/testrun/24380474/suite/  -
test/gcc-13-ppc64e_defconfig/details/


--
Linaro LKFT
https://lkft.linaro.org
