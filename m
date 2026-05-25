Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB3438E5C5
	for <regressions@lists.linux.dev>; Mon, 25 May 2026 21:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779743531; cv=none; b=jt3RElPhRTJBvk6swzicmLcS6/tmoO+21StOjMvGwYd6wfeC1Kj77bWBcmf5ESWXFBqHnioMl5wjKkG5/rr3GPe/ePO+T7DPasqDy5zONV/WyhwptR7SFvPAr3g9utlmjkTLqgtiujWaEwOF6m2cWvD2lGv+5fBz+le+KY7NYn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779743531; c=relaxed/simple;
	bh=6xiNrX/k52YTkdf/AO5WqSiEU+jz5mJ3ulh1shDOgK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DbhCElf9A1+ni7Ig9wcFM4cR4cRilQ6uRAHurrraOel9kMRDkF+nJdHHNxuiEQK/BQ4GPhA9yN4bdwwcF0xkCjsxooK4GzkzxegQ0ty+zDLpWTdnBam/CMW2JEcFGzB0jOFPPnH6Nz8evQgWd6UPzyYT87+BJMF5KV9lsotdUI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tSrIIs+8; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tSrIIs+8"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gPT912Vm1z9srp;
	Mon, 25 May 2026 23:12:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779743525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5vV62udXbmk9yxKYAlvayyIhtjZdNgxiaOjdz1VbT9k=;
	b=tSrIIs+8HlygjIQtWWfCGXABQQjj8wArEXyGEwHm2ZvZpv/ZZxebhWgp/yG1ovzw0P6iZ6
	t4PIfeb/+Dg97j+chCmN9eFPovSZUuc4ySrDCeX85jKzsR3bDp/z0go8tE0cZE0SGvITnH
	eu8IqeUDwacJNeLNXpuifjT9vD7ZI7KD0KcE5FCQ7/o5txtRKUWIe2W9yeOKIlH1qdqlfs
	xvVXs62W6XpHSt16fbAEthNXgdTcTxo5fx5KCaRgtxXwoyZS0/Xfaa/PU60RPY3sjaR97o
	G47iC7XS8xN/7XOD2u5mvXp3f+DxofdMdgGhm9nxvJDo+rbYuTqbnyHadMdnsw==
From: Lukas Beckmann <lbckmnn@mailbox.org>
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org,
	regressions@lists.linux.dev,
	Mike Galbraith <efault@gmx.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH 6.12.y v2 2/5] sched/deadline: Fix dl_server_stopped()
Date: Mon, 25 May 2026 23:11:14 +0200
Message-ID: <20260525211117.630141-3-lbckmnn@mailbox.org>
In-Reply-To: <20260525211117.630141-1-lbckmnn@mailbox.org>
References: <https://lore.kernel.org/stable/20260522213120.1205100-1-lbckmnn@mailbox.org/>
 <20260525211117.630141-1-lbckmnn@mailbox.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 25fe9b157d674aa3774
X-MBO-RS-META: wh8wegpaonxjok3dy84bz6famaxd831p

From: Huacai Chen <chenhuacai@loongson.cn>

commit 4717432dfd99bbd015b6782adca216c6f9340038 upstream.

Commit cccb45d7c429 ("sched/deadline: Less agressive dl_server handling")
introduces dl_server_stopped(). But it is obvious that dl_server_stopped()
should return true if dl_se->dl_server_active is 0.

Fixes: cccb45d7c429 ("sched/deadline: Less agressive dl_server handling")
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lkml.kernel.org/r/20250809130419.1980742-1-chenhuacai@loongson.cn
Signed-off-by: Lukas Beckmann <lbckmnn@mailbox.org>
---
 kernel/sched/deadline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 9c5fa95b345a..6ff9055a6981 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1879,7 +1879,7 @@ void dl_server_stop(struct sched_dl_entity *dl_se)
 static bool dl_server_stopped(struct sched_dl_entity *dl_se)
 {
 	if (!dl_se->dl_server_active)
-		return false;
+		return true;
 
 	if (dl_se->dl_server_idle) {
 		dl_server_stop(dl_se);
-- 
2.54.0

