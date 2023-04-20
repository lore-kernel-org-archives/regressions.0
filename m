Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030138BE9
	for <regressions@lists.linux.dev>; Thu, 20 Apr 2023 13:50:32 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ppUg4-0004pQ-QH; Thu, 20 Apr 2023 15:50:24 +0200
Message-ID: <f4939cb3-bc01-c9e1-aac9-2adb554bc3c4@leemhuis.info>
Date: Thu, 20 Apr 2023 15:50:22 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] wifi: ath9k: Don't mark channelmap stack variable
 read-only in ath9k_mci_update_wlan_channels()
Content-Language: en-US, de-DE
To: Kalle Valo <kvalo@kernel.org>, =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgense?=
 =?UTF-8?Q?n?= <toke@toke.dk>
Cc: Colin Ian King <colin.i.king@gmail.com>, linux-wireless@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Jakub Kicinski <kuba@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
References: <20230413214118.153781-1-toke@toke.dk> <87v8hysrzx.fsf@kernel.org>
 <87bkjqzrdm.fsf@toke.dk> <87edom7i6i.fsf@kernel.org> <877cu9wl7r.fsf@toke.dk>
 <87zg74v5cy.fsf@kernel.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <87zg74v5cy.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1681998633;24fc74d9;
X-HE-SMSGID: 1ppUg4-0004pQ-QH

[CCing Jakub, Greg and the regressions list]

On 19.04.23 06:54, Kalle Valo wrote:
> Toke Høiland-Jørgensen <toke@toke.dk> writes:
> 
>>>> Anyway, cf the bugzilla

[FWIW, it's this ticket Toke meant:
https://bugzilla.kernel.org/show_bug.cgi?id=217286 ]

>>>> this was a pretty bad regression for 6.2, so
>>>> would be good to move this along reasonably quickly (although I guess we
>>>> just missed the -net PR for rc7)...
>>>
>>> I'm not planning to send anymore stuff to v6.3 so my plan is to take
>>> this to -next. The merge window is very close anyway so this shouldn't
>>> cause too much delay.
>>
>> Hmm, okay, a bit unfortunate that we'll ship 6.3 with the same bug
> 
> Yeah, it is unfortunate.

Agreed.

> But it is always a question of time :) To save
> time I usually try to send two wireless tree pull requests per cycle,
> one early in the cycle and the second around the middle.

Why not ask Linus to pull this directly from the list then? He doesn't
mind doing that for an occasional regression fix. And then he can decide
himself if the change is worth the risk -- and obviously can take into
account if he'll release and rc8 or not.

That's why Documentation/process/handling-regressions.rst
(https://docs.kernel.org/process/handling-regressions.html ) even tells
people to use that approach in a situation like this one.

Fun fact: that document also says "Subsystem maintainers are expected to
assist in reaching those periods [...]. They thus might have to send
git-pull requests earlier or more often than usual; [...]". That whole
section has a lot of "Ideally" in it, because yes, this thing called
real life is complicated sometimes and we are all volunteers. But still
it's a bit unfortunate that such a important tree like wireless doesn't
sent its fixes upstream every week.

> The patch has cc stable so I assume it should go quickly to stable
> releases.

To me it looks a lot like Greg most of the time only backports important
bug fixes during merge windows (e.g. when asked or when he noticed
something important) -- and leaves everything else often until after
rc1. And when there are a lot of backports, he might even do it in two
batches then. Hence it might easily take until ~May 11th or 18th (if we
get a rc8) until this fix reaches 6.2.y and 6.3.y.

Then it in the end would have taken about one month for the fix to reach
the users. That is really unfortunate. Preventing such situations (which
are not rare) is one of the main reason why handling-regressions.rst was
written like it is...

Ciao, Thorsten
