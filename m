Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF965EAA
	for <regressions@lists.linux.dev>; Sun, 20 Feb 2022 17:26:26 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nLpya-0001jt-F4; Sun, 20 Feb 2022 18:26:24 +0100
Message-ID: <52d494d1-6133-d7ac-932b-1b70c136096c@leemhuis.info>
Date: Sun, 20 Feb 2022 18:26:24 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Bug 215596 - Commit 59ec715 breaks systemd LimitNPROC with
 PrivateUsers
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1645377986;f8248152;
X-HE-SMSGID: 1nLpya-0001jt-F4

Hi, this is your Linux kernel regression tracker speaking.

About a week ago a regression was reported to bugzilla.kernel.org that
seems to be handled there already, nevertheless I'd like to add to the
tracking to ensure it's not forgotten.

#regzbot introduced: 59ec71575ab4
#regzbot from: Etienne Dechamps <etienne@edechamps.fr>
#regzbot title: Commit 59ec715 breaks systemd LimitNPROC with PrivateUsers
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215596

Quote:

> Commit 59ec715 "ucounts: Fix rlimit max values check", first included in Linux 5.15.12, breaks systemd "LimitNPROC" (RLIMIT_NPROC) when combined with "PrivateUsers" (user namespacing).
> 
> This can be reproduced with a trivial systemd service file:
> 
> [Service]
> User=nobody
> PrivateUsers=yes
> LimitNPROC=4
> Type=oneshot
> ExecStart=/bin/true
> 
> Which, on 59ec715, fails with:
> 
> Failed to execute /bin/true: Resource temporarily unavailable
> Failed at step EXEC spawning /bin/true: Resource temporarily unavailable
> Main process exited, code=exited, status=203/EXEC
> 
> (Even though user `nobody` has no running processes besides this one)
> 
> A strace on PID 1 reveals the following sequence of calls (excerpt):
> 
> clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x40e60150) = 129
> [pid   129] prlimit64(0, RLIMIT_NPROC, {rlim_cur=4, rlim_max=4}, NULL) = 0
> [pid   129] unshare(CLONE_NEWUSER)      = 0
> [pid   129] setresuid(65534, 65534, 65534) = 0
> [pid   129] execve("/bin/true", ["/bin/true"], 0x552ad950a0 /* 7 vars */) = -1 EAGAIN (Resource temporarily unavailable)
> 
> On the parent commit of 59ec715 the service starts successfully.
> 
> This is still reproducible on current master (83e3966).
> 
> Relevant patch discussion: https://lore.kernel.org/lkml/87lf0g9xq7.fsf@email.froward.int.ebiederm.org/T/#m0a39edf27bc5aabca58b2c2a3d81704818d2c6fe
> 
> This more recent thread also seems highly relevant: https://lore.kernel.org/lkml/20220207121800.5079-1-mkoutny@suse.com/

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
