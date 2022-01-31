Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAE12CA2
	for <regressions@lists.linux.dev>; Mon, 31 Jan 2022 06:44:21 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nEQQF-0006iK-RJ; Mon, 31 Jan 2022 07:44:19 +0100
Message-ID: <8b1d3d5b-5a56-2064-4d3b-c00f5e0d8e5b@leemhuis.info>
Date: Mon, 31 Jan 2022 07:44:19 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: High IRQ 16 CPU usage (fwd from bugzilla)
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1643611461;09073d50;
X-HE-SMSGID: 1nEQQF-0006iK-RJ

Hi, this is your Linux kernel regression tracker speaking.

There is a regression in bugzilla.kernel.org I'd like to add to the
tracking:

#regzbot introduced: 357cf0cdddceea974a7d32668a0df0d9f77055cb
#regzbot from: David Spencer <dspencer577@gmail.com>
#regzbot title: pci: High IRQ 16 CPU usage
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215546

Quote:

> 
> On 5.15 and 5.16 kernels, if my laptop is plugged in prior to booting or is plugged in at any time after booting I see high CPU usage (80-100% of a core) by IRQ 16, with a constant 15k+ IRQ events per second, whether the system is in use or not. Unplugging the laptop does not make the events stop. If I boot the system without it being plugged in the issue does not occur until I plug it in. Downgrading to 5.14 fixes the issue completely, with only 3 total IRQ 16 interrupts after the system as been running for > 20 minutes. I do not see IRQ16 interrupts increase by using the touch pad, keyboard, or touch screen. I believe I was able to bisect the introduction of the issue to commit 357cf0cdddceea974a7d32668a0df0d9f77055cb, but this was the first time I've done kernel bisects before, so I may be incorrect. I tested with 5.17 RC1 and the issue was still present.
> 
> I've attached dmesg output and the contents of lspci -vvvv, as well as included IRQ 16 info from /proc/interrupts. Please let me know if I can provide anything else.
> 
> /proc/interrupts:
>   16:          0          0    7513443          0          0          0          0          0  IR-IO-APIC   16-fasteoi   idma64.0, i801_smbus, i2c_designware.0

> I think I was incorrect when I said it was in kernel 5.15, when I was bisecting to find the issue the Makefile release information said 5.15-rc2 so I assumed it was in 5.15, but that looks like I was incorrect. I'll test on 5.15 and verify whether it is present there.

> I've confirmed that I do not see the issue on kernel 5.15, only on 5.16.

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
