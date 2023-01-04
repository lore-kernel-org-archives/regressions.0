Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6B47EA
	for <regressions@lists.linux.dev>; Wed,  4 Jan 2023 10:26:44 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pD0yo-0003x4-NF; Wed, 04 Jan 2023 11:26:42 +0100
Message-ID: <90148f55-62f5-cd9e-4d38-33ad38bab5ff@leemhuis.info>
Date: Wed, 4 Jan 2023 11:26:41 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [GIT PULL] acl updates for v6.2
Content-Language: en-US, de-DE
To: Christian Brauner <brauner@kernel.org>
Cc: hooanon05g@gmail.com, linux-fsdevel@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20221212111919.98855-1-brauner@kernel.org>
 <29161.1672154875@jrobl> <20221227183115.ho5irvmwednenxxq@wittgenstein>
 <16855.1672793848@jrobl> <32ce10e7-62ff-92f1-cac4-00037a2110a5@leemhuis.info>
 <20230104101443.knstpogkznjlz6qh@wittgenstein>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20230104101443.knstpogkznjlz6qh@wittgenstein>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672828004;d5ecb87a;
X-HE-SMSGID: 1pD0yo-0003x4-NF



On 04.01.23 11:14, Christian Brauner wrote:
> On Wed, Jan 04, 2023 at 11:04:06AM +0100, Linux kernel regression tracking (#info) wrote:
>> [TLDR: This mail in primarily relevant for Linux kernel regression
>> tracking. See link in footer if these mails annoy you.]
>>
>> On 04.01.23 01:57, hooanon05g@gmail.com wrote:
>>> Christian Brauner:
>>>> On Wed, Dec 28, 2022 at 12:27:55AM +0900, J. R. Okajima wrote:
>>> 	:::
>>>>> I've found a behaviour got changed from v6.1 to v6.2-rc1 on ext3 (ext4).
>>>>
>>>> Hey, I'll try to take a look before new years.
>>>
>>> Now it becomes clear that the problem was on my side.
>>> The "acl updates for v6.2" in mainline has nothing to deal with it.
>>> Sorry for the noise.
>>
>> In that case:
>>
>> #regzbot resolve: turns out it was a local problem and not regression in
>> the kernel
> 
> When and how did regzbot start tracking this? None of the mails that
> reported this issue to me contained any reference to regzbot.
> 
> If something is currently classified as a regression it'd be good to let
> the responsible maintainers and developers know that.

That happens these days (again) -- since five, too be more precise, as I
recently (again) changed how to handle that mails (some maintainers
hated getting mails about adding reports to the tracking, but I recently
 decided they have to deal with that locally).

But the mail that added this thread to the tracking was before that,
sorry. :-/
https://lore.kernel.org/all/2aa5cc7e-ca00-22a7-5e2f-7eb73556181e@leemhuis.info/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
