Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114402C80
	for <regressions@lists.linux.dev>; Sat, 27 Nov 2021 11:28:11 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mqvsB-0003V5-VE; Sat, 27 Nov 2021 12:28:04 +0100
Message-ID: <8efdd311-84c0-6fac-c43d-b981ccc8ec9d@leemhuis.info>
Date: Sat, 27 Nov 2021 12:28:03 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Compex WLE200NX: regdomain sanitized regression
Content-Language: en-BS
To: ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>,
 wgong@codeaurora.org
References: <1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Sebastian Bachmann <hello@reox.at>
In-Reply-To: <1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1638012492;0f7937d8;
X-HE-SMSGID: 1mqvsB-0003V5-VE

Hi, this is your Linux kernel regression tracker speaking.

Thanks for the report. CCing regression mailing list, which should be in
the loop for all regressions, as explained here:
https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html

Also adding the ath10k maintainer and the author of the likely culprit
of this regressions to the recipients.

On 27.11.21 09:17, Sebastian Bachmann wrote:
> 
> I recently upgraded my Debian based AP from buster to bullseye, just to
> find out that hostapd does not work any more, because all 5GHz channels
> are marked as No-IR. This regression was already discussed on this ML
> here: https://www.mail-archive.com/ath10k@lists.infradead.org/msg12018.html
> and there is also an entry in Debian's bug tracker for the same issue:
> https://bugs.debian.org/959821

TWIMC: To be sure this issue doesn't fall through the cracks unnoticed
again, I'm adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced 2dc016599cfa9672a147528ca26d70c3654a5423
#regzbot title net: wireless: ath10k: 5GHz channels are marked as No-IR
#regzbot monitor
https://lore.kernel.org/ath10k/5971a327-d11a-35e6-8295-8dfb8ae3a434@yandex.ru/
#regzbot monitor
https://lore.kernel.org/linux-wireless/20200730124923.271429-1-alsi@bang-olufsen.dk/
#regzbot monitor
https://lore.kernel.org/ath10k/19e636c1-fdbe-7222-a055-d668e4617070@gmx.de/
#regzbot monitor
https://lore.kernel.org/ath10k/20201022172113.GA1367233@capeo.gueux.org/
#regzbot link: https://bugs.debian.org/959821
#regzbot link: https://bbs.archlinux.org/viewtopic.php?id=254535
#regzbot link:
https://lore.kernel.org/ath10k/CA+ASDXNNfG3-ra8C2ou457J=Vj5eE83VCXgGsFPQQOixTcu7YA@mail.gmail.com/
#regzbot ignore-activity

Reminder for developers: when fixing this, please include a 'Link:' tag
pointing to the report (the parent of this mail), as explained here:
Documentation/process/submitting-patches.rst

> I have a slightly different card (branded Compex WLE200NX):
> 04:00.0 Network controller: Qualcomm Atheros AR928X Wireless Network
> Adapter (PCI-Express) (rev 01)
>         Subsystem: Qualcomm Atheros AR928X Wireless Network Adapter
> (PCI-Express)
>         Kernel driver in use: ath9k
>         Kernel modules: ath9k
> 
> But as you can see, also the EEPROM gets sanitized:
> [   15.461755] ath9k 0000:04:00.0: enabling device (0000 -> 0002)
> [   15.911600] ath: EEPROM regdomain sanitized
> [   15.911612] ath: EEPROM regdomain: 0x64
> [   15.911615] ath: EEPROM indicates we should expect a direct regpair map
> [   15.911625] ath: Country alpha2 being used: 00
> [   15.911628] ath: Regpair used: 0x64
> 
> I read in the other thread, that this is a regression, but the actual
> commit causing it was never reverted.

:-/

> I tried to search for newer messages explaining the issue, however as
> far as I can tell, the thread ends in June 2020 with no solution available.
> 
> Therefore, I kindly want to ask if there is any workaround available to
> re-enable 5GHz channels in AP mode for my card? (expect sticking to a
> pre-5.6 kernel or manually patching and recompiling ath)

Ciao, Thorsten, your Linux kernel regression tracker.

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

P.P.S.: If you want to know more about regzbot, check out its
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
