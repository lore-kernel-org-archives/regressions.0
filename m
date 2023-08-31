Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2A38F74
	for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 12:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA5FC433C7;
	Thu, 31 Aug 2023 12:14:56 +0000 (UTC)
Message-ID: <bb63d5ab-f947-37ae-744c-89d541ba2bcb@xs4all.nl>
Date: Thu, 31 Aug 2023 14:14:55 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Fwd: in linux 6.3.7-200.fc38.x86_64 goes vlc in time to switch tv
 channels to zombie-process
Content-Language: en-US, nl
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Media <linux-media@vger.kernel.org>,
 Linux Stable <stable@vger.kernel.org>
References: <a7f997fc-e7cc-cf67-3ac0-80ed30346511@gmail.com>
 <cdacb249-9d1d-cad9-44a9-ffa7b4b5b887@leemhuis.info>
 <150a5670-8220-5c2f-351c-181ceeddf307@xs4all.nl>
 <c362089e-8cdb-c735-762f-7a56552b68c2@leemhuis.info>
 <3ca18d1d-c286-183b-10fe-f7e9fc42c41a@xs4all.nl>
 <e48a555b-46ec-9f6e-f548-94dbe0577e03@leemhuis.info>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <e48a555b-46ec-9f6e-f548-94dbe0577e03@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/08/2023 14:10, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 31.08.23 13:47, Hans Verkuil wrote:
>> On 31/08/2023 13:00, Thorsten Leemhuis wrote:
>>> On 31.08.23 12:35, Hans Verkuil wrote:
>>>> On 31/08/2023 11:26, Linux regression tracking #update (Thorsten Leemhuis) wrote:
>>>>> [TLDR: This mail in primarily relevant for Linux kernel regression
>>>>> tracking. See link in footer if these mails annoy you.]
>>>>>
>>>>> On 19.06.23 02:24, Bagas Sanjaya wrote:
>>>>>>
>>>>>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>>>>> [...]
>>>>>>
>>>>>> #regzbot introduced: v6.3.5..v6.3.7 https://bugzilla.kernel.org/show_bug.cgi?id=217566
>>>>>> #regzbot title: switching TV channel causes VLC and firmware loading hang
>>>>>
>>>>> #regzbot fix: 7cfab4c9dc09ca3a9d57c187894055a22bdcd
>>>>> #regzbot ignore-activity
>>>>>
>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>>> --
>>>>> Everything you wanna know about Linux kernel regression tracking:
>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>>>> That page also explains what to do if mails like this annoy you.
>>>>
>>>> >From what I can gather from the bugzilla report, whatever the issue was appears
>>>> to be resolved or at least improved in later kernels.
>>>
>>> I'm pretty (but not 100%) sure the initial report in that ticket were
>>> issues caused by a backport of a patch that was reverted later:
>>> https://lore.kernel.org/all/20230609082238.3671398-1-mchehab@kernel.org/
>>
>> Ah, you have a better memory than I have. That might well be the culprit.
>> I didn't check for changes in the dvb core, I should have done that.
>>
>> That patch was introduced in 6.3.7 and reverted in 6.3.9.
>>
>> That doesn't quite match the "#regzbot introduced: v6.3.5..v6.3.7" report,
>> though. I wonder if fedora backported that problematic patch to their v6.3.5
>> release?
> 
> Nope, as it matches (I'd say). The reporter never bisected this and just
> claimed that 6.3.5 was fine and 6.3.7 was broken (and 6.3.6 iirc was
> never tested). In that case we tell regzbot that the culprit is
> somewhere in that range (which is was[1]), as that's the important thing
> to know in the context of the 6.3.y regression (that it also happened in
> mainline is a different story).
> 
> Is this too confusing? Would it be better to handle things differently
> somehow?

Ah, I interpreted "#regzbot introduced" as "this issue was seen in these
kernels", instead of: "it was introduced in one of these kernels".

With that it matches perfectly.

Regards,

	Hans

> 
> Ciao, Thorsten
> 
> [1] $ git rev-list v6.3.5..v6.3.7 --oneline | grep "Fix use-after-free
> on race condition at dvb_frontend"
> 8994830135b3 media: dvb-core: Fix use-after-free on race condition at
> dvb_frontend

