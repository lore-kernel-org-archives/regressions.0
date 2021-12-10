Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE31F29CA
	for <regressions@lists.linux.dev>; Fri, 10 Dec 2021 11:31:45 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mve7k-0007kh-OC; Fri, 10 Dec 2021 12:31:36 +0100
Message-ID: <977e3179-89a8-6abf-8a8f-7afe13c44dee@leemhuis.info>
Date: Fri, 10 Dec 2021 12:31:34 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Is it a regression? 5.15.5: No sound with speaker-test. 5.12.13:
 it works.
Content-Language: en-BZ
To: u34@net9.ga, Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <E1mrgJF-000RWu-7d@mx1.net9.ga> <s5hlf0wojv8.wl-tiwai@suse.de>
 <E1muw55-000WNp-Ui@mx1.net9.ga>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <E1muw55-000WNp-Ui@mx1.net9.ga>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1639135905;0fa3c891;
X-HE-SMSGID: 1mve7k-0007kh-OC


On 08.12.21 13:29, u34@net9.ga wrote:
> Takashi Iwai <tiwai@suse.de> wrote:
>> On Mon, 29 Nov 2021 14:03:05 +0100,
>> u34@net9.ga wrote:
>>>
>>> The following looks to me a regression in the linux sound driver.
>>> alsa-info.sh output is included at the bottom of this message. There are 2 
>>> outputs. An output with a 5.12.13 kernel. The other output is with a 
>>> 5.15.5. They were obtained with the same PC. With 5.12.13, the 
>>> speaker-test program works as expected. There is no sound when the 
>>> speaker-test program is ran with 5.15.5.
>>> 5.15.5 has 
>>>     options snd-hda-intel id=PCH index=0
>>>     options snd-hda-intel id=HDMI index=1
>>> , which 5.12.13 does not have.
>>
>> Both those lines conflict with each other, so they make no sense and
>> are already incorrect.
>>
>> If you want to swap the card indices inevitably needed, just pass a
>> single option line below instead.
>>
>>   options snd-hda-intel index=1,0
> 
> I have modified my setting as you suggested.
> 
> speaker-test is now producing sound with both 5.12.13, and 5.15.5. Which is 
> actualy 5.15.6, not 5.15.5, by now. It got upgraded a few days ago. I don't 
> know what is the exact change that made it working. I have done several 
> other chnages in the last couple of days.
> [...]

Sounds to me like "there might still be a small problem lurking there,
but things are working now for the reporter and maybe the problem was
caused by something else anyway", so I guess I'll remove in from the
regression tracking.

#regzbot invalid: things are working again, what exactly helped remains
unkown
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat).

P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
on my table. I can only look briefly into most of them. Unfortunately
therefore I sometimes will get things wrong or miss something important.
I hope that's not the case here; if you think it is, don't hesitate to
tell me about it in a public reply. That's in everyone's interest, as
what I wrote above might be misleading to everyone reading this; any
suggestion I gave thus might sent someone reading this down the wrong
rabbit hole, which none of us wants.

BTW, I have no personal interest in this issue, which is tracked using
regzbot, my Linux kernel regression tracking bot
(https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
this mail to get things rolling again and hence don't need to be CC on
all further activities wrt to this regression.
