Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF882F38
	for <regressions@lists.linux.dev>; Mon, 30 May 2022 13:43:59 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nvfgb-0001wn-47; Mon, 30 May 2022 15:43:57 +0200
Message-ID: <f8de19a5-204c-c9e4-c30b-32a8e920abb6@leemhuis.info>
Date: Mon, 30 May 2022 15:43:56 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] gpio: Revert regression in sysfs-gpio (gpiolib.c)
 #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20211217153555.9413-1-marcelo.jimenez@gmail.com>
 <a7fbb773-eb85-ccc7-8bfb-0bfab062ffe1@leemhuis.info>
In-Reply-To: <a7fbb773-eb85-ccc7-8bfb-0bfab062ffe1@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1653918239;281c2ae6;
X-HE-SMSGID: 1nvfgb-0001wn-47

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

#regzbot invalid: tricky situation that likely can't be really solved by
causing other regressions, so leave things as they are

For details see:
https://lore.kernel.org/stable/CACjc_5oRRHdCjbSEeMMY2DeJRyFDcbQ2Vk7vaFC9h%2Bkas8zC9g@mail.gmail.com/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

On 18.12.21 07:28, Thorsten Leemhuis wrote:
> [TLDR: I'm adding this regression to regzbot, the Linux kernel
> regression tracking bot; most text you find below is compiled from a few
> templates paragraphs some of you might have seen already.]
> 
> On 17.12.21 16:35, Marcelo Roberto Jimenez wrote:
>> Some GPIO lines have stopped working after the patch
>> commit 2ab73c6d8323f ("gpio: Support GPIO controllers without pin-ranges")
>>
>> And this has supposedly been fixed in the following patches
>> commit 89ad556b7f96a ("gpio: Avoid using pin ranges with !PINCTRL")
>> commit 6dbbf84603961 ("gpiolib: Don't free if pin ranges are not defined")
> 
> There seems to be a backstory here. Are there any entries and bug
> trackers or earlier discussions everyone that looks into this should be
> aware of?
> 
>> But an erratic behavior where some GPIO lines work while others do not work
>> has been introduced.
>>
>> This patch reverts those changes so that the sysfs-gpio interface works
>> properly again.
>>
>> Signed-off-by: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
>> ---
>>
>> Hi,
>>
>> My system is ARM926EJ-S rev 5 (v5l) (AT91SAM9G25), the board is an ACME Systems Arietta.
>>
>> The system used sysfs-gpio to manage a few gpio lines, and I have noticed that some have stopped working.
>>
>> The test script is very simple:
>>
>> 	#! /bin/bash
>>
>> 	cd /sys/class/gpio/
>> 	echo 24 > export 
>>
>> 	cd pioA24
>> 	echo out > direction
>>
>> 	echo 0 > value
>> 	cat value
>> 	echo 1 > value
>> 	cat value
>> 	echo 0 > value
>> 	cat value
>> 	echo 1 > value
>> 	cat value
>>
>> 	cd ..
>> 	echo 24 > unexport
>>
>> In a "good" kernel, this script outputs 0, 1, 0, 1. In a bad kernel, the output result is 1, 1, 1, 1. Also it must be possible to run this script twice without errors, that was the issue with the gpiochip_generic_free() call that had been addressed in another patch.
>>
>> In my system PINCTRL is automatically selected by 
>> SOC_AT91SAM9 [=y] && ARCH_AT91 [=y] && ARCH_MULTI_V5 [=y]
>>
>> So it is not an option to disable it to make it work.
>>
>> Best regards,
>> Marcelo.
>>
>>
>>  drivers/gpio/gpiolib.c | 10 ----------
>>  1 file changed, 10 deletions(-)
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index af5bb8fedfea..ac69ec8fb37a 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -1804,11 +1804,6 @@ static inline void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gc)
>>   */
>>  int gpiochip_generic_request(struct gpio_chip *gc, unsigned offset)
>>  {
>> -#ifdef CONFIG_PINCTRL
>> -	if (list_empty(&gc->gpiodev->pin_ranges))
>> -		return 0;
>> -#endif
>> -
>>  	return pinctrl_gpio_request(gc->gpiodev->base + offset);
>>  }
>>  EXPORT_SYMBOL_GPL(gpiochip_generic_request);
>> @@ -1820,11 +1815,6 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_request);
>>   */
>>  void gpiochip_generic_free(struct gpio_chip *gc, unsigned offset)
>>  {
>> -#ifdef CONFIG_PINCTRL
>> -	if (list_empty(&gc->gpiodev->pin_ranges))
>> -		return;
>> -#endif
>> -
>>  	pinctrl_gpio_free(gc->gpiodev->base + offset);
>>  }
>>  EXPORT_SYMBOL_GPL(gpiochip_generic_free);
>>
> 
> Hi, this is your Linux kernel regression tracker speaking.
> 
> Thanks for the report.
> 
> To be sure this issue doesn't fall through the cracks unnoticed, I'm
> adding it to regzbot, my Linux kernel regression tracking bot:
> 
> #regzbot ^introduced 2ab73c6d8323f
> #regzbot title gpio: some GPIO lines have stopped working
> #regzbot ignore-activity
> 
> Reminder: when fixing the issue, please add a 'Link:' tag with the URL
> to the report (the parent of this mail), as explained in
> 'Documentation/process/submitting-patches.rst' (reminder: you should use
> the kernel.org redirector). Regzbot then will automatically mark the
> regression as resolved once the fix lands in the appropriate tree. For
> more details about regzbot see footer.
> 
> Sending this to everyone that got the initial report, to make all aware
> of the tracking. I also hope that messages like this motivate people to
> directly get at least the regression mailing list and ideally even
> regzbot involved when dealing with regressions, as messages like this
> wouldn't be needed then.
> 
> Don't worry, I'll send further messages wrt to this regression just to
> the lists (with a tag in the subject so people can filter them away), as
> long as they are intended just for regzbot. With a bit of luck no such
> messages will be needed anyway.
> 
> Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat).
> 
> P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
> on my table. I can only look briefly into most of them. Unfortunately
> therefore I sometimes will get things wrong or miss something important.
> I hope that's not the case here; if you think it is, don't hesitate to
> tell me about it in a public reply. That's in everyone's interest, as
> what I wrote above might be misleading to everyone reading this; any
> suggestion I gave thus might sent someone reading this down the wrong
> rabbit hole, which none of us wants.
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
