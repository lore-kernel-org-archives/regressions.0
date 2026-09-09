Received: from sender-op-o11.zoho.com.au (sender-op-o11.zoho.com.au [103.138.129.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49C2560AAF
	for <regressions@lists.linux.dev>; Wed,  9 Sep 2026 14:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.138.129.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964913; cv=pass; b=K/dVn7slGuiUwQzhAx4wiTxKxMWuIomMrZFC/xNDJlLUa4+rTRKzDBFlBtwT011BzMVbv8wykV9igldMrnyYv/58PFUY+1Y2fT77C+bCphlp+Vs4Im13efyirNZmLaS30tNKcGAnE4iL5GBNSoMv9+FAybg0m7Qy3//W7tz8yaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964913; c=relaxed/simple;
	bh=xX3MS2hFLnLzrbqpKEGCXF6NiBKGvB8xeKt3qODVK0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dJSRPgbzxCEizDu8Wo7CIoToe6DgGuFMbqMEvj1bRE2HBbb7tejxmC1xfz0ZYtwENHWIQQhDtwKP0FFtvbljF7OJqv8ONwubQ53kyceVYFDykBQDEIUdhv/obh+f538uPPtwGRhvfc+sTZCg+PuxydivBfOa+yxTbpvQ9XCMj9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=scstudios.tech; spf=pass smtp.mailfrom=scstudios.tech; dkim=pass (1024-bit key) header.d=scstudios.tech header.i=@scstudios.tech header.b=NPUaq6KP; arc=pass smtp.client-ip=103.138.129.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=scstudios.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scstudios.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=scstudios.tech header.i=@scstudios.tech header.b="NPUaq6KP"
ARC-Seal: i=1; a=rsa-sha256; t=1788964899; cv=none; 
	d=zohomail.com.au; s=zohoarc; 
	b=HTNWwnBL9lOEczlqwZpZ/LGNV3/Hvg1rSRGFVjRg4XACYO1SM5eoJjmw4i4jPSxXpBY7riFaYcqxf96IkjDhdRKw3F5UXw86OUaM3MyJDq+Q8jbc2WikY7siRla4wGtnsFrVueE6btjSL2qFNvFxXJKRnQEN2yG67WBtfz9AseM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com.au; s=zohoarc; 
	t=1788964899; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zD28XhKg0xRAFAYdyTHDmq6D+C7Hst1WBfaQKtFpJ/8=; 
	b=ioTQBDwFzTdCY4xbtnZtLZ7jjbVIfBm7kmwi/56zcREBoHxgLp5ikpBgocNPGTiNPY7VNFmzin5uROuxdeDTvmM5TrwbTPUq6dBMF+HdEe+mrbgGlsROWO8c52uuUoW8hlwVPYfjUWTtMF3q2Z+o3TeOlLT5HYuwQGJUu9da8cE=
ARC-Authentication-Results: i=1; mx.zohomail.com.au;
	dkim=pass  header.i=scstudios.tech;
	spf=pass  smtp.mailfrom=ruben@scstudios.tech;
	dmarc=pass header.from=<ruben@scstudios.tech>
DKIM-Signature: a=rsa-sha256; b=NPUaq6KPuaNFML49GMBxM/sRUtCvmGIPyrLZo7sGmqxcwYOczYXe4l3ItSm55g9YiMDd/y18rpWQGs75oCpcBEdU6+MTq8wvAZP3ScpTuRmly3LcLZNaINMRQmY8qqj7HpfZ7VHCjzjUOhtvoBUojZEFogH1DdMAy3oop3dATYY=; c=relaxed/relaxed; s=zmail; d=scstudios.tech; v=1; bh=zD28XhKg0xRAFAYdyTHDmq6D+C7Hst1WBfaQKtFpJ/8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Feedback-ID:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by mx.zoho.com.au with SMTPS id 1788964897675430.9683353963428;
	Thu, 10 Sep 2026 00:41:37 +1000 (AEST)
From: Ruben Sutton <ruben@scstudios.tech>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Ruben Sutton <ruben@scstudios.tech>
Subject: [PATCH] docs: process: use gender-neutral pronouns
Date: Thu, 10 Sep 2026 00:41:00 +1000
Message-ID: <20260909144100.78177-1-ruben@scstudios.tech>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Several process documents use gendered pronouns when referring
generically to developers and maintainers. Use singular they instead,
making the language inclusive without changing its meaning.

Leave pronouns referring to named people and text in attributed
quotations unchanged.

Assisted-by: LLM
Signed-off-by: Ruben Sutton <ruben@scstudios.tech>
---
 Documentation/process/2.Process.rst            | 2 +-
 Documentation/process/5.Posting.rst            | 2 +-
 Documentation/process/6.Followthrough.rst      | 2 +-
 Documentation/process/handling-regressions.rst | 2 +-
 Documentation/process/howto.rst                | 2 +-
 Documentation/process/submitting-patches.rst   | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
index 77f3f80e7c..75b5c236d8 100644
--- a/Documentation/process/2.Process.rst
+++ b/Documentation/process/2.Process.rst
@@ -227,7 +227,7 @@ tree, usually (but certainly not always) using the git source management
 tool.  Tools like git (and related tools like quilt or mercurial) allow
 maintainers to track a list of patches, including authorship information
 and other metadata.  At any given time, the maintainer can identify which
-patches in his or her repository are not found in the mainline.
+patches in their repository are not found in the mainline.
 
 When the merge window opens, top-level maintainers will ask Linus to "pull"
 the patches they have selected for merging from their repositories.  If
diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
index 07d7dbed13..6e61204403 100644
--- a/Documentation/process/5.Posting.rst
+++ b/Documentation/process/5.Posting.rst
@@ -233,7 +233,7 @@ the patch. Each of these uses this format::
 
 The tags in common use are:
 
- - Signed-off-by: this is a developer's certification that he or she has
+ - Signed-off-by: this is a developer's certification that they have
    the right to submit the patch for inclusion into the kernel.  It is an
    agreement to the Developer's Certificate of Origin, the full text of
    which can be found in :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`
diff --git a/Documentation/process/6.Followthrough.rst b/Documentation/process/6.Followthrough.rst
index 66fa400c6d..ebb0e4cc95 100644
--- a/Documentation/process/6.Followthrough.rst
+++ b/Documentation/process/6.Followthrough.rst
@@ -114,7 +114,7 @@ What happens next
 If a patch is considered to be a good thing to add to the kernel, and once
 most of the review issues have been resolved, the next step is usually
 entry into a subsystem maintainer's tree.  How that works varies from one
-subsystem to the next; each maintainer has his or her own way of doing
+subsystem to the next; each maintainer has their own way of doing
 things.  In particular, there may be more than one tree - one, perhaps,
 dedicated to patches planned for the next merge window, and another for
 longer-term work.
diff --git a/Documentation/process/handling-regressions.rst b/Documentation/process/handling-regressions.rst
index c71b5d403f..6958a2a8b0 100644
--- a/Documentation/process/handling-regressions.rst
+++ b/Documentation/process/handling-regressions.rst
@@ -283,7 +283,7 @@ sure your patch description makes this aspect obvious. Once the change is
 merged, tell the Linux kernel's regression tracker and the regressions mailing
 list about the risk, so everyone has the change on the radar in case reports
 trickle in. Depending on the risk, you also might want to ask the subsystem
-maintainer to mention the issue in his mainline pull request.
+maintainer to mention the issue in their mainline pull request.
 
 What else is there to known about regressions?
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
index 9438e03d6f..8c60138d03 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -305,7 +305,7 @@ The maintainers of the various kernel subsystems --- and also many
 kernel subsystem developers --- expose their current state of
 development in source repositories.  That way, others can see what is
 happening in the different areas of the kernel.  In areas where
-development is rapid, a developer may be asked to base his submissions
+development is rapid, a developer may be asked to base their submissions
 onto such a subsystem kernel tree so that conflicts between the
 submission and other already ongoing work are avoided.
 
diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 7ae79452e1..4c28a239e8 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -456,7 +456,7 @@ When to use Acked-by:, Cc:, and Co-developed-by:
 ------------------------------------------------
 
 The Signed-off-by: tag indicates that the signer was involved in the
-development of the patch, or that he/she was in the patch's delivery path.
+development of the patch, or that they were in the patch's delivery path.
 
 If a person was not directly involved in the preparation or handling of a
 patch but wishes to signify and record their approval of it then they can

base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
-- 
2.54.0 (Apple Git-157)

