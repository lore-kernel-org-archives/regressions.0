Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C739336EAB7
	for <regressions@lists.linux.dev>; Sat, 28 Feb 2026 07:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772263921; cv=none; b=OvMvt8CNyCZv9HJ4YsC/e4m+32Vm4QIuZdQWPnUTGzTs8qkjKkKGdopUqEeqcpeXgplIuDF/X2wue4Gg0mtkE8G7I4Avfd6OYey1FcGnhEullbzZsn/6D7VkmGPt/Kf/JPcpeSG6PMifFf3vMj6Dshb0K/018llLamwQT28lsWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772263921; c=relaxed/simple;
	bh=g3GxEOH+E5VNQDBWyd1o+JU9UKM9Ko9uF0tn60M4eKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDj7odaiSAHKtWzGrmeHQ12h+OqObiVZ51Y6G33OQTPSbpUbpMjcaFa3BqQNfI41FuPY/BYz3cyUYjdXq9j8VeoiHFgvfhEGqwaMWxeL0jplV/vRYOwWwcomwtuQRDqFMv22VVai9QJ9qLWITVUTqWoFQQJBZymx72os3kAHIBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ImniNz/Z; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ImniNz/Z"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4fNGr10WYRz4309;
	Sat, 28 Feb 2026 08:22:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1772263377;
	bh=g3GxEOH+E5VNQDBWyd1o+JU9UKM9Ko9uF0tn60M4eKo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ImniNz/ZI3GdutFqlz+NzB0b7O5Z9dmfUfV+JJKBQXBOQIesxz+ZCspStatg6U2np
	 7FGqH6+cjftcnKltGom+HqLec7fPemMGCd0BnewDKug8xd8VRRGzU3K59p8VDQZwgl
	 IUshBXwAwBdvceW4H8QSDoefk5RsvEwdPmBn4ET63xiQBMp5qEWGe0cLGMSZaJ0dvy
	 ouWvXvPWBoHKAgZReWY7mkpaA+w/rcGQxkHIV63ZhYIUeY/vOZ8F3SDIsJI7Xr7Ibz
	 EG/3Ttd/25JK3WKZLR+kOrg94QIwPnaHb+O4QNOlFGLMdlhQYaqdxanddYIYusP6xT
	 yn5693xqH978w==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4fNGr06vv9z4308;
	Sat, 28 Feb 2026 08:22:56 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fNGqz39vzz8sWT;
	Sat, 28 Feb 2026 08:22:55 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id F2B0361741;
	Sat, 28 Feb 2026 08:22:53 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <f347b759-c3c6-40fe-86b2-b89ac6fd2d5b@leemhuis.info>
Date: Sat, 28 Feb 2026 08:22:52 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BISECTED]: Black screen on 7.0-rc1
To: David Gow <david@davidgow.net>,
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
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <67f655bb-4d81-4609-b008-68d200255dd2@davidgow.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177226337433.3659084.1282157878778276038@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: F2B0361741
X-NC-CID: grVfkCbJBcL+4cFbxe8sZU6r99o/Vyg5vHqq7FHT54dvNeC+Y1Y=

On 2/26/26 05:08, David Gow wrote:
> Le 25/02/2026 à 12:57 AM, Linus Torvalds a écrit :
>> On Mon, 23 Feb 2026 at 23:59, Harald Arnesen <linux@skogtun.org> wrote:
>>>
>>>>>> In fact, I would expect it to be related to one (or both) of
>>>>>>       f2ae92780ab9 ("firewire: ohci: split page allocation from
>>>>>>       993ab48006b3 ("firewire: ohci: stop using page private to store >>>>>> dma mapping")
>>>>> Should I try reverting one or both of these?
>>>> Yes. From a quick check, they revert cleanly (revert 993ab48006b3
>>>> first) and the result seems to compile cleanly too.
>>> I can confirm that the kernel boots with these two reverted.
>>> I have attached the new dmesg output.
>> Thanks. I guess it's up to Takashi to figure out what exactly goes
>> wrong, but it's good to have this confirmed. I hope you'll be willing
>> to test any patches that Takashi comes up with.
>> And if we can't figure it out, I guess reverting them is the right
>> thing, but let's wait until at least rc2 is imminent before we do
>> that.
> I am also seeing this, and can confirm that reverting the whole firewire
> pull fixes it here.

TWIMC, John ran into a problem with mentioned f2ae92780ab9 commit that
from a brief look looks similar to the one Harald reported. And Takashi
posted a fix for it here:
https://lore.kernel.org/lkml/20260228031255.GA832746@workstation.local/

Not sure why Takashi did not reply here. Feels a bit like I'm missing
something.

Ciao, Thorsten
