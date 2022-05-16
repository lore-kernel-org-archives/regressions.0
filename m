Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8256A52
	for <regressions@lists.linux.dev>; Mon, 16 May 2022 12:51:34 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nqaCC-00014f-Qn; Mon, 16 May 2022 14:51:32 +0200
Message-ID: <4bbafeff-5640-40f9-f0e6-43c9d4fb83a3@leemhuis.info>
Date: Mon, 16 May 2022 14:51:32 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Regression in workingset_refault latency on 5.15 #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CA+wXwBSyO87ZX5PVwdHm-=dBjZYECGmfnydUicUyrQqndgX2MQ@mail.gmail.com>
 <fd550b0f-5733-48b7-756f-5fb2af3ab172@leemhuis.info>
 <8137bfa9-dc0a-8aaa-f280-6d611ad8d490@leemhuis.info>
In-Reply-To: <8137bfa9-dc0a-8aaa-f280-6d611ad8d490@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1652705494;2a99ea08;
X-HE-SMSGID: 1nqaCC-00014f-Qn



On 11.04.22 12:17, Thorsten Leemhuis wrote:
> TWIMC: this mail is primarily send for documentation purposes and for
> regzbot, my Linux kernel regression tracking bot. These mails usually
> contain '#forregzbot' in the subject, to make them easy to spot and filter.
> 
> #regzbot backburner: patch in mm, but it needs to be tested properly and
> the issue is not urgend

#regzbot fixed-by: 9b3016154c913b2e7

> On 24.02.22 10:22, Thorsten Leemhuis wrote:
>> [TLDR: I'm adding below regression report below to regzbot, the Linux
>> kernel regression tracking bot; all text you find below is compiled from
>> a few templates paragraphs you might have encountered already already
>> from similar mails.]
>>
>> Hi, this is your Linux kernel regression tracker speaking.
>>
>> Thanks for the report. CCing the regression mailing list, as it should
>> be in the loop for all regressions, as explained here:
>> https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html
>>
>> To be sure this issue doesn't fall through the cracks unnoticed, I'm
>> adding it to regzbot, my Linux kernel regression tracking bot:
>>
>> #regzbot ^introduced v3.0..v5.15.19
>> #regzbot ignore-activity
>>
>> Reminder for developers: when fixing the issue, please add a 'Link:'
>> tags pointing to the report (the mail quoted below) using
>> lore.kernel.org/r/, as explained in
>> 'Documentation/process/submitting-patches.rst' and
>> 'Documentation/process/5.Posting.rst'. This allows the bot to connect
>> the report with any patches posted or committed to fix the issue; this
>> again allows the bot to show the current status of regressions and
>> automatically resolve the issue when the fix hits the right tree.
>>
>> I'm sending this to everyone that got the initial report, to make them
>> aware of the tracking. I also hope that messages like this motivate
>> people to directly get at least the regression mailing list and ideally
>> even regzbot involved when dealing with regressions, as messages like
>> this wouldn't be needed then.
>>
>> Don't worry, I'll send further messages wrt to this regression just to
>> the lists (with a tag in the subject so people can filter them away), if
>> they are relevant just for regzbot. With a bit of luck no such messages
>> will be needed anyway.
>>
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>
>> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
>> reports on my table. I can only look briefly into most of them and lack
>> knowledge about most of the areas they concern. I thus unfortunately
>> will sometimes get things wrong or miss something important. I hope
>> that's not the case here; if you think it is, don't hesitate to tell me
>> in a public reply, it's in everyone's interest to set the public record
>> straight.
>>
>> On 23.02.22 14:51, Daniel Dao wrote:
>>> Hi all,
>>>
>>> We are observing some regressions in workingset_refault on our newly upgraded
>>> 5.15.19 nodes with zram as swap. This manifests in several ways:
>>>
>>> 1) Regression of workingset_refault duration observed in flamegraph
>>>
>>> We regularly collect flamegraphs for running services on the node. Since upgrade
>>> to 5.15.19, we see that workingset_refault occupied a more significant part of
>>> the service flamegraph (13%) with the following call trace
>>>
>>>   workingset_refault+0x128
>>>   add_to_page_cache_lru+0x9f
>>>   page_cache_ra_unbounded+0x154
>>>   force_page_cache_ra+0xe2
>>>   filemap_get_pages+0xe9
>>>   filemap_read+0xa4
>>>   xfs_file_buffered_read+0x98
>>>   xfs_file_read_iter+0x6a
>>>   new_sync_read+0x118
>>>   vfs_read+0xf2
>>>   __x64_sys_pread64+0x89
>>>   do_syscall_64+0x3b
>>>   entry_SYSCALL_64_after_hwframe+0x44
>>>
>>> 2) Regression of userspace performance sensitive code
>>>
>>> We have some performance sensentive code running in userspace that have their
>>> runtime measured by CLOCK_THREAD_CPUTIME_ID. They look roughly as:
>>>
>>>   now = clock_gettime(CLOCK_THREAD_CPUTIME_ID)
>>>   func()
>>>   elapsed = clock_gettime(CLOCK_THREAD_CPUTIME_ID) - now
>>>
>>> Since 5.15 upgrade, we observed long `elapsed` in the range of 4-10ms much more
>>> frequently than before.  This went away after we disabled swap for the service
>>> using `memory.swap.max=0` memcg configuration.
>>>
>>> The new thing in 5.15 workingset_refault seems to be introduction of
>>> mem_cgroup_flush_stats()
>>> by commit 1f828223b7991a228bc2aef837b78737946d44b2 (memcg: flush
>>> lruvec stats in the
>>> refault).
>>>
>>> Given that mem_cgroup_flush_stats can take quite a long time for us on the
>>> standard systemd cgroupv2 hierrachy ( root / system.slice / workload.service )
>>>
>>>   sudo /usr/share/bcc/tools/funcslower -m 10 -t mem_cgroup_flush_stats
>>>   Tracing function calls slower than 10 ms... Ctrl+C to quit.
>>>   TIME       COMM           PID    LAT(ms)             RVAL FUNC
>>>   0.000000   <redacted>     804776   11.50              200
>>> mem_cgroup_flush_stats
>>>   0.343383   <redacted>     647496   10.58              200
>>> mem_cgroup_flush_stats
>>>   0.604309   <redacted>     804776   10.50              200
>>> mem_cgroup_flush_stats
>>>   1.230416   <redacted>     803293   10.01              200
>>> mem_cgroup_flush_stats
>>>   1.248442   <redacted>     646400   11.02              200
>>> mem_cgroup_flush_stats
>>>
>>> could it be possible that workingset_refault in some unfortunate case can take
>>> much longer than before such that it increases the time observed by
>>> CLOCK_THREAD_CPUTIME_ID from userspace, or overall duration of
>>> workingset_refault
>>> observed by perf ?
>>>
>>
>>
