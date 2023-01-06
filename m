Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3C57B
	for <regressions@lists.linux.dev>; Fri,  6 Jan 2023 08:36:11 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pDiCt-0000Zg-9H; Fri, 06 Jan 2023 09:36:07 +0100
Message-ID: <adb0129f-0570-6a11-7ea6-3ee7d851bb50@leemhuis.info>
Date: Fri, 6 Jan 2023 09:36:06 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Network performance regression with linux 6.1.y. Issue bisected
 to "5eddb24901ee49eee23c0bfce6af2e83fd5679bd" (gro: add support of (hw)gro
 packets to gro stack)
Content-Language: en-US, de-DE
To: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>, edumazet@google.com,
 netdev@vger.kernel.org, lixiaoyan@google.com, pabeni@redhat.com,
 davem@davemloft.net,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: Igor Raits <igor.raits@gooddata.com>
References: <CAK8fFZ5pzMaw3U1KXgC_OK4shKGsN=HDcR62cfPOuL0umXE1Ww@mail.gmail.com>
From: "Linux kernel regression tracking (#adding)" <regressions@leemhuis.info>
Reply-To: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAK8fFZ5pzMaw3U1KXgC_OK4shKGsN=HDcR62cfPOuL0umXE1Ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672994171;705b5794;
X-HE-SMSGID: 1pDiCt-0000Zg-9H

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; all text you find below is based on a few templates
paragraphs you might have encountered already already in similar form.
See link in footer if these mails annoy you.]

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

On 05.01.23 18:37, Jaroslav Pulchart wrote:
> Hello,
> 
> I would like to report a 6.1,y regression in a network performance
> observed when using "git clone".
> 
> BAD: "git clone" speed with kernel 6.1,y:
>    # git clone git@github.com:..../.....git
>    ...
>    Receiving objects:   8% (47797/571306), 20.69 MiB | 3.27 MiB/s
> 
> GOOD: "git clone" speed with kernel 6.0,y:
>    # git clone git@github.com:..../.....git
>    ...
>    Receiving objects:  72% (411341/571306), 181.05 MiB | 60.27 MiB/s
> 
> I bisected the issue to a commit
> 5eddb24901ee49eee23c0bfce6af2e83fd5679bd "gro: add support of (hw)gro
> packets to gro stack". Reverting it from 6.1.y branch makes the git
> clone fast like with 6.0.y.

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 5eddb24901ee49eee23c0bfce6af2e83fd5679bd
#regzbot title net: gro: Network performance regressed
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (see page linked in footer for details).

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
