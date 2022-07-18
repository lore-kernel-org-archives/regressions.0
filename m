Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE1A1C07
	for <regressions@lists.linux.dev>; Mon, 18 Jul 2022 13:46:06 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oDR4V-0003hz-LZ; Mon, 18 Jul 2022 15:46:03 +0200
Message-ID: <96583b04-6ca7-ec2a-7275-4b48b90cb458@leemhuis.info>
Date: Mon, 18 Jul 2022 15:46:03 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <0d81a7c2-46b7-6010-62a4-3e6cfc1628d6@i2se.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [Regression] ext4: changes to mb_optimize_scan cause issues on
 Raspberry Pi #forregzbot
In-Reply-To: <0d81a7c2-46b7-6010-62a4-3e6cfc1628d6@i2se.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1658151966;19fa6a8e;
X-HE-SMSGID: 1oDR4V-0003hz-LZ

[TLDR: I'm adding below regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 18.07.22 15:29, Stefan Wahren wrote:

> i noticed that since Linux 5.18 (Linux 5.19-rc6 is still affected) i'm
> unable to run "rpi-update" without massive performance regression on my
> Raspberry Pi 4 (multi_v7_defconfig + CONFIG_ARM_LPAE). Using Linux 5.17
> this tool successfully downloads the latest firmware (> 100 MB) on my
> development micro SD card (Kingston 16 GB Industrial) with a ext4
> filesystem within ~ 1 min. The same scenario on Linux 5.18 shows the
> following symptoms:
> 
> - download takes endlessly much time and leads to an abort by userspace
> in most cases because of the poor performance
> - massive system load during download even after download has been
> aborted (heartbeat LED goes wild)
> - whole system becomes nearly unresponsive
> - system load goes back to normal after > 10 min
> - dmesg doesn't show anything suspicious
> 
> I was able to bisect this issue:
> 
> commit 077d0c2c78df6f7260cdd015a991327efa44d8ad
> Author: Ojaswin Mujoo <ojaswin@linux.ibm.com>
> Date:   Tue Mar 8 15:22:01 2022 +0530
> 
> ext4: make mb_optimize_scan performance mount option work with extents
> 
> If i revert this commit with Linux 5.19-rc6 the performance regression
> disappears.
> 
> Please ask if you need more information.

Hi, this is your Linux kernel regression tracker. Thanks for the report.
To be sure below issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced 077d0c2c78df6f7260cdd015a991327efa44d8ad
#regzbot title ext4: changes to mb_optimize_scan cause issues on
Raspberry Pi
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
