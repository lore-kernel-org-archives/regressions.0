Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6860B63C7
	for <regressions@lists.linux.dev>; Wed, 14 Jun 2023 09:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=4urHoDTcQ5msAxG4a15V6mp6BTEGox77QEHbH6T6xAY=;
	t=1686736584; x=1687946184; b=qDST8gxV9Hev/RuU49xdsTgG25nuukVNxEdvAJrGvKFBSqH
	HyL2kIYy0RvZ+YA1TuT5AX6P2YNfzU0036JAN6rBMEBieCIzJxUx/HFCvwf8ZcqHQ2POxHPskmF8L
	5ZXpd6HUE3lhDzoW9BHuFP/5tEB0XEWejZ1bexEvfHnLlJRFPakKk7idJ84PL8WqOJiWxpS4Z40qb
	t7kHSqCQoXstHx3p+OTY/7q3GvsGe4u+9tr7/ml9sKq60GB89/Wkfu76imK6xIvsmEwKStJM7N+1k
	MWDvSPheALpQXJrTdXD7tyeT99r8VqX/ePJH4bREHfcSXVkgX8Aci11wkBIEyh9A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1q9NEf-0063ay-2e;
	Wed, 14 Jun 2023 11:56:17 +0200
Message-ID: <c7c9418bcd5ac1035a007d336004eff48994dde7.camel@sipsolutions.net>
Subject: Re: Closing down the wireless trees for a summer break?
From: Johannes Berg <johannes@sipsolutions.net>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@kernel.org>, Kalle
 Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
Date: Wed, 14 Jun 2023 11:56:16 +0200
In-Reply-To: <20230613195136.6815df9b@kernel.org>
References: <87y1kncuh4.fsf@kernel.org> <871qifxm9b.fsf@toke.dk>
	 <20230613112834.7df36e95@kernel.org>
	 <ba933d6e3d360298e400196371e37735aef3b1eb.camel@sipsolutions.net>
	 <20230613195136.6815df9b@kernel.org>
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

On Tue, 2023-06-13 at 19:51 -0700, Jakub Kicinski wrote:
> On Tue, 13 Jun 2023 22:00:35 +0200 Johannes Berg wrote:
> > On Tue, 2023-06-13 at 11:28 -0700, Jakub Kicinski wrote:
> > > On Tue, 13 Jun 2023 20:14:40 +0200 Toke H=C3=B8iland-J=C3=B8rgensen w=
rote: =20
> > > > I think this sounds reasonable, and I applaud the effort to take so=
me
> > > > time off during the summer :)
> > > >=20
> > > > One question that comes to mind is how would this work for patchwor=
k?
> > > > Would we keep using the wireless patchwork instance for the patches
> > > > going to -net in that period, or will there be some other process f=
or
> > > > this? I realise the setup we have for ath9k is a bit special in thi=
s
> > > > regard with the ack-on-list+delegation, so I'm obviously mostly
> > > > interested in what to do about that... :) =20
> > >=20
> > > Whatever's easiest :) It's probably a good idea for Kalle to write
> > > down all the local rules and customs and share those with us.
> >=20
> > While that's probably a good idea regardless, I'd think that patchwork
> > doesn't really matter that much - we'll have some catching up to do
> > anyway after the vacations, so looking through patchwork etc. would be
> > perfectly acceptable. Worst case we'd notice when a patch doesn't apply=
,
> > right? :)
>=20
> Right, I meant it more in terms of patch flow. Is looking at which
> drivers have a tree specified in MAINTAINERS enough to know what
> should be applied directly?

Oh, right. Not really sure how well that all is reflected in
MAINTAINERS.

So Gregory usually handles patches for iwlwifi, but he'll _also_ be on
vacation around a similar time frame.

Toke usually reviews patches for ath9k but then asks Kalle (via
assigning in patchwork) to apply them.

Felix usually picks up patches for mediatek drivers (unless specifically
asking Kalle for individual ones) and then sends a pull request.

For the stack (all the bits we have under net/) that's just on me,
normally.

I think that's it? But I guess Kalle will have more comments.


> > Wrt. ath9k patches I guess "delegate in patchwork" won't work anymore,
> > but "resend to netdev" or something perhaps?
>=20
> We can watch PW state and apply from linux-wireless, I reckon.
> That said I don't know how you use delegation :)

We have auto-delegation set up for this, except iwlwifi is on me right
now for the upstream, and I just delegate other incoming patches to
Gregory.

johannes
