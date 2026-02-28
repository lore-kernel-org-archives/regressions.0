Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E082D3EFD29
	for <regressions@lists.linux.dev>; Sat, 28 Feb 2026 09:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772269820; cv=none; b=Rss+kq7knWlxGv5s2rfMFmbYzY+RiCoy3o+DrsneM16pGMAczaM1K5dV9SzNSI2QJWBdoBvOHkMJyhmHOpNlYKOY4hJnDe+EMyfP5n/2OiEsoGzSipR4rP7Y2yFwarks/yKjMjGUY23qHMYBmQd+DeDm4SCvXbd5719pl4lPKVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772269820; c=relaxed/simple;
	bh=+/fSVwmGtFdsEaMo68sAEBnhkNXYEd4p8Qa67lkGVnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f2whfjBI88z4x/k382bku6NLCFtNfH7UTUcqywtU4NcnyGWrStuVW3FYQMX6Xc6BEauNVDrwZI1SEksnd/7bDkZNYIm1etaoNpBG0m0+4Q1c0HIUGvCQPlgphZViOvyoIKx3F1LCjsDleLypwlgeP6lm3sFQcUxFyauDbTeuRoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=avHeByO7; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=cvwLfXuN; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="avHeByO7";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="cvwLfXuN"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772269816;
	bh=+/fSVwmGtFdsEaMo68sAEBnhkNXYEd4p8Qa67lkGVnk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=avHeByO7t7a7yicYowKiqWj4pVOC9fWsIaP6D4nYZJ12yS5kO6enLRSi312w01jZH
	 DjqLgXjLKTzRUYSLI7VSg8oyUA2jNqoHTvdDF3KL/nevAbUTaulnu6ST3hO9uu614X
	 uCV3PUpn+/u3vm6cSEB7s6LkBdNFFmsXK2NW5i3mZmHxxcUf4tmAotY+z6CjijIfLd
	 tFBE3vmymuNkvwd0y7EEEi5fMPOSnTSUdc2ekkQbV78/YFwDzhus1/ytf7GP7/dLW3
	 uwtVQOi+sG6xLAWnpNWXRLCdQLWaL9asH6tQHQEGOfccXiuENL8TvMU08zDdYAajCY
	 gZR44Tq4G/QnCfE3llEaihGz9bU+D1JYqWQv/O2HYqFeBsL7ne5vs/XTK0hljXnbXG
	 UbYjfIzFGubxnB3k5kjKopukaI9RvsJJc+0iq1AQts1fu9UX23DDu50HZdI6RiZ+hd
	 lWhWtZk1kuaCgTRgpvyDdBoGpnIWf/k/1FxPcbIHEhue8CmqIUryk6JdcW8oP1GIva
	 Q7x9CyNIfBhs+J9J3lQ6Eo43pmkF3E47jpEwvotNbaJXB/HIxzfxtUmcr//AjhnYK0
	 WUZHsnbSxftB/zqxqGxKU3PqHfGgEt7UJRx7VkPzIQaAVEgu9DiclYfCbsL6L91eJs
	 /uPhWLCGztN1gL1pSWKP3VWo=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id DFA631E7A8B; Sat, 28 Feb 2026 17:10:16 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772269815;
	bh=+/fSVwmGtFdsEaMo68sAEBnhkNXYEd4p8Qa67lkGVnk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cvwLfXuNEwS2+5shy4vtcNJYhouZ8PxtMlDQYbP0oaMHfRx9Zd5SMc5scUKAQ0S5W
	 +qQClkShhWizC1m/2qZFbEVJh5vhpRtiTb7tpCDOUrTKRVkHHd9c6nhAqeNXD3N+gE
	 8R8H+50/JuTi1LUt5XvCeS8lMtshZp4SRiRGuqQfQe2SWtLAs3R363a7bHdg3S72pV
	 /71gh+dq9YlzySpL1OnFHx9gq8Yfz0+y2S1xHPQ1e4fAYNPjJys+lLDsGFLFx861f/
	 Lrkd7uruSci8dnXGvjjOt4qtC9c3dxVEmuJPJr2voZ8cIzkNWz+Sk5oK0EmNPqrSdA
	 mAHwgMmB0tVNCsD+WnoANPw+b4YC+wA5i3qvyVpbdTM8YFwqz9BZbgCR6EcYfaAVPY
	 DVlIw8If3vtZ2Ee6SQ4vbQ4Akn74vIDizW2L9M42x946S4cAQuTYgemk3xtZ+ui0qb
	 Z+DwY09u97/ka/y4UGUoSbroiDnKMYcwl/R5TW5+Bud/5cu6o+V+rL8HVssrPgPrys
	 1lVxgdH7bB2MPIA4svrTcb+MQwUkQtWLZ9Uxwcj4txPkhBHGWEJu7XlbdXJme+4YcJ
	 N9rawPl+NriVyhwc7MusKjPUz9tmxK8EQtLUQUbKle1hnW1P4uHb1npvAkyU+fbSbs
	 3UMN5xacA1tGQVG8AJJ17dBk=
Received: from [IPV6:2001:8003:8824:9e00:6d16:7ef9:c827:387c] (unknown [IPv6:2001:8003:8824:9e00:6d16:7ef9:c827:387c])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 941EB1E7A85;
	Sat, 28 Feb 2026 17:10:15 +0800 (AWST)
Message-ID: <a8277e96-6718-4e32-b46b-41738e55d80e@davidgow.net>
Date: Sat, 28 Feb 2026 17:10:15 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BISECTED]: Black screen on 7.0-rc1
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Harald Arnesen <linux@skogtun.org>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <18b0ead7-0a5d-4699-a09d-de5bc2208b68@skogtun.org>
 <CAHk-=whsxHKbtSpiqqQ1V8YDh_zu+CMB=Zt9MxUOmWGocueZNQ@mail.gmail.com>
 <245628b6-6cdb-446c-824d-442100c89da8@skogtun.org>
 <CAHk-=whxJBPZ=7jpAKgz+5hUjJZ129JJsyA6iEw70Wg58hD0zg@mail.gmail.com>
 <a200d310-e3df-48e4-8376-7bbbb483f2eb@skogtun.org>
 <CAHk-=wgUmxkjwsWzX1rTo=DTnaouwY-VT8BjrTqfH7RmTwO72w@mail.gmail.com>
 <67f655bb-4d81-4609-b008-68d200255dd2@davidgow.net>
 <f347b759-c3c6-40fe-86b2-b89ac6fd2d5b@leemhuis.info>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <f347b759-c3c6-40fe-86b2-b89ac6fd2d5b@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 28/02/2026 à 3:22 PM, Thorsten Leemhuis a écrit :
> On 2/26/26 05:08, David Gow wrote:
>> Le 25/02/2026 à 12:57 AM, Linus Torvalds a écrit :
>>> On Mon, 23 Feb 2026 at 23:59, Harald Arnesen <linux@skogtun.org> wrote:
>>>>
>>>>>>> In fact, I would expect it to be related to one (or both) of
>>>>>>>        f2ae92780ab9 ("firewire: ohci: split page allocation from
>>>>>>>        993ab48006b3 ("firewire: ohci: stop using page private to store >>>>>> dma mapping")
>>>>>> Should I try reverting one or both of these?
>>>>> Yes. From a quick check, they revert cleanly (revert 993ab48006b3
>>>>> first) and the result seems to compile cleanly too.
>>>> I can confirm that the kernel boots with these two reverted.
>>>> I have attached the new dmesg output.
>>> Thanks. I guess it's up to Takashi to figure out what exactly goes
>>> wrong, but it's good to have this confirmed. I hope you'll be willing
>>> to test any patches that Takashi comes up with.
>>> And if we can't figure it out, I guess reverting them is the right
>>> thing, but let's wait until at least rc2 is imminent before we do
>>> that.
>> I am also seeing this, and can confirm that reverting the whole firewire
>> pull fixes it here.
> 
> TWIMC, John ran into a problem with mentioned f2ae92780ab9 commit that
> from a brief look looks similar to the one Harald reported. And Takashi
> posted a fix for it here:
> https://lore.kernel.org/lkml/20260228031255.GA832746@workstation.local/
> 
> Not sure why Takashi did not reply here. Feels a bit like I'm missing
> something.
> 

Thanks, that patch indeed fixes it for me, too.

-- David
