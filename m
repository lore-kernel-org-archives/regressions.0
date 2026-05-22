Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9057A38B7B6
	for <regressions@lists.linux.dev>; Fri, 22 May 2026 21:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779485499; cv=none; b=uahovu1U/Xgd7OR+pM87nV8wGeyZCIifg7u+t0vYUvYyKKoRpMOihZKz1Pf9UP7Fq2Y3UgEgBuKxVvV70cwThcMeOgvtQDmxpPbJh2arvJ8shjFSs85t0bsTIaDdHXDhSztft1UBD/WOEuxDdLzBvG7N/l5QEEWNy+UM3E7sgsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779485499; c=relaxed/simple;
	bh=j1xddUMMBFb16SlgtUX0HJ3qWkaM0wyMdYabFeuRnqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B7MSPQU1dgz3yHuIXJWnEKfdQ2F+VAmhXi5dVQ+geHSTyRFTvhspe+Cpr8/AqpQAiOZxbSLXbLoZ5UNJvqtwnYTTyeb2y2x7gSsimaWtbjOccDw3QpjMcnEej+7jQ4NEdnQyanWKlD0UuOK5+cDM9VK8CvJPHHyInN6EckMUwcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=V2njL/sY; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="V2njL/sY"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gMdkp1Rr7z9v7g;
	Fri, 22 May 2026 23:31:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779485490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UXbfCdtu7pGqLsOvdQmNScTjV6C5Xgofhl0P02rcJTY=;
	b=V2njL/sYNgXsEjgp6TbytVFj7NzfjJ7dLbRTCdvJS69TPWx6P5sQslBFWOm2FqKglmEupb
	xwrfTJJDz2P7FrrMDM+cWjNWZC5yVAVBu6Fpvn7prNk/9pLb9hlzKTkhBALZwcPcFZEBR/
	Cs62WmZNC2E8LjPgbrasRFC0tWnh78yzaWVlXDbaMWbdRauUQ9MqI8dJfftpwNHt+Y9Z0h
	JhhUIDXaq7Z+Pt1/fknkxOEKDmKaSw8pnISl1Xbyx2Ns3+D+Xj1ChzCwS5cVCXzbOralF8
	NenNLQzhoUpH3P29COX1DLIFGmWQgwnJgOiXHHzhPwOhOP9ZpHJ/ENbQ1YT78Q==
From: Lukas Beckmann <lbckmnn@mailbox.org>
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org,
	regressions@lists.linux.dev,
	Mike Galbraith <efault@gmx.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH 6.12.y 0/3] backport missing dependencies of d66792919d4f
Date: Fri, 22 May 2026 23:31:17 +0200
Message-ID: <20260522213120.1205100-1-lbckmnn@mailbox.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 4e49c896b262d06495c
X-MBO-RS-META: rdttdt3rxadx8eh3tpqjxs9zfj138bm7

Commit d66792919d4f ("sched/deadline: Use revised wakeup rule for
dl_server") in the 6.12.y stable tree (upstream commit 14a857056466)
depends on three upstream commits that were not backported:

  commit cccb45d7c429 ("sched/deadline: Less agressive dl_server handling")
  commit 4ae8d9aa9f9d ("sched/deadline: Fix dl_server getting stuck")
  commit a3a70caf7906 ("sched/deadline: Fix dl_server behaviour")

Without these, cyclictest under load reports latencies up to ~50ms on 
PREEMPT_RT.

For context, see the regression report:
https://lore.kernel.org/regressions/04657838-46d1-432d-95e1-eb73b930b032@mailbox.org

Testing:
Tested on two different machines with Debian's PREEMPT_RT config for about 
10 hours.
Without these patches cyclictest under load spikes to ~50ms in less than 
30 minutes, with the series applied the latency spikes are gone.

Thanks,
Lukas

Peter Zijlstra (3):
  sched/deadline: Less agressive dl_server handling
  sched/deadline: Fix dl_server getting stuck
  sched/deadline: Fix dl_server behaviour

 include/linux/sched.h   |  1 -
 kernel/sched/deadline.c | 16 +++-------------
 kernel/sched/fair.c     | 16 +---------------
 kernel/sched/sched.h    | 37 +++++++++++++++++++++++++++++++------
 4 files changed, 35 insertions(+), 35 deletions(-)

-- 
2.54.0

