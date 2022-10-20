Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B96320F
	for <regressions@lists.linux.dev>; Thu, 20 Oct 2022 12:43:31 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1olUtV-00068d-7Q; Thu, 20 Oct 2022 14:43:29 +0200
Message-ID: <2ec00aa0-ccd0-d7f2-261a-3457745545a8@leemhuis.info>
Date: Thu, 20 Oct 2022 14:43:26 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: v6.1-rc1: Regression in notification of sethostname changes
Content-Language: en-US, de-DE
To: Torsten Hilbrich <torsten.hilbrich@secunet.com>,
 Petr Vorel <pvorel@suse.cz>
Cc: linux-kernel@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <0c2b92a6-0f25-9538-178f-eee3b06da23f@secunet.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <0c2b92a6-0f25-9538-178f-eee3b06da23f@secunet.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1666269811;63a7901a;
X-HE-SMSGID: 1olUtV-00068d-7Q

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

Hi, this is your Linux kernel regression tracker. CCing the regression
mailing list, as it should be in the loop for all regressions, as
explained here:
https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html



On 19.10.22 10:29, Torsten Hilbrich wrote:
> Hello Petr,
> 
> your commit
> 
> commit bfca3dd3d0680fc2fc7f659a152234afbac26e4d
> Author: Petr Vorel <pvorel@suse.cz>
> Date:   Thu Sep 1 21:44:03 2022 +0200
> 
>     kernel/utsname_sysctl.c: print kernel arch
>     
>     Print the machine hardware name (UTS_MACHINE) in /proc/sys/kernel/arch.
>     
>     This helps people who debug kernel with initramfs with minimal environment
>     (i.e.  without coreutils or even busybox) or allow to open sysfs file
>     instead of run 'uname -m' in high level languages.
> 
> broke the notification mechanism between the sethostname syscall and the pollers of /proc/sys/kernel/hostname.
> 
> The table uts_kern_table is addressed within uts_proc_notify by the enum value, however no new enum value was added in "enum uts_proc".
> 
> I noticed the problem when journald-systemd failed to detect hostname changes made with the sethostname syscall (as used by the hostname tool).
> When setting the hostname through /proc/sys/kernel/hostname the poll notification was working.

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced bfca3dd3d0
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replies to), as explained for
in the Linux kernel's documentation; above webpage explains why this is
important for tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
