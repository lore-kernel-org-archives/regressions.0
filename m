Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6350B14A93
	for <regressions@lists.linux.dev>; Wed, 31 May 2023 13:31:53 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q4LvU-0006pr-Nu; Wed, 31 May 2023 15:31:44 +0200
Message-ID: <2826129b-0887-322b-c848-88517294645a@leemhuis.info>
Date: Wed, 31 May 2023 15:31:44 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Sometimes DVB broken with commit 6769a0b7ee0c3b
Content-Language: en-US, de-DE
To: Thomas Voegtle <tv@lio96.de>, linux-kernel@vger.kernel.org,
 Hyunwoo Kim <imv4bel@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <da5382ad-09d6-20ac-0d53-611594b30861@lio96.de>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <da5382ad-09d6-20ac-0d53-611594b30861@lio96.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1685539913;8532e552;
X-HE-SMSGID: 1q4LvU-0006pr-Nu

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 30.05.23 13:12, Thomas Voegtle wrote:
> 
> 
> I have the problem that sometimes my DVB card does not initialize
> properly booting Linux 6.4-rc4.
> This is not always, maybe in 3 out of 4 attempts.
> When this happens somehow you don't see anything special in dmesg, but
> the card just doesn't work.
> 
> Reverting this helps:
> commit 6769a0b7ee0c3b31e1b22c3fadff2bfb642de23f
> [...]

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 6769a0b7ee0c3b31e1b22c3fadff2bfb642d
#regzbot title media: dvb-core: DVB card sometimes does not initialize
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
