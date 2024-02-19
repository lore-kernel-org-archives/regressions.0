Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1682CCDF
	for <regressions@lists.linux.dev>; Mon, 19 Feb 2024 11:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708342201; cv=none; b=ad5rqSQoZV5TTCv2g4SF0Slopz9ir+B+GUB2GOZE2X+ws2htEh7rJF2EoeD3YC3fqRLFy3/ywUBbO26PXsmuaG9JUepaLiB4yaCiSC4X7W2n63NwlrQnJvWKCL/4VTigLHp0Uag+tVOmB1LqVEuqEJNWVfaXcFzb2W35Q4TGPRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708342201; c=relaxed/simple;
	bh=k8bNQK6KKfEbdCEoBu/AmOf9cDZ0PlVe99MQWH8wsiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVBsO5RKFvMTxZPpDWMicMajWiDBjGNBlB3RM9U2Kmy5p65XKN3d7bQtMfKLQlUXTz2R9a52tGZ9KgfX+1QZkscwQjye1nhsHZfUQNK/AZO/k3BnnWff4id34axPqq8j9OFu/tKI0IsJifV9T0p5eWaeR9tMsTenxVmPfXxuAx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rc1qN-0006Ut-2r; Mon, 19 Feb 2024 12:29:55 +0100
Message-ID: <5727309c-6ced-45b8-bb0c-110b3893aa4f@leemhuis.info>
Date: Mon, 19 Feb 2024 12:29:54 +0100
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
To: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>,
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
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAK8fFZ6jige-zA5YPMKVf3bB2gCL8WDrY-SCs5EWeJBn5A7YQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1708342199;7611d165;
X-HE-SMSGID: 1rc1qN-0006Ut-2r

On 01.02.24 18:19, Jaroslav Pulchart wrote:
>>
>> On Wed, 24 Jan 2024 15:29:38 +0100 Linux regression tracking (Thorsten
>> Leemhuis) wrote:
>>>>> I think that's a bad bisect. There is no reason I could understand for
>>>>> that change to cause a continuous or large leak, it really doesn't make
>>>>> any sense. Reverting it consistently helps? You're not just rewinding
>>>>> the tree back to that point, right? just running 6.6.9 without that
>>>>> patch? (sorry for being pedantic, just trying to be certain)
>>>>
>>>> Reverting just the single bisected commit continuously helps for >=
>>>> 6.6.9 and as well for current 6.7.
>>>> We cannot use any new linux kernel without reverting it due to this
>>>> extra memory utilization.
>>>
>>> Quick query: what's the status wrt to this regression? Looks like
>>> nothing happened in the past week.
>>
>> Is someone working on this? Indeed the commit in question looks
>> harmless but can't argue with the revert helping :S
> 
> No clue if someone is working on it,

Yeah, a quick public status update would be really helpful. And maybe
some debugging tips that might enable Jaroslav to pinpoint the real
problem.

> however the commit itself is a
> trigger of some other issue.
> 
> The analysis of my colleague Igor (see previous email) shows the
> memory consumption is caused by queues of each ice network interface
> (even the unused ones). Our final fix was to lower the queues to 6 for
> used interfaces and 2 of unused interfaces manually.

Despite the above allow me to ask: Can you live with that workaround?
Ideally of course this should be fixed, but well, the world sometimes is
a tricky place. :-/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke
