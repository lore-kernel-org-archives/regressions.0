Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A95628F2
	for <regressions@lists.linux.dev>; Mon, 13 Mar 2023 14:46:01 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pbjR1-0004Xj-G0; Mon, 13 Mar 2023 15:45:59 +0100
Message-ID: <2a21917d-2459-e8ce-d211-f8b23d0f59ec@leemhuis.info>
Date: Mon, 13 Mar 2023 15:45:59 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [regression] Bug 217042 - mdb_copy produces a corrupted database
 on btrfs
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <efc853aa-0592-e43d-3ad1-c42d33f0ab6b@leemhuis.info>
In-Reply-To: <efc853aa-0592-e43d-3ad1-c42d33f0ab6b@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1678718761;d8af2ac6;
X-HE-SMSGID: 1pbjR1-0004Xj-G0

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 16.02.23 10:48, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:
> [TLDR: Just adding a regression reported to bko to the tracking]
> 
> I noticed a regression reported in bugzilla.kernel.org that seems to be
> handled there already, nevertheless I'd like to add to the tracking to
> ensure it's doesn't fall through the cracks in the end:
> 
> #regzbot introduced: 51bd9563b6783
> https://bugzilla.kernel.org/show_bug.cgi?id=217042
> #regzbot title: btrfs: mdb_copy produces a corrupted database
> #regzbot ignore-activity
> 
> See the ticket for details, there were a few replies already.

#regzbot fix: btrfs: fix dio continue after short write due to buffer
page fault
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
