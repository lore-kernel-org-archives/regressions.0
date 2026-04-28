Received: from mailout2.hostsharing.net (mailout2.hostsharing.net [83.223.78.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB873DA5C5
	for <regressions@lists.linux.dev>; Tue, 28 Apr 2026 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777370293; cv=none; b=R8XhCwnKL8Z9A2ZisqTKoFZtcofebS7EH0QB2PCqu99VR+DkzcbNXxTJXido/6aZeSVttNYJLqPIbfHV8T52f9Zbzqp3s+bgYcTeBXkiN9NICsjW/uoi8MlfnMJa6cdA4lLtIcdWTKT4edbK85CnHkbTjlcFSbsvvvB3uIBKoNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777370293; c=relaxed/simple;
	bh=AANVrtiuKHOX9EkivNHz7obhlqfxoVqwjKfsh5xXeDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skImJi4UuellLXP2MnQPUBq424ApBkeZDU2jEfkzsrZBKcPyxBHOH4320cJa/1tp6OdifLb2ez1LrS9SUzVxhBPkTmiCeTn8NpTljZ47L/N+YqObcHvy/Nf6TuUSqcn3FS4aVwUkk/RddkTWLLvDaZOP7n+jxYav2EHTQvVq+q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.78.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout2.hostsharing.net (Postfix) with ESMTPS id AA10810604;
	Tue, 28 Apr 2026 11:58:00 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 957696127156; Tue, 28 Apr 2026 11:58:00 +0200 (CEST)
Date: Tue, 28 Apr 2026 11:58:00 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: regressions@lists.linux.dev
Subject: Re: [6.12.y regression] Regression with 58130e7ce6cb ("PCI/ERR:
 Ensure error recoverability at all times"): echo vfio-pci >driver_override
 does not work for DVB Adapter
Message-ID: <afCEqLEHkqUWRBlr@wunner.de>
References: <177373189751.7987.7156982489427825197.reportbug@obelix-trixie.bs.de>
 <acfZrlP0Ua_5D3U4@eldamar.lan>
 <f0054ecb-2524-42e5-ac1d-ed8ab114bcef@leemhuis.info>
 <ae2lgMRLPDQZSzI6@wunner.de>
 <833c7e46-c44d-4715-b2ea-01723ada8e58@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <833c7e46-c44d-4715-b2ea-01723ada8e58@leemhuis.info>

On Tue, Apr 28, 2026 at 10:41:51AM +0200, Thorsten Leemhuis wrote:
> On 4/26/26 07:41, Lukas Wunner wrote:
> > #regzbot introduced: a2f1e22390ac
> > #regzbot introduced: v6.12.70..
> > #regzbot introduced: v6.18.10..
> > #regzbot introduced: v6.19..
> 
> Thx for this. This is an interesting idea nobody had yet. But I guess it
> should work the other way around: assume that affects all branches that
> contain a2f1e22390ac and a backport of it, unless told otherwise (at
> usually that's the case).

Right, we originally thought that only v6.12-stable is affected but
it turned out that mainline is affected as well.

On the dashboard at...

https://linux-regtracking.leemhuis.info/regzbot/

... the regression was previously only listed on the stable/longterm page.
After I sent the above-quoted update, it's now listed on the mainline page,
but under:

"older cycles (..v6.19), unknown culprit, with activity in the past three weeks"

I think the correct one would be:

"older cycles (..v6.19), culprit identified, with activity in the past three months
"

or

"previous cycle (v6.19..v7.0), culprit identified, with activity in the past three months"

It's unclear to me why both of these lists have v6.19 in their title.
The latter only contains regressions introduced in v7.0-rc1, so I suppose
v6.19 being named in the list title might be erroneous.

> > #regzbot title: PCI VFIO passthrough broken if BIOS assigned incorrect BARs
> > #regzbot fix: 'PCI: Update saved_config_space upon resource assignment'
> > #regzbot monitor: https://lore.kernel.org/all/acfZrlP0Ua_5D3U4@eldamar.lan/
> 
> Any idea when that patch might be reviewed and make it further? I assume
> Bjorn is the bottleneck (and seems to have been afk or something?)?

TBH the reason I sent this update to the regression tracker was to
raise awareness and maybe prompt you to ping Bjorn.  ;)
It's more effective when a ping comes from someone else than the
patch submitter.  Upstream diplomacy... ;)

Thanks,

Lukas
