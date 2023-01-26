Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945521FA1
	for <regressions@lists.linux.dev>; Thu, 26 Jan 2023 12:59:35 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pL1qj-00066P-Rq; Thu, 26 Jan 2023 13:59:29 +0100
Message-ID: <962dfb15-b259-b764-3085-8d6a942f5abb@leemhuis.info>
Date: Thu, 26 Jan 2023 13:59:29 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Google Pixelbook EVE, no sound in kernel 6.1.x
Content-Language: en-US, de-DE
To: Sasa Ostrouska <casaxa@gmail.com>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Lukasz Majczak <lma@semihalf.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <CALFERdzKUodLsm6=Ub3g2+PxpNpPtPq3bGBLbff=eZr9_S=YVA@mail.gmail.com>
From: "Linux kernel regression tracking (#adding)" <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CALFERdzKUodLsm6=Ub3g2+PxpNpPtPq3bGBLbff=eZr9_S=YVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1674737975;ba3f78bd;
X-HE-SMSGID: 1pL1qj-00066P-Rq

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

On 23.01.23 21:44, Sasa Ostrouska wrote:
> Hi all, sorry if I put somebody in CC who is not the correct one. I
> have a google pixelbook and using it with Fedora 37.
> The last few kernels supplied by fedora 37, 6.1.6, 6.1.7 but also some
> earlier have no working sound.
> I see the last kernel for me with working sound is 6.0.18.
>

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced v6.0..v6.1
#regzbot title sound: sound stopped working on Google Pixelbook EVE
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
