Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3181E362
	for <regressions@lists.linux.dev>; Fri,  8 Apr 2022 08:21:02 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ncjrS-0000yq-EN; Fri, 08 Apr 2022 10:20:54 +0200
Message-ID: <cd89d263-43e4-5634-75b9-bf3340c9bb1e@leemhuis.info>
Date: Fri, 8 Apr 2022 10:20:54 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Bug 215777 - ath11k: 5.17.x causes cpu soft-lock on xps13 9310
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1649406062;f3caacaa;
X-HE-SMSGID: 1ncjrS-0000yq-EN

Hi, this is your Linux kernel regression tracker speaking.

About a week ago a regression was reported to bugzilla.kernel.org that
seems to be handled there already, nevertheless I'd like to add to the
tracking to ensure it's not forgotten.

#regzbot introduced: 9dcf6808b253a72b2c90eed179863bf5fab7d68c
#regzbot from: dominik.foerderer@windeck-gymnasium.de
<dominik.foerderer@windeck-gymnasium.de>
#regzbot title: net: wifi: ath11k: 5.17.x causes cpu soft-lock on xps13
9310
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215777

See the ticket for details, there were a few replies already.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.

-- 
Additional information about regzbot:

If you want to know more about regzbot, check out its web-interface, the
getting start guide, and the references documentation:

https://linux-regtracking.leemhuis.info/regzbot/
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

The last two documents will explain how you can interact with regzbot
yourself if your want to.

Hint for reporters: when reporting a regression it's in your interest to
CC the regression list and tell regzbot about the issue, as that ensures
the regression makes it onto the radar of the Linux kernel's regression
tracker -- that's in your interest, as it ensures your report won't fall
through the cracks unnoticed.

Hint for developers: you normally don't need to care about regzbot once
it's involved. Fix the issue as you normally would, just remember to
include 'Link:' tag in the patch descriptions pointing to all reports
about the issue. This has been expected from developers even before
regzbot showed up for reasons explained in
'Documentation/process/submitting-patches.rst' and
'Documentation/process/5.Posting.rst'.

