Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E717E2F43
	for <regressions@lists.linux.dev>; Sun, 28 Aug 2022 19:08:14 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oSNdk-0003tY-Km; Sun, 28 Aug 2022 21:08:12 +0200
Message-ID: <9ec7563f-906f-2e72-73ae-6f373b9445d0@leemhuis.info>
Date: Sun, 28 Aug 2022 21:08:12 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: Linux regressions report for mainline [2022-08-28]
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <166170992386.1651569.17504808724724706636@leemhuis.info>
 <CAHk-=wjn-GVDLEN0F+WT0PWysqH7HMD+mBjKUr65DEhav47u3w@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAHk-=wjn-GVDLEN0F+WT0PWysqH7HMD+mBjKUr65DEhav47u3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1661713695;d37625e1;
X-HE-SMSGID: 1oSNdk-0003tY-Km



On 28.08.22 20:41, Linus Torvalds wrote:
> On Sun, Aug 28, 2022 at 11:23 AM Regzbot (on behalf of Thorsten
> Leemhuis) <regressions@leemhuis.info> wrote:
>>
>> Not sure, maybe it would have been good if the following fix would have
>> found the way into rc3, as it seems more than just one or two people
>> already stumbled over the regression fixed by it:
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=master&id a8e0f6b01b14b2e28ba144e112c883f03a3db2
>> https://lore.kernel.org/all/?qœbffc7*
> 
> Neither of those links are valid for me.
> 
> "a8e0f6b01b14b2e28ba144e112c883f03a3db2" doesn't exist in linux-next.
> never mind that that isn't valid link syntax anyway.
> 
> The lore.kernel.org link is also just random noise.
> 
> So I'm not actually sure what you are trying to say...

Sorry, you are right, I did something really stupid when preparing the
mail (I manually modified one that was ready so send and already
encoded...). Here are the links:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=master&id=13a8e0f6b01b14b2e28ba144e112c883f03a3db2
https://lore.kernel.org/all/?q=9cbffc7*

But I just noticed that's not the only stupid thing I did, as the linked
commit in next (13a8e0f6b01b) is part of a series:

https://lore.kernel.org/all/20220819221616.2107893-1-saravanak@google.com/

The series fixes the regression "Regression: PM: domains: Delete usage
of driver_deferred_probe_check_state" that is in the list from regzbot:
https://lore.kernel.org/all/DU0PR04MB941735271F45C716342D0410886B9@DU0PR04MB9417.eurprd04.prod.outlook.com/

But there are more reports, for example:
https://lore.kernel.org/all/YvrkjH6%2FFpIzyAv+@euler/

Not sure if Greg didn't sent them to you because he think they need more
time or because he's simply afk/busy and didn't manage to send pull
requests.

Guess waiting another week won't do too much harm.

Ciao, Thorsten
