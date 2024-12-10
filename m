Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E17F1DC9A3;
	Tue, 10 Dec 2024 10:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733825728; cv=none; b=XdjVOLjqNEYM/JpV/NlH5Ss703en5RUotNgvgUxSwL8OsVK+UGBwmRyaaz560Ukw4/Xs8Sm9Jj/1QZi17f5g+FJ5TQpZphOkq9AliCKo9lZI/IgRWuJYVRnu91w0wGQaOZadKLG4P4lT9+wxmYlS6IABzVMto/wGe30TjA/Y8Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733825728; c=relaxed/simple;
	bh=2PMLC5BN8wVTbaaNelE8ioYs446IHpVxgMmJU4ZGsbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q4cT4l88hqPw7YV4RChLe/0h8NMjtf26i48KdA2WBuEJGBvb5TP58g3Ay9ns7zI1skSZ5AYeasZL67NZVdSPDN7dw5IIDHojhZoCmw5X0ilOjU53b9SqU0CjOFR1/EIRz1k78zWr9f7iBnEEQG74+N/V/juILy/wHeVOVjPuTvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=neSwzHNg; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="neSwzHNg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=ahjcsGXw4ZfM2U7SsioqatwWP2oPey5xE3kDciJUL9k=; t=1733825726;
	x=1734257726; b=neSwzHNgAOSpr/Kz2FAwkqvf7Z6cqxjk/r1NICjZNCf2VruB8Ty84GbN3bPUO
	KxjLqYrHD3XGDns/TWDl77lm3pEfKGAfAF4UNXAGKwBYxaLZs1CUe+Up+sOBXhAHa+VJWDj27J1y8
	Uu7tDa8idb4DoeLE5jy+5K0SkYF5fPrcq1YZHrxEbJ7nLzBKiJV6kmw2WZYk2UQFEPwcc+hlAPOJU
	zXNslZR/HdC4WA0mHvoyFmKcgIR+jxzkaIwge6bGLaHVZKmx69TkXGkaoPYu1RAeHi3lKj5LLylPn
	YknK4NKhQQa8fGw7WPBpN4XPqKjTFOPjRUfRrBSor72hYnGzYg==;
Received: from ip4d148da6.dynamic.kabel-deutschland.de ([77.20.141.166] helo=truhe.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	id 1tKxGv-002jXf-2s;
	Tue, 10 Dec 2024 11:15:17 +0100
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>,
	workflows@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-doc@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH v1 5/6] docs: 6.Followthrough.rst: more specific advice on fixing regressions
Date: Tue, 10 Dec 2024 11:15:14 +0100
Message-ID: <fb5f1b83786c31cbbf56621b14d595a3091d9a40.1733825632.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1733825632.git.linux@leemhuis.info>
References: <cover.1733825632.git.linux@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1733825726;c4973ef4;
X-HE-SMSGID: 1tKxGv-002jXf-2s

Provide something more concrete about fixing regressions in a few
places, as telling people to "expedite" fixing those that reached a
release deemed for end users is pretty vague. But every situation is
different, so use the soft phrases like "aim for" and leave loopholes.

This removes equivalent paragraphs from a section in
Documentation/process/handling-regressions.rst, which will become mostly
obsolete through this and follow-up changes.

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---

Note, the bits that remain like the "past year" aspect are based on
statements from Linus. Other parts are made up and need to be discussed,
especially the "past six weeks" thing followed by "aim to mainline a fix
before the end of the week after the next" and the "[…] taking one more
week is fine." shortly after.

Those targets are derived from experiences during regression tracking
and the text currently in Documentation/process/handling-regressions.rst
that was ACKed by Greg -- just like an earlier version which had even
shorter time spans. They came into being from calculating backwards how
long users would be exposed to regressions, as then you need to include
"someone with the right set of skills needs to notice, bisect and report
the problem to the right developer", which often will take at least two
to four days days; you furthermore need to take into account how long it
takes for the fix to reach regular users through a new stable release,
which usually happen three to six days after it made it to a new
mainline -rc release. That's why users might be exposed to a regression
for three to four weeks in total, even if it's fixed after a bit more
than two weeks in mainline. That "after a new mainline-rc release" is
also one reason why the text uses the phrase "before the end of the
week", as regression fixes that are mainlined on Monday might just miss
a stable -rc, which often will delay pickup by a whole week (and this
mean ~10+ days to reach users).
---
 Documentation/process/6.Followthrough.rst     | 30 ++++++++++----
 .../process/handling-regressions.rst          | 40 -------------------
 2 files changed, 23 insertions(+), 47 deletions(-)

diff --git a/Documentation/process/6.Followthrough.rst b/Documentation/process/6.Followthrough.rst
index 2ba16a71aba9b4..587e80578f83a9 100644
--- a/Documentation/process/6.Followthrough.rst
+++ b/Documentation/process/6.Followthrough.rst
@@ -198,16 +198,32 @@ maintainers and other developers will take note if you fail to handle regression
 appropriately, especially if they then have to fix the problem themselves: this
 could well make it harder for you to incorporate future changes.
 
-On timing:
+On timing once the mainline change causing the regression became known:
 
- - Expedite fixing regressions that reached releases deemed for end users
-   through new mainline releases or stable backports during the past year.
+ - If the regression is severe or reported by many people within a short
+   timeframe, aim to mainline a fix within two or three days and ideally before
+   the end of the week.
 
- - If the culprit was mainlined during the current development cycle and not
-   backported to stable, fix the regression before -rc6.
+ - Expedite fixing regressions that recently reached releases deemed for end
+   users through new mainline releases or stable backports.  If the culprit
+   reached it in the past six weeks, aim to mainline a fix before the end of the
+   week after the next; if it landed during the past year, taking one more week
+   is fine.  Whenever possible, try to resolve the issue faster -- but it's also
+   okay to take more time if there are strong reasons and a revert no option.
 
- - If a proper regression fix is unlikely to become ready in a reasonable
-   timeframe, resolve the regression by reverting the culprit.  This is
+ - If the culprit was mainlined during the current development cycle and not
+   backported to stable, fix the regression before -rc6. But try to resolve it
+   faster whenever possible -- especially if the issue is either reported
+   multiple times or prevents CI systems or multiple users from testing, as that
+   might mask other bugs and drive testers away.
+
+ - Try your best to mainline all regressions fixes before the current
+   development cycle ends, unless the culprit was committed more than a year
+   ago: then it is acceptable to queue a fix for the next merge window, which
+   is even advisable in case the change bears bigger risks.
+
+ - If mainlining a proper fix within the timeframes outlined above looks
+   unlikely, resolve the regression by reverting the culprit.  This is
    considered an reputable approach, as it allows working out and merging an
    improved variant of the change calmly.
 
diff --git a/Documentation/process/handling-regressions.rst b/Documentation/process/handling-regressions.rst
index da53e12fc6d96c..581f99675a9d52 100644
--- a/Documentation/process/handling-regressions.rst
+++ b/Documentation/process/handling-regressions.rst
@@ -156,46 +156,6 @@ only these options:
 How to realize that in practice depends on various factors. Use the rules of
 thumb outlined in Documentation/process/6.Followthrough.rst as a guide.
 
-In general:
-
- * Prioritize work on regressions over all other Linux kernel work, unless the
-   latter concerns a severe issue (e.g. acute security vulnerability, data loss,
-   bricked hardware, ...).
-
- * Do not consider regressions from the current cycle as something that can wait
-   till the end of the cycle, as the issue might discourage or prevent users and
-   CI systems from testing mainline now or generally.
-
- * Work with the required care to avoid additional or bigger damage, even if
-   resolving an issue then might take longer than outlined below.
-
-On timing once the culprit of a regression is known:
-
- * Aim to mainline a fix within two or three days, if the issue is severe or
-   bothering many users -- either in general or in prevalent conditions like a
-   particular hardware environment, distribution, or stable/longterm series.
-
- * Aim to mainline a fix by Sunday after the next, if the culprit made it
-   into a recent mainline, stable, or longterm release (either directly or via
-   backport); if the culprit became known early during a week and is simple to
-   resolve, try to mainline the fix within the same week.
-
- * For other regressions, aim to mainline fixes before the hindmost Sunday
-   within the next three weeks. One or two Sundays later are acceptable, if the
-   regression is something people can live with easily for a while -- like a
-   mild performance regression.
-
- * It's strongly discouraged to delay mainlining regression fixes till the next
-   merge window, except when the fix is extraordinarily risky or when the
-   culprit was mainlined more than a year ago.
-
-On procedure:
-
- * Try to resolve any regressions introduced in mainline during the past
-   twelve months before the current development cycle ends: Linus wants such
-   regressions to be handled like those from the current cycle, unless fixing
-   bears unusual risks.
-
 On patch flow:
 
  * Developers, when trying to reach the time periods mentioned above, remember
-- 
2.45.0

