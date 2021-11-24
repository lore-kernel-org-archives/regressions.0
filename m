Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7DE2C81
	for <regressions@lists.linux.dev>; Wed, 24 Nov 2021 07:41:11 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mpmtc-0002cq-I6; Wed, 24 Nov 2021 08:40:48 +0100
Message-ID: <f9361bfa-4e5c-7095-48d4-2b3950c4b85e@leemhuis.info>
Date: Wed, 24 Nov 2021 08:40:47 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: mm: 5.16 regression: reclaim_throttle leads to stall in near-OOM
 conditions
Content-Language: en-BS
To: Alexey Avramov <hakavlad@inbox.lv>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, mgorman@techsingularity.net,
 mhocko@suse.com, vbabka@suse.cz, neilb@suse.de, akpm@linux-foundation.org,
 corbet@lwn.net, riel@surriel.com, hannes@cmpxchg.org, david@fromorbit.com,
 willy@infradead.org, hdanton@sina.com, penguin-kernel@i-love.sakura.ne.jp,
 oleksandr@natalenko.name, kernel@xanmod.org, michael@michaellarabel.com,
 aros@gmx.com, hakavlad@gmail.com,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20211124011954.7cab9bb4@mail.inbox.lv>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20211124011954.7cab9bb4@mail.inbox.lv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1637739672;7d152ea5;
X-HE-SMSGID: 1mpmtc-0002cq-I6

Hi, this is your Linux kernel regression tracker speaking.

CCing regression mailing list, which should be in the loop for all
regressions, as explained here:
https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html

On 23.11.21 17:19, Alexey Avramov wrote:
> I found stalls in near-OOM conditions with Linux 5.16. This is not the
> hang-up that was reported by Artem S. Tashkinov in 2019 [1]. It's a *new* 
> regression. I will demonstrate this with one simple experiment, which I
> will reproduce with different kernels or settings.
> 
> With older versions of the kernel, running the `tail /dev/zero` command
> usually quickly leads to OOM condition.
> 
> I will run the command `for i in {1...3}; do tail /dev/zero; done` and log
> PSI metrics (using psi2log script from nohang v0.2.0 [2]) and some values
> from `/proc/meminfo` (using mem2log v0.1.0 [3]) while this command is
> running. During the experiment a single tab browser will be kept opened in
> which some video will be playing.
> [...]
TWIMC: To be sure this issue doesn't fall through the cracks unnoticed,
I'm adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced v5.15..v5.16-rc1
#regzbot title mm: reclaim_throttle leads to stall in near-OOM conditions
#regzbot ignore-activity

Ciao, Thorsten, your Linux kernel regression tracker.

P.S.: If you want to know more about regzbot, check out its
web-interface, the getting start guide, and/or the references documentation:

https://linux-regtracking.leemhuis.info/regzbot/
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

The last two documents will explain how you can interact with regzbot
yourself if your want to.

Hint for the reporter: when reporting a regression it's in your interest
to tell #regzbot about it in the report, as that will ensure the
regression gets on the radar of regzbot and the regression tracker.
That's in your interest, as they will make sure the report won't fall
through the cracks unnoticed.

Hint for developers: you normally don't need to care about regzbot, just
fix the issue as you normally would. Just remember to include a 'Link:'
tag to the report in the commit message, as explained in
Documentation/process/submitting-patches.rst
That aspect was recently was made more explicit in commit 1f57bd42b77c:
https://git.kernel.org/linus/1f57bd42b77c

P.P.S.: As a Linux kernel regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them.
Unfortunately therefore I sometimes will get things wrong or miss
something important. I hope that's not the case here; if you think it
is, don't hesitate to tell me about it in a public reply. That's in
everyone's interest, as what I wrote above might be misleading to
everyone reading this; any suggestion I gave they thus might sent
someone reading this down the wrong rabbit hole, which none of us wants.

BTW, I have no personal interest in this issue, which is tracked using
regzbot, my Linux kernel regression tracking bot
(https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
this mail to get things rolling again and hence don't need to be CC on
all further activities wrt to this regression.
