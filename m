Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACFC1846
	for <regressions@lists.linux.dev>; Mon, 20 Mar 2023 10:50:38 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1peD64-0000As-53; Mon, 20 Mar 2023 11:50:36 +0100
Message-ID: <0c8579b2-85ef-6add-05c3-cfe73c60694f@leemhuis.info>
Date: Mon, 20 Mar 2023 11:50:35 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 14/17] media: i2c: imx290: Initialize runtime PM before
 subdev
Content-Language: en-US, de-DE
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com>
 <20230116144454.1012-15-laurent.pinchart@ideasonboard.com>
 <20230227175245.GA3728693@roeck-us.net>
 <46d00d1a-9435-62d5-598d-49f0ea916f86@leemhuis.info>
In-Reply-To: <46d00d1a-9435-62d5-598d-49f0ea916f86@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1679309438;085f9d43;
X-HE-SMSGID: 1peD64-0000As-53



On 28.02.23 10:56, Linux regression tracking #update (Thorsten Leemhuis)
wrote:
> [TLDR: This mail in primarily relevant for Linux kernel regression
> tracking. See link in footer if these mails annoy you.]
> 
> On 27.02.23 18:52, Guenter Roeck wrote:
>> ---
>> #regzbot ^introduced 02852c01f6540
>>
> 
> [this mail is just fixing up an accidental use of "^"; this is kinda my
> fault, the regzbot syntax is to confusing; I need to introduce something
> like "regzbot forward" to make things more obvious, I just didn't get
> around to it yet :-/ ]
> 
> #regzbot ^introduced 02852c01f6540
> #regzbot title Build error in drivers/media/i2c/imx290.c if PM support
> is disabled
> #regzbot ignore-activity

#regzbot fix: media: i2c: imx290: fix conditional function definitions
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

