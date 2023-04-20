Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F148C04
	for <regressions@lists.linux.dev>; Thu, 20 Apr 2023 16:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39630C433EF;
	Thu, 20 Apr 2023 16:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682008769;
	bh=IlLmoBR30VHOvB7zuqLroV3YsOBxKZRaSVoM66G17X8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LRi9f0KYg7JojQNqGfcS/hqbhVxMWoXDyQEZos2rZab6+1YX2Av/Op+VoKzXHxtN8
	 zhsLbOm+XTF1OpH7VYXaqGblSqJuI/2cf4oiAepbUdXq/G02guHXLIHqhNFkJlD6HA
	 jtLOgH+tFoWinph9qagd5ZOFWBe6udjrxGx0j7PilBUsM74DRgmcY83DOFe5el/eG2
	 PdJwi1HhOUPnWsuomAzRMzKo11ucZX6MNi4+PBRckZ7n8kv6HYe4M4px2hZsRmZ559
	 mvL4M46qL7LyzehZqiqWZI9a2/UlAXIhBnaz4njhAEi86i/8TOgOzX1s8IqwdcIYv2
	 1C4y7GTWJsn7w==
Date: Thu, 20 Apr 2023 09:39:28 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@toke.dk>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Kalle Valo
 <kvalo@kernel.org>, Colin Ian King <colin.i.king@gmail.com>,
 linux-wireless@vger.kernel.org, Linux kernel regressions list
 <regressions@lists.linux.dev>, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] wifi: ath9k: Don't mark channelmap stack variable
 read-only in ath9k_mci_update_wlan_channels()
Message-ID: <20230420093928.2788b3ce@kernel.org>
In-Reply-To: <87354utumt.fsf@toke.dk>
References: <20230413214118.153781-1-toke@toke.dk>
	<87v8hysrzx.fsf@kernel.org>
	<87bkjqzrdm.fsf@toke.dk>
	<87edom7i6i.fsf@kernel.org>
	<877cu9wl7r.fsf@toke.dk>
	<87zg74v5cy.fsf@kernel.org>
	<f4939cb3-bc01-c9e1-aac9-2adb554bc3c4@leemhuis.info>
	<87edoetyve.fsf@toke.dk>
	<20230420075027.6852197a@kernel.org>
	<87354utumt.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Apr 2023 17:56:26 +0200 Toke H=C3=B8iland-J=C3=B8rgensen wrote:
> > That said it is a 6.2 regression AFAICT so it's not exactly in the
> > "must be fixed in 6.3" category. Assuming Kalle doesn't want a PR -
> > should we take it into net and have it reach Linus either next Tue
> > (assuming no -rc8) or Thu (if -rc8)? =20
>=20
> How about I ping Linus and if he doesn't want to take it directly, you
> can pull it into -net?

Fine by me :)  Just make sure to CC netdev
