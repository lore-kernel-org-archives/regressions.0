Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE8318B0C
	for <regressions@lists.linux.dev>; Fri, 22 Sep 2023 11:06:48 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qjdzi-0006uf-UB; Fri, 22 Sep 2023 13:06:46 +0200
Message-ID: <e8b76fae-780a-470e-8ec4-c6b650793d10@leemhuis.info>
Date: Fri, 22 Sep 2023 13:06:46 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [bug report] blktests srp/002 hang
Content-Language: en-US, de-DE
To: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
References: <dsg6rd66tyiei32zaxs6ddv5ebefr5vtxjwz6d2ewqrcwisogl@ge7jzan7dg5u>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <dsg6rd66tyiei32zaxs6ddv5ebefr5vtxjwz6d2ewqrcwisogl@ge7jzan7dg5u>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695380808;0fd3fc7c;
X-HE-SMSGID: 1qjdzi-0006uf-UB

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 21.08.23 08:46, Shinichiro Kawasaki wrote:
> I observed a process hang at the blktests test case srp/002 occasionally, using
> kernel v6.5-rcX. Kernel reported stall of many kworkers [1]. PID 2757 hanged at
> inode_sleep_on_writeback(). Other kworkers hanged at __inode_wait_for_writeback.
> 
> The hang is recreated in stable manner by repeating the test case srp/002 (from
> 15 times to 30 times).
> 
> I bisected and found the commit 9b4b7c1f9f54 ("RDMA/rxe: Add workqueue support
> for rxe tasks") looks like the trigger commit. When I revert it from the kernel
> v6.5-rc7, the hang symptom disappears. I'm not sure how the commit relates to
> the hang. Comments will be welcomed.
> […]

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 9b4b7c1f9f54
#regzbot title RDMA/rxe: occasionally pocess hang at the blktests test
case srp/002
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
