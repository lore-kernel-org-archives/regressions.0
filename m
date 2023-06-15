Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059DA15AF4;
	Thu, 15 Jun 2023 12:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573D9C433C8;
	Thu, 15 Jun 2023 12:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686832380;
	bh=7SJSooLHw1XqH2UYNvRcPE3YydGNfm0xAFxd/c7vKJo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=e9DQHLZiLiYiczEKwCFXENboEz+vMXQomeNyJgQhiOS6DV2nBjiexJ3MOToPtBfS1
	 pPwRD735PQTbUQQNhPbSwamMRH9gjnmQI+71KBuz0Wk5kOMqBUCmb6YqM0IR2NOZa7
	 iec3qB+xHUVB6wtdkeaNQaEudyxzUtsnjj+xwZUluYWBxOlNmrPZGtXVyqfT9a0Bi1
	 8T4twX0pgNKlaYYJf/zXkzeOp1vnl3EFSy+IvaBS+XScfiRasUb6mo7Tjxxma2rBco
	 GNBuVNzZslNh8Gbk2IBJdFIgm94rnlylbeEYmS1TF3f0zshwQm4/tDQVDoRXo/24YP
	 yhtIIFO4BZc+w==
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id D1851BBEC2D; Thu, 15 Jun 2023 14:32:56 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Closing down the wireless trees for a summer break?
In-Reply-To: <20230614122153.640292b9@kernel.org>
References: <87y1kncuh4.fsf@kernel.org> <871qifxm9b.fsf@toke.dk>
 <20230613112834.7df36e95@kernel.org>
 <ba933d6e3d360298e400196371e37735aef3b1eb.camel@sipsolutions.net>
 <20230613195136.6815df9b@kernel.org>
 <c7c9418bcd5ac1035a007d336004eff48994dde7.camel@sipsolutions.net>
 <87a5x2ccao.fsf@kernel.org> <20230614122153.640292b9@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 15 Jun 2023 14:32:56 +0200
Message-ID: <87sfasgb2f.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Jakub Kicinski <kuba@kernel.org> writes:

> On Wed, 14 Jun 2023 18:07:43 +0300 Kalle Valo wrote:
>> But do note that above is _only_ for -next patches. For patches going to
>> -rc releases we apply the patches directly to wireless, no other trees
>> are involved. My proposal was that net maintainers would take only fixes
>> for -rc releases, my guess from history is that it would be maximum of
>> 10-15 patches. And once me and Johannes are back we would sort out -next
>> patches before the merge window. But of course you guys can do whatever
>> you think is best :)
>
> Ah, good note, I would have guessed that fixes go via special trees,
> too. In that case it should indeed be easy. We'll just look out for
> maintainer acks on the list and ping people if in doubt.

SGTM! :)

-Toke
