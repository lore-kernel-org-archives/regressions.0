Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644DB7C
	for <regressions@lists.linux.dev>; Thu,  8 Sep 2022 10:41:58 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oWEyo-0006R6-O7; Thu, 08 Sep 2022 12:41:54 +0200
Message-ID: <7883f05d-9ed8-2be3-3f9f-4f814aefe55a@leemhuis.info>
Date: Thu, 8 Sep 2022 12:41:54 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: "nvme nvmeX: IO queues not created" with "Amazon.com, Inc. NVMe
 SSD Controller" from 5.19.y (issue bisected) #forregzbot
Content-Language: en-US, de-DE
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-nvme@lists.infradead.org
References: <CAK8fFZ5vajOJGSwA53tU=Y2-jf0rnJWOjkadgqRCTf38bF0YXw@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAK8fFZ5vajOJGSwA53tU=Y2-jf0rnJWOjkadgqRCTf38bF0YXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1662633718;0e0d11de;
X-HE-SMSGID: 1oWEyo-0006R6-O7

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

Hi, this is your Linux kernel regression tracker.

On 07.09.22 08:05, Jaroslav Pulchart wrote:
> Hello,
> 
> I would like to report a regression issue in 5.19.y in NVMe driver.
> 
> The issue is reproducible at AWS EC2 instances with local NVMe storage
> like "r5d.*". Kernel report "IO queues not created":
> [    2.936641] nvme nvme0: 2/0/0 default/read/poll queues  <- EBS volume
> [    2.939493] nvme nvme1: 2/0/0 default/read/poll queues  <- EBS volume
> [    2.940797] nvme nvme2: IO queues not created              <- Local volume
> with 5.19.y (kernel 5.19) and the nvme storage cannot be used.
> 
> I bisected the issue to commit
> "aa41d2fe60ee2e4452b0f9ca9f0f6d80a4ff9f9d" (nvme: set controller
> enable bit in a separate write). Reverting it makes the nvme device
> working again:
> [    3.025599] nvme nvme0: 2/0/0 default/read/poll queues
> [    3.032467] nvme nvme2: 8/0/0 default/read/poll queues
> [    3.040040] nvme nvme1: 2/0/0 default/read/poll queues

CCing the regression mailing list, as it should be in the loop for all
regressions, as explained here:
https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced aa41d2fe60ee2e4
#regzbot title block: nvme: AWS EC2 instances with local NVMe storage fail
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
