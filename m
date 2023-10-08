Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036AA15C3
	for <regressions@lists.linux.dev>; Sun,  8 Oct 2023 11:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qpS1R-0005VW-2h; Sun, 08 Oct 2023 13:32:33 +0200
Message-ID: <019424f6-b39b-41d9-bb4a-40bfc8953d98@leemhuis.info>
Date: Sun, 8 Oct 2023 13:32:32 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.6-rc3 (DEBUG_VIRTUAL is unhappy on x86)
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <CAHk-=wjrZgxjHZuXwrGeFnng_whUmtToCWE5GQ+HORhGSeiX8g@mail.gmail.com>
 <ZRhKq6e5nF/4ZIV1@fedora>
 <ccfe98b1-7179-45bb-bc6e-8d921c042eec@leemhuis.info>
In-Reply-To: <ccfe98b1-7179-45bb-bc6e-8d921c042eec@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1696764761;d2b9dc19;
X-HE-SMSGID: 1qpS1R-0005VW-2h

On 01.10.23 14:24, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:
> 
> On 30.09.23 18:26, Hyeonggon Yoo wrote:
>>
>> [...]
>>
>>> Peter Zijlstra (1):
>>>       x86,static_call: Fix static-call vs return-thunk
>>
>> Hello, the commit above caused a crash on x86 kernel with
>> CONFIG_DEBUG_VIRTUAL=y.
> 
> #regzbot ^introduced aee9d30b9744d6775
> #regzbot title x86,static_call: crash on x86 kernel with
> CONFIG_DEBUG_VIRTUAL=y.
> #regzbot ignore-activity

#regzbot monitor:
https://lore.kernel.org/lkml/20231006051801.423973-1-sumit.garg@linaro.org/
#regzbot fix: KEYS: trusted: Remove redundant static calls usage
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
