Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B28C179
	for <regressions@lists.linux.dev>; Tue,  1 Mar 2022 14:03:59 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nP36a-0004Vg-Qs; Tue, 01 Mar 2022 15:03:56 +0100
Message-ID: <301a964e-2db1-6bb6-ffac-9077d8a119ff@leemhuis.info>
Date: Tue, 1 Mar 2022 15:03:56 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Regression are sometimes merged slowly, maybe optimize the
 downstream interaction?
Content-Language: en-US
To: Steffen Klassert <steffen.klassert@secunet.com>
Cc: Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 netdev <netdev@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
References: <37349299-c47b-1f67-2229-78ae9b9b4488@leemhuis.info>
 <20220228094626.7e116e2c@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
 <792b4bc3-af13-483f-0886-ea56da862172@leemhuis.info>
 <20220301132644.GU1223722@gauss3.secunet.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20220301132644.GU1223722@gauss3.secunet.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1646143440;7e8b267a;
X-HE-SMSGID: 1nP36a-0004Vg-Qs

On 01.03.22 14:26, Steffen Klassert wrote:
> On Tue, Mar 01, 2022 at 11:06:14AM +0100, Thorsten Leemhuis wrote:
>> On 28.02.22 18:46, Jakub Kicinski wrote:
>>> On Mon, 28 Feb 2022 14:45:47 +0100 Thorsten Leemhuis wrote:
> [...]
>>>> Often the fixes progress slowly due to the habits of the downstream
>>>> maintainers -- some for example are imho not asking you often enough to
>>>> pull fixes. I guess that might need to be discussed down the road as
>>>> well, but there is something else that imho needs to be addressed first.
>>
>> To give an example, but fwiw: that is in no way special, I've seen
>> similar turn of events for a few other regressions fixes in sub-tree of
>> net, so it really is just meant as an example for a general issue (sorry
>> Steffen).
> No problem.

Great, thx!

>>
>> See this fix:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=master&id=a6d95c5a628a09be129f25d5663a7e9db8261f51
>>
>> The regression was introduced in 5.14-rc1 and the fix was posted on
>> 2022-01-14, so 46 days ago.
> Let me give some background on this issue. [...]

thx for this, from the outside it's often hard to grasp how bad a
regression is, that's why I handle most of them the same way.
> This issue has already a long history and never really worked
> for all corner cases. That's why I was not in hurry with it at
> all.

Which I guess is fine. And if I had been under the the impression that
it was urgent I would have spoken up a few weeks ago when I asked when
the fix was going to get merged.

> Btw. how do you pick the regressions you are tracking? Why
> this issue and not the many others?

Some people already get regzbot directly involved to make sure their
report doesn't fall through the cracks.

I add most to the tracking that are CCed to the regressions list.

I also run a search for the word "regression" on lore and look at new
bugzilla tickets after a week. I add most of the regression reports I
find that way, but sometimes decide not doing so -- for example if the
fix already is on its way or if the regression is reported by a kernel
developer that knows to keep an eye on things.

Not perfect (just like regzbot), but you have to start somewhere.
> What is the aim of your tracking? Is it to make sure a regression
> fix will hit the manline, or/and the stable trees?

To ensure no reported regression falls through the cracks; the focus
currently is on mainline, but I keep any eye on stable as well.

Ciao, Thorsten
