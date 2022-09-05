Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A79E468E
	for <regressions@lists.linux.dev>; Mon,  5 Sep 2022 18:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=2mo00bTGgt2dxVlxo0oTd3s2ZGticoNa+/KiiRuE7us=;
	t=1662400983; x=1663610583; b=bmY86KPY+7FhUbDt6tvrojwHzGiLjO6ME+aYBBwVx/3zKXr
	ezOXsX7LlkMy1dSJCoS8/FhsY8YMcMo/+sdDPlaJdY3USyE42Erg2vJsRAu4f4Tg1Y6IODQbE055N
	qoDfThpfi8IlyKYRDaLsYltV+k8sQjcnAu4a1f6cYXza14aL8czAJ8ulqC2xSSXfnaG5/zHEwAgfd
	M46ZqjIu9uwso5QyEQzhI15JfdJtKduvwJOKEjDT7pvDLMmR52zYJ6ElmcCCdqmXTInXe4shbzIBb
	wnR5BMrQks5hnGGQ/Yag1eB0+7vgnIPd1rRhHCdjruaFPoX6bMtIeyXwDm5ZwqAg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1oVFp0-008e7a-2R;
	Mon, 05 Sep 2022 19:23:42 +0200
Message-ID: <f2288c0419d2d1a4ae9935e52c0ef62bfaed5f9a.camel@sipsolutions.net>
Subject: Re: New 6.1 net/mac80211/rx.c warning with iwlwifi / Ultimate-N
 6300 wifi
From: Johannes Berg <johannes@sipsolutions.net>
To: =?ISO-8859-1?Q?Lu=EDs?= Henriques <lhenriques@suse.de>
Cc: Hans de Goede <hdegoede@redhat.com>, Gregory Greenman
 <gregory.greenman@intel.com>, linux-wireless
 <linux-wireless@vger.kernel.org>,  "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>
Date: Mon, 05 Sep 2022 19:23:41 +0200
In-Reply-To: <YxYu0CawomVcTlRn@suse.de>
References: <498d714c-76be-9d04-26db-a1206878de5e@redhat.com>
	 <YwNNXKEFcX/GK2Sv@suse.de>
	 <644e506ab60a58b95bdbbb5d9c3e425622931f8f.camel@sipsolutions.net>
	 <YxYu0CawomVcTlRn@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Mon, 2022-09-05 at 18:16 +0100, Lu=C3=ADs Henriques wrote:
> On Mon, Aug 22, 2022 at 12:21:49PM +0200, Johannes Berg wrote:
> > On Mon, 2022-08-22 at 10:33 +0100, Lu=C3=ADs Henriques wrote:
> > > On Sat, Aug 20, 2022 at 03:12:33PM +0200, Hans de Goede wrote:
> > > > Hi All,
> > > >=20
> > > > While testing 6.0-rc1 on a Dell Latitude E6430 with:
> > > >=20
> > > > 03:00.0 Network controller: Intel Corporation Centrino Ultimate-N 6=
300 (rev 35)
> > > >=20
> > >=20
> > > I've just seem a similar splat on -rc2, with a different card:
> > >=20
> > > 02:00.0 Network controller: Intel Corporation Wireless 8260 (rev 3a)
> > >=20
> >=20
> > Yeah this is an issue with the new multi-link work.
> >=20
> > We've seen it too, though the rx->link _should_ be set to deflink here
> > in the cases of non-MLO connections.
> >=20
> > We're investigating.
>=20
> FWIW I'm still seeing this with RC4.
>=20

Yes we just missed rc4, but=20

commit 4a86c5462616e0d690ad3c94dc84c3b5f1ea5631
Author: Mukesh Sisodiya <mukesh.sisodiya@intel.com>
Date:   Fri Sep 2 16:11:31 2022 +0200

    wifi: mac80211: fix link warning in RX agg timer expiry


should be coming to a tree near you soon. :)

johannes
