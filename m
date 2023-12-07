Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C6A4F8A1
	for <regressions@lists.linux.dev>; Thu,  7 Dec 2023 19:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="43RosbCw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="S8EVt6qS"
Message-ID: <20231207194518.341544943@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1701978564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=yJNjWvMnyGpF9vv2OCtsAtLXTpNa6m7kUdsWdQ8QgDQ=;
	b=43RosbCwfkmb1evBar47V3hkNK+Y7VXW/1fi3oNEcAzbNci0qiqSj3kiJbHUawqgXQMIr/
	cZ1wbQY/hOlBx5gR1GIygcxRxWlTGf4F0LOZ/Uc6y66XCaTOI1Tg0wqE0B/Z//M6rKlA07
	ugwryy0XvCDHQvcoc9SERVQ2Yz+yjB+Bpf1Phq1Li55CJ6zrqhL4/6nQbY6VPf/RNWHckr
	gUslDCLHEkfUEKDPavIs0rFywwcJAwu0XXnOZb4G5mxlj47zj+PMBHYCdBFaBZubU6SJ2q
	oV3LXN3l9rlUE2KLnHYQ8EtKbUi984Hs/2yeyIE/XWC2ApKI/PtKA+aJ2gpsRw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1701978564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=yJNjWvMnyGpF9vv2OCtsAtLXTpNa6m7kUdsWdQ8QgDQ=;
	b=S8EVt6qSpiCrRZ+G09xcua/XpjJJ8WaxboobVbBnWt6AmkYo73vvbam1lo9DGqtciBzq2m
	5UOVEQ1Jj1xcGxDg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: paul.gortmaker@windriver.com,
 x86@kernel.org,
 regressions@leemhuis.info,
 richard.purdie@linuxfoundation.org,
 regressions@lists.linux.dev
Subject: [patch 1/2] x86/alternatives: Sync core before enabling interrupts
References: <ZXCXc+BtnLzqMbFv@windriver.com> <ZUEgAAGDVqXz2Seo@windriver.com>
 <0adb772c-e8d2-4444-92b0-00cbfdaf1fac@leemhuis.info> <87r0k9ym0y.ffs@tglx>
 <20231207193859.961361261@linutronix.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Thu,  7 Dec 2023 20:49:24 +0100 (CET)

text_poke_early() does:

   local_irq_save(flags);
   memcpy(addr, opcode, len);
   local_irq_restore(flags);
   sync_core();

That's not really correct because the synchronization should happen before
interrupts are reenabled to ensure that a pending interrupt observes the
complete update of the opcodes.

It's not entirely clear whether the interrupt entry provides enough
serialization already, but moving the sync_core() invocation into interrupt
disabled region does no harm and is obviously correct.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/alternative.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1685,8 +1685,8 @@ void __init_or_module text_poke_early(vo
 	} else {
 		local_irq_save(flags);
 		memcpy(addr, opcode, len);
-		local_irq_restore(flags);
 		sync_core();
+		local_irq_restore(flags);
 
 		/*
 		 * Could also do a CLFLUSH here to speed up CPU recovery; but

