Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9485A29B8D0
	for <regressions@lists.linux.dev>; Sun, 31 May 2026 16:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780246306; cv=none; b=smPUHg+DhAFMCY0liUg2Q8m2OAWTUgGQ85AOt1KVN4/Nm/mWFipQgoGvbprFnGxmrDOv0IwWrRwcpNNU6A20whq7KjoTc4k5mwHXQtasMw+U88hzoh17HXQPyoXNOvTsRfUnim3vbZloMnqWR3/roVZPZdy1S1VD7e6Yho6LqLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780246306; c=relaxed/simple;
	bh=Nl4VK9dmupFjmdL4GIawfNy9HRaWx7gbhvzNn9cpBgc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=CxUR0RihaIH3I6M/ch45RjC9t3AJULpMxz5DsOm3iSKovapJvY7kNlQ5B9FBy751tjd8+fJHpCY98JOoGR3eMayPw6ug09VSJpbAmUyFr/u5gz3/3TAtoLVbiMhpawRW1EkpIiz7H36yOaJclmWNgi311nhamVWYIcfVCzkfxeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5APzlsR; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5APzlsR"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39677234558so7085271fa.1
        for <regressions@lists.linux.dev>; Sun, 31 May 2026 09:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780246304; x=1780851104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QIx7P3SxsjvmsybJQknN3YKzUv+gi0wfBofWFUKoMZ4=;
        b=f5APzlsR/h8HaipBTDJEP45m3xItflkdzYudq0gHreQr7t+gaJ7UbRKcu9P33Ss/M4
         UT78i+myQjgZxJEsM7z9xatRxk/5y46DZe0tauvcqvv69QB7xUPrmlcv7qX0xoXOr+u9
         QJ/vGR+wvJ1r+s32MowzFwPBZ9J7gg0qyPfcH0JJVBomj0cJmn6RVPs4gkpECFVQM7O7
         irYbbHeV4nqyLaJNynSUYff0BNvjd1HGma2F2J348j54yENx9a6GL0Z2Z2VcgYyIvWTU
         6vYhgGWoHQNg4vUgmg7/UJLmrPlNasOWzli9PWjx1s5XcG8UDy3AAh4X/X+MXYjFInXJ
         ZZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780246304; x=1780851104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIx7P3SxsjvmsybJQknN3YKzUv+gi0wfBofWFUKoMZ4=;
        b=MUoc0sMCX4nIsWfmesWuYCuGLeeJcijrCbZKkWy1aDuQLgIY8kRBWnX++CuqIMyw6K
         BRF1cQVK9/EMNJMuZAS516MX8MNoxB7MuV8a1sk3Ttwt2+TYFdo8QYrjonjikzDwg9wE
         /LcygD7dwSLAo4C6Mrfp/fQeO7DaF4LxWA6llux7TubUw3Vkk404n9hASZENFhuZ9b8B
         bJCr8obo5LORRk5UDCtM/hfqqTIvTPCI3tHgAbM+qVWABJRElNAOTtoCy8rw4q5CQEsZ
         08cXLn5UfLCyEfXsYev0WZNpOHKofv6WjhbNq+IM7jmh1QuPSqDNpYiC1+nDXFpgp1Rh
         KCfA==
X-Gm-Message-State: AOJu0YyS8wjzJ4ubcyZJ8onkBcG7IUPBhAtBwR3cm8rBSbu5FKxgo9eu
	m1QycGkHd7KSVIiwnVLA+FWKzcp9dj05ZqJ7Xk38OPuXXN0AspnL37iHyroBzw==
X-Gm-Gg: Acq92OFWMF9E5FRUO21JgwjiEoKLNRLqNNGwI+WvPle6Id9wWqiU7qXwgjrm0mObVht
	/EAn+YDfFcNW/UT4wF28ZYPNayLDdQm4yiLs1xAuS1WnyjCWooFtfpZjeP97aGKbZGFXRIblkuU
	4aDb0ik2TE11zYsXbwdLecIhoStxaOOAuv8PPU8/HhVeWRvw+mde2e8R9pYlmcGxdech+zHeS13
	AWe/GxX9G8ZAdFpe2vHE/lf75RnFRaWy1+FClIWyAkgNA8eEz1d0AEDf602YthSX1tZ/J0GBrdK
	Z9J5XglR6fqnCh2nHS4pvy6bhs4T+e0jPegEvPoobCPOXzdGyApXwpLbSAKBjtk32fdgYdZ0USR
	0bbyoGjbGdULFpL7OaJgwq14rr/AAbrdnC3FRES4T8H9M+joj0E3cEyTbS9lO+IH7d4PWz7NJ6O
	Mfut30F8+/4qr7mLEYB2Yj1FOAqOsG+TJ9TKCMQY5630FwwIc3+WZlfTOLe1QY4kBRo2ZloEY=
X-Received: by 2002:a2e:aa13:0:b0:394:472e:e430 with SMTP id 38308e7fff4ca-39664f114d6mr11110711fa.18.1780246303566;
        Sun, 31 May 2026 09:51:43 -0700 (PDT)
Received: from ik5070.localdomain (85-253-35-150.ip.elisa.ee. [85.253.35.150])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-39659de42e2sm16481951fa.26.2026.05.31.09.51.40
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 09:51:41 -0700 (PDT)
From: Indrek Kruusa <indrek.kruusa@gmail.com>
To: regressions@lists.linux.dev
Subject: [REGRESSION][BISECTED] Boot hangs on Allwinner D1 RISC-V board
Date: Sun, 31 May 2026 19:51:38 +0300
Message-ID: <20260531165138.2696250-1-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi!

I have an Allwinner D1 based board whose boot process hangs before the root filesystem is mounted. The issue has been present since v7.1-rc1.

A git bisect points to:
ff1c0c5d07028 Merge branch 'timers/urgent' into timers/core

The board boots normally if I revert the changes in kernel/time/clockevents.c back to commit 09c04714cb455 (patch included below to speed up the testing).

This platform has a history of requiring special quirks ([1], [2]).

I originally reported this issue here [3]

[1] https://lore.kernel.org/lkml/20240817081218.2985171-1-apatel@ventanamicro.com/
[2] https://lore.kernel.org/linux-riscv/20260525182124.19402-2-jtaubepe@redhat.com/
[3] https://lore.kernel.org/linux-riscv/CA+fTLhgLmTY+exGujKf8OYYQvcEW5X5NJ_5sLq2AYL6zER2c0A@mail.gmail.com/

Best regards,
Indrek


diff --git a/kernel/time/clockevents.c b/kernel/time/clockevents.c
index 5e22697b098d8..83712aa1d385c 100644
--- a/kernel/time/clockevents.c
+++ b/kernel/time/clockevents.c
@@ -94,9 +94,6 @@ static int __clockevents_switch_state(struct clock_event_device *dev,
 	if (dev->features & CLOCK_EVT_FEAT_DUMMY)
 		return 0;
 
-	/* On state transitions clear the forced flag unconditionally */
-	dev->next_event_forced = 0;
-
 	/* Transition with new state-specific callbacks */
 	switch (state) {
 	case CLOCK_EVT_STATE_DETACHED:
@@ -175,7 +172,6 @@ void clockevents_shutdown(struct clock_event_device *dev)
 {
 	clockevents_switch_state(dev, CLOCK_EVT_STATE_SHUTDOWN);
 	dev->next_event = KTIME_MAX;
-	dev->next_event_forced = 0;
 }
 
 /**
@@ -340,6 +336,7 @@ int clockevents_program_event(struct clock_event_device *dev, ktime_t expires, b
 {
 	int64_t delta;
 	u64 cycles;
+	int rc;
 
 	if (WARN_ON_ONCE(expires < 0))
 		return -ETIME;
@@ -361,29 +358,16 @@ int clockevents_program_event(struct clock_event_device *dev, ktime_t expires, b
 		return 0;
 
 	delta = ktime_to_ns(ktime_sub(expires, ktime_get()));
+	if (delta <= 0)
+		return force ? clockevents_program_min_delta(dev) : -ETIME;
 
-	/* Required for tick_periodic() during early boot */
-	if (delta <= 0 && !force)
-		return -ETIME;
+	delta = min(delta, (int64_t) dev->max_delta_ns);
+	delta = max(delta, (int64_t) dev->min_delta_ns);
 
-	if (delta > (int64_t)dev->min_delta_ns) {
-		delta = min(delta, (int64_t) dev->max_delta_ns);
-		cycles = ((u64)delta * dev->mult) >> dev->shift;
-		if (!dev->set_next_event((unsigned long) cycles, dev)) {
-			dev->next_event_forced = 0;
-			return 0;
-		}
-	}
+	cycles = ((u64)delta * dev->mult) >> dev->shift;
+	rc = dev->set_next_event((unsigned long) cycles, dev);
 
-	if (dev->next_event_forced)
-		return 0;
-
-	if (dev->set_next_event(dev->min_delta_ticks, dev)) {
-		if (!force || clockevents_program_min_delta(dev))
-			return -ETIME;
-	}
-	dev->next_event_forced = 1;
-	return 0;
+	return (rc && force) ? clockevents_program_min_delta(dev) : rc;
 }
 
 /*
