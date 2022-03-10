Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A717A
	for <regressions@lists.linux.dev>; Thu, 10 Mar 2022 10:18:08 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nSFrw-00089Z-Tq; Thu, 10 Mar 2022 11:18:05 +0100
Message-ID: <7db33823-61f5-5157-18de-d4ee13eb8d72@leemhuis.info>
Date: Thu, 10 Mar 2022 11:18:03 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: rtl8723bs (SDIO) - Access point mode causes a kernel panic (fwd
 from bugzilla) #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <d58625ad-6f3e-a7d7-b5b4-d18eb16f4082@leemhuis.info>
 <505e1bdb-3fba-5e09-778a-dba681edfe6e@leemhuis.info>
In-Reply-To: <505e1bdb-3fba-5e09-778a-dba681edfe6e@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1646907488;bce884f5;
X-HE-SMSGID: 1nSFrw-00089Z-Tq

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

Just a quick update, as the wireless maintainers otherwise might think
it's their job to handle this

#regzbot title: staging: rtl8723bs (SDIO) - Access point mode causes a
kernel panic

On 04.03.22 07:28, Thorsten Leemhuis wrote:
> TWIMC: this mail is primarily send for documentation purposes and for
> regzbot, my Linux kernel regression tracking bot. These mails usually
> contain '#forregzbot' in the subject, to make them easy to spot and filter.
> 
> #regzbot fixed-by: 8f4347081be32e67b0873827e0138ab0fdaaf450
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=master&id=8f4347081be32e67b0873827e0138ab0fdaaf450
> 
> On 30.01.22 10:28, Thorsten Leemhuis wrote:
>>
>> Hi, this is your Linux kernel regression tracker speaking.
>>
>> There is a regression in bugzilla.kernel.org I'd like to add to the
>> tracking:
>>
>> #regzbot introduced: 54659ca026e586bbb33a7e60daa6443a3ac6b5df
>> #regzbot from: José Ángel Pastrana <japp.debian@gmail.com>
>> #regzbot title: net: wireless: rtl8723bs (SDIO) - Access point mode
>> causes a kernel panic
>> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215542
>>
>> Quote:
>>
>>> Created attachment 300343 [details]
>>> kernel panic
>>>
>>> When I use r8723bs (sdio) as access point and a client begins a intensive download or speed test, a kernel panic ocurrs (see attachment). I can reproduce this bug consistently.
>>>
>>> Also, I have bisected the kernel source code and happens for first time with the following commit:
>>>
>>> commit 54659ca026e586bbb33a7e60daa6443a3ac6b5df
>>> Author: Fabio Aiuto <fabioaiuto83@gmail.com>
>>> Date:   Mon Sep 20 16:55:00 2021 +0200
>>>
>>>     staging: rtl8723bs: remove possible deadlock when disconnect (v2)
>>
>>
>> Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat)
>>
>> P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
>> on my table. I can only look briefly into most of them. Unfortunately
>> therefore I sometimes will get things wrong or miss something important.
>> I hope that's not the case here; if you think it is, don't hesitate to
>> tell me about it in a public reply, that's in everyone's interest.
>>
>> BTW, I have no personal interest in this issue, which is tracked using
>> regzbot, my Linux kernel regression tracking bot
>> (https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
>> this mail to get things rolling again and hence don't need to be CC on
>> all further activities wrt to this regression.
>>
>> ---
>> Additional information about regzbot:
>>
>> If you want to know more about regzbot, check out its web-interface, the
>> getting start guide, and/or the references documentation:
>>
>> https://linux-regtracking.leemhuis.info/regzbot/
>> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
>> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md
>>
>> The last two documents will explain how you can interact with regzbot
>> yourself if your want to.
>>
>> Hint for reporters: when reporting a regression it's in your interest to
>> tell #regzbot about it in the report, as that will ensure the regression
>> gets on the radar of regzbot and the regression tracker. That's in your
>> interest, as they will make sure the report won't fall through the
>> cracks unnoticed.
>>
>> Hint for developers: you normally don't need to care about regzbot once
>> it's involved. Fix the issue as you normally would, just remember to
>> include a 'Link:' tag to the report in the commit message, as explained
>> in Documentation/process/submitting-patches.rst
>> That aspect was recently was made more explicit in commit 1f57bd42b77c:
>> https://git.kernel.org/linus/1f57bd42b77c
