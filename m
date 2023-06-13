Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A227522B
	for <regressions@lists.linux.dev>; Tue, 13 Jun 2023 14:08:04 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q94gX-0003mL-Rb; Tue, 13 Jun 2023 16:07:49 +0200
Message-ID: <172193eb-14cc-549e-2953-6749a3a4c502@leemhuis.info>
Date: Tue, 13 Jun 2023 16:07:49 +0200
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
To: "Richard W.M. Jones" <rjones@redhat.com>, Aaron Thompson
 <dev@aaront.org>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230613134105.GA10301@redhat.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230613134105.GA10301@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1686665284;fc3b3c45;
X-HE-SMSGID: 1q94gX-0003mL-Rb

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 13.06.23 15:41, Richard W.M. Jones wrote:
> [Being tracked in this bug which contains much more detail:
> https://gitlab.com/qemu-project/qemu/-/issues/1696 ]
> 
> Recent kernels hang rarely when booted on qemu.  Usually you need to
> boot 100s or 1,000s of times to see the hang, compared to 292,612 [sic]
> successful boots which I was able to do before the problematic commit.
> 
> A reproducer (you'll probably need to use Fedora) is:
> 
>   $ while guestfish -a /dev/null -v run >& /tmp/log; do echo -n . ; done
> 
> You will need to leave it running for probably several hours, and
> examine the /tmp/log file at the end.
> 
> I tracked this down to the following commit:
> 
>   commit f31dcb152a3d0816e2f1deab4e64572336da197d
>   Author: Aaron Thompson <dev@aaront.org>
>   Date:   Thu Apr 13 17:50:12 2023 +0000
> 
>     sched/clock: Fix local_clock() before sched_clock_init()
>     
>     Have local_clock() return sched_clock() if sched_clock_init() has not
>     yet run. sched_clock_cpu() has this check but it was not included in the
>     new noinstr implementation of local_clock().
> 
>   (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f31dcb152a3d0816e2f1deab4e64572336da197d)
> 
> Reverting this commit fixes the problem.
> 
> I don't know _why_ this commit is wrong, but can we revert it as it
> causes serious problems with libguestfs hanging randomly.
> 
> Or if there's anything you want me to try out then let me know,
> because I can reproduce the problem locally quite easily.

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced f31dcb152a3d0816e2f1deab4e64572336da197d
#regzbot title sched/clock: printk.time causes rare kernel boot hangs
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
