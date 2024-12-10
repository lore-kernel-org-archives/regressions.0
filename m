Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1161DC9A2;
	Tue, 10 Dec 2024 10:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733825728; cv=none; b=ByrGRdFGbxkVx9ycI4QDsAkdhJ/GFVvUFgvNyrFUGT/nq69qhgw8kIS2XoG/s9vYdCzQdKhOY1Y7hc22rLMThqGRFO7ezoPx2OZC4soRk5ixYQNOmPlRfkGaBNCBWGz6iSTXEvum13oGQh/hzA+8KZEcfjTVVuLYWNU+7EGw3lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733825728; c=relaxed/simple;
	bh=LW1aJqCoSJ8m4tmhe3iuXeg4RU4Sa0vyycbay5ZdW8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QK7/S5M3ph+Z6GTaRTggQijoqSNyU4hwgnSi3kkx+tAa4xh+Ihsq51Nwsl2xyEQfGnPO8tfamoUeLE7aYyiGPipdmQEJuHS6fWmwhW4Y6sS4pp/zaDH7sS+XoXAL5TzzfLFzd+p4MlGvtHp36BkEFidWd0k5gKreNsRPO+sQ6+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=B+4L3EIM; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="B+4L3EIM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Sender:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=DBlAgcC0lAJ93nNprzRDxqqnlzjTKFgzWSH/LtpolGQ=; t=1733825726;
	x=1734257726; b=B+4L3EIMZ38+Y03z/YLEtAQ/pzObRQZ+lLKq8ubju2Sbdah6TeYmvEgZpeJFc
	PDoCK1MCxQHC7Rw0IcA57xFFq47lZKnT07G15vSnPgiworJGM6/7+TieEu9NxgH/81CC8wpSaDdCW
	rjreCYIm/+D1BDXU0cxzt7cGqPPt0Vo5FtIqyDRcVSQNs9NmAVHAYFO1cT+SlDrjFJzvBMtgohaWL
	iFq1G01NgJ8fmO1Chzj2pgn8LcqV4p1IClzcdmNx1SyF5LGT4cMkbjQ4vlyps86hAnob4mEX/umPM
	2gEy6GPSfjNO7uAe/4H1Y9PkKataH9Jmh8ILVdYQY/gPGSSymw==;
Received: from ip4d148da6.dynamic.kabel-deutschland.de ([77.20.141.166] helo=truhe.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	id 1tKxGv-002jXf-1s;
	Tue, 10 Dec 2024 11:15:17 +0100
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>,
	workflows@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-doc@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH v1 4/6] docs: 6.Followthrough.rst: tags to use in regressions fixes
Date: Tue, 10 Dec 2024 11:15:13 +0100
Message-ID: <5913a87f05a5fe53afb9aae151f60f83bda128e8.1733825632.git.linux@leemhuis.info>
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
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1733825726;c4973ef4;
X-HE-SMSGID: 1tKxGv-002jXf-1s

Add a few notes on the appropriate tags to be used in changes that fix
regressions.

This removes equivalent paragraphs from a section in
Documentation/process/handling-regressions.rst, which will become mostly
obsolete through this and follow-up changes.

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---

Note:

* Not sure if the "add a second Fixes: tag for the change that exposed
  an earlier problem" is appropriate, but it results in the most
  reliable solution without much overhead.

* On a brief look it might seem like this changes the "participation in
  stable is optional for mainline developers" approach. But that is not
  the case, as the point is just kindly asking developers to take care
  of stable inclusion.
---
 Documentation/process/6.Followthrough.rst      | 16 ++++++++++++++++
 Documentation/process/handling-regressions.rst |  7 -------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/process/6.Followthrough.rst b/Documentation/process/6.Followthrough.rst
index 763a80d21240f0..2ba16a71aba9b4 100644
--- a/Documentation/process/6.Followthrough.rst
+++ b/Documentation/process/6.Followthrough.rst
@@ -234,6 +234,22 @@ On procedure:
    requests again should ideally come directly from maintainers or happen in
    accordance with them.
 
+On tags in the patch description of regressions fixes:
+
+ - Include the tags Documentation/process/5.Posting.rst mentions for
+   regressions; this usually means a "Reported-by:" tag followed by "Link:" or
+   "Closes:" tag pointing to the report as well as a "Fixes:" tag; if it's a
+   regression a later change exposed, add a "Fixes:" tag for that one, too.
+
+ - Did the culprit make it into a proper mainline release during the past
+   twelve months? Or is it a recent mainline commit backported to stable or
+   longterm releases in the past few weeks? Then you are kindly asked to ensure
+   stable inclusion as described by Documentation/process/stable-kernel-rules.rst.
+   Usually you want to realized thos by adding a "Cc: stable@vger.kernel.org" to
+   the patch description.  Note, a "Fixes:" tag alone does not guarantee a
+   backport, as the stable team does not pick up all such changes and might
+   silently drop them in case trouble arises.
+
 Regarding stable and longterm series:
 
  - You are free to leave handling regressions to the stable team if the problem
diff --git a/Documentation/process/handling-regressions.rst b/Documentation/process/handling-regressions.rst
index cfb44a9928d450..da53e12fc6d96c 100644
--- a/Documentation/process/handling-regressions.rst
+++ b/Documentation/process/handling-regressions.rst
@@ -196,13 +196,6 @@ On procedure:
    regressions to be handled like those from the current cycle, unless fixing
    bears unusual risks.
 
-Regarding stable and longterm kernels:
-
- * If a regression made it into a proper mainline release during the past
-   twelve months, ensure to tag the fix with "Cc: stable@vger.kernel.org", as a
-   "Fixes:" tag alone does not guarantee a backport. Please add the same tag,
-   in case you know the culprit was backported to stable or longterm kernels.
-
 On patch flow:
 
  * Developers, when trying to reach the time periods mentioned above, remember
-- 
2.45.0

