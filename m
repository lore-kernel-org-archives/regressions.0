Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B737A46A8
	for <regressions@lists.linux.dev>; Mon,  9 May 2022 06:59:07 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nnxMH-0005y9-Om; Mon, 09 May 2022 08:59:05 +0200
Message-ID: <9710730b-4f53-6428-43bd-6027e0424e07@leemhuis.info>
Date: Mon, 9 May 2022 08:59:05 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <refZ3y2HAXztrRkMMmFbBaF7Dz1CctWgjchSdBtcSNlpk-TL0fqLepVVHfw9qXtIQF9uFzBvFdjQiiX9Jv2zW9oaWej952s1IYwu61d1REo=@protonmail.com>
 <9-Ehc_xXSwdXcvZqKD5aSqsqeNj5Izco4MYEwnx5cySXVEc9-x_WC4C3kAoCqNTi-H38frroUK17iobNVnkLtW36V6VWGSQEOHXhmVMm5iQ=@protonmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Crash on resume after suspend (5.17.5 and 5.15.36)
In-Reply-To: <9-Ehc_xXSwdXcvZqKD5aSqsqeNj5Izco4MYEwnx5cySXVEc9-x_WC4C3kAoCqNTi-H38frroUK17iobNVnkLtW36V6VWGSQEOHXhmVMm5iQ=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1652079547;177352aa;
X-HE-SMSGID: 1nnxMH-0005y9-Om

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

Hi, this is your Linux kernel regression tracker. Top-posting for once,
to make this easily accessible to everyone.

To be sure below issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced cbe6c3a8f8f4
#regzbot title net: atlantic: Crash on resume after suspend (5.17.5 and
5.15.36)
#regzbot ignore-activity
#regzbot monitor: https://lore.kernel.org/all/87bkw8dfmp.fsf@posteo.de/

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replied to), as the kernel's
documentation call for; above page explains why this is important for
tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

On 04.05.22 17:07, Jordan Leppert wrote:
> Hi,
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
