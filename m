Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F44736F8EA
	for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 19:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788203230; cv=none; b=s10mMb4SVCX1s3hwfvK93p8FKzrA0QX91Je6ijPzWFDoIehODA2XoGgrdeGI/00tug/MxoXxO/8iINxQ0/w3YbT4R/DZH6sA/++uUsWjw4T4/kpOJYh5P6Do8iJ3Ee/TpasriUPw8wZOH51zaJs9IekwXmX1IAirLAJJ4KuROQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788203230; c=relaxed/simple;
	bh=9FDpS9NhatT0d1jYehrEM/mUCpteaEU5GPgN/Tt9iX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dwIuUjuhVP4aCP7FaBOvTB8h6lS2hkVoBlkOJVnMIc6z0qUrszx5gbCiKaLkf0hIQa2ktDpJRYH9xSCuLi+AdSX8l76XP7PyTcdJDmAxmknNFL5d8GCf1YQG5tpKWdE135yKnMit+wfo8oJu/FxUVUvdOeiJW9Jw5E1ow7aeYFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyRhAV6A; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyRhAV6A"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so5388508a91.0
        for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 12:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788203227; x=1788808027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=02SBPmSvkE0WBy94vSJUxH61zT0eR0teqwzcm9hpKxQ=;
        b=YyRhAV6Abn9E+OEQvME9gwBUA2K9/WwEb1QIG+YWr/oTeYdV4ru/BBO1BiQJPPqDZl
         IppxOnUGTMrajKQM22SyYew9wkhA5Q5oiRD+FIxbZs3Pv01+gkh+FxtmcnMSb5tNwd57
         E7g0QMSPsAmp/JKMXqhY1CSrjAf0rGyS5tdiaKr6OM6NeHBCKDshEL3eUGFiUOx5yULV
         a2lPhD4bJBWdF9aYLcvPKLoqGxgwFkkLponDZzrMYtXPA+knLZvWaPrQF6/XqKE7oP/6
         XoNJxHN3CoGwqQ5HMC67A3tj1Sj6545B9na/XbhGmMvJZTKfHkPMH7xAsu0qqNdhI+8Q
         awQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788203227; x=1788808027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=02SBPmSvkE0WBy94vSJUxH61zT0eR0teqwzcm9hpKxQ=;
        b=ehiTLCtJVIU2xKtO/T5qkHvFQQIuZU5siBWLTp+iH3t1bq6e6ZH947nTTWx8v33oWy
         TfIgpiHHWT8bg0BPAyILPi+lsQDv1vYv60KDDZbKAyg03Hr5HrQ0qoz0EOzf+0B/2dQa
         WY+aO/fkpw8YAkXAxRkyygeMPrftLzS+9u0FQEPvDfRXisBGEOKyTZT2ziu3Tf6gEyJd
         f9qF7pNhD7y4MVkRqKzddHDmREK9VVpgtZotSMbAQcir1G/0qcPzg6UOZPE5DNjLt8/r
         qROIZ3T4kTirA2GsPXNc16JY8bsJgc3ILPtiMMfGJ3LCgO5yJLw2JkqGJIV/vfQIgeA8
         g7Dw==
X-Forwarded-Encrypted: i=1; AKwUvBysOEZg3Z0a05vGUvLma2O9JqsGSe9w3lgTjCEMkpyZikqGWNs5GvTE8x4Lqfx7puf0eDf1Jj5wTC0w9w==@lists.linux.dev
X-Gm-Message-State: AFuF++lJZ11KoQM+b9mpUiHIp6+/GW3S+kOiPJgQu8Xpzg2uA0ZLcyfK
	XAzDCyiGoMumsLPuyZmK+bFNanqDMjin4eiaew8w0tp6xEeG+ucZz8q0
X-Gm-Gg: AYBFou1eH5bykUxzeH3+zoNRoXFIfC5VAEVNoMe3h1nwN6rQc9O/DulmY+e80LOB60p
	c30raNA7/3BCTrQWE1fVxZm+uo6cklt262V9CEhL/mvdd6Zn+zyfvhq6dSJ+LVLOcxRagRuZqFX
	5+4RRcDswpvbGt1+fhVBwa2jk79ePfjHhBUUIFeVHeNW+/EKTVKyDdmZetrz0dcC5wZabyUc2KE
	fKW4HKKFPBZGzV8MPpzYrSE50uFBwK9ym3erxL58ZVFZY6+aP0NxS7TJecs/iq1flb/vewfJU+M
	zWDOyQCoIyAmmJbg3ybJeak7MpE5qCOo41rT3N9SBUmfjhuMB2t1HwoQoesHWy4RresO9eGdgv0
	NUjii4Wci3Gkl2q6XA5cDdKHeSUI5xV7Cfv4naMggqX9TnDcIkeR2pmebK+nBFBEPo3jAPEz8k2
	GvDKqpyoxLfy/qyPWnf8DoHL17UNBtpAuc9xD2LiHShOJI1PguTC9iajkctliYGAWNnUhD0R++s
	oXA2E89++nk2/LpLwIifgsI2Oa2
X-Received: by 2002:a17:90b:4b11:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39907e499f7mr3233657a91.19.1788203226753;
        Mon, 31 Aug 2026 12:07:06 -0700 (PDT)
Received: from localhost ([2409:40c4:13b:7a31:95ce:ef4b:57cf:6fd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm36342147eec.14.2026.08.31.12.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:07:06 -0700 (PDT)
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathieu Fluhr <mathieu.fluhr@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Subject: [PATCH 1/2] usb: hub: use shorter 120ms post resume hold for SS root hubs
Date: Tue,  1 Sep 2026 00:33:48 +0530
Message-ID: <20260831190349.29590-1-lovekeshsolanki00@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 8f5b7e2bec1c ("usb: hub: fix detection of high tier USB3 devices
behind suspended hubs") holds a runtime PM reference for
USB_SS_PORT_U0_WAKE_TIME (200ms) after every SS hub resume, so
downstream links have time to finish trianing before the hub can
suspend again.

But 200ms is excessive for root hubs since a root hub has no upstream
suspended hub whose wake propagation needs to be accounted for.
The root hub still needs some time for USB3 link training to complete,
And root hubs also default to zero auto suspend delay and get
periodically resumed by userspace USB enumeration opening and
closing their usbfs nodes (adb, libusb).
This extra 200ms hold stretches this resume into a suspend/resume
cycle of roughly once per second, which on idle AMD systems have
been reported to cause system freezes.

Shorten the post resume hold to 120ms only for root hubs but
keep the 200ms for external hubs that the original commit is
intended for.

Reported-by: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Link: https://lore.kernel.org/all/CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com/
Cc: stable@vger.kernel.org
Fixes: 8f5b7e2bec1c ("usb: hub: fix detection of high tier USB3 devices behind suspended hubs")
Signed-off-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
---
 drivers/usb/core/hub.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3345b3298daf..e1415ad5f908 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -76,6 +76,12 @@
  */
 #define USB_SS_PORT_U0_WAKE_TIME	200  /* ms */
 
+/*
+ * Root hubs have no upstream hub whose wake propagation needs to be
+ * accounted for, but still needs time for USB3 link training to complete.
+ */
+#define USB_SS_ROOT_HUB_U0_WAKE_TIME 120 /* ms */
+
 /* Protect struct usb_device->state and ->children members
  * Note: Both are also protected by ->dev.sem, except that ->state can
  * change to USB_STATE_NOTATTACHED even when the semaphore isn't held. */
@@ -1358,7 +1364,9 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
 
 		queue_delayed_work(system_power_efficient_wq,
 				   &hub->post_resume_work,
-				   msecs_to_jiffies(USB_SS_PORT_U0_WAKE_TIME));
+				   msecs_to_jiffies(hdev->parent ?
+			USB_SS_PORT_U0_WAKE_TIME :
+			USB_SS_ROOT_HUB_U0_WAKE_TIME));
 		return;
 	}
 
-- 
2.55.0

