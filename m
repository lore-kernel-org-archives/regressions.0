Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6148378D79
	for <regressions@lists.linux.dev>; Tue,  7 Apr 2026 19:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775591949; cv=none; b=koHvAqwNS9qX/Y0rEut3UppqHwPmXnIbVjxUteXGQ8/YTfZQnJ7VRueRBLEh7i9gMyT7ERBWaKrACxJmIBZZ3PlbYwv32OMP8dDipnXh3rfj8Z/oLpzfUU0h/uAz3C2EoFMZ1KPflIcgqO+tbAKVuP/QByeewUnO3+KoEAC3nnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775591949; c=relaxed/simple;
	bh=S1tM7xxkwMcLDeM+v5C4JaBV9zHjD4x0m0RPTYT2ZQM=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=TfuO/dvNLGqFdHP0mdZRHnBPO79DM0YTMKfPbiy+PjkldsjWvxQwbeIXwX7f2fKDSiz3Rcq0f0YO6z2d+q0zmDl5LZQTC9fF7+L87sFCra3XmF22vRnf6VbQBIoTogU3b9C3rF2K90RC0/sfBvfLOhXNSXyz66a/BbrwUphv/Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b=FdExVU6y; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b="FdExVU6y"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c0b72dac7so3129877c88.0
        for <regressions@lists.linux.dev>; Tue, 07 Apr 2026 12:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20251104.gappssmtp.com; s=20251104; t=1775591947; x=1776196747; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUQmqyYQE+hXgJyhVywm3Cr2ZTnXA9Aogk5fIhY1BOo=;
        b=FdExVU6yLIcn+kUpH4ztotUeYuyPYOEgid0EUnoTW9HPp5QZ6Op30wwjZ53vz8wbLk
         xBHuTPkc/oCDx20Luap6a55J6xeR6lSQSQcAtTWCkOh6jbsVyDOBdtiBmVNAWMbjIeG9
         rfji6sdU5cJ4xIS48UlHoUObE0CMBVexl5WSRjr4qTnZ6HwUQK5beOymkyo3guMRW4IT
         erej+3hb+X38kBVAASKoqJaBMGrK0e8rgkymu2GG3XRLZkqOtKKJmYbHVgFZN75epo10
         p8hsKS6N5q+Dl0bLbib0SgHTSziHRXODP7sbiIEuyKMItEjcOnxTnD2g4qLZWBN4VDyA
         M8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775591947; x=1776196747;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUQmqyYQE+hXgJyhVywm3Cr2ZTnXA9Aogk5fIhY1BOo=;
        b=jx1lh4ohZWC4fIYKpCnL5aYeSHy3YxiTDlyLszuh0EbnXJ4XQg9WyeHaryOKH0KTlA
         9SYBsdv9idgqvFndfAmNYCVgWpvYKWYMc5URy30+cTEtgrVctPlXbdZVKZkt5laj/uzs
         GvnFZUpBAfu8g0WCJf1z0pJxlc277TZidTfi5VWR2cZV8qkApN1+LwHeMfiOZ2lOAvbk
         1HT8+1iUYKocnlisWZjtoBTZaog4Y1b3nAw49YcuexChtDfgLkcMici+tLNkeVAtXuPg
         fpiRi3JpYDs54I5D7zGnaFRhK9XPJi2juyez6WWg7fKI15wVkvGHVhxjsGPKFkaeU/4v
         tSnQ==
X-Gm-Message-State: AOJu0YwQ0I3fzzkkQ8FeZl7YHi8qnSEeA3a1MKtSz3naHSVeO5hIJ+hf
	JBhpAewHK558HNqByFj/F9vxUkhsMP1e5LxAwQ/X1CMtLT5vrVsbirjvyess5+FB68A=
X-Gm-Gg: AeBDies+f+UJvtFPpUjpi677LOsvnZTNcFqjz8w5awNm51p++Us8cYlaifTN2gX3206
	JvEt7sxtW39X2b3D+mNPJgGhmENdjh+m7syD9xm2JNs3r9GJwyR/Qh9xKOCC8/Os3peZr4GQdfA
	yR9COfOTAXm/ax50qSOEX//8oFIIjslj1v0LEnnCG2tpXsHuipc7NtaeZ+uPNvTO3aIB/xJjeXC
	5c8dEkDJKzkmxXK4g5ftTjF/b8GYlMxocAicgT9qxU7FCBI6s0uiD3Q43G3gb/zg9HkOorX5yvc
	hl0uf50BqGLr7tMqtqZu4urlm2XJyVXQzhRsTaF+7MrplsQah7cobncqSp5aUMDcpNRUqMbuyEv
	GxZ9V3rLkihsnqXwQyvk19NokiACXYBf2ZRI4z6Tc3Y2CZp8vL8iT/zsfv5qb8ADtYxGQUJMab1
	HTi35pFMuMdhQQS+l4
X-Received: by 2002:a05:7022:48c:b0:128:d084:e921 with SMTP id a92af1059eb24-12bfb70dd27mr9063418c88.14.1775591946954;
        Tue, 07 Apr 2026 12:59:06 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c05a7beffsm10288281c88.15.2026.04.07.12.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 12:59:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in testcases/gcs_prot_none_fault
 (Makefile:31) [logspec:kbuild,kbu...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 07 Apr 2026 19:59:06 -0000
Message-ID: <177559194572.2512.15758446934555092532@8692ffc4d55e>





Hello,

New build issue found on next/master:

---
 in testcases/gcs_prot_none_fault (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:92d05402b9a3c69737356c89fcc9f803eb4cb3ad
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  f3e6330d7fe42b204af05a2dbc68b379e0ad179e
- tags: next-20260407

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+kselftest on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69d51d79dcae953c056f965f


#kernelci issue maestro:92d05402b9a3c69737356c89fcc9f803eb4cb3ad

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
