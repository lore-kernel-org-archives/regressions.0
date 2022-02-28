Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF6B559D
	for <regressions@lists.linux.dev>; Mon, 28 Feb 2022 13:45:52 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nOgLW-0004bS-4O; Mon, 28 Feb 2022 14:45:50 +0100
Message-ID: <37349299-c47b-1f67-2229-78ae9b9b4488@leemhuis.info>
Date: Mon, 28 Feb 2022 14:45:47 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: en-BW
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: netdev <netdev@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Regression are sometimes merged slowly, maybe optimize the downstream
 interaction?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1646055952;c85c1669;
X-HE-SMSGID: 1nOgLW-0004bS-4O


Hi Jakub, Hi Dave!

I was wondering if you and your downstream maintainers could consider
slightly optimizing your working habits to get regression fixes from
downstream git repos a bit quicker into mainline. A slightly different
timing afaics might already help a lot; or some timing optimizations in
the interaction with downstream maintainers.

I ask, because in my regression tracking work I noticed that quite a few
regression fixes take a long time towards mainline when they need to go
through net.git; that imho is especially bad for regressions caused by
commits in earlier development cycles, as they can only be fixed in new
stable releases after the fix was mainlined.

Often the fixes progress slowly due to the habits of the downstream
maintainers -- some for example are imho not asking you often enough to
pull fixes. I guess that might need to be discussed down the road as
well, but there is something else that imho needs to be addressed first.

At least from the outside it often looks like bad timing is the reason
why some fixes take quite long journey to mainline. Take for example the
latest pull requests for bluetooth and ipsec:

https://lore.kernel.org/netdev/20220224210838.197787-1-luiz.dentz@gmail.com/
https://lore.kernel.org/netdev/20220225074733.118664-1-steffen.klassert@secunet.com/

One is from Thursday, the other from early Friday; both contain fixes
for regressions in earlier mainline releases that afaics need to get
backported to stable and longterm releases to finally get the regression
erased from this world. The ipsec fix has been in -next already for a
while, the bluetooth fix afaics wasn't.

Sadly, both patch sets missed rc6 as Jakub already had sent his pull
request to Linus on Thursday:
https://lore.kernel.org/all/20220224195305.1584666-1-kuba@kernel.org/

This is not the first time I noticed such bad timing. That made me
wonder: would it be possible for you to optimize the workflow here?
Maybe a simple advice to downstream maintainers could do the trick, e.g.
"ideally sent pull request by Friday morning[some timezone] at the
latest, as then the net maintainers can review, merge, and sent them
onwards to Linus in a pull request later that day".

FWIW, I don't know anything about the inner working of your subsystem,
if you need more time to review or process merge requests from
downstream maintainers the "Friday morning" obviously needs to be adjusted.

Or is there something like that already and the timing just has been bad
a few times when I looked closer?

Ciao, Thorsten
