Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA1A8F5E
	for <regressions@lists.linux.dev>; Sun, 30 Oct 2022 20:00:10 +0000 (UTC)
Received: from [2a02:8108:963f:de38:5054:ff:feb3:8f48] (helo=regzbot.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	id 1opETX-0006d0-73; Sun, 30 Oct 2022 21:00:07 +0100
From: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
To: LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Linux regressions report  for mainline [2022-10-30]
Date: Sun, 30 Oct 2022 20:00:06 +0000
Message-Id: <166715973405.73686.12627284653277847588@leemhuis.info>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1667160010;b7a8d661;
X-HE-SMSGID: 1opETX-0006d0-73

Hi Linus! Below is a slightly edited report from regzbot listing all
regression from this cycle that the bot and I are currently aware of.

All of them are less that ten days old. I didn't have time to look
closer into each of them in the past three days, but from a quick
glance it seems developers are looking into each of them.

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


[ *NEW* ] ppc: PASemi PA6T CPU: Network Manager and LightDM and fill volume with data
-------------------------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/6C70D01A-B819-40BC-94F7-5BA6D8109134@xenosoft.de/
https://lore.kernel.org/linuxppc-dev/6C70D01A-B819-40BC-94F7-5BA6D8109134@xenosoft.de/

By Christian Zigotzky; 18 days ago; 19 activities, latest 0 days ago.
Introduced in c2e7a19827ee (v6.1-rc1)

Recent activities from: Christian Zigotzky (3), Segher Boessenkool (1)

One patch associated with this regression:
* Re: Issues with the first PowerPC updates for the kernel 6.1
  https://lore.kernel.org/linuxppc-dev/cdfd1d7e-f462-9b1b-f281-f227b44b2dee@xenosoft.de/
  0 days ago, by Christian Zigotzky


[ *NEW* ] efi: crashes due to broken runtime-wrapper
----------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/CAMj1kXHDtwkMgqqwePEKdOdO=7-1_TYyuVNPJ7PkyreaMySjCw@mail.gmail.com/
https://lore.kernel.org/linux-arm-kernel/CAMj1kXHDtwkMgqqwePEKdOdO=7-1_TYyuVNPJ7PkyreaMySjCw@mail.gmail.com/

By Ard Biesheuvel; 2 days ago; 4 activities, latest 2 days ago.
Introduced in d3549a938b73 (v6.1-rc1)

Recent activities from: Ard Biesheuvel (3), Gavin Shan (1)


drm: amdgpu: some games (Cyberpunk 2077, Forza Horizon 4/5) hang at start
-------------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/CABXGCsOeQ7VYm98jRVaYp6KaNsFVsAnSb33ZT8JvZxcTcEGW0w@mail.gmail.com/
https://lore.kernel.org/lkml/CABXGCsOeQ7VYm98jRVaYp6KaNsFVsAnSb33ZT8JvZxcTcEGW0w@mail.gmail.com/

By Mikhail Gavrilov; 9 days ago; 4 activities, latest 4 days ago.
Introduced in dd80d9c8eeca (v6.1-rc1)

Recent activities from: Christian König (1)


mm: sparc64: dpkg fails on sparc64 since "mm/thp: Carry over dirty bit when thp splits on pmd)"
-----------------------------------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/20221021160603.GA23307@u164.east.ru/
https://lore.kernel.org/lkml/20221021160603.GA23307@u164.east.ru/

By Anatoly Pugachev; 9 days ago; 4 activities, latest 5 days ago.
Introduced in 0ccf7f168e17 (v6.1-rc1)

Recent activities from: Peter Xu (2), Anatoly Pugachev (1)


[ *NEW* ] SCMI HWMON driver failed probing on JUNO
--------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/Y1WHnJ6h1RSOipV4@e120937-lin/
https://lore.kernel.org/lkml/Y1WHnJ6h1RSOipV4@e120937-lin/

By Cristian Marussi; 7 days ago; 6 activities, latest 5 days ago.
Introduced in e51813313 (v6.1-rc1)

Recent activities from: Cristian Marussi (3), Guenter Roeck (3)


=============
End of report
=============

All regressions marked '[ *NEW* ]' were added since the previous report,
which can be found here:
https://lore.kernel.org/r/166654892458.2211781.4685104302005471754@leemhuis.info

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
