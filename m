Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC14385519
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 16:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776961835; cv=none; b=Y8dClV3g0HpseLu34E7WjOian5imyCVhGXgofTraftfC1Xp4w+CIvgX41kyfIcfG+NpS95tuyCLVDHo3QffXoI0pAhqe/4OygFMIrm4dzfWhvHaDghW9VwbrxXnnqZsInYwT8Rkw8OSZzruyFziHEAgsJb7sp4MPrujsJ9fDv/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776961835; c=relaxed/simple;
	bh=EG1MBLA4JwoaVy7erSKYoriWyKeF8RL4t6ewRzuGgzA=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Cc:Content-Type; b=b0FD8K1ZudR9Qdv0ukI47Iue0i17yqXESVVbo9Hb62QIKc5BFdi8TsyS1OWqaAvrL+duPTmNfSNGiVIi+F0uko1aVG7T1hdY/p3C7fPu8Yx0QA6TVqiRNAC0+pOSTPrv9z29cunxqTvhflnHuLZaul3DCSEWyF9sL4w/kavstUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=J3T4hv3U; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="J3T4hv3U"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4g1hQp3scGz95Jv;
	Thu, 23 Apr 2026 18:30:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1776961826;
	bh=EG1MBLA4JwoaVy7erSKYoriWyKeF8RL4t6ewRzuGgzA=;
	h=Date:From:To:Subject:Cc:From;
	b=J3T4hv3UEPBYVResBLcj6Qbjs6loyTxXJP9SnewuU9xMXLuYhbKyJ2naySbmEiOMC
	 +pEYFyRyNlBlQzlaAdR+88bSRZ41V17y2RLar8MFsqxX+iifCB3fMC4uzWw56+N0wP
	 dIkgRyjUye6QvX4wr/ModdRzuT5RakUrZftbSCnWX27OwGJLHho+3jgyyRYqRImKkL
	 cWGiyQeqoDZ2El/Y8bsBw8Njpqrtr1SlK+dFxVMyJA6yXXx3laLxGTHq9Y5yTvOCX9
	 nRylZk9sfZT/Q+i76yi2WsYFG1SLuQZNqw36ZyhS4WGjZxpA5k9dA2BoSN2Ak56OPa
	 jTp0UIbejHKMA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4g1hQp39Yhz7wpX;
	Thu, 23 Apr 2026 18:30:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4g1hQn52Plz8tZr;
	Thu, 23 Apr 2026 18:30:25 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id B30D463292;
	Thu, 23 Apr 2026 18:30:24 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=linux@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <4dd98a32-d1d6-43de-910c-7e487503177e@leemhuis.info>
Date: Thu, 23 Apr 2026 18:30:24 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
To: Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: the stuttering regression in 7.0: should I have done something
 different?
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177696182499.1552312.1710765665242649549@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: B30D463292
X-NC-CID: Ru1VAzdymTfxCuGLlOBxlAHDnqjw0exvAx5Ovqe8ItGwDE1JC0g=

Linus, Greg, if you have a minute, please help me out with something I'm
wondering about:

Should I have done something different wrt. to the periodic lockup aka
stuttering regression? The one quite a few users encountered, bisected,
and reported last week following the 7.0 release before it was fixed in
mainline & 7.0.1 during the first half of this week; see below for a
timeline of the whole thing.

I'm not asking if this could have been prevented or if the developers
did anything wrong handling this. I ask because I want to do the right
thing if similar situations arise in the future to ensure they are
handled like you folks want them to.

I for example wonder if I maybe should have made noise about this
regression earlier when I noticed that it affected quite a few (many?)
people. Or made more noise at the point where I spoke up, as then the
path to 7.0.1 might have been easier? Or should I have asked Linus for a
revert (or submit one myself) shortly after the impact became clear --
so that the problem would have been solved quickly while an improved
version of the culprit was developed and mainlined in parallel via the
regular channels?

On a related note: Do you think it would be wise if I started
maintaining a "regression fixes git tree" that collects temporary
reverts and wip fixes while fully formed reverts and/or fixes for
regressions are developed and make it through the ranks to mainline
(which often takes a few days or a week -- or multiple weeks in some
cases)? The idea comes up every now and then, as interested users and
distros then could easily avoid known regressions through that tree; it
could also serve as a test bed for reverts I could send to Linus in case
a proper revert/fix takes too long through the regular channels.

But I'm not sure if such an approach is really a good idea. I'd prefer
if our processes would be so quick and flexible that such a tree would
not be needed. At the same time I see that "quick and flexible" is often
not the case and that we are unlikely to get there any time soon
(especially for fixes that need to reach stable/longterm trees, as it
simply takes a while from initial reporting of a regression to
mainlining a fix [or at least hitting -next] to preparing and releasing
a new stable/longterm release with it).

FWIW, here is the rough timeline of the regression, just to be sure we
are all on the same page:

* The regression I'm talking about is caused by d6e152d905bdb1
("clockevents: Prevent timer interrupt starvation") [authored:
2026-04-07 10:54:17; committed: 2026-04-10 22:45:38; next arrival:
next-20260413; merged: 2026-04-12 19:01:55; v7.0 (2026-04-12 22:48:06)]

* On Monday and thus within 24 of the 7.0 release the first report about
the regression came in and immediately mentioned that a revert was able
to fix things:
https://lore.kernel.org/all/68d1e9ac-2780-4be3-8ee3-0788062dd3a4@gmail.com/

* On Tuesday someone else confirmed the findings and mentioned that
"several users" were seeing the problem:
https://lore.kernel.org/all/aeb848aa-404a-40fb-bd41-329644623b1d@cachyos.org/

* A few hours later (aka within 24 hours of the first report) Thomas had
a rough fix ready https://lore.kernel.org/all/87340xfeje.ffs@tglx/ (yeah!)

* On Thursday the fix was committed to the tip tree:
https://lore.kernel.org/all/177636758252.1323100.5283878386670888513.tip-bot2@tip-bot2/

* On Sunday I asked when the fix was going to be mainlined (with Linus
in CC) -- I feared Greg would soon start preparing 7.0.1-rc1 and I
wanted to ensure the fix was included there:
https://lore.kernel.org/all/5cbb14d8-46f9-4197-917f-51da852d7500@leemhuis.info/

* On Monday morning (UTC) mingo submitted a PR wit the fix:
https://lore.kernel.org/all/aeXYPt1FEbFRZNJf@gmail.com/

* On Monday Greg released 7.0.1-rc1 without the fix -- and a backport of
the culprit was in the -rc1 of various earlier series. Thomas quickly
told the stable team to not backport the culprit before the fix was
mainlined https://lore.kernel.org/all/87pl3ten5y.ffs@tglx/

* On Monday night Linus merged the PR from mingo as 4096fd0e8eaea1
("clockevents: Add missing resets of the next_event_forced flag")
[authored: 2026-04-14 22:55:01; committed: 2026-04-16 21:22:04; next
arrival: next-20260417; merged: 2026-04-21 00:30:08; v7.0-post]

* On Tuesday morning I wrote a mail to Greg about including the fix in
7.0.1; Thomas round about the same time provided the necessary backport,
which Greg then included out-of-band:
https://lore.kernel.org/all/2026042105-malformed-probation-232b@gregkh/
https://lore.kernel.org/all/87jyu0de2c.ffs@tglx/

* v7.0.1 is released on Wednesday, 2026-04-22 13:32:23

I lost track of how many people reported the regression exactly, but I
noticed at least seven reports (most of them in the past week) – and a
few people mentioned to me privately that they were affected, too. So it
was something that annoyed quite a few people afaics -- and made them
bisect, just to find out that the problem was known and a fix existed
already. This widespread effect is why I was wondering if I should have
done something differently, as a quicker fix could have avoided a few
people some pain.

Ciao, Thorsten
