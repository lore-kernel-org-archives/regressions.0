Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DBE2F28
	for <regressions@lists.linux.dev>; Thu, 10 Feb 2022 09:50:56 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nI66C-0001DK-JB; Thu, 10 Feb 2022 10:50:48 +0100
Message-ID: <62338592-544d-0f90-ee1b-60a8330fa740@leemhuis.info>
Date: Thu, 10 Feb 2022 10:50:48 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] Fix regression due to "fs: move binfmt_misc sysctl to its
 own file" #forregzbot
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Domenico Andreoli <domenico.andreoli@linux.com>
References: <20220121221021.60533b009c357d660791476e@linux-foundation.org>
 <20220122061228.nmuo75sDn%akpm@linux-foundation.org> <YgEeQNdgBuHRyEWl@dumbo>
 <4be9dede-c1b8-8532-b576-f9c787157931@leemhuis.info>
In-Reply-To: <4be9dede-c1b8-8532-b576-f9c787157931@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1644486657;9f0f4c44;
X-HE-SMSGID: 1nI66C-0001DK-JB

For the record:

Sadly the fix for below regression didn't link to the report, as
explained by 'Documentation/process/submitting-patches.rst' and
'Documentation/process/5.Posting.rst'. So I have to tell regzbot about
the fix manually:

#regzbot fixed-by: b42bc9a3c5115c

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=master&id=b42bc9a3c5115c3102a4923776bbeed3b191f2db

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 08.02.22 07:46, Thorsten Leemhuis wrote:
> 
> [TLDR: I'm adding the regression report below to regzbot, the Linux
> kernel regression tracking bot; all text you find below is compiled from
> a few templates paragraphs you might have encountered already already
> from similar mails.]
> 
> Hi, this is your Linux kernel regression tracker speaking.
> 
> CCing the regression mailing list, as it should be in the loop for all
> regressions, as explained here:
> https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html
> 
> On 07.02.22 14:27, Domenico Andreoli wrote:
>> Commit 3ba442d5331f did not go unnoticed, binfmt-support stopped to
>> work on my Debian system since v5.17-rc2 (did not check with -rc1).
>>
>> The existance of /proc/sys/fs/binfmt_misc is a precondition for
>> attempting to mount the binfmt_misc fs, which in turn triggers the
>> autoload of the binfmt_misc module. Without it, no module is loaded
>> and no binfmt is available at boot.
>>
>> Building as built-in or manually loading the module and mounting the fs
>> works fine, it's therefore only a matter of interaction with user-space.
>>
>> I could try to improve the Debian systemd configuration but I can't
>> say anything about the other distributions.
>>
>> In the meanwhile this patch restores a working system right after boot.
>> [...]
> 
> To be sure this issue doesn't fall through the cracks unnoticed, I'm
> adding it to regzbot, my Linux kernel regression tracking bot:
> 
> #regzbot ^introduced 3ba442d5331f
> #regzbot title  binfmt-support stopped to work
> #regzbot ignore-activity
> 
> Reminder for developers: when fixing the issue, please add a 'Link:'
> tags pointing to the report (the mail quoted above) using
> lore.kernel.org/r/, as explained in
> 'Documentation/process/submitting-patches.rst' and
> 'Documentation/process/5.Posting.rst'. This allows the bot to connect
> the report with any patches posted or committed to fix the issue; this
> again allows the bot to show the current status of regressions and
> automatically resolve the issue when the fix hits the right tree.
> 
> I'm sending this to everyone that got the initial report, to make them
> aware of the tracking. I also hope that messages like this motivate
> people to directly get at least the regression mailing list and ideally
> even regzbot involved when dealing with regressions, as messages like
> this wouldn't be needed then.
> 
> Don't worry, I'll send further messages wrt to this regression just to
> the lists (with a tag in the subject so people can filter them away), if
> they are relevant just for regzbot. With a bit of luck no such messages
> will be needed anyway.
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
