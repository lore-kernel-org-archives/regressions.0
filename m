Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D526FAA
	for <regressions@lists.linux.dev>; Wed, 22 Mar 2023 13:59:45 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pez07-0003Q5-2u; Wed, 22 Mar 2023 14:59:39 +0100
Message-ID: <d1c9a828-bb20-bfa8-fb37-bbc3f57b4cfd@leemhuis.info>
Date: Wed, 22 Mar 2023 14:59:38 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: iwlwifi frequent drops between v6.2-rc3 and v6.3-rc1
Content-Language: en-US, de-DE
To: Vegard Nossum <vegard.nossum@oracle.com>,
 Alexander Wetzel <alexander@wetzel-home.de>, Thomas Mann
 <rauchwolke@gmx.net>, linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes.berg@intel.com>, regressions@lists.linux.dev
References: <9d11ed29-1114-055d-5b26-0899a5fc0d7f@oracle.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <9d11ed29-1114-055d-5b26-0899a5fc0d7f@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1679493585;98c6c797;
X-HE-SMSGID: 1pez07-0003Q5-2u

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 17.03.23 09:53, Vegard Nossum wrote:
> 
> Somewhere between e8f60cd7db24 (v6.2-rc3) and 2eb29d59ddf0 (v6.3-rc1) my
> wifi started dropping a lot. I'm using iwlwifi and I've checked the old
> logs that the firmware hasn't changed:

Thanks for the report. Due to Alexander's reply I hesitated first to add
this regression to the tracking, as I wondered that this might solve
itself quickly. But well, nothing happened since then, so I guess I
better add it to ensure the issue doesn't fall through the cracks:

#regzbot ^introduced e8f60cd7db24..2eb29d59ddf0
#regzbot title iwlwifi: frequent drops between v6.2-rc3 and v6.3-rc1
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
