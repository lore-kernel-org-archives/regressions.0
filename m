Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441BD2C82
	for <regressions@lists.linux.dev>; Wed, 26 Jan 2022 11:23:41 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nCgOp-0002DI-4J; Wed, 26 Jan 2022 12:23:39 +0100
Message-ID: <8fdd5bf8-afe8-d493-e617-a47f7b8e2e0e@leemhuis.info>
Date: Wed, 26 Jan 2022 12:23:38 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: pci: UI becomes unresponsive every couple of seconds (fwd from
 bugzilla)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1643196221;3f703af5;
X-HE-SMSGID: 1nCgOp-0002DI-4J

Hi, this is your Linux kernel regression tracker speaking.

There is a regression in bugzilla.kernel.org I'd like to add to the
tracking:

#regzbot introduced: 0e8ae5a6ff5952253cd7cc0260df838ab4c21009
#regzbot from: joey.corleone@mail.ru
#regzbot title: pci: UI becomes unresponsive every couple of seconds
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215533

Quote:

> I accidentally sent the report prematurely. So here come my findings:
> 
> Since 5.16
> (1) my system becomes unresponsive every couple of seconds (micro lags), which makes it more or less unusable.
> (2) wrong(?) CPU frequencies are reported. 
> 
> - 5.15 works fine.
> - Starting from some commit in 5.17, it seems (1) is fixed (unsure), but definitely not (2).
> 
> I have bisected the kernel between 5.15 and 5.16, and found that the offending commit is 0e8ae5a6ff5952253cd7cc0260df838ab4c21009 ("PCI/portdrv: Do not setup up IRQs if there are no users"). Bisection log attached.
> 
> Reverting this commit on linux-git[1] fixes both (1) and (2).
> 
> Important notes:
> - This regression was reported on a DELL XPS 9550 laptop by two users [2], so it might be related strictly to that model. 
> - According to user mallocman, the issue can also be fixed by reverting the BIOS version of the laptop to v1.12.
> - The issue ONLY occurs when AC is plugged in (and stays there even when I unplug it).
> - When booting on battery power, there is no issue at all.
> 
> You can easily observe the regression via: 
> 
> watch cat /sys/devices/system/cpu/cpu[0-9]*/cpufreq/scaling_cur_fre
> 
> As soon as I plug in AC, all frequencies go up to values around 3248338 and stay there even if I unplug AC. This does not happen at all when booted on battery power. 
> 
> Also note: 
> - the laptop's fans are not really affected by the high frequencies.
> - setting the governor to "powersave" has no effect on the frequencies (as compared to when on battery power).
> - lowering the maximum frequency manually works, but does not fix (1).
> 
> [1] https://aur.archlinux.org/pkgbase/linux-git/ (pulled commits up to 0280e3c58f92b2fe0e8fbbdf8d386449168de4a8).
> [2] https://bbs.archlinux.org/viewtopic.php?id=273330

Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat)

P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
on my table. I can only look briefly into most of them. Unfortunately
therefore I sometimes will get things wrong or miss something important.
I hope that's not the case here; if you think it is, don't hesitate to
tell me about it in a public reply, that's in everyone's interest.

BTW, I have no personal interest in this issue, which is tracked using
regzbot, my Linux kernel regression tracking bot
(https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
this mail to get things rolling again and hence don't need to be CC on
all further activities wrt to this regression.

---
Additional information about regzbot:

If you want to know more about regzbot, check out its web-interface, the
getting start guide, and/or the references documentation:

https://linux-regtracking.leemhuis.info/regzbot/
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

The last two documents will explain how you can interact with regzbot
yourself if your want to.

Hint for reporters: when reporting a regression it's in your interest to
tell #regzbot about it in the report, as that will ensure the regression
gets on the radar of regzbot and the regression tracker. That's in your
interest, as they will make sure the report won't fall through the
cracks unnoticed.

Hint for developers: you normally don't need to care about regzbot once
it's involved. Fix the issue as you normally would, just remember to
include a 'Link:' tag to the report in the commit message, as explained
in Documentation/process/submitting-patches.rst
That aspect was recently was made more explicit in commit 1f57bd42b77c:
https://git.kernel.org/linus/1f57bd42b77c
