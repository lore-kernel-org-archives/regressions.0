Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBC2125A0
	for <regressions@lists.linux.dev>; Thu, 13 Jul 2023 11:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=fIgDmYcoJkd7PIFdP4hS9xlcqxhxEOoDJGq8m/+LNS4=;
	t=1689248533; x=1690458133; b=xl5e+NNzGjhC3dWiGyuwKzLHhnhd0EYYys9d4ThUGs28Oaq
	4ow+krNtQM0GKxrqevR582+pMSpCgarFnN3g5TTayRTa99jnUEq3YSgew9gl+/cJcxcdc5sHauskP
	2bWln2PJcmLnBvMdVNVY3Rs8MzEeFt3ac+5zEgVjgPCGIo6u71jcHcxklgh9UIUCXJmfkndD5nN2I
	NfywwMqCcFun/pxP3YRbhzUd8FsRf7JKowou2Q8U7QvP3AQyJ5xXrTdeg6fTx9bEsucbqhQPH+hOl
	LsmhHccm2M0UTx6WyojNgx6q4RhngQlUbhifa6aI6yDzODcBuwiikS123pnSAxcg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qJu8p-001Df9-0b;
	Thu, 13 Jul 2023 13:05:47 +0200
Message-ID: <d1f9ca04bb055dc07f2a7f9f07f774e08913cf00.camel@sipsolutions.net>
Subject: Re: Closing down the wireless trees for a summer break?
From: Johannes Berg <johannes@sipsolutions.net>
To: Kalle Valo <kvalo@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, Jakub Kicinski
	 <kuba@kernel.org>
Date: Thu, 13 Jul 2023 13:05:45 +0200
In-Reply-To: <87wmz43xy4.fsf@kernel.org>
References: <87y1kncuh4.fsf@kernel.org>
	 <ZK7Yzd0VvblA3ONU@smile.fi.intel.com> <87wmz43xy4.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Thu, 2023-07-13 at 13:30 +0300, Kalle Valo wrote:
> Andy Shevchenko <andriy.shevchenko@intel.com> writes:
>=20
> > On Tue, Jun 13, 2023 at 05:22:47PM +0300, Kalle Valo wrote:
> >=20
> > ...
> >=20
> > > [1] https://phb-crystal-ball.sipsolutions.net/
> >=20
> > How could one use the shut down site?
>=20
> What do you mean? At least from Finland it Works for me:

That did in fact not work yesterday for some time as I was doing some
maintenance :)

johannes
