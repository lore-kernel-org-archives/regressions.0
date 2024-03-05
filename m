Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5967E767
	for <regressions@lists.linux.dev>; Tue,  5 Mar 2024 13:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709643661; cv=none; b=kBntF1zlapDdDxJaI1r97VXBTmBNpwIJ/yA+YDfXzbWSAlgvR1Am2PT8Tbw8smf+eJKbgILGyp9Shjj7y0yWXDH54zqhO8FYGk3BnHVWqMtLu/bcG4GZxIJY5h7eTVMLp2fs54pfzoO0mzLLIM9RMn/bXTrPsxSr/969GGw7tuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709643661; c=relaxed/simple;
	bh=CwjQ+PntkYB1UQgwnX/qTQVQutEyGkMYnOYcmoBYE1o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Q58qByM1pkhshrIPC3a00eX6tjWJSIRQqrHIndCU6oOe57JwppC5/ssrSUKz9Gq8v/z/Lo8tix3MQhkggGsVwnCqZH1rtZ6Me/+fa4+0LsNkH2ELfgh0QOdS6kFVKgGBGzJMMsV/H1v6Z2pB1Vx+MiZzHAa45UcqXExK6mzRziQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=kiTcj0XC; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="kiTcj0XC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=C35oy+gp5SOol1L0HxLq0i85k6CXt5kYA/95s0UUOIo=;
	t=1709643659; x=1710075659; b=kiTcj0XCu1NLmYYwO36DQoL7zkIp4gpkmIsX2A790w2hw/E
	eBeSJ2AbtvvJxi/nZxJ7gB7+RqSyyRddhtnGCzp6CXsnVS4ts3drw+XTDU0hDB/VK4cnWuXpy/5Sz
	WlLnngbmBHavZaziWqFFBUiHmuumZDIvjZQkoplTGiMJUrOzen1gkDCJZ7rBbojFV6erdvaQPgeKE
	uNyB7JsKxMvdd18aqcQv95WcjzS9jubTKrvTBz0M5cWdMfJ+JCk6j0fqgE3T0MxdKdeAPhXRJlebT
	zRLm1L+kMBSQNxn1QpEav2DMmc5qHe7zfwA/fsh+YQsFd2+61YaklUm2W+xlcgLQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rhUPf-00026i-8o; Tue, 05 Mar 2024 14:00:55 +0100
Message-ID: <d05966fc-7daa-42a9-a125-ffc1478be430@leemhuis.info>
Date: Tue, 5 Mar 2024 14:00:53 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-wired-lan] [REGRESSION] Intel ICE Ethernet driver in linux
 >= 6.6.9 triggers extra memory consumption and cause continous kswapd* usage
 and continuous swapping
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Dave Ertman <david.m.ertman@intel.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Tony Nguyen <anthony.l.nguyen@intel.com>, Igor Raits <igor@gooddata.com>,
 Daniel Secik <daniel.secik@gooddata.com>, intel-wired-lan@lists.osuosl.org
References: <CAK8fFZ7Xi3=1HFY400firmpRWzHDPsi90cUU5bjOkF00KNZWeA@mail.gmail.com>
 <bce78734-d359-499b-9693-05549e6a73a4@intel.com>
 <CAK8fFZ6PqCwgt1n4iuROs=76esQVSOS-HHL=0eN7+efeKT25Uw@mail.gmail.com>
 <898b6ac8-186d-4675-a1e7-abd78b885d01@leemhuis.info>
 <20240201065726.50a0b1f2@kernel.org>
 <CAK8fFZ6jige-zA5YPMKVf3bB2gCL8WDrY-SCs5EWeJBn5A7YQg@mail.gmail.com>
 <5727309c-6ced-45b8-bb0c-110b3893aa4f@leemhuis.info>
 <CAK8fFZ73=DQrwep_0kdmr9EfjA5CmxKOHcWCyiO7Lg5m1Gqx3A@mail.gmail.com>
 <f41bcb25-0f22-4018-851f-a70ca841cf34@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <f41bcb25-0f22-4018-851f-a70ca841cf34@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1709643659;ffd1eb08;
X-HE-SMSGID: 1rhUPf-00026i-8o

On 22.02.24 10:51, Thorsten Leemhuis wrote:
> On 19.02.24 12:40, Jaroslav Pulchart wrote:
>> If the question is for me then my opinion about it is this:
>>
>> I'm fine with the behaviour of a driver about memory consumption if it
>> is predictable/described with the possibility to change it from
>> default values. My understanding of "predictable" is something like
>> this:
>>
>> The ICE driver is going to
>> * Setup 64 queues per each port, not active included.
>> * Each queue consumes "xxxx MB" amount of kernel memory per each numa node.
>> example: Two 2 ports Intel NICs using ICE driver will consume ~6GB of
>> RAM of each NUMA node, please consider changing the defaults values to
>> avoid OOM :-).
> [...]
> Whatever: to me it still feels like this regression is not handled as
> Linus would want it, but I'm not totally sure and guess I have to admit
> that I'm out of my depth here. I'll let my regression tracking bot
> continue monitor this, but will most likely leave things to the network
> and driver maintainers from here on unless something changes.

FWIW, it seems nobody really cares, so I'll strop tracking this issue:

#regzbot inconclusive: might not qualify as a regression

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.


>> po 19. 2. 2024 v 12:29 odesílatel Thorsten Leemhuis
>> <regressions@leemhuis.info> napsal:
>>>
>>> On 01.02.24 18:19, Jaroslav Pulchart wrote:
>>>>>
>>>>> On Wed, 24 Jan 2024 15:29:38 +0100 Linux regression tracking (Thorsten
>>>>> Leemhuis) wrote:
>>>>>>>> I think that's a bad bisect. There is no reason I could understand for
>>>>>>>> that change to cause a continuous or large leak, it really doesn't make
>>>>>>>> any sense. Reverting it consistently helps? You're not just rewinding
>>>>>>>> the tree back to that point, right? just running 6.6.9 without that
>>>>>>>> patch? (sorry for being pedantic, just trying to be certain)
>>>>>>>
>>>>>>> Reverting just the single bisected commit continuously helps for >=
>>>>>>> 6.6.9 and as well for current 6.7.
>>>>>>> We cannot use any new linux kernel without reverting it due to this
>>>>>>> extra memory utilization.
>>>>>>
>>>>>> Quick query: what's the status wrt to this regression? Looks like
>>>>>> nothing happened in the past week.
>>>>>
>>>>> Is someone working on this? Indeed the commit in question looks
>>>>> harmless but can't argue with the revert helping :S
>>>>
>>>> No clue if someone is working on it,
>>>
>>> Yeah, a quick public status update would be really helpful. And maybe
>>> some debugging tips that might enable Jaroslav to pinpoint the real
>>> problem.
>>>
>>>> however the commit itself is a
>>>> trigger of some other issue.
>>>>
>>>> The analysis of my colleague Igor (see previous email) shows the
>>>> memory consumption is caused by queues of each ice network interface
>>>> (even the unused ones). Our final fix was to lower the queues to 6 for
>>>> used interfaces and 2 of unused interfaces manually.
>>>
>>> Despite the above allow me to ask: Can you live with that workaround?
>>> Ideally of course this should be fixed, but well, the world sometimes is
>>> a tricky place. :-/
>>>
>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>> --
>>> Everything you wanna know about Linux kernel regression tracking:
>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>> If I did something stupid, please tell me, as explained on that page.
>>>
>>> #regzbot poke
>>
>>
> 
> 
