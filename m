Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A463EEDF
	for <regressions@lists.linux.dev>; Sun, 29 Oct 2023 13:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:5054:ff:feb3:8f48] (helo=regzbot.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	id 1qx6DU-0002G8-Ax; Sun, 29 Oct 2023 14:52:36 +0100
From: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
To: LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Linux regressions report  for mainline [2023-10-29]
Date: Sun, 29 Oct 2023 13:52:35 +0000
Message-Id: <169858752781.1095326.10615907253726224231@leemhuis.info>
X-Mailer: git-send-email 2.40.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1698587558;c36f483f;
X-HE-SMSGID: 1qx6DU-0002G8-Ax

Hi Linus. Just three 6.6 regression remain on my list after a few I
tracked were resolved last week.  One of the remaining ones is new:
module loading trouble on some laptops. Not nice, but likely nothing
many users will encounter. The quota compilation oddity problem from
Andy is also still around (unless it was fixed without me noticing); and
a memleak, too. See below for details.

FWIW, there was some news wrt to the two 6.5 regressions I mentioned in
last weeks report[1]:

* There was another report about a blank screen during boot on a Lenovo
laptop because simpledrm (that users apparently had enabled without
problems beforehand) started to support those machines due to
60aebc9559492c ("drivers/firmware: Move sysfb_init() from
device_initcall to subsys_initcall_sync"). I suggested a revert, but the
developers disagree (to quote: "From my point of view, this is not a
regression, 60aebc9559492c doesn't cause a problem, but exposes a
problem.") and the DRM maintainer didn't comment. At least we got a very
small step closer to finding the root cause. In case you care about the
details or want to speak up, check out this thread:
https://lore.kernel.org/dri-devel/82f1b533-3bd8-4418-843a-718d9a6b5786@leemhuis.info/

* The Fuse on Android breakage is still discussed; it's still unclear to
me if this really is a regression, as the reporter did not answer some
questions I brought up to hopefully clarify the situation. But it seems
Greg thinks that this is a regression. In case you care, check out this
thread:
https://lore.kernel.org/all/2023102731-wobbly-glimpse-97f5@gregkh/

[1]
https://lore.kernel.org/all/169799330468.525178.1969942838211820764@leemhuis.info/

Ciao, Thorsten

---

Hi, this is regzbot, the Linux kernel regression tracking bot.

Currently I'm aware of 3 regressions in linux-mainline. Find the
current status below and the latest on the web:

https://linux-regtracking.leemhuis.info/regzbot/mainline/

Bye bye, hope to see you soon for the next report.
   Regzbot (on behalf of Thorsten Leemhuis)


======================================================
current cycle (v6.5.. aka v6.6-rc), culprit identified
======================================================


[ *NEW* ] sysfs: cannot create duplicate filename .../system76_acpi::kbd_backlight/color
----------------------------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/bugzilla.kernel.org/218045/
https://bugzilla.kernel.org/show_bug.cgi?id=218045
https://lore.kernel.org/lkml/b5646db3-acff-45aa-baef-df3f660486fb@gmail.com/

By Johannes Penßel and Johannes Penßel; 3 days ago; 3 activities, latest 0 days ago.
Introduced in c7d80059b086 (v6.6-rc1)

Recent activities from: Johannes Penßel (2), Bagas Sanjaya (1)


[ *NEW* ] stable offsets directory operation support triggers offset_ctx->xa memory leak
----------------------------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/bugzilla.kernel.org/218039/
https://bugzilla.kernel.org/show_bug.cgi?id=218039
https://lore.kernel.org/lkml/429b452c-2211-436a-9af7-21332f68db7d@gmail.com/

By vladbu and vladbu; 6 days ago; 4 activities, latest 3 days ago.
Introduced in 6faddda69f62 (v6.6-rc1)

Recent activities from: vladbu (2), Bagas Sanjaya (1), Vlad Buslov (1)


quota: boot on Intel Merrifield after merge commit 1500e7e0726e
---------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/lore/ZS5hhpG97QSvgYPf@smile.fi.intel.com/
https://lore.kernel.org/linux-fsdevel/ZS5hhpG97QSvgYPf@smile.fi.intel.com/

By Andy Shevchenko; 12 days ago; 46 activities, latest 5 days ago.
Introduced in 024128477809 (v6.6-rc1)

Recent activities from: Andy Shevchenko (2), Kees Cook (1), Baokun
  Li (1), Jan Kara (1)

2 patch postings are associated with this regression, the latest is this:
* Re: [GIT PULL] ext2, quota, and udf fixes for 6.6-rc1
  https://lore.kernel.org/linux-fsdevel/ZTKUDzONVHXnWAJc@smile.fi.intel.com/
  8 days ago, by Andy Shevchenko


=============
End of report
=============

All regressions marked '[ *NEW* ]' were added since the previous report,
which can be found here:
https://lore.kernel.org/r/169799330468.525178.1969942838211820764@leemhuis.info

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
