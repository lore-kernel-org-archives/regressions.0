Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7BD7C
	for <regressions@lists.linux.dev>; Wed, 30 Mar 2022 12:22:32 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nZXLE-0000QY-Ki; Wed, 30 Mar 2022 14:22:25 +0200
Message-ID: <49ae9e66-0fa1-7c9d-49e7-88a7c6cf9ddb@leemhuis.info>
Date: Wed, 30 Mar 2022 14:22:24 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: scalability regressions related to hugetlb_fault() changes
Content-Language: en-US
To: Ray Fucillo <Ray.Fucillo@intersystems.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <D3204B1E-50A1-4261-8C75-3DF77A302502@intersystems.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
In-Reply-To: <D3204B1E-50A1-4261-8C75-3DF77A302502@intersystems.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1648642952;0a5d059e;
X-HE-SMSGID: 1nZXLE-0000QY-Ki

[TLDR: I'm adding the regression report below to regzbot, the Linux
kernel regression tracking bot; all text you find below is compiled from
a few templates paragraphs you might have encountered already already
from similar mails.]

Hi, this is your Linux kernel regression tracker.

On 24.03.22 21:12, Ray Fucillo wrote:
> In moving to newer versions of the kernel, our customers have experienced dramatic new scalability problems in our database application, InterSystems IRIS.  Our research has narrowed this down to new processes that attach to the database's shared memory segment taking very long delays (in some cases ~100ms!) acquiring the i_mmap_lock_read() in hugetlb_fault() as they fault in the huge page for the first time.  The addition of this lock in hugetlb_fault() matches the versions where we see this problem.  It's not just slowing the new process that incurs the delay, but backing up other processes if the page fault occurs inside a critical section within the database application.
> 
> Is there something that can be improved here?  
> 
> The read locks in hugetlb_fault() contend with write locks that seem to be taken in very common application code paths: shmat(), process exit, fork() (not vfork()), shmdt(), presumably others.  So hugetlb_fault() contending to read turns out to be common.  When the system is loaded, there will be many new processes faulting in pages that may blocks the write lock, which in turn blocks more readers in fault behind it, and so on...  I don't think there's any support for shared page tables in hugetlb to avoid the faults altogether.
> 
> Switching to 1GB huge pages instead of 2MB is a good mitigation in reducing the frequency of fault, but not a complete solution.
> 
> Thanks for considering.
> 
> Ray

Thanks for the report. CCing the regression mailing list, as it should
be in the loop for all regressions, as explained here:
https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html

To be sure below issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced c0d0381ade79
#regzbot title mm: scalability regressions related to hugetlb_fault()
changes
#regzbot ignore-activity
#regzbot back-burner: looks like this will take some time to get sorted out

If it turns out this isn't a regression, free free to remove it from the
tracking by sending a reply to this thread containing a paragraph like
"#regzbot invalid: reason why this is invalid" (without the quotes).

Reminder for developers: when fixing the issue, please add a 'Link:'
tags pointing to the report (the mail quoted above) using
lore.kernel.org/r/, as explained in
'Documentation/process/submitting-patches.rst' and
'Documentation/process/5.Posting.rst'. Regzbot needs them to
automatically connect reports with fixes, but they are useful in
general, too.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.

-- 
Additional information about regzbot:

If you want to know more about regzbot, check out its web-interface, the
getting start guide, and the references documentation:

https://linux-regtracking.leemhuis.info/regzbot/
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

The last two documents will explain how you can interact with regzbot
yourself if your want to.

Hint for reporters: when reporting a regression it's in your interest to
CC the regression list and tell regzbot about the issue, as that ensures
the regression makes it onto the radar of the Linux kernel's regression
tracker -- that's in your interest, as it ensures your report won't fall
through the cracks unnoticed.

Hint for developers: you normally don't need to care about regzbot once
it's involved. Fix the issue as you normally would, just remember to
include 'Link:' tag in the patch descriptions pointing to all reports
about the issue. This has been expected from developers even before
regzbot showed up for reasons explained in
'Documentation/process/submitting-patches.rst' and
'Documentation/process/5.Posting.rst'.
