Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DC32EA749;
	Tue, 13 Oct 2026 04:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791867434; cv=none; b=Gk0zJQXvXBUo8uuprCNCX69AYeD1mMk1Kpqx1rZrqNqXxMw7Ovz+HvDkLQFYRqFxGrG9oX4s3UmfyYmOX5neRbXTheAq33L6fnW/yFBzSj99KRUUsL5gRewnupDO4OqU8rzGXPY+iuebz5iIcKheVDAwBf+2e/sTon2hYox1Olo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791867434; c=relaxed/simple;
	bh=m7WD5JVyztuBXOQBNShzaLvDDxmsGU7L1mNhyVgSFZI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=KDdK+PmTnp50HD/uGRN3hBkQ9Q+umxogc9z3Yh1V5x/AWy0QR5squs4blil1r9f8LbeUFLtyAVXUUoR+GtNZU87zCy1d4g2C0xb5tKMMDHW8Z+gS3xS/yoTgqDEpbRUMlx8OpRX3Jilv1gYOx1FxrdvApaBu/NWrqyey7cs4YyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CPEhfc4Q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CPEhfc4Q"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:46f5:32b8:ff94:7599:1aae])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24A731E4;
	Tue, 13 Oct 2026 06:55:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791867308;
	bh=m7WD5JVyztuBXOQBNShzaLvDDxmsGU7L1mNhyVgSFZI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CPEhfc4QkfD4iHH26HwwSHtBZneKBryjhLrEz1fi+dEBlsk58Cat/QmwcqtsHP2OG
	 joXijqXx/t1OnoBBApejg0x6aKIX8HSEVUB9xGaRHYe3kKFT+sz83fbSnEMCLOb38g
	 tw+zoN4iYFKo6FsveVFGCRK34OrWQK2aDK4OQbAA=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a6b71984-cd0b-4e81-a240-ec05abc6327a@leemhuis.info>
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com> <a6b71984-cd0b-4e81-a240-ec05abc6327a@leemhuis.info>
Subject: Re: [REGRESSION] bcm2835-audio fails to register on vchiq-bus in monolithic kernels since 6.19 (VCHIQ destaging?)
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: uajain@igalia.com, Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, regressions@lists.linux.dev
To: Martin Wetterwald <martin@wetterwald.eu>, Thorsten Leemhuis <regressions@leemhuis.info>, florian.fainelli@broadcom.com, gregkh@linuxfoundation.org
Date: Tue, 13 Oct 2026 10:27:05 +0530
Message-ID: <179186742507.11414.3709235533520575164@freya>
User-Agent: alot/0.13.dev38+g8e372ce37.d20260925

Hi Martin, Thorsten,

Quoting Thorsten Leemhuis (2026-10-12 18:53:13)
> On 9/21/26 12:07, Martin Wetterwald wrote:
>=20
> > After moving from 6.18.52 to 6.19 (still present in 7.2.6), the bcm2835
> > Headphones sound card no longer appears on my Raspberry Pi 3 Model B Re=
v 1.2
> > (arm64). 6.18.52 works with the exact same userspace.
> > [...]
> > My suspect is this commit:
> >=20
> >   aa125180c673881f88b528600b57865dc158b3a7
> >   ("platform/raspberrypi: Destage VCHIQ interface")
> >=20
> > I could not bisect to a single commit,
>=20
> Hmm, no answer, so it seems nobody really cares. A bisection might help.
> Or at least validating your suspicion, hence: why can't you check the
> parent of aa125180c6738 and aa125180c6738 itself? Or at least the range
> with that commit in it? And is latest 7.3-rc still broken?
>=20

Sorry, this got lost in my inbox last month. It's likely my series that=20
destaged VCHIQ broke the ordering as Martin suspects. I always tested with =

modules enabled so didn't encounter this issue.

I'll look into how we can ensure the VCHIQ bus gets registered before=20
peripheral drivers (like audio here) when CONFIG_MODULES=3Dn. If someone=20
already knows what to do, pointers are appreciated :-)

> Ciao, Thorsten

Thanks,
Jai
