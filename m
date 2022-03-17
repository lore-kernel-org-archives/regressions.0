Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125E52F36
	for <regressions@lists.linux.dev>; Thu, 17 Mar 2022 13:10:41 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nUptn-0007ks-Dh; Thu, 17 Mar 2022 14:10:39 +0100
Message-ID: <ec4406bb-454d-2d81-55a4-a74be968270f@leemhuis.info>
Date: Thu, 17 Mar 2022 14:10:38 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Raid6 check performance regression 5.15 -> 5.16 #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <0eb91a43-a153-6e29-14b6-65f97b9f3d99@nuclearwinter.com>
 <2f516c43-b357-70d2-9c49-9633e8a4aa76@leemhuis.info>
In-Reply-To: <2f516c43-b357-70d2-9c49-9633e8a4aa76@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1647522642;8a8bbaf8;
X-HE-SMSGID: 1nUptn-0007ks-Dh

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

#regzbot fixed-by: 26fed4ac4eab09c27

On 08.03.22 06:44, Thorsten Leemhuis wrote:
> [TLDR: I'm adding the regression report below to regzbot, the Linux
> kernel regression tracking bot; all text you find below is compiled from
> a few templates paragraphs you might have encountered already already
> from similar mails.]
> 
> On 07.03.22 19:15, Larkin Lowrey wrote:
>> I am seeing a 'check' speed regression between kernels 5.15 and 5.16.
>> One host with a 20 drive array went from 170MB/s to 11MB/s. Another host
>> with a 15 drive array went from 180MB/s to 43MB/s. In both cases the
>> arrays are almost completely idle. I can flip between the two kernels
>> with no other changes and observe the performance changes.
>>
>> Is this a known issue?
> 
> Hi, this is your Linux kernel regression tracker.
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
> #regzbot ^introduced v5.15..v5.16
> #regzbot title md: Raid6 check performance regression
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
