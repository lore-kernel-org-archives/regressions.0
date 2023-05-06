Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E8D156EB
	for <regressions@lists.linux.dev>; Sat,  6 May 2023 06:20:28 +0000 (UTC)
Received: from [185.238.219.2] (helo=[192.168.44.27]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pvBHM-0005z1-Kv; Sat, 06 May 2023 08:20:24 +0200
Message-ID: <9284a9ec-d7c9-68e8-7384-07291894937b@leemhuis.info>
Date: Sat, 6 May 2023 08:20:23 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [regression] Kernel OOPS on boot with Kernel 6.3(.1) and RTL8153
 Gigabit Ethernet Adapter
Content-Language: en-US, de-DE
To: Jakub Kicinski <kuba@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>,
 Hayes Wang <hayeswang@realtek.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, Stanislav Fomichev <sdf@fomichev.me>
References: <ec4be122-e213-ca5b-f5d6-e8f9c3fd3bee@leemhuis.info>
 <87lei36q27.fsf@miraculix.mork.no> <20230505120436.6ff8cfca@kernel.org>
 <57dbce31-daa9-9674-513e-f123b94950da@leemhuis.info>
 <20230505123744.16666106@kernel.org>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230505123744.16666106@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1683354029;54b04070;
X-HE-SMSGID: 1pvBHM-0005z1-Kv



On 05.05.23 21:37, Jakub Kicinski wrote:
> On Fri, 5 May 2023 21:20:15 +0200 Linux regression tracking (Thorsten
> Leemhuis) wrote:
>>> Thorsten, how is the communication supposed to work in this case?
>>> Can you ask the reporter to test this?  
>>
>> I'd prefer to not become the man-in-the middle, that just delays things
>> and is fragile; but I can do that occasionally if developers really are
>> unwilling to go to bugzilla.
>>
>> Bugbot afaics will solve this, but using it right now would require me
>> to do something some maintainers don't like. See this sub-thread:
>>
>> https://lore.kernel.org/all/1f0ebf13-ab0f-d512-6106-3ebf7cb372f1@leemhuis.info/
>>
>> :-/
>>
>> This got me thinking: we could tell bugbot to start monitoring this
>> thread and then tell the reporter to CC to the new bug bugbot created.
>> Ugly, but might work.
>>
>>> I don't see them on CC...  
>>
>> Yeah, as stated in the initial mail of this thread: I sadly can't CC
>> them, because bugzilla.kernel.org tells users upon registration their
>> "email address will never be displayed to logged out users"... #sigh
>>
>> I wish things were different, I'm unhappy about this situation myself.
> 
> Let's work something out, because forwarding enough info for Bjorn to
> respond on the list means that we now have the conversation going in
> both places. So it's confusing & double the work for developers.

I know, I know, but I saw no other way.

> I don't seem to have the permissions on BZ, but I'm guessing we could
> do the opposite - you could flip bugbot on first to have it flush the BZ
> report to the list, and then reply on the list with regzbot tracking?

That's the plan for the future, but for now I don't want to do that, as
it might mess up other peoples workflows, as hinted above already and
discussed here:

https://lore.kernel.org/all/1f0ebf13-ab0f-d512-6106-3ebf7cb372f1@leemhuis.info/

That was only recently, but if you jump in there as well it might
persuade Konstantin to enable bugbot for other products/components. Then
I could and would do what you suggested.

Ciao, Thorsten
