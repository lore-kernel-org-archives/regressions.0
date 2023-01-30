Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCB12560
	for <regressions@lists.linux.dev>; Mon, 30 Jan 2023 12:56:01 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pMThV-000108-VP; Mon, 30 Jan 2023 13:55:58 +0100
Message-ID: <f7e7da82-2050-1866-e5b4-b7e9ea778b89@leemhuis.info>
Date: Mon, 30 Jan 2023 13:55:57 +0100
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
From: "Linux kernel regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>, edumazet@google.com,
 netdev@vger.kernel.org, lixiaoyan@google.com, pabeni@redhat.com,
 davem@davemloft.net,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: Igor Raits <igor.raits@gooddata.com>
Reply-To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <CAK8fFZ5pzMaw3U1KXgC_OK4shKGsN=HDcR62cfPOuL0umXE1Ww@mail.gmail.com>
 <adb0129f-0570-6a11-7ea6-3ee7d851bb50@leemhuis.info>
In-Reply-To: <adb0129f-0570-6a11-7ea6-3ee7d851bb50@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1675083362;02bc8653;
X-HE-SMSGID: 1pMThV-000108-VP

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 06.01.23 09:36, Linux kernel regression tracking (#adding) wrote:

> On 05.01.23 18:37, Jaroslav Pulchart wrote:
>> Hello,
>>
>> I would like to report a 6.1,y regression in a network performance
>> observed when using "git clone".
>>
>> BAD: "git clone" speed with kernel 6.1,y:
>>    # git clone git@github.com:..../.....git
>>    ...
>>    Receiving objects:   8% (47797/571306), 20.69 MiB | 3.27 MiB/s
>>
>> GOOD: "git clone" speed with kernel 6.0,y:
>>    # git clone git@github.com:..../.....git
>>    ...
>>    Receiving objects:  72% (411341/571306), 181.05 MiB | 60.27 MiB/s
>>
>> I bisected the issue to a commit
>> 5eddb24901ee49eee23c0bfce6af2e83fd5679bd "gro: add support of (hw)gro
>> packets to gro stack". Reverting it from 6.1.y branch makes the git
>> clone fast like with 6.0.y.
> 
> Thanks for the report. To be sure the issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced 5eddb24901ee49eee23c0bfce6af2e83fd5679bd
> #regzbot title net: gro: Network performance regressed
> #regzbot ignore-activity

#regzbot fix: 7871f54e3dee

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

#regzbot ignore-activity
