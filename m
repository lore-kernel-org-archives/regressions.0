Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1357C7B
	for <regressions@lists.linux.dev>; Sun, 25 Sep 2022 16:18:17 +0000 (UTC)
Received: from [2a02:8108:963f:de38:5054:ff:feb3:8f48] (helo=regzbot.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	id 1ocUKd-00067l-Rx; Sun, 25 Sep 2022 18:18:15 +0200
From: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
To: LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Linux regressions report  for mainline [2022-09-25]
Date: Sun, 25 Sep 2022 16:18:15 +0000
Message-Id: <166412229677.822304.14973265664331660600@leemhuis.info>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1664122698;04c86a0c;
X-HE-SMSGID: 1ocUKd-00067l-Rx

Hi Linus! Below is a slightly edited report from regzbot listing all
regression from this cycle that the bot and I are currently aware of.

I'm only aware of two regressions introduced this cycle. The kernel
panic on arm64/rock960 was just reported yesterday and already
investigated afaics; the one about graphical issues on Lenovo Yoga
is more than a week old, but it's is now dealt with and it currently
sounds like this won't hit many systems.

HTH, Ciao, Thorsten

---

Hi, this is regzbot, the Linux kernel regression tracking bot.

Currently I'm aware of 44 regressions in linux-mainline. Find the
current status below and the latest on the web:

https://linux-regtracking.leemhuis.info/regzbot/mainline/

Bye bye, hope to see you soon for the next report.
   Regzbot (on behalf of Thorsten Leemhuis)


=======================================================
current cycle (v5.19.. aka v6.0-rc), culprit identified
=======================================================


[ *NEW* ] arm64 / rock960 : kernel panic (NULL pointer dereference)
-------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/4f398e4c-973b-7843-2f75-27324d109277@linaro.org/
https://lore.kernel.org/lkml/4f398e4c-973b-7843-2f75-27324d109277@linaro.org/

By Daniel Lezcano; 0 days ago; 6 activities, latest 0 days ago.
Introduced in 14facbc1871a (v6.0-rc1)

Recent activities from: Michael Nazzareno Trimarchi (4), Daniel
  Lezcano (2)

One patch associated with this regression:
* Re: v6.0-rc6 - arm64 / rock960 : kernel panic
  https://lore.kernel.org/lkml/CAOf5uwnfCCwHjSXTurMtyEpZc_tF8bH=fxfwBzOtHcfM_S4tYg@mail.gmail.com/
  0 days ago, by Michael Nazzareno Trimarchi


Graphical issues on Lenovo Yoga 7 14ARB7 laptop since v6.0-rc1 (bisected)
-------------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/c1f8886a-5624-8f49-31b1-e42b6d20dcf5@augustwikerfors.se/
https://lore.kernel.org/lkml/c1f8886a-5624-8f49-31b1-e42b6d20dcf5@augustwikerfors.se/

By August Wikerfors; 7 days ago; 5 activities, latest 1 days ago.
Introduced in 7cc191ee7621 (v6.0-rc1)

Recent activities from: August Wikerfors (2), Leo Li (1), Alex
  Deucher (1)


=============
End of report
=============

All regressions marked '[ *NEW* ]' were added since the previous report,
which can be found here:
https://lore.kernel.org/r/166352773747.517659.4028966645485480297@leemhuis.info

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
