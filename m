Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8CF72
	for <regressions@lists.linux.dev>; Thu, 25 Nov 2021 11:52:08 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mqDIM-0004lJ-BD; Thu, 25 Nov 2021 12:52:06 +0100
Message-ID: <b9fc1beb-0495-b6b7-b352-d2505e709af2@leemhuis.info>
Date: Thu, 25 Nov 2021 12:52:06 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Linux regressions report for mainline [2021-11-24]
Content-Language: en-BS
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <163774583541.221636.5062449110647587402@leemhuis.info>
 <CAHk-=wimd-G9+etiTb=_yqxy8H45su-=WXdLBrhi2TJK+gB+Mw@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAHk-=wimd-G9+etiTb=_yqxy8H45su-=WXdLBrhi2TJK+gB+Mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1637841128;66603d0d;
X-HE-SMSGID: 1mqDIM-0004lJ-BD


On 24.11.21 19:13, Linus Torvalds wrote:
> Ok, nice to see the new regression tracking bot start to show life.

Yeah. :-D

Sadly one of my biggest problems with regression tracking remains:
getting aware of regression reports. I can fully understand that most
people don't care about regzbot for now, but it would really help if
everyone would CC regressions@lists.linux.dev on mails regarding
regressions (e.g. reports or any replies to them).

> Greg had one suggestion,

Still not sure how to approach his use case, but for now I started
adding the usual subsystem commit summary prefixes (e.g. "net:", "usb:",
"drm/amd") to the title of newly added regression, which might help
somewhat and won't hurt.

> I have another - namely about grouping of these things.
>
> I like how you group them by "identified" and "unknown", because
> that's certainly very meaningful.
> 
> But at the same time it does mean that if I look for "what are current
> issues with the development kernel", it ends up being very spread out:

Hah, fun fact: the order you purposed was the one I initially had in
mind. But I later changed my mind, as I thought 'hey, if the culprit of
the regression is known, it should be able to fix this quickly (e.g. by
a revert, if there are no conflicts) even for regressions that made it
into proper releases".

But whatever: I'm totally fine with this and already changed the web
interface yesterday after your mail arrived, only took a minute:

https://linux-regtracking.leemhuis.info/regzbot/mainline/

Next report will use this order as well.

> I suspect that Greg may have a slightly similar issue - as a driver
> maintainer, he cares about current cycle things (but mainly only when
> they affect his subsystems), but with his stable maintainer hat on he
> then cares more about the older cycles.
> 
> Greg suggested splitting out the issues one by one - to try to have
> the right people on the Cc for any _particular_ issue, and while I
> think that's not the solution in this case (I very much want to see
> the "summary" email), it would be good to perhaps at least organize
> that summary email slightly differently.
> 
> I suspect this is something we'd need to iterate on as we use this in
> our workflow

Definitely. If there is something else you want to see changed or think
is odd wrt to regzbot or my work as regression tracker, just let me know.

> but that was my initial reaction to this first report.

Thx for the feedback, much appreciated.

Ciao, Thorsten
