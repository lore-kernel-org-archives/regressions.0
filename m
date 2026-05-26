Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0783E1234;
	Tue, 26 May 2026 11:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779795321; cv=none; b=lOdUx8DX2R5500AVDzbvSH7mcNNPLebXl2LA/LMcLrY8d39hQQdMAJ3WOQTyVHHQSz2g03120iv4k3oyJKdWPBDuuMD/dkqtBtGoHtOfdTaItAt3NxBVLwKfyN4FGuO5ZoQhrwYuq17/7GfQUZN9blW/y+ZOOx9m+AZavm8taP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779795321; c=relaxed/simple;
	bh=BmtTDo/uRFsbwhH2tmV3Bysx52tyvZaR24F4RfDct0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KKHnXkySUksY4Uz4P2hMiM9CRhQ9/C3/qN3alrGTjSqJ/AJ0aq/+t65Rjv1zqj3kDwub1tQqd/JJsQrpNL7fpZaIArWw2K6aUVjrv5h67CHX4LLtfidES8LV6sLwWqKb01knr8667P/AVcQfl16fbgQd+2Z1oXvRAkC5LdxlRAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0EfP79w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0EfP79w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193151F00ADB;
	Tue, 26 May 2026 11:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779795316;
	bh=SbN+7A6LfrkSN+ioVAez6Eg2ksUMA7eufMMJl+wtgC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U0EfP79w6VDJUwypTKnAk6RJoCNZny4LBY+H/5/GwqahfYlbzU5hWseBvcmyjqhDR
	 H6xN8XUxEsgFa5JSOeWi2zZof/bteRJUWG23gcg/3L01lfoKIU0QqzTvh/UOAENcmz
	 wEQHKJnc5nXqMm4BadZJ4YRbbQ6Y1UuOFKGW4I6Q7z4jEzTKU7tkTm075vDpdqx+6e
	 B3iIzuwWBTIYq/p7JDUWMnDBJRjtygs2PSSUAMAEEGTjIqsG0GcFmo5nGtNtaSzR3/
	 Dhz1htfVWkwiiofZ15FXzl2MWRgIu1ipHTrfZx7993luY5NjSwOscM0IIhcf1zmVuF
	 vcgtZbWxmgRrQ==
From: Sasha Levin <sashal@kernel.org>
To: Lukas Beckmann <lbckmnn@mailbox.org>
Cc: Sasha Levin <sashal@kernel.org>,
	stable@vger.kernel.org,
	regressions@lists.linux.dev,
	Mike Galbraith <efault@gmx.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: Re: [PATCH 6.12.y v2 0/5] backport missing dependencies of d66792919d4f
Date: Tue, 26 May 2026 07:35:08 -0400
Message-ID: <20260525231000.agent5-0004@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260525211117.630141-1-lbckmnn@mailbox.org>
References: <https://lore.kernel.org/stable/20260522213120.1205100-1-lbckmnn@mailbox.org/> <20260525211117.630141-1-lbckmnn@mailbox.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> v2 backports the missing dependency chain for d66792919d4f
> ("sched/deadline: Use revised wakeup rule for dl_server") in 6.12.y:
>
>   1/5 cccb45d7c429 sched/deadline: Less agressive dl_server handling
>   2/5 4717432dfd99 sched/deadline: Fix dl_server_stopped()
>   3/5 bb4700adc3ab sched/deadline: Always stop dl-server before changing parameters
>   4/5 4ae8d9aa9f9d sched/deadline: Fix dl_server getting stuck
>   5/5 a3a70caf7906 sched/deadline: Fix dl_server behaviour

Queued all 5 for 6.12.y, thanks for the quick respin.

I also pulled ee6e44dfe6e5 ("sched/deadline: Stop dl_server before
CPU goes offline") on top, since it's a Fixes: of 4ae8d9aa9f9d and
6.17.y already took it. Without it 4/5 leaves a dangling dl_server
on CPU hotunplug.

--
Thanks,
Sasha
