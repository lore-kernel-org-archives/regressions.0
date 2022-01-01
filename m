Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC34173
	for <regressions@lists.linux.dev>; Sat,  1 Jan 2022 13:20:34 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1n3eJD-0003qE-Os; Sat, 01 Jan 2022 14:20:31 +0100
Message-ID: <8672078e-c9bd-0c84-07a7-08034891b59f@leemhuis.info>
Date: Sat, 1 Jan 2022 14:20:31 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [regression] Touchpad is not working after suspend to RAM since
 kernel 5.14 (fwd from b.k.o bug 214667) #forregzbot
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <12b9a10a-626b-cafd-05d6-cf0a116aa39b@leemhuis.info>
In-Reply-To: <12b9a10a-626b-cafd-05d6-cf0a116aa39b@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1641043234;a2b90159;
X-HE-SMSGID: 1n3eJD-0003qE-Os

Hi, this is your Linux kernel regression tracker speaking.

Sorry, forgot something when adding this regression to regzbot:

#regzbot Link: https://bugzilla.kernel.org/show_bug.cgi?id=214667

Sorry for the noise.

Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat)

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 28.12.21 08:29, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> Forwarding a regression reported by Christian Casteyde (CCed) in
> bugzilla.kernel.org which apparently has fallen through the cracks.
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=214667
> 
> A few quotes from comments in the ticket:
> 
>> Since Kernel 5.14 (probably 5.14-rc5 indeed) the touchpad does not
>> work anymore after resume from suspend to RAM. Was working with 5.13
>> kernel.
>>
>> I've bisected the bug, first bad commit is: 
>> b3e29642548258c7cd2cb3326a776fff84cd6b69 is the first bad commit
>>
>> SC[33mcommit b3e29642548258c7cd2cb3326a776fff84cd6b69ESC[m Merge:
>> 8f4ef88 498d0dd Author: Jiri Kosina <jkosina@suse.cz> Date:   Wed Jun
>> 30 09:15:15 2021 +0200
>>
>> Merge branch 'for-5.14/multitouch' into for-linus
>>
>> - patch series that ensures that hid-multitouch driver disables touch
>> and button-press reporting on hid-mt devices during suspend when the
>> device is not configured as a wakeup-source, from Hans de Goede
>>
>> Seem to be related with the observed behaviour.
> 
> Yes, that's a merge, but it contains code changes, maybe something went
> wrong there.
> 
>> Update with kernel 5.15-rc7
>>
>> Still present. However, I noticed dmesg ouput interesting messages
>> telling there is a transfer from the ELAN touchpad while suspended,
>> it failed to suspend, then failed to resume. The interesting thing is
>> if I try to suspend a second time, at resume the touchpad manages to
>> resume. Appending dmesg output for reference.
> 
> 
>> The problem is still present in 5.16-rc7, but indeed it got worse
>> (and indeed is now critical). a) After the first "suspend" tentative
>> (closing the lid), the laptop doesn't suspend (only the screen is
>> blanked) b) When I reopen the lid, the touchpad stays disabled c)
>> When I try to suspend a second time (closing the lid), the system
>> totally freeze (without any info in dmesg) and I need to reset it
>> totally. I'll open a separate bug report for this one, when bisected,
>> and will try to post it to the suspend maintainer together with the
>> mailing list (I'm not accustomed to mailing lists).
> 
> FWIW, Christian did this here:
> https://lore.kernel.org/all/256689953.114854578.1640622738334.JavaMail.root@zimbra40-e7.priv.proxad.net/
> 
>> FYI, if I remember well, reverting this single commit fixed the issue
>> and the diff was making sense (try to disable the touchpad before
>> going to sleep to prevent unexpected event from it while
>> suspending... if I understood well the code).
> 
> To be sure this issue doesn't again fall through the cracks unnoticed,
> I'm adding it to regzbot, my Linux kernel regression tracking bot:
> 
> #regzbot introduced b3e29642548258c7cd2cb3326a776fff84cd6b69ESC
> #regzbot title hid: touchpad is not working after suspend to RAM
> #regzbot from: Christian Casteyde <casteyde.christian@free.fr>
> #regzbot ignore-activity
> 
> Reminder: when fixing the issue, please add a 'Link:' tag with the URL
> to the report (the parent of this mail) using the kernel.org redirector,
> as explained in 'Documentation/process/submitting-patches.rst'. Regzbot
> then will automatically mark the regression as resolved once the fix
> lands in the appropriate tree. For more details about regzbot see footer.
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
> 
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
