Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD561C06
	for <regressions@lists.linux.dev>; Sun, 11 Dec 2022 16:43:00 +0000 (UTC)
Received: from [2a02:8108:963f:de38:5054:ff:feb3:8f48] (helo=regzbot.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	id 1p4PPf-0002SD-T5; Sun, 11 Dec 2022 17:42:51 +0100
From: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
To: LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Linux regressions report  for mainline [2022-12-11]
Date: Sun, 11 Dec 2022 16:42:51 +0000
Message-Id: <167077682369.767290.4323979751797298970@leemhuis.info>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1670776980;7803268a;
X-HE-SMSGID: 1p4PPf-0002SD-T5

Hi Linus! Below you'll find regzbot's report about regression from this
cycle the bot and I became aware of. Most of the issue I had on the list
last weeks were resolved, only a few problems that showed up in the past
few days remain. One of them is the bisected BPF issue you already are
aware of Jiri is looking into; the other two need more debugging and
afaics will only show up in special, not that common setups...

HTH, Ciao, Thorsten

---

Hi, this is regzbot, the Linux kernel regression tracking bot.

Currently I'm aware of 44 regressions in linux-mainline. Find the
current status below and the latest on the web:

https://linux-regtracking.leemhuis.info/regzbot/mainline/

Bye bye, hope to see you soon for the next report.
   Regzbot (on behalf of Thorsten Leemhuis)


======================================================
current cycle (v6.0.. aka v6.1-rc), culprit identified
======================================================


[ *NEW* ] net/bpf: BUG: unable to handle kernel paging request in bpf_dispatcher_xdp
------------------------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/CACkBjsYioeJLhJAZ=Sq4CAL2O_W+5uqcJynFgLSizWLqEjNrjw@mail.gmail.com/
https://lore.kernel.org/lkml/CACkBjsYioeJLhJAZ=Sq4CAL2O_W%2B5uqcJynFgLSizWLqEjNrjw@mail.gmail.com/

By Hao Sun; 5 days ago; 26 activities, latest 1 days ago.
Introduced in c86df29d11df (v6.1-rc6)

Recent activities from: Jiri Olsa (14), Alexei Starovoitov (3), Jakub
  Kicinski (3), Daniel Borkmann (2), Hao Sun (2), Paul E. McKenney (1),
  Yonghong Song (1)

4 patch postings are associated with this regression, the latest is this:
* Re: BUG: unable to handle kernel paging request in bpf_dispatcher_xdp
  https://lore.kernel.org/lkml/Y5PNeFYJrC6D4P9p@krava/
  1 days ago, by Jiri Olsa


==================================================
current cycle (v6.0.. aka v6.1-rc), unkown culprit
==================================================


[ *NEW* ] resume from suspend broken on Asus UX305FA after PCI/PTM changes in kernel 6.1-rc1
--------------------------------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/216782/
https://bugzilla.kernel.org/show_bug.cgi?id=216782
https://lore.kernel.org/regressions/5e8317f7-170a-588b-7a94-e0a546fbc9f3@leemhuis.info/

By Tasev Nikola and Tasev Nikola; 4 days ago; 13 activities, latest 2 days ago.
Introduced in v6.0..v6.1-rc1

Recent activities from: Tasev Nikola (9), Bjorn Helgaas (2), Thorsten
  Leemhuis (1), The Linux kernel's regression tracker (Thorsten
  Leemhuis) (1)


[ *NEW* ] bcache: memcpy: detected field-spanning write...
----------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/216785/
https://bugzilla.kernel.org/show_bug.cgi?id=216785
https://lore.kernel.org/lkml/19200730-a3ba-6f4f-bb81-71339bdbbf73@leemhuis.info/

By Alexandre Pereira and Alexandre Pereira; 3 days ago; 1 activities, latest 3 days ago.
Introduced in v6.0..v6.1-rc8

Recent activities from: Alexandre Pereira (1)


=============
End of report
=============

All regressions marked '[ *NEW* ]' were added since the previous report,
which can be found here:
https://lore.kernel.org/r/167016324121.413036.10816787460130337195@leemhuis.info

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
