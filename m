Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25271514F6
	for <regressions@lists.linux.dev>; Mon, 26 Aug 2024 12:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724675833; cv=none; b=slj+P6KW2A1JCJ2c5U3RMrSzJkgrkrGjMj4nl4kZS0Cb4khww4Q0TNTWsmJK4JiE+rOGm3NY5HRG/SEzEdiuor/Fus0O/ABHYxoynK2BHZRkh0VLWyRa/T9234og7IssF1AVBe9GfeFPzS23xpaYfouEghEo6tnTJxH4XTvXJZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724675833; c=relaxed/simple;
	bh=tU+F06KD3SdlqkzAX+oRdzXbf4TrB4rlKRMryvYWuqg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=glI1fJsGLdYPoWDphvE6UmyxuQsagbCv2SQ3MNJIb5RNNzzNr0SltO4UzKkFDmNqrD4aje5Ng4OnWEBMb2XmUDQqbIjf4ypPDF7xtN90aPQl66ZLwS09qGuNtjUxIubZAWPK9RuerWw2ipxDZbUrnfeNkLGD9OP8LBzOgB0zRiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ACLeVyXn; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ACLeVyXn"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-843046a99e3so1102691241.1
        for <regressions@lists.linux.dev>; Mon, 26 Aug 2024 05:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724675830; x=1725280630; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BnaTwyls60538rF5sTUN3uFvzG458NrPK/zbgy32n6k=;
        b=ACLeVyXnU0ilVrBvGC6g0mWmkKBtxxjWbprppGMzpZJcATvhivaeS/sH+qOmrJZbIv
         m8jhvWM5A8di7MVMcT0iFOCcAs6JurhUxS+hQr0PrFSEf22FN4SKKWGRqumhXsK6VSyI
         Pb9wyMDBJPVLOvgAoGoskv18g8WoP8b48WPy38J9GKyucxrde24ujaSK2+wgiM4RNXij
         RGeopJnFe9pYn+cAr9skjIBgaAe+qD7m4NPM0M36BoQDBOg9KKBq/9et+HvmyRWJz87w
         VJJP44rB84KQ/CYXeiRtcKvdzNwBwcTlOPZ4z0m3no3cnt8SHGjzTtX316YEkTsoJiTY
         10/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724675830; x=1725280630;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BnaTwyls60538rF5sTUN3uFvzG458NrPK/zbgy32n6k=;
        b=dQj4Ow1HpRtm5fPh0yJDhObU0PuUJAohEHvnqU084wGjK0YZWU217lNWzec5d4HZI6
         yAFsSP+pv+a45GqaNCxlYah2+1nWdAlfSlLiC2tAyof+CBOvvmY9qhf7K5IvmV/TG1j9
         zP3jOSwRc6/h5c8xlljCXBSXP4ejis0L9G7eRwm11jmKJT/Xnb64cQ3lM2qaS3ubk2Sn
         hhIyHnk5x91o/oMleulh7KyZ3E7wwsaeJpdijhSQLxQJuyJfl96Ou4fgcCrRm9ZiK3Lp
         dtX/KPo5tfim1Al39veEVVr4n8H89jV42zGruMF+aIOaZ9M0d8nT8mxAZgEpzjb1i31W
         zaWw==
X-Forwarded-Encrypted: i=1; AJvYcCX/gOUf5P6LBwbxB+NrB/vlO9V0+w4TNgRPFCOQ9NR3MaeCKre8abhpyXJYjdg8Q7d2rYQ+8xQ2cyf0mQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyouNYr1iS9rYdDpoE+aZhYE/ipd6D3lcz9bVwDn05xjXuCihb3
	BwnvLjpuNWsma1iXaKQ75go/eqcCfu0DZhDih04q3B0/Yddlhc2rO2jDoCPIbs1/RGvy63Vd0b+
	Q0VbKqoZ2Y+QmUL6jWVa9LUHG+w3bebgO4p/vDg==
X-Google-Smtp-Source: AGHT+IHfFcwhCvcH2LPeasFnJgdBqYdbUpTxRYB0euddshiP0l4zYFF770aeqcEuWv3OaLuN0aR3utA/1FI7haQvsfw=
X-Received: by 2002:a05:6102:a46:b0:493:bcbd:4633 with SMTP id
 ada2fe7eead31-498f4513565mr7991472137.3.1724675830398; Mon, 26 Aug 2024
 05:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 26 Aug 2024 18:06:59 +0530
Message-ID: <CA+G9fYuTLbZ+UiONYVQbtREuOZXc3oWP5=x-qqDhmFRmFfPtHA@mail.gmail.com>
Subject: next-20240826: arm: tinyconfig: mm/vma.h:184:26: error:
 'USER_PGTABLES_CEILING' undeclared (first use in this function)
To: linux-mm <linux-mm@kvack.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

The arm tinyconfig and allnoconfig builds failed on today's Linux next-20240826
due to following build warnings / errors.

first seen on next-20240826.
  Good: next-20240823
  BAD:  next-20240826

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build log:
--------

In file included from mm/internal.h:22,
                 from mm/filemap.c:52:
mm/vma.h: In function 'init_vma_munmap':
mm/vma.h:184:26: error: 'USER_PGTABLES_CEILING' undeclared (first use
in this function)
  184 |         vms->unmap_end = USER_PGTABLES_CEILING;
      |                          ^~~~~~~~~~~~~~~~~~~~~
mm/vma.h:184:26: note: each undeclared identifier is reported only
once for each function it appears in
make[4]: *** [scripts/Makefile.build:244: mm/filemap.o] Error 1
In file included from mm/internal.h:22,
                 from mm/oom_kill.c:50:
mm/vma.h: In function 'init_vma_munmap':
mm/vma.h:184:26: error: 'USER_PGTABLES_CEILING' undeclared (first use
in this function)
  184 |         vms->unmap_end = USER_PGTABLES_CEILING;
      |                          ^~~~~~~~~~~~~~~~~~~~~

Build Log links,
--------
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240826/testrun/24951924/suite/build/test/gcc-13-tinyconfig/log

Build failed comparison:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240826/testrun/24951940/suite/build/test/clang-18-tinyconfig/history/

metadata:
----
  git describe: next-20240826
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git sha: 1ca4237ad9ce29b0c66fe87862f1da54ac56a1e8
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2lC5HukjOlVYM52f7n4rm8EXOLG/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2lC5HukjOlVYM52f7n4rm8EXOLG/
  toolchain: clang-18 and gcc-13
  config: tinyconfig and allnoconfig

Steps to reproduce:
---------
 - tuxmake --runtime podman --target-arch arm --toolchain gcc-13
--kconfig tinyconfig

--
Linaro LKFT
https://lkft.linaro.org
