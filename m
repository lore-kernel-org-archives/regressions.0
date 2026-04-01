Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F9447B437
	for <regressions@lists.linux.dev>; Wed,  1 Apr 2026 17:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775066349; cv=none; b=iDL1rizr5+RQv7La6K2irdh2/qKyn3ernh95qTP5k+jY+aO6QloTCKFtvH5P4K12wnQ88NccDZkPoiej1ZCfSFK/vsu79zYSadnGA6yxXDKNcTwPdrcc/cYDO61oR+xvKjBnPrepZ+OxDXoBNtkCKU0CZgqEoeQdPQG3/Nqk5FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775066349; c=relaxed/simple;
	bh=+sUvLdDr5nYnPTxiE7eoSvJGPnwFFDXCqvr18u6Ab1k=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=o9//4M7cuDpssXOU/kjNrZlsH/t7Jj8TggAKY9PKgQYf9MzRTzKlcj2akY+JPG9EX49qdnIcpR4ZPLIE/RKZL1C4favpVIw2fscD+2CYVjru9r60ix9Ogu4gPKxsCBx80B17LvFGwXenrjnMyeMY9/hsKt1hlM9x5mz5I77dFjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=PwmVDGqn; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="PwmVDGqn"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c7d8bbad06so187538eec.1
        for <regressions@lists.linux.dev>; Wed, 01 Apr 2026 10:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1775066346; x=1775671146; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAsmZsCNAYbkiIMbRwoyAd4TDDOEPlqrE9XamJJEtiw=;
        b=PwmVDGqnTRK+SPKOkVZSxVvg1IUE5BagHibHIWR49js2MLSXg6FABDrWz+Mi60OgRg
         dXIrEeu3c+g6JdyKF+g+lDjmdBYPb5oujaTR4eunO6pwsBUva52xh71j+zEXXt7k437u
         jQqJD9dFnPq2zywHgoDV9qxhAz9nQxiPbmbsr5xb7BYunmLI8r2xAwr18FdPQyNULFlq
         b9DYJFKLq4E8rv6tYHNM1zXKsprwF6U3kZKBdlrO+FnxKVK4DHXgK2YkH6exTQNXNTVJ
         XwCEpqDZetqqYEG8W7r1Eca7xblhvKk8Fh/Ql2NPWLtr1pYlfxFqjnU6Ct7aVuSltJv5
         lt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775066346; x=1775671146;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eAsmZsCNAYbkiIMbRwoyAd4TDDOEPlqrE9XamJJEtiw=;
        b=oCJuTl0hIX1qGDJOM8a4CEVu1rJQY74DmhAM/sIXbCU8Dr0KXL7/uhnDA1YjBi9BuE
         XGOlwocOFxB9e7wE2RRttmL015MoKHy10WgZIwsOz+DaN8mSOtQ71ku7kSY5Pc1uGRVa
         ymwWF4b9/d0+XaW3QbLtUSUMlX3nY0r7qmtak40Xosx3ilGumJZ3xpRm9EChdbwXA5Sv
         cmmbr7CXVPAm6RKbGfUCYounYJwgot9M1oaGYBZ1bvakd5Emntmj9xJyFyh8FCjwph6a
         35L5kicGb5DVFSvs80Glz6G0DvbxZ1cX7eOa/+Ir3AKEA7J5z2riuqrto85rNHc/i9cK
         nNPA==
X-Gm-Message-State: AOJu0YwUiCOp9U0TX67zXeMaB9IHNGiQ/l5aEYVKKBx14cx7RXFpooSv
	OCiKJf43vLVAvmWjdtZQgw99mrsn+XzmJHsQWpmpxo64Wn+w8AH2r+nkUbUNGAA9uQ7/dvlYBZc
	aDPUX
X-Gm-Gg: ATEYQzyyWKWUusqYopn93k8SF/rRQExvHOVhAFrl+KbUaAYRr2zNG6SKRTsTqodezGO
	NnSdaTUYvnTFQ2Axf1lvyooNIQPBo94SzH5RUxWnqDGS61Aa28darWX3BHQ+6WG1NyIPt81ctwL
	2SlrOy4dZsOdlIZmje5X4gi4WqIU4C4EdLS16OLoSGfURkQn3wfmHUkYHfLogqK48qryYFUjBBW
	xL+xxFDwR7ibY0QBThneFL4z0gr4xDTZYsRg19GJoFBcTryv9g7pWOuIZimetUL/E4ptUaTGFO0
	aY+yzAWSyI12hM+bY8o7rb4bQUNhOVFJr8qhadRj/QubG8V2xJ+fv2FTE7OnJt5MENaQoS9oM+b
	CLjASV4XPATEiClleYVqRj/asGs7wV3TuXzzcKs10JMtr5Z0gkKL1U3YtbrznPI2QkcLdXCu7cc
	jdMZ1Qu012hzFuGutLLPrnaiy86ws=
X-Received: by 2002:a05:7300:2150:b0:2c6:31f0:a025 with SMTP id 5a478bee46e88-2ca9047cf7bmr160622eec.27.1775066345846;
        Wed, 01 Apr 2026 10:59:05 -0700 (PDT)
Received: from 984b78e0ad75 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7d31c7c6sm337995eec.31.2026.04.01.10.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 10:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?b?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpIOKAmFBSX0dFVF9TSEFE?=
 =?utf-8?b?T1dfU1RBQ0tfU1RBVFVT4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlz?=
 =?utf-8?b?IGZ1bmN0aW8uLi4=?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 01 Apr 2026 17:59:05 -0000
Message-ID: <177506634493.1099.8394888702082972052@984b78e0ad75>





Hello,

New build issue found on next/master:

---
 ‘PR_GET_SHADOW_STACK_STATUS’ undeclared (first use in this function) in testcases/gcs_frame (testcases/gcs_frame.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:c8166ec266c9f21b9901ef8c8c40af93cf32eeb0
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  bd0f139e5fc11182777b81cefc3893ea508544ec
- tags: next-20260401

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
testcases/gcs_frame.c:27:21: error: ‘PR_GET_SHADOW_STACK_STATUS’ undeclared (first use in this function)
   27 |         ret = prctl(PR_GET_SHADOW_STACK_STATUS, &expected, 0, 0, 0);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
testcases/gcs_frame.c:27:21: note: each undeclared identifier is reported only once for each function it appears in
testcases/gcs_frame.c:53:33: error: ‘GCS_MAGIC’ undeclared (first use in this function); did you mean ‘ZA_MAGIC’?
   53 |         head = get_header(head, GCS_MAGIC, GET_BUF_RESV_SIZE(context),
      |                                 ^~~~~~~~~
      |                                 ZA_MAGIC
testcases/gcs_frame.c:64:16: error: invalid use of undefined type ‘struct gcs_context’
   64 |         if (gcs->features_enabled != expected) {
      |                ^~
testcases/gcs_frame.c:66:28: error: invalid use of undefined type ‘struct gcs_context’
   66 |                         gcs->features_enabled, expected);
      |                            ^~
testcases/gcs_frame.c:70:16: error: invalid use of undefined type ‘struct gcs_context’
   70 |         if (gcs->gcspr != gcspr) {
      |                ^~
testcases/gcs_frame.c:72:28: error: invalid use of undefined type ‘struct gcs_context’
   72 |                         gcs->gcspr, gcspr);
      |                            ^~
In file included from test_signals.c:17:
test_signals.c: In function ‘main’:
test_signals_utils.h:34:55: error: ‘PR_SET_SHADOW_STACK_STATUS’ undeclared (first use in this function)
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals_utils.h:34:55: note: each undeclared identifier is reported only once for each function it appears in
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
In file included from test_signals.c:17:
test_signals.c: In function ‘main’:
test_signals_utils.h:34:55: error: ‘PR_SET_SHADOW_STACK_STATUS’ undeclared (first use in this function)
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals_utils.h:34:55: note: each undeclared identifier is reported only once for each function it appears in
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
In file included from test_signals.c:17:
test_signals.c: In function ‘main’:
test_signals_utils.h:34:55: error: ‘PR_SET_SHADOW_STACK_STATUS’ undeclared (first use in this function)
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals_utils.h:34:55: note: each undeclared identifier is reported only once for each function it appears in
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals.c:31:31: error: ‘PR_SHADOW_STACK_ENABLE’ undeclared (first use in this function)
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals_utils.h:35:61: note: in definition of macro ‘gcs_set_state’
   35 |                 register long _arg2 __asm__ ("x1") = (long)(state);     \
      |                                                             ^~~~~
In file included from test_signals.c:17:
test_signals.c: In function ‘main’:
test_signals_utils.h:34:55: error: ‘PR_SET_SHADOW_STACK_STATUS’ undeclared (first use in this function)
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
In file included from test_signals.c:17:
test_signals.c: In function ‘main’:
test_signals_utils.h:34:55: note: each undeclared identifier is reported only once for each function it appears in
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals_utils.h:34:55: error: ‘PR_SET_SHADOW_STACK_STATUS’ undeclared (first use in this function)
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals_utils.h:34:55: note: each undeclared identifier is reported only once for each function it appears in
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals.c:31:31: error: ‘PR_SHADOW_STACK_ENABLE’ undeclared (first use in this function)
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals_utils.h:35:61: note: in definition of macro ‘gcs_set_state’
   35 |                 register long _arg2 __asm__ ("x1") = (long)(state);     \
      |                                                             ^~~~~
test_signals.c:31:31: error: ‘PR_SHADOW_STACK_ENABLE’ undeclared (first use in this function)
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals_utils.h:35:61: note: in definition of macro ‘gcs_set_state’
   35 |                 register long _arg2 __asm__ ("x1") = (long)(state);     \
      |                                                             ^~~~~
test_signals.c:31:31: error: ‘PR_SHADOW_STACK_ENABLE’ undeclared (first use in this function)
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals_utils.h:35:61: note: in definition of macro ‘gcs_set_state’
   35 |                 register long _arg2 __asm__ ("x1") = (long)(state);     \
      |                                                             ^~~~~
test_signals.c:31:31: error: ‘PR_SHADOW_STACK_ENABLE’ undeclared (first use in this function)
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals_utils.h:35:61: note: in definition of macro ‘gcs_set_state’
   35 |                 register long _arg2 __asm__ ("x1") = (long)(state);     \
      |                                                             ^~~~~
In file included from test_signals.c:17:
test_signals.c: In function ‘main’:
test_signals_utils.h:34:55: error: ‘PR_SET_SHADOW_STACK_STATUS’ undeclared (first use in this function)
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals_utils.h:34:55: note: each undeclared identifier is reported only once for each function it appears in
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
In file included from test_signals.c:17:
test_signals.c: In function ‘main’:
test_signals_utils.h:34:55: error: ‘PR_SET_SHADOW_STACK_STATUS’ undeclared (first use in this function)
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals_utils.h:34:55: note: each undeclared identifier is reported only once for each function it appears in
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals.c:31:31: error: ‘PR_SHADOW_STACK_ENABLE’ undeclared (first use in this function)
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals_utils.h:35:61: note: in definition of macro ‘gcs_set_state’
   35 |                 register long _arg2 __asm__ ("x1") = (long)(state);     \
      |                                                             ^~~~~
In file included from test_signals.c:17:
test_signals.c: In function ‘main’:
test_signals_utils.h:34:55: error: ‘PR_SET_SHADOW_STACK_STATUS’ undeclared (first use in this function)
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals_utils.h:34:55: note: each undeclared identifier is reported only once for each function it appears in
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals.c:31:31: error: ‘PR_SHADOW_STACK_ENABLE’ undeclared (first use in this function)
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals_utils.h:35:61: note: in definition of macro ‘gcs_set_state’
   35 |                 register long _arg2 __asm__ ("x1") = (long)(state);     \
      |                                                             ^~~~~
test_signals.c:31:31: error: ‘PR_SHADOW_STACK_ENABLE’ undeclared (first use in this function)
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals_utils.h:35:61: note: in definition of macro ‘gcs_set_state’
   35 |                 register long _arg2 __asm__ ("x1") = (long)(state);     \
      |                                                             ^~~~~
In file included from test_signals.c:17:
test_signals.c: In function ‘main’:
test_signals_utils.h:34:55: error: ‘PR_SET_SHADOW_STACK_STATUS’ undeclared (first use in this function)
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals_utils.h:34:55: note: each undeclared identifier is reported only once for each function it appears in
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
In file included from test_signals.c:17:
test_signals.c: In function ‘main’:
test_signals_utils.h:34:55: error: ‘PR_SET_SHADOW_STACK_STATUS’ undeclared (first use in this function)
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals_utils.h:34:55: note: each undeclared identifier is reported only once for each function it appears in
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
In file included from test_signals.c:17:
test_signals.c: In function ‘main’:
test_signals_utils.h:34:55: error: ‘PR_SET_SHADOW_STACK_STATUS’ undeclared (first use in this function)
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals_utils.h:34:55: note: each undeclared identifier is reported only once for each function it appears in
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals.c:31:31: error: ‘PR_SHADOW_STACK_ENABLE’ undeclared (first use in this function)
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals_utils.h:35:61: note: in definition of macro ‘gcs_set_state’
   35 |                 register long _arg2 __asm__ ("x1") = (long)(state);     \
      |                                                             ^~~~~
In file included from test_signals.c:17:
test_signals.c: In function ‘main’:
test_signals_utils.h:34:55: error: ‘PR_SET_SHADOW_STACK_STATUS’ undeclared (first use in this function)
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals_utils.h:34:55: note: each undeclared identifier is reported only once for each function it appears in
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals.c:31:31: error: ‘PR_SHADOW_STACK_ENABLE’ undeclared (first use in this function)
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals_utils.h:35:61: note: in definition of macro ‘gcs_set_state’
   35 |                 register long _arg2 __asm__ ("x1") = (long)(state);     \
      |                                                             ^~~~~
test_signals.c:31:31: error: ‘PR_SHADOW_STACK_ENABLE’ undeclared (first use in this function)
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals_utils.h:35:61: note: in definition of macro ‘gcs_set_state’
   35 |                 register long _arg2 __asm__ ("x1") = (long)(state);     \
      |                                                             ^~~~~
In file included from test_signals.c:17:
test_signals.c: In function ‘main’:
test_signals_utils.h:34:55: error: ‘PR_SET_SHADOW_STACK_STATUS’ undeclared (first use in this function)
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals_utils.h:34:55: note: each undeclared identifier is reported only once for each function it appears in
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
In file included from test_signals.c:17:
test_signals.c: In function ‘main’:
test_signals_utils.h:34:55: error: ‘PR_SET_SHADOW_STACK_STATUS’ undeclared (first use in this function)
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals_utils.h:34:55: note: each undeclared identifier is reported only once for each function it appears in
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals.c:31:31: error: ‘PR_SHADOW_STACK_ENABLE’ undeclared (first use in this function)
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals_utils.h:35:61: note: in definition of macro ‘gcs_set_state’
   35 |                 register long _arg2 __asm__ ("x1") = (long)(state);     \
      |                                                             ^~~~~
test_signals.c:31:31: error: ‘PR_SHADOW_STACK_ENABLE’ undeclared (first use in this function)
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals_utils.h:35:61: note: in definition of macro ‘gcs_set_state’
   35 |                 register long _arg2 __asm__ ("x1") = (long)(state);     \
      |                                                             ^~~~~
test_signals.c:31:31: error: ‘PR_SHADOW_STACK_ENABLE’ undeclared (first use in this function)
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals_utils.h:35:61: note: in definition of macro ‘gcs_set_state’
   35 |                 register long _arg2 __asm__ ("x1") = (long)(state);     \
      |                                                             ^~~~~
In file included from test_signals.c:17:
test_signals.c: In function ‘main’:
test_signals_utils.h:34:55: error: ‘PR_SET_SHADOW_STACK_STATUS’ undeclared (first use in this function)
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals_utils.h:34:55: note: each undeclared identifier is reported only once for each function it appears in
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals.c:31:31: error: ‘PR_SHADOW_STACK_ENABLE’ undeclared (first use in this function)
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals_utils.h:35:61: note: in definition of macro ‘gcs_set_state’
   35 |                 register long _arg2 __asm__ ("x1") = (long)(state);     \
      |                                                             ^~~~~
In file included from test_signals.c:17:
test_signals.c: In function ‘main’:
test_signals_utils.h:34:55: error: ‘PR_SET_SHADOW_STACK_STATUS’ undeclared (first use in this function)
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals_utils.h:34:55: note: each undeclared identifier is reported only once for each function it appears in
   34 |                 register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
      |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
test_signals.c:31:17: note: in expansion of macro ‘gcs_set_state’
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                 ^~~~~~~~~~~~~
test_signals.c:31:31: error: ‘PR_SHADOW_STACK_ENABLE’ undeclared (first use in this function)
   31 |                 gcs_set_state(PR_SHADOW_STACK_ENABLE);
      |                               ^~~~~~~~~~~~~~~~~~~~~~
test_signals_utils.h:35:61: note: in definition of macro ‘gcs_set_state’
   35 |                 register long _arg2 __asm__ ("x1") = (long)(state);     \
      |                                                             ^~~~~
testcases/testcases.c: In function ‘validate_reserved’:
testcases/testcases.c:201:22: error: ‘GCS_MAGIC’ undeclared (first use in this function); did you mean ‘ZT_MAGIC’?
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
      |                      ZT_MAGIC
testcases/testcases.c:201:22: note: each undeclared identifier is reported only once for each function it appears in
testcases/testcases.c:204:50: error: invalid application of ‘sizeof’ to incomplete type ‘struct gcs_context’
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                  ^~~~~~
testcases/testcases.c: In function ‘validate_reserved’:
testcases/testcases.c:201:22: error: ‘GCS_MAGIC’ undeclared (first use in this function); did you mean ‘ZT_MAGIC’?
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
      |                      ZT_MAGIC
testcases/testcases.c:201:22: note: each undeclared identifier is reported only once for each function it appears in
testcases/testcases.c:204:50: error: invalid application of ‘sizeof’ to incomplete type ‘struct gcs_context’
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                  ^~~~~~
testcases/testcases.c: In function ‘validate_reserved’:
testcases/testcases.c:201:22: error: ‘GCS_MAGIC’ undeclared (first use in this function); did you mean ‘ZT_MAGIC’?
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
      |                      ZT_MAGIC
testcases/testcases.c:201:22: note: each undeclared identifier is reported only once for each function it appears in
testcases/testcases.c:204:50: error: invalid application of ‘sizeof’ to incomplete type ‘struct gcs_context’
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                  ^~~~~~
testcases/testcases.c: In function ‘validate_reserved’:
testcases/testcases.c:201:22: error: ‘GCS_MAGIC’ undeclared (first use in this function); did you mean ‘ZT_MAGIC’?
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
      |                      ZT_MAGIC
testcases/testcases.c:201:22: note: each undeclared identifier is reported only once for each function it appears in
testcases/testcases.c:204:50: error: invalid application of ‘sizeof’ to incomplete type ‘struct gcs_context’
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                  ^~~~~~
testcases/testcases.c: In function ‘validate_reserved’:
testcases/testcases.c:201:22: error: ‘GCS_MAGIC’ undeclared (first use in this function); did you mean ‘ZT_MAGIC’?
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
      |                      ZT_MAGIC
testcases/testcases.c:201:22: note: each undeclared identifier is reported only once for each function it appears in
testcases/testcases.c:204:50: error: invalid application of ‘sizeof’ to incomplete type ‘struct gcs_context’
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                  ^~~~~~
testcases/testcases.c: In function ‘validate_reserved’:
testcases/testcases.c:201:22: error: ‘GCS_MAGIC’ undeclared (first use in this function); did you mean ‘ZT_MAGIC’?
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
      |                      ZT_MAGIC
testcases/testcases.c:201:22: note: each undeclared identifier is reported only once for each function it appears in
testcases/testcases.c:204:50: error: invalid application of ‘sizeof’ to incomplete type ‘struct gcs_context’
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                  ^~~~~~
testcases/testcases.c: In function ‘validate_reserved’:
testcases/testcases.c:201:22: error: ‘GCS_MAGIC’ undeclared (first use in this function); did you mean ‘ZT_MAGIC’?
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
      |                      ZT_MAGIC
testcases/testcases.c:201:22: note: each undeclared identifier is reported only once for each function it appears in
testcases/testcases.c:204:50: error: invalid application of ‘sizeof’ to incomplete type ‘struct gcs_context’
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                  ^~~~~~
testcases/testcases.c: In function ‘validate_reserved’:
testcases/testcases.c:201:22: error: ‘GCS_MAGIC’ undeclared (first use in this function); did you mean ‘ZT_MAGIC’?
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
      |                      ZT_MAGIC
testcases/testcases.c:201:22: note: each undeclared identifier is reported only once for each function it appears in
testcases/testcases.c:204:50: error: invalid application of ‘sizeof’ to incomplete type ‘struct gcs_context’
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                  ^~~~~~
testcases/testcases.c: In function ‘validate_reserved’:
testcases/testcases.c:201:22: error: ‘GCS_MAGIC’ undeclared (first use in this function); did you mean ‘ZT_MAGIC’?
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
      |                      ZT_MAGIC
testcases/testcases.c:201:22: note: each undeclared identifier is reported only once for each function it appears in
testcases/testcases.c:204:50: error: invalid application of ‘sizeof’ to incomplete type ‘struct gcs_context’
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                  ^~~~~~
testcases/testcases.c: In function ‘validate_reserved’:
testcases/testcases.c:201:22: error: ‘GCS_MAGIC’ undeclared (first use in this function); did you mean ‘ZT_MAGIC’?
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
      |                      ZT_MAGIC
testcases/testcases.c:201:22: note: each undeclared identifier is reported only once for each function it appears in
testcases/testcases.c:204:50: error: invalid application of ‘sizeof’ to incomplete type ‘struct gcs_context’
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                  ^~~~~~
testcases/testcases.c: In function ‘validate_reserved’:
testcases/testcases.c:201:22: error: ‘GCS_MAGIC’ undeclared (first use in this function); did you mean ‘ZT_MAGIC’?
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
      |                      ZT_MAGIC
testcases/testcases.c:201:22: note: each undeclared identifier is reported only once for each function it appears in
testcases/testcases.c:204:50: error: invalid application of ‘sizeof’ to incomplete type ‘struct gcs_context’
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                  ^~~~~~
testcases/testcases.c: In function ‘validate_reserved’:
testcases/testcases.c:201:22: error: ‘GCS_MAGIC’ undeclared (first use in this function); did you mean ‘ZT_MAGIC’?
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
      |                      ZT_MAGIC
testcases/testcases.c:201:22: note: each undeclared identifier is reported only once for each function it appears in
testcases/testcases.c:204:50: error: invalid application of ‘sizeof’ to incomplete type ‘struct gcs_context’
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                  ^~~~~~
testcases/testcases.c: In function ‘validate_reserved’:
testcases/testcases.c:201:22: error: ‘GCS_MAGIC’ undeclared (first use in this function); did you mean ‘ZT_MAGIC’?
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
      |                      ZT_MAGIC
testcases/testcases.c:201:22: note: each undeclared identifier is reported only once for each function it appears in
testcases/testcases.c:204:50: error: invalid application of ‘sizeof’ to incomplete type ‘struct gcs_context’
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                  ^~~~~~
testcases/testcases.c: In function ‘validate_reserved’:
testcases/testcases.c:201:22: error: ‘GCS_MAGIC’ undeclared (first use in this function); did you mean ‘ZT_MAGIC’?
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
      |                      ZT_MAGIC
testcases/testcases.c:201:22: note: each undeclared identifier is reported only once for each function it appears in
testcases/testcases.c:204:50: error: invalid application of ‘sizeof’ to incomplete type ‘struct gcs_context’
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                  ^~~~~~
testcases/testcases.c: In function ‘validate_reserved’:
testcases/testcases.c:201:22: error: ‘GCS_MAGIC’ undeclared (first use in this function); did you mean ‘ZT_MAGIC’?
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
      |                      ZT_MAGIC
testcases/testcases.c:201:22: note: each undeclared identifier is reported only once for each function it appears in
testcases/testcases.c:204:50: error: invalid application of ‘sizeof’ to incomplete type ‘struct gcs_context’
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                  ^~~~~~
testcases/testcases.c: In function ‘validate_reserved’:
testcases/testcases.c:201:22: error: ‘GCS_MAGIC’ undeclared (first use in this function); did you mean ‘ZT_MAGIC’?
  201 |                 case GCS_MAGIC:
      |                      ^~~~~~~~~
      |                      ZT_MAGIC
testcases/testcases.c:201:22: note: each undeclared identifier is reported only once for each function it appears in
testcases/testcases.c:204:50: error: invalid application of ‘sizeof’ to incomplete type ‘struct gcs_context’
  204 |                         if (head->size != sizeof(struct gcs_context))
      |                                                  ^~~~~~

=====================================================


# Builds where the incident occurred:

## defconfig+preempt_rt on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69cd3882dcae953c056b53e1


#kernelci issue maestro:c8166ec266c9f21b9901ef8c8c40af93cf32eeb0

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
