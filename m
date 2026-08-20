Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B1B3E16A5
	for <regressions@lists.linux.dev>; Thu, 20 Aug 2026 09:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217061; cv=none; b=WaDl3fAKl93D3G5FV8W5vK0G5ilEtv3Gzlb7SpRF2Dd+ftnOAmMyjE0f1KD8wXuiuxvBCyg3kofDG0+35Wf14wLAuCflIruBu9ZrEAOHjefeTiyYJCaB6hrH+xeWCGykM2oeznkL/1JCIXHeuvtq0H3zJZJ+tkPOoMKhK/Dr07E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217061; c=relaxed/simple;
	bh=bsLUJo8tZ9kswRSt3+A2R0WwMb/iNELnEFrWhHSZpbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=ht0HVjfI/KW7iPfNhUsP/4MvDJwCwA9cVomOZ0k+XpvCsYzY2+MgKCNeKbo3cEGGqkvHge5XuqcRxxYW5l5L/eX5iZxgWX2/enjgjtvtaCnqXfMcvu8JkMi92pxAqPbtb70L8P+XjvBxnT36kMi2jpwBqJQLX4ZQCerYDVfGpy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 20 Aug
 2026 17:10:48 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 20 Aug 2026 17:10:48 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Thu, 20 Aug 2026 17:10:48 +0800
Subject: [PATCH] ARM: Restore get_cycles() return value
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260820-b4-arm-get-cycles-v1-1-33d0ee0cf141@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAJfEhmoC/x3MSQqAMAxA0atI1gZqCU5XERc1Rg040Yoo4t0tL
 t/i/weCeJUAdfKAl1ODbmtElibAk1tHQe2jwRqbm9Ia7AidX3CUA/nmWQJSQUSV65ldBrHbvQx
 6/c+mfd8PYAQ7eGMAAAA=
X-Change-ID: 20260820-b4-arm-get-cycles-474449adcca1
To: Thomas Gleixner <tglx@kernel.org>, Russell King <linux@armlinux.org.uk>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<regressions@lists.linux.dev>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787217048; l=2783;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=bsLUJo8tZ9kswRSt3+A2R0WwMb/iNELnEFrWhHSZpbo=;
 b=ga5xC3OrG6ZPzsdK4lBV9ivlT3Yw4eE4YCT9KWENgRO9js7lUrHJx1SUuwb4f6O7v75v9tT1m
 LzE7FpwFXfqDMDAQ7Iq0fiUlClNqNS+V52m4MbjnPtIn0tcrDVs/tC6
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

read_current_timer() returned 0 on success, so the get_cycles() ternary
yielded the cycle count on success and 0 on failure. delay_read_timer()
returns true on success, but the ternary was left alone, so get_cycles()
now yields 0 on success and an uninitialised variable on failure.

Swap the arms of the ternary to restore the original meaning.

Fixes: dfc256dac54c ("calibrate: Rework delay timer calibration")
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Found by bisecting a boot failure on an Aspeed AST2600 EVB (ARMv7):

  3ed403bbc967 ("treewide: Remove CLOCK_TICK_RATE")       boots
  030c9f813b8e (Merge tag 'timers-cleanups-2026-08-17')   hangs

dfc256dac54c is the only commit between the two that touches ARM. With
earlycon enabled the output stops at:

  Serial: 8250/16550 driver, 6 ports, IRQ sharing enabled
  printk: legacy console [ttyS4] disabled

where a working kernel continues with:

  1e784000.serial: ttyS4 at MMIO 0x1e784000 (irq = 33, ...) is a 16550A
  printk: legacy console [ttyS4] enabled
  printk: legacy bootconsole [uart8250] disabled

The earlycon is still registered where the output stops, so this is a hang
rather than lost output. Without earlycon there is no output at all, since
the real console only registers at ~0.19s on this platform.

With this patch applied the AST2600 EVB boots to userspace again, and the
8250 registration completes as it did before dfc256dac54c:

  Serial: 8250/16550 driver, 6 ports, IRQ sharing enabled
  printk: legacy console [ttyS4] disabled
  1e784000.serial: ttyS4 at MMIO 0x1e784000 (irq = 33, ...) is a 16550A
  printk: legacy console [ttyS4] enabled

Note that every other architecture touched by dfc256dac54c dropped its
asm/timex.h in favour of the asm-generic one. ARM kept its copy with the
"Temporary workaround until timex.h is cleaned up" comment, which is where
the inversion slipped in.
---
 arch/arm/include/asm/timex.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/timex.h b/arch/arm/include/asm/timex.h
index 94e40c19cfc5..4d31eab9dba2 100644
--- a/arch/arm/include/asm/timex.h
+++ b/arch/arm/include/asm/timex.h
@@ -13,7 +13,7 @@ typedef unsigned long cycles_t;
 // Temporary workaround until timex.h is cleaned up
 bool delay_read_timer(unsigned long *t);
 
-#define get_cycles()	({ cycles_t c; delay_read_timer(&c) ? 0 : c; })
+#define get_cycles()	({ cycles_t c; delay_read_timer(&c) ? c : 0; })
 #define random_get_entropy() (((unsigned long)get_cycles()) ?: random_get_entropy_fallback())
 
 #endif

---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260820-b4-arm-get-cycles-474449adcca1

Best regards,
-- 
Ryan Chen <ryan_chen@aspeedtech.com>

