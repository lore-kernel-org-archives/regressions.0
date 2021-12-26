Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68418173
	for <regressions@lists.linux.dev>; Sun, 26 Dec 2021 20:39:45 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1n1aIx-0003eU-La; Sun, 26 Dec 2021 21:39:43 +0100
Message-ID: <2901182b-2fc3-7ccf-727d-b27f7aa30128@leemhuis.info>
Date: Sun, 26 Dec 2021 21:39:42 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Linux regressions report for mainline [2021-12-26]
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <164055061372.788592.14520202566843934212@leemhuis.info>
In-Reply-To: <164055061372.788592.14520202566843934212@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1640551185;0ba6fbec;
X-HE-SMSGID: 1n1aIx-0003eU-La

Two quick notes before I leave the keyboard for today:

On 26.12.21 21:30, Regzbot (on behalf of Thorsten Leemhuis) wrote:
> 
> ========================================================
> current cycle (v5.15.. aka v5.16-rc), culprit identified
> ========================================================
> [...]
> fbdev/efifb: Monitors no longer sleep (amdgpu dual monitor setup)
> -----------------------------------------------------------------
> https://linux-regtracking.leemhuis.info/regzbot/regression/8a27c986-4767-bd29-2073-6c4ffed49bba@jetfuse.net/
> https://lore.kernel.org/linux-fbdev/8a27c986-4767-bd29-2073-6c4ffed49bba@jetfuse.net/
> 
> By Brandon Nielsen, 19 days ago; 4 activities, latest 9 days ago.
> Introduced in 55285e21f045 (v5.16-rc1)
> 
> Noteworthy links:
> * https://bugzilla.redhat.com/show_bug.cgi?id=2028613
> * https://bugzilla.kernel.org/show_bug.cgi?id=215203

Note, there was activity in the linked ticket on bugzilla.kernel.org;
regzbot sadly is not able to detect this yet, this and other features to
improve interaction with b.k.o remain on the todo list for now (and
sadly likely will have to remain there for a few weeks, as I have some
other things I need to work on first for the project that made regzbot
possible)

> [...]
> ====================================================
> current cycle (v5.15.. aka v5.16-rc), unkown culprit
> ====================================================
> 
> 
> mm: reclaim_throttle leads to stall in near-OOM conditions
> ----------------------------------------------------------
> https://linux-regtracking.leemhuis.info/regzbot/regression/20211124011954.7cab9bb4@mail.inbox.lv/
> https://lore.kernel.org/lkml/20211124011954.7cab9bb4@mail.inbox.lv/
> 
> By Alexey Avramov, 33 days ago; 21 activities, latest 3 days ago.
> Introduced in v5.15..v5.16-rc1
> 
> Fix incoming:
> * mm: vmscan: reduce throttling due to a failure to make progress
>   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=master&id=57af06179e3ef2359c3a5e1678edfe0363a0b551
> 
> 
> mm: LTP/memcg testcase regression induced by 8cd7c588decf..66ce520bb7c2 series
> ------------------------------------------------------------------------------
> https://linux-regtracking.leemhuis.info/regzbot/regression/99e779783d6c7fce96448a3402061b9dc1b3b602.camel@gmx.de/
> https://lore.kernel.org/lkml/99e779783d6c7fce96448a3402061b9dc1b3b602.camel@gmx.de/
> 
> By Mike Galbraith, 35 days ago; 33 activities, latest 3 days ago.
> Introduced in 8cd7c588decf..66ce520bb7c2 (v5.15..v5.16-rc1)
> 
> Fix incoming:
> * mm: vmscan: reduce throttling due to a failure to make progress
>   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=master&id=57af06179e3ef2359c3a5e1678edfe0363a0b551

I wonder why the fix for those two was not among the patches from akpm
merged yesterday; guess will investigate tomorrow.

Ciao, Thorsten
