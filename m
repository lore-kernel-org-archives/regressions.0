Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38566FA3
	for <regressions@lists.linux.dev>; Thu,  2 Nov 2023 08:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qyShP-0007hW-SQ; Thu, 02 Nov 2023 09:05:07 +0100
Message-ID: <49ea26fb-a895-4879-b96e-0d3e97eeb713@leemhuis.info>
Date: Thu, 2 Nov 2023 09:05:07 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Userland interface breaks due to hard HFSC_FSC
 requirement
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: stable@vger.kernel.org, netdev@vger.kernel.org
Cc: regressions@lists.linux.dev
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <297D84E3-736E-4AB4-B825-264279E2043C@flyingcircus.io>
 <78f59b5f-33d7-4b5b-9b7c-ee7a4647b35f@leemhuis.info>
In-Reply-To: <78f59b5f-33d7-4b5b-9b7c-ee7a4647b35f@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1698912310;302d834a;
X-HE-SMSGID: 1qyShP-0007hW-SQ

On 01.11.23 20:05, Linux regression tracking #update (Thorsten Leemhuis)
wrote:
> [TLDR: This mail in primarily relevant for Linux kernel regression
> tracking. See link in footer if these mails annoy you.]
> 
> On 06.10.23 10:37, Christian Theune wrote:
>>
>> I upgraded from 6.1.38 to 6.1.55 this morning and it broke my traffic shaping script, leaving me with a non-functional uplink on a remote router.
>> [...]
>> #regzbot introduced: a1e820fc7808e42b990d224f40e9b4895503ac40
> 
> #regzbot fix: net/sched: sch_hfsc: upgrade rt to sc when it becomes a
> inner curve
> #regzbot ignore-activity

Sorry, that had a typo:

#regzbot fix: d80bc191420a2edecb555b
#regzbot ignore-activity

#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
