Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B75B37F8D3
	for <regressions@lists.linux.dev>; Fri,  8 May 2026 08:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778228378; cv=pass; b=Vj9vkBUEXTSkWdPP3FBlSsICbNi2Aguu1SlDgFlV8NDqN3Sms/F8WZixpevAZuqWsDYeXJAbL51Bf1ONeqZ9wGk4OBpNUrrsqqUvCnppnCZfiJcXcPVW9yWDWuSr7nf8IG4Tr4TjSg+o3rHSyYltoR+3NLugbeFht/uPdbhbFyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778228378; c=relaxed/simple;
	bh=TMyLLMSJpHwje7SvPMIjeLCmiLHP9pMOUENT799WEWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pDJA3+sAb7VPmKTwMq5pssChqHI0gYL9M8jtoYX1rqgNrp9yZRRvOWciJj9c0NobeFVeyFQJXoG4QsObvYZu9I08nU+P3Ek6V23J5KkdXsxEiD2JMHxlt0ho0sRdZfoH7Xu1BtC+z3yn+1IVJf2V0aCBzCIBo2OvWQlgJ7xyvLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=friendlyarm.com; spf=none smtp.mailfrom=friendlyarm.com; dkim=pass (2048-bit key) header.d=friendlyarm-com.20251104.gappssmtp.com header.i=@friendlyarm-com.20251104.gappssmtp.com header.b=aDATT22W; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=friendlyarm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=friendlyarm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=friendlyarm-com.20251104.gappssmtp.com header.i=@friendlyarm-com.20251104.gappssmtp.com header.b="aDATT22W"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bc264a50e7fso333534466b.0
        for <regressions@lists.linux.dev>; Fri, 08 May 2026 01:19:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778228375; cv=none;
        d=google.com; s=arc-20240605;
        b=AgsXtRbQzDobc7aO/VZ8ROyZeGrko75RXt3yDq6eBJ//xuBhWoIsliMeqH8Mlt1KNI
         SIcOinRF0AKNGDF1GXFIQF1dpBJ5R7DKIAipIo8fWMUIAaoTYssu1SRARaESEFzd5GQv
         vQBMGmEXM6K6cwHIHryIEsxA3PxM/+Z1M+qoCg2f9EDQrjh5SSIdomtE3oq7gQq5Wmup
         QgnxGirxM6FgYb+vVrVwR9EN2/wFxS0ktO7JHsJSvfaM7VuhGKVsNNhIzILj+OfSd+AD
         bDjIfVmKpAuSdv1BIVhBVCQkZ4tycjY8MMeOSaeg2Fkb6ki1hwzPPKmXvjTzQ8hR+1Tw
         9fLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jqbJb94JbpdOU+W9kBH8hlf6WXt6l3kJ1d1NQghHanw=;
        fh=mmH/Md/Xv+8FY8sHSw5UHNCLE86+mgx1FxKL3CQSnZ0=;
        b=h44A4aHM8U+2sMPBEKAC4vbgXUEJadJHOH+a3eV32kh0KoPdSGD5K167Z8F/GMqvYB
         2/p+sZlv7AFMLWqHOYGuTyTHob8TduZU8ut0DnNPWDeVc1bnpYZsUAjoUtr7eRo9NGeX
         hO/WjwvApsIiy5fPQxVG/vYIOx15nJlg+ySTcJxkv8+puNuo/K1n6hCv+KzPAhCcB0PU
         NTYgJu+YkqMt3PClFQAFlHGTYw4CuGijLEJgtkwmZ44IaSI0zcz74UVJO8dbIwHS0N4S
         U7AE0B9TBa4mb4vSIHWZzoKoKj2fAwO3TeMdksfKYZTL4Gdw6IjluJbiheqA83buvd9k
         NboA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=friendlyarm-com.20251104.gappssmtp.com; s=20251104; t=1778228375; x=1778833175; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqbJb94JbpdOU+W9kBH8hlf6WXt6l3kJ1d1NQghHanw=;
        b=aDATT22WH5UVz5/+4mCN8qeVC0iJpxjCCMk/+DzDuADs7J9OwkMqpgUGuRbPW2nkf5
         o4TxdhJDo8nEvJUbBNNI3w71sXWz+n/3u3enSvZd+cSJBz4KY3mmB2Km7u0PX/kDr6WT
         aY4Gb4z7OtPrESVO/ZV/MUthX9YrKqVGyfHKhZFqtFDgIDBmN/gikhstZH0Z37yqhoCR
         AzoEol4UzY4Sh83CwaQQX0fQxW7ZcZUxg/9S+yzTZndr/vGp8BR38BFutUXtvX9HorFK
         c2QSDRsVyhCWvTJy9Ysjig2Yjqnn43+IP3bFbtS3uK+X9mRqkFvGlABRIQa713hrQSeX
         cl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778228375; x=1778833175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jqbJb94JbpdOU+W9kBH8hlf6WXt6l3kJ1d1NQghHanw=;
        b=ILVmb81DwlW2hCABXq0ovGH00uy3om8Qfok1KtU5mV41Idw3bHdekz/Y4mTYTq8p2W
         BoYe4xotykYaHfTeHQjz6io2vuTuTI+TKatRHLEIPc1q9HDpJMx0IBOzT8bR/mTQnwif
         M21PWIog5QSBcnX2p+2ykmqrmUFdasD1RogLR2RsHsthPGfeF2qsWnQ/LvUEEmbk6s8S
         fGGaSVhZLB7C9MyRZQ9NWBRAvWOkjpYPv9GvMGZ+dscwjZLSkVG588aDjDpLAcOFMzFj
         UDh6wI216QhSOjcCLD1ZMy67NWB6ZG3CRzhKaXpvlkfwtU17J+eQjkNBoULC8Q7oJeF5
         ggJw==
X-Forwarded-Encrypted: i=1; AFNElJ8uUytifTmWX6EhLkLbHLc8DSiG9GhE11faL5YoiHGapvEg9DvhsJYwAz/f2/u4LRvAuA6S0ar5RUDIDg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHhd1rPlbTZFxDywKBYmAtf9vlr4gZ5TGyotxkPClxHVXY9XZm
	zuJcdzIiy8+FuLcP3k1IzQvLiyvH7QxA3zXzxNzozX59vfT0B6HSyNcnQFjswOpruX+o6Z6Ms/Y
	ufwS3LDsywYGf9g4FrpG1wxYIOmkjIRXgrBsePn78S8GOnko7CEpKi4Uw1I9J
X-Gm-Gg: AeBDietEm3hErMYSiXxuxmfkXsD6o1Y8TlUEqDUoY58LnXlFIERLPs+0Fgklva+0ZMS
	ZdAlHEcKiGbeAjk/1sIoIWO3ckHVu7vdDNqmHhnr/jdZ08hHtrXOHPGFlYN0GXPCm8tkmvu78dR
	vXpC2NBa4wyVbvv8SrVXopwutxfMjWfrsqd0g62z0/JcCWsZa0SPN5FE5t/dYsIuuoJODr2vSCV
	VLbSw30I6Q7VoD2fstiqsMWAouK/ogn3cWOp4B+XdJmrufbMzzJiXXJyLWIJH8LWIGWi8t+rCnO
	VOO77hvppJThr52/nguZ8xAUpKJ+CFY0TTzQ6MII
X-Received: by 2002:a17:906:478e:b0:bc9:e1b1:8edf with SMTP id
 a640c23a62f3a-bcaaa54ce58mr98170766b.12.1778228374421; Fri, 08 May 2026
 01:19:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMpZ1qEwNOqR-KQD4kEqd93aB-TpHnG6WdQc2tXUF0aXMmw_SA@mail.gmail.com>
 <198e2ce4-07e1-46c0-818d-1eb18645aca0@leemhuis.info> <CAMpZ1qGEOiPj7cApnWJnojSyEpDmXfco=No5n1VfyTCoNyCyFQ@mail.gmail.com>
 <5308c658-7d4c-4292-b091-a51546ea4d23@leemhuis.info>
In-Reply-To: <5308c658-7d4c-4292-b091-a51546ea4d23@leemhuis.info>
From: Jensen Huang <jensenhuang@friendlyarm.com>
Date: Fri, 8 May 2026 16:19:23 +0800
X-Gm-Features: AVHnY4KNZNxr-RE9SnsIFaocCfihs_7XxPsWOfb_l4qp4jbHCbttfEVHiDYgXSM
Message-ID: <CAMpZ1qEwCjFQ5HkV5pBxHYpKJO14FM3M16XtSJFzjpjigDdX6A@mail.gmail.com>
Subject: Re: [REGRESSION] stmmac: Random DMA reset failure on RK3399 since v6.18
To: Thorsten Leemhuis <regressions@leemhuis.info>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Russell King <linux@armlinux.org.uk>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>, regressions@lists.linux.dev, 
	netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten, Maxime,

On Thu, May 7, 2026 at 9:45=E2=80=AFPM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> [+Ovidiu Panait]
>
> On 5/7/26 14:49, Jensen Huang wrote:
> > On Tue, May 5, 2026 at 4:26=E2=80=AFPM Thorsten Leemhuis
> > <regressions@leemhuis.info> wrote:
> >> On 4/29/26 14:53, Jensen Huang wrote:
> >
> >>> I'm reporting a regression on RK3399 (stmmac) observed in v6.18.24.
> >>> When a network cable is connected during boot, the DMA reset
> >>> occasionally fails with the error message: "Failed to reset the dma".
> >>>
> >>> This appears to be a timing issue related to the EEE RX clock-stop
> >>> logic. Based on my investigation with the RTL8211E PHY, I monitored
> >>> the PHY register PS1R (MMD device 3, address 0x01) and observed a
> >>> value of 0x0f40. This indicates that the PHY is in LPI mode and the R=
X
> >>> clock may have already stopped.
> >>>
> >>> While commit dd557266cf5f ("net: stmmac: block PHY RXC clock-stop")
> >>
> >> Just wondering: have you tried if mainline (e.g. 7.1-rc1) is still
> >> affected? This is something that is always a good advisable (some peop=
le
> >> would call it required). In this case even more, as it since a while
> >> contains a fix for the change you mentioned, that wasn't backported:
> >> c171e679ee66d7 ("net: stmmac: Disable EEE RX clock stop when VLAN is
> >> enabled"). But this is not my area of expertise (and in different area
> >> of the code), so that fix might be unrelated to your issue.
> >
> > Thanks for the pointer.
> > As you suggested, I have tested the mainline and confirmed that the
> > issue is not present in v7.1-rc2, nor as early as v6.19-rc1. However,
> > I verified that the issue persists in the latest stable v6.18.26.
> > I performed a git bisect and the result pointed exactly to the commit
> > you mentioned: c171e679ee66d7 ("net: stmmac: Disable EEE RX clock stop
> > when VLAN is enabled").
>
> Great! Could you please cherry-pick c171e679ee66d7 to 6.18.y and see if
> that fixes things? It sounds like it should.
>
> @Ovidiu Panait: c171e679ee66d7 is a commit of yours. If Jensen confirms
> that cherry-picking fixed the problem, I'd say we ask Greg to pick it up
> for 6.18.y -- unless you see any reasons why that might be a bad idea.
>
> > Additionally, I tested the case where CONFIG_VLAN_8021Q is not set,
> > and the DMA reset issue occurs again.
>
> I'd say that is likely best discussed in a new thread you might want to
> start. Also wondering if it was like that earlier. Or iow: if that is a
> regression or not.

I have tested v6.18.26 and here are the results:
1. running "ip link add link eth0 name eth0.5 type vlan id 5" over 10
times and did not encounter timeout issues. This might be because the
RK3399 GMAC does not support EEE.
2. cherry-picking c171e679ee66d7 to v6.18.26 avoids the DMA reset failure.

Additionally, I am considering proposing a new DT property (e.g.,
snps,no-eee-rx-clk-stop) to explicitly control eee_rx_clk_stop_enable.
This would provide a more robust solution for hardware combinations
that require a continuous RX clock for stability, regardless of VLAN
configurations. However, this would be better discussed in new thread
too.


On Thu, May 7, 2026 at 9:16=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 07/05/2026 14:49, Jensen Huang wrote:
> > On Tue, May 5, 2026 at 4:26=E2=80=AFPM Thorsten Leemhuis
> > <regressions@leemhuis.info> wrote:
> >>
> >> [Jumping in here, as there are no replies yet]
> >>
> >> BTW, Russel, just in case you missed this: looks like this regressions
> >> caused by a change of yours.
>
> I think Russell is dealing with unpleasant personal stuff, let's see if w=
e
> can figure this out while he's away.
>
> >>
> >> On 4/29/26 14:53, Jensen Huang wrote:
> >>>
> >>> I'm reporting a regression on RK3399 (stmmac) observed in v6.18.24.
> >>> When a network cable is connected during boot, the DMA reset
> >>> occasionally fails with the error message: "Failed to reset the dma".
> >>>
> >>> This appears to be a timing issue related to the EEE RX clock-stop
> >>> logic. Based on my investigation with the RTL8211E PHY, I monitored
> >>> the PHY register PS1R (MMD device 3, address 0x01) and observed a
> >>> value of 0x0f40. This indicates that the PHY is in LPI mode and the R=
X
> >>> clock may have already stopped.
>
> From what I get, your current hypthesis is that it takes a while for that
> clock to stabilize and therefore we're accessing the DMA registers too so=
on ?
>
> Can you confirm that with the addition of a small delay ?

Adding msleep(100) between phylink_rx_clk_stop_block() and
stmmac_init_dma_engine(), and it did not help.

> Do you mean that c171e679ee66d7 ("net: stmmac: Disable EEE RX clock stop
> when VLAN is enabled") introduces the bug on 6.18.26 ?
>
> do you have the possibility of bisecting to verify when exactly the issue
> was solved between v6.18 and v6.19 ?

Sorry for the confusion. Commit c171e679ee66d7 is actually the fix. My
git bisect pointed to this commit as the one that avoided the issue
between v6.18 and v6.19-rc1.


Best regards,
Jensen Huang

>
> Ciao, Thorsten
>
> >>> ensures the clock is running before the DMA reset, my tests suggest
> >>> that the phylink_rx_clk_stop_block() call might not provide a
> >>> sufficiently stable RX clock in time for the immediate DMA reset that
> >>> follows.
> >>>
> >>> Since stmmac already sets mac_requires_rxc =3D true, I modified
> >>> phylink_bringup_phy() to honor this flag. This avoids toggling the
> >>> PHY's clk_stop_enable during the initialization sequence, ensuring th=
e
> >>> RX clock remains active and stable throughout.
> >>> With the change below, I achieved 200/200 successful reboots with the
> >>> cable connected (previously ~50% failure rate).
> >>>
> >>> --- a/drivers/net/phy/phylink.c
> >>> +++ b/drivers/net/phy/phylink.c
> >>> @@ -2171,7 +2171,7 @@ static int phylink_bringup_phy(struct phylink
> >>> *pl, struct phy_device *phy,
> >>>      /* Allow the MAC to stop its clock if the PHY has the capability=
 */
> >>>      pl->mac_tx_clk_stop =3D phy_eee_tx_clock_stop_capable(phy) > 0;
> >>>
> >>> -    if (pl->mac_supports_eee_ops) {
> >>> +    if (pl->mac_supports_eee_ops && !pl->config->mac_requires_rxc) {
> >>>          /* Explicitly configure whether the PHY is allowed to stop i=
t's
> >>>           * receive clock.
> >>>           */
> >>>
> >>> Any feedback/testing on this would be appreciated.
> >>>
> >>> Best regards,
> >>> Jensen Huang
> >>>
> >>
>
