Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497216;
	b=4gwV7+vtEapiu0BL+5pxZoNaxn1D6cFZMrrAKpd2m669KXHjyvrXBcIvy+wYwkXEo4Qp
	 nTVj6w3oGVlHS8fxEg+Xu6q3N6BX1VjGNd74fS1TLMgZtLV5Jy4tMxb/fyB//XIL+ecK2
	 kjdKzvMdI1VU5AvRlEI/WPBMHb5vf++T0ALmbyBftmW/UGwiKIb2pNP7BTu1iwJVdFTpR
	 rhe6eUVQquneppCDbXenoL3wCyJ8uvD3foaM5bZ8sq2n2lVHG3bYcK1l1JUB0wHc6/wFO
	 ji/uDG9Rys0Vs8Mmb0CU+/MKkYFzEGbCYJVyFsij7EePJ/ZCnKqbHZsUNxK5xDIOk6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497216;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:From:
	 Content-Language:Cc:Subject:To:Content-Type:Content-Transfer-Encoding:
	 X-PPP-Message-ID:X-Rspamd-Server:X-Rspamd-Queue-Id:X-NC-CID;
	bh=Nt+yBHmXSjaIToP16PMOG2IX8UplziGRkLpPT0bEWH8=;
	b=VakmL7hpy6BxsctUHpF41qGKd/5XbanibvStWDfu8XZ2xV4tbogp+nN33Rh+zpHLS9zB
	 Nxaip///neIy2apC9aTRzHrviVLMpaV/Nyim2hfHD+cFzhiIPycR+3zQO1NJ5z9o5qDgW
	 TIc4rNxbihUsLNw+SkSUzN+8JoB16/KfhgLS1yHO1W9S/PfaHPSkkf9YkGL85WMqXjT3c
	 tCp8Vw6IPVyirK0EJ0iQXCww5lWXXfUbYfOrGCj/w4K98cLFf++ajFzkdCHTRltFUnTRc
	 2dW/5G2j3hQ46e1u/Mpq/SfCyQv5RMSq9o8EwTUKzNaWAvabKKHBfFE0692wNhe4pCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=PVdBHDbE;
	arc=none smtp.remote-ip=188.68.63.162
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F26606A32E
	for <regressions@lists.linux.dev>; Thu, 12 Nov 2026 15:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6F26606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=PVdBHDbE
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4jQPPd4G62z3tsv;
	Thu, 12 Nov 2026 16:26:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1794497205;
	bh=Nt+yBHmXSjaIToP16PMOG2IX8UplziGRkLpPT0bEWH8=;
	h=Date:From:Cc:Subject:To:From;
	b=PVdBHDbE7aSp3TrlBVrtb73R/eDBQBv+8Om42CimsAiDYlT6aLEluyf3euzsHTSQ9
	 ElLg3U8W+JJrVD3GXB71UTGKVokWWPTgQQ2fNQ82iZxSw3M9L67nA90XIHh5mzWs07
	 cvXzn0tpaaDtvXPD4vHfaAs2x/EY7JVY0gYqy3TYwNq+4JLAqrQGKwacKtgUqc4ha6
	 BpCaE900NmTvPk7XNoznpHwgMWoJ7FDN8QK/A7uKR6mR0AdvHrVR9si+L18eaLW+63
	 n9PoFrVv/DRoKeU3F9pkfsNgjRWhO/ZPqY2TD+kRSY+PFICmBg1cCK+6pWUwxlGK22
	 Vm787b+TjjveQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4jQPMd0C3yz42bb;
	Thu, 12 Nov 2026 16:25:01 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jQPMc2QjYz8svW;
	Thu, 12 Nov 2026 16:24:59 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A82F75F9ED;
	Thu, 12 Nov 2026 16:24:54 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <f03086b6-7fb1-4b52-859e-78cd52c9177d@leemhuis.info>
Date: Thu, 12 Nov 2026 16:24:53 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>
Subject: regressions with available fixes that take their time towards
 mainline as of post 7.4-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179449709545.2619925.1359828242195083426@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: A82F75F9ED
X-NC-CID: /aEkXTqnkxjOfkyGknT0I8F98S7rnm0EPw87pNxsy40/DRTSXM4=

Hi Linus!

How much do you care about the following you wrote earlier this year in
https://lore.kernel.org/all/CAHk-%3Dwi86AosXs66-yi54%2BmpQjPu0upxB8ZAfG%2BLsMyJmcuMSA@mail.gmail.com/

""[...] if it's a regression with a known commit that caused it, I think
the rule of thumb should generally be "[fix] within a week", preferably
before the next rc.""

I'm asking, as I see regressions left and right taking much longer --
even when they easily could be fixed within that timeframe or maybe a
little more. And my efforts to motivate people to get at least somewhat
closer to that rule of thumb seem less and less fruitful, as people
ignore me partially or completely -- just like the "Expectations and
best practices for fixing regressions" in
Documentation/process/handling-regressions.rst, which even give a bit
more time than your rule of thumb.

Of course I could ask you every week to pull some fixes directly (like I
did the past cycle) or even collect them in a tree and submit them as PR
to you (the idea came up there). But well, bypassing subsystem
maintainers' knowledge and their CIs should be an exception, as it will
lead to problems or disaster sooner or later for obvious reasons (and I
guess won't scale either).

I also fully understand that the AI patch influx is a reason why some
regressions take longer to get fixed, as my inquiries and prodding put
even more load on already overloaded people. At the same time the
current patch volume seems to be the new normal for at least the near
future. And overall the core problems that lead to slowly fixed
regressions from what I see are the same as before, they just occur more
often.

The core problem is basically: the "no regression" rule is well known,
but people interpret vastly differently how to realize it in practice --
and often it's reviewing, committing, and mainlining fixes, as outlined
a few months ago here in an analysis for the maintainers summit:
https://lore.kernel.org/ksummit/75dc0e2d-2deb-4776-977c-1de7c33465e1@leemhuis.info/

Instead of approaching this from a theoretical and retrospective side,
let me this time point out regressions that are unfixed right now
despite available fixes:


######
# drm/msm/a8xx: failure during boot

Caused by 93b6c8d10fad (v7.4-rc1). Known before the merge window.
Proposed fix is a oneliner submitted to a different subsys on
2026-10-21. It got two Tested-by:, but no reply from the maintainer yet.
A prod from me about one week after submission didn't have any effect
afaics:
https://lore.kernel.org/all/20261021080517.2161-1-okerixx@gmail.com/

Report:
https://lore.kernel.org/lkml/ar_AuRr1eaZzOfw9@baldur/

Side note: here the msm maintainer explains why he mainlined the culprit
despite the known regression:
https://lore.kernel.org/lkml/CACSVV00x091i7BKW+bj0RUnkd4rOrHXbhZ4zF6SuTU1NAqsFTA@mail.gmail.com/

On a wider note:
There is no way for maintainers to automatically filter patch
submissions that fix user-reported recent regressions, which would allow
maintainers to prioritize such fixes (and me to better keep an eye on
those, too). This could have helped here, as the maintainer recently
applied fixes to his fixes branch, so it not like he is on vacation of
something like that. So he might not even be aware the patch fixes a
regression (that, admittedly, is strictly speacing a problem of another
subsystem, as it exposed it) -- or was unavailable for some time and
when coming back simply deleted old mails (which I can relate to, but
well, it's bad when it comes to regression fixes).


######
# phy: qcom: qmp-pcie: link never retrains and the root port comes up
with no endpoint

Caused by 910b828b22b7 (v7.3-rc1). A revert was posted about a month ago:
https://lore.kernel.org/lkml/20261013-qmp-pcie-skip-reset-revert-v1@michaelburch.net/

I prodded the thread about two weeks ago; three days later it got
"Reviewed-by" from a subsystem reviewer. Today the maintainer finally
accepted the patch, so maybe it will hit mainline soon now.

On a wider note:
Might be a variant of the problem mentioned above: maintainers have no
way to automatically filter and prioritize patch submissions that fix
user-reported and recent regressions.

Could also be confusion on how to handle user-reported regressions from
recent development cycles. Lorenzo voiced those recently:
https://mastodonapp.uk/@ljs/117191681502501017 But he is not the only
one from what I see; that has always been the case, but it seems your
recent statement "Non-critical fixes to long-standing issues are simply
not appropriate for this late in the release cycle." in the Linux
7.1-rc5 announcement made this worse. Or maybe I'm confused, as I assume
the follow statement of yours is still true:

"I do consider "regression in an earlier release" to be a regression
that needs fixing. There's obviously a time limit: [...]"
https://lore.kernel.org/all/CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/


######
# arm64: dts: imx8qm-ss-conn: USB 3.0 broken on Apalis iMX8QM

Caused by 73c3b40e536d (v7.4-rc1). Known for two weeks. Author and
committer is also the maintainer for the area in question. Posted a
revert nearly a week ago, but it is no heading towards mainline so far
afaics:
https://lore.kernel.org/lkml/20261106161809.3512378-1-Frank.Li@oss.nxp.com/


######
# drm/msm/dp: SoC to reset

Caused by 1bda647ce61b (v7.4-rc1). Know for a week. The affected user
reported this by way of posting a patch for it, but it didn't get a
reply yet.
https://lore.kernel.org/lkml/20261104072048.3486286-1-burke.cates@gmail.com/

On a wider note: I see more users that are affected by a regression are
directly posting a patch for it. Those fixes thus lack a "Reported-by:"
tag, which makes it even harder for reviewers and maintainers to see
when a patch is a regression fix and prioritize those.


######
# drm: amdgpu: Black screen after boot with newer kernels in multi-GPU
system

Caused by 11c141672045 (v7.3-rc1). Known for 10 weeks, bisected about a
month ago. Reported at least six times by now afaics:
https://gitlab.freedesktop.org/drm/amd/-/work_items/5762
https://gitlab.freedesktop.org/drm/amd/-/work_items/5979
https://gitlab.freedesktop.org/drm/amd/-/work_items/5806
https://gitlab.freedesktop.org/drm/amd/-/work_items/6120
https://lore.kernel.org/amd-gfx/20261014080523.186533-1-rezanikzadch@gmail.com/
https://lore.kernel.org/amd-gfx/CAGxFSwnJYc03fN+XWU8oLW9EbXhmetQuj1s3-m8UdZHoBdGJ8Q@mail.gmail.com/

Fixes are being prepared for more than three weeks now, but not yet ready:
https://lore.kernel.org/lkml/20261019-vfct-regression-v1-0-5a63ddd378dd@amd.com/
https://lore.kernel.org/lkml/20261111-vfct-regression-v6-0-393797bbb6e3@amd.com/

A revert was considered and even submitted a month ago, but not
performed because it would "trade one regression for annother":
https://lore.kernel.org/dri-devel/20261019194106.2796150-1-alexander.deucher@amd.com/

Might be the case, albeit the changes that would have been reverted do
not have a Fixes: tag. So this is not a clear case and might be a misfit
in this mail, still wanted to mention it due to the relatively huge
number of reports and the time it takes so far to get this resolved.


######
# ntfs3: SEEK_DATA reports WOF compressed files as holes, cp creates
zero-filled copies

Caused by c61326967728 (v7.0-rc1). The affected user reported this by
way of posting a patch for it more than a month ago now, but it didn't
get a reply yet.
https://lore.kernel.org/lkml/20261005223318.19303-1-marcin@mennemann.net/


######
# wifi: iwlwifi: BE200: Wi-Fi interface becomes unusable due to firmware
faults

Known since the end of June. Two reports, both reporters saw the issue
starting to happen around the 7.1 timeframe -- but the cause was later
bisected to the 6.5 change e9b63341dc15, so it looks like something
(another kernel change, firmware, ...) exposed the problem earlier this
year:
https://bugzilla.kernel.org/show_bug.cgi?id=221675
https://bugzilla.kernel.org/show_bug.cgi?id=221898

A fix was attached to bugzilla and confirmed to be working at the end of
August -- and even merged to iwlwifi tree back then. It was then posted
to the lists end of September:
https://lore.kernel.org/all/20260930122439.08094e4c344f.Ic0a4bf544fd6ebaf1fc62b40bf463bd289e58cf0@changeid/

Since then it's also in -next, these days as fdd83f3ad06a26 ("wifi:
iwlwifi: honor the per-channel 320 MHz regulatory flag"). Near the end
of the latest merge window I asked why it's taking so long, but in reply
I only got "You really need to stop pressuring people. Everyone's
overloaded. Heaping more on doesn't help.". The fix from what I see is
still not on its way towards mainline. That being said: it feels a bit
like I'm missing something here -- but OTOH from both reports (one of
them linked in the fix) it looks like it's a recent regression that
takes quite a while to get fixed, despite an available fix.

######

Ciao, Thorsten
