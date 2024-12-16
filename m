Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A34D1482E1
	for <regressions@lists.linux.dev>; Mon, 16 Dec 2024 15:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734361732; cv=none; b=kVkxYYiPoVmrNJD/vNt1ehK8qxSgeWC0ikfHmIuhwtOqn5ZU00PETK2Cz6ZWPRac9nzvs8siz24siKmVbKqVo0+e17RpVzqBJVCOo7AeIFctBAc+8rnEtLoBknsbucnoh3wQnK2xVgSO9Kx+0fNtMAXp63cKixImUD7DN0+lu2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734361732; c=relaxed/simple;
	bh=39buhah7O8V0gWPnXNd4SBatRNxagXAmOIIkESP2Gfo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VXpoQoKcLAki1V7mw4b9K2uHMq0ZM6SB3e5GZ3e4/W3iddhyNM5teY4In1V8iE9NBVBcf41S6waMxvacJBEO6KieFmpKIs3D3AVOgLB5zPeWTX8eYo+/oM3wRGxldyFTjBJ+P/beFGwp1Id04wbA5Vhjo12O1gn9cuX9ddf4P00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DUwWBN1V; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DUwWBN1V"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-385e9c69929so1745294f8f.1
        for <regressions@lists.linux.dev>; Mon, 16 Dec 2024 07:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734361726; x=1734966526; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMvxaK3H7ehB4Fo2EK2FAi003TZH7u0HRSOsLrU2A98=;
        b=DUwWBN1Vs6c28OP3tWWlbdf8AglxsOLJ0ZrAwCMot8ytWTFqhdPzpMxsFv28Msut65
         xA1OP+hN8xemSQKnrXSlkh4Xi/Bajh7J7qx6P7lRYSnz9ZRWbVsJYjl9rcqbQMQchwZO
         sP+k7QiXzOqEKnhcYJJF8veeH4FShQU05QYgXSr1v3SiScEm8l8hKDbfPXJDymXCLd00
         ARoRt6i81edU4KZ2vAW//sdyI1aJ7H87i7NdUM7SaGZj8XL6flQ/yRTv+b7S4gD8tFMQ
         IKRZR4chp/LJh92svZ3q/HPQDsvpXNcXaHlDfaEzgXsvSoyV1sNWJw3cKYZ1e3JnPuKE
         1BOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734361726; x=1734966526;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gMvxaK3H7ehB4Fo2EK2FAi003TZH7u0HRSOsLrU2A98=;
        b=QEGH9L3Gp/K2ATBaUmEjKszlTNzfaQDafTUvfM2BqL+sAj2yLbK/R1ObZO50jnGGr+
         EK89oBE7bJkGeC1wky9BVv8h02ddLrfO5cZ07ss+kUV6eDCpWtfPOwuJLiSjzTtlaVK3
         ZLHF/NRndXl301Jf/gOoSL9jjFsrcwyg/9Y4cIOWekMOp+sg4HjhuEvtLSU+nR+3MJZB
         OV7GelJinnU4Z4ns2BcYy/uIZQQb5QgVsnhVeiDGmc1cuOP8Ai22w/iAYToolw4VgRuv
         pjz0/whwGXH3oCG/8DnT1192sJ8okusp2skIoPQORbnD42/h750FixO19DVH5CwB7BUk
         jfhA==
X-Forwarded-Encrypted: i=1; AJvYcCWrP1G7U1Nq/gA6MaB08Q1dOZIHAR8mblmX6dY9fNv9PE++DY9jwB99e6cOoCGX5FDcF8GKGOmbw1HozA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUP7yzqZ2X1DMCYBqG+J2lb1HJwoGrNbQobrhVdS+uEf7/bore
	mU38F11+PeCpnl4/tm84YV1q1ESDApmBFqMra7zxo0c0IhCiCZHhjc76W4lLr/h621ms88HyYV2
	HJQ==
X-Google-Smtp-Source: AGHT+IE4qP/mYU9srjzQKxvWrJ37nbep1gNjepjF1UFUXvmyPsUPI8qeo3BBgvebbGQdSMAsV1kFE8Dvso8=
X-Received: from edbbt12.prod.google.com ([2002:a05:6402:a4c:b0:5d0:f9e2:d3c4])
 (user=gnoack job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:64a7:0:b0:385:f280:d55
 with SMTP id ffacd0b85a97d-3888e0f2d7amr10190347f8f.37.1734361726616; Mon, 16
 Dec 2024 07:08:46 -0800 (PST)
Date: Mon, 16 Dec 2024 15:07:23 +0000
In-Reply-To: <2024121418-blazer-valiant-c51a@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <2024121418-blazer-valiant-c51a@gregkh>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216150722.4079213-2-gnoack@google.com>
Subject: [PATCH] tty: Permit some TIOCL_SETSEL modes without CAP_SYS_ADMIN
From: "=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jann Horn <jannh@google.com>, "=?UTF-8?q?Hanno=20B=C3=B6ck?=" <hanno@hboeck.de>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-hardening@vger.kernel.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

With this, processes without CAP_SYS_ADMIN are able to use TIOCLINUX with
subcode TIOCL_SETSEL, in the selection modes TIOCL_SETPOINTER,
TIOCL_SELCLEAR and TIOCL_SELMOUSEREPORT.

TIOCL_SETSEL was previously changed to require CAP_SYS_ADMIN, as this IOCTL
let callers change the selection buffer and could be used to simulate
keypresses.  These three TIOCL_SETSEL selection modes, however, are safe to
use, as they do not modify the selection buffer.

This fixes a mouse support regression that affected Emacs (invisible mouse
cursor).

Link: https://lore.kernel.org/r/ee3ec63269b43b34e1c90dd8c9743bf8@finder.org
Fixes: 8d1b43f6a6df ("tty: Restrict access to TIOCLINUX' copy-and-paste sub=
commands")
Signed-off-by: G=C3=BCnther Noack <gnoack@google.com>
---
 drivers/tty/vt/selection.c | 14 ++++++++++++++
 drivers/tty/vt/vt.c        |  3 +--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/vt/selection.c b/drivers/tty/vt/selection.c
index 564341f1a74f..0bd6544e30a6 100644
--- a/drivers/tty/vt/selection.c
+++ b/drivers/tty/vt/selection.c
@@ -192,6 +192,20 @@ int set_selection_user(const struct tiocl_selection __=
user *sel,
 	if (copy_from_user(&v, sel, sizeof(*sel)))
 		return -EFAULT;
=20
+	/*
+	 * TIOCL_SELCLEAR, TIOCL_SELPOINTER and TIOCL_SELMOUSEREPORT are OK to
+	 * use without CAP_SYS_ADMIN as they do not modify the selection.
+	 */
+	switch (v.sel_mode) {
+	case TIOCL_SELCLEAR:
+	case TIOCL_SELPOINTER:
+	case TIOCL_SELMOUSEREPORT:
+		break;
+	default:
+		if (!capable(CAP_SYS_ADMIN))
+			return -EPERM;
+	}
+
 	return set_selection_kernel(&v, tty);
 }
=20
diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 96842ce817af..ed65b3b80fbd 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -3345,8 +3345,7 @@ int tioclinux(struct tty_struct *tty, unsigned long a=
rg)
=20
 	switch (type) {
 	case TIOCL_SETSEL:
-		if (!capable(CAP_SYS_ADMIN))
-			return -EPERM;
+		/* CAP_SYS_ADMIN check happens in set_selection_user(). */
 		return set_selection_user(param, tty);
 	case TIOCL_PASTESEL:
 		if (!capable(CAP_SYS_ADMIN))
--=20
2.47.1.613.gc27f4b7a9f-goog

