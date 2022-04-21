Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3DB1FA1
	for <regressions@lists.linux.dev>; Thu, 21 Apr 2022 08:56:07 +0000 (UTC)
Received: from [2a02:8108:963f:de38:6624:6d8d:f790:d5c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nhSbX-00034T-FY; Thu, 21 Apr 2022 10:55:59 +0200
Message-ID: <fbf11471-6d52-9b96-05e0-572bfa3a6ad2@leemhuis.info>
Date: Thu, 21 Apr 2022 10:55:59 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [regression]: xps13 9310 system freeze with kernel 5.17/5.18-rc1
 #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
References: <f02808cda5adcf34db79f75cf57b44a2780cd644.camel@windeck-gymnasium.de>
 <a76467c3-77af-f1ea-37a0-5e96256a495c@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
In-Reply-To: <a76467c3-77af-f1ea-37a0-5e96256a495c@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1650531367;46bee070;
X-HE-SMSGID: 1nhSbX-00034T-FY

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

For the record:

#regzbot dup-of:
https://lore.kernel.org/regressions/cd89d263-43e4-5634-75b9-bf3340c9bb1e@leemhuis.info/
#regzbot fixed-by: 1f682dc9fb3790a

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.

On 09.04.22 13:08, Thorsten Leemhuis wrote:
> [TLDR: I'm adding the regression report below to regzbot, the Linux
> kernel regression tracking bot; all text you find below is compiled from
> a few templates paragraphs you might have encountered already already
> from similar mails.]
> 
> Hi, this is your Linux kernel regression tracker.
> 
> On 08.04.22 09:26, Dominik Förderer wrote:
>> After switching from kernel 5.16 to 5.17/%.18-rc1 my system (dell xps13 9310)
>> allways freezes short after boot with a cpu-soft lock.
>>
>> A git bisect shows, that the Problem is caused by commit 9dcf6808b253 ath11k:
>> add 11d scan offload support. Reverting this commit makes the problem going
>> away.
>>
>> There is also a bug report with further descriptions here: 
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=215777
> 
> Thanks for the report.
> 
> CCing the regression mailing list, as it should be in the loop for all
> regressions, as explained here:
> https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html
> 
> To be sure below issue doesn't fall through the cracks unnoticed, I'm
> adding it to regzbot, my Linux kernel regression tracking bot:
> 
> #regzbot ^introduced 9dcf6808b253
> #regzbot title net: wireless: ath11k: xps13 9310 freezes
> #regzbot ignore-activity
> 
> If it turns out this isn't a regression, free free to remove it from the
> tracking by sending a reply to this thread containing a paragraph like
> "#regzbot invalid: reason why this is invalid" (without the quotes).
> 
> Reminder for developers: when fixing the issue, please add a 'Link:'
> tags pointing to the report (the mail quoted above) using
> lore.kernel.org/r/, as explained in
> 'Documentation/process/submitting-patches.rst' and
> 'Documentation/process/5.Posting.rst'. Regzbot needs them to
> automatically connect reports with fixes, but they are useful in
> general, too.
> 
> I'm sending this to everyone that got the initial report, to make
> everyone aware of the tracking. I also hope that messages like this
> motivate people to directly get at least the regression mailing list and
> ideally even regzbot involved when dealing with regressions, as messages
> like this wouldn't be needed then. And don't worry, if I need to send
> other mails regarding this regression only relevant for regzbot I'll
> send them to the regressions lists only (with a tag in the subject so
> people can filter them away). With a bit of luck no such messages will
> be needed anyway.
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
> reports on my table. I can only look briefly into most of them and lack
> knowledge about most of the areas they concern. I thus unfortunately
> will sometimes get things wrong or miss something important. I hope
> that's not the case here; if you think it is, don't hesitate to tell me
> in a public reply, it's in everyone's interest to set the public record
> straight.
> 
