Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE942EA1
	for <regressions@lists.linux.dev>; Sun, 18 Jun 2023 08:49:49 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qAo6P-00041p-5B; Sun, 18 Jun 2023 10:49:41 +0200
Message-ID: <9e0f5378-63d8-add4-2b79-2173a4c98086@leemhuis.info>
Date: Sun, 18 Jun 2023 10:49:40 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Greg KH <gregkh@linuxfoundation.org>
Subject: JFYI: patches in next that might be good to mainline rather sooner
 than later?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1687078189;aec6a2ff;
X-HE-SMSGID: 1qAo6P-00041p-5B

Hi Linus, hi Greg,

I got the impression that early stable releases with a huge number of
patches (like 6.3.2 with ~690 changes) seems to cause a few regressions.
As you know, those releases usually contain many backports of changes
merged during the merge window for the following mainline release (e.g.
6.4). That made me wonder:

How many patches do we have in linux-next right now that better should
be merged this cycle (e.g. ahead of the 6.4 release) instead of merging
them in the merge window for 6.5 and backporting them shortly afterwards?

To check I briefly set down and quickly hacked together a python
script[1] that looks at linux-next for patches with tags like 'Cc:
stable...' and 'Fixes: ', as all respectively some (or many?) of those
will be backported. I made the script ignore a few things, like commits
from the past eight days and commits that fix changes committed to
mainline more that a year ago.

I ran this a few minutes ago and it spilled out about 260 changes (about
80 of them with a stable tag). I put the results into a table:
https://docs.google.com/spreadsheets/d/1OnMrde1e7LBMPhOPJL0Sn9rd3W32mTGls_qGMoZS8z8/edit?usp=sharing

And now I'm not really sure what to do with this data. :-/ :-D

Some of those commits the script found to my untrained eyes look like
something that might have been worth having in 6.4 -- especially those
with a stable-tag. But not all of them. And I'm not suggesting to merge
them. It was just a exercise to see if this might be useful.

What do you think about this? Is this helpful somehow? Or can it be made
more helpful with a few changes? Especially if someone would regularly
run this?

Ciao, Thorsten

[1]
https://gitlab.com/knurd42/kernel-scripts/-/blob/master/stats/next_stable_candidates.py
(as any code likely will contain bugs)
