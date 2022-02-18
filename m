Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3044A81
	for <regressions@lists.linux.dev>; Fri, 18 Feb 2022 14:08:10 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nL3vc-0008Ic-RS; Fri, 18 Feb 2022 15:08:08 +0100
Message-ID: <c51f7904-5888-88b8-f6d1-fccef2af1151@leemhuis.info>
Date: Fri, 18 Feb 2022 15:08:08 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: block: bfq: oops/random freeze in bfq_put_idle_entity /
 bfq_exit_icq_bfqq (fwd from bugzilla) #forregzbot
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <d51611e5-2e39-49b5-b300-917a9b024c59@leemhuis.info>
In-Reply-To: <d51611e5-2e39-49b5-b300-917a9b024c59@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1645193291;d8cba04f;
X-HE-SMSGID: 1nL3vc-0008Ic-RS

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

Quoting https://bugzilla.kernel.org/show_bug.cgi?id=215527#c8

> I am currently using 5.16.8 (for a few days now), the issue did not appear
> again.
> So I assume it was fixed in between.

Hence:

#regzbot invalid: seems issue got fixed
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.



On 26.01.22 10:08, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> There is a regression in bugzilla I'd like to add to the tracking:
> 
> #regzbot introduced: v5.14..v5.15
> #regzbot from: Bernd Buschinski <b.buschinski@gmail.com>
> #regzbot title: block: bfq: oops/random freeze in bfq_put_idle_entity /
> bfq_exit_icq_bfqq
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215527
> 
> Quote:
> 
>> With kernel 5.15.15 (possible all 5.15*, don't know when it really started) I get random freezes and a system log like:
>>
>>
>> Jan 24 13:10:03 localhost kernel: PGD 0 P4D 0 
>> Jan 24 13:10:03 localhost kernel: Oops: 0002 [#1] SMP NOPTI
>> Jan 24 13:10:03 localhost kernel: CPU: 3 PID: 2028 Comm: kworker/3:1H Not tainted 5.15.15-gentoo #1
>> Jan 24 13:10:03 localhost kernel: Hardware name: Dell Inc. Latitude 7410/0M5G57, BIOS 1.11.0 12/12/2021
>> Jan 24 13:10:03 localhost kernel: Workqueue: kblockd blk_mq_run_work_fn
>> Jan 24 13:10:03 localhost kernel: RIP: 0010:bfq_idle_extract+0x50/0xa0
>> Jan 24 13:10:03 localhost kernel: Code: 65 48 c7 45 30 00 00 00 00 48 8d 73 08 48 89 ef e8 85 39 08 00 4d 85 e4 74 35 49 8b 84 24 38 01 00 00 49 8b 94 24 30 01 00 00 <48> 89 42 08 48 89 10 48 b8 00 01 00 00 00 00 ad de 49 89 84 24 30
>> Jan 24 13:10:03 localhost kernel: RSP: 0018:ffffc9000134fce0 EFLAGS: 00010082
>> Jan 24 13:10:03 localhost kernel: RAX: 0000000000000000 RBX: ffff8881dd007158 RCX: 0000000000000000
>> Jan 24 13:10:03 localhost kernel: RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff8881df2d8098
>> Jan 24 13:10:03 localhost kernel: RBP: ffff8881df2d8098 R08: ffff8881dd007160 R09: ffff8881f8155280
>> Jan 24 13:10:03 localhost kernel: R10: ffff8881f8155280 R11: fefefefefefefeff R12: ffff8881df2d8010
>> Jan 24 13:10:03 localhost kernel: R13: ffff888109736760 R14: ffff888109736760 R15: 000000000000001e
>> Jan 24 13:10:03 localhost kernel: FS:  0000000000000000(0000) GS:ffff88848d6c0000(0000) knlGS:0000000000000000
>> Jan 24 13:10:03 localhost kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> Jan 24 13:10:03 localhost kernel: CR2: 0000000000000008 CR3: 00000001174be001 CR4: 00000000003706e0
>> Jan 24 13:10:03 localhost kernel: DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> Jan 24 13:10:03 localhost kernel: DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> Jan 24 13:10:03 localhost kernel: Call Trace:
>> Jan 24 13:10:03 localhost kernel:  <TASK>
>> Jan 24 13:10:03 localhost kernel:  bfq_put_idle_entity+0xd/0x50
>> Jan 24 13:10:03 localhost kernel:  bfq_bfqq_served+0xaa/0x1b0
>> Jan 24 13:10:03 localhost kernel:  bfq_dispatch_request+0x2c9/0x1270
>> Jan 24 13:10:03 localhost kernel:  ? mod_delayed_work_on+0x42/0x60
>> Jan 24 13:10:03 localhost kernel:  __blk_mq_do_dispatch_sched+0x1c8/0x2a0
>> Jan 24 13:10:03 localhost kernel:  __blk_mq_sched_dispatch_requests+0xcd/0x130
>> Jan 24 13:10:03 localhost kernel:  blk_mq_sched_dispatch_requests+0x2a/0x50
>> Jan 24 13:10:03 localhost kernel:  __blk_mq_run_hw_queue+0x28/0x60
>> Jan 24 13:10:03 localhost kernel:  process_one_work+0x1d1/0x370
>> Jan 24 13:10:03 localhost kernel:  worker_thread+0x48/0x3c0
>> Jan 24 13:10:03 localhost kernel:  ? rescuer_thread+0x350/0x350
>> Jan 24 13:10:03 localhost kernel:  kthread+0x11f/0x140
>> Jan 24 13:10:03 localhost kernel:  ? set_kthread_struct+0x40/0x40
>> Jan 24 13:10:03 localhost kernel:  ret_from_fork+0x1f/0x30
>> Jan 24 13:10:03 localhost kernel:  </TASK>
>> Jan 24 13:10:03 localhost kernel: Modules linked in: xt_MASQUERADE xt_addrtype iptable_nat br_netfilter snd_hda_codec_hdmi snd_ctl_led snd_hda_codec_realtek snd_hda_codec_generic snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep snd_hda_core snd_pcm snd_timer snd efivarfs
>> Jan 24 13:10:03 localhost kernel: CR2: 0000000000000008
>> Jan 24 13:10:03 localhost kernel: ---[ end trace 15e78f85422205d7 ]---
>> Jan 24 13:10:03 localhost kernel: RIP: 0010:bfq_idle_extract+0x50/0xa0
>> Jan 24 13:10:03 localhost kernel: Code: 65 48 c7 45 30 00 00 00 00 48 8d 73 08 48 89 ef e8 85 39 08 00 4d 85 e4 74 35 49 8b 84 24 38 01 00 00 49 8b 94 24 30 01 00 00 <48> 89 42 08 48 89 10 48 b8 00 01 00 00 00 00 ad de 49 89 84 24 30
>> Jan 24 13:10:03 localhost kernel: RSP: 0018:ffffc9000134fce0 EFLAGS: 00010082
>> Jan 24 13:10:03 localhost kernel: RAX: 0000000000000000 RBX: ffff8881dd007158 RCX: 0000000000000000
>> Jan 24 13:10:03 localhost kernel: RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff8881df2d8098
>> Jan 24 13:10:03 localhost kernel: RBP: ffff8881df2d8098 R08: ffff8881dd007160 R09: ffff8881f8155280
>> Jan 24 13:10:03 localhost kernel: R10: ffff8881f8155280 R11: fefefefefefefeff R12: ffff8881df2d8010
>> Jan 24 13:10:03 localhost kernel: R13: ffff888109736760 R14: ffff888109736760 R15: 000000000000001e
>> Jan 24 13:10:03 localhost kernel: FS:  0000000000000000(0000) GS:ffff88848d6c0000(0000) knlGS:0000000000000000
>> Jan 24 13:10:03 localhost kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> Jan 24 13:10:03 localhost kernel: CR2: 0000000000000008 CR3: 00000001174be001 CR4: 00000000003706e0
>> Jan 24 13:10:03 localhost kernel: DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> Jan 24 13:10:03 localhost kernel: DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> Jan 24 13:10:26 localhost kernel:       (detected by 4, t=21002 jiffies, g=361417, q=1457)
>> Jan 24 13:10:26 localhost kernel: Sending NMI from CPU 4 to CPUs 6:
>> Jan 24 13:10:26 localhost kernel: NMI backtrace for cpu 6
>> Jan 24 13:10:26 localhost kernel: CPU: 6 PID: 10426 Comm: systemd-udevd Tainted: G      D           5.15.15-gentoo #1
>> Jan 24 13:10:26 localhost kernel: Hardware name: Dell Inc. Latitude 7410/0M5G57, BIOS 1.11.0 12/12/2021
>> Jan 24 13:10:26 localhost kernel: RIP: 0010:queued_spin_lock_slowpath+0x3d/0x190
>> Jan 24 13:10:26 localhost kernel: Code: 0f ba 2a 08 0f 92 c1 8b 02 0f b6 c9 c1 e1 08 30 e4 09 c8 a9 00 01 ff ff 0f 85 eb 00 00 00 85 c0 74 0e 8b 02 84 c0 74 08 f3 90 <8b> 02 84 c0 75 f8 b8 01 00 00 00 66 89 02 c3 8b 37 b8 00 02 00 00
>> Jan 24 13:10:26 localhost kernel: RSP: 0018:ffffc90002c17e08 EFLAGS: 00000002
>> Jan 24 13:10:26 localhost kernel: RAX: 0000000000000101 RBX: ffff8881078fe0e8 RCX: 0000000000000000
>> Jan 24 13:10:26 localhost kernel: RDX: ffff888125898c20 RSI: 0000000000000000 RDI: ffff888125898c20
>> Jan 24 13:10:26 localhost kernel: RBP: ffff88810eea78e0 R08: ffff8881f3801d80 R09: ffffc90002c17df0
>> Jan 24 13:10:26 localhost kernel: R10: 0000000000000000 R11: ffff88848d7a9c70 R12: 0000000000000086
>> Jan 24 13:10:26 localhost kernel: R13: ffff888125898800 R14: 0000000000000000 R15: ffff888125898c20
>> Jan 24 13:10:26 localhost kernel: FS:  0000000000000000(0000) GS:ffff88848d780000(0000) knlGS:0000000000000000
>> Jan 24 13:10:26 localhost kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> Jan 24 13:10:26 localhost kernel: CR2: 00005637e53ed010 CR3: 0000000006012006 CR4: 00000000003706e0
>> Jan 24 13:10:26 localhost kernel: DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> Jan 24 13:10:26 localhost kernel: DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> Jan 24 13:10:26 localhost kernel: Call Trace:
>> Jan 24 13:10:26 localhost kernel:  <TASK>
>> Jan 24 13:10:26 localhost kernel:  _raw_spin_lock_irqsave+0x20/0x30
>> Jan 24 13:10:26 localhost kernel:  bfq_exit_icq_bfqq+0x6a/0x220
>> Jan 24 13:10:26 localhost kernel:  bfq_exit_icq+0x56/0x70
>> Jan 24 13:10:26 localhost kernel:  put_io_context_active+0x45/0x70
>> Jan 24 13:10:26 localhost kernel:  do_exit+0x687/0x990
>> Jan 24 13:10:26 localhost kernel:  do_group_exit+0x2e/0x90
>> Jan 24 13:10:26 localhost kernel:  __x64_sys_exit_group+0xf/0x10
>> Jan 24 13:10:26 localhost kernel:  do_syscall_64+0x38/0x90
>> Jan 24 13:10:26 localhost kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xae
>> Jan 24 13:10:26 localhost kernel: RIP: 0033:0x7efdc46568d9
>> Jan 24 13:10:26 localhost kernel: Code: Unable to access opcode bytes at RIP 0x7efdc46568af.
>> Jan 24 13:10:26 localhost kernel: RSP: 002b:00007ffc39fd9c28 EFLAGS: 00000206 ORIG_RAX: 00000000000000e7
>> Jan 24 13:10:26 localhost kernel: RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007efdc46568d9
>> Jan 24 13:10:26 localhost kernel: RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000000
>> Jan 24 13:10:26 localhost kernel: RBP: 0000000000000000 R08: fffffffffffffee0 R09: 00005637e5349ea0
>> Jan 24 13:10:26 localhost kernel: R10: 26ca40ab28001f9e R11: 0000000000000206 R12: 00005637e5410210
> Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat)
> 
> P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
> on my table. I can only look briefly into most of them. Unfortunately
> therefore I sometimes will get things wrong or miss something important.
> I hope that's not the case here; if you think it is, don't hesitate to
> tell me about it in a public reply, that's in everyone's interest.
> 
> BTW, I have no personal interest in this issue, which is tracked using
> regzbot, my Linux kernel regression tracking bot
> (https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
> this mail to get things rolling again and hence don't need to be CC on
> all further activities wrt to this regression.
> 
> ---
> Additional information about regzbot:
> 
> If you want to know more about regzbot, check out its web-interface, the
> getting start guide, and/or the references documentation:
> 
> https://linux-regtracking.leemhuis.info/regzbot/
> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md
> 
> The last two documents will explain how you can interact with regzbot
> yourself if your want to.
> 
> Hint for reporters: when reporting a regression it's in your interest to
> tell #regzbot about it in the report, as that will ensure the regression
> gets on the radar of regzbot and the regression tracker. That's in your
> interest, as they will make sure the report won't fall through the
> cracks unnoticed.
> 
> Hint for developers: you normally don't need to care about regzbot once
> it's involved. Fix the issue as you normally would, just remember to
> include a 'Link:' tag to the report in the commit message, as explained
> in Documentation/process/submitting-patches.rst
> That aspect was recently was made more explicit in commit 1f57bd42b77c:
> https://git.kernel.org/linus/1f57bd42b77c
> 
> 
> 
> 
