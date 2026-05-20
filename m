Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD3C3E1218
	for <regressions@lists.linux.dev>; Wed, 20 May 2026 13:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282725; cv=pass; b=q9u5Mi+6xy8t+TUq87sG1m/IAeKUZUvc5S1JEyD+Rjfqo0HZnq5Asx8+dNqRYX/uAD9TWdCTNroJOQCDtE64i8+W4O4ZNbsEB0N6xZ4sBi0GD1Cc0f6IMZVVQNPy4+Vdoig4a1gi32wvmLfHKQ7SpTDi55Xnt4Bzlw8Bv3tAXkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282725; c=relaxed/simple;
	bh=cKw5YCzuiQEJpUmrAp3fl4H1ttFJuOreCSz37WERLgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQAp650uG6G4/C3hAJTi91fvdxr1OKe/UhvCD+Y9tubjC9p/0L0IUUS+GQwVgku2dbsopSRY3oJiNCHsUCb+Bqw3ZcSGOVAGt13ZpZbtaf/1fvvRUb+E5EySA/ejm7KzUzwg8tT0UeHNumiAsbKqcnx/Bc0vR3/h5mjumLDwmg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JC7yemSK; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JC7yemSK"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-65e39d1dd38so4264133d50.3
        for <regressions@lists.linux.dev>; Wed, 20 May 2026 06:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779282715; cv=none;
        d=google.com; s=arc-20240605;
        b=D90vY2e3FpY/llgTOHsJjeDEw/IKwG+EGoYCA3+W4i5dm99NqUwPYsRK0Vo6qt3KqU
         6U30chOKkhHgC8InVDv5yZaHIULpZhFXv0XHCp6Vh+4DrQUcImBZXFdF4b94RLOaPb1N
         K5ehGiL+BNa7lxYkLSUVEMSbY9EQtd2bL+4w1lNvhPlHOXskjgIenlhFNYg4Dc+xIcd0
         QEAkYcBSvE+2ZP/QM0oZvlMmRY8bo3BQZmaT2jTKiinumvmciPg7sD4gAqlmYZGPsRmN
         ajzNgfwtX1BADDvE6cZmZOBaRpnC44Bta0HMjDKhxw7t2XugLtEjvbD52XtKnS+yCyY4
         rHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fM3pFjSA7u9dK0K2/dG7XeV5S24ISSrkdo3lpIb1ByE=;
        fh=H+5xVjHS2kE2X9nZ5Hhni4uprMrYrb5llB4mvgElWQQ=;
        b=PD9Mde1DpONflRxRO4x3YtWAbqH5OGMuZ3HmY759U2IUQEgIdYDkPiyyEiT4wnTDlv
         AeHVfWNP63SY8agH4XQL8GjcvbbENXg79FC1d52XKpa7GkwIK5tIP21AtRD/jLGhHbiP
         lKDrktCgj7iTXAGBxmQKkcnY+k6vYErPRK10tNLMZl9x5lpPo2bgeLX8LIJ+E/cgULxD
         tfZOknp143G4YxmCHFAaBH4PBI1iGMD3roPrVr6jfFxISBaWB1rKsvg2Vi47a2L6A8q6
         SzTGHE86hA/qmBlIEKrEY45ble2vBtOb2HXGMsJb4wL/P+J977oXpNXw1eh+zzU0rcPr
         yJqA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779282715; x=1779887515; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fM3pFjSA7u9dK0K2/dG7XeV5S24ISSrkdo3lpIb1ByE=;
        b=JC7yemSKJ/e9XNRLcvb8ji1Dy2V90syrVmk++E2khoCa8NJrnZn9TaLLoqX/jnIGg3
         TR6jgQvS1rXwN7KlVgGHrQs5i6JZYk0jO/Tx0ysl782utXxcdz6uE/xfqLLL+kGN1QYk
         FHWEOEdgmQP9ucquGdl+YVkNZEwyInAJPJg39FkzxX6udbcEOhsshkTwpE5lSayhYcA9
         1obUfdEfPAwmLyC7/Sz0qrZd8R8SH9ptHj4K4lgUAwacEuLGUjzvsPoRAaaQWZbn6OB7
         j5OEa4MYTbILNIXbbgQmEwdLBLQlF1KSLIEp3S1oaxn0UIqSvweJwgzwOFaYBtwL5DxN
         G3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779282715; x=1779887515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fM3pFjSA7u9dK0K2/dG7XeV5S24ISSrkdo3lpIb1ByE=;
        b=nRpj5Gn4d8gQHkiojAyU13L8QPKpA7gO2pOStnDBsns+3Da7kVmtKpLBZbBWHBtvsV
         ZLcMdGdc+A4Iw2ETRXKqqqHpZK7FG1yYRIW/OVVN21ktEOi3bCCTr2ewLcoTMKruL/FM
         gWjwg8OHi/+VdSqhwaP5N830xPPLQsz2P/0Qnn1U+JbX8hV/r3EJe/KABjJKLG/Kmu3V
         5n9ORm1AnrYqUxMsf0F1Qj0za7PKWi9tSJY44PFeJOC3YDT1/CidyrXTbA/yjQQGr6lN
         wBIDhM2IFZjs/0fVvpRRIBe8Y45e97nRvFhvfAA9lLoUtw9lbdLpWibxawWf72s3dnjp
         6cgg==
X-Forwarded-Encrypted: i=1; AFNElJ+Bwyppvm1SxKFVcBH6YVtx7Gl5KJx4fVOsohyM6cIPhnp7fx29b5NapJgyAM6I8O+Jzy43pgLLEGICsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFiKl9WYgcv65M6ULseolnzPOAND1Dyc4NyCs8EGR/RBRBiSN5
	Xo2wHhsTA1uY6eTkmZaq9vkstNEXxvF6aPqHOtkFpH02n4z/6fjMjs/OTZxoFALq1A6hQeNL3kD
	lXwXnhLex/T9ojNUAVNnDefMEEWVEiuI=
X-Gm-Gg: Acq92OGGUAh8GVSrjkVcRLZzO6rabokHLyYyd/DfuMhb6bfNQbPZtBnC+Wjr27hxvMY
	hFjl7v8tHFTFywgj1PrX1hiexm+/1gCQNiWMExZwqgoJFZXxyY7luIir+If8r2qzD6nu/8hXgKw
	34I/6i3YDBNgKssPW0D9AnjaF0QfCDN0TywEzAww7sXPeycD1NmUew/W+kpmShO7d7QETuhN5DY
	p9ZEedWyYn+opSwv0drBGGEmPzvQjIerxWWdYiafXtKm2p1wEGcGHyV3yXcf/2Ci/vjsbKjeH3X
	2RgWcUkudu8I96/JygQCxUO1LbUI1EgoXDd/ZgGFIrOMIomVOeiXbH40JP2txVCKRddAFUeY1Rw
	bR1OG
X-Received: by 2002:a53:c056:0:20b0:65c:4066:d177 with SMTP id
 956f58d0204a3-65e2264ffd7mr18238658d50.9.1779282715259; Wed, 20 May 2026
 06:11:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260514172340.1515042-1-luiz.dentz@gmail.com>
 <f5cf1c30-48a4-4102-ae00-b74cf02e639e@leemhuis.info> <4946f5f3-b7e2-4949-89f7-6427015027c6@leemhuis.info>
 <2026051954-revision-sierra-6bb4@gregkh> <eb5301f9-3133-4fe3-b358-61f14d1ffa5b@leemhuis.info>
 <2026051909-impurity-nemesis-2f65@gregkh> <CABBYNZKKbTXc-okp9P2OncMYXHX9C1XC+pRC7XWOhv-8nPNZ5A@mail.gmail.com>
 <2026051942-uproar-drainpipe-6370@gregkh> <CABBYNZKzWgL3nmeA=CtN9s80LRyDiJ97aQXgvfSm9vYUBw_SpA@mail.gmail.com>
 <e666c332-e2aa-4525-a208-a4a08742d2e0@augustwikerfors.se> <2026052026-barber-espresso-1d9a@gregkh>
In-Reply-To: <2026052026-barber-espresso-1d9a@gregkh>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 20 May 2026 09:11:42 -0400
X-Gm-Features: AVHnY4LMSkZgfnRrbpGkQ3oSEmfCsbIHkLmvULkOOnK2PiOJuvWBImpmmtpycYc
Message-ID: <CABBYNZJ4woc+unpYN6_dzMLtxhFVUd5+ccv2+EQbDMkYuXQ12A@mail.gmail.com>
Subject: Re: [GIT PULL] bluetooth 2026-05-14
To: Greg KH <gregkh@linuxfoundation.org>
Cc: August Wikerfors <git@augustwikerfors.se>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, Sasha Levin <sashal@kernel.org>, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net, 
	kuba@kernel.org, Linux kernel regressions list <regressions@lists.linux.dev>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Wed, May 20, 2026 at 8:47=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, May 19, 2026 at 07:37:35PM +0200, August Wikerfors wrote:
> > On 2026-05-19 17:49, Luiz Augusto von Dentz wrote:
> > > Hi Greg,
> > >
> > > On Tue, May 19, 2026 at 11:19=E2=80=AFAM Greg KH <gregkh@linuxfoundat=
ion.org> wrote:
> > > >
> > > > On Tue, May 19, 2026 at 09:44:39AM -0400, Luiz Augusto von Dentz wr=
ote:
> > > > > Hi Greg,
> > > > >
> > > > > On Tue, May 19, 2026 at 8:07=E2=80=AFAM Greg KH <gregkh@linuxfoun=
dation.org> wrote:
> > > > > >
> > > > > > On Tue, May 19, 2026 at 12:53:49PM +0200, Thorsten Leemhuis wro=
te:
> > > > > > > On 5/19/26 12:30, Greg KH wrote:
> > > > > > > > On Tue, May 19, 2026 at 09:04:38AM +0200, Thorsten Leemhuis=
 wrote:
> > > > > > > > > On 5/15/26 17:10, Thorsten Leemhuis wrote:
> > > > > > > > > > On 5/14/26 19:23, Luiz Augusto von Dentz wrote:
> > > > > > > > > >
> > > > > > > > > > > The following changes since commit c78bdba7b9666020c0=
832150a4fc4c0aebc7c6ac:
> > > > > > > > > > >    net: phy: DP83TC811: add reading of abilities (202=
6-05-14 15:17:12 +0200)
> > > > > > > > > > >
> > > > > > > > > > > are available in the Git repository at:
> > > > > > > > > > >
> > > > > > > > > > >    git://git.kernel.org/pub/scm/linux/kernel/git/blue=
tooth/bluetooth.git tags/for-net-2026-05-14
> > > > > > > > > > >
> > > > > > > > > > > for you to fetch changes up to 375ba7484132662a4a8c75=
47d088fb6275c00282:
> > > > > > > > > > >
> > > > > > > > > > >    Bluetooth: hci_qca: Convert timeout from jiffies t=
o ms (2026-05-14 09:58:08 -0400)
> > > > > > > > > >
> > > > > > > > > > It seems this PR sadly came too late for this week's ne=
t PR to mainline
> > > > > > > > > > that was merged yesterday.
> > > > > > > > > >
> > > > > > > > > > TWIMC, from my point of view, it would be great if we s=
omehow could
> > > > > > > > > > still get the changes from this PR or at least the btmt=
k fix it
> > > > > > > > > > contains[1] to mainline this week before -rc4, as it is=
 fixing a
> > > > > > > > > > regression known since 2026-04-24 that at least five pe=
ople encountered
> > > > > > > > > > with mainline since -rc3 due to 634a4408c0615c ("Blueto=
oth: btmtk:
> > > > > > > > > > validate WMT event SKB length before struct access") [0=
06b9943b982 in
> > > > > > > > > > -next].
> > > > > > > > >
> > > > > > > > > Greg, Sasha, that [1] fix I was talking about now reached=
 -next as
> > > > > > > > > 162b1adeb057d2 ("Bluetooth: btmtk: accept too short WMT F=
UNC_CTRL
> > > > > > > > > events") and will likely hit mainline on Thursday or so w=
ith the weekly
> > > > > > > > > -net PR to -mainline. If that's good enough for you, I'd =
say it would be
> > > > > > > > > good to pick this up for the next round of stable kernels=
.
> > > > > > > >
> > > > > > > > That "Fixes:" tag is referring to something that is also no=
t in any
> > > > > > > > tree, but that commit does have a cc: stable in it.  So do =
we need both
> > > > > > > > of these:
> > > > > > >
> > > > > > > Valid question, as yes, there is a slight mixup here:
> > > > > > >
> > > > > > > > 041e88fb0c08 ("Bluetooth: btmtk: validate WMT event SKB len=
gth before struct access")
> > > > > > >
> > > > > > > That is already in v7.0.7, v6.18.30, v6.12.88, as 041e88fb0c0=
8 is the
> > > > > > > -next commit-id for mainline commit-id 634a4408c0615c ("Bluet=
ooth:
> > > > > > > btmtk: validate WMT event SKB length before struct access") -=
- the one
> > > > > > > that is causing the regression that I want to get fixed. So w=
e now only
> > > > > > > need:
> > > > > > >
> > > > > > > > 162b1adeb057 ("Bluetooth: btmtk: accept too short WMT FUNC_=
CTRL events")
> > > > > >
> > > > > > Ok, but that "Fixes:" tag pointing to an invalid commit is goin=
g to be a
> > > > > > nightmare to track over time, ugh.
> > > > >
> > > > > Hmm, did we get the wrong hash or something? Usually, that would =
show
> > > > > up in the verify-fixes.sh, but perhaps it didn't capture it this =
time
> > > > > for some reason, perhaps I'm running an outdated version or somet=
hing
> > > > > similar.
> > > >
> > > > Something went wrong if we ended up with a patch in the stable tree=
s,
> > > > yet this fix is referring to it as a different git sha.  Don't know
> > > > where the disconnect happend :(
> > >
> > > 041e88fb0c08 ("Bluetooth: btmtk: validate WMT event SKB length before
> > > struct access")
> > >
> > > I don't have that in any of our tree either, this is actually
> > > 634a4408c061 on all trees in the chain:
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.g=
it/commit/?id=3D634a4408c061
> > > https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit=
/?id=3D634a4408c061
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D634a4408c061
> > >
> > > Or actually that was the hash before it got rebased on bluetooth-next=
 tree:
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-n=
ext.git/commit/?id=3D041e88fb0c08
> > >
> > > But I didn't send the PR from that three so perhaps somebody else sen=
t
> > > it to stable with the wrong fixes tag?
> > I believe the confusion comes from "Bluetooth: btmtk: accept too short =
WMT
> > FUNC_CTRL events" itself currently having different commit hashes in
> > bluetooth (e3ac0d9f1a20) and bluetooth-next (162b1adeb057). The former
> > correctly refers to "Bluetooth: btmtk: validate WMT event SKB length be=
fore
> > struct access" as 634a4408c061 in the Fixes tag and was merged into net
> > yesterday heading for 7.1-rc5. The latter still refers to it as
> > 041e88fb0c08. Both are now in next-20260519 but only the latter was in
> > next-20260518 which was the latest at the time of Thorsten's message.
> >
> > Greg, this means picking e3ac0d9f1a20 instead of 162b1adeb057 should re=
sult
> > in a valid Fixes tag.
>
> Ok, now done.  Be careful of duplicate commits in different branches
> that are marked for backporting with different ids.  It can cause
> massive confusion (i.e. don't be like the drm tree...)

Noted. I guess I need to dig into how other trees do to avoid that.
The problem seem related to using 2 trees: bluetooth->net (fixes only,
rebased on each RC) versus bluetooth-next->net-next (development,
rebased once per release).

> thanks,
>
> greg k-h



--=20
Luiz Augusto von Dentz
