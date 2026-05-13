Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3A336F8EF;
	Wed, 13 May 2026 08:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778659441; cv=none; b=sHEZEs9Ay06GdSKde/QhNwRKSd3iUFX+aAieT4/OdNWzONnOtBobxl+ES4OyPOGcaFX+kuWqgzL/Kumr0k0h0HAitEt9WSEcMh/cXvhuXVCybUQSddhFsA1LDYa2BhrhkXgqw0LI3FknUz1A2puGDWsI/f7pPFU9yZLa8ZsZtZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778659441; c=relaxed/simple;
	bh=8aslmoU9ZNwzYEyEFXaoI6N0HmTDIaLZg0h+y2eVpW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nQQGCCqd9x+Z5qpzNZH+cU6p808Rb6S44aeGXuzu/H30xks6TL+byoDGi8es5BaT0ThZb9sOeGKu61cFKdeHBxrdd6hrSl0q9Y40wrLvHRelTDPeezkFP8mBNfcObSPW+E2+/6ZLsgbpdr3nNSOr56/KOlO2yQD/O0ZDjOmHHxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZsMb/sMg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZsMb/sMg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D29C2BCC6;
	Wed, 13 May 2026 08:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778659441;
	bh=8aslmoU9ZNwzYEyEFXaoI6N0HmTDIaLZg0h+y2eVpW4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZsMb/sMg3Gm3mZ70hzn0pOYZCI8a8Y74Bu+b/23rt7azu0v6Whcde7xUqMJFNX6t6
	 M6omMOjB3l++ay8smzXy1NM8J2N2EcJuVZEkyRkQL29IYf4y63fUq/adTab5N7ETI1
	 wm3V7CkxinHu+G24FORZl9ooTv8YbDmUb2N3f0ALd7q9UqqNfb5DQOE4z6yM24Z9K3
	 k0qTyUVvX5K4O4GhSzk1Ts38NU1Pd2z8VUoh+ecVRElzCMQSAyyIvdEWtRWljVUTdO
	 +bWwdha2akn02xmLGGrZej6Tn1OMJ5e0FXBmb2icu/kTZILXKAymjYC+oFshA25Yw8
	 GyCXRdg7Xl2TQ==
Message-ID: <f0351414-41af-4f74-899c-87fb5bb45621@kernel.org>
Date: Wed, 13 May 2026 10:03:56 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] workqueue: Show all busy workers in stall
 diagnostics
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Breno Leitao <leitao@debian.org>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Omar Sandoval <osandov@osandov.com>, Song Liu <song@kernel.org>,
 Danielle Costantino <dcostantino@meta.com>, kasan-dev@googlegroups.com,
 Petr Mladek <pmladek@suse.com>, kernel-team@meta.com,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 "Paul E. McKenney" <paulmck@kernel.org>
References: <20260305-wqstall_start-at-v2-0-b60863ee0899@debian.org>
 <20260305-wqstall_start-at-v2-4-b60863ee0899@debian.org>
 <4ed2b000-2306-49fe-87b8-8bfd7f6b6d43@kernel.org>
 <afx1DYxOGzjIP_EV@gmail.com>
 <671a7905-f6b3-4bd4-bb08-130a5cc340e4@kernel.org>
 <7e3c68dc-5695-4978-a991-68f6e9d1c4e8@leemhuis.info>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <7e3c68dc-5695-4978-a991-68f6e9d1c4e8@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13. 05. 26, 9:29, Thorsten Leemhuis wrote:
> On 5/11/26 07:21, Jiri Slaby wrote:
>> we currently have several reports of this. On s390, ppc64, and x86_64.
> 
> I stumbled on this by accident and this is not my area of expertise, so
> the following might be bogus:
> 
> Is this maybe the same as "Observed Workqueue lockups on offline CPUs.":
> https://lore.kernel.org/lkml/97a7d011-d573-4754-9e5d-68b562c64089@linux.ibm.com/

Thanks, looks like pretty much it. All three reports have:
rcu: srcu_init: Setting srcu_struct sizes to big.

> Fix is here:
> https://lore.kernel.org/lkml/20260508174353.905746-1-paulmck@kernel.org/

Building a kernel with this and serving to the reporters to test.

> Ciao, Thorsten
> 
>> On 07. 05. 26, 15:11, Breno Leitao wrote:
>>> Hi Jiri,
>>>
>>> On Thu, May 07, 2026 at 12:20:33PM +0200, Jiri Slaby wrote:
>>>> On 05. 03. 26, 17:15, Breno Leitao wrote:
>>>>
>>>>     BUG: workqueue lockup - pool cpus=144 node=0 flags=0x4 nice=0
>>>> stuck for
>>>> 168224s!
>>>
>>> That's an extremely long stall (~1.95 days).
>>>
>>>> ...
>>>>     Showing busy workqueues and worker pools:
>>>>     workqueue rcu_gp: flags=0x108
>>>>       pwq 578: cpus=144 node=0 flags=0x4 nice=0 active=3 refcnt=4
>>>> in:
>>>>     https://bugzilla.suse.com/show_bug.cgi?id=1263947
>>>> ?
>>>>
>>>> Can this (or other patch from the series) cause this? Should there be
>>>> something like cpu_online() instead of task_is_running() somewhere?
>>>
>>> This series only affects stall reporting, not detection. The changes run
>>> after the watchdog has identified a stall, so the detection logic itself
>>> remains unchanged.
>>>
>>> To help diagnose this issue, could you provide some additional
>>> information:
>>>
>>> 1) Was CPU 144 online at any point? If so, when was it taken offline?
>>
>> It was not, it's non-present.
>>
>>> 2) Does this message appear repeatedly? If you bring CPU 144 online, does
>>>      the issue resolve?
>>
>> Yes, look at this new x86_64 report's dmesg (I believe it is related to
>> the above report):
>>    BUG: workqueue lockup - pool cpus=2 node=0 flags=0x4 nice=0 stuck for
>> 50s!
>> in:
>>    https://bugzilla.suse.com/attachment.cgi?id=890229
>>
>> $ grep -c BUG sl.txt
>> 504
>> $ grep -c pwq sl.txt
>> 509
>>
>> It comes from:
>> https://bugzilla.suse.com/show_bug.cgi?id=1264554
>>
>>> 3) Have you run similar tests on earlier kernel versions without seeing
>>>      this behavior, or is this a clear regression?
>>
>> It's new in 7.0. Going back to 6.19.12 makes it disappear.
>>
>> thanks,
> 


-- 
js
suse labs
