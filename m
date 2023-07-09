Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C268E8828
	for <regressions@lists.linux.dev>; Sun,  9 Jul 2023 18:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=QXMFC6gz8KNAOpyGfeaSWSTcXiuxDivyP/I51DPhIWo=;
	t=1688927500; x=1690137100; b=Syun+NZupcaFTXEK9620vJ4vrLpDK6IBcs6w5lm9iGViKhO
	JG3DOrnQ2ECOj39ct10Fj0nFGQ3FoaqA8ENbJnqb1vMK2o9K5/xLZxpbQqA7GVDU1gdv5WJra4yBm
	JFmz0Is424gL8Yg6fECc+OUCIyup02qpdCxNVvoeKvyOy2+6QZgvSpn3H8YK88bxa0CJg3LRJeNyP
	LU5x0QnypDWoYS+B3AKA88hk9vPaU0HJfpPq3w+IP+bTeTp2toV4gjqO4hmhxufnzI/iZyZEhgGm+
	eGphld4RSgXX2YInDlaK9CdA938Qx7Z9mkHqNS0cId3KHdz5lcsmluYheBTo7Evg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qIYov-00Dn5B-1O;
	Sun, 09 Jul 2023 20:07:41 +0200
Message-ID: <446c25888d9316d0f15e6bcc6ecb100dda99324e.camel@sipsolutions.net>
Subject: Re: [Regression][BISECTED] kernel boot hang after 19898ce9cf8a
 ("wifi: iwlwifi: split 22000.c into multiple files")
From: Johannes Berg <johannes@sipsolutions.net>
To: Linus Torvalds <torvalds@linux-foundation.org>, Linux regressions
	mailing list <regressions@lists.linux.dev>
Cc: "Zhang, Rui" <rui.zhang@intel.com>, "Greenman, Gregory"
 <gregory.greenman@intel.com>, "linux-wireless@vger.kernel.org"
 <linux-wireless@vger.kernel.org>, "Baruch, Yaara" <yaara.baruch@intel.com>,
  "Ben Ami, Golan" <golan.ben.ami@intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,  "Sisodiya, Mukesh"
 <mukesh.sisodiya@intel.com>, Kalle Valo <kvalo@kernel.org>, "David S.
 Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, netdev <netdev@vger.kernel.org>,  Jakub Kicinski
 <kuba@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>
Date: Sun, 09 Jul 2023 20:07:40 +0200
In-Reply-To: <CAHk-=wg23SdKRcn2W+BWWEfJ2Efp0sreJx9=iw0AsUPjW3qznw@mail.gmail.com>
References: <b533071f38804247f06da9e52a04f15cce7a3836.camel@intel.com>
	 <a4265090-d6b8-b185-a400-b09b27a347cc@leemhuis.info>
	 <CAHk-=wg23SdKRcn2W+BWWEfJ2Efp0sreJx9=iw0AsUPjW3qznw@mail.gmail.com>
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

On Sun, 2023-07-09 at 09:31 -0700, Linus Torvalds wrote:
> On Fri, 7 Jul 2023 at 03:55, Linux regression tracking (Thorsten
> Leemhuis) <regressions@leemhuis.info> wrote:
> >=20
> > [CCing the regression list, netdev, the net maintainers, and Linus;
> > Johannes and Kalle as well, but just for the record, they afaik are
> > unavailable]
>=20
> So I will release rc1 with this issue, but remind me - if it hasn't
> had any traction next week and the radio silence continues, I'll just
> revert it all.

Sorry. I got back home a few hours ago (for few days anyway) and I think
I already know what the issue is. I'll send a fix to try in a few
minutes, was just trying to collect all the reported-by etc.

There's clearly a separate bug in the init failure path, but the reason
it fails in the first place is a mismatch between different changes.

johannes


