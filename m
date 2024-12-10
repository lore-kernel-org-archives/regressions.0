Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D521DC9AC;
	Tue, 10 Dec 2024 10:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733825729; cv=none; b=lt+DhdipvXXfdHNeo5UTNO/Opew+x2IuxhDmjocDB9TZYmtL53Z0S3oouFcz6cEeUMFUNEqRUiHnjyS0ME6XNXCPOfYgcSAucxC0PRqDcR9V5pK7839VaAW4qZSFV6CYIVUtf3/z2OYctd1mtu4lRBGBEayahkL9pw/fJG3I9BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733825729; c=relaxed/simple;
	bh=mHkP2GxOKxLF06Amj/Y5paYmO/pEeFZUTqFb2hJYp7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iWz6J5J+OpZTqKbYpe02BAR4DYan2HOpqbYWtQ7tFsay59F9mqy39LrD9lCJaHNcy5T+0/SRbJaWZ0dVzC/bt4DriH3WMvS0OXiipqEMDhvmKG22XNDrEa7klXvqj3KgNqacobw44K4rDPrtMKd0qFug+1lbI4v6cljy0jKyZnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Yk2izQoI; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Yk2izQoI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Sender:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=nHNWsr9PXBfwQ8xcXooKSWcHEYRD44ZDgDJJEFR7q4o=; t=1733825727;
	x=1734257727; b=Yk2izQoIamJfD/J8TQL69V1bBuCellpEdY9u71oJch0j4Zxi9vUeQTCfzblad
	ON9NNMhNFZbDcSUN7QnE29R0pDmsFt3do5xqlcYQq298xYHXL86YlEQRiBObBerRzMQyUG5UC1Z6n
	ROO43iz4DjnXpKbOSR4wXzhneSARt1Ge8v+xjEVaz2u2261CQyuNRmbCpf4IxINDOZQmYJu25ogEO
	Zcb+C+pAR+avyVUN5B0hiojjWtVvWz33biwfSdc1BZHPOEKWBLWYWC4PfAk7/trczTGjt0v6KKs/j
	O7+hViYQzZvFUubupWSCWKsDluHGVJQLWBYmTK/mS7n/9CCUdw==;
Received: from ip4d148da6.dynamic.kabel-deutschland.de ([77.20.141.166] helo=truhe.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	id 1tKxGw-002jXf-0y;
	Tue, 10 Dec 2024 11:15:18 +0100
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>,
	workflows@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-doc@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH v1 6/6] docs: 6.Followthrough.rst: advice on handling regressions fixes
Date: Tue, 10 Dec 2024 11:15:15 +0100
Message-ID: <e7344ff7a57b61380152defaa5ec13f06ac5d7d0.1733825632.git.linux@leemhuis.info>
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
X-HE-SMSGID: 1tKxGw-002jXf-0y

Add some advice on how to handle regressions as developer, reviewer, and
maintainer, as resolving regression without unnecessary delays requires
multiple people working hand in hand.

This removes equivalent paragraphs from a section in
Documentation/process/handling-regressions.rst, which will become mostly
obsolete through this and follow-up changes.

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
 Documentation/process/6.Followthrough.rst     | 24 ++++++++++++++++---
 .../process/handling-regressions.rst          | 16 -------------
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/Documentation/process/6.Followthrough.rst b/Documentation/process/6.Followthrough.rst
index 587e80578f83a9..8ffa3cd142e8a0 100644
--- a/Documentation/process/6.Followthrough.rst
+++ b/Documentation/process/6.Followthrough.rst
@@ -198,6 +198,11 @@ maintainers and other developers will take note if you fail to handle regression
 appropriately, especially if they then have to fix the problem themselves: this
 could well make it harder for you to incorporate future changes.
 
+In general:
+
+ - Prioritize work on providing, reviewing, and mainlining regression fixes over
+   other upstream Linux kernel work.
+
 On timing once the mainline change causing the regression became known:
 
  - If the regression is severe or reported by many people within a short
@@ -229,9 +234,22 @@ On timing once the mainline change causing the regression became known:
 
 On procedure:
 
- - Regression fixes are not required to spend time in linux-next, but depending
-   on the fix and the alignment with pull requests it might be beneficial to
-   have them in there for a day or two.
+ - Developers, when trying to reach the time periods mentioned above, remember
+   to account for the time it will take to test, review, commit, and mainline
+   fixes, ideally with them being in linux-next briefly.  To achieve that, make
+   the appropriate urgency of a fix obvious in the submission and consider
+   opting for a revert to be on the safe side.
+
+ - Reviewers, you are kindly asked to prefer reviewing regression fixes over
+   other changes.
+
+ - Maintainers, you likewise are kindly asked to expedite the handling of
+   regression fixes.  They for example are not required to spend time in
+   linux-next, but depending on the fix and the alignment with pull requests it
+   might be beneficial to have them in there for a day or two.  When appropriate,
+   also consider sending an additional pull request.  Furthermore try to avoid
+   holding onto regression fixes over weekends -- especially when some are
+   marked for backporting to stable series.
 
  - If a regression seems tangly, precarious, or urgent, consider CCing Linus on
    discussions and patch reviews; do the same if the responsible maintainers
diff --git a/Documentation/process/handling-regressions.rst b/Documentation/process/handling-regressions.rst
index 581f99675a9d52..7b8f0b122c1552 100644
--- a/Documentation/process/handling-regressions.rst
+++ b/Documentation/process/handling-regressions.rst
@@ -156,22 +156,6 @@ only these options:
 How to realize that in practice depends on various factors. Use the rules of
 thumb outlined in Documentation/process/6.Followthrough.rst as a guide.
 
-On patch flow:
-
- * Developers, when trying to reach the time periods mentioned above, remember
-   to account for the time it takes to get fixes tested, reviewed, and merged by
-   Linus, ideally with them being in linux-next at least briefly. Hence, if a
-   fix is urgent, make it obvious to ensure others handle it appropriately.
-
- * Reviewers, you are kindly asked to assist developers in reaching the time
-   periods mentioned above by reviewing regression fixes in a timely manner.
-
- * Subsystem maintainers, you likewise are encouraged to expedite the handling
-   of regression fixes. Thus evaluate if skipping linux-next is an option for
-   the particular fix. Also consider sending git pull requests more often than
-   usual when needed. And try to avoid holding onto regression fixes over
-   weekends -- especially when the fix is marked for backporting.
-
 
 More aspects regarding regressions developers should be aware of
 ----------------------------------------------------------------
-- 
2.45.0

