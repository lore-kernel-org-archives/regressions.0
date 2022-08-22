Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BACC7FA
	for <regressions@lists.linux.dev>; Mon, 22 Aug 2022 10:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=R520qLhvi6eR64QPobcb0tF+bZFFRligcxZ5sitGwwQ=;
	t=1661164664; x=1662374264; b=jLvup+8fx5i+T1flc4T/mrgcrAQ6ictLCYE3+GMZYeT5Qqi
	0REnBqI7DYCi3DK/YnlxfssQttL/22i0E45nzer9KWVuyRi/s2bNw3GRB3GL69rITKU9muI/1p8lV
	r6JTG5sNLij2BKGqdOj3XbEKhvvJe4+sGFX0GJ8uBp8m81cM+4Fa4mOS0B8nQwsElDsuCp2nj7Vgl
	fnwrVFi3yNB71gATQSFJHgfbZhFs7g8rw2lv2f06KfrqA6ZjLV51sVSHEZcStnpjS7ikKvuoYJMaD
	DOLajBpe50pd2LVLvm1ILJQBdUaEgyABycdnvUFoB9C2wWcgG03DnbR6Eist5Dlg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1oQ4Z4-00EU40-0e;
	Mon, 22 Aug 2022 12:21:50 +0200
Message-ID: <644e506ab60a58b95bdbbb5d9c3e425622931f8f.camel@sipsolutions.net>
Subject: Re: New 6.1 net/mac80211/rx.c warning with iwlwifi / Ultimate-N
 6300 wifi
From: Johannes Berg <johannes@sipsolutions.net>
To: =?ISO-8859-1?Q?Lu=EDs?= Henriques <lhenriques@suse.de>, Hans de Goede
	 <hdegoede@redhat.com>
Cc: Gregory Greenman <gregory.greenman@intel.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>, "regressions@lists.linux.dev"
	 <regressions@lists.linux.dev>
Date: Mon, 22 Aug 2022 12:21:49 +0200
In-Reply-To: <YwNNXKEFcX/GK2Sv@suse.de>
References: <498d714c-76be-9d04-26db-a1206878de5e@redhat.com>
	 <YwNNXKEFcX/GK2Sv@suse.de>
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

On Mon, 2022-08-22 at 10:33 +0100, Lu=C3=ADs Henriques wrote:
> On Sat, Aug 20, 2022 at 03:12:33PM +0200, Hans de Goede wrote:
> > Hi All,
> >=20
> > While testing 6.0-rc1 on a Dell Latitude E6430 with:
> >=20
> > 03:00.0 Network controller: Intel Corporation Centrino Ultimate-N 6300 =
(rev 35)
> >=20
>=20
> I've just seem a similar splat on -rc2, with a different card:
>=20
> 02:00.0 Network controller: Intel Corporation Wireless 8260 (rev 3a)
>=20

Yeah this is an issue with the new multi-link work.

We've seen it too, though the rx->link _should_ be set to deflink here
in the cases of non-MLO connections.

We're investigating.

johannes
