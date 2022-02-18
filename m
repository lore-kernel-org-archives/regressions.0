Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F4048CE
	for <regressions@lists.linux.dev>; Fri, 18 Feb 2022 11:40:28 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nL1ch-0005yN-0c; Fri, 18 Feb 2022 12:40:27 +0100
Message-ID: <b0f689b0-38cb-9080-bf90-27e8d661b07c@leemhuis.info>
Date: Fri, 18 Feb 2022 12:40:26 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Bug 215561 - snd-usb-audio:reset_resume error -22 after suspend
 (fwd from bugzilla) #forregzbot
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <a8100c3d-007e-3207-7dc1-92849f638d71@leemhuis.info>
In-Reply-To: <a8100c3d-007e-3207-7dc1-92849f638d71@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1645184428;3cf4aa12;
X-HE-SMSGID: 1nL1ch-0005yN-0c

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

This was one of those issues that looked kinda forgotten in bugzilla,
but seem thx to a poke of yours truly things got rolling.

#regzbot introduced: b96681bd5827
#regzbot fixed-by: 9a5adeb28b77416446658e7

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=9a5adeb28b77416446658e75bdef3bbe5fb92a83

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.



On 03.02.22 15:59, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> There is a regression in bugzilla.kernel.org I'd like to add to the
> tracking:
> 
> #regzbot introduced: v5.15..v5.16
> #regzbot from: antifermion@protonmail.com <antifermion@protonmail.com>
> #regzbot title: snd: usb: snd-usb-audio:reset_resume error -22 after suspen
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215561
> 
> Quote:
> 
>> If I use the microphone, then suspend and wake up again, I get the error
>>
>> ```
>> snd-usb-audio 1-5:1.0: reset_resume error -22
>> ```
>>
>> Aftewards, audio stops working completely. Both pipewire and pulseaudio (tried both; not at the same time) freeze.
>>
>> After running
>>
>> ```
>> rmmod -f snd_usb_audio
>> ```
>>
>> and replugging the microphone, audio works again.
>> Here is the relevant log:
>>
>> ```
>> [  157.791937] usbcore: deregistering interface driver snd-usb-audio
>> [  228.517855] usb 1-5: USB disconnect, device number 2
>> [  236.464334] usb 1-5: new high-speed USB device number 3 using xhci_hcd
>> [  236.798863] usb 1-5: New USB device found, idVendor=0d8c, idProduct=0171, bcdDevice= 1.04
>> [  236.798867] usb 1-5: New USB device strings: Mfr=3, Product=1, SerialNumber=0
>> [  236.798869] usb 1-5: Product: USB 2.0 HD Audio
>> [  236.798871] usb 1-5: Manufacturer: C-Media Electronics Inc.
>> [  236.826966] input: C-Media Electronics Inc. USB 2.0 HD Audio Consumer Control as /devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb1/1-5/1-5:1.3/0003:0D8C:0171.000B/input/input40
>> [  236.878380] input: C-Media Electronics Inc. USB 2.0 HD Audio as /devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb1/1-5/1-5:1.3/0003:0D8C:0171.000B/input/input41
>> [  236.878447] hid-generic 0003:0D8C:0171.000B: input,hiddev96,hidraw2: USB HID v1.11 Device [C-Media Electronics Inc. USB 2.0 HD Audio] on usb-0000:02:00.0-5/input3
>> [  242.306593] usbcore: registered new interface driver snd-usb-audio
>>
>> ```
>>
>> I'm running Arch Linux (5.16.4.arch1-1). The linux-lts kernel (5.15.18-1) works fine.
>>
>> Other uses report the same error: https://bbs.archlinux.org/viewtopic.php?id=273469
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
