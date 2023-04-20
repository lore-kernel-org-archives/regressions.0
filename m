Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9055661
	for <regressions@lists.linux.dev>; Thu, 20 Apr 2023 11:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681989477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3fj2r/TkPzDnAeDyrgLHgNMn11ACqVGaGMoYDpYSS5c=;
	b=iHnvAvRxfw/KSZcTwtBeVYCKelwdemIKL8VNCeJy9NuXA1JRFxHPMeDxrtIPp0Urdy4aFs
	bvtQ16Wl79rm244qrIe3KqJo3DIbZ99sLZyHxCcYgHskYV5NICpJTVMVPpC4llaFpMUlT6
	Fy2Vcfc5DAmjhV1UL9TjhaOPxyS3Shg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-_YTDvlPkPZu-bpFAkDdoFQ-1; Thu, 20 Apr 2023 07:17:56 -0400
X-MC-Unique: _YTDvlPkPZu-bpFAkDdoFQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-505149e1a4eso2318835a12.1
        for <regressions@lists.linux.dev>; Thu, 20 Apr 2023 04:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681989475; x=1684581475;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3fj2r/TkPzDnAeDyrgLHgNMn11ACqVGaGMoYDpYSS5c=;
        b=E33MJffd/veCXwCwMPgRV/LjUnfJtAlSNUnVAVQKQHraX3VsBlWIsKYXdGBqx8lA9e
         YDZSda5lLAcs/ZOXKKJfjB2XRJONwNmlYJpcmgLn/ZHigtDaR9ur/ncxuYivmEHgvSxH
         6Jjwn/Q/uDJD7vihAlZOcglHUxQ0GMmxCm3UKUUbTvNs5bVGR5IQvlpiZqn/NVo+YWD2
         oqZo1Pv7kEfp1gBDpEHCmGjAdCUjnkKWt1GRspSkqCse+Ce4aPRim1wC4+m/Ji6eBFb6
         5wn479NUK7PZE81v2v38mPn3RouLb+bBV4K0CczP7/ZIBTbA5+1y/QofddxPTN8dI9pU
         hPtg==
X-Gm-Message-State: AAQBX9d+sz/S66FAwcyU2gl0pJTXIzRfQmFmPA+Z40fdKGcp41dPyDHf
	EftVYQ6GY19uHrQSNJKTOamUpf8GkUxcrCeuN/lVBkYWT8g6wGV1IWH5tUcQMqhn11w1JW6q5Qo
	jlxkzyCDYYKrTcYuqFocYjYc=
X-Received: by 2002:a05:6402:42c8:b0:506:72f8:eb10 with SMTP id i8-20020a05640242c800b0050672f8eb10mr6246916edc.0.1681989475193;
        Thu, 20 Apr 2023 04:17:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350b3jAqGnAwsth15pGrMGa2D7VuFf1zlUKjfUMNzTwQ2UxXTdq3HGlP1D/tE1wL/TwlBWXjRww==
X-Received: by 2002:a05:6402:42c8:b0:506:72f8:eb10 with SMTP id i8-20020a05640242c800b0050672f8eb10mr6246896edc.0.1681989474837;
        Thu, 20 Apr 2023 04:17:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d12-20020a50fb0c000000b004bf999f8e57sm645809edq.19.2023.04.20.04.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 04:17:54 -0700 (PDT)
Message-ID: <06b5119a-63f7-e62b-cc28-0009e17ad4ed@redhat.com>
Date: Thu, 20 Apr 2023 13:17:53 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [regression] Bug 216946 - Toshiba satellite click mini l9w-b:
 touchscreen: no touch events with kernel 6.1.4
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?Q?G=c3=a9_Koerkamp?= <ge.koerkamp@gmail.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Jiri Kosina <jikos@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <993dd537-2f74-3657-1dd3-c3a0a74e37e1@leemhuis.info>
 <E4123C4B-D6C0-4CB2-8328-E0D03599ED16@gmail.com>
 <07f2417e-9d47-3e73-cae5-3e7c95856f72@redhat.com>
In-Reply-To: <07f2417e-9d47-3e73-cae5-3e7c95856f72@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 4/19/23 18:40, Hans de Goede wrote:
> Hi Gé,
> 
> On 4/19/23 18:21, Gé Koerkamp wrote:
>> Hi Thorsten,
>>
>> travelling at the moment, but I’ll try. Not really into bisecting kernel issues, but let’s see where this goes. Another issue is, that I don’t have a Toshiba Mini Click myself, so I need to build the test Volumio images (volumio.org) with the different 5.16-rc kernel patch versions for a colleague to work with, hopefully  he has time to do this.
> 
> I have just dug my own Toshiba Mini Click up from the bottom of the storage box it was in.
> 
> It is currently charging since the battery was fully flat.
> 
> So I suggest you give me a couple of days to take a look before you go to all this trouble.

I have posted a patch fixing this upstream now:

https://lore.kernel.org/linux-acpi/20230420110220.23168-1-hdegoede@redhat.com/T/#u

Regards,

Hans


>>> On 17 Apr 2023, at 13:55, Linux regression tracking (Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
>>>
>>> ﻿
>>>
>>>> On 01.03.23 12:41, Hans de Goede wrote:
>>>>> On 2/28/23 14:26, Benjamin Tissoires wrote:
>>>>> On Tue, Feb 28, 2023 at 12:32 PM Thorsten Leemhuis
>>>>> <regressions@leemhuis.info> wrote:
>>>>>>
>>>>>> On 19.01.23 16:06, Linux kernel regression tracking (Thorsten Leemhuis)
>>>>>> wrote:
>>>>>>> Hi, this is your Linux kernel regression tracker.
>>>>>>>
>>>>>>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>>>>>>> kernel developer don't keep an eye on it, I decided to forward it by
>>>>>>> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216946 :
>>>>>>
>>>>>> The reporter recently confirmed in the ticket that the issue still
>>>>>> happens with 6.2.
>>>>>>
>>>>>> There wasn't any reply from any of the input developers here or in
>>>>>> bugzilla afaics. :-/ Hmmm. Could someone from that camp maybe please
>>>>>> take a minute and at least briefly look into this as answer something
>>>>>> like "that might be due to a problem in subsystem 'foo'", "maybe ask bar
>>>>>> for an option", or "we have no idea what might cause this, this needs to
>>>>>> be bisected"? That would help a lot.
>>>>>
>>>>> The working dmesg shows a line with:
>>>>> hid-generic 0018:0457:10FB.0002: input,hidraw1: I2C HID v1.00 Device
>>>>> [SIS0817:00 0457:10FB] on i2c-SIS0817:00
>>>>> and then
>>>>> hid-multitouch 0018:0457:10FB.0002: input,hidraw1: I2C HID v1.00
>>>>> Device [SIS0817:00 0457:10FB] on i2c-SIS0817:00
>>>>>
>>>>> But these 2 lines do not appear on the 6.1.4 logs.
>>>>>
>>>>> So the device is not properly enumerated by ACPI or I2C. Hans might
>>>>> have an idea on how to debug/solve that issue.
>>>>
>>>> I actually have a Toshiba satellite click mini l9w-b lying around
>>>> myself. I already made a note to try and reproduce this
>>>>
>>>> But I'm very much swamped with too much kernel work, so no promises
>>>> when I will get around to this ...
>>>
>>> Has anyone made any progress with this? Doesn't look like it, hence I
>>> wondered if this fall through the cracks; but maybe I'm just missing
>>> something.
>>>
>>> Gé Koerkamp: with a bit of luck Hans sooner or later will have time to
>>> look into this, but it might speed things up if you could try to bisect
>>> this.
>>>
>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>> --
>>> Everything you wanna know about Linux kernel regression tracking:
>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>> If I did something stupid, please tell me, as explained on that page.
>>>
>>> #regzbot poke
>>>
>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>>>> --
>>>>>> Everything you wanna know about Linux kernel regression tracking:
>>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>>>>> If I did something stupid, please tell me, as explained on that page.
>>>>>>
>>>>>> #regzbot poke
>>>>>>>> Gé Koerkamp 2023-01-17 20:21:51 UTC
>>>>>>>>
>>>>>>>> Created attachment 303619 [details]
>>>>>>>> Kernel configuration for v6.1.4/ journalctl (dmesg)/ ACPIdump/lsmod
>>>>>>>>
>>>>>>>> Overview:
>>>>>>>> The touchscreen does not react on touch events.
>>>>>>>> Touchscreen display and touchpad are working.
>>>>>>>>
>>>>>>>> Step to reproduce:
>>>>>>>> Open any UI page
>>>>>>>> Try to use touch on relevant UI controls (buttons etc.)
>>>>>>>>
>>>>>>>> Result:
>>>>>>>> No reaction on screen touches
>>>>>>>>
>>>>>>>> Expected result:
>>>>>>>> Reaction on touched control, same as when using the touch pad or connected mouse (which do work).
>>>>>>>>
>>>>>>>> Build information:
>>>>>>>> The error happens with kernel version 6.1.4
>>>>>>>> After rebuilding with different kernel versions, it appears that it first fails with kernel 5.16
>>>>>>>>
>>>>>>>> Additional builds:
>>>>>>>> The click mini l9w-b still works with kernel 5.10.y LTS and 5.15.y LTS.
>>>>>>>>
>>>>>>>> Important remark:
>>>>>>>> Touchscreen still works fine with kernel 6.1.4 using
>>>>>>>> - an HP x2 detachable 10-p0xx or
>>>>>>>> - a Lenovo yoga 520-14ikb
>>>>>>>>
>>>>>>>> So it could be a hardware dependent issue
>>>>>>>
>>>>>>> See the ticket for more details.
>>>>>>>
>>>>>>>
>>>>>>> [TLDR for the rest of this mail: I'm adding this report to the list of
>>>>>>> tracked Linux kernel regressions; the text you find below is based on a
>>>>>>> few templates paragraphs you might have encountered already in similar
>>>>>>> form.]
>>>>>>>
>>>>>>> BTW, let me use this mail to also add the report to the list of tracked
>>>>>>> regressions to ensure it's doesn't fall through the cracks:
>>>>>>>
>>>>>>> #regzbot introduced: v5.15..v5.16
>>>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=216946
>>>>>>> #regzbot title: hid: touchscreen broken with Toshiba satellite click
>>>>>>> mini l9w-b
>>>>>>> #regzbot ignore-activity
>>>>>>>
>>>>>>> This isn't a regression? This issue or a fix for it are already
>>>>>>> discussed somewhere else? It was fixed already? You want to clarify when
>>>>>>> the regression started to happen? Or point out I got the title or
>>>>>>> something else totally wrong? Then just reply and tell me -- ideally
>>>>>>> while also telling regzbot about it, as explained by the page listed in
>>>>>>> the footer of this mail.
>>>>>>>
>>>>>>> Developers: When fixing the issue, remember to add 'Link:' tags pointing
>>>>>>> to the report (e.g. the buzgzilla ticket and maybe this mail as well, if
>>>>>>> this thread sees some discussion). See page linked in footer for details.
>>>>>>>
>>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>>>>> --
>>>>>>> Everything you wanna know about Linux kernel regression tracking:
>>>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>>>>>> If I did something stupid, please tell me, as explained on that page.
>>>>>>
>>>>>
>>>>
>>>>
>>>>
>>
> 

