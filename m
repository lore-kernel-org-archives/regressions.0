Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928F015D7
	for <regressions@lists.linux.dev>; Wed,  9 Mar 2022 08:55:11 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nRs68-0001O4-8Q; Wed, 09 Mar 2022 09:55:08 +0100
Message-ID: <880af98a-fc7a-4a46-6dd4-d5c0c3a0fda3@leemhuis.info>
Date: Wed, 9 Mar 2022 09:55:07 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Linux regressions report for mainline [2022-03-06]
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <164659571791.547857.13375280613389065406@leemhuis.info>
 <871qzby15a.fsf@tynnyri.adurom.net>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <871qzby15a.fsf@tynnyri.adurom.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1646816111;6279b2c2;
X-HE-SMSGID: 1nRs68-0001O4-8Q

On 09.03.22 09:34, Kalle Valo wrote:
> "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
> writes:
>> net: wireless: rtl8723bs (SDIO) - Access point mode causes a kernel panic
>> -------------------------------------------------------------------------
>> https://linux-regtracking.leemhuis.info/regzbot/regression/d58625ad-6f3e-a7d7-b5b4-d18eb16f4082@leemhuis.info/
>> https://lore.kernel.org/regressions/d58625ad-6f3e-a7d7-b5b4-d18eb16f4082@leemhuis.info/
>>
>> By José Ángel Pastrana, 35 days ago; 3 activities, latest 2 days ago.
>> Introduced in 54659ca026e5 (v5.16-rc1)
>>
>> Fix incoming:
>> * staging: rtl8723bs: Fix access-point mode deadlock
>>   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=master&id=8f4347081be32e67b0873827e0138ab0fdaaf450
> 
> Just a small wish for the future, no need to change this report, but for
> staging drivers it would be good use "staging:" instead of "wireless:"
> in the title. This makes it easier for people to see that this is a
> staging driver, not a normal wireless driver.

Yeah, sorry about that, that is actually what I would do normally, but
seems for some reason I got it wrong here.

BTW, for anybody who cares: Jakub had a good idea to handle the "which
subsystem is this about" way better (in short: by checking which lists
are CCed), but I currently lack time to implement that. :-/

Ciao, Thorsten
