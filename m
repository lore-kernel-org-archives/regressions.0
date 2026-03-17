Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B453C3440
	for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750819; cv=none; b=rC63+sAmbfxv0FdkZDlPJ91ZW5Uj/r7Hp8Ygb06/ull3V1mX4XjUPVcbEC03QXOAxBiAOH9STV4DczS86MYA0VznR6na4IxBMvV/HFY/dZ/sBkNLEK7aKZxPgl1HKm4S11M3M+UNcGZTj/eegTESkk+r/GcBwhajy0/HPsmSrTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750819; c=relaxed/simple;
	bh=FfnT7vy33aw4yKiRYkN6owei+PQ6x04yxHJNKRN62/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SSRieoPSmvdqX7S+fo6nvJsseT1Uz0RGy4norkRgVFWCMqETFV47ChdXknjc483dg8wDKnQijdBnoMLF1viEMY0+M0vyn0DNpLfvOdlJC0hcwsdlc8VFXGJowkXOr6PRIEJxWBVYHHc76+2sNhobJJvsSh5pYPPXtXtisRepPhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=IVCx7p4W; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="IVCx7p4W"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4fZrwT16pbz42xd;
	Tue, 17 Mar 2026 13:33:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1773750809;
	bh=FfnT7vy33aw4yKiRYkN6owei+PQ6x04yxHJNKRN62/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IVCx7p4WQQ+rw9mJRJQPJLegLgL9THDwz6EKna7pqAsaGeW4GfZ1vglKdJRxkuUfR
	 PknWYFots58c6QgBXqaIzUxhMSEXmP7lNj0fv3OxAJCzb2qnSVLF2nsXu3iehvvBa9
	 Fs2It3H1lVT/EWUax3niarGCo4Z+bxOLee1etz0yCc8eGNHHcK6H+1M426ixlAIRoE
	 lw69BpaBaaGbSexN0gqb1IpkHm9FnyZzM64Hwe45nm35aHRy/1aq/1nDMGz7kSHnyi
	 Vps29YDVpkMoPlX+DToTC1MGCo/klX3Kk39mGyA63oYCuZw1u7MpYlUmmnIiO7G5Pu
	 /GkpE5xJZjBOg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4fZrwT0P5fz42qq;
	Tue, 17 Mar 2026 13:33:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fZrwR18DQz8tXL;
	Tue, 17 Mar 2026 13:33:27 +0100 (CET)
Received: from luggage.fritz.box (unknown [IPv6:2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 1ECE6635CE;
	Tue, 17 Mar 2026 13:33:26 +0100 (CET)
Authentication-Results: mxe9fb;
	spf=pass (sender IP is 2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160) smtp.mailfrom=linux@leemhuis.info smtp.helo=luggage.fritz.box
Received-SPF: pass (mxe9fb: connection is authenticated)
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] docs: reporting-issues: tweak the reference section
 intro
Date: Tue, 17 Mar 2026 13:33:05 +0100
Message-ID: 
 <cd3ae7b1724d3b16b86488166f756a976e0ee83a.1773750701.git.linux@leemhuis.info>
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
X-PPP-Message-ID: 
 <177375080635.2889262.15957717295163483210@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 1ECE6635CE
X-NC-CID: sd5BiM3Z2NyxyAUWz+skkclhHyrtFMW1uDqccVRZ07YwxzkZq0s=

Fine tuning to the intro of the reference section:

* Call the step-by-step guide what it is.
* Reorder the links to the guides on bug reporting to first mention the
  most modern one.
* Many small changes to streamline the text and slightly shorten it.

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
 .../admin-guide/reporting-issues.rst          | 67 +++++++++----------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
index 049dd9b663513d..9f9c5db25a6c1a 100644
--- a/Documentation/admin-guide/reporting-issues.rst
+++ b/Documentation/admin-guide/reporting-issues.rst
@@ -244,42 +244,37 @@ The reference section below explains each of these steps in more detail.
 Reference section: Reporting issues to the kernel maintainers
 =============================================================
 
-The detailed guides above outline all the major steps in brief fashion, which
-should be enough for most people. But sometimes there are situations where even
-experienced users might wonder how to actually do one of those steps. That's
-what this section is for, as it will provide a lot more details on each of the
-above steps. Consider this as reference documentation: it's possible to read it
-from top to bottom. But it's mainly meant to skim over and a place to look up
-details how to actually perform those steps.
-
-A few words of general advice before digging into the details:
-
- * The Linux kernel developers are well aware this process is complicated and
-   demands more than other FLOSS projects. We'd love to make it simpler. But
-   that would require work in various places as well as some infrastructure,
-   which would need constant maintenance; nobody has stepped up to do that
-   work, so that's just how things are for now.
-
- * A warranty or support contract with some vendor doesn't entitle you to
-   request fixes from developers in the upstream Linux kernel community: such
-   contracts are completely outside the scope of the Linux kernel, its
-   development community, and this document. That's why you can't demand
-   anything such a contract guarantees in this context, not even if the
-   developer handling the issue works for the vendor in question. If you want
-   to claim your rights, use the vendor's support channel instead. When doing
-   so, you might want to mention you'd like to see the issue fixed in the
-   upstream Linux kernel; motivate them by saying it's the only way to ensure
-   the fix in the end will get incorporated in all Linux distributions.
-
- * If you never reported an issue to a FLOSS project before you should consider
-   reading `How to Report Bugs Effectively
-   <https://www.chiark.greenend.org.uk/~sgtatham/bugs.html>`_, `How To Ask
-   Questions The Smart Way
-   <http://www.catb.org/esr/faqs/smart-questions.html>`_, and `How to ask good
-   questions <https://jvns.ca/blog/good-questions/>`_.
-
-With that off the table, find below the details on how to properly report
-issues to the Linux kernel developers.
+The step-by-step guide above outlines all the major steps in brief fashion,
+which usually covers everything required. But even experienced users will
+sometimes wonder how to actually realize some of those steps or why they are
+needed; there are also corner cases the guide ignores for readability. That is
+what the entries in this reference section are for, which provide additional
+information for each of the steps in the guide.
+
+A few words of general advice:
+
+* The Linux developers are well aware that reporting bugs to them is more
+  complicated and demanding than in other FLOSS projects. Some of it is because
+  the kernel is different, among others due to its mail-driven development
+  process and because it consists mostly of drivers. Some of it is because
+  improving things would require work in several technical areas and people
+  triaging bugs –– and nobody has stepped up to do or fund that work.
+
+* A warranty or support contract with some vendor doesn't entitle you to
+  request fixes from the upstream Linux developers: Such contracts are
+  completely outside the scope of the upstream Linux kernel, its development
+  community, and this document -- even if those handling the issue work for the
+  vendor who issued the contract. If you want to claim your rights, use the
+  vendor's support channel.
+
+* If you never reported an issue to a FLOSS project before, consider skimming
+  guides like `How to ask good questions
+  <https://jvns.ca/blog/good-questions/>`_, `How To Ask Questions The Smart Way
+  <http://www.catb.org/esr/faqs/smart-questions.html>`_, and `How to Report
+  Bugs Effectively <https://www.chiark.greenend.org.uk/~sgtatham/bugs.html>`_,.
+
+With that off the table, find below details for the steps from the detailed
+guide on reporting issues to the Linux kernel developers.
 
 
 Make sure you're using the upstream Linux kernel
-- 
2.53.0

