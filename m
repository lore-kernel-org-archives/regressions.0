Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42591B69
	for <regressions@lists.linux.dev>; Wed, 16 Feb 2022 06:51:40 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=truhe.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	id 1nKEA4-00083j-HS; Wed, 16 Feb 2022 07:51:36 +0100
From: Thorsten Leemhuis <linux@leemhuis.info>
To: linux-doc@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: workflows@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	regressions@lists.linux.dev,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v5 0/3] docs: add two texts covering regressions
Date: Wed, 16 Feb 2022 07:51:32 +0100
Message-Id: <cover.1644994117.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1644994300;bff2f532;
X-HE-SMSGID: 1nKEA4-00083j-HS

"We don't cause regressions" might be the first rule of Linux kernel
development, but it and other aspects of regressions nevertheless are hardly
described in the Linux kernel's documentation. The following patches change
this by creating two documents dedicated to the topic.

The second patch could easily be folded into the first one, but was kept
separate, as it might be a bit controversial. This also allows the patch
description to explain some backgrounds for this part of the document.
Additionally, ACKs and Reviewed-by tags can be collected separately this way.

v5 (this version):
- rename the two documents after review feedback from Jon
- drop the reviewed-by and ACK in the second patch: I slightly changed
  one entry (the one (the one starting with 'Aim to fix regressions
  within one week') and added one (the one starting with 'Developers
  should handle regressions in all supported kernel series') after review
  feedback from Jon
- remind developers to use "Fixes:" and "Cc: stable@vger.kernel.org"
  tags in "What's important when fixing regressions"
- drop a few quotes from Linus
- while modifying Documentation/admin-guide/reporting-issues.rst remove
  quotes around doc references
- a few small adjustments and fixes along the way

v4 (https://lore.kernel.org/lkml/cover.1643710947.git.linux@leemhuis.info/):
- countless small and medium changes after review feedback from Jon
  (thx), which also lead to a big change:
- split the document into two, one for users and one for developers
  (both added by the first patch, as they are interlinked).
- fixed and improved a bunch of areas I stumbled upon while checking the
  text again after the split
- add a third patch to get one of the user-centric document on
  regressions mentioned in Documentation/admin-guide/reporting-issues.rst
- note: the content added by the second patch did not change
  significantly, that's why I left an earlier reviewed-by for the patch
  and an ACK for the series in place there, but dropped the ACK for the
  first patch of the series

v3 (https://lore.kernel.org/regressions/cover.1643110442.git.linux@leemhuis.info/):
- drop RFC tag
- heavily reshuffled and slightly adjusted the text in the sections "The
  important bits for people fixing regressions" and "How to add a regression to
  regzbot's tracking somebody else reported?" to make them easier to grasp
- a few small fixes and improvements
- add ACK for the series from Greg (now for real)

v2/RFC (https://lore.kernel.org/linux-doc/cover.1641565030.git.linux@leemhuis.info/):
- a lot of small fixes, most are for spelling mistakes and grammar
  errors/problems pointed out in the review feedback I got so far
- add ACK for the series from Greg

v1/RFC (https://lore.kernel.org/linux-doc/cover.1641203216.git.linux@leemhuis.info/):
- initial version

---

Hi! Here is the latest version of my patch-set adding documentation
regarding regressions. It's mostly fine-tuning after the latest review
feedback from Jon.

@Greg, @Linus, would be cool if you could at least take a look at the
second patch and ACK or comment on it to make sure the text is
really okay for you, now that Jon indicated he's willing to apply this,
unless objections show up.

Ciao, Thorsten

Thorsten Leemhuis (3):
  docs: add two documents about regression handling
  docs: *-regressions.rst: explain how quickly issues should be handled
  docs: reporting-issues.rst: link new document about regressions

 Documentation/admin-guide/index.rst           |   1 +
 .../admin-guide/reporting-issues.rst          |  73 +-
 .../admin-guide/reporting-regressions.rst     | 451 +++++++++++
 .../process/handling-regressions.rst          | 746 ++++++++++++++++++
 Documentation/process/index.rst               |   1 +
 MAINTAINERS                                   |   2 +
 6 files changed, 1237 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/admin-guide/reporting-regressions.rst
 create mode 100644 Documentation/process/handling-regressions.rst


base-commit: f647de4b02dcb1815fb3019f86a001a681daf0a1
-- 
2.35.1

