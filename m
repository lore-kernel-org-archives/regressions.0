Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB83441F
	for <regressions@lists.linux.dev>; Wed, 12 Jul 2023 10:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=4khwpG0dcNuMOFi/GJdwM3DNEHM/4TESMkw3EUchFP4=;
	t=1689158399; x=1690367999; b=qPc5qpeY98oXjth+Qg0qPYF/foYl+DikSxTZ00/fRJLGozS
	uFZH9U5P5XHYQELrEsZ7n9o+tWtcjOB9wOmQ39QtoIk0mfS7MUkNKAGho3JdAF9SnuKLYbyVGSAWl
	tjykLFuZ9s90s+ae0E5dhPGRNTKqmGuUPHNZZq3YRLU9zm0uYqF96aylvcVZ/eWUFp19vOxyXRWzC
	4g9dofEWgcHFvojOysxFlMWEGE0sYMH4CCmT3Tpgo7+/j3cVuHR2eXnmusMXnLeNcIsF5XwbU2Jb1
	4mR4CyzynwwQdWQbADQ7KEnSj+tfMvoliN6Lj0yJ3hWrPVDOEJ1JXriDuV8JjtJw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qJXGA-00GcDL-1P;
	Wed, 12 Jul 2023 12:39:50 +0200
Message-ID: <cb081b034d9283284c4754e62c083567b516d68b.camel@sipsolutions.net>
Subject: Re: [regression] iwlwifi driver broken on Intel 3165 network card
From: Johannes Berg <johannes@sipsolutions.net>
To: Linux regressions mailing list <regressions@lists.linux.dev>, Aloka
 Dixit <quic_alokad@quicinc.com>, John Crispin <john@phrozen.org>
Cc: Aditya Kumar Singh <quic_adisi@quicinc.com>, 
	linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Date: Wed, 12 Jul 2023 12:39:49 +0200
In-Reply-To: <c71e376e-4e44-a1b3-6feb-2ed1ba7d325b@leemhuis.info>
References: <6f8715af-95c2-8333-2b32-206a143ebb52@leemhuis.info>
	 <047c7bdc8057175f2bb78981a5f1a1aa6b493153.camel@sipsolutions.net>
	 <c71e376e-4e44-a1b3-6feb-2ed1ba7d325b@leemhuis.info>
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

On Wed, 2023-07-12 at 11:59 +0200, Linux regression tracking (Thorsten
Leemhuis) wrote:
> On 10.07.23 17:02, Johannes Berg wrote:
> > On Mon, 2023-07-10 at 10:32 +0200, Linux regression tracking (Thorsten
> > Leemhuis) wrote:
> > > Hi, Thorsten here, the Linux kernel's regression tracker.
> > >=20
> > > I noticed a regression report in bugzilla.kernel.org. As many (most?)
> > > kernel developers don't keep an eye on it, I decided to forward it by=
 mail.
> > >=20
> > > Aloka Dixit, apparently it's cause by a change of yours: bd54f3c2907
> > > ("wifi: mac80211: generate EMA beacons in AP mode") [v6.4-rc1]
> > >=20
> >=20
> > That bisect result seems unlikely to be correct. Those changes are in
> > "how to get beacons" (in AP mode) which isn't even used in client mode
> > here.
>=20
> You where right, the second bisect resulted in a different outcome.
> Currently looks like 5fc3f6c90cc ("r8169: consolidate disabling ASPM
> before EPHY access") [v6.4-rc1] is the culprit; this is somewhat odd as
> well, but confirmed partially, as blacklisting r8169 apparently fixes
> the issue.

That indeed is odd as well, but from the log it looks like r8169 is
actually present on the machine, so perhaps this messes with some PCI
bugs configuration badly enough? It looks harmless enough, but who
knows.

Anyway, thanks for letting me know.

johannes
