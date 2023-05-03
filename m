Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B9123D2
	for <regressions@lists.linux.dev>; Wed,  3 May 2023 22:45:09 +0000 (UTC)
Received: from [IPV6:2405:201:0:21ea:73f6:2283:f432:3936] (unknown [IPv6:2405:201:0:21ea:73f6:2283:f432:3936])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: shreeya)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3BC6B660217A;
	Wed,  3 May 2023 23:45:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683153908;
	bh=xa9RqVEZAFfXo6LI57+RsSghKqRAbP9RvooqfWivpOg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UaZYX/71ORLbFhz6DsDLT6Lzq9jKpbQshhkTAZFPJ6plk3XJ8V9uFwyEs2UgeHvNt
	 P27rUAcqse8G43d339/X4jwqUEz67dNVAcxBhda4SisSnpr7q6gWh6XyClOuoZpCVB
	 yk06zzaQoOAqo8Ek9vLnG4+iYp+VhKjgW3OJ6vIO+ZdMeIeISrNiqCKeBA63fbu3BI
	 tRTW2K2Ehv84e+SgcNuyd9n7Ufk3IHtSnhp2hKLFZXiFglLYMtteRDpy1SrDtvj4PT
	 2TgyrgJ+Mo3/gcha+iYcszfiQgGAVettUfRsvi619x90Z9HHj7SuWnQg1239tVrNaK
	 8X+HXGUK4+vBA==
Message-ID: <4b896dd9-ab61-ce05-9a73-76b648c1c0bd@collabora.com>
Date: Thu, 4 May 2023 04:15:04 +0530
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: installing dependencies for regzbot
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Gustavo Padovan <gustavo.padovan@collabora.com>
Cc: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo_Navarro?= <ricardo.canuelo@collabora.com>,
 Guillaume Charles Tucker <guillaume.tucker@collabora.com>
References: <38108ca4-eaea-98bd-882f-5fdd96516b6f@collabora.com>
 <15758064-8d46-9be7-1c32-e6e15bcb2443@leemhuis.info>
 <2ef89bf3-d1cc-7362-a07f-a47f29c24dcb@collabora.com>
 <983b10b9-ab90-99a4-d3a0-d6d9cd572739@leemhuis.info>
 <6e08beab-0229-e1f4-33c0-7ab072803a90@collabora.com>
 <04a2d855-be89-906b-dfc4-44dc263d485c@collabora.com>
 <547b3859-fbc7-a678-b4c1-91e1198acb90@leemhuis.info>
From: Shreeya Patel <shreeya.patel@collabora.com>
In-Reply-To: <547b3859-fbc7-a678-b4c1-91e1198acb90@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thorsten,

On 02/05/23 17:34, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 29.04.23 14:16, Gustavo Padovan wrote:
>> Meet Shreeya (in CC). She is an engineer in our Kernel team and will be
>> working on validating and reporting regressions.
> Hi Shreeya, nice to meet you! If you need help from my side, feel free
> to reach out in private as well. Mailing list might usually be the
> better, but sometimes doing things in private is better. :-D Especially
> if there might be some misunderstanding or something like that.


Nice to meet you too :)
I will surely reach out to you if there is something important to discuss.
And now since we have started to use regzbot with all the regressions 
that we report,
any feedback from you will be really helpful for us to improve things.

Thanks for your all your comments on the previous reports.


Regards,
Shreeya Patel

>> Thanks for the feedback you gave us on the mailing list. That will help
>> us shape the report format and process to match what you and the
>> community expect. She will follow up on this soon.
> Okay!
>
> Ciao, Thorsten
>
>> Le 20/04/2023 à 11:21, Gustavo Padovan a écrit :
>>> HI Thorsten,
>>>
>>> Lot of things going on here too. I am quite busy prior our company
>>> meetup in 2 weeks. The long delay doesn't mean I am not interested in
>>> this. I am still quite interested. Things will calm down in 3 weeks
>>> hopefully.
>>>
>>> My answers are inline.
>>>
>>> On 4/11/23 07:55, Thorsten Leemhuis wrote:
>>>> On 07.04.23 14:40, Gustavo Padovan wrote:
>>>>> Thanks for the reply! I am happy to start collaborating with you.
>>>> Me too! Just be warned, I'm currently kinda swamped already in work wrt
>>>> to regression tracking intels – the number of tracked attention that
>>>> need human attention from me seems to increase since a few months. :-/
>>>> That's why I likely will be sometimes a bit slow to respond. :-/
>>> Thanks a lot for you leadership and work there!
>>>
>>>>> Le 2023-04-03 à 07 h 44, Thorsten Leemhuis a écrit :
>>>>>> On 31.03.23 14:38, Gustavo Padovan wrote:
>>>>>>> We are interested in contributed to regzbot,
>>>>>> Ugh, on one hand that is nice to hear.
>>>>>>
>>>>>> On the other hand it's kinda scary for me and I want to hide under a
>>>>>> pillow, as I very well know: the code I wrote is crap. Thing is, I
>>>>>> have
>>>>>> no real background in programming. I just saw the need for such a tool
>>>>>> and started putting one together. Some of the things I did I already
>>>>>> knew were bad when I realized them. Then there are quite a few things
>>>>>> where I over time learned that I did something really stupid. And
>>>>>> there
>>>>>> is likely a ton of things where I don't know yet that I did something
>>>>>> stupid. :-/
>>>>>>
>>>>>> But well, that's how it is sometimes, as despite this regzbot
>>>>>> proved to
>>>>>> be useful.
>>>>> Exactly. It is very useful. Code can always be improved, but the
>>>>> delivered value of regzbot is very good already.
>>>> Nice to hear -- especially as I'm unhappy about a quite a few aspects of
>>>> regzbot myself, but haven't found proper time to improve things
>>>> recently. :-/ But if everything goes well the time situation should
>>>> improve now (is already did somewhat).
>>>>
>>>>> [...]
>>>>>> You want this one:
>>>>>> https://github.com/python-bugzilla/python-bugzilla
>>>>>> https://pypi.org/project/python-bugzilla/
>>>>> Thanks! It worked,
>>>> Great!
>>>>
>>>>>>> Beyond the setup issue, I am insterested in contributing support to
>>>>>>> export a list of all tracked regressions in a way we can consume the
>>>>>>> data to match with regressions found by KernelCI, so then we can
>>>>>>> filter
>>>>>>> out what still needs to be reported to regzbot. We are writing a
>>>>>>> little
>>>>>>> tracker. We can show it to you soon if you want.
>>>>>> Sounds great. Especially as I also have a "export" function on my
>>>>>> mental
>>>>>> to do list as well:  I want to enable the stable team to check for
>>>>>> tracked regressions before they backporting commits (never thought
>>>>>> about
>>>>>> how to actually do this, but I guess all they need is a list of
>>>>>> commits
>>>>>> which are known to have regressions and a link to the report or the
>>>>>> tracked entry in regzbot).
>>>>>>
>>>>>> Anyway: If the regzbot code gets to scary for you and you abandon your
>>>>>> plan, please let me know. I have quite a few cleanups I want to do
>>>>>> (while implementing a few missing features), but the problem is: this
>>>>>> cat herding that regression tracking itself is keeps me so busy,
>>>>>> that I
>>>>>> didn't any really time to work on regzbot in the past few months, as I
>>>>>> officially only work on regression tracking for 3 to 4 hours a day
>>>>>> (and
>>>>>> didn't find time to fix some bugs that plague me every day). But a few
>>>>>> things that kept me busy are finished now, so hopefully I find time to
>>>>>> work on the code again to make things less scary. And in case you give
>>>>>> up at some point I might write something myself for your use-case.
>>>>> regzbot is our current process to track regressions in the kernel. From
>>>>> my side, we don't want to abandon this task.
>>>>> Our goal is experiment with  integrating regressions found by KernelCI
>>>>> into such a process. Right now, we are not doing as much regression
>>>>> tracking as we would like in KernelCI because the manual work overhead
>>>>> is high.
>>>> Yeah, tell me about it. :-D
>>>>
>>>>> For that reason we started some experiments at:
>>>>>
>>>>> https://kernel.pages.collabora.com/kernelci-regressions-tracker/ -
>>>>> it is
>>>>> really experimental and we want to drop it (or reimplement it) soon
>>>>>
>>>>> code at
>>>>> https://gitlab.collabora.com/kernel/kernelci-regressions-tracker/
>>>> /me will take a look at it later
>>>>
>>>>> As the number of regressions reported by KernelCI (and the community)
>>>>> grows, we need to understand how to handle those flows in KernelCI. So
>>>>> right now we are asking a bunch of questions: eg How can I pull data
>>>>> from some regzbot interface to learn about existing regressions? How
>>>>> can
>>>>> we leverage the Regressions db schema from KCIDB to store regressions
>>>>> connected to test results, bisection reports, etc?
>>>> Sounds like lots of work ahead.
>>>>
>>>> While at it, please let me add something to your list. How do you plan
>>>> to detect things like "this is a regression that the CI found, but it's
>>>> more of a theoretical issue that is unlikely to happen in the wild and
>>>> thus likely will be ignored by kernel developers"? I'd prefer to not
>>>> have those in regzbot, as they distract from other issues -- both my
>>>> time when trying to stay on top of things and the attention of those
>>>> that look at the list of tracked issues.
>>> This is great input you are giving us and I think it part of the work
>>> to make KernelCI data as relevant as possible to kernel developers.
>>>
>>> For now our plan is to report to regzbot only after thoroughly manual
>>> validation by our team at Collabora, so we would be starting with a
>>> handful regressions being sent at first.
>>>
>>> As we do this, we learn more about what it takes to evaluate KernelCI
>>> regressions and track them and more options can come to the table.
>>>
>>>  From the top of my mind some things that we could do in the future are:
>>>
>>> * mark in regzbot that the source of the regression report is a CI
>>> system, then the data could be treated different (like filtered out)
>>> in the regzbot reports.
>>>
>>> * continuously engage with maintainer to review what tests are being
>>> run for their subsystem to make sure we are running only relevant
>>> stuff. Ideally the maintainers and developers should take care of
>>> which tests KernelCI runs, but we are not quite there yet.
>>>
>>>>> Hopefully, I'll have an MR for you soon.
>>>> /me will soon reply to the other mail with the MR that arrived in
>>>> between
>>> That is okay. I still need to debug further the issue I reported to
>>> you. I feel we are making progress in this discussion anyway. So that
>>> is good.
>>>
>>> Thanks again!
>>>
>>> Best Regards,
>>>
>>> Gustavo
>>>
