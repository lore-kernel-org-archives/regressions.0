Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0598B2D7DC8
	for <regressions@lists.linux.dev>; Tue, 30 Jun 2026 21:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853411; cv=pass; b=Da/zy2+OuD6y4uA1L1GdaUslupgNfin4ZoK9YKhysA5q8fc+ePBl1C+GDjG/HvW0oo1451Pfw/ofDcXAlfeSjv3xQzbV9/kdXyCVN6izob7Jp1MHl2XJZMLYD6G5D2d0Yu/nlKeH/gd5YmVDUVzg6YloDbcFcim47BRbIiLcy8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853411; c=relaxed/simple;
	bh=q7JoXzPTuey5MTxrK590E54YxP0efCGYmeHmx7RdAY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r2fZr3xc0WwK7+bSpVDqINTiIuj+MxQgV9F9TRnopmdc2YXAZzlWU5RZrFvFcwtuL2B54n+xA/ekAj/SMZe2xqnBUxN26CV87DhpDX4Xp+M1f4hR8EFHnVN/I40SXmitE76C/Z7h+GWpfKkod9WuZqmd/4kQiAso7MMZstvde+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjQ8P4Ha; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjQ8P4Ha"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aebf9a509eso1137680e87.3
        for <regressions@lists.linux.dev>; Tue, 30 Jun 2026 14:03:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782853408; cv=none;
        d=google.com; s=arc-20260327;
        b=Y69F4TScxsavQRTb2v/nV5jclFTE+hW9fEFkjWFuaaeW0qpE7V/ItccPOLj+pOec3p
         OiXu8jWFk4C4rGoXCF5laX8Vh/KXSi7Or2jNd1CmuJFwjGEz+42IOvTs4oeXRym/tiIS
         kgfYd6QRO/BucQIrSNuYOAqo80GJ26tAJXLEdfzT3Q3FcK7YObKl12c+OnNLSY75iAvv
         qbLSVUR2MZ6f0SeyUFpf3BDUXjFzGke4K1bkQhs/XeklZF7abuCJ9HFYgd95plH86GMq
         HyHwsUmFhf3cbuv0GFD/LnEBEDS+5OW3RwsVHf7PqEl27zc5Hr6nRUKkKmCd3Wu/XEQh
         GWWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q7JoXzPTuey5MTxrK590E54YxP0efCGYmeHmx7RdAY0=;
        fh=ve6saSlm19lmnzlr7XOsNCbdc1NhS2kfidNTA/BJHaE=;
        b=EW7eG057hl4ZDw/tpbO9ILkqu6TsmvjcCOS4/lZ+B6RxuU2DObbt/IagfTR4C7pdyE
         geCbDDzrBkabu9AEdux3OhZ06P42AZXrX2/o950G4QoTulvvjvcJkuu+YFw9p94y7kiw
         jYhxejIz94cQJ7FSKw2s6Orswxch6IJ+aGJizMCLpmAZyZ3HATTJbfed5JfzEnJCM0eD
         OWeBECQDZ17eKGlGk9tmmYEtcUqm3b+SD5UNgFtYjefEwWGCrmmvwb3t349F3XTDQGU+
         VhBbjMEEBJsWsbiZ0ohG8KE/zIFd2k2VeFQLEfepRb4yexy86KXD4F7QfeClayCHh0IX
         2ACg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782853408; x=1783458208; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7JoXzPTuey5MTxrK590E54YxP0efCGYmeHmx7RdAY0=;
        b=kjQ8P4HaDf5eY6/UuHcd/dJGXVxX7sWsRZfc19HsEOHSIepUUV3BU0DtZlSURWoZ10
         JWTayrM9nImu7ASID0kwGnPvtWtsTYE4jV9megnpjXTF0T79y3q9GEqouiPm7cfrWdIM
         O3wchXSUqMDqR286tQKVAGlnYin4JtUdM+ddit8CH+ZDsVh1YQOArRbBJmbNJwr/VLw/
         uPi0stmNhG1y0pACaoUT7tCc+NOwHsqFJN6FkM9dphqYDtz2evQH1fyfjNPPAKGRYBvZ
         wOKscC5TF+OK8jxv8cV7kwMWS+cpRcSuPXI9vxgols17HykQLWna3p22dCDlJnzsMMOt
         kUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853408; x=1783458208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q7JoXzPTuey5MTxrK590E54YxP0efCGYmeHmx7RdAY0=;
        b=HXx0G8tpdRTb25Gw0qrqiZXjaVXHdOVU8SfiuFgjWrwL+BFGMEnOntcEbAwsjDfww/
         a5ogFlnH2hZS0Gs2anx6bRpABrbx+Ic55Bb34tgPsO1OYO9+cjduWBpFmJ1y9WmYMVSm
         /uDEi75T6TY/obw+AtycrCbXknbFl5vxbzfuwZ4IO58ukLwIn/UtEiH9FrWmCbdTT7RO
         V0fozl87fiowUciS4/luXCD8atr8GXNnhILymiTfAwMjD56xcBOeoAJa5rG1//KsrHEB
         p0FQJvUKQvQgjhQ4CevSjJNCAW+gIBVLrD2BU9VLGTPoM9IO7ErKehbQm4OsqQ/+bPSn
         DZ9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqk5pdoKBf/QSfGLLXaXh/cyqsbGdswsAAWHTfjb9n49EpAyMPLSXUu+2ewpSPo3y3D7urn6Fqnpm8o8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+koe9Dvz0AfGSZDt1tt0KCUk0txVzjOiZLAkIPQaVm27hhfBb
	dBlZQkC7ir6rNQRRXCeprPcSwoN5WoN+BRCPK3FIIM1+hcD+c0DcUlgMQRwSe/hwTurDuSmsTz1
	TfGu96z98QFGDEg6PmmXsvsZW6yITgWQ=
X-Gm-Gg: AfdE7ckr447CkpEll1BilrcuswUnhb4zDaXq2iF40XxV8RGrq69GkgNOspRUP+xL94p
	eSnhRCEJeF+HbbJyB6VtCgjGWeYdHfAZRQuK4kfmcrlMNaFHs5X4lyUipP0YlWp1CjKd1lR5ngw
	VV/YMKRggb+i4R3N7+Gr47q5STqrFccmmNJsaQDnogIV6U61u3C2Xq25DxGRAwA4LR1eKQ5QJQf
	zzKaQEkX7G9bstBD5bsRAFGdjQrrfvn1FjF+qe8GHeN11EUaLgjq9H+3aK6SMnofreMnNXYSzCL
	34RTx3hB5doJYaeTqPjy3eE+ohONt19/4+3+hyz4HxdrwOwNBq44y3+n39QuwCUAE9MCQujhOP9
	95CgCwxpOaJbkai7L500NQMwEHkE=
X-Received: by 2002:a05:6512:618c:b0:5ae:a9ec:9fc4 with SMTP id
 2adb3069b0e04-5aebdbc70a5mr1360054e87.63.1782853408064; Tue, 30 Jun 2026
 14:03:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260427051746.954704-1-rosenp@gmail.com> <ajRmlyx_AEGybykL@soda.int.kasm.eu>
 <CAKxU2N-gfH8Tq29-j2MArogLZuO7JEqtN5LNPVygJzrAERa3cg@mail.gmail.com>
 <ajSDtsJCmYnMNJSD@parmesan.int.kasm.eu> <DJCNDEE8JMPL.1DL49X1EUDFCE@gmail.com>
 <173df064-f373-4cce-b35f-e52f728be263@leemhuis.info>
In-Reply-To: <173df064-f373-4cce-b35f-e52f728be263@leemhuis.info>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 30 Jun 2026 14:03:13 -0700
X-Gm-Features: AVVi8CdKSeWNxVJXoQWTYXgaetJpdvlliSZ-GmhRr-ByVwdKSQxkvdocgc7yH_E
Message-ID: <CAKxU2N9hw6bUNA+rZC_jfZVzi7bMXe96jzLWdL9F3P4=rYnmUQ@mail.gmail.com>
Subject: Re: [PATCH wireless-next] wifi: mt76: fix of_get_mac_address error handling
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Tobias Klausmann <klausman@schwarzvogel.de>, Klara Modin <klarasmodin@gmail.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 5:18=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 6/19/26 03:50, Rosen Penev wrote:
> > On Thu Jun 18, 2026 at 4:51 PM PDT, Klara Modin wrote:
> >> On 2026-06-18 16:01:45 -0700, Rosen Penev wrote:
> >>> On Thu, Jun 18, 2026 at 2:47=E2=80=AFPM Klara Modin <klarasmodin@gmai=
l.com> wrote:
> >>>> On 2026-04-26 22:17:46 -0700, Rosen Penev wrote:
> >>>>> Check return value instead of is_valid_ether_addr. The latter is ha=
ndled
> >>>>> by the former.
> >>>>>
> >>>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >>>>> [...]
> >>>>>>>> Recently I have started to see randomized MAC-addresses on my
> x86 laptop
> >>>> with a MT7922 and the above message printed in the kernel log. I hav=
e
> >>>> CONFIG_OF turned on, but since this is an ACPI system the device is =
not
> >>>> described by any device tree and the earlier of_get_mac_address() li=
kely
> >>>> fails with -ENODEV. Looking at the !CONFIG_OF stub for
> >>>> of_get_mac_address it always returns -ENODEV, meaning this will alwa=
ys
> >>>> randomize the mac in that case too.
> >>
> >>> IIRC, the normal device_get_mac_address supports nvmem now. Does that
> >>> fix your use case?
> >>
> >> I tried this:
> >> [...]
> >> but I still get a random MAC.
> > Then the original patch should be reverted. Unfortunate that it doesn't
> > workq
>
> Happens, no worries, but seems nobody submitted such a revert yet since
> you posted that. Unless I'm missing something -- if so, please do not
> hesitate to tell me!
>
> But if no revert is in the works, could you please submit one, given
> that it was your change that cause the problem?
https://lore.kernel.org/linux-wireless/20260630210215.400379-1-rosenp@gmail=
.com/T/#u
>
> Side note: Tobias (now CCed) ran into the same problem, too:
> https://lore.kernel.org/all/30a90714-02d8-45f2-a7f1-4cfe0627d50b@skade.lo=
cal/
>
> Makes me wonder if more people are affected by this and if we should try
> to mainline the revert rather sooner than later.
>
> Ciao, Thorsten
>
> >>>>
> >>>> Reverting this patch fixes the issue and the correct MAC address is
> >>>> used. I'm not sure if there is any case where of_get_mac_addres() co=
uld
> >>>> fail in a way that results in a valid MAC address but it seems unlik=
ely
> >>>> to me.
> >>>>
> >>>> Regards,
> >>>> Klara Modin
> >
> >
>
