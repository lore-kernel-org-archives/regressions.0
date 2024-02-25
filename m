Received: from clark.ferree-clark.org (clark.ferree-clark.org [74.95.126.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3BF1757E
	for <regressions@lists.linux.dev>; Sun, 25 Feb 2024 17:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.95.126.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708883310; cv=none; b=fGdJgATyPY/3QQgFFh8BSh+UTIEiYMImH6jWqz5miGTzmaCVU/zeoyKfrt4MPErK4E5ENTX1k6qdnF9VCRziNusGqnP5myZy97oqyA6YiEYizJE63F1EiGEy5OFGm58ZwCBUuFMtRVF58sJ3kYOeLANTAkR+Mlm381EyBaJ2uWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708883310; c=relaxed/simple;
	bh=2CikVZw5yj7Anfr/po21f7lB9khLh4KxTeibgLI9F6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UTLzb94wRkjw/j6/7O7Cmu9wX59QPv8hiWa6o73m5V0KnTVjaD6rrYZe5RPCLqqM6iG3uH7gWQ9/SqkVQnpjlvv/PEE2VF1D1KWVZej26Y5FztWy0vf7IwjjgHWn5gUTVASXw4svHormKVf3g9dlfoNzL8kqcOx4lDEk+E0R+OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clark.bz; spf=pass smtp.mailfrom=clark.bz; dkim=pass (2048-bit key) header.d=clark.bz header.i=@clark.bz header.b=LsnlwCca; arc=none smtp.client-ip=74.95.126.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clark.bz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clark.bz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clark.bz header.i=@clark.bz header.b="LsnlwCca"
Received: from clark.ferree-clark.org (localhost [IPv6:0:0:0:0:0:0:0:1])
	by clark.ferree-clark.org (8.17.2/8.17.1) with ESMTP id 41PHkAvS634133;
	Sun, 25 Feb 2024 09:46:10 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 clark.ferree-clark.org 41PHkAvS634133
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=clark.bz; s=c20;
	t=1708883171; r=y; bh=sBdHkP5cNkJZ0aDx3mj38H7Zkuc+PJWAHEBhty7Uptk=;
	h=Date:Subject:To:From:From;
	b=LsnlwCcaB1IeLYcm4X6tZrsrK3upRHhDn7o8nrpZw5xK6k0jU2fxVlTc17PMo4LtR
	 ZDe8QeSN+lO8L5/f7NMUFnBfwm41FPm2b2P/mBNzIgx2fyX3GC467vXb3yFwGsKwYc
	 hEtSP7r6Zlurze6Kn8Rsw2EnXfRnyOktwwuYR8sKmaontF1gSlj6JhJaGOMx1jvP6l
	 RW5sMQK5BpiXiN5q7vkn3fzXeQUJFzRrwarDtl+kNZvIv6As2UUvwiFAJLk0Zvyy3+
	 7td2SN0494jZa580/xPTNatQthaSoDBdvT5ZVLgvE1TF9z4KJz7BrUJBXP++HnDDjN
	 WSy5C7fqdb/VQ==
Received: from [100.115.92.202] ([10.1.10.12])
	by clark.ferree-clark.org with ESMTPSA
	id 2B18KuJ822UTrQkACNZ+ew
	(envelope-from <kernel@clark.bz>); Sun, 25 Feb 2024 09:46:10 -0800
Message-ID: <c21ee3c9-6cb8-45f7-ba46-880cee757cb3@clark.bz>
Date: Sun, 25 Feb 2024 09:46:09 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] 6.7.1: md: raid5 hang and unresponsive system;
 successfully bisected
Content-Language: en-US
To: Song Liu <song@kernel.org>,
        Linux regressions mailing list <regressions@lists.linux.dev>
References: <20240123005700.9302-1-dan@danm.net>
 <20240220230658.11069-1-dan@danm.net>
 <7efac6e0-32df-457e-9d21-4945c69328f8@leemhuis.info>
 <CAPhsuW5QYTjBvjAjf8SdcKmPGO20e5-p57n6af5FaXudSiOCmg@mail.gmail.com>
From: "Thomas B. Clark" <kernel@clark.bz>
In-Reply-To: <CAPhsuW5QYTjBvjAjf8SdcKmPGO20e5-p57n6af5FaXudSiOCmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.1.10.2

This issue isn't limited to RAID5.  It's happening to me on a RAID1 md 
as well. I use an ext4 filesystem over RAID1 for /guests.

  I can add a couple of observations to what is already noted. The load 
increases gradually and inconsistently, and sometimes it runs for 
several hours after rebooting without any noticeable ill effects before 
the load starts creeping up in the VMs, eventually bringing the server 
to an unresponsive state. The longest I've seen it run is 12 hours. I 
haven't figured out whether there is some trigger or a cumulative effect.

On 2/23/24 18:13, Song Liu wrote:
> Hi,
>
> On Fri, Feb 23, 2024 at 12:07 AM Linux regression tracking (Thorsten
> Leemhuis) <regressions@leemhuis.info> wrote:
>> On 21.02.24 00:06, Dan Moulding wrote:
>>> Just a friendly reminder that this regression still exists on the
>>> mainline. It has been reverted in 6.7 stable. But I upgraded a
>>> development system to 6.8-rc5 today and immediately hit this issue
>>> again. Then I saw that it hasn't yet been reverted in Linus' tree.
>> Song Liu, what's the status here? I aware that you fixed with quite a
>> few regressions recently, but it seems like resolving this one is
>> stalled. Or were you able to reproduce the issue or make some progress
>> and I just missed it?
> Sorry for the delay with this issue. I have been occupied with some
> other stuff this week.
>
> I haven't got luck to reproduce this issue. I will spend more time looking
> into it next week.
>
>> And if not, what's the way forward here wrt to the release of 6.8?
>> Revert the culprit and try again later? Or is that not an option for one
>> reason or another?
> If we don't make progress with it in the next week, we will do the revert,
> same as we did with stable kernels.
>
>> Or do we assume that this is not a real issue? That it's caused by some
>> oddity (bit-flip in the metadata or something like that?) only to be
>> found in Dan's setup?
> I don't think this is because of oddities. Hopefully we can get more
> information about this soon.
>
> Thanks,
> Song
>
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>> --
>> Everything you wanna know about Linux kernel regression tracking:
>> https://linux-regtracking.leemhuis.info/about/#tldr
>> If I did something stupid, please tell me, as explained on that page.
>>
>> #regzbot poke
>>
