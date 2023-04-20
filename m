Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45168463
	for <regressions@lists.linux.dev>; Thu, 20 Apr 2023 14:33:44 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1682000694; bh=E9XJVOmJ1bm+Iklvbl84fFxZmgKraJawpM38/QZM2a8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=W5Fw4FRbE7E2+k5TL7dCCU79mf7pT9sYiHzNEFYokKRfu3sIVu8LR8EkUvoC1qU2J
	 OQxhxWepvw3xikvX7ukfkmlYKW8L4o0+W9UX/ZYGU4OdwLiSrsr7482y2bzUd/Rx1K
	 wnIOkAJByrlEkV1caUz/bKLoMHWBLMxeYSHC01/Zh8hH/LInk5Dn6n80fU9mqA+PHO
	 afX+xQQPOopbA+O+esXylm2CGl5UNKgtsw2+yZJUEvjP03k7fvo76W8CF1rArDL2Vx
	 mMs3eEb0ac53Azn1AQYHEdrAtMyBfTJipFiiGKo6nzHtfO06IqXNHdd1ky7WJbPkAS
	 TO36cB7U66rFA==
To: Thorsten Leemhuis <regressions@leemhuis.info>, Kalle Valo
 <kvalo@kernel.org>
Cc: Colin Ian King <colin.i.king@gmail.com>, linux-wireless@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>, Jakub
 Kicinski <kuba@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] wifi: ath9k: Don't mark channelmap stack variable
 read-only in ath9k_mci_update_wlan_channels()
In-Reply-To: <f4939cb3-bc01-c9e1-aac9-2adb554bc3c4@leemhuis.info>
References: <20230413214118.153781-1-toke@toke.dk>
 <87v8hysrzx.fsf@kernel.org> <87bkjqzrdm.fsf@toke.dk>
 <87edom7i6i.fsf@kernel.org> <877cu9wl7r.fsf@toke.dk>
 <87zg74v5cy.fsf@kernel.org>
 <f4939cb3-bc01-c9e1-aac9-2adb554bc3c4@leemhuis.info>
Date: Thu, 20 Apr 2023 16:24:53 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87edoetyve.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thorsten Leemhuis <regressions@leemhuis.info> writes:

> [CCing Jakub, Greg and the regressions list]
>
> On 19.04.23 06:54, Kalle Valo wrote:
>> Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk> writes:
>>=20
>>>>> Anyway, cf the bugzilla
>
> [FWIW, it's this ticket Toke meant:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217286 ]
>
>>>>> this was a pretty bad regression for 6.2, so
>>>>> would be good to move this along reasonably quickly (although I guess=
 we
>>>>> just missed the -net PR for rc7)...
>>>>
>>>> I'm not planning to send anymore stuff to v6.3 so my plan is to take
>>>> this to -next. The merge window is very close anyway so this shouldn't
>>>> cause too much delay.
>>>
>>> Hmm, okay, a bit unfortunate that we'll ship 6.3 with the same bug
>>=20
>> Yeah, it is unfortunate.
>
> Agreed.
>
>> But it is always a question of time :) To save
>> time I usually try to send two wireless tree pull requests per cycle,
>> one early in the cycle and the second around the middle.
>
> Why not ask Linus to pull this directly from the list then? He doesn't
> mind doing that for an occasional regression fix. And then he can decide
> himself if the change is worth the risk -- and obviously can take into
> account if he'll release and rc8 or not.

I'm OK with doing it that way; I'll do so later tonight unless Kalle or
Jakub complains before then...

-Toke
