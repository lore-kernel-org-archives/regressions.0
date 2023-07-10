Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0A83D76
	for <regressions@lists.linux.dev>; Mon, 10 Jul 2023 15:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=sXd8fOLlAD3XJ6DIwb78DhwDpyb7fuPEHcC/aPSb/gc=;
	t=1689001364; x=1690210964; b=BndTAzpfCFzcDCvvRVNJKMLo/Lxy3nV/MOrCc+7fj6/Uv79
	yFOmB8gTzvmPIaNuRsMV8f65ofxK6TLpTMnkXTKosYOGFJA7s/gldkoVcho+Zfy5PQYOEtHnmhOjN
	Ml4oz5/efpTiMUm3WrWxhhyBx0i6DTAd6g+FP4n4zfjwGs7XV0sNY+pE5CCfnh5cBshxNRrf7Rmf+
	cCGdvBja6AX4ujIZutrrz3Shvau794xenbZ+oy0+GqaeeTEPVOMRw/CDYgHYUG6J3dPD3NtcxxBuz
	w9U+UHaWKXAzTk5nTE0xj1jOaywdwhOlYPKwA9hluH21Pm61cZxQ/Vwi0r9WaxKw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qIsPR-00EgUu-0L;
	Mon, 10 Jul 2023 17:02:41 +0200
Message-ID: <047c7bdc8057175f2bb78981a5f1a1aa6b493153.camel@sipsolutions.net>
Subject: Re: [regression] iwlwifi driver broken on Intel 3165 network card
From: Johannes Berg <johannes@sipsolutions.net>
To: Linux regressions mailing list <regressions@lists.linux.dev>, Aloka
 Dixit <quic_alokad@quicinc.com>, John Crispin <john@phrozen.org>
Cc: Aditya Kumar Singh <quic_adisi@quicinc.com>, 
	linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Date: Mon, 10 Jul 2023 17:02:40 +0200
In-Reply-To: <6f8715af-95c2-8333-2b32-206a143ebb52@leemhuis.info>
References: <6f8715af-95c2-8333-2b32-206a143ebb52@leemhuis.info>
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

On Mon, 2023-07-10 at 10:32 +0200, Linux regression tracking (Thorsten
Leemhuis) wrote:
> Hi, Thorsten here, the Linux kernel's regression tracker.
>=20
> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> kernel developers don't keep an eye on it, I decided to forward it by mai=
l.
>=20
> Aloka Dixit, apparently it's cause by a change of yours: bd54f3c2907
> ("wifi: mac80211: generate EMA beacons in AP mode") [v6.4-rc1]
>=20

That bisect result seems unlikely to be correct. Those changes are in
"how to get beacons" (in AP mode) which isn't even used in client mode
here.

johannes
