Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D873E2CA7
	for <regressions@lists.linux.dev>; Tue, 25 Jan 2022 11:44:24 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=truhe.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	id 1nCKFD-0001tA-BF; Tue, 25 Jan 2022 12:44:15 +0100
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
Subject: [PATCH v3 0/2] docs: add a text about regressions to the Linux kernel's documentation
Date: Tue, 25 Jan 2022 12:44:12 +0100
Message-Id: <cover.1643110442.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1643111064;9d64428f;
X-HE-SMSGID: 1nCKFD-0001tA-BF

'We don't cause regressions' might be the first rule of Linux kernel
development, but it and other aspects of regressions nevertheless are hardly
described in the Linux kernel's documentation. The following two patches change
this by creating a document dedicated to the topic.

The second patch could easily be folded into the first one, but was kept
separate, as it might be a bit controversial. This also allows the patch
description to explain some backgrounds for this part of the document.
Additionally, ACKs and Reviewed-by tags can be collected separately this way.

v3 (this mail):
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

Hi! Merge window is over, so I'd like to move on with this. Dropped the RFC tag;
I had a small hope Linus would take a look at this (especially the second patch)
before I remove it; well, didn't work out, but Greg ACKed it, which is good
enough reason to move on with this. :-D

Ciao, Thorsten

Thorsten Leemhuis (2):
  docs: add a document about regression handling
  docs: regressions.rst: rules of thumb for handling regressions

 Documentation/admin-guide/index.rst       |   1 +
 Documentation/admin-guide/regressions.rst | 992 ++++++++++++++++++++++
 MAINTAINERS                               |   1 +
 3 files changed, 994 insertions(+)
 create mode 100644 Documentation/admin-guide/regressions.rst


base-commit: e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
-- 
2.31.1

