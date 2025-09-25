Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CC51397
	for <regressions@lists.linux.dev>; Thu, 25 Sep 2025 00:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758760186; cv=none; b=Xd9xo9OCteHiyarx96ilLNBhn2yLT0dAxUedAGBzcbrE512AkeJmTEQeIBmIJCa3q+V9G4fa7HEtBQerWNjzJyNbuXwRJPQ8Zs1/xAvIg4bkbn6Q80dFaHvIuCV9/+b2qate+pNOG3tpeOnhziIkW5YjgyzPV1mYvAxfFupdn4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758760186; c=relaxed/simple;
	bh=rGrJhkEhVL8fDzcbwtX0Nlx0/Ial1/o06KA95F1aKyE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=j9uuZc5vt5Wcde3wwy9QHUIPW90ynafBnyB1vlh+kFhFDdzI55vvtJDfEVgQ4DUrRBg2gXRoUqp4mHBPLXIytaLE9P4u1HxV9ztuY7CARQNYVybppG/dQX5amSJcdr4PMzEy2K/yrDdu0swexKpT8moSdOeLTMx5eZvGCu89gh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hJBBi+ZL; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hJBBi+ZL"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57abcb8a41eso12113e87.1
        for <regressions@lists.linux.dev>; Wed, 24 Sep 2025 17:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758760183; x=1759364983; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rGrJhkEhVL8fDzcbwtX0Nlx0/Ial1/o06KA95F1aKyE=;
        b=hJBBi+ZL4GI2BU5ksow7PPB8zXnM98m2SMGkNeh4P9Cm+Cu9uRy8+dKaGshdVhhoZa
         8mEZfgEAgTOTNkPeoXIalIsSQ6v/BICWI1UEz/X4XqLh3QSqOaWljxKg1B76GWi64LIO
         IEkrlMDW/XQt6Z8Cbhl1A0Cpe4arEzhd1A89HgKG7mGe8RPuBlgtUJnODXxUjFrvsRER
         Lf5lmCiGNRVkimjJlZgfZO/PvsITCutPAaI1bRk26FKEyLdxGBPZh4wha+INAyEyX1sx
         eNp+p8R+3YUi4iBVuo5uKvZ7eXWLOIAnPIjpwBYLctrIdoUktkvYbukx0ClMGkc0fIOl
         3jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758760183; x=1759364983;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rGrJhkEhVL8fDzcbwtX0Nlx0/Ial1/o06KA95F1aKyE=;
        b=A1Ews5xAbDhyMMHBa6YPdm60s2cg5niwknzECw1m8f/yPD7l0qj5rh2yAW6ckPSwBN
         osYtYKr58O8tBIsUcZ0ftXm8gycR1KBYz8M7hS0P73PgVYcWlh4WGpb6FUxm/2IeAJ0+
         Yp4MJL6mCMpBZLjankfaHXHiqbgY3DN3stH++v2C9VXHX3Kb4FKrnh14YfYuPEuYfelt
         rP1VhGjSHYctQyf1wyn2dYOpX1W4qJL1tFjGCGiQVLQsZ9jbVsvLKr1Rn2D1w5N+fVuG
         gdueBNQvQ+h5SvvlP4cjcOO6Jqj0edOu7dd4xWOWnMqGBwq3PU3NHDIdAl8bewhzjYbJ
         u5Eg==
X-Gm-Message-State: AOJu0YxBtSgHFrDyelAeVyXRnLCUk8ZaTEdcBLafjB2PjxIotUUaLh6k
	maNs91r3PjmDeS9yb+svXqP8ZPqWAWsURDRh3RXQT7jxrRRbF8It9FrlxhWLsaDaolN3UR1nXOT
	cBZP46ym4EuAydG2DIyF33Pc5mXQ6srjYzXhVaUQI
X-Gm-Gg: ASbGncsw6ubHGRajUe9vxgh0N3xqZ+Yv4TPV0I6E/nEYJOTFI1We6YitcW8Pwx5Hjhx
	IQMucNY9Xs1eMq/NQgUc6ZjI5XfgVlqerTwst4XvW4rlSbR8h6rnYgpcIAV9s5SsnsAotp6QCIP
	34mnFuBOstB1tZ5LtCvfsdvv69gFBBiLRkKC5kH2k++p/LP1L6jaHTnWJ2Nix5nYjg13Xbe/3oT
	ANMaOz0Hh+UNrDlNo0WUy3M
X-Google-Smtp-Source: AGHT+IF29hX9gih8LwttPUfoJ3ziAEqxYld5pZxsEuTKcsm+ojcC4pZPrneDxgNLw1hROYWi7BymTX+vJ5G4M6w8ZGA=
X-Received: by 2002:a05:6512:6092:b0:576:4ceb:a167 with SMTP id
 2adb3069b0e04-582b1552a7emr239612e87.5.1758760182481; Wed, 24 Sep 2025
 17:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Chenglong Tang <chenglongtang@google.com>
Date: Wed, 24 Sep 2025 17:29:31 -0700
X-Gm-Features: AS18NWBhdBOTvWF0Ty1kP-ZkTeb619FZATRTEkhft-g2-Fo8clpTokAq1JhLagM
Message-ID: <CAOdxtTYQye1Rtp-sG48Re+_ihD637NDXTG_V_uLkerg=m1Nbtw@mail.gmail.com>
Subject: [REGRESSION] workqueue/writeback: Severe CPU hang due to kworker
 proliferation during I/O flush and cgroup cleanup
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, tj@kernel.org, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, lakitu-dev@google.com
Content-Type: text/plain; charset="UTF-8"

Hello,

This is Chenglong from Google Container Optimized OS. I'm reporting a
severe CPU hang regression that occurs after a high volume of file
creation and subsequent cgroup cleanup.

Through bisection, the issue appears to be caused by a chain reaction
between three commits related to writeback, unbound workqueues, and
CPU-hogging detection. The issue is greatly alleviated on the latest
mainline kernel but is not fully resolved, still occurring
intermittently (~1 in 10 runs).

How to reproduce

The kernel v6.1 is good. The hang is reliably triggered(over 80%
chance) on kernels v6.6 and 6.12 and intermittently on
mainline(6.17-rc7) with the following steps:

Environment: A machine with a fast SSD and a high core count (e.g.,
Google Cloud's N2-standard-128).

Workload: Concurrently generate a large number of files (e.g., 2
million) using multiple services managed by systemd-run. This creates
significant I/O and cgroup churn.

Trigger: After the file generation completes, terminate the
systemd-run services.

Result: Shortly after the services are killed, the system's CPU load
spikes, leading to a massive number of kworker/+inode_switch_wbs
threads and a system-wide hang/livelock where the machine becomes
unresponsive (20s - 300s).

Analysis and Problematic Commits

1. The initial commit: The process begins with a worker that can get
stuck busy-waiting on a spinlock.

Commit: ("writeback, cgroup: release dying cgwbs by switching attached inodes")

Effect: This introduced the inode_switch_wbs_work_fn worker to clean
up cgroup writeback structures. Under our test load, this worker
appears to hit a highly contended wb->list_lock spinlock, causing it
to burn 100% CPU without sleeping.

2. The Kworker Explosion: A subsequent change misinterprets the
spinning worker from Stage 1, leading to a runaway feedback loop of
worker creation.

Commit: 616db8779b1e ("workqueue: Automatically mark CPU-hogging work
items CPU_INTENSIVE")

Effect: This logic sees the spinning worker, marks it as
CPU_INTENSIVE, and excludes it from concurrency management. To handle
the work backlog, it spawns a new kworker, which then also gets stuck
on the same lock, repeating the cycle. This directly causes the
kworker count to explode from <50 to 100-2000+.

3. The System-Wide Lockdown: The final piece allows this localized
worker explosion to saturate the entire system.

Commit: 8639ecebc9b1 ("workqueue: Implement non-strict affinity scope
for unbound workqueues")

Effect: This change introduced non-strict affinity as the default. It
allows the hundreds of kworkers created in Stage 2 to be spread by the
scheduler across all available CPU cores, turning the problem into a
system-wide hang.

Current Status and Mitigation

Mainline Status: On the latest mainline kernel, the hang is far less
frequent and the kworker counts are reduced back to normal (<50),
suggesting other changes have partially mitigated the issue. However,
the hang still occurs, and when it does, the kworker count still
explodes (e.g., 300+), indicating the underlying feedback loop
remains.

Workaround: A reliable mitigation is to revert to the old workqueue
behavior by setting affinity_strict to 1. This contains the kworker
proliferation to a single CPU pod, preventing the system-wide hang.

Questions

Given that the issue is not fully resolved, could you please provide
some guidance?

1. Is this a known issue, and are there patches in development that
might fully address the underlying spinlock contention or the kworker
feedback loop?

2. Is there a better long-term mitigation we can apply other than
forcing strict affinity?

Thank you for your time and help.

Best regards,

Chenglong
