Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A6B749C
	for <regressions@lists.linux.dev>; Wed, 20 Nov 2024 00:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732062616; cv=none; b=cI/8Hbr+GtPfEZ+l1Vg6VzRWHsmk768i5KoPBkrXbdFyfkiqPJ8N1pQyBdmucDZ3WG5PG0qEygyhpTkj/zXeu2hRU9I1/KeVof2KDiGdj6UWn3SSjnc5kgT2agXqmC2TZvmgOgYfk3VGvGLrEZrnOFICoQeX/OeEVhDqz6i1L8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732062616; c=relaxed/simple;
	bh=d+BVKrZpfVweKPv9g43tqBXKWhOygTcYMhNhb0Q5Pms=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=W63Xc6BqYC1IUq+sEdDfQkMDuvCDXxmYE92JxUNwPL0myC83k2fRYo63AKMwVQVd9iFgIItlgrXUJ5U52GaiP/xWbqmBNATjolzL6SsHV46CaCYIL3Fnxf8j+2ctGiY//HQs4cgXCAfT31mu4FyAUXoeQ7yZDKFBhRILuzQzwdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jobyaviation.com; spf=pass smtp.mailfrom=jobyaviation.com; dkim=pass (2048-bit key) header.d=jobyaviation.com header.i=@jobyaviation.com header.b=N/yG1cUk; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jobyaviation.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jobyaviation.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jobyaviation.com header.i=@jobyaviation.com header.b="N/yG1cUk"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-720d01caa66so4509025b3a.2
        for <regressions@lists.linux.dev>; Tue, 19 Nov 2024 16:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jobyaviation.com; s=google; t=1732062613; x=1732667413; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d+BVKrZpfVweKPv9g43tqBXKWhOygTcYMhNhb0Q5Pms=;
        b=N/yG1cUkDSSzS8wGG9YZyi+1ZpBBEhu5mZvGyqgGK4HteTd+mVZbYpFENDlT1Lu3pE
         Z7OMkVYGxu8jX2aWQZJhOtg+isQ65croiXnIray8ijhDcLFmEHj2w4tAp+zra7wq/90a
         2TC5AHvCtMMGZhMxlQ9uGWLcb/FjNpL84sCtFiHyzbYB7Z2xunrXldewt1aT33U2Lhas
         JImNguOGIs7+X4TiZRYWx1EhXenTH+G944aOHM9YgwE2l4G/+/yBksMJYNvu7JiQU5bm
         7cXRBYtfAm3oOdkSebOZVZXX49Ly59hiR2LsAODvK04RuBopfYow1cMYRhqIG2Hs0fhq
         d2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732062613; x=1732667413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+BVKrZpfVweKPv9g43tqBXKWhOygTcYMhNhb0Q5Pms=;
        b=g/NTLEm/dy4LF+jbjWdZtDzu1v70TEktSRx0MzQi6+K04ZyzmicpNDjF3Q/co9OYGx
         oQLwv00W+eOzvhoaxdeUmftR6XOZmMPbEsEUtI2xWpybRNUnZMDKGb2xS6b08ebpWrHB
         Quh9HWUe1rb5Ac7Hjpv4iZ7pyag3z8MVaRk25bwONJD9LyAhfkfd2MD5KuXRp2QJlhed
         34iiv5dou5DFoSNdlgn+s6PmZXb655D/PQVesUNITBeoYMdMaLQAkLNc4lRg9M+Vd5pQ
         ROff1HHHZg/a2IvEZ6qQzFIwuDLFJnwSF4CKruRN28RgIqC3T6B4fZbB+kJ9I+3aLnDo
         mxBA==
X-Gm-Message-State: AOJu0Yxnz0oFk8eD211Pma62T+nadG/P2quqI7tONs5CldRk8r2nOGpW
	k0Hm8dnTZ11yliB3CtsU9wsGdwn0Bn2/ubWEDwSbgqZy01rbkUNV9sEqolO/e8/8Htfxj6CRo6r
	xzEkObAOdf7/dqNQc90O+T7ilT21fWD3wuEhtg3Cw93meo5+Xt9LUvSXJwoI7yUVk1C5o6MHuCd
	kJiqJ2Ao1ukV3kba1G67bdb52sNIE=
X-Google-Smtp-Source: AGHT+IHu9jrG/J8KeaPlX/LhlcBm4XHfdDXQTx3GImlfZVKS2/WywDBk8jc+b0UcXIXPSYPJO1YtWXaskuNq95WNG0I=
X-Received: by 2002:a17:90a:d410:b0:2ea:5823:c150 with SMTP id
 98e67ed59e1d1-2eaca7c5872mr1011629a91.30.1732062613481; Tue, 19 Nov 2024
 16:30:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Chenbo Lu <chenbo.lu@jobyaviation.com>
Date: Tue, 19 Nov 2024 16:30:02 -0800
Message-ID: <CACodVevaOp4f=Gg467_m-FAdQFceGQYr7_Ahtt6CfpDVQhAsjA@mail.gmail.com>
Subject: Performance Degradation After Upgrading to Kernel 6.8
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I am experiencing a significant performance degradation after
upgrading my kernel from version 6.6 to 6.8 and would appreciate any
insights or suggestions.

I am running a high-load simulation system that spawns more than 1000
threads and the overall CPU usage is 30%+ . Most of the threads are
using real-time
scheduling (SCHED_RR), and the threads of a model are using
SCHED_DEADLINE. After upgrading the kernel, I noticed that the
execution time of my model has increased from 4.5ms to 6ms.

What I Have Done So Far:
1. I found this [bug
report](https://bugzilla.kernel.org/show_bug.cgi?id=3D219366#c7) and
reverted the commit efa7df3e3bb5da8e6abbe37727417f32a37fba47 mentioned
in the post. Unfortunately, this did not resolve the issue.
2. I performed a git bisect and found that after these two commits
related to scheduling (RT and deadline) were merged, the problem
happened. They are 612f769edd06a6e42f7cd72425488e68ddaeef0a,
5fe7765997b139e2d922b58359dea181efe618f9
After reverting these two commits, the model execution time improved
to around 5 ms.
3. I revert two more commits, and the execution time is back to 4.7ms:
63ba8422f876e32ee564ea95da9a7313b13ff0a1,
efa7df3e3bb5da8e6abbe37727417f32a37fba47

My questions are:
1.Has anyone else experienced similar performance degradation after
upgrading to kernel 6.8?
2.Can anyone explain why these two commits are causing the problem? I
am not very familiar with the kernel code and would appreciate any
insights.
3.Are there any additional settings or configurations I need to apply
when using kernel 6.8 to avoid this issue?

My CPU is AMD Ryzen Threadripper 3970X, and my desktop uses Ubuntu 24.04.

Thanks again for any insights or suggestions. Please let me know if
any other information is needed.

Best,
Chenbo

--=20
This email and any relevant attachments may include confidential and/or=20
proprietary information.=C2=A0 Any distribution or use by anyone other than=
 the=20
intended recipient(s) or other than for the intended purpose(s) is=20
prohibited and may be unlawful.=C2=A0 If you are not the intended recipient=
 of=20
this message, please notify the sender by replying to this message and then=
=20
delete it from your system.
