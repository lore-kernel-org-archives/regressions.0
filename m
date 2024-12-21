Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218F51F2397
	for <regressions@lists.linux.dev>; Sat, 21 Dec 2024 11:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734779452; cv=none; b=cHkJWKX6endoHqLd/+nPOOWwdYVc9KkIHxHf3YEtMbKL80zUjUYFKPZTy6eF8zjxmF5V/2f8IOLxqLSGroOz3E24Xn4bs6U9JeSiSg2iee7N/b4mtFNOHo7pGxe2iiwiL/QMPgz4N+tWM9CuOuJoi7iDG2yl6E35IFo0NGYi+FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734779452; c=relaxed/simple;
	bh=XhWNXFHaJ9glrnThaW+6uFMdg7Jt0dVoQ8ReWmSarVw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BV/eAfagGaUXZ0CQPCGAJTehx8YksrZnFczwP9YkCetborCfkVMn3iQbi+fAcV93MCSYB8VVyus6pvSndJ3Vif6jsf7XAXTnizC3M2EJdEsQ5P436kzQK52D0KwQe4zwCNDrBjQf8GPgNqbYHLF4zdQTHe6mvHSFjChJKFHgxgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MgGpsqdZ; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MgGpsqdZ"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5d3f0411814so2710137a12.0
        for <regressions@lists.linux.dev>; Sat, 21 Dec 2024 03:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734779449; x=1735384249; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=acFqHgTTvDfsaGKKoef1ZEN8Prd2tlZbEpNeYt8pW4w=;
        b=MgGpsqdZ194OH0s6FGoxk/u0XfWHu+zKQ0jA87z9aiya5d2k6xdcT3m7iVW0yq+TpL
         dbElXhBwfHHeMqhkbNQAWPS93g1Hb4s/zt13k3OGA2+LtB/MlSyi5cnVHtGG9sRWYOmk
         DE+8E61dzltaAkQtie/psGaDb+eMS4UoIfCb9xwsYFn5vYSPO+Ci6lahwBtq+RR1FKGJ
         JNek02PoOS8M0ujLLedKJQYjbtpK+nDqsI+LdtR1NLJGPEj7ChmLpzrWfzK5MqEO9FET
         HFLb7DDRBqgyNfP68axjbuAEJP7hUpWR3y/As0KITEl/XCYHae2WuYcIRmWBoWM9li9Q
         HMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734779449; x=1735384249;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=acFqHgTTvDfsaGKKoef1ZEN8Prd2tlZbEpNeYt8pW4w=;
        b=IQJg5vIT7jktKjB6iGB0LNDaU4GXbdTsx24sKpI34CkpLQLV5HD8d2EJkYU6jWZ7TN
         WKqca1dlQbYR+nyiAacNCEr5v6vIEVfLqszIUKx7TKf6tHcrNxjhDBdeQPGMvIldmGme
         cTtrJHlvcCB++AeUNLNlQgdB0mTM6vQhi1+awXCU5G1dsfbN6Qa8ZGQ+ZRyZiUTsLANA
         CeX94ab/0LuB2gYogSob6SvBE9OPGZoTPTH3aGQIWsNMUr7Z2JgHdLXVnvtgo1xe/oAi
         g1ZIaJd/MoQgwqPnqwsJ4mq/azhO744y0yDVGqhMh7PsEJYsz+w/laMpAChsmBdhFpW8
         bI/A==
X-Forwarded-Encrypted: i=1; AJvYcCWsvonR91BbZHEYkrYI+FWOJdKuvdhCrO0Irm/kJVo3huSebuz9eXWq7yvLVX6fSz1+2A9ntfM1qW7uVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMtInF3rwDu8m8o1xeG6O62F6wKxMPJ/+qo1ORcHm8hiVu69aM
	XmLX1Co/YYvUYQtl4k3H3xMde8jZMm34zfkJEyteHmeFNEGjeLgA7I8IC6cc1i2y1mK2ChwruLW
	GYQ==
X-Google-Smtp-Source: AGHT+IGeWbKxpk3gdrLwTVMOGxYTHG++3ekHtzTCNYqK+VxLg7d/tlVkzABgBueeFhOF/tGOx98kdsq6Gwg=
X-Received: from edzf16.prod.google.com ([2002:a05:6402:1950:b0:5d2:7367:4c84])
 (user=gnoack job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:254f:b0:5cf:e71c:ff97
 with SMTP id 4fb4d7f45d1cf-5d81ddfbe45mr4289512a12.24.1734779449412; Sat, 21
 Dec 2024 03:10:49 -0800 (PST)
Date: Sat, 21 Dec 2024 11:10:45 +0000
In-Reply-To: <Z2ahOy7XaflrfCMw@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <Z2ahOy7XaflrfCMw@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241221111045.1082615-1-gnoack@google.com>
Subject: [PATCH v2] tty: Permit some TIOCL_SETSEL modes without CAP_SYS_ADMIN
From: "=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jann Horn <jannh@google.com>, "=?UTF-8?q?Hanno=20B=C3=B6ck?=" <hanno@hboeck.de>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-hardening@vger.kernel.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, stable@vger.kernel.org
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

Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/ee3ec63269b43b34e1c90dd8c9743bf8@finder.org
Fixes: 8d1b43f6a6df ("tty: Restrict access to TIOCLINUX' copy-and-paste sub=
commands")
Signed-off-by: G=C3=BCnther Noack <gnoack@google.com>
---
 drivers/tty/vt/selection.c | 14 ++++++++++++++
 drivers/tty/vt/vt.c        |  2 --
 2 files changed, 14 insertions(+), 2 deletions(-)

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
index 96842ce817af..be5564ed8c01 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -3345,8 +3345,6 @@ int tioclinux(struct tty_struct *tty, unsigned long a=
rg)
=20
 	switch (type) {
 	case TIOCL_SETSEL:
-		if (!capable(CAP_SYS_ADMIN))
-			return -EPERM;
 		return set_selection_user(param, tty);
 	case TIOCL_PASTESEL:
 		if (!capable(CAP_SYS_ADMIN))
--=20
2.47.1.613.gc27f4b7a9f-goog

