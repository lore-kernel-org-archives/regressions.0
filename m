Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFB972
	for <regressions@lists.linux.dev>; Thu, 25 Nov 2021 11:11:25 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mqCex-0000re-KO; Thu, 25 Nov 2021 12:11:23 +0100
Message-ID: <e31959ff-8430-85d1-4a25-28b0fac772be@leemhuis.info>
Date: Thu, 25 Nov 2021 12:11:22 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: kernel 5.15.1: AMD RX 6700 XT - Fails to resume after screen
 blank
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Mark Boddington <lkml@badpenguin.co.uk>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <dbadfe41-24bf-5811-cf38-74973df45214@badpenguin.co.uk>
 <87711d0d-b53c-29c7-b96f-b87d405733ff@leemhuis.info>
In-Reply-To: <87711d0d-b53c-29c7-b96f-b87d405733ff@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1637838685;c8d8f89b;
X-HE-SMSGID: 1mqCex-0000re-KO



On 11.11.21 07:09, Thorsten Leemhuis wrote:
> On 10.11.21 17:27, Mark Boddington wrote:
>>
>> I run the mainline Linux kernel on Ubuntu 20.04, built from
>> https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.15.1/
>>
>> There appears to be a regression in 5.15.1 which causes the GPU to fail
>> to resume after power saving.
>>
>> Could it be this change??:
> 
> Mark, thx for CCing the regression list. To be sure this issue doesn't
> fall through the cracks unnoticed, I'm adding it to regzbot, the Linux
> kernel regression tracking bot:
> 
> #regzbot ^introduced f17dca0ab3f38b19c0f1b935f417f62d4a528723
> #regzbot ignore-activity
> 
> FYI: I removed everyone else and the other lists from the To or CC to
> avoid noise, as this mail is meaningless for them.
> 
> Ciao, Thorsten, your Linux kernel regression tracker.
> 
> P.S.: If you want to know more about regzbot, check out its
> web-interface, the getting start guide, and/or the references documentation:
> 
> https://linux-regtracking.leemhuis.info/regzbot/
> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md
> 
> But note, regzbot is doing its first field-testing now and thus still
> has some bugs. Adding this regression will help be to find them, hence
> feel free to ignore it and any errors in the web-ui.

#regzbot dup-of:
https://lore.kernel.org/all/99797fb7-76eb-9d86-ad2f-591243eca404@badpenguin.co.uk/
#regzbot ignore-activity
