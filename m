Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3188F55
	for <regressions@lists.linux.dev>; Thu, 21 Sep 2023 09:24:57 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qjFvb-000709-7z; Thu, 21 Sep 2023 11:24:55 +0200
Message-ID: <8505fbed-153b-4c68-be8f-d006ba01a8a7@leemhuis.info>
Date: Thu, 21 Sep 2023 11:24:54 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: power button stopped working on lenovo ideapad 5 since
 a855724dc08b
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <7b78505a-a8c9-4770-b283-807581b5edfb@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <7b78505a-a8c9-4770-b283-807581b5edfb@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695288297;656e2e88;
X-HE-SMSGID: 1qjFvb-000709-7z



On 11.09.23 09:50, Thorsten Leemhuis wrote:
> [TLDR: Just adding a regression reported to bko to the tracking]
> 
> Hi, Thorsten here, the Linux kernel's regression tracker. I noticed a
> regression reported in bugzilla.kernel.org that seems to be handled
> there already, nevertheless I'd like to add to the tracking to ensure
> it's doesn't fall through the cracks in the end:
> 
> #regzbot introduced: a855724dc08b
> https://bugzilla.kernel.org/show_bug.cgi?id=217833
> #regzbot title: power button stopped working on lenovo ideapad 5
> #regzbot dup-of:
> https://lore.kernel.org/stable/aa1649b6-b7a8-4fbe-8356-2c856951e283@gmail.com/
> #regzbot ignore-activity

#regzbot unlink:
https://lore.kernel.org/regressions/20230829165627.156542-1-mario.limonciello@amd.com/
#regzbot monitor:
https://lore.kernel.org/regressions/20230829165627.156542-1-mario.limonciello@amd.com/
#regzbot resolve: was apparently a bios problem
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

