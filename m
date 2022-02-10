Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5012F21;
	Thu, 10 Feb 2022 10:58:00 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nI79B-0002sd-T1; Thu, 10 Feb 2022 11:57:57 +0100
Message-ID: <9ee89248-523e-1b4f-8401-03e1f2e7a2a1@leemhuis.info>
Date: Thu, 10 Feb 2022 11:57:57 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: rtl8723bs (SDIO) - Access point mode causes a kernel panic (fwd
 from bugzilla)
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Larry Finger <Larry.Finger@lwfinger.net>, Hans de Goede
 <hdegoede@redhat.com>, Fabio Aiuto <fabioaiuto83@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <d58625ad-6f3e-a7d7-b5b4-d18eb16f4082@leemhuis.info>
Cc: linux-staging@lists.linux.dev
In-Reply-To: <d58625ad-6f3e-a7d7-b5b4-d18eb16f4082@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1644490680;3eb1f84e;
X-HE-SMSGID: 1nI79B-0002sd-T1

Hi, this is your Linux kernel regression tracker speaking

Seems below issue is one that got stranded in bugzilla, so I'm adding
everyone involved to the CC list of this mail now and hope this gets the
ball running.

If anyone wonders why I didn't do that when writing below mail, see:
https://lore.kernel.org/regressions/3ee8c6c9-52d1-9570-f3bf-490365c9f6fe@leemhuis.info/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.


On 30.01.22 10:28, Thorsten Leemhuis wrote:
> 
> Hi, this is your Linux kernel regression tracker speaking.
> 
> There is a regression in bugzilla.kernel.org I'd like to add to the
> tracking:
> 
> #regzbot introduced: 54659ca026e586bbb33a7e60daa6443a3ac6b5df
> #regzbot from: José Ángel Pastrana <japp.debian@gmail.com>
> #regzbot title: net: wireless: rtl8723bs (SDIO) - Access point mode
> causes a kernel panic
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215542
> 
> Quote:
> 
>> Created attachment 300343 [details]
>> kernel panic
>>
>> When I use r8723bs (sdio) as access point and a client begins a intensive download or speed test, a kernel panic ocurrs (see attachment). I can reproduce this bug consistently.
>>
>> Also, I have bisected the kernel source code and happens for first time with the following commit:
>>
>> commit 54659ca026e586bbb33a7e60daa6443a3ac6b5df
>> Author: Fabio Aiuto <fabioaiuto83@gmail.com>
>> Date:   Mon Sep 20 16:55:00 2021 +0200
>>
>>     staging: rtl8723bs: remove possible deadlock when disconnect (v2)
> 
> 
> Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat)
> 
> P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
> on my table. I can only look briefly into most of them. Unfortunately
> therefore I sometimes will get things wrong or miss something important.
> I hope that's not the case here; if you think it is, don't hesitate to
> tell me about it in a public reply, that's in everyone's interest.
> 
> BTW, I have no personal interest in this issue, which is tracked using
> regzbot, my Linux kernel regression tracking bot
> (https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
> this mail to get things rolling again and hence don't need to be CC on
> all further activities wrt to this regression.
> 
> ---
> Additional information about regzbot:
> 
> If you want to know more about regzbot, check out its web-interface, the
> getting start guide, and/or the references documentation:
> 
> https://linux-regtracking.leemhuis.info/regzbot/
> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md
> 
> The last two documents will explain how you can interact with regzbot
> yourself if your want to.
> 
> Hint for reporters: when reporting a regression it's in your interest to
> tell #regzbot about it in the report, as that will ensure the regression
> gets on the radar of regzbot and the regression tracker. That's in your
> interest, as they will make sure the report won't fall through the
> cracks unnoticed.
> 
> Hint for developers: you normally don't need to care about regzbot once
> it's involved. Fix the issue as you normally would, just remember to
> include a 'Link:' tag to the report in the commit message, as explained
> in Documentation/process/submitting-patches.rst
> That aspect was recently was made more explicit in commit 1f57bd42b77c:
> https://git.kernel.org/linus/1f57bd42b77c
