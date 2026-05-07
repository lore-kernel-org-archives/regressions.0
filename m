Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDE13ED5C8
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 15:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778166736; cv=pass; b=OaxD8mPP5LVS/24a2HPMAywSh6mdpQdeaWZBU51q8P7w8FkdN8VL8hR5JIL6BYXj+/l3amYe7Co6NVA5vkRspQ7LljFZjQ03O1rfD04559omftwQ6lrXqHUZ9+30bRtYLPgxxx7+UfKWGNbwmy+o8BwJi4bNqKia9SnDoTcenmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778166736; c=relaxed/simple;
	bh=FMGp6xzLBkx7/5vGEFaCjf4ntdkXBMBI0+62GMYunmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9oNwGgNDcaRhviYM6hDGcCyitPvbU6JRVRlz7abB+uudFtC7JvT4suumn3raw7AdMPHHtI4OEkvC3LItIFIAq40xP8nOPoKNvuhk0cIvd2jqr8Ln/QPY7j2fTLg/lRTCM6n7Hm9cu/mtKYjT2o6+VemaOyG+28qBx+4UoGuAtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oqxz4k/i; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oqxz4k/i"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-679b072ed3aso486440eaf.1
        for <regressions@lists.linux.dev>; Thu, 07 May 2026 08:12:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778166733; cv=none;
        d=google.com; s=arc-20240605;
        b=VBPZgOd8Vsq2IVt7NavQr2jbcbgU7/Y3QC7LN0CmCx+UaKw658eoL4s9tuAZGEY+Fx
         ziK0E3qEnWijvluJ0iStytu/OTF60lD+cdjTsL5v1f13pchdlwKUk6IdsA5ZZswL0dBs
         BZPdqTT7FUMZc/HfSaURXdzeKDzRRC6HJ/1b/UbTLTMoRjT8KSN5A4f/IIzl7YBHn/VP
         jTCJwQmsWzfnBGOTgcSnKw9JU3oL8thC+eHwjO5TTc60zJ3myz4vhCCDWsIMM2i2FCaZ
         Ru1ze9R3T02SZ9Ni+xRDjBS4AKj8KaoTJh0hq+XVHrO5GA4BmfUgkHG+Dwz/wCb1/I5E
         NjIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=elKrUuP084xmSYoDMk/AYEh0e7keDQdHlAGJidfmCPA=;
        fh=xl4+HK+2MkW1qp/O8ldpqM8/bYE1cRtQHZso/duVYv0=;
        b=eS/YNXW8W8zpen9VtnB+jJ6g/eHOgKh9U8XgysJrYFJ5gGZteqivVEfpGjRB1IcTJb
         STb2W/1wx/CxeerH7PK/8Mef+U4nNcjpquaiEjkyef9rkScEmn1PV37ZX1dy7t1Hy3Rg
         OClt8DPn7Jh2utqdS00BA/Z6tUo2VCfKWqJKdVidQxeJWEZ/EroRF+TGN0TD48GHGvKF
         oAvAkrSNDMFn+q7SudaXPhx5CEi17RKxFEUrNHoS0ufcYuHthX7XMxaPd7q/b1iAvykc
         LDF2i60JbZnYNs4Ut5Euo0tYDIWMFx+eJinN966BLv8ttsLNasMMGJzr9Xmf7zpsuEnO
         Ez/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778166733; x=1778771533; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=elKrUuP084xmSYoDMk/AYEh0e7keDQdHlAGJidfmCPA=;
        b=Oqxz4k/i8nVhJeJvwf8A0Cdtj+e2XHW2zLCxyFpSLAvbD+kY83icc5fbHgzQS88BOG
         Zv98PXKuR6zNoUDKlHMHVvGDPYKPNtG7K3aX9JTePP1ZEm4Ws5+pvk2Ss57WUTLWoX0H
         TRGJ2RUi+57QIt53E8w/68mPcjjciDFLa3cnWpmeSs+l+FB88uxEso7537pHc3sxTBCk
         8VfQX2g+TOo4E7xgHnFwZwzhRfB2BkUNvsY7ujo6tGzllOyQGNPzbx6VDNDaMio2s3Zu
         nDmAPb/4VsMCANQk3935MaL9QzqXWkj+QA/ZTu7zw5cxcaZeUIsDA8AycQTMPR6xRF2J
         8f3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778166733; x=1778771533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elKrUuP084xmSYoDMk/AYEh0e7keDQdHlAGJidfmCPA=;
        b=phyWpQYSOcQAsivs7mW3GD6vQIP1k0WFoq4ke6aP7gvZbdlecyjVFUtbIX10RFl+QX
         heO9xH06g5VD3E0BJMgDeS/6P8luXdiDO647zKrQx7fy+h9qAHUQhz/fGaAUwOAHjwDk
         RwDiD0L8Wr0d0TyUMB3CCAq5K0S8j0u2XZfWOyPfrlwvycX0pS/rKEJRn2asLoGQbTY2
         LWw8Uk/3X9p+Pk3Rf/4eSV/0rPEHU8kExEEpWJslUPKE9Pct3D5T2ydJGI73/Q6s4EC1
         RfUtbR4K/Neg2SbkwumDP49LyjlfVi7/QZQ5wuQ1IyZjW0HxlLp4Ut1mapoXVAl4G1IO
         gdmw==
X-Forwarded-Encrypted: i=1; AFNElJ9QnQ9RS+0azWOEMMMECt2L+QYdB7gtjdqfJW1UJtN8Ht6nIp+ND2kilKdfKIMgaQYnbZjHBdAr/b6zmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcgEtoX9DRJTbgQNQAftbgLdgSqRl/ANDJXtllIMqKU9RwpuY3
	K0gbrqmRZxguhtP99PiNnuoyA5uTtiUNjQ8n4QqE7qfaPr8xpTFz6jcG8toBYcCnQ/S3KEdjAQt
	giAJl5ZHTZe8mtPyAKp8yOe1fx8z/vNI=
X-Gm-Gg: AeBDieteS/gCetzrStJOYVdNx4J8MPfK/fBBU+mJVYyaqBFG7O3t+rqjBehcUcJVZ2u
	ds+OULl+jGDwR1qgSfZFkBR096xu6+PQLuBsinZcmgUeJJ0OdTZ0FzvYzRtmSJPRP8AHNeYu7Cj
	FyeW3GjA4Ve0Tw22eV9wqFvcRkVun4HHSc5r+o5s+FEQT6aXj9/PTmvWMENrMnuBqqxBnCP/skL
	vMFs8+CpdvRbUIFJ1UiUVNeXCnQP2RBXdFtgkhNk3bwWE7yN+yaOypZWMr8+2LWvf+zdoiDphzj
	Bl9M9FVIHeZcHsdv
X-Received: by 2002:a05:6820:4ccb:b0:693:428:bd2a with SMTP id
 006d021491bc7-69998c9fa64mr5047713eaf.2.1778166733504; Thu, 07 May 2026
 08:12:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <36875d66-f601-4d18-9654-bd86b60918e8@leemhuis.info>
 <87bjett3ud.wl-tiwai@suse.de> <7929c116-ff2e-413b-ae73-e7d19e846e0f@harin.net>
 <87v7czrasg.wl-tiwai@suse.de> <trinity-c85da660-f130-434c-a64c-a076180ce5c0-1778158023623@3c-app-mailcom-bs03>
 <87qznnpd2p.wl-tiwai@suse.de> <CAFTm+6Bj_dWdSifUoS7hZ3kfVambXK_=7jyGuHp33RZoSEGVUA@mail.gmail.com>
 <87cxz7p8b3.wl-tiwai@suse.de>
In-Reply-To: <87cxz7p8b3.wl-tiwai@suse.de>
From: Matt DeVillier <matt.devillier@gmail.com>
Date: Thu, 7 May 2026 10:12:00 -0500
X-Gm-Features: AVHnY4KoM__qBAlwXU-NVqbc1xYT9cd538UDdfYgaoMAC9hj-QAhu4sK2YQEPDo
Message-ID: <CAFTm+6AfeXKf=b2frG4xC5yC4jjM9TkD6c8+dOWWFw6BDjDESw@mail.gmail.com>
Subject: Re: [regression] ctxfi: no speaker output when headphones connected
 on >=7.0.x
To: Takashi Iwai <tiwai@suse.de>
Cc: Dutch Ingraham <stoa@gmx.us>, Harin Lee <me@harin.net>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	Linux Sound System <linux-sound@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000809dd306513bb418"

--000000000000809dd306513bb418
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 10:07=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 07 May 2026 17:02:14 +0200,
> Matt DeVillier wrote:
> >
> >
> > On Thu, May 7, 2026 at 8:24=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wro=
te:
> >
> >     On Thu, 07 May 2026 14:47:03 +0200,
> >     Dutch Ingraham wrote:
> >     >
> >     > > Sent: Thursday, May 07, 2026 at 1:30 AM
> >     > > From: "Takashi Iwai" <tiwai@suse.de>
> >     > > To: "Harin Lee" <me@harin.net>
> >     > > Cc: "Takashi Iwai" <tiwai@suse.de>, "Thorsten Leemhuis" <
> >     regressions@leemhuis.info>, "Jaroslav Kysela" <perex@perex.cz>, "Ta=
kashi
> >     Iwai" <tiwai@suse.com>, "Linux kernel regressions list" <
> >     regressions@lists.linux.dev>, "Linux Sound System" <
> >     linux-sound@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>=
,
> >     stoa@gmx.us
> >     > > Subject: Re: [regression] ctxfi: no speaker output when headpho=
nes
> >     connected on >=3D7.0.x
> >     > >
> >     > > On Thu, 07 May 2026 00:06:11 +0200,
> >     > > Harin Lee wrote:
> >     > > >
> >     > > > On 5/6/26 4:05 PM, Takashi Iwai wrote:
> >     > > > > On Wed, 06 May 2026 08:24:36 +0200,
> >     > > > > Thorsten Leemhuis wrote:
> >     > > > >>
> >     > > > >> Hi! Just FYI, I noticed a regression report in bugzilla:
> >     > > > >>
> >     > > > >> https://bugzilla.kernel.org/show_bug.cgi?id=3D221461
> >     > > > >>
> >     > > > >> To quote:
> >     > > > >>
> >     > > > >>> Dutch Ingraham 2026-05-03 18:12:49 UTC
> >     > > > >>>
> >     > > > >>> Kernels >=3D7.0.1 contain a regression as to Creative Sou=
nd
> >     Blaster Z SE
> >     > > > >>> discrete pci sound card, but not integrated. Kernels 7.0.=
1,
> >     7.0.2, and
> >     > > > >>> 7.0.3 tested; 7.0.0 not tested. Reverting to any 6.18.x o=
r
> >     6.12.x does
> >     > > > >>> not present the issue.
> >     > > > >>>
> >     > > > >>> Specifically, using pipewire managed by pavucontrol, on b=
oth
> >     Gentoo and
> >     > > > >>> Arch Linux, when both external speakers and headphones ar=
e
> >     connected,
> >     > > > >>> all sound is routed through the headphones regardless of
> >     whether settings
> >     > > > >>> are set to Line Out/Speaker or Line Out/Headphones; there=
 is no
> >     speaker
> >     > > > >>> output. If headphones are disconnected, without reboot,
> >     speakers work;
> >     > > > >>> reconnect headphones, without reboot, sound reverts to
> >     headphones.
> >     > > > >>>
> >     > > > >>> Kernel: 7.0.3, Gentoo compiled from source using olddefco=
nfig
> >     on 6.18.24
> >     > > > >>>               .config; Arch standard release
> >     > > > >>> 'lspci -nnk | grep -i audio' attached
> >     > > > >>> 'dmesg | grep -i audio' for 7.0.3 and 6.18.24 attached
> >     > > > >>> pipewire-1.6.4 on both Gentoo and Arch Linux
> >     > > > >>> alsa-firmware-1.2.4 on both Gentoo and Arch Linux
> >     > > > >>> 'cat /proc/sys/kernel/tainted' returns 0 for both Gentoo =
and
> >     Arch Linux
> >     > > > >>>
> >     > > > >>> Processor             :       AMD Ryzen7 5700G
> >     > > > >>> Motherboard           :       Asus Prime X570-Pro
> >     > > > >>> RAM                           :       Patriot Viper Steel=
 DDR-4
> >     @3200mHz
> >     > > > >>> Graphics        :   ASRock AMD Radeon RX 7600 Challenger =
8GB OC
> >     > > > >>> Sound Card      :   Creative Sound Blaster Z SE
> >     > > > >>>
> >     > > > >>>
> >     > > > >>> Expected outcome: ability to choose output to either spea=
kers
> >     or head-
> >     > > > >>> phones while both are plugged-in to sound card.
> >     > > > >>>
> >     > > > >>> Workaround: none known.
> >     > > > >>
> >     > > > >> See the ticket for more details. One of them: 7.1-rc2 is
> >     affected as
> >     > > > >> well. Reporter is CCed. Forwarded this to ensure this repo=
rt
> >     makes it to
> >     > > > >> the interested parties, as bugzilla might not have forward=
ed
> >     this.
> >     > > > >>
> >     > > > >> Dutch Ingraham: if nobody within a few days has an idea wh=
y this
> >     > > > >> happens, you will likely have to use a git bisection to ge=
t this
> >     resolved.
> >     > > > >
> >     > > > > As there have been many significant changes in ctxfi since =
6.18,
> >     it's
> >     > > > > hard to tell what broke.  Please go git bisect.
> >     > > > >
> >     > > > >
> >     > > > > thanks,
> >     > > > >
> >     > > > > Takashi
> >     > > > >
> >     > > >
> >     > > > Creative Sound Blaster Z-series uses the snd_hda_codec_ca0132
> >     driver,
> >     > > > not snd_ctxfi. The dmesg logs in the bugzilla shows only ca01=
32
> >     > > > entries.
> >     > >
> >     > > Ah, sorry, then it's easier.  The only major change is the
> >     > > commit 778031e1658d206a52bf9491c91ae5d4f4a2509d
> >     > >     ALSA: hda/ca0132: Set HP/Speaker auto-detect default from
> >     headphone pin verb
> >     > >
> >     > > Try to revert this one.
> >     > >
> >     > >
> >     > > thanks,
> >     > >
> >     > > Takashi
> >     > >
> >     >
> >     > I can confirm this seems like a good candidate. I built and teste=
d
> >     6.19.14
> >     > and 7.0. On 6.19.14, speakers work as expected; on 7.0, speakers =
are
> >     not
> >     > working as expected and the offending patch is included in the 7.=
0
> >     patchset.
> >     >
> >     > Thank you all for your work on this issue.
> >
> >     OK, then let's put Matt to the party.
> >     Matt, could you help for debugging the regression?
> >
> >     Takashi
> >
> > I can confirm the regression here on my 2013 Chromebook Pixel w/CA0132.
> >
> > Looking more closely, the issue is that tVNID_HP_ASEL and VNID_HP_SEL a=
re
> > mutually exclusive selection sources in ca0132_select_out() /
> > ca0132_alt_select_out(),
> > and auto-detect always "wins." So, enabling auto-detect effectively dis=
abled
> > user
> > override.
> >
> > While reverting would fix this problem, it would reintroduce the proble=
m of
> > jack-detect being
> > ignored completely. A better solution would be to default to auto-detec=
t, but
> > allow manual selection
> > to override. Here's a quick patch I whipped up that should resolve the =
issue
> > (untested though):
> > ---
> > From: Matt DeVillier <matt.devillier@gmail.com>
> > Date: Thu, 7 May 2026 09:58:41 -0500
> > Subject: [PATCH] ALSA: hda/ca0132: Disable auto-detect on manual output
> > select
> >
> > Commit 778031e1658d ("ALSA: hda/ca0132: Set HP/Speaker
> > auto-detect default from headphone pin verb") enables HP/Speaker
> > auto-detect by default when the headphone pin supports presence detect.
> >
> > With auto-detect enabled, ca0132_select_out() and ca0132_alt_select_out=
()
> > choose the output from jack presence instead of the manual HP/Speaker
> > selection. This means selecting speaker output while headphones are
> > plugged in updates the control state, but audio still routes to the
> > headphones.
> >
> > Treat an explicit manual output selection as a request to leave
> > auto-detect mode. Clear the HP/Speaker auto-detect switch before applyi=
ng
> > the manual selection, and notify userspace so the auto-detect control
> > state is updated in mixers. Do this for both the normal HP/Speaker
> > Playback Switch and the alternate Output Select control used by desktop
> > cards.
> >
> > This keeps auto-detect enabled by default for devices with jack presenc=
e
> > detection, while preserving the expected behavior that a manual output
> > choice takes effect immediately.
> >
> > Fixes: 778031e1658d ("ALSA: hda/ca0132: Set HP/Speaker auto-detect defa=
ult
> > from headphone pin verb")
> > Signed-off-by: Matt DeVillier <matt.devillier@gmail.com>
> > ---
> >  sound/hda/codecs/ca0132.c | 44 +++++++++++++++++++++++++++++++--------=
-----
> >  1 file changed, 31 insertions(+), 13 deletions(-)
> >
> > diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
> > index ad533b04ab29..be565ffaade0 100644
> > --- a/sound/hda/codecs/ca0132.c
> > +++ b/sound/hda/codecs/ca0132.c
> > @@ -5498,6 +5498,30 @@ static int zxr_headphone_gain_set(struct hda_cod=
ec
> > *codec, long val)
> >   return 0;
> >  }
> (snip)
>
> It looks like that the patch is malformed by your mailer.
> For avoiding unneeded troubles, please fix the setup or give an
> attachment, too.
>
>
> thanks,
>
> Takashi

My apologies, forgot to ensure text-mode sending when I replied.
Hopefully better this time.

regards,
Matt

--000000000000809dd306513bb418
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-ALSA-hda-ca0132-Disable-auto-detect-on-manual-outpu.patch"
Content-Disposition: attachment; 
	filename="0001-ALSA-hda-ca0132-Disable-auto-detect-on-manual-outpu.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_movmgxrg0>
X-Attachment-Id: f_movmgxrg0

RnJvbSAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXR0IERlVmlsbGllciA8bWF0dC5kZXZpbGxpZXJAZ21haWwu
Y29tPgpEYXRlOiBUaHUsIDcgTWF5IDIwMjYgMDk6NTg6NDEgLTA1MDAKU3ViamVjdDogW1BBVENI
XSBBTFNBOiBoZGEvY2EwMTMyOiBEaXNhYmxlIGF1dG8tZGV0ZWN0IG9uIG1hbnVhbCBvdXRwdXQg
c2VsZWN0CgpDb21taXQgNzc4MDMxZTE2NThkICgiQUxTQTogaGRhL2NhMDEzMjogU2V0IEhQL1Nw
ZWFrZXIKYXV0by1kZXRlY3QgZGVmYXVsdCBmcm9tIGhlYWRwaG9uZSBwaW4gdmVyYiIpIGVuYWJs
ZXMgSFAvU3BlYWtlcgphdXRvLWRldGVjdCBieSBkZWZhdWx0IHdoZW4gdGhlIGhlYWRwaG9uZSBw
aW4gc3VwcG9ydHMgcHJlc2VuY2UgZGV0ZWN0LgoKV2l0aCBhdXRvLWRldGVjdCBlbmFibGVkLCBj
YTAxMzJfc2VsZWN0X291dCgpIGFuZCBjYTAxMzJfYWx0X3NlbGVjdF9vdXQoKQpjaG9vc2UgdGhl
IG91dHB1dCBmcm9tIGphY2sgcHJlc2VuY2UgaW5zdGVhZCBvZiB0aGUgbWFudWFsIEhQL1NwZWFr
ZXIKc2VsZWN0aW9uLiBUaGlzIG1lYW5zIHNlbGVjdGluZyBzcGVha2VyIG91dHB1dCB3aGlsZSBo
ZWFkcGhvbmVzIGFyZQpwbHVnZ2VkIGluIHVwZGF0ZXMgdGhlIGNvbnRyb2wgc3RhdGUsIGJ1dCBh
dWRpbyBzdGlsbCByb3V0ZXMgdG8gdGhlCmhlYWRwaG9uZXMuCgpUcmVhdCBhbiBleHBsaWNpdCBt
YW51YWwgb3V0cHV0IHNlbGVjdGlvbiBhcyBhIHJlcXVlc3QgdG8gbGVhdmUKYXV0by1kZXRlY3Qg
bW9kZS4gQ2xlYXIgdGhlIEhQL1NwZWFrZXIgYXV0by1kZXRlY3Qgc3dpdGNoIGJlZm9yZSBhcHBs
eWluZwp0aGUgbWFudWFsIHNlbGVjdGlvbiwgYW5kIG5vdGlmeSB1c2Vyc3BhY2Ugc28gdGhlIGF1
dG8tZGV0ZWN0IGNvbnRyb2wKc3RhdGUgaXMgdXBkYXRlZCBpbiBtaXhlcnMuIERvIHRoaXMgZm9y
IGJvdGggdGhlIG5vcm1hbCBIUC9TcGVha2VyClBsYXliYWNrIFN3aXRjaCBhbmQgdGhlIGFsdGVy
bmF0ZSBPdXRwdXQgU2VsZWN0IGNvbnRyb2wgdXNlZCBieSBkZXNrdG9wCmNhcmRzLgoKVGhpcyBr
ZWVwcyBhdXRvLWRldGVjdCBlbmFibGVkIGJ5IGRlZmF1bHQgZm9yIGRldmljZXMgd2l0aCBqYWNr
IHByZXNlbmNlCmRldGVjdGlvbiwgd2hpbGUgcHJlc2VydmluZyB0aGUgZXhwZWN0ZWQgYmVoYXZp
b3IgdGhhdCBhIG1hbnVhbCBvdXRwdXQKY2hvaWNlIHRha2VzIGVmZmVjdCBpbW1lZGlhdGVseS4K
CkZpeGVzOiA3NzgwMzFlMTY1OGQgKCJBTFNBOiBoZGEvY2EwMTMyOiBTZXQgSFAvU3BlYWtlciBh
dXRvLWRldGVjdCBkZWZhdWx0IGZyb20gaGVhZHBob25lIHBpbiB2ZXJiIikKU2lnbmVkLW9mZi1i
eTogTWF0dCBEZVZpbGxpZXIgPG1hdHQuZGV2aWxsaWVyQGdtYWlsLmNvbT4KLS0tCiBzb3VuZC9o
ZGEvY29kZWNzL2NhMDEzMi5jIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9oZGEvY29kZWNzL2NhMDEzMi5jIGIvc291bmQvaGRh
L2NvZGVjcy9jYTAxMzIuYwppbmRleCBhZDUzM2IwNGFiMjkuLmJlNTY1ZmZhYWRlMCAxMDA2NDQK
LS0tIGEvc291bmQvaGRhL2NvZGVjcy9jYTAxMzIuYworKysgYi9zb3VuZC9oZGEvY29kZWNzL2Nh
MDEzMi5jCkBAIC01NDk4LDYgKzU0OTgsMzAgQEAgc3RhdGljIGludCB6eHJfaGVhZHBob25lX2dh
aW5fc2V0KHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLCBsb25nIHZhbCkKIAlyZXR1cm4gMDsKIH0K
IAorLyoKKyAqIE1hbnVhbCBvdXRwdXQgc2VsZWN0aW9uIChIUC9TcGVha2VyIFBsYXliYWNrIFN3
aXRjaCBvciBhbHQgT3V0cHV0IFNlbGVjdCkKKyAqIGlzIG1lYW5pbmdmdWwgb25seSB3aGVuIEhQ
L1NwZWFrZXIgYXV0by1kZXRlY3QgaXMgZGlzYWJsZWQsIHNpbmNlIHRoZQorICogc2VsZWN0X291
dCBwYXRoIGFsd2F5cyBwcmVmZXJzIGphY2sgcHJlc2VuY2Ugd2hlbiBhdXRvLWRldGVjdCBpcyBv
bi4gV2hlbgorICogdGhlIHVzZXIgZXhwbGljaXRseSBjaG9vc2VzIGFuIG91dHB1dCwgdHVybiBh
dXRvLWRldGVjdCBvZmYgc28gdGhlIG1hbnVhbAorICogY2hvaWNlIGFjdHVhbGx5IHRha2VzIGVm
ZmVjdCwgYW5kIG5vdGlmeSB1c2Vyc3BhY2Ugc28gdGhlIGF1dG8tZGV0ZWN0CisgKiBjb250cm9s
IHJlZmxlY3RzIHRoZSBuZXcgc3RhdGUuCisgKi8KK3N0YXRpYyB2b2lkIGNhMDEzMl9kaXNhYmxl
X2hwX2F1dG9fZGV0ZWN0KHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQoreworCXN0cnVjdCBjYTAx
MzJfc3BlYyAqc3BlYyA9IGNvZGVjLT5zcGVjOworCXN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjdGw7
CisKKwlpZiAoIXNwZWMtPnZub2RlX2xzd2l0Y2hbVk5JRF9IUF9BU0VMIC0gVk5PREVfU1RBUlRf
TklEXSkKKwkJcmV0dXJuOworCisJc3BlYy0+dm5vZGVfbHN3aXRjaFtWTklEX0hQX0FTRUwgLSBW
Tk9ERV9TVEFSVF9OSURdID0gMDsKKwlrY3RsID0gc25kX2hkYV9maW5kX21peGVyX2N0bChjb2Rl
YywKKwkJCQkgICAgICAiSFAvU3BlYWtlciBBdXRvIERldGVjdCBQbGF5YmFjayBTd2l0Y2giKTsK
KwlpZiAoa2N0bCkKKwkJc25kX2N0bF9ub3RpZnkoY29kZWMtPmNhcmQsIFNORFJWX0NUTF9FVkVO
VF9NQVNLX1ZBTFVFLAorCQkJICAgICAgICZrY3RsLT5pZCk7Cit9CisKIHN0YXRpYyBpbnQgY2Ew
MTMyX3Zub2RlX3N3aXRjaF9zZXQoc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsCiAJCQkJ
c3RydWN0IHNuZF9jdGxfZWxlbV92YWx1ZSAqdWNvbnRyb2wpCiB7CkBAIC01NTEwLDE0ICs1NTM0
LDExIEBAIHN0YXRpYyBpbnQgY2EwMTMyX3Zub2RlX3N3aXRjaF9zZXQoc3RydWN0IHNuZF9rY29u
dHJvbCAqa2NvbnRyb2wsCiAJaW50IGF1dG9famFjazsKIAogCWlmIChuaWQgPT0gVk5JRF9IUF9T
RUwpIHsKLQkJYXV0b19qYWNrID0KLQkJCXNwZWMtPnZub2RlX2xzd2l0Y2hbVk5JRF9IUF9BU0VM
IC0gVk5PREVfU1RBUlRfTklEXTsKLQkJaWYgKCFhdXRvX2phY2spIHsKLQkJCWlmIChjYTAxMzJf
dXNlX2FsdF9mdW5jdGlvbnMoc3BlYykpCi0JCQkJY2EwMTMyX2FsdF9zZWxlY3Rfb3V0KGNvZGVj
KTsKLQkJCWVsc2UKLQkJCQljYTAxMzJfc2VsZWN0X291dChjb2RlYyk7Ci0JCX0KKwkJY2EwMTMy
X2Rpc2FibGVfaHBfYXV0b19kZXRlY3QoY29kZWMpOworCQlpZiAoY2EwMTMyX3VzZV9hbHRfZnVu
Y3Rpb25zKHNwZWMpKQorCQkJY2EwMTMyX2FsdF9zZWxlY3Rfb3V0KGNvZGVjKTsKKwkJZWxzZQor
CQkJY2EwMTMyX3NlbGVjdF9vdXQoY29kZWMpOwogCQlyZXR1cm4gMTsKIAl9CiAKQEAgLTU5Nzgs
NyArNTk5OSw2IEBAIHN0YXRpYyBpbnQgY2EwMTMyX2FsdF9vdXRwdXRfc2VsZWN0X3B1dChzdHJ1
Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwKIAlzdHJ1Y3QgY2EwMTMyX3NwZWMgKnNwZWMgPSBj
b2RlYy0+c3BlYzsKIAlpbnQgc2VsID0gdWNvbnRyb2wtPnZhbHVlLmVudW1lcmF0ZWQuaXRlbVsw
XTsKIAl1bnNpZ25lZCBpbnQgaXRlbXMgPSBOVU1fT0ZfT1VUUFVUUzsKLQl1bnNpZ25lZCBpbnQg
YXV0b19qYWNrOwogCiAJaWYgKHNlbCA+PSBpdGVtcykKIAkJcmV0dXJuIDA7CkBAIC01OTg4LDEw
ICs2MDA4LDggQEAgc3RhdGljIGludCBjYTAxMzJfYWx0X291dHB1dF9zZWxlY3RfcHV0KHN0cnVj
dCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLAogCiAJc3BlYy0+b3V0X2VudW1fdmFsID0gc2VsOwog
Ci0JYXV0b19qYWNrID0gc3BlYy0+dm5vZGVfbHN3aXRjaFtWTklEX0hQX0FTRUwgLSBWTk9ERV9T
VEFSVF9OSURdOwotCi0JaWYgKCFhdXRvX2phY2spCi0JCWNhMDEzMl9hbHRfc2VsZWN0X291dChj
b2RlYyk7CisJY2EwMTMyX2Rpc2FibGVfaHBfYXV0b19kZXRlY3QoY29kZWMpOworCWNhMDEzMl9h
bHRfc2VsZWN0X291dChjb2RlYyk7CiAKIAlyZXR1cm4gMTsKIH0KLS0gCjIuNTEuMAoK
--000000000000809dd306513bb418--
