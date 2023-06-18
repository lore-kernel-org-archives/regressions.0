Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAEE1386
	for <regressions@lists.linux.dev>; Sun, 18 Jun 2023 10:25:44 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qApbD-0002jU-OV; Sun, 18 Jun 2023 12:25:35 +0200
Message-ID: <1413638e-9614-056e-cfc5-5f9c8bf8af00@leemhuis.info>
Date: Sun, 18 Jun 2023 12:25:35 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: printk.time causes rare kernel boot hangs
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: "Richard W.M. Jones" <rjones@redhat.com>, Aaron Thompson
 <dev@aaront.org>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20230613134105.GA10301@redhat.com>
 <172193eb-14cc-549e-2953-6749a3a4c502@leemhuis.info>
In-Reply-To: <172193eb-14cc-549e-2953-6749a3a4c502@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1687083945;c86b6ac3;
X-HE-SMSGID: 1qApbD-0002jU-OV

On 13.06.23 16:07, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:
> 
> On 13.06.23 15:41, Richard W.M. Jones wrote:
>> [Being tracked in this bug which contains much more detail:
>> https://gitlab.com/qemu-project/qemu/-/issues/1696 ]
>>
>> Recent kernels hang rarely when booted on qemu.  Usually you need to
>> boot 100s or 1,000s of times to see the hang, compared to 292,612 [sic]
>> successful boots which I was able to do before the problematic commit.
>>
>> A reproducer (you'll probably need to use Fedora) is:
>>
>>   $ while guestfish -a /dev/null -v run >& /tmp/log; do echo -n . ; done
>>
>> You will need to leave it running for probably several hours, and
>> examine the /tmp/log file at the end.
>>
>> I tracked this down to the following commit:
>>
>>   commit f31dcb152a3d0816e2f1deab4e64572336da197d
>>   Author: Aaron Thompson <dev@aaront.org>
>>   Date:   Thu Apr 13 17:50:12 2023 +0000
>>
>>     sched/clock: Fix local_clock() before sched_clock_init()
>>     
>>     Have local_clock() return sched_clock() if sched_clock_init() has not
>>     yet run. sched_clock_cpu() has this check but it was not included in the
>>     new noinstr implementation of local_clock().
>>
>>   (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f31dcb152a3d0816e2f1deab4e64572336da197d)
>>
>> Reverting this commit fixes the problem.
>>
>> I don't know _why_ this commit is wrong, but can we revert it as it
>> causes serious problems with libguestfs hanging randomly.
>>
>> Or if there's anything you want me to try out then let me know,
>> because I can reproduce the problem locally quite easily.
> 
> Thanks for the report. To be sure the issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced f31dcb152a3d0816e2f1deab4e64572336da197d
> #regzbot title sched/clock: printk.time causes rare kernel boot hangs
> #regzbot ignore-activity

#regzbot fix: tick/common: Align tick period during sched_timer setup
#regzbot monitor:
https://lore.kernel.org/all/12c6f9a3-d087-b824-0d05-0d18c9bc1bf3@amazon.com/
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
