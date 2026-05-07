Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56DF3BED23
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 12:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158156; cv=pass; b=nmV2gwGAr7GGG9SnTIOFtuZx60PbfUB7IqOFCouLCUhdYgdPiavgJ3N83/3HnlQCAIJsa42AKYLJEsjdTvR9YXaNSfqKXS8gjaiB8t1hVMd4QmlZqIsFjMCLvh+3ksHa1xyfsMZRfTQPkSJC1HeAJmxVnbUEkfcltLkYaS7rQ9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158156; c=relaxed/simple;
	bh=sz903DbfArP+QiHkxTXsqT3ZPy4O+2XviQY6sg+gQmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GfJpbBvL3FqWd2EMmrZ0EBsiz4+u/Xb3z9exrm1OX7GxQwUQHSq2J9m0v2wbkswcknMSHtzcTQHwSgbDvInF1BCr/FzuB6mw1dI44E3b5vOiBDXhgN6akCnrFGwWNzQfESonLIpG7IrtVQM78wdGH/ru0qy+klhmVOEYou0jSCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=friendlyarm.com; spf=none smtp.mailfrom=friendlyarm.com; dkim=pass (2048-bit key) header.d=friendlyarm-com.20251104.gappssmtp.com header.i=@friendlyarm-com.20251104.gappssmtp.com header.b=nojc4/Qr; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=friendlyarm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=friendlyarm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=friendlyarm-com.20251104.gappssmtp.com header.i=@friendlyarm-com.20251104.gappssmtp.com header.b="nojc4/Qr"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67c9616b4feso1181031a12.1
        for <regressions@lists.linux.dev>; Thu, 07 May 2026 05:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778158153; cv=none;
        d=google.com; s=arc-20240605;
        b=jI212aD6Fv1MDnbugCKb//dnbgYSiLibuppcgThKRige45QwErC5me/5jmLvOBXOja
         kDq/YE0nTOoLl5ETrE3wSRH+1d/gqqlsW2TIG4F+v7WEb1FaVrmHJ6/XXd8B7TO4wmk1
         9pbpGSBhlwHDv1tsJygR4Fj+f8wiI9BwRbpkSG141dZ+jT5Tzwi30axmxSUuFulQskP3
         EJx5DGBXYBAGQ9670wJLj99ZmSWlKDvFEckBPxi4wzH9HftRnQ6kpNLEwJPgF9HLZR81
         ZUCPw8Emsu2YsvaMsAmft2FFxeqmRE+DFN4+Hz+6yQfn9YX5H/8MOQzQQjODFdoSyaZL
         GIHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T5GvoPtWelUk7+7MNNsj2fIFZyWFICYszMdYegWkkxI=;
        fh=dT1SSoo0+5zKsGqugl5OecmHe/r+HpWF+44i6nwJxDY=;
        b=NlkJvDC0LkGN6nw7rjOWPlBbfApC19cpDmepxJcfZji21blGRp5n17dEK6m4FVJN1T
         nFNmK3QqgnixJnzn3lYqBy6+I/sj0vp4Qe7ufRmC4bB2CTD/f/iMWoI9Iv2aHNWpW4pK
         d9KDhcXBzd9QEVfXQ8E2w1AoKbm1wn5QlAagW7C2oKJZmB0XrGSDQRfPkiTR0cauhW5s
         KwbEcNZ/gxJoO4k+/ICjeVExhDeAomUyBrfR5rauvaOvUbt5DJD4UQzzDVJmz7kUmlQK
         +UXOsKO6ATx4jpfqXm6NEQ9p1iEpUAk878gbgaDGXz4rb8+ABo3ZIKnJJDaFBFV2+o7E
         p2sw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=friendlyarm-com.20251104.gappssmtp.com; s=20251104; t=1778158153; x=1778762953; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5GvoPtWelUk7+7MNNsj2fIFZyWFICYszMdYegWkkxI=;
        b=nojc4/QrfG3jvcvvjk2QdGigD9qCaTvczVxhF7yES2nUvBTxs5jN2hf/Hfc7uHviWj
         dGUzWJbj5zwJOSo6T6aoKnYw/2/tfgjWt2EmVyD5dv8OFrMSUQwHB4hgWxMJnQ9QDiGA
         tq58ZQPSRM5A3q11dg4yMWLy+E9GB2sE4djtlPweXGxJfbpKPArXok7Q0XJ9fWKb4CHy
         DddTcv62i25FQOlFZx/B9Cfun3kHoWw6altAJqtyO3oA3QcvTXT+4DpASBFgnKcamQO0
         60aaBl9w0PfVoW4vGnHB7y2m4BlkFxvB6xNlkfA2ishaP1pj5BNVsVyR8DHjSygMizk5
         DjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158153; x=1778762953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T5GvoPtWelUk7+7MNNsj2fIFZyWFICYszMdYegWkkxI=;
        b=SMVuL9LIq/K0qWP36spDwkBq/7voba3u6nhQ2rajMVlO1wU4bK/VsgzyfIfOFqFKQk
         mQ/htg0I0G1rhifvMDtS59C8Li4JKxlEzKq7WPGp5TYd5NOh602W0z9IXbZ8lPA9kHzY
         r2XNw3NQR5d1HegKeo3OnWs2RqcnETw3rbbnNislg3gLLEwfiD4c+TH8MLjBjLLcmOEv
         3fLus53OE1J6XN8N0XuX+PX01pUQmGgWiqIznORmIniDZ32uEKCu6R1eEaDu0eFnX9EW
         py95J2Ym1LuBtA3hj8717RHqagD6ozGVL0RUREqga8zP241wqpzP8+cFKr6m6Nef2lE1
         SS1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8+GIPA62F+Os5eMKl37dXiY3RIIlSK/susfpyI4zstSeigtGNhHSgq3Acv1QI40V4pbjDcc8wkrtMaEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwkhS8dqnt+xFpw5hD44zrEIwqd/o5+yLtvQlKhvBg5wvCsCiF
	Ppj+VYLvLknMeTGmuPD+6cl/gtOyQEA1px6S5UZJkgisT4cukBAVRDnsxy/AVTdewo+wJ7Vr7zL
	2LaOpUQVelPMzVmBCJ8TGGd1STWFG7TM7PFO7x9zh8w==
X-Gm-Gg: AeBDietJ7czJuUXvrgLNeBEZFzjptqCiyY4B1XDzafRwMZw+Ar9puEjuQE3UMKk8cMV
	GhUlN5vJEN9+gunSQcGTSOw9JiTNSrRGArK7MPEh37rgJNJz5RaXlTFjP2M21bX0knvAt4rMJTP
	h6tdwOdmlBa3BjDuFEHJjbuI39BYz8PPHeSqrJYIDLMibai4UtzpbuwrdMfi8IwAAlp517Z7zfz
	Rt8jMc1a0Ar5EUFCFmR031RwUGgXran/JBWTLScdI5ySdgohSemNead/dWxftV8jafylezU/ZAs
	+NMjOwSZjfOnv2vQbjJ94mly58sQ7RhOH9Iv+cb7
X-Received: by 2002:aa7:d9cc:0:b0:678:f81a:76a1 with SMTP id
 4fb4d7f45d1cf-67d63d8f13fmr2850093a12.10.1778158152619; Thu, 07 May 2026
 05:49:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMpZ1qEwNOqR-KQD4kEqd93aB-TpHnG6WdQc2tXUF0aXMmw_SA@mail.gmail.com>
 <198e2ce4-07e1-46c0-818d-1eb18645aca0@leemhuis.info>
In-Reply-To: <198e2ce4-07e1-46c0-818d-1eb18645aca0@leemhuis.info>
From: Jensen Huang <jensenhuang@friendlyarm.com>
Date: Thu, 7 May 2026 20:49:01 +0800
X-Gm-Features: AVHnY4JIhFDYsewcoPMz6YubfqI0BrloS9P8SD1uRPJjDpD8UVEZ2b6XKnlXN4w
Message-ID: <CAMpZ1qGEOiPj7cApnWJnojSyEpDmXfco=No5n1VfyTCoNyCyFQ@mail.gmail.com>
Subject: Re: [REGRESSION] stmmac: Random DMA reset failure on RK3399 since v6.18
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Russell King <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, regressions@lists.linux.dev, netdev@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 4:26=E2=80=AFPM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> [Jumping in here, as there are no replies yet]
>
> BTW, Russel, just in case you missed this: looks like this regressions
> caused by a change of yours.
>
> On 4/29/26 14:53, Jensen Huang wrote:
> >
> > I'm reporting a regression on RK3399 (stmmac) observed in v6.18.24.
> > When a network cable is connected during boot, the DMA reset
> > occasionally fails with the error message: "Failed to reset the dma".
> >
> > This appears to be a timing issue related to the EEE RX clock-stop
> > logic. Based on my investigation with the RTL8211E PHY, I monitored
> > the PHY register PS1R (MMD device 3, address 0x01) and observed a
> > value of 0x0f40. This indicates that the PHY is in LPI mode and the RX
> > clock may have already stopped.
> >
> > While commit dd557266cf5f ("net: stmmac: block PHY RXC clock-stop")
>
> Just wondering: have you tried if mainline (e.g. 7.1-rc1) is still
> affected? This is something that is always a good advisable (some people
> would call it required). In this case even more, as it since a while
> contains a fix for the change you mentioned, that wasn't backported:
> c171e679ee66d7 ("net: stmmac: Disable EEE RX clock stop when VLAN is
> enabled"). But this is not my area of expertise (and in different area
> of the code), so that fix might be unrelated to your issue.

Thanks for the pointer.
As you suggested, I have tested the mainline and confirmed that the
issue is not present in v7.1-rc2, nor as early as v6.19-rc1. However,
I verified that the issue persists in the latest stable v6.18.26.
I performed a git bisect and the result pointed exactly to the commit
you mentioned: c171e679ee66d7 ("net: stmmac: Disable EEE RX clock stop
when VLAN is enabled").
Additionally, I tested the case where CONFIG_VLAN_8021Q is not set,
and the DMA reset issue occurs again.


Best regards,
Jensen Huang

>
> Ciao, Thorsten
>
> > ensures the clock is running before the DMA reset, my tests suggest
> > that the phylink_rx_clk_stop_block() call might not provide a
> > sufficiently stable RX clock in time for the immediate DMA reset that
> > follows.
> >
> > Since stmmac already sets mac_requires_rxc =3D true, I modified
> > phylink_bringup_phy() to honor this flag. This avoids toggling the
> > PHY's clk_stop_enable during the initialization sequence, ensuring the
> > RX clock remains active and stable throughout.
> > With the change below, I achieved 200/200 successful reboots with the
> > cable connected (previously ~50% failure rate).
> >
> > --- a/drivers/net/phy/phylink.c
> > +++ b/drivers/net/phy/phylink.c
> > @@ -2171,7 +2171,7 @@ static int phylink_bringup_phy(struct phylink
> > *pl, struct phy_device *phy,
> >      /* Allow the MAC to stop its clock if the PHY has the capability *=
/
> >      pl->mac_tx_clk_stop =3D phy_eee_tx_clock_stop_capable(phy) > 0;
> >
> > -    if (pl->mac_supports_eee_ops) {
> > +    if (pl->mac_supports_eee_ops && !pl->config->mac_requires_rxc) {
> >          /* Explicitly configure whether the PHY is allowed to stop it'=
s
> >           * receive clock.
> >           */
> >
> > Any feedback/testing on this would be appreciated.
> >
> > Best regards,
> > Jensen Huang
> >
>
