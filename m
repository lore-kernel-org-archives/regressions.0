Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5321DC98B;
	Tue, 10 Dec 2024 10:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733825728; cv=none; b=T5uJamSPB2AFJY8Zy4b7HWAckcXRg76h5NWmfyDlQzPKwOo/yGlIjFWQG6cyV1TRfswkQQFaExWOBpZrY/Ng5djNanJ9XxjGbXohq1l/hg7l34nuCSnaxO5TkPD7AQwgesSdWdVRy/IzwPyjVjn4MRgYR1LEKd5cSIIfqrH6+VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733825728; c=relaxed/simple;
	bh=sfeavKl2r9AEVwDcEXqRIpE3kaUz1bnGZjpdszp2shY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lc2JkrPiRsryMaXMih2ZSUN28JjUBzzo9btO6lFTf1qCMl/XJPrDjyY1kLrrnzukXJt7huYlnze0eGLUsRHyYkCzBWa1GGHrvwAwzaPg2qxUWP2thaHL0YoPta+QabGP2BoNuPkkB7WKpi3uw2EPYofqQoVzOZpxwHhmUGXaRXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=lMtVvymG; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="lMtVvymG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Sender:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=ZQ1ex9w1yfpb+h138wxVBgQU274J2TfxvXyscDvRhl0=; t=1733825725;
	x=1734257725; b=lMtVvymGWtiIgdTlU8D8l5cBEcjFR7tU2firam0s4Nw2qRuV+6g1Ztmuc1Yjj
	nO0H9n4k2vRYinO7nbqFJ41kZCbIBu4u+BU91js3rZuNdti96PYbpCF7GkGcR4tT3cUPZg0uD0SrG
	Z9g4XtsTrdSlzWvLoXEkLYj17I6dOUDAo/NRKEqo5UkvQXNQI+rIFBlScSJXuMZCfZn81J4rYErFO
	hLHRNCMZHklXzfU8nZu31uyquQ/Ttzl7J1KXB7qG1wxFV3gQr57F21KbM120iQpg9Kg5jS8+xuQoh
	U0iJ+yB4wwSfiP9Xas0EzSLra18jYc3En6az5SovT4BMnxWVgg==;
Received: from ip4d148da6.dynamic.kabel-deutschland.de ([77.20.141.166] helo=truhe.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	id 1tKxGu-002jXf-1O;
	Tue, 10 Dec 2024 11:15:16 +0100
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>,
	workflows@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-doc@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH v1 1/6] docs: more detailed instructions on handling regressions
Date: Tue, 10 Dec 2024 11:15:10 +0100
Message-ID: <aed019088599c6dc8aab8879dfda35785e01d316.1733825632.git.linux@leemhuis.info>
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
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1733825725;57c6ae47;
X-HE-SMSGID: 1tKxGu-002jXf-1O

Add a few more specific guidelines on handling regressions to the
kernel's two most prominent guides about contributing to Linux, as
developers apparently work with quite different interpretations of what
Linus expects.

Changes like this were asked for during the Maintainers Summit 2024. The
four rules of thumb spelled out are all closely based on statements
Linus made there; LWN documented all except "Expedite fixing regressions
that reached a release deemed for end users.." in their coverage [1].

This removes equivalent paragraphs from a section in
Documentation/process/handling-regressions.rst, which will become mostly
obsolete through this and follow-up changes.

Link: https://lwn.net/Articles/990599/ [1]
Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
 Documentation/process/6.Followthrough.rst     | 63 ++++++++++++++-----
 .../process/handling-regressions.rst          | 12 +---
 Documentation/process/submitting-patches.rst  | 20 ++++++
 3 files changed, 68 insertions(+), 27 deletions(-)

diff --git a/Documentation/process/6.Followthrough.rst b/Documentation/process/6.Followthrough.rst
index 66fa400c6d9405..ed5e32348f2403 100644
--- a/Documentation/process/6.Followthrough.rst
+++ b/Documentation/process/6.Followthrough.rst
@@ -161,16 +161,8 @@ a driver for hardware which is not yet available, you will be surprised by
 how many people will build your code into their kernels.  And, of course,
 where there are testers, there will be bug reports.
 
-The worst sort of bug reports are regressions.  If your patch causes a
-regression, you'll find an uncomfortable number of eyes upon you;
-regressions need to be fixed as soon as possible.  If you are unwilling or
-unable to fix the regression (and nobody else does it for you), your patch
-will almost certainly be removed during the stabilization period.  Beyond
-negating all of the work you have done to get your patch into the mainline,
-having a patch pulled as the result of a failure to fix a regression could
-well make it harder for you to get work merged in the future.
-
-After any regressions have been dealt with, there may be other, ordinary
+If the bug is a regression, you must fix it -- see 'Handling Regressions'
+below. After any regressions have been dealt with, there may be other, ordinary
 bugs to deal with.  The stabilization period is your best opportunity to
 fix these bugs and ensure that your code's debut in a mainline kernel
 release is as solid as possible.  So, please, answer bug reports, and fix
@@ -180,13 +172,50 @@ ones have been taken care of.
 
 And don't forget that there are other milestones which may also create bug
 reports: the next mainline stable release, when prominent distributors pick
-up a version of the kernel containing your patch, etc.  Continuing to
-respond to these reports is a matter of basic pride in your work.  If that
-is insufficient motivation, though, it's also worth considering that the
-development community remembers developers who lose interest in their code
-after it's merged.  The next time you post a patch, they will be evaluating
-it with the assumption that you will not be around to maintain it
-afterward.
+up a version of the kernel containing your patch, etc.  Regressions reported
+at this point again must be fixed.  For other bugs, continuing to respond to
+these reports is a matter of basic pride in your work.  If that is insufficient
+motivation, though, it's also worth considering that the development community
+remembers developers who lose interest in their code after it's merged.  The
+next time you post a patch, they will be evaluating it with the assumption
+that you will not be around to maintain it afterward.
+
+
+Handling Regressions
+--------------------
+
+If one of your changes causes a regression, you must fix it, as "*we don't cause
+regressions*" is the first rule of Linux kernel development.
+
+A bug is considered a regression when something that worked fine with one Linux
+kernel works worse or not at all with a newer version.  For a more detailed
+definition, see Documentation/admin-guide/reporting-regressions.rst.
+
+You must fix regressions quickly while applying reasonable care to prevent
+causing another regression.  The balance and thus the appropriate approach
+depends on the situation.  Below rules of thumb serve as a guide.  Be aware that
+maintainers and other developers will take note if you fail to handle regression
+appropriately, especially if they then have to fix the problem themselves: this
+could well make it harder for you to incorporate future changes.
+
+On timing:
+
+ - Expedite fixing regressions that reached releases deemed for end users
+   through new mainline releases or stable backports during the past year.
+
+ - If the culprit was mainlined during the current development cycle and not
+   backported to stable, fix the regression before -rc6.
+
+ - If a proper regression fix is unlikely to become ready in a reasonable
+   timeframe, resolve the regression by reverting the culprit.  This is
+   considered an reputable approach, as it allows working out and merging an
+   improved variant of the change calmly.
+
+On procedure:
+
+ - Regression fixes are not required to spend time in linux-next, but depending
+   on the fix and the alignment with pull requests it might be beneficial to
+   have them in there for a day or two.
 
 
 Other things that can happen
diff --git a/Documentation/process/handling-regressions.rst b/Documentation/process/handling-regressions.rst
index 1f5ab49c48a480..62ecc5c5c0765f 100644
--- a/Documentation/process/handling-regressions.rst
+++ b/Documentation/process/handling-regressions.rst
@@ -153,8 +153,8 @@ only these options:
    severe or affects many users -- either in general or in prevalent
    environments.
 
-How to realize that in practice depends on various factors. Use the following
-rules of thumb as a guide.
+How to realize that in practice depends on various factors. Use the rules of
+thumb outlined in Documentation/process/6.Followthrough.rst as a guide.
 
 In general:
 
@@ -162,9 +162,6 @@ In general:
    latter concerns a severe issue (e.g. acute security vulnerability, data loss,
    bricked hardware, ...).
 
- * Expedite fixing mainline regressions that recently made it into a proper
-   mainline, stable, or longterm release (either directly or via backport).
-
  * Do not consider regressions from the current cycle as something that can wait
    till the end of the cycle, as the issue might discourage or prevent users and
    CI systems from testing mainline now or generally.
@@ -194,11 +191,6 @@ On timing once the culprit of a regression is known:
 
 On procedure:
 
- * Always consider reverting the culprit, as it's often the quickest and least
-   dangerous way to fix a regression. Don't worry about mainlining a fixed
-   variant later: that should be straight-forward, as most of the code went
-   through review once already.
-
  * Try to resolve any regressions introduced in mainline during the past
    twelve months before the current development cycle ends: Linus wants such
    regressions to be handled like those from the current cycle, unless fixing
diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 1518bd57adab50..16a89d80eed43c 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -842,6 +842,26 @@ Make sure that base commit is in an official maintainer/mainline tree
 and not in some internal, accessible only to you tree - otherwise it
 would be worthless.
 
+
+Handling Regressions
+--------------------
+
+If one of your changes causes a regression, you must fix it, as "*we don't cause
+regressions*" is the first rule of Linux kernel development.
+
+A bug is considered a regression when something that worked fine with one Linux
+kernel works worse or not at all with a newer version. For a more detailed
+definition, see Documentation/admin-guide/reporting-regressions.rst.
+
+You must fix regressions quickly while applying reasonable care to prevent
+causing another regression. The balance and thus the appropriate approach
+depends on the situation. See Documentation/process/6.Followthrough.rst for
+more rules of thumb that serve as a guide. Be aware that maintainers and other
+developers will take note if you fail to handle regression appropriately,
+especially if they then have to fix the problem themselves: this could well
+make it harder for you to incorporate future changes.
+
+
 Tooling
 -------
 
-- 
2.45.0

