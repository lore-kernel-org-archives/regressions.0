Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601962C81
	for <regressions@lists.linux.dev>; Wed, 24 Nov 2021 07:48:48 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mpn1K-0000gh-Kt; Wed, 24 Nov 2021 08:48:46 +0100
Message-ID: <e694f9fe-56a9-aaec-f802-0f7a06b10ee5@leemhuis.info>
Date: Wed, 24 Nov 2021 08:48:46 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-BS
To: Stefan Dietrich <roots@gmx.de>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev
References: <924175a188159f4e03bd69908a91e606b574139b.camel@gmx.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [REGRESSION] Kernel 5.15 reboots / freezes upon ifup/ifdown
In-Reply-To: <924175a188159f4e03bd69908a91e606b574139b.camel@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1637740128;1bfa6232;
X-HE-SMSGID: 1mpn1K-0000gh-Kt

Hi, this is your Linux kernel regression tracker speaking.

On 24.11.21 08:28, Stefan Dietrich wrote:
> Summary: When attempting to rise or shut down a NIC manually or via
> network-manager under 5.15, the machine reboots or freezes.
> 
> Occurs with: 5.15.4-051504-generic and earlier 5.15 mainline (
> https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.15.4/) as well as
> liquorix flavours.
> Does not occur with: 5.14 and 5.13 (both with various flavours)

Thx for the report. Small detail: you CCed the stable list, but this
afaics is a mainline regression. Likely one in the network subsystem, so
it might be good to get the mailing list where the network developer
hang out in the loop. But as Greg already said: a bisection would help a
lot to find the root cause and thus the developers that need to take
care of this.

Anyway, to be sure this issue doesn't fall through the cracks unnoticed,
I'm adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced v5.14..v5.15
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

P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
on my table. I can only look briefly into most of them. Unfortunately
therefore I sometimes will get things wrong or miss something important.
I hope that's not the case here; if you think it is, don't hesitate to
tell me about it in a public reply. That's in everyone's interest, as
what I wrote above might be misleading to everyone reading this; any
suggestion I gave they thus might sent someone reading this down the
wrong rabbit hole, which none of us wants.

BTW, I have no personal interest in this issue, which is tracked using
regzbot, my Linux kernel regression tracking bot
(https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
this mail to get things rolling again and hence don't need to be CC on
all further activities wrt to this regression.
