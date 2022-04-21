Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA6C46BD
	for <regressions@lists.linux.dev>; Thu, 21 Apr 2022 11:27:45 +0000 (UTC)
Received: from [2a02:8108:963f:de38:6624:6d8d:f790:d5c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nhUyM-0005mJ-Ie; Thu, 21 Apr 2022 13:27:42 +0200
Message-ID: <8c454aa4-2555-1de5-f947-8509471e56be@leemhuis.info>
Date: Thu, 21 Apr 2022 13:27:41 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [Bug 215679] New: NVMe/writeback wb_workfn/blocked for more than
 30 seconds
Content-Language: en-US
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-nvme@lists.infradead.org, bugzilla-daemon@kernel.org,
 Keith Busch <kbusch@kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <bug-215679-95461@https.bugzilla.kernel.org/>
 <YlhxNn5JZcsqpOlf@kbusch-mbp.dhcp.thefacebook.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <YlhxNn5JZcsqpOlf@kbusch-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1650540465;6b5da525;
X-HE-SMSGID: 1nhUyM-0005mJ-Ie

Hi, this is your Linux kernel regression tracker. Top-posting for once,
to make this easily accessible to everyone.

Jens, this regression is now a month old and the culprit was already
identified when the issue was reported, nevertheless it seems no real
progress was made to address this, at least afaics. What's up there?
Should the culprit be reverted?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

#regzbot poke

On 14.04.22 21:08, Keith Busch wrote:
> On Sun, Mar 13, 2022 at 08:13:53PM +0000, bugzilla-daemon@kernel.org wrote:
>> https://bugzilla.kernel.org/show_bug.cgi?id=215679
>>
>>             Bug ID: 215679
>>            Summary: NVMe/writeback wb_workfn/blocked for more than 30
>>                     seconds
>>            Product: IO/Storage
>>            Version: 2.5
>>     Kernel Version: 5.17.0-rc7
>>           Hardware: x86-64
>>                 OS: Linux
>>               Tree: Mainline
>>             Status: NEW
>>           Severity: high
>>           Priority: P1
>>          Component: NVMe
>>           Assignee: io_nvme@kernel-bugs.kernel.org
>>           Reporter: imre.deak@intel.com
>>         Regression: No
>>
>> Created attachment 300564
>>   --> https://bugzilla.kernel.org/attachment.cgi?id=300564&action=edit
>> dmesg log after suspend resume, io stuck
>>
>> After system suspend/resume filesystem IO will stall, producing a 'kworker
>> blocked for more than x sec" in dmesg, recovering after a long delay. See the
>> attached dmesg-suspend-resume-nvme-stuck.txt. I also noticed the same issue
>> happening right after booting or after runtime suspend transitions.
>>
>> The same issue also happens on multiple SKL systems in the i915 team's CI farm,
>> see:
>>
>> https://gitlab.freedesktop.org/drm/intel/-/issues/4547
>>
>> I bisected the problem to
>> commit 4f5022453acd0f7b28012e20b7d048470f129894
>> Author: Jens Axboe <axboe@kernel.dk>
>> Date:   Mon Oct 18 08:45:39 2021 -0600
>>
>>     nvme: wire up completion batching for the IRQ path
>>
>> By reverting it on top of 5.17.0-rc7, I can't reproduce the problem. Attached  
>> dmesg-suspend-resume-nvme-ok.txt with the revert, captured after a few
>> suspend/resume.
> 
> Forwarding to linux-nvme for higher visibility.
> 

