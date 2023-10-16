Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896F91A27D
	for <regressions@lists.linux.dev>; Mon, 16 Oct 2023 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qsJEz-0000jB-OX; Mon, 16 Oct 2023 10:46:21 +0200
Message-ID: <a1e49f35-89a0-4906-b7d1-b3eac8b6d3e3@leemhuis.info>
Date: Mon, 16 Oct 2023 10:46:21 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: Kernel 6.5 hangs on shutdown
Content-Language: en-US, de-DE
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
References: <e6d1dae8-e28a-455a-a851-661c825fbdcf@gmail.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <e6d1dae8-e28a-455a-a851-661c825fbdcf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1697445983;899dcb1d;
X-HE-SMSGID: 1qsJEz-0000jB-OX

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 12.10.23 11:37, Bagas Sanjaya wrote:
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
>> I use Dell OptiPlex 7050, and kernel hangs when shutting down the computer. 
>> Similar symptom has been reported on some forums, and all of them are using
>> Dell computers:
>> https://bbs.archlinux.org/viewtopic.php?pid=2124429
>> https://www.reddit.com/r/openSUSE/comments/16qq99b/tumbleweed_shutdown_did_not_finish_completely/
>> https://forum.artixlinux.org/index.php/topic,5997.0.html
>>
>> Tested with various kernel and this bug seems to be caused by commit: 88afbb21d4b36fee6acaa167641f9f0fc122f01b.
> 
> See Bugzilla for the full thread.
> 
> Anyway, I'm adding this regression to be tracked by regzbot:
> 
> #regzbot introduced: 88afbb21d4b36f https://bugzilla.kernel.org/show_bug.cgi?id=217995
> #regzbot title: x86 core fix pull causes shutdown hang on Dell OptiPlex 7050
> #regzbot link: https://bbs.archlinux.org/viewtopic.php?pid=2124429
> #regzbot link: https://www.reddit.com/r/openSUSE/comments/16qq99b/tumbleweed_shutdown_did_not_finish_completely/
> #regzbot link: https://forum.artixlinux.org/index.php/topic,5997.0.html

#regzbot fix: fbe1bf1e5ff1e3b298420d7a8434983ef8d72bd1
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
