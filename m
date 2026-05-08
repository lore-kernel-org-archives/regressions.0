Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D072133D6F8;
	Fri,  8 May 2026 05:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778219508; cv=none; b=Lq74DUWVXvPzQI51EFc9YirHpkKlvFD3nRlsxdZKhh3iC5AmT61xvb6qbvYSS72ViVdY7jlytJthuDMbpHMoZ1sDXn4j3u45nU32RJFLBJ8DhjZX/J84aOXUphLhlnES9qpRrVIFiDJxbunq9XjEN8EYUTZbgGB46OPXeHIE+ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778219508; c=relaxed/simple;
	bh=ksQvme7t824uDEL9eEk3KCU5re46C9r14aNfKVSdEpg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KHDSCUjzetjC74GYO7N0eH1MaJdMLa0At8ge21APyGv0jgwKXvqMSN6HTbwAq5C3KDumGE7ubfTalHZldDg1Pl+wTxvRTcy8oT6YJq6ZukdI7XvxDfQGkqFozAXXDWQtO+h7IpRvKMDTxgNbi0DUNv4Q45gcI0jO5/rKwHPWnvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=HyEwq422; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="HyEwq422"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=OE40Fp81PjYtTQiIWW42YKkux/UhGHS8QRhCeSpzLIA=; t=1778219499;
	x=1778824299; b=HyEwq422vPM97DnoltiNYQG9biYq2LkDgg8JOw8dnLGxTUOX2BtDactkojXGp
	N7UeyqlKiVoMNAAnU42A6cEBAq6uKhkjV9vPL4HYhgZ06E4f7Ycg9bZqCuf4G0MdAXPoBYqxhJ9Ty
	xrlcMTEXR37xXEDwuR+jlzW/Ju7Kqxo9ldPGTLglIqGs53q4oPlzGHlyMXtIVwCp0Dyyhj0QXSXPC
	R0n7jKCuPemO1StUHMX/nlIdsW3Tilf6emTU7dgK/fC/Q884nNJwbrRCFryWTZbt6c14xyT413Xp0
	m+3TpjUZc6GGiypQpT6xRW/c7dPUfruhNqRJ+x0DErcuYPYsEw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wLE7S-000000041EX-01Ui; Fri, 08 May 2026 07:51:26 +0200
Received: from p5b13ad18.dip0.t-ipconnect.de ([91.19.173.24] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wLE7R-00000003OPY-3FiK; Fri, 08 May 2026 07:51:25 +0200
Message-ID: <371674dd1f67973025d9fa293c01c99ee3279fc8.camel@physik.fu-berlin.de>
Subject: Re: the stuttering regression in 7.0: should I have done something
 different?
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thorsten Leemhuis <linux@leemhuis.info>, Greg KH	
 <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>, LKML
	 <linux-kernel@vger.kernel.org>, Tony Rodriguez <unixpro1970@gmail.com>
Date: Fri, 08 May 2026 07:51:25 +0200
In-Reply-To: <4dd98a32-d1d6-43de-910c-7e487503177e@leemhuis.info>
References: <4dd98a32-d1d6-43de-910c-7e487503177e@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Thorsten,

On Thu, 2026-04-23 at 18:30 +0200, Thorsten Leemhuis wrote:
> FWIW, here is the rough timeline of the regression, just to be sure we
> are all on the same page:
>=20
> * The regression I'm talking about is caused by d6e152d905bdb1
> ("clockevents: Prevent timer interrupt starvation") [authored:
> 2026-04-07 10:54:17; committed: 2026-04-10 22:45:38; next arrival:
> next-20260413; merged: 2026-04-12 19:01:55; v7.0 (2026-04-12 22:48:06)]
>=20
> * On Monday and thus within 24 of the 7.0 release the first report about
> the regression came in and immediately mentioned that a revert was able
> to fix things:
> https://lore.kernel.org/all/68d1e9ac-2780-4be3-8ee3-0788062dd3a4@gmail.co=
m/
>=20
> * On Tuesday someone else confirmed the findings and mentioned that
> "several users" were seeing the problem:
> https://lore.kernel.org/all/aeb848aa-404a-40fb-bd41-329644623b1d@cachyos.=
org/
>=20
> * A few hours later (aka within 24 hours of the first report) Thomas had
> a rough fix ready https://lore.kernel.org/all/87340xfeje.ffs@tglx/ (yeah!=
)
>=20
> * On Thursday the fix was committed to the tip tree:
> https://lore.kernel.org/all/177636758252.1323100.5283878386670888513.tip-=
bot2@tip-bot2/
>=20
> * On Sunday I asked when the fix was going to be mainlined (with Linus
> in CC) -- I feared Greg would soon start preparing 7.0.1-rc1 and I
> wanted to ensure the fix was included there:
> https://lore.kernel.org/all/5cbb14d8-46f9-4197-917f-51da852d7500@leemhuis=
.info/
>=20
> * On Monday morning (UTC) mingo submitted a PR wit the fix:
> https://lore.kernel.org/all/aeXYPt1FEbFRZNJf@gmail.com/
>=20
> * On Monday Greg released 7.0.1-rc1 without the fix -- and a backport of
> the culprit was in the -rc1 of various earlier series. Thomas quickly
> told the stable team to not backport the culprit before the fix was
> mainlined https://lore.kernel.org/all/87pl3ten5y.ffs@tglx/
>=20
> * On Monday night Linus merged the PR from mingo as 4096fd0e8eaea1
> ("clockevents: Add missing resets of the next_event_forced flag")
> [authored: 2026-04-14 22:55:01; committed: 2026-04-16 21:22:04; next
> arrival: next-20260417; merged: 2026-04-21 00:30:08; v7.0-post]
>=20
> * On Tuesday morning I wrote a mail to Greg about including the fix in
> 7.0.1; Thomas round about the same time provided the necessary backport,
> which Greg then included out-of-band:
> https://lore.kernel.org/all/2026042105-malformed-probation-232b@gregkh/
> https://lore.kernel.org/all/87jyu0de2c.ffs@tglx/
>=20
> * v7.0.1 is released on Wednesday, 2026-04-22 13:32:23

Tony Rodriguez from the SPARC community has observed the regression on SPAR=
C as well
and proposed a fix to address it [1]. Not sure whether he has retested on t=
he latest
commit of Linus' tree yet.

Tony, can you verify that 4096fd0e8eaea1 fixes the issue for you?

Adrian

> [1] https://github.com/sparclinux/issues/issues/79

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
