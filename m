Received: from p3plwbeout16-01.prod.phx3.secureserver.net (p3plsmtp16-01-2.prod.phx3.secureserver.net [173.201.193.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819AE6110
	for <regressions@lists.linux.dev>; Thu, 20 Oct 2022 22:39:20 +0000 (UTC)
Received: from mailex.mailcore.me ([94.136.40.144])
	by :WBEOUT: with ESMTP
	id le9MojjV4ebATle9NooyxF; Thu, 20 Oct 2022 15:36:29 -0700
X-CMAE-Analysis: v=2.4 cv=LIuj/La9 c=1 sm=1 tr=0 ts=6351cd6d
 a=wXHyRMViKMYRd//SnbHIqA==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=Qawa6l4ZSaYA:10 a=yWIVPUuzvU3vGxsu7U8A:9
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: le9MojjV4ebAT
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175] helo=phoenix.fritz.box)
	by smtp12.mailcore.me with esmtpa (Exim 4.94.2)
	(envelope-from <phillip@squashfs.org.uk>)
	id 1ole9M-0006zQ-4P; Thu, 20 Oct 2022 23:36:28 +0100
From: Phillip Lougher <phillip@squashfs.org.uk>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Cc: hsinyi@chromium.org,
	regressions@leemhuis.info,
	regressions@lists.linux.dev,
	dimitri.ledkov@canonical.com,
	michael.vogt@canonical.com,
	phillip.lougher@gmail.com,
	ogra@ubuntu.com,
	olivier.tilloy@canonical.com
Subject: [0/3] squashfs: fix some regressions introduced in the readahead code
Date: Thu, 20 Oct 2022 23:36:13 +0100
Message-Id: <20221020223616.7571-1-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated:  phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfHCzMTlGxP8c1br1U6z8GFh+gSmFodHpA28Q/CW5xmIgvE1BLR9O7O9SMsMSbu0f0GW9Vh/91vc5bQ3mHR16gG3FuEYip5i+9DL9CrwaacOwRfDEjiu3
 T4EocGINWM4P/m/OAOr86nhYglIxw4IfziIaOZhlF0piQO2wQ5e9sQ6nOoQ09rOwvgQ2zlQRVERxNQVgSzywWf5fZm6dP+R0DVc=

Hi,

This patch-set fixes 3 regressions introduced by the recent readahead code.
The first regression is causing "snaps" to randomly fail after a couple of
hours or days, which how the regression came to light.

----------------------------------------------------------------
Phillip Lougher (3):
      squashfs: fix read regression introduced in readahead code
      squashfs: fix extending readahead beyond end of file
      squashfs: fix buffer release race condition in readahead code

 fs/squashfs/file.c       | 23 ++++++++++++++---------
 fs/squashfs/page_actor.c |  3 +++
 fs/squashfs/page_actor.h |  6 +++++-
 3 files changed, 22 insertions(+), 10 deletions(-)
