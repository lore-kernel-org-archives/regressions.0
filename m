Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9255A1EA74
	for <regressions@lists.linux.dev>; Tue,  5 Mar 2024 06:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709620736; cv=none; b=VH64CQFjwnZEV+gTvc566qARMkdjwroaKOJV3srGUAQM3MKT8MfA7dJlC8x+AEkpnzTrQ+8MWLJk7dfEdEzH1zz5rkXLMyzdSDTUCy2Y5Gz8j/Gmjk4yitLsDmxHesXjZdSOhvzby3C1EjXLEZqGJSRWukjzZIGfoOjBWj4EgQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709620736; c=relaxed/simple;
	bh=pYG9YvT1SMUI80eGsUOG68mve36mY43Rx4euUJS46Hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SAwpBvudxq+Y7lDtnCilqvxJSIM5rWZGeppWrphDNVz+g8S/nPyfPtnSKx7cGanJpuQex7bzExNJ2Skzg0KiZHEIx/NgysY5d7HAqsb/rkJY/Qn/V7quH+51Epcenb7q46gut1x2pew3H9D3Az2Y4U6DnbLCCmZRMaccOhUQvsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yjy3kQhc; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yjy3kQhc"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a449c5411e1so483209066b.1
        for <regressions@lists.linux.dev>; Mon, 04 Mar 2024 22:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709620732; x=1710225532; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F4lqce3c2dFrm3B5RMfRQGgPIdA+euQy+6IrUb0/Id0=;
        b=Yjy3kQhcImAu2SClOq5yOqaUPLnp10jKLbYvbweMuXxP/Td7kUsuiz9v1LNN6byGO3
         WGg3aPVJVQFRDu3LZ9uDPEPajagrlsn05oHt2dtVyahFgknI+Kez+P5b6pd7TMYQuGD7
         6+SYuf0Cnofa/Nf5U1j3hOytupcV85THBSDno1CM/2xU4KQAxEBNYk3G7Dv98y0rEM5Y
         qv1lWnGlLzbot/p9JWAuUGKeekx0SIvguHypnSp9YgTKi71TlEn+hVxHWIWBcLDt7M66
         s5PwqJZMUCmGhzzly5BstNlfMoBkaVCTf6RAZc/7DnUM9IFGVI3dtouMiMOvXUCwfyQV
         43TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709620732; x=1710225532;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4lqce3c2dFrm3B5RMfRQGgPIdA+euQy+6IrUb0/Id0=;
        b=o70qXDmrKVckgflGbi5EPsu3TofI57HkzV0WyFqOhIyqP2/DJZlFFcj7jbbi0lGcYy
         Tf79K6JWrFKAIMsOFSJmq3sNyEG79RSODwyHhS0xF21JrxkSzwr0hasvnH5ICHQSUuv9
         rwvTisWpP5zL+3+anRCFhJQLLr7rUa9MlwiMOD1GVNfzM/+/X1ek3jJwSXAUnr3GBeLg
         SGnV3PEwcqZLR1KgL9BjFs5UZFy3cno1hVFhYJEi7AFxrk1rTnnCtW59Ulk1KES8c2ll
         ABeoQ5/SrNrKT4Q2A/rmaRnsGUk+yy3GpvN4lJt6EUSaL54PMEhtwBsspTqICuLwDm8s
         RMHw==
X-Forwarded-Encrypted: i=1; AJvYcCUbvfPvujwEe87qCTZylRAHthtMhHJyoWZcJcS81RR/zGYijPTOMFc2QmLfeA7FIVHy6btNE52LBzVLtgU78eJjfbq5iA/5e75cpgA=
X-Gm-Message-State: AOJu0YziAQfR6BGyLOf5EDsIYlXe+ieWCz2OUoWiikgq2t69O8W5+Y0U
	eqSZXEPvrcG99OYP9sTAX05hvljR94nykeGPaBCTqRyqBodVAdCHjsNjsZsnMp95+w==
X-Google-Smtp-Source: AGHT+IGVmyengybgMEYLP9jaaiQkDrzLZngRGvSpYReOsmzmqaFEqUyNbeUoNMbtPSluTsfARJzmdw==
X-Received: by 2002:a17:906:355a:b0:a43:f1d9:400a with SMTP id s26-20020a170906355a00b00a43f1d9400amr8379855eja.26.1709620732183;
        Mon, 04 Mar 2024 22:38:52 -0800 (PST)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id ts14-20020a170907c5ce00b00a3e70fec6a0sm5825462ejc.171.2024.03.04.22.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 22:38:51 -0800 (PST)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Tue, 05 Mar 2024 07:38:33 +0100
Subject: [PATCH v2] Revert "Input: bcm5974 - check endpoint type before
 starting traffic"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-revert_bcm5974_ep_check-v2-1-925ae9b188d9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOi95mUC/4WNUQ6CMBBEr0L225p2KYJ+eQ9DSClb2GiBtIRoC
 He3cgE/32TmzQaRAlOEW7ZBoJUjT2MCPGVgBzP2JLhLDChRy1wWIpUoLE1rfXEtdUNzYweyT5G
 XDs3FtFgqDWk9B3L8PsyPOvHAcZnC5zha1S/971yVUKJrtZMasagqd++94dfZTh7qfd+/DXjvL
 b4AAAA=
To: Henrik Rydberg <rydberg@bitmath.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 regressions@lists.linux.dev, Jacopo Radice <jacopo.radice@outlook.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709620731; l=3564;
 i=javier.carrasco.cruz@gmail.com; s=20230509; h=from:subject:message-id;
 bh=pYG9YvT1SMUI80eGsUOG68mve36mY43Rx4euUJS46Hg=;
 b=Zde60qLLi5bS45p8h65QK5oRKpcER0GR/qAaBAv58kkMU7CT7Mfu2F8U3l0FqZ9ru4AWjft6q
 zA2zf4P+QHYAs9P3f4wQ14CvW9ZnCuMuAbpnbdvp7AW0A4B6Zged5B6
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=

This patch intended to fix an well-knonw issue in old drivers where the
endpoint type is taken for granted, which is often triggered by fuzzers.

That was the case for this driver [1], and although the fix seems to be
correct, it uncovered another issue that leads to a regression [2], if
the endpoints of the current interface are checked.

The driver makes use of endpoints that belong to a different interface
rather than the one it binds (it binds to the third interface, but also
accesses an endpoint from a different one). The driver should claim the
interfaces it requires, but that is still not the case.

Given that the regression is more severe than the issue found by
syzkaller, the best approach is reverting the patch that causes the
regression, and trying to fix the underlying problem before checking
the endpoint types again.

Note that reverting this patch will probably trigger the syzkaller bug
at some point.

This reverts commit 2b9c3eb32a699acdd4784d6b93743271b4970899.

Link: https://syzkaller.appspot.com/bug?extid=348331f63b034f89b622 [1]
Link: https://lore.kernel.org/linux-input/87sf161jjc.wl-tiwai@suse.de/ [2]

Fixes: b516b1b0dfcc ("Revert "Input: bcm5974 - check endpoint type before starting traffic"")
Reported-by: Jacopo Radice <jacopo.radice@outlook.com>
Closes: https://bugzilla.suse.com/show_bug.cgi?id=1220030
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Changes in v2:
- Add "Reported-by", "Closes" and "Link" tags.
- Use shorter lore link.
- Link to v1: https://lore.kernel.org/r/20240305-revert_bcm5974_ep_check-v1-1-db4f0422588f@gmail.com
---
 drivers/input/mouse/bcm5974.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/input/mouse/bcm5974.c b/drivers/input/mouse/bcm5974.c
index 953992b458e9..ca150618d32f 100644
--- a/drivers/input/mouse/bcm5974.c
+++ b/drivers/input/mouse/bcm5974.c
@@ -19,7 +19,6 @@
  * Copyright (C) 2006	   Nicolas Boichat (nicolas@boichat.ch)
  */
 
-#include "linux/usb.h"
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/slab.h>
@@ -194,8 +193,6 @@ enum tp_type {
 
 /* list of device capability bits */
 #define HAS_INTEGRATED_BUTTON	1
-/* maximum number of supported endpoints (currently trackpad and button) */
-#define MAX_ENDPOINTS	2
 
 /* trackpad finger data block size */
 #define FSIZE_TYPE1		(14 * sizeof(__le16))
@@ -894,18 +891,6 @@ static int bcm5974_resume(struct usb_interface *iface)
 	return error;
 }
 
-static bool bcm5974_check_endpoints(struct usb_interface *iface,
-				    const struct bcm5974_config *cfg)
-{
-	u8 ep_addr[MAX_ENDPOINTS + 1] = {0};
-
-	ep_addr[0] = cfg->tp_ep;
-	if (cfg->tp_type == TYPE1)
-		ep_addr[1] = cfg->bt_ep;
-
-	return usb_check_int_endpoints(iface, ep_addr);
-}
-
 static int bcm5974_probe(struct usb_interface *iface,
 			 const struct usb_device_id *id)
 {
@@ -918,11 +903,6 @@ static int bcm5974_probe(struct usb_interface *iface,
 	/* find the product index */
 	cfg = bcm5974_get_config(udev);
 
-	if (!bcm5974_check_endpoints(iface, cfg)) {
-		dev_err(&iface->dev, "Unexpected non-int endpoint\n");
-		return -ENODEV;
-	}
-
 	/* allocate memory for our device state and initialize it */
 	dev = kzalloc(sizeof(struct bcm5974), GFP_KERNEL);
 	input_dev = input_allocate_device();

---
base-commit: 90d35da658da8cff0d4ecbb5113f5fac9d00eb72
change-id: 20240305-revert_bcm5974_ep_check-37f2a6ab2714

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

