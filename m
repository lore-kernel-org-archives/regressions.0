Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D408F55
	for <regressions@lists.linux.dev>; Thu, 21 Sep 2023 09:03:18 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qjFad-0002mp-KL; Thu, 21 Sep 2023 11:03:15 +0200
Message-ID: <e3647a0a-e946-44e3-90b2-f02aec69d1c0@leemhuis.info>
Date: Thu, 21 Sep 2023 11:03:14 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lockdep: Fix static memory detection even more
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Guenter Roeck <linux@roeck-us.net>, Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <ZNep5EcYskP9HtGD@p100>
 <b7526bf6-886f-457a-beba-84ae9f75bc77@roeck-us.net>
 <f8ca4666-1a64-49fe-afa7-47e72c82ef9e@leemhuis.info>
In-Reply-To: <f8ca4666-1a64-49fe-afa7-47e72c82ef9e@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695286998;5915746f;
X-HE-SMSGID: 1qjFad-0002mp-KL

[TLDR: This mail in primarily relevant for Linux regression tracking. A
change or fix related to the regression discussed in this thread was
posted or applied, but it did not use a Closes: tag to point to the
report, as Linus and the documentation call for. Things happen, no
worries -- but now the regression tracking bot needs to be told manually
about the fix. See link in footer if these mails annoy you.]

On 10.09.23 13:20, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:
> On 03.09.23 21:36, Guenter Roeck wrote:
>>
>> On Sat, Aug 12, 2023 at 05:48:52PM +0200, Helge Deller wrote:
>>> On the parisc architecture, lockdep reports for all static objects which
>>> are in the __initdata section (e.g. "setup_done" in devtmpfs,
>>> "kthreadd_done" in init/main.c) this warning:
>>>
>>> 	INFO: trying to register non-static key.
>>>
>> [...]
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>> Fixes: bac59d18c701 ("x86/setup: Fix static memory detection")
>>
>> On loongarch, this patch results in the following backtrace.
>> [...]> # first bad commit: [0a6b58c5cd0dfd7961e725212f0fc8dfc5d96195]
> lockdep: fix static memory detection even more
> 
> Thanks for the report. To be sure the issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced 0a6b58c5cd0dfd7961e725212f0fc8dfc5d961
> #regzbot title lockdep: backtrace on loongarch
> #regzbot ignore-activity

Fix fow in next (as 68ffa230daa0d35b7cce476098433d763d5fd42f)

#regzbot fix: LoongArch: Fix lockdep static memory detection
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
