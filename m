Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4109338CA4;
	Tue, 13 Jun 2023 18:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638C9C433D9;
	Tue, 13 Jun 2023 18:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686680915;
	bh=/D3YYRMFOxqtGYTim6YsH/QIEOLyRikQxfcIqm7Q9CE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LMOpkFDyGl8VngQ9e6e5EXkezJaA/iY/p72Nv7SmYBStPo/y2m9FJ1gMHUTaDViQS
	 WjoddG2ndc2qFJbIOIKCh0cbKv2Mst+g1lPqrx84hTmoqN1zppG3Qa6KkAA0uumk5a
	 Roj5fHWZq49Vx+VWVKz3hxGYyHzrerjh4GbYnbjDk89FWJtGa5oGfKkgXrjAXSqa6t
	 TGFZGkz7RLoTAh3GtqjX8MwZ+A73/lUw7niu4aXAEQJbhV9r4tSdqHwd/ml+L+pCor
	 tEcAPKSEi4ZYqiyX0r1+oKYBzPL1kIfLZcDjeuYHjTO8heHwjzhDZpYB3aLKxDnuaL
	 jQwPMNRe5bv5w==
Date: Tue, 13 Jun 2023 11:28:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, Johannes Berg <johannes@sipsolutions.net>
Subject: Re: Closing down the wireless trees for a summer break?
Message-ID: <20230613112834.7df36e95@kernel.org>
In-Reply-To: <871qifxm9b.fsf@toke.dk>
References: <87y1kncuh4.fsf@kernel.org>
	<871qifxm9b.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Jun 2023 20:14:40 +0200 Toke H=C3=B8iland-J=C3=B8rgensen wrote:
> I think this sounds reasonable, and I applaud the effort to take some
> time off during the summer :)
>=20
> One question that comes to mind is how would this work for patchwork?
> Would we keep using the wireless patchwork instance for the patches
> going to -net in that period, or will there be some other process for
> this? I realise the setup we have for ath9k is a bit special in this
> regard with the ack-on-list+delegation, so I'm obviously mostly
> interested in what to do about that... :)

Whatever's easiest :) It's probably a good idea for Kalle to write
down all the local rules and customs and share those with us.
