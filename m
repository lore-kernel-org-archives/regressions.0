Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DFE20FA99
	for <regressions@lists.linux.dev>; Fri, 10 Jan 2025 14:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736518889; cv=none; b=U5zQeZynw8U/hjmfxa/OQqwG8sYoX8hURRJ4QexJ70IJ7hrKNfMNaRlw3OUulI9UD5YDpE7xW4htbVsw+W6ft+CMmGeuxr3uEaalid0F2fJyPTx8TOwqP3Lm8Vai2BUoCxlOsILwZlCdTesaxqk/X+icK2YNAXPlql9C8aCQAbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736518889; c=relaxed/simple;
	bh=eZLl37fOSbYQYDLGS5Y/QLTa91exobFept6c4ErWMTE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u+R/1b4/h1aF3Cw/SbeKNw4rjreADlZi4kKXsmbvevDefrqy0eYt8pcCHHYhckeX9AaK5NNnix7TDpQNh+6BcOwVMLkmsObMQrBx4sN7agSL8BKKr5LvH9KIWZkybFqAg07kv0lmUqrXiMEdqui7VY93vu34J765b9dXDJil9s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b7m2TNCK; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b7m2TNCK"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5d40db3d084so1806399a12.3
        for <regressions@lists.linux.dev>; Fri, 10 Jan 2025 06:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736518885; x=1737123685; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9umdn33M+pmVRz+NuzpgduvU4xJDCFruejcIKVHUmT0=;
        b=b7m2TNCKXWsrABwYzV/2w7HtfCNEWXhx//oRF4g7oj6eE5fGkVyffdcTOMWFQhGkjq
         Ca437TV/N16XT1n+VE/8QaTU3i0z1/MNvMhXblTYJ7oIOf8WDS6Gw2DrckXIPZzwVrjn
         Ok20Ugyxpachz1N8j0ko8maE1oA3uMWfmDHGvHEOXu6nVyf4em+KcSrsTHcEPEDYfkZR
         HsggfJikEfu9F4cZWd94++d0cslfwd9dxrf//gRBmyXkxA6yfmE92jX3MjWDgPnAmO69
         19u1bCbRwqJgTV3P1vYT0opar8MRJxUOdoLziCAEhQF405OkfN5lei+tIUmyVD0zfA5l
         E3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736518885; x=1737123685;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9umdn33M+pmVRz+NuzpgduvU4xJDCFruejcIKVHUmT0=;
        b=HphGfdNybdv0IOMSzeiI63moTU//rilehCjllRs0q54DTeTAmow7XHuXJ93cSABWzz
         de6jpGzny0jAko8D/Pyhik7vVQajI3ze83tMR1Sf3E0AiS+jub/WgHgxbfxDyX2R5uxw
         YxNgbrYXn1/IkA+Wl07rfKLPafihpnwS5051eM6pvJ/7/ka+iyjERejVJeCPt3uoAFO6
         4GNC9rZwr8bIrhP6HMTD0uUuXgUSpS34qYkXp74O7VQVDmvx7sUwKeK+pmyWIrBPLg1r
         lE0T3hdFCXWq4bEN8rUuYgJyohJp0dgR4IL/v6pNTZpbSk+/cAnzeXxAXmM4I7aqjED/
         NsVA==
X-Forwarded-Encrypted: i=1; AJvYcCX5kDVbZXwKW9/Y1MxY8z8Ec3/pdK/8+gT9U/TUA8DtmVTkPou75BcM2TjRW69LGay5ucSCaDGRX2fIRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAqcQWedJAd1tgwfuioGBVqjhKJNJ6wiUOVgVbI3NklK4RGDAF
	V800DN/o1zwpBtZoNN4YuZgGhrZzx9dEnQHRJ8H25rdvdSiaMFL/NpQuPm9y+n8pOduo/VbXIQc
	CGg==
X-Google-Smtp-Source: AGHT+IHRHNispYW5vs1jXOBSVq75OKtYcFcYRuAEh4jZLhpJkXnr4emt/EvlkNg20gd/mcSFGW2ts8m0Ozk=
X-Received: from edqg23.prod.google.com ([2002:aa7:c597:0:b0:5d9:1530:45a7])
 (user=gnoack job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:278f:b0:5d0:ed92:cdf6
 with SMTP id 4fb4d7f45d1cf-5d972e1c66bmr22388062a12.19.1736518885687; Fri, 10
 Jan 2025 06:21:25 -0800 (PST)
Date: Fri, 10 Jan 2025 14:21:22 +0000
In-Reply-To: <Z2ahOy7XaflrfCMw@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <Z2ahOy7XaflrfCMw@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250110142122.1013222-1-gnoack@google.com>
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
Changes in V2:

 * Removed comment in vt.c (per Greg's suggestion)

 * CC'd stable@

 * I *kept* the CAP_SYS_ADMIN check *after* copy_from_user(),
   with the reasoning that:

   1. I do not see a good alternative to reorder the code here.
      We need the data from copy_from_user() in order to know whether
      the CAP_SYS_ADMIN check even needs to be performed.
   2. A previous get_user() from an adjacent memory region already worked
      (making this a very unlikely failure)

I would still appreciate a more formal Tested-by from Hanno (hint, hint) :)

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

