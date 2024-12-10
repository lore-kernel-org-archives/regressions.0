Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4C91DC989;
	Tue, 10 Dec 2024 10:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733825727; cv=none; b=dAHuzcN7tSCLmqlJ+Eyq+MJPuQsKNH5pW5OyowB3DxTv1clgOM1B6zTodomjCw41bXbUqJ4n3QyCqolTDra2ruHFB75ft3E3TAlhaR0N43NYXeBM9/DPpF1ALNqxEB/9Uu6+tiOrEHC8y6B1w2Q9gi0suA9OQkc2yxHHHY2mozU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733825727; c=relaxed/simple;
	bh=D+c+B1bUmif0wxj8xZAKocXpxGOP/o3Po/5OqpW1i8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TyPOzK1gqm/3gkMD6ggVFZ1BSoFZkE6HMrxXE3lhrxvgFjgCxmph2qb36Qz1mNKVGsdHqDX5WMo0crBdgHTMkAgy+I5JUYMQSx4hp54O/zt1zgRnjkwV16ie3nRHSMntCkwcnKQobG9/dTfB2HEH9HMD2DL5m/yi+V+6rEoqRVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=2bGRM4aW; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="2bGRM4aW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Sender:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=aL3zdlxnh3xuBBMynI0Qftj1Z4ZH3rJVNTYyucHAgKA=; t=1733825725;
	x=1734257725; b=2bGRM4aWJvocLL/Sh7p+g7ZA22B+tzF+H0TzMDLBoBASuHqpRwHyZV0AaJHtH
	e9MZhfk/+vOzoRJbFr1Du5z/S79io9cj5BQvQHV+0HxMbCQX5kpy5amJoljFxJPj0qCLbWEKBVjCY
	J5jEH7PDe6ZH2dQJPoIIMMsMAlPl4+MQHvDdqsZIF2eqsUk+HPK95xgrbO1m0QxzApujwxWS1uMKz
	OIfFRcfkixT7GbC8eefGLW6sWIcdqiVvu2/oUwBW0szNNCOnJs1WbFjKrZXiSKAA2bBK/jiHJX+6P
	rKBDKGRmoHz8ckihZU9owhxTvrhl7tNgVWWh/HQILs7wJmkdUw==;
Received: from ip4d148da6.dynamic.kabel-deutschland.de ([77.20.141.166] helo=truhe.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	id 1tKxGu-002jXf-2X;
	Tue, 10 Dec 2024 11:15:16 +0100
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>,
	workflows@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-doc@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH v1 2/6] docs: 6.Followthrough.rst: when to involved Linus in regressions
Date: Tue, 10 Dec 2024 11:15:11 +0100
Message-ID: <9344b8bf12ce5ebe838d154d5c4f1baf515a9452.1733825632.git.linux@leemhuis.info>
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
X-HE-SMSGID: 1tKxGu-002jXf-2X

Add a few notes on when to involve Linus in regressions. Part of this
spells out slightly obvious things infrequent developers might not be
aware of, while others are based on a recent statement from Linus[1].

This removes equivalent paragraphs from a section in
Documentation/process/handling-regressions.rst, which will become mostly
obsolete through this and follow-up changes.

Link: https://lore.kernel.org/all/CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/ [1]
Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
 Documentation/process/6.Followthrough.rst      | 17 +++++++++++++++++
 Documentation/process/handling-regressions.rst | 17 -----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/process/6.Followthrough.rst b/Documentation/process/6.Followthrough.rst
index ed5e32348f2403..f9ae3a86ee0c49 100644
--- a/Documentation/process/6.Followthrough.rst
+++ b/Documentation/process/6.Followthrough.rst
@@ -217,6 +217,23 @@ On procedure:
    on the fix and the alignment with pull requests it might be beneficial to
    have them in there for a day or two.
 
+ - If a regression seems tangly, precarious, or urgent, consider CCing Linus on
+   discussions and patch reviews; do the same if the responsible maintainers
+   are suspected to be unavailable.
+
+ - For urgent fixes, consider asking Linus to pick them up straight from the
+   mailing list: he is totally fine with that for occasional and uncontroversial
+   fixes.  Such requests should ideally come directly from maintainers or happen
+   in accordance with them.
+
+ - In case you are unsure if a fix is worth the risk applying just days before
+   a new mainline release, send Linus a mail with the usual lists, developers,
+   and maintainers in CC; in it, summarize the situation while asking him to
+   consider picking up the fix straight from the list as he sees fit.  Linus
+   then can make the call and when appropriate even postpone the release.  Such
+   requests again should ideally come directly from maintainers or happen in
+   accordance with them.
+
 
 Other things that can happen
 -----------------------------
diff --git a/Documentation/process/handling-regressions.rst b/Documentation/process/handling-regressions.rst
index 62ecc5c5c0765f..c020418499f6a2 100644
--- a/Documentation/process/handling-regressions.rst
+++ b/Documentation/process/handling-regressions.rst
@@ -196,23 +196,6 @@ On procedure:
    regressions to be handled like those from the current cycle, unless fixing
    bears unusual risks.
 
- * Consider CCing Linus on discussions or patch review, if a regression seems
-   tangly. Do the same in precarious or urgent cases -- especially if the
-   subsystem maintainer might be unavailable. Also CC the stable team, when you
-   know such a regression made it into a mainline, stable, or longterm release.
-
- * For urgent regressions, consider asking Linus to pick up the fix straight
-   from the mailing list: he is totally fine with that for uncontroversial
-   fixes. Ideally though such requests should happen in accordance with the
-   subsystem maintainers or come directly from them.
-
- * In case you are unsure if a fix is worth the risk applying just days before
-   a new mainline release, send Linus a mail with the usual lists and people in
-   CC; in it, summarize the situation while asking him to consider picking up
-   the fix straight from the list. He then himself can make the call and when
-   needed even postpone the release. Such requests again should ideally happen
-   in accordance with the subsystem maintainers or come directly from them.
-
 Regarding stable and longterm kernels:
 
  * You are free to leave regressions to the stable team, if they at no point in
-- 
2.45.0

