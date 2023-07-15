Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776951C39
	for <regressions@lists.linux.dev>; Sat, 15 Jul 2023 12:03:18 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qKdzY-0000T3-6j; Sat, 15 Jul 2023 14:03:16 +0200
Message-ID: <cdd40a39-28ba-3c75-b9d0-b62904cb48a3@leemhuis.info>
Date: Sat, 15 Jul 2023 14:03:15 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 04/27] locking/atomic: make atomic*_{cmp,}xchg optional
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, linux@armlinux.org.uk,
 linux-doc@vger.kernel.org
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20230605070124.3741859-1-mark.rutland@arm.com>
 <20230605070124.3741859-5-mark.rutland@arm.com>
 <32395f1f-19e4-41da-9f67-68c7d21cf9b2@roeck-us.net>
 <a94334d8-0a9a-1cbc-ebfe-1825abfb8307@leemhuis.info>
 <36c1ef3d-603b-574a-ad9d-796964a1410c@roeck-us.net>
 <278dc66d-7cc8-2735-5cd0-c64dc139b10c@leemhuis.info>
In-Reply-To: <278dc66d-7cc8-2735-5cd0-c64dc139b10c@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1689422598;f8773574;
X-HE-SMSGID: 1qKdzY-0000T3-6j

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 08.07.23 15:37, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 08.07.23 15:20, Guenter Roeck wrote:
>> On 7/8/23 06:07, Linux regression tracking (Thorsten Leemhuis) wrote:
>>> On 27.06.23 19:07, Guenter Roeck wrote:
>>> Guenter, please correct me if I'm wrong:
>>>
>>> This is fixed by Arnd's patch "sparc: mark __arch_xchg() as
>>> __always_inline", but that afaics sadly hasn't even reached -next yet.
>>> https://lore.kernel.org/all/20230628094938.2318171-1-arnd@kernel.org/
>>>
>>> Hence adding it to the tracking now that the end of the merge window is
>>> near:
>>> #regzbot ^introduced d12157efc8e083c7
>>> #regzbot title locking/atomic: build error on sparc64:allmodconfig
>>> #regzbot ignore-activity
>> Yes, this is correct.
> Thx for confirming (and also for adding the other regression to the
> tracking). Let me use this opportunity to tell regzbot about the patch
> for this regression, which I forgot to do earlier (sorry!):
> #regzbot monitor:
> https://lore.kernel.org/all/20230628094938.2318171-1-arnd@kernel.org/

Kees applied this: https://git.kernel.org/kees/c/ec7633de404e

#regzbot fix: sparc: mark __arch_xchg() as __always_inline
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
