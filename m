Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39EA337BB8
	for <regressions@lists.linux.dev>; Mon,  2 Mar 2026 07:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772437912; cv=none; b=p/a5IXNe8ufVeF8g8rWJWLX2OJ849l3gjgI4t1WrMQvzV/9+DeizllDBwd5y/cGMVNYireEf7ufd8H9Ua9izIMUc6SAXFAp3oZOoZm39FW6TjDVTVAxGk+IDzY+cmqZ3jEsjl4B7i3S+vbUJ/XaJSgmb0REhrSwmZem7tWq0tU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772437912; c=relaxed/simple;
	bh=P9+FTTFSstr8j7QPoGRGFakPyEw9c090QJ0oAFGd5G0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eUEnEIV/+F2MrCyvOPHYJCq86wqVnIe1l6Q73kZ0r8HLRKAIOjoJpS7p+tk5rpCPbExLSiJV/MCStW++2HOhQIXlFShHfvlERr3CsFVITH3iDlpvH8oPjjL4Nf7/TTwO3kwGBGGVxBf0smlSODZmeTZOTu+6pDZH90TI+6Vcsjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=jrFCk00L; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="jrFCk00L"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4fPWNF5np4z4CwS;
	Mon,  2 Mar 2026 08:51:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1772437901;
	bh=P9+FTTFSstr8j7QPoGRGFakPyEw9c090QJ0oAFGd5G0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jrFCk00LAa2fYUlvBmYfHFunEARfiM6NkcTagoUsDMlUpE27zzxMPXBqBwD9wkRjw
	 VAGQj8wGzAIkROO0iG99qe8yCbZkon3EbFxlxA0+l/YPfY+XNfwpY5rAQCV22uYZBi
	 6fKnS0aY4bUmbB9pj6T88VgTm6vBAksDA0aymAKC2Kje1rRXoqn8yLMG7bDU5WUCpg
	 9VtvgKBCUCLyJfxWPIpBVANBWuNF3WpKsL2TKJie0uDPMJ6fkTFxrrLoy4cJiJniFH
	 3MSE/o31pTjVFOYyJ3l/PjTRYjshRnEUtEZXd1KkeXB9LkJXYHZpW0NQFGQrel2XNW
	 MAXycahKsFirQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4fPWNF54l5z7wX0;
	Mon,  2 Mar 2026 08:51:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fPWN86wlsz8sbW;
	Mon,  2 Mar 2026 08:51:36 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id ED426633B6;
	Mon,  2 Mar 2026 08:51:35 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <be46e053-7d47-43dc-9c93-5c5e1fff6633@leemhuis.info>
Date: Mon, 2 Mar 2026 08:51:34 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: question about automatic backports to -stable branches
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Chris Friesen <chris.friesen@windriver.com>, stable@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <90479cf8-8087-4c8d-8d94-6bd3b885a77c@windriver.com>
 <2026022502-spoilage-drearily-cade@gregkh>
 <8160818d-0138-481d-ba84-e33d7b3845b9@leemhuis.info>
 <2026030107-jubilant-edge-f5c9@gregkh>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <2026030107-jubilant-edge-f5c9@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <177243789621.2025010.5604938347300355849@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: ED426633B6
X-NC-CID: phkhyL8AREJqBlzLGL29H+pnwW0Unt8CfmIsBk5txk/ljzMLv6g=

On 3/1/26 22:32, Greg KH wrote:
> On Thu, Feb 26, 2026 at 09:32:45AM +0100, Thorsten Leemhuis wrote:
>> On 2/25/26 17:20, Greg KH wrote:
>>> On Wed, Feb 25, 2026 at 09:56:12AM -0600, Chris Friesen wrote:
>>>>
>>>> I'm trying to figure out what the expected process/timeline is for automatic
>>>> backports to -stable.
>>>>
>>>> Commits 2fa119c0e5e5 and a5338e365c45 were merged to mainline on Feb 01,
>>>> with the "Cc: stable@vger.kernel.org" in the commit message, but I don't see
>>>> either of them backported to either 6.18 or 6.12 -stable branches.
>>> For a commit that was made in Dec 16, why did it wait until 7.0-rc1 to
>>> be merged?  We treat all of the cc: stable patches that show up in -rc1
>>> as "obviously no rush" as that's why they are showing up in -rc1.
>>
>> For the Dec 16 commit, I can understand this. But that "all" in the last
>> sentence hit a nerve here, as from the regression perspective,
>> "obviously no rush" to me feels like the wrong categorization for CCed
>> stable fixes between, say, -rc7 and the following -rc1, as quite a few
>> of those afaics would benefit from being backported rather earlier than
>> later:
>>
>> - Fixes that (maybe overly careful) maintainers at the end of a mainline
>> cycle queued for the merge window instead of the current cycle; see the
>> first example in this recent mail for one like that:
>> https://lore.kernel.org/all/b4f8ca7a-02b1-4e72-896b-87a00db6338b@leemhuis.info/
>>
>> - CCed stable fixes for regressions that are found and quickly fixed in
>> mainline right after a new mainline release came out without anybody
>> telling the stable team to manually pick the fix up soon.
>>
>> So wouldn't it be better after a mainline -rc1 to work through the
>> possible backports in an order like this:
>>
>> 1. Recent CCed stable fixes.
>> 2. Older CCed stable fixes.
>> 3. Commits with a fixes tag not CCed stable.
> 
> Yes, it would be "better", and to be honest, I haven't really thought
> about it much.  When staring down 700+ patches to process, it's a bit
> hard...
> 
> I have done simple scans of "is this fixing a crash" and merged them
> first.  After that, it's just by order of when they were merged into
> Linus's tree, as I see that feed from the git-commits mailing list.
> 
> Trying to figure out dates as to when things are merged is tough,

Wondering what you exactly mean with "tough". I assume something along
the lines of "it takes time to look up the top-merge for each and every
commit to detect the time it was mainlined (and I can't do that
efficiently in my mailer)"?

> as
> dates don't always match up, any suggestions on how to process that in a
> way that is "fair"?  Just look at "commit date"?  Or "author date"?

Hmmm. I guess I would need to understand your workflow a bit better to
provide a good answer.

You mentioned "git-commits mailing list" above, so I assume you are
processing through the list of commits to backport from your mailer? But
 the merge time is at hand there, as it is the time the mail was sent.
So if your mailer can search for all mails with a stable tag, then you
right after -rc1 could grab all of those from the past three or four
weeks (merge window + last week/two latest weeks of the previous cycle),
and you'd have those from category 1 above (recent CCed stable fixes).

Ciao, Thorsten.
