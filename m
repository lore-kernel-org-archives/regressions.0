Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A505336B
	for <regressions@lists.linux.dev>; Fri,  4 Oct 2024 07:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728026850; cv=none; b=prXdFa5h94hUkfMG5xXSg4Z9+ZYayKiK4m4y4vtUc0H8rBEhYBeYZzMvPegciZGxJ3ZVIL/T61LUvYwJ7k+Nc+BtTgD3n5ZoGHtsoeEUIin7yDvLXHGyqlnRPhqnL1+4MVRjBFS1Kl9rGUdxhUvw7pudyb9U2GARjoQe4qJnXH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728026850; c=relaxed/simple;
	bh=GAy0JfZw++dknjc/hMlMQUwFsQJQn09zt1W+cRv6oEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WvB256bABwaGEGb1EsJsQ2jjeXhp9BCi8IuE6MGCzEVxkm0KvfqMrFTB6P3o2HasG+arf90Wn7qkE9ZZ7o+3zQV1nPucgX+xwuThe953DiuDb9osoqTciJRPJsLtihj70/mYhXgJmr2rMhQUHmoA0WrIdVwUmRbLU6Rcluk2GTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=aBN3jhT+; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="aBN3jhT+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=/VwIdMVF4tWcyITfjjjsP0WlOW5qNCqOUvMikksXaPE=; t=1728026848;
	x=1728458848; b=aBN3jhT+jv+04bqzKJIe6CdfWb8rtMkbda3X+k8b5yH6CuQWkkd1CQeA4pEuD
	dGP3AE4n/+75+FqIefvdQOw6i2abC8wybOkHkHxBBgNgUuHJQ53RhiJigt1g3rpdpp3me1PAGBmbk
	BUftqihWkGa2Q6fdEKdK7M9oWMC2QAR1nFhmZPjvjZ6GE807EMAhWwpYKug9USMJCjr/FiLscBmNX
	wFwsrk+h6sua7MSspvDi/sr9Mkrby8SbeDkHYRZi06JqxTPU/z13O7ldFR+SMNTf3bwhiTn8FC6wX
	RTaUNAiwheRPCmzrflQOzyFsenuVat/NGom4URwQw08revQReQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1swcik-0003r0-Mb; Fri, 04 Oct 2024 09:27:26 +0200
Message-ID: <979d8e31-57b4-4581-b84c-ed8ff85b6022@leemhuis.info>
Date: Fri, 4 Oct 2024 09:27:25 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Christian Heusel <christian@heusel.eu>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
 <808b3dae-27ec-4e45-bf29-50fce318411d@heusel.eu>
 <57da0956-db6e-47c2-b489-404795c3c6bf@leemhuis.info>
 <7ea8c528-6ee8-41f2-9dff-701579464fda@heusel.eu>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <7ea8c528-6ee8-41f2-9dff-701579464fda@heusel.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1728026848;25f99dc7;
X-HE-SMSGID: 1swcik-0003r0-Mb

On 02.10.24 22:57, Christian Heusel wrote:
> On 24/10/02 10:13PM, Thorsten Leemhuis wrote:
>> On 02.10.24 20:57, Christian Heusel wrote:
>>> On 24/03/09 11:18AM, Thorsten Leemhuis wrote:
>>>> Hi! This is the start of a thread I'll use for updating minor properties
>>>> of regressions tracked by regzbot. Consider telling your mailer to
>>>> ignore this thread, the replies are unlikely to be of relevance for you,
>>>> but done here to ensure a public paper trail.
>>>
>>> #regzbot report: https://lore.kernel.org/all/cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com
>>> #regzbot introduced: f1bfb4a6fed64de1771b43a76631942279851744
>>> #regzbot title: usb/acpi: boot hang on Thinkpad T14
>>
>> FWIW, it nice to get some help, but if you want to do me a favor,
>> please wait for at least 24 hours before adding reported issues to the
>> tracking.
> Will do for any future reports!

thx

>> Often it will turn out that the regression is know already and a fix
>> already pending or maybe even mainlined already. And then somebody has
>> to tell regzbot about the fix as well -- which in the end likely will
>> fall to me, which right due to the lack of funding and available time

BTW, for some more details see (which you might have seen already):
https://lwn.net/Articles/990599/

>> might means that the load gets so high that I might have to give up
>> with regression tracking completely.
> 
> Oh no, that sounds like I'm putting quite a burden on you, 

Don't worry, it's not that much of a problem. But it could become one,
so I thought I tell you about iot.

> which is
> definitely not what I want to do! I also try to stay on top of the
> things that I have added to regzbot, of course with varying success.

thx for the help, much appreciated!

> If you're interested we could maybe synchronize on how to make this a
> collaborative effort (via mail or some conferencetool) so it instead
> makes your life a bit easier. This might especially make sense due to
> the lack of funding and time you noted above. If this is not something
> you're interested in this is also fine for me :)

Right now is a bad time, but yeah, let's talk in a two or three weeks!

>>> #regzbot report: https://lore.kernel.org/all/D4LHHUNLG79Y.12PI0X6BEHRHW@mbosch.me
>>> #regzbot introduced: ee4cdf7ba857a894ad1650d6ab77669cbbfa329e
>>
>> This is likely such a case -- I even replied (which you might have seen)
>> and deliberately chose to not add the regression to the tracking,
>> because I suspect the fix is already pending. At some point in the not
>> to distant future it might make sense to add such issues to the tracking
>> nevertheless, but right now it makes things harder without any gain.
> 
> Yes, this one is definitely on me, I missed that there already was a
> report added for this commit .. I tried to mark it as a duplicate in [a
> follow-up][0], so I hope this clears it for now. I'm also not too versed
> in the bit more advanced regzbot usage, so I still might make some
> mistakes that are quite obvious to you.

It worked out, but FWIW: just mark one report as a dup of the other and
regzbot will handle the rest (the newer one will then be marked as dup
or the older and the two are kinda merged in some way, so some commands
send to the newer one will affect the entry for the older one).

Ciao, Thorsten
