Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096D87C
	for <regressions@lists.linux.dev>; Tue,  4 Apr 2023 10:52:37 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pjeHD-0006W9-0Q; Tue, 04 Apr 2023 12:52:35 +0200
Message-ID: <4ba7343f-6f0b-1833-7deb-795fee9fd6f1@leemhuis.info>
Date: Tue, 4 Apr 2023 12:52:34 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [6.2 regression][bisected]discard storm on idle since
 v6.1-rc8-59-g63a7cb130718 discard=async
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: linux-btrfs@vger.kernel.org
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <Y/+n1wS/4XAH7X1p@nz>
 <fcba79c6-7d1b-0e17-7c75-42e25fedae69@leemhuis.info>
In-Reply-To: <fcba79c6-7d1b-0e17-7c75-42e25fedae69@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1680605558;735919f9;
X-HE-SMSGID: 1pjeHD-0006W9-0Q

On 02.03.23 09:04, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:
> On 01.03.23 20:30, Sergei Trofimovich wrote:
>> Hi btrfs maintainers!
>>
>> Tl;DR:
>>
>>   After 63a7cb13071842 "btrfs: auto enable discard=async when possible" I
>>   see constant DISCARD storm towards my NVME device be it idle or not.
>>
>>   No storm: v6.1 and older
>>   Has storm: v6.2 and newer
> 
> Thanks for the report. To be sure the issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced 63a7cb13071842
> #regzbot title btrfs: DISCARD storm towards NVME device be it idle or not
> #regzbot ignore-activity

#regzbot monitor:
https://lore.kernel.org/all/CAHmG9huwQcQXvy3HS0OP9bKFxwUa3aQj9MXZCr74emn0U+efqQ@mail.gmail.com/
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

