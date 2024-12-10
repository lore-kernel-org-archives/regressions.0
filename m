Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C9623DEAC;
	Tue, 10 Dec 2024 10:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733825729; cv=none; b=QCu36XYSqyM7eV6qPPs0g+j/d5NmUQnyUIBDicy07vega8RlcMSqPM1veukuIRaDXO7wiK3i3+CxMj8J25zS51nYHyGFt7oeaWqJOLyyi8+I4eJDkx+QJk14SIhqaHhX9BCk9xdGkpmZ0BWxqbZ4i4Ps+BpFbPpPtWNzyarmLKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733825729; c=relaxed/simple;
	bh=roBXrszXjh2S99f6sjaU0YjTX9NYD/tnCV6ZlGoI6hE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gdpgGsBb9BPCdUqkc+0YDJJQ94FhcsH5UrnZsZRstW0A9MuAH7B6wBy8D58hjMtdHdWHN7JNoauDTdOcBrwIq1Hly5ZPgkga3rf5145hHDghdEnksdzB4psKOSNPmZydSj2IVi6G/6oY2yIW0FJIktTjxWJsrxn3xF999e6VaHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=C0Z2tk+e; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="C0Z2tk+e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Sender:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=R7HvXsLtjprjhd51NOldorbZLoyGDwY4IMtpLQ/3spM=; t=1733825727;
	x=1734257727; b=C0Z2tk+eXQamGo6CdSOHywocg8urcSDrEnpcC8Ln1h43AqaTMc4ymnUDsJYLt
	BmBsqGl98XQpiqP5GpGzF2qJslgJ0kYzWdOxJieTezIvBv7TUJokQpyaT6+0dBC0uWSXZqnqtUPg6
	y0cjSnQGNEaUrp0t/c7ezaugA09cUFew7BYJqT5R2x3dsnRIxpjIwscsds4xY6wknVb32gDyxfNBG
	vBYMI/bBS60Y8jIOWPjAHZAMrsBtX5z55du3rBQCv91S7E8Kjf9sg+S1kIBVtu2km53upb6lgjdw0
	NA69jgw66nnWZ6rgjcdPhsj/2puG2ju/PDmZmhwm8I7Dc01KDw==;
Received: from ip4d148da6.dynamic.kabel-deutschland.de ([77.20.141.166] helo=truhe.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	id 1tKxGv-002jXf-0g;
	Tue, 10 Dec 2024 11:15:17 +0100
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>,
	workflows@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-doc@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH v1 3/6] docs: 6.Followthrough.rst: interaction with stable wrt to regressions
Date: Tue, 10 Dec 2024 11:15:12 +0100
Message-ID: <d7793d2e788e7d98a67e90f85a77d42dab1b8da1.1733825632.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1733825632.git.linux@leemhuis.info>
References: <cover.1733825632.git.linux@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1733825727;175a7289;
X-HE-SMSGID: 1tKxGv-002jXf-0g

Add a few notes on how the interaction with the stable team works when
it comes to mainline regressions that also affect stable series.

This removes equivalent paragraphs from a section in
Documentation/process/handling-regressions.rst, which will become mostly
obsolete through this and follow-up changes.

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
 Documentation/process/6.Followthrough.rst     | 22 +++++++++++++++++++
 .../process/handling-regressions.rst          | 19 ----------------
 2 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/Documentation/process/6.Followthrough.rst b/Documentation/process/6.Followthrough.rst
index f9ae3a86ee0c49..763a80d21240f0 100644
--- a/Documentation/process/6.Followthrough.rst
+++ b/Documentation/process/6.Followthrough.rst
@@ -234,6 +234,28 @@ On procedure:
    requests again should ideally come directly from maintainers or happen in
    accordance with them.
 
+Regarding stable and longterm series:
+
+ - You are free to leave handling regressions to the stable team if the problem
+   at no point in time occurred with mainline or was fixed there already.
+
+ - When receiving reports about regressions in recent stable or longterm kernel
+   series, consider evaluating at least briefly if the issue might happen in
+   current mainline as well -- and if that seems likely, take hold of the
+   report.  If in doubt, ask the reporter to check mainline.
+
+ - Fix regressions quickly in mainline, whenever you want to swiftly resolve one
+   that recently made it into a mainline, stable, or longterm release; in urgent
+   cases hence involve Linus to fast-track fixes (see above).  This route is
+   required, as the stable team normally does neither revert nor fix any changes
+   in their trees, as long as they cause the same problem in mainline.
+
+ - In case of urgent fixes for regression affecting a recent mainline, stable,
+   or longterm release, you might want to ensure prompt backporting by dropping
+   the stable team a note once the fix was mainlined; this is especially
+   advisable during merge windows and shortly thereafter, as the fix otherwise
+   might land at the end of a huge patch queue.
+
 
 Other things that can happen
 -----------------------------
diff --git a/Documentation/process/handling-regressions.rst b/Documentation/process/handling-regressions.rst
index c020418499f6a2..cfb44a9928d450 100644
--- a/Documentation/process/handling-regressions.rst
+++ b/Documentation/process/handling-regressions.rst
@@ -198,30 +198,11 @@ On procedure:
 
 Regarding stable and longterm kernels:
 
- * You are free to leave regressions to the stable team, if they at no point in
-   time occurred with mainline or were fixed there already.
-
  * If a regression made it into a proper mainline release during the past
    twelve months, ensure to tag the fix with "Cc: stable@vger.kernel.org", as a
    "Fixes:" tag alone does not guarantee a backport. Please add the same tag,
    in case you know the culprit was backported to stable or longterm kernels.
 
- * When receiving reports about regressions in recent stable or longterm kernel
-   series, please evaluate at least briefly if the issue might happen in current
-   mainline as well -- and if that seems likely, take hold of the report. If in
-   doubt, ask the reporter to check mainline.
-
- * Whenever you want to swiftly resolve a regression that recently also made it
-   into a proper mainline, stable, or longterm release, fix it quickly in
-   mainline; when appropriate thus involve Linus to fast-track the fix (see
-   above). That's because the stable team normally does neither revert nor fix
-   any changes that cause the same problems in mainline.
-
- * In case of urgent regression fixes you might want to ensure prompt
-   backporting by dropping the stable team a note once the fix was mainlined;
-   this is especially advisable during merge windows and shortly thereafter, as
-   the fix otherwise might land at the end of a huge patch queue.
-
 On patch flow:
 
  * Developers, when trying to reach the time periods mentioned above, remember
-- 
2.45.0

