Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AADF136A
	for <regressions@lists.linux.dev>; Tue, 13 Jun 2023 20:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=ctNb/7yUvrT2D51cOWDJeRoN3fAPETOIpuMJ8jKqL9k=;
	t=1686686447; x=1687896047; b=pWIRVKifdOkFsxThXP8CvVxdw8MwYapfEwuWk/sHPdw1nwh
	lfHkQvn81IHUcn90dVHHvMijQaiVOnRY8ZC16Abl2n5P3l+R42wufSS3Ex/pr0GpxlCJNBdG5DOVi
	hBUYIFvlq/ahXrWk5oaYrvXag0u7bL26t9oX2Jk5D3nkWWp4uYvJS0xuJRSMznpeLeG9TEuHvXkUJ
	gML0AVr7ev7faQbuOuh6mNTVEsBh7XKHnFtu0u4C24tZsTPx2li8tjaHA3VyDK9uY44hGb3k/sAmJ
	xoAJryjM4cSQsfYOKM+fGCo3rCR5kxF1GxuTIgLV+LPNLI4ZEJGRx6uHTpsMhWTg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1q9ABw-005CKc-2j;
	Tue, 13 Jun 2023 22:00:36 +0200
Message-ID: <ba933d6e3d360298e400196371e37735aef3b1eb.camel@sipsolutions.net>
Subject: Re: Closing down the wireless trees for a summer break?
From: Johannes Berg <johannes@sipsolutions.net>
To: Jakub Kicinski <kuba@kernel.org>, Toke
	=?ISO-8859-1?Q?H=F8iland-J=F8rgensen?=
	 <toke@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Date: Tue, 13 Jun 2023 22:00:35 +0200
In-Reply-To: <20230613112834.7df36e95@kernel.org>
References: <87y1kncuh4.fsf@kernel.org> <871qifxm9b.fsf@toke.dk>
	 <20230613112834.7df36e95@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Tue, 2023-06-13 at 11:28 -0700, Jakub Kicinski wrote:
> On Tue, 13 Jun 2023 20:14:40 +0200 Toke H=C3=B8iland-J=C3=B8rgensen wrote=
:
> > I think this sounds reasonable, and I applaud the effort to take some
> > time off during the summer :)
> >=20
> > One question that comes to mind is how would this work for patchwork?
> > Would we keep using the wireless patchwork instance for the patches
> > going to -net in that period, or will there be some other process for
> > this? I realise the setup we have for ath9k is a bit special in this
> > regard with the ack-on-list+delegation, so I'm obviously mostly
> > interested in what to do about that... :)
>=20
> Whatever's easiest :) It's probably a good idea for Kalle to write
> down all the local rules and customs and share those with us.
>=20

While that's probably a good idea regardless, I'd think that patchwork
doesn't really matter that much - we'll have some catching up to do
anyway after the vacations, so looking through patchwork etc. would be
perfectly acceptable. Worst case we'd notice when a patch doesn't apply,
right? :)

Wrt. ath9k patches I guess "delegate in patchwork" won't work anymore,
but "resend to netdev" or something perhaps?

johannes
