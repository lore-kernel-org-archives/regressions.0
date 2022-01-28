Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D4A2C9D
	for <regressions@lists.linux.dev>; Fri, 28 Jan 2022 14:09:57 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nDRwp-0001xo-Su; Fri, 28 Jan 2022 15:09:55 +0100
Message-ID: <61e3ca12-54c5-25c7-bb91-bef40ea80232@leemhuis.info>
Date: Fri, 28 Jan 2022 15:09:55 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Potential regression after fsnotify_nameremove() rework in 5.3
 #forregzbot
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <YeI7duagtzCtKMbM@visor>
 <c99a1e4b-f1d6-4c49-1b96-c767f712c137@leemhuis.info>
In-Reply-To: <c99a1e4b-f1d6-4c49-1b96-c767f712c137@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1643378997;26a3dbc0;
X-HE-SMSGID: 1nDRwp-0001xo-Su

#regzbot monitor:
https://lore.kernel.org/all/20220120215305.282577-1-amir73il@gmail.com/

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 16.01.22 11:16, Thorsten Leemhuis wrote:
> [TLDR: I'm adding this regression to regzbot, the Linux kernel
> regression tracking bot; most text you find below is compiled from a few
> templates paragraphs some of you might have seen already.]
> 
> Hi, this is your Linux kernel regression tracker speaking.
> 
> Adding the regression mailing list to the list of recipients, as it
> should be in the loop for all regressions, as explained here:
> https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html
> 
> On 15.01.22 04:11, Ivan Delalande wrote:
>> Hi,
>>
>> Sorry to bring this up so late but we might have found a regression
>> introduced by your "Sort out fsnotify_nameremove() mess" patch series
>> merged in 5.3 (116b9731ad76..7377f5bec133), and that can still be
>> reproduced on v5.16.
>>
>> Some of our processes use inotify to watch for IN_DELETE events (for
>> files on tmpfs mostly), and relied on the fact that once such events are
>> received, the files they refer to have actually been unlinked and can't
>> be open/read. So if and once open() succeeds then it is a new version of
>> the file that has been recreated with new content.
>>
>> This was true and working reliably before 5.3, but changed after
>> 49246466a989 ("fsnotify: move fsnotify_nameremove() hook out of
>> d_delete()") specifically. There is now a time window where a process
>> receiving one of those IN_DELETE events may still be able to open the
>> file and read its old content before it's really unlinked from the FS.
>>
>> I'm not very familiar with the VFS and fsnotify internals, would you
>> consider this a regression, or was there never any intentional guarantee
>> for that behavior and it's best we work around this change in userspace?
> 
> Thanks for the report.
> 
> To be sure this issue doesn't fall through the cracks unnoticed, I'm
> adding it to regzbot, my Linux kernel regression tracking bot:
> 
> #regzbot ^introduced 116b9731ad76..7377f5bec133
> #regzbot title fsnotify: regression due to the fsnotify_nameremove()
> rework in 5.3
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
> 
