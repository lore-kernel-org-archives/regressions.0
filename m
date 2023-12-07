Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D9A4F1EF
	for <regressions@lists.linux.dev>; Thu,  7 Dec 2023 19:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cjxnIKza";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hdLzHWl4"
Message-ID: <20231207193859.961361261@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1701978563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:references:references;
	bh=2A5tOfBTQ9+8b7wKUOCXmPk6lKlNDwfopIYX+SrqFvY=;
	b=cjxnIKza2OROijSk2HRt5zAtBnx1RFrbj4lFIq4vCnIjg0akKvRXYrihMqc8Qr+UBEPq8X
	zgGPPSTNF1dA2iIWqKvHsik6sSyx1K80FYfdTc6AIlQCntpvqnOdvMm3Aha58SHbIDs6Z6
	3xzwj/OYdwvkbtI+lmk0bEuASmA6vhIGYsjusXYEwU8GulGvOWkL2FG1M5TSpLw17HpdDM
	NEEvprhkyg97FXHFR419WBK1X4iAH6iexZcOUAJ1x2bq4vYocb/Ds0rA0LAzElKz8d6fVA
	PT1qGTWzbjLRZ++PKgX+yOXYO7w4b4jJsSAn3leVxp4KivywVEB+ef0SEY5x8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1701978563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:references:references;
	bh=2A5tOfBTQ9+8b7wKUOCXmPk6lKlNDwfopIYX+SrqFvY=;
	b=hdLzHWl4dDtnn9kSJymTmjiFU/yETMGR0PDwaRxrgjdhBQLlhlqRWIOH9mnOoj7c4iOYdg
	nZ3T88HM5jmh7MCg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: paul.gortmaker@windriver.com,
 x86@kernel.org,
 regressions@leemhuis.info,
 richard.purdie@linuxfoundation.org,
 regressions@lists.linux.dev
References: <ZXCXc+BtnLzqMbFv@windriver.com> <ZUEgAAGDVqXz2Seo@windriver.com>
 <0adb772c-e8d2-4444-92b0-00cbfdaf1fac@leemhuis.info> <87r0k9ym0y.ffs@tglx>
Subject: [patch 0/2] x86/alternatives: Prevent crash in NOP optimizer
Date: Thu,  7 Dec 2023 20:49:22 +0100 (CET)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>

The following series addresses the regression report from Paul on behalf of
the yocto project. It turns out that the recent changes to alternatives
opened a race window where interrupts are enabled and NOPs are optimized in
place. An interrupt hitting into the modification will observe inconsistent
text and crash and burn.

A 32bit QEMU crashes w/o these fixes reliably within about 50 boot
attempts. With the fix applied it survived close to 600 attempts by
now.

Thanks to Paul for providing all the information!

Thanks,

	tglx


