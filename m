Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820AB4C7E
	for <regressions@lists.linux.dev>; Fri, 18 Mar 2022 14:49:06 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nVDua-0000Qy-GP; Fri, 18 Mar 2022 15:49:04 +0100
Message-ID: <0a0b0127-8e5d-d6ca-52db-bf9937d6d887@leemhuis.info>
Date: Fri, 18 Mar 2022 15:49:04 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Bug 215679 - NVMe/writeback wb_workfn/blocked for more than 30
 seconds
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1647614946;b151d132;
X-HE-SMSGID: 1nVDua-0000Qy-GP

Hi, this is your Linux kernel regression tracker speaking.

About a week ago a regression was reported to bugzilla.kernel.org that
seems to be handled there already, nevertheless I'd like to add to the
tracking to ensure it's not forgotten.

#regzbot introduced: 4f5022453acd0f7b28012
#regzbot from: Imre Deak <imre.deak@intel.com>
#regzbot title: nvme: NVMe/writeback wb_workfn/blocked for more than 30
seconds
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215679

Quote:

> 
> After system suspend/resume filesystem IO will stall, producing a 'kworker blocked for more than x sec" in dmesg, recovering after a long delay. See the attached dmesg-suspend-resume-nvme-stuck.txt. I also noticed the same issue happening right after booting or after runtime suspend transitions.
> 
> The same issue also happens on multiple SKL systems in the i915 team's CI farm, see:
> 
> https://gitlab.freedesktop.org/drm/intel/-/issues/4547
> 
> I bisected the problem to
> commit 4f5022453acd0f7b28012e20b7d048470f129894
> Author: Jens Axboe <axboe@kernel.dk>
> Date:   Mon Oct 18 08:45:39 2021 -0600
> 
>     nvme: wire up completion batching for the IRQ path
> 
> By reverting it on top of 5.17.0-rc7, I can't reproduce the problem. Attached   dmesg-suspend-resume-nvme-ok.txt with the revert, captured after a few suspend/resume.


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
