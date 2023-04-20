Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6AA8C15
	for <regressions@lists.linux.dev>; Thu, 20 Apr 2023 15:56:29 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1682006187; bh=U+Ha7iX6ggmmBf5zjDVQjSOCPw1VlO3VsjG4iIn8pak=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fOubRk4GK+NxS4BaZgg0A+gIHXx1Fds00lnqfoKAnNY0gn45yhOqqwBuZZ9ZWvDAN
	 x9EuhKrAgHbU69dYp2QA+pYHVvLTtSLZHitJbjCFb51LWHCocDqvZVcWvpUIVFq8+o
	 N+wjf+lP9CSMbMiUYkwjysmfTvVauB/rThTQJmgFdA4C1HCE67V019RPwv42CrSVcC
	 ZOyFtyBwakEZxauVlWy7Eb3CLE3Xb+6jwqW5WibJU8d9MVpQFAlQ5jOUFBu3vTNuL7
	 ItPqFKf9F23EqQU+5XJGlSeEve+p+XrZFyxM7S+HAJOBwzftSziZZKvvT0+QQJE45+
	 Pr6yFIYHM/33A==
To: Jakub Kicinski <kuba@kernel.org>, Thorsten Leemhuis
 <regressions@leemhuis.info>
Cc: Kalle Valo <kvalo@kernel.org>, Colin Ian King <colin.i.king@gmail.com>,
 linux-wireless@vger.kernel.org, Linux kernel regressions list
 <regressions@lists.linux.dev>, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] wifi: ath9k: Don't mark channelmap stack variable
 read-only in ath9k_mci_update_wlan_channels()
In-Reply-To: <20230420075027.6852197a@kernel.org>
References: <20230413214118.153781-1-toke@toke.dk>
 <87v8hysrzx.fsf@kernel.org> <87bkjqzrdm.fsf@toke.dk>
 <87edom7i6i.fsf@kernel.org> <877cu9wl7r.fsf@toke.dk>
 <87zg74v5cy.fsf@kernel.org>
 <f4939cb3-bc01-c9e1-aac9-2adb554bc3c4@leemhuis.info>
 <87edoetyve.fsf@toke.dk> <20230420075027.6852197a@kernel.org>
Date: Thu, 20 Apr 2023 17:56:26 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87354utumt.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Jakub Kicinski <kuba@kernel.org> writes:

>> > He doesn't
>> > mind doing that for an occasional regression fix. And then he can decide
>> > himself if the change is worth the risk -- and obviously can take into
>> > account if he'll release and rc8 or not.  
>> 
>> I'm OK with doing it that way; I'll do so later tonight unless Kalle or
>> Jakub complains before then...
>
> Ah, just after our last(?) 6.3 PR was submitted :(
> No objections to you posting this directly to Linus...

Heh, yeah :( In retrospect, just asking you to take it directly into
-net might have been the expedient thing to do here.

> That said it is a 6.2 regression AFAICT so it's not exactly in the
> "must be fixed in 6.3" category. Assuming Kalle doesn't want a PR -
> should we take it into net and have it reach Linus either next Tue
> (assuming no -rc8) or Thu (if -rc8)?

How about I ping Linus and if he doesn't want to take it directly, you
can pull it into -net?

-Toke
