Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6628A33D6
	for <regressions@lists.linux.dev>; Sun,  6 Nov 2022 20:05:12 +0000 (UTC)
Received: from [2a02:8108:963f:de38:5054:ff:feb3:8f48] (helo=regzbot.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	id 1orltA-0002Pk-0q; Sun, 06 Nov 2022 21:05:04 +0100
From: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
To: LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Linux regressions report  for mainline [2022-11-06]
Date: Sun,  6 Nov 2022 20:05:03 +0000
Message-Id: <166776472694.309600.9987230244979099462@leemhuis.info>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1667765112;043461fb;
X-HE-SMSGID: 1orltA-0002Pk-0q

Hi Linus! Below is a slightly edited report from regzbot listing all
regression from this cycle that the bot and I are currently aware of.

Patches for two mm issues are available. I guess Andrew will send
them your way in the next few days (one of them hasn't even hit -next yet).

The amdgpu issue is progressing slowly. The efi issue looks stalled,
will poke the thread tomorrow; maybe there was some progress and I just
missed it.

HTH, Ciao, Thorsten

---

Hi, this is regzbot, the Linux kernel regression tracking bot.

Currently I'm aware of 4 regressions in linux-mainline. Find the
current status below and the latest on the web:

https://linux-regtracking.leemhuis.info/regzbot/mainline/

Bye bye, hope to see you soon for the next report.
   Regzbot (on behalf of Thorsten Leemhuis)


======================================================
current cycle (v6.0.. aka v6.1-rc), culprit identified
======================================================


[ *NEW* ] mm/btrfs: systemd-oomd overreacting due to PSI changes for Btrfs
--------------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/d20a0a85-e415-cf78-27f9-77dd7a94bc8d@leemhuis.info/
https://lore.kernel.org/linux-block/d20a0a85-e415-cf78-27f9-77dd7a94bc8d@leemhuis.info/

By Thorsten Leemhuis; 3 days ago; 5 activities, latest 2 days ago.
Introduced in 4088a47e78f9 (v6.1-rc1)

Recent activities from: Johannes Weiner (2), Thorsten Leemhuis (2),
  Christoph Hellwig (1)

2 patch postings are associated with this regression, the latest is this:
* Re: [REGESSION] systemd-oomd overreacting due to PSI changes for Btrfs (was: Re: [PATCH 3/5] btrfs: add manual PSI accounting for compressed reads)
  https://lore.kernel.org/linux-fsdevel/Y2UHRqthNUwuIQGS@cmpxchg.org/
  2 days ago, by Johannes Weiner


mm: sparc64: dpkg fails on sparc64 since "mm/thp: Carry over dirty bit when thp splits on pmd)"
-----------------------------------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/20221021160603.GA23307@u164.east.ru/
https://lore.kernel.org/lkml/20221021160603.GA23307@u164.east.ru/

By Anatoly Pugachev; 16 days ago; 8 activities, latest 2 days ago.
Introduced in 0ccf7f168e17 (v6.1-rc1)

Fix incoming:
* Partly revert "mm/thp: carry over dirty bit when thp splits on pmd"
  https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=master&id=434e3d15d92b0be26e0acd7dbbeb75ca20d64a6c


drm: amdgpu: some games (Cyberpunk 2077, Forza Horizon 4/5) hang at start
-------------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/CABXGCsOeQ7VYm98jRVaYp6KaNsFVsAnSb33ZT8JvZxcTcEGW0w@mail.gmail.com/
https://lore.kernel.org/lkml/CABXGCsOeQ7VYm98jRVaYp6KaNsFVsAnSb33ZT8JvZxcTcEGW0w@mail.gmail.com/

By Mikhail Gavrilov; 16 days ago; 8 activities, latest 4 days ago.
Introduced in dd80d9c8eeca (v6.1-rc1)

Recent activities from: Christian König (2), Mikhail Gavrilov (2)


efi: crashes due to broken runtime-wrapper
------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/CAMj1kXHDtwkMgqqwePEKdOdO=7-1_TYyuVNPJ7PkyreaMySjCw@mail.gmail.com/
https://lore.kernel.org/linux-arm-kernel/CAMj1kXHDtwkMgqqwePEKdOdO=7-1_TYyuVNPJ7PkyreaMySjCw@mail.gmail.com/

By Ard Biesheuvel; 9 days ago; 4 activities, latest 9 days ago.
Introduced in d3549a938b73 (v6.1-rc1)


=============
End of report
=============

All regressions marked '[ *NEW* ]' were added since the previous report,
which can be found here:
https://lore.kernel.org/r/166715973405.73686.12627284653277847588@leemhuis.info

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
