Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE963FE0
	for <regressions@lists.linux.dev>; Tue,  1 Feb 2022 10:26:43 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=truhe.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	id 1nEqMy-0002pB-5Q; Tue, 01 Feb 2022 11:26:40 +0100
From: Thorsten Leemhuis <linux@leemhuis.info>
To: linux-doc@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: workflows@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	regressions@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v4 0/3] docs: add two texts covering regressions
Date: Tue,  1 Feb 2022 11:26:36 +0100
Message-Id: <cover.1643710947.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1643711203;661d3094;
X-HE-SMSGID: 1nEqMy-0002pB-5Q

"We don't cause regressions" might be the first rule of Linux kernel
development, but it and other aspects of regressions nevertheless are hardly
described in the Linux kernel's documentation. The following patches change
this by creating two documents dedicated to the topic.

The second patch could easily be folded into the first one, but was kept
separate, as it might be a bit controversial. This also allows the patch
description to explain some backgrounds for this part of the document.
Additionally, ACKs and Reviewed-by tags can be collected separately this way.

v4 (this version):
- countless small and medium changes after review feedback from Jon (thx), which
  also lead to a big change:
- split the document into two, one for users and one for developers (both added
  by the first patch, as they are interlinked)
- fixed and improved a bunch of areas I stumbled upon while checking the text
  again after the split
- add a third patch to get one of the user-centric document on regressions
  mentioned in Documentation/admin-guide/reporting-issues.rst
- note: the content added by the second patch did not change significantly,
  that's why I left an earlier reviewed-by for the patch and an ACK for the
  series in place there, but dropped the ACK for the first patch of the series

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

Hi! Here is a updated version of my patch-set adding documentation regarding
regression. This bring bigger changes after Jon took a look and suggested
splitting the text up. I did that and changed a bunch of other things along the
way. But I for now decided against splitting off the regression tracking stuff
into one or two other documents, as suggested by Jon, as that IMHO distributes
the information over too many places.

Ciao, Thorsten

Thorsten Leemhuis (3):
  docs: add two documents about regression handling
  docs: regressions*rst: rules of thumb for handling regressions
  docs: reporting-issues.rst: link new document about regressions

 Documentation/admin-guide/index.rst           |   1 +
 .../admin-guide/regressions-users.rst         | 448 +++++++++++
 .../admin-guide/reporting-issues.rst          |  60 +-
 Documentation/process/index.rst               |   1 +
 Documentation/process/regressions-devs.rst    | 753 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 6 files changed, 1234 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/admin-guide/regressions-users.rst
 create mode 100644 Documentation/process/regressions-devs.rst


base-commit: b8f4eee6a630ef8c5f00594e25c377463b4f299c
-- 
2.31.1

