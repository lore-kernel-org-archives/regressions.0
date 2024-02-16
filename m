Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6FD14265;
	Fri, 16 Feb 2024 05:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708059947; cv=none; b=BhZ62H1iPGmdUABEVjXU7txtpN1GQNZz+b1oPEQlH/1YgR+HDgCdaNgh3GANoezfV8Jlt0cQByLG2tUBvJV0mjX7wEOUG9bcgYvXIemXYVI4F94/n8LhF0cXQLy/Eh/ZamhfyhkLAKR6iDF8X/UilSsVK3Tp4x+6gSsjZXj3jyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708059947; c=relaxed/simple;
	bh=LMnlCNRTqx3t3D0T4rjVj18K3p0bR7fXk2QUb/NcXvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4KWsFb2aWsoAFEI4EW2/pMluQEb2fgkU4gM6qtaWablvk03AYvJdbtzatp7YAqzG8Dv5nW/L3e13bHi9UwmpPSUBufeLKsen0l/XP6FRH/bioXARaMZGNM1Hn8BLFa3UzJvZ3VzVlUFkox2ZNWWRhqiba4KI842w9aiAg1Av1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1raqPo-0002sp-QN; Fri, 16 Feb 2024 06:05:36 +0100
Message-ID: <df1d5d57-1058-43f4-8aca-f91e7ad92dd4@leemhuis.info>
Date: Fri, 16 Feb 2024 06:05:36 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.8-rc: system freezes after resuming from suspend
Content-Language: en-US, de-DE
To: Trolli Schmittlauch <t.schmittlauch@orlives.de>
Cc: regressions@lists.linux.dev, Mario Limonciello <mario.limonciello@amd.com>
References: <ed2226ff-257b-4cfd-afd6-bf3be9785474@localhost>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ed2226ff-257b-4cfd-afd6-bf3be9785474@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1708059944;a5a8aea4;
X-HE-SMSGID: 1raqPo-0002sp-QN

[moved stable list to bcc, as this is nothing for the stable team]

On 16.02.24 03:42, Trolli Schmittlauch wrote:
> I've found a regression somewhere between 6.7.4 and 6.8.0-rc0 that
> causes my Framework 7840 AMD laptop to freeze after waking it from a
> suspend. I can reliably trigger the issue, but unfortunately cannot
> provide useful logs for now and hope to get some help with doing so.

Thx for the report. I'm CCing Mario, who has some experience with this
kind of problems and often had helpful advice in situations like this.
He also wrote a script that can help find the root of the problem on
systems that use Suspend-to-Idle:
https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/amd_s2idle.py

Or does you system use ACPI S3 to suspend?

Furthermore: could you please provide the output of dmesg after the
first suspend? Maybe something goes sideways there and causes the later
resume processes to fail.

Have you tried if the system is reachable by ssh from another machine
when it seems to hang?

And you might want to configure your kernel to print all messages to the
tty consoles, maybe then you get to see what the kernel prints before it
hangs

> How to reproduce
> ----------------
> 
> The last working kernel release was 6.7.4, the issue appeared in all 6.8
> release candidates from 1-4.
> 
> 1. normally boot the system with a 6.8 kernel
> 2. suspend and resume the system 2 to 4 times. Usually, the freeze
> already occurs at the 2nd resume.
> 2.1 graphical approach: I've reproduced this directly from the "Suspend"
> button in my SDDM display manager (X11)
> 2.2 TTY approach: You can also directly swith to a tty after boot, log
> in, and then issue `systemctl suspend` 2 to 4 times
> 3. After resume number 2 or later, the system freezes while resuming and
> cannot be used anymore. The screen is switched on and displays
> something, but no inputs are processed and the image is static.
> 3.1 graphical approach: When suspending and resuming by closing and
> opening the laptop lid, the screen is black with the cursor displayed.
> When doing so while keeping the lid open, the display manager's
> background image and a cursor are displayed, but only statically frozen.
> No keyboard or touchpad input is processed.
> 3.2 on a TTY: When suspending and resuming from a tty, a few kernel
> messages still manage to be printed, but after that no new information
> is displayed. E.g. when keeping a `journalctl -f` session open in
> another tmux pane, that journal output does not update anymore. Keyboard
> inputs are not processed anymore. Nonetheless, the cursor continues to
> blink regulary.
> I've attached two screenshots showing the situation with kernels 6.7.4
> (working) and 6.8 (broken).
> 
> Detailed Description
> --------------------
> 
> In most cases, the freeze already occurs after the 2nd
> suspend-resume-cycle.
> Unfortunately, this freeze also appears to block IO, as after a forced
> hard reboot I cannot retrieve relevant information from `journalctl -b
> "-1"`. The last retrievable log messages are from the successful suspend
> action.
> I welcome any recommendation on how to retrieve valuable information. I
> have not yet played around with cmdline parameters relevant for debug.
> 
> System Details
> --------------
> 
> Distro: NixOS 23.11, kernel 6.8 rc1-4 compiled manually
> kernel: Linux version 6.8.0-rc4 (nixbld@localhost) (gcc (GCC) 12.3.0,
> GNU ld (GNU Binutils) 2.40) #1-NixOS SMP PREEMPT_DYNAMIC Sun Feb 11
> 20:18:13 UTC 2024
> hardware: Framework 13 laptop, 7840 AMD series, CPU AMD Ryzen 7 7840U
> x86_64
> 
> In the attachments you find:
> - the used kernel config
> - my cmdline params
> - 2 screenshots from the bug occuring when triggered from a tty
> 
> Next Steps
> ----------
> 
> I intend to bisect the issue, but this can take a while due to the need
> for manual testing and a kernel compile cycle requiring >30min for now.
> I am mostly reporting this now already to still raise awareness in the
> RC phase and to have something where I can point other Framework laptop
> users towards for reproduction of the bug.
> 
> All the best
> schmittlauch
> 
> Disclaimer:
> I read the kernel docs on reporting issues, IMHO these were a bit
> unclear on whether RC kernels are in the scope of the stable and
> regressions lists.

You mean
https://docs.kernel.org/admin-guide/reporting-issues.html ?
Could you elaborate on that? Did you mean the TLDR version or the longer
version?

> If they aren't please point me to where to do this. So far I had only
> reported bugs via the bugzilla.

Ciao, Thorsten

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

P.S. To be sure the issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, the Linux kernel regression tracking bot:

#regzbot ^introduced v6.7..v6.8-1
#regzbot title suspend: Framework 7840 AMD freezes on resume
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
