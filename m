Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9AD2CA2
	for <regressions@lists.linux.dev>; Sun, 27 Nov 2022 17:32:23 +0000 (UTC)
Received: from [2a02:8108:963f:de38:5054:ff:feb3:8f48] (helo=regzbot.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	id 1ozLVs-0004JB-Ht; Sun, 27 Nov 2022 18:32:20 +0100
From: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
To: LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Linux regressions report  for mainline [2022-11-27]
Date: Sun, 27 Nov 2022 17:32:19 +0000
Message-Id: <166956961686.104691.2021186998003391429@leemhuis.info>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1669570343;2b75b987;
X-HE-SMSGID: 1ozLVs-0004JB-Ht

Hi Linus! Below is a slightly edited report from regzbot listing all
regression from this cycle that the bot and I are currently aware of.

One net regression is brand new and a fix already was posted. The
arm64/qcom one reently was discussed. The arm64/drm one looks stalled
and is waiting for feedback from the reporter afaics; I already send
an inquiry, but that didn't help.

HTH, Ciao, Thorsten
---
Hi, this is regzbot, the Linux kernel regression tracking bot.

Currently I'm aware of 3 regressions in linux-mainline. Find the
current status below and the latest on the web:

https://linux-regtracking.leemhuis.info/regzbot/mainline/

Bye bye, hope to see you soon for the next report.
   Regzbot (on behalf of Thorsten Leemhuis)


======================================================
current cycle (v6.0.. aka v6.1-rc), culprit identified
======================================================


[ *NEW* ] net: RTM_DELROUTE not sent anymore when deleting (last) nexthop of routes
-----------------------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/CAOiHx==ddZr6mvvbzgoAwwhJW76qGNVOcNsTG-6m79Ch+=aA5Q@mail.gmail.com/
https://lore.kernel.org/netdev/CAOiHx==ddZr6mvvbzgoAwwhJW76qGNVOcNsTG-6m79Ch%2B=aA5Q@mail.gmail.com/

By Jonas Gorski; 3 days ago; 13 activities, latest 2 days ago.
Introduced in 61b91eb33a69 (v6.1-rc1)

Recent activities from: Jonas Gorski (5), Ido Schimmel (4), David
  Ahern (2), Thorsten Leemhuis (1), Nikolay Aleksandrov (1)

One patch associated with this regression:
* Re: RTM_DELROUTE not sent anymore when deleting (last) nexthop of routes in 6.1
  https://lore.kernel.org/netdev/Y3%2BV9gu4NUQ7P0mL@shredder/
  3 days ago, by Ido Schimmel

Noteworthy links:
* [PATCH net] ipv4: Fix route deletion when nexthop info is not specified
  https://lore.kernel.org/netdev/20221124210932.2470010-1-idosch@nvidia.com/
  2 days ago, by Ido Schimmel; thread monitored.


arm64: crash on the Qualcomm SM8250
-----------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/CAMi1Hd1VBCFhf7+EXWHQWcGy4k=tcyLa7RGiFdprtRnegSG0Mw@mail.gmail.com/
https://lore.kernel.org/lkml/CAMi1Hd1VBCFhf7%2BEXWHQWcGy4k=tcyLa7RGiFdprtRnegSG0Mw@mail.gmail.com/

By Amit Pundir; 18 days ago; 17 activities, latest 3 days ago.
Introduced in c44094eee32f (v6.1-rc1)

Recent activities from: Catalin Marinas (1), Sibi Sankar (1), Manivannan
  Sadhasivam (1)

Noteworthy links:
* [PATCH] Revert "arm64: dma: Drop cache invalidation from arch_dma_prep_coherent()"
  https://lore.kernel.org/lkml/20221114110329.68413-1-manivannan.sadhasivam@linaro.org/
  13 days ago, by Manivannan Sadhasivam; thread monitored.


drm: msm: DSI controller being switched off before the panel unprepare hook is called
-------------------------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/1892d0af-8aa4-dc03-887a-e44bb623b836@linaro.org/
https://lore.kernel.org/dri-devel/1892d0af-8aa4-dc03-887a-e44bb623b836@linaro.org/

By Caleb Connolly; 16 days ago; 2 activities, latest 14 days ago.
Introduced in 007ac0262b0d (v6.1-rc1)


=============
End of report
=============

All regressions marked '[ *NEW* ]' were added since the previous report,
which can be found here:
https://lore.kernel.org/r/166896848178.941482.1410650446316360950@leemhuis.info

Thanks for your attention, have a nice day!

  Regzbot, your hard working Linux kernel regression tracking robot


P.S.: Wanna know more about regzbot or how to use it to track regressions
for your subsystem? Then check out the getting started guide or the
reference documentation:

https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

The short version: if you see a regression report you want to see
tracked, just send a reply to the report where you Cc
regressions@lists.linux.dev with a line like this:

#regzbot introduced: v5.13..v5.14-rc1

If you want to fix a tracked regression, just do what is expected
anyway: add a 'Link:' tag with the url to the report, e.g.:

Link: https://lore.kernel.org/all/30th.anniversary.repost@klaava.Helsinki.FI/
