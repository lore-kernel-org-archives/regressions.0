Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3815A3C1411
	for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 12:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750822; cv=none; b=S9Sv1gd+OR3moEVyAdeMqwFYPLtvM3e23FQSN9YdmXDrkHZjXWC+yFIOkh4rvZhlC9f30L+wV9knBO+2o/lMGiRQcWts4Kgp6bvJdoF261jNtB7uFv6iXm9RzZb4hs2Rxo/sJqCbX5O11N7np8AshVTjcMA5e9PnmedgI2cHbdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750822; c=relaxed/simple;
	bh=DLAZWZvYAQo3AeKnB8RK5xeZq+SfWWnP8P+mULMux5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VodJNuZty+Gl5xQvEH5/qPk9ZYIkpYZjVQ68jBrxzzcqEfwF7pMJyMtS+hpD2lGNp2qWrXyQwwlapwBVNxc9wG8BxUkL9S1/z8+JDGx6MZfGhzY1Zr8otlO8u2PxsG1l1xf9qIbtGDJEzcjqGej4u15/VtyEMKTE14ndDp6M9kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=P4Pnmqxa; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="P4Pnmqxa"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4fZrwV6k4Fz43FB;
	Tue, 17 Mar 2026 13:33:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1773750810;
	bh=DLAZWZvYAQo3AeKnB8RK5xeZq+SfWWnP8P+mULMux5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P4PnmqxaZp2bzpYBmKBLL6BvLHZt1aW1gJsmLizylMfjL4E4saFQoAa4XWtvxX/Ya
	 oylkJg26Ie7yCByEZ8FPjKrZT3OxjU0znZOdV34Q8WnX2lVgZ7Y5T5uDUZc/0OkxSY
	 w8646hx7RAvg3ez/aUCDT1r4YKC3FmRvnaXuMwKfrdvQJTJMreKkLsmMKqjJNrXRgZ
	 DTVLHLoc+dZtGg0TsR6mZOOoAEfURH2EZbpKcE1Hyct5z+NrIHvqbkszEzjWDGpaCt
	 zOEDOyH/L+9ClRuCT0Y17zcE+rd9ihUAKiK0qCHobxmg7vKbIte0sZYxnu0r6qlEVL
	 v0sxTolQB3/hA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4fZrwV61jxz436w;
	Tue, 17 Mar 2026 13:33:30 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fZrwV3vRQz8svF;
	Tue, 17 Mar 2026 13:33:30 +0100 (CET)
Received: from luggage.fritz.box (unknown [IPv6:2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id CD33C635A2;
	Tue, 17 Mar 2026 13:33:29 +0100 (CET)
Authentication-Results: mxe9fb;
	spf=pass (sender IP is 2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160) smtp.mailfrom=linux@leemhuis.info smtp.helo=luggage.fritz.box
Received-SPF: pass (mxe9fb: connection is authenticated)
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] docs: reporting-issues: create a proper appendix
 explaining specialties
Date: Tue, 17 Mar 2026 13:33:08 +0100
Message-ID: 
 <473b36fa9723c46b7167004752f097e6c26d7278.1773750701.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773750701.git.linux@leemhuis.info>
References: <cover.1773750701.git.linux@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177375081005.2889278.2984770644419798803@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: CD33C635A2
X-NC-CID: +0R4BnqSs8tEysEHb2JNNUshQAW+yu0JPNHGMyTNZDnhP/lRf58=

Merge "Why some bugs remain unfixed and some reports are ignored" with
the closing words while rewriting and extending the text.

The result spends fewer words on explaining things that are normal in
FLOSS -- while outlining where the kernel is different and how that
makes bug reporting more complicated than in other FLOSS projects.

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
 .../admin-guide/reporting-issues.rst          | 119 ++++++++----------
 1 file changed, 53 insertions(+), 66 deletions(-)

diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
index aa058b295c5f33..16a66a1f1975f0 100644
--- a/Documentation/admin-guide/reporting-issues.rst
+++ b/Documentation/admin-guide/reporting-issues.rst
@@ -1693,72 +1693,59 @@ for the subsystem where the issue seems to have its roots; CC the mailing list
 for the subsystem as well as the stable mailing list (stable@vger.kernel.org).
 
 
-Why some issues won't get any reaction or remain unfixed after being reported
-=============================================================================
-
-When reporting a problem to the Linux developers, be aware only 'issues of high
-priority' (regressions, security issues, severe problems) are definitely going
-to get resolved. The maintainers or if all else fails Linus Torvalds himself
-will make sure of that. They and the other kernel developers will fix a lot of
-other issues as well. But be aware that sometimes they can't or won't help; and
-sometimes there isn't even anyone to send a report to.
-
-This is best explained with kernel developers that contribute to the Linux
-kernel in their spare time. Quite a few of the drivers in the kernel were
-written by such programmers, often because they simply wanted to make their
-hardware usable on their favorite operating system.
-
-These programmers most of the time will happily fix problems other people
-report. But nobody can force them to do, as they are contributing voluntarily.
-
-Then there are situations where such developers really want to fix an issue,
-but can't: sometimes they lack hardware programming documentation to do so.
-This often happens when the publicly available docs are superficial or the
-driver was written with the help of reverse engineering.
-
-Sooner or later spare time developers will also stop caring for the driver.
-Maybe their test hardware broke, got replaced by something more fancy, or is so
-old that it's something you don't find much outside of computer museums
-anymore. Sometimes developer stops caring for their code and Linux at all, as
-something different in their life became way more important. In some cases
-nobody is willing to take over the job as maintainer – and nobody can be forced
-to, as contributing to the Linux kernel is done on a voluntary basis. Abandoned
-drivers nevertheless remain in the kernel: they are still useful for people and
-removing would be a regression.
-
-The situation is not that different with developers that are paid for their
-work on the Linux kernel. Those contribute most changes these days. But their
-employers sooner or later also stop caring for their code or make its
-programmer focus on other things. Hardware vendors for example earn their money
-mainly by selling new hardware; quite a few of them hence are not investing
-much time and energy in maintaining a Linux kernel driver for something they
-stopped selling years ago. Enterprise Linux distributors often care for a
-longer time period, but in new versions often leave support for old and rare
-hardware aside to limit the scope. Often spare time contributors take over once
-a company orphans some code, but as mentioned above: sooner or later they will
-leave the code behind, too.
-
-Priorities are another reason why some issues are not fixed, as maintainers
-quite often are forced to set those, as time to work on Linux is limited.
-That's true for spare time or the time employers grant their developers to
-spend on maintenance work on the upstream kernel. Sometimes maintainers also
-get overwhelmed with reports, even if a driver is working nearly perfectly. To
-not get completely stuck, the programmer thus might have no other choice than
-to prioritize issue reports and reject some of them.
-
-But don't worry too much about all of this, a lot of drivers have active
-maintainers who are quite interested in fixing as many issues as possible.
-
-
-Closing words
-=============
-
-Compared with other Free/Libre & Open Source Software it's hard to report
-issues to the Linux kernel developers: the length and complexity of this
-document and the implications between the lines illustrate that. But that's how
-it is for now. The main author of this text hopes documenting the state of the
-art will lay some groundwork to improve the situation over time.
-
+Appendix: Why it is somewhat hard to report kernel bugs
+=======================================================
+
+The Linux kernel developers are well aware that reporting bugs to them is harder
+than in other Free/Libre Open Source Projects. Many reasons for that lie in the
+nature of kernels, Linux' development model, and how the world uses the kernel:
+
+* *Most kernels of Linux distributions are totally unsuitable for reporting bugs
+  upstream.* The reference section above already explained this in detail:
+  outdated codebases as well as modifications and add-ons lead to kernel bugs
+  that were fixed upstream a long time ago or never happened there in the first
+  place. Developers of other Open Source software face these problems as well,
+  but the situation is a lot worse when it comes to the kernel, as the changes
+  and their impact are much more severe -- which is why many kernel developers
+  expect reports with kernels built from fresh and nearly unmodified sources.
+
+* *Bugs often only occur in a special environment.* That is because Linux is
+  mostly drivers and can be used in a multitude of ways. Developers often do not
+  have a matching setup at hand -- and therefore frequently must rely on bug
+  reporters for isolating a problems's cause and testing proposed fixes.
+
+* *The kernel has hundreds of maintainers, but all-rounders are very rare.* That
+  again is and effect caused by the multitude of features and drivers, due to
+  which many kernel developers know little about lower or higher layers related
+  to their code and even less about other areas.
+
+* *It is hard finding where to report issues to, among others, due to the lack
+  of a central bug tracker.* This is something even some kernel developers
+  dislike, but that's the situation everyone has to deal with currently.
+
+* *Stable and longterm kernels are primarily maintained by a dedicated 'stable
+  team', which only handles regressions introduced within stable and longterm
+  series.* When someone reports a bug, say, using Linux 6.1.2, the team will,
+  therefore, always ask if mainline is affected: if the bug already happened
+  in 6.1 or occurs with latest mainline (say, 6.2-rc3), they in everybody's
+  interest shove it to the regular developers, as those know the code best.
+
+* *Linux developers are free to focus on latest mainline.* Some, thus, react
+  coldly to reports about bugs in, say, Linux 6.0 when 6.1 is already out;
+  even the latter might not be enough once 6.2-rc1 is out. Some will also not
+  be very welcoming to reports with 6.1.5 or 6.1.6, as the problem might be a
+  series-specific regression the stable team (see above) caused and must fix.
+
+* *Sometimes there is nobody to help.* Sometimes this is due to the lack of
+  hardware documentation -- for example, when a driver was built using reverse
+  engineering or was taken over by spare-time developers when the hardware
+  manufacturer left it behind. Other times there is nobody to even report bugs
+  to: when maintainers move on without a replacement, their code often remains
+  in the kernel as long as it's useful.
+
+Some of these aspects could be improved to facilitate bug reporting -- many
+Linux kernel developers are well aware of this and would be glad if a few
+individuals or an entity would make this their mission.
 
 ..
    end-of-content
-- 
2.53.0

