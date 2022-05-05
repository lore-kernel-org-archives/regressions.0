Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E51363
	for <regressions@lists.linux.dev>; Thu,  5 May 2022 07:43:57 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nmW9M-0004Sz-Q2; Thu, 05 May 2022 09:43:48 +0200
Message-ID: <f7ae9d50-a9dc-3473-903b-28dcd79aaeba@leemhuis.info>
Date: Thu, 5 May 2022 09:43:48 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Jordan Leppert <jordanleppert@protonmail.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "labre@posteo.de" <labre@posteo.de>,
 "davem@davemloft.net" <davem@davemloft.net>
References: <refZ3y2HAXztrRkMMmFbBaF7Dz1CctWgjchSdBtcSNlpk-TL0fqLepVVHfw9qXtIQF9uFzBvFdjQiiX9Jv2zW9oaWej952s1IYwu61d1REo=@protonmail.com>
 <9-Ehc_xXSwdXcvZqKD5aSqsqeNj5Izco4MYEwnx5cySXVEc9-x_WC4C3kAoCqNTi-H38frroUK17iobNVnkLtW36V6VWGSQEOHXhmVMm5iQ=@protonmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Crash on resume after suspend (5.17.5 and 5.15.36)
In-Reply-To: <9-Ehc_xXSwdXcvZqKD5aSqsqeNj5Izco4MYEwnx5cySXVEc9-x_WC4C3kAoCqNTi-H38frroUK17iobNVnkLtW36V6VWGSQEOHXhmVMm5iQ=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1651736637;c141e6e3;
X-HE-SMSGID: 1nmW9M-0004Sz-Q2

[TLDR: I'm adding the regression report below to regzbot, the Linux
kernel regression tracking bot; all text you find below is compiled from
a few templates paragraphs you might have encountered already already
from similar mails.]

Hi, this is your Linux kernel regression tracker. Top-posting for once,
to make this easily accessible to everyone.

This is being dealt with already (great, thx a lot!), nevertheless I'd
like to add it to the regression tracking:

#regzbot ^introduced cbe6c3a8f8f4315b96e46e1a1c70393c06d95a4c
#regzbot title net: atlantic: computer to freeze when resuming after a
suspend
#regzbot ignore-activity
#regzbot monitor https://lore.kernel.org/lkml/87czgt2bsb.fsf@posteo.de/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

On 04.05.22 17:07, Jordan Leppert wrote:
> 
> A changed was added to both version 5.17.5 and 5.15.36 which causes my computer to freeze when resuming after a suspend. This happens every time I suspend and then resume.
> 
> I've bisected the change to commit: cbe6c3a8f8f4315b96e46e1a1c70393c06d95a4c (net: atlantic: invert deep par in pm functions, preventing null derefs)
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-5.17.y&id=cbe6c3a8f8f4315b96e46e1a1c70393c06d95a4c
> 
> My computer details that might be relevant:
> OS: Arch Linux
> CPU: AMD 5950X
> GPU: AMD 6800XT
> 
> As expected I have an Aquantia ethernet controller listed in lspci:
> 
> 05:00.0 Ethernet controller: Aquantia Corp. AQC107 NBase-T/IEEE 802.3bz Ethernet Controller [AQtion] (rev 02)
> 
> Please let me know if there is any more info I can give that will help.
> 
> Regards,
> Jordan
> 
> 
