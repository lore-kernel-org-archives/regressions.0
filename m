Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138A328FA
	for <regressions@lists.linux.dev>; Sun, 20 Nov 2022 18:26:13 +0000 (UTC)
Received: from [2a02:8108:963f:de38:5054:ff:feb3:8f48] (helo=regzbot.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	id 1owp19-0007X4-Ut; Sun, 20 Nov 2022 19:26:12 +0100
From: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
To: LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Linux regressions report  for mainline [2022-11-20]
Date: Sun, 20 Nov 2022 18:26:11 +0000
Message-Id: <166896848178.941482.1410650446316360950@leemhuis.info>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1668968774;70d8808c;
X-HE-SMSGID: 1owp19-0007X4-Ut

Hi Linus! Below is a slightly edited report from regzbot listing all
regression from this cycle that the bot and I are currently aware of.

For most of them there was recent activity and fixes will likely be
heading your way over the next few days. The exception here is "drm:
msm: DSI controller being switched off before the panel unprepare hook
is called", that looks somewhat stalled.

HTH, Ciao, Thorsten

---
Hi, this is regzbot, the Linux kernel regression tracking bot.

Currently I'm aware of 5 regressions in linux-mainline. Find the
current status below and the latest on the web:

https://linux-regtracking.leemhuis.info/regzbot/mainline/

Bye bye, hope to see you soon for the next report.
   Regzbot (on behalf of Thorsten Leemhuis)


======================================================
current cycle (v6.0.. aka v6.1-rc), culprit identified
======================================================


drm: amdgpu: some games (Cyberpunk 2077, Forza Horizon 4/5) hang at start
-------------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/CABXGCsOeQ7VYm98jRVaYp6KaNsFVsAnSb33ZT8JvZxcTcEGW0w@mail.gmail.com/
https://lore.kernel.org/lkml/CABXGCsOeQ7VYm98jRVaYp6KaNsFVsAnSb33ZT8JvZxcTcEGW0w@mail.gmail.com/

By Mikhail Gavrilov; 30 days ago; 17 activities, latest 0 days ago.
Introduced in dd80d9c8eeca (v6.1-rc1)

Fix incoming:
* drm/amdgpu: fix userptr HMM range handling v2
  https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=master&id=fec8fdb54e8f74d88951c9f998f47bf4f2031fe0


drm: amdgpu: No payload for [MST PORT:0000000006da5d29] found in mst state 00000000b0e556d6" on system resume with TBT dock connected.
--------------------------------------------------------------------------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/ghwn827862.fsf@gouders.net/
https://lore.kernel.org/lkml/ghwn827862.fsf@gouders.net/
https://gitlab.freedesktop.org/drm/amd/-/issues/2171

By Dirk Gouders and Unkown; 9 days ago; 15 activities, latest 1 days ago.
Introduced in 4d07b0bc4034 (v6.1-rc1)

Recent activities from: Lyude Paul (9), Alex Deucher (2), Lin, Wayne (1)

4 patch postings are associated with this regression, the latest is this:
* [PATCH v2 4/4] drm/amdgpu/dm/dp_mst: Don't grab mst_mgr->lock when computing DSC state
  https://lore.kernel.org/lkml/20221114221754.385090-5-lyude@redhat.com/
  5 days ago, by Lyude Paul

Noteworthy links:
* [PATCH v2 0/4] drm/amdgpu: Regression fixes from MST atomic-only conversion
  https://lore.kernel.org/amd-gfx/20221114221754.385090-1-lyude@redhat.com/
  5 days ago, by Lyude Paul; thread monitored.


[ *NEW* ] arm64: crash on the Qualcomm SM8250
---------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/CAMi1Hd1VBCFhf7+EXWHQWcGy4k=tcyLa7RGiFdprtRnegSG0Mw@mail.gmail.com/
https://lore.kernel.org/lkml/CAMi1Hd1VBCFhf7%2BEXWHQWcGy4k=tcyLa7RGiFdprtRnegSG0Mw@mail.gmail.com/

By Amit Pundir; 12 days ago; 14 activities, latest 2 days ago.
Introduced in c44094eee32f (v6.1-rc1)

Recent activities from: Will Deacon (3), Manivannan Sadhasivam (3),
  Catalin Marinas (2), Robin Murphy (1)

Noteworthy links:
* [PATCH] Revert "arm64: dma: Drop cache invalidation from arch_dma_prep_coherent()"
  https://lore.kernel.org/lkml/20221114110329.68413-1-manivannan.sadhasivam@linaro.org/
  6 days ago, by Manivannan Sadhasivam; thread monitored.


[ *NEW* ] cpufreq: schedutil: improved latency on Pixel 6
---------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/20221110195732.1382314-1-wusamuel@google.com/
https://lore.kernel.org/lkml/20221110195732.1382314-1-wusamuel@google.com/

By Sam Wu; 9 days ago; 6 activities, latest 2 days ago.
Introduced in 6d5afdc97ea7 (v6.1-rc1)

Recent activities from: Lukasz Luba (2), Sam Wu (1), Rafael J.
  Wysocki (1), Saravana Kannan (1)


drm: msm: DSI controller being switched off before the panel unprepare hook is called
-------------------------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/1892d0af-8aa4-dc03-887a-e44bb623b836@linaro.org/
https://lore.kernel.org/dri-devel/1892d0af-8aa4-dc03-887a-e44bb623b836@linaro.org/

By Caleb Connolly; 9 days ago; 2 activities, latest 7 days ago.
Introduced in 007ac0262b0d (v6.1-rc1)


=============
End of report
=============

All regressions marked '[ *NEW* ]' were added since the previous report,
which can be found here:
https://lore.kernel.org/r/166836521992.605503.16264140239924937400@leemhuis.info

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
