Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595AA3F54D9
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 18:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778178220; cv=none; b=ZM0TyEC/+Iyz7G1Pt/nfaVPkH7RkWKtnkblc6h/dukwZ0G/DS2mJae+/Zb1TMPkVeBM5B3Rr+iQUWISMBioO5ZOxW2IfcfccbIfOYYvGp+DGKiRUDRjTLtt6hHJmqpXNE4cBaXF3b3SN0fDkPfrVhdpaxdjv+xGHWwgqwQOma9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778178220; c=relaxed/simple;
	bh=C3+Kn8ERfUAeAZaLjUjE7AD2EQzlyLolncmi+EAvfEU=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=XyI0YxTarWhwd0L4kN8ZHIdZoBCpJtzuUMqXvkb/Z53Ew5Tk/BvqN0YnSagKriImV9UNuZgjeOcOOQoAdCBoCav9KrWeCCb/VtdGdIUgAFMHFJl9gSbSg4l69NejylwammWEBxWlSojdeAMAY2JF0GpZ6oiKZDpj2N9fWrjAsMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.us; spf=pass smtp.mailfrom=gmx.us; dkim=pass (2048-bit key) header.d=gmx.us header.i=stoa@gmx.us header.b=BBbAfVaX; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.us header.i=stoa@gmx.us header.b="BBbAfVaX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.us;
	s=s31663417; t=1778178205; x=1778783005; i=stoa@gmx.us;
	bh=7lUCAF6moTu+YIZw3WnNVJqWkRpPaB0Rnl0qg0IYZi0=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BBbAfVaX1K7Nh/PQM0JkPAb2OXX/AzykD4OsPhaeaymvEGB2pn9zMsoJoibQNtzS
	 W45uPBjfF6Rzjc8PZdMAgmTGrsZZn9dJAtQYMNtBqplQk9lNeDvhSDLSAxl5Y/zFY
	 h0YxVj9higaZCkaMkOHWDncCHKG8h7kzRyuIIdOnptNcSZ7L3Zk8SRfPP82ibSnjZ
	 Mx5hYGp4w3GY7rogdjoi0wVpGkjUXiQUxCPBSAtl0yaibF9JoCNdbZUQjasIfh6Ja
	 dywYa3RE6jD3fwraltNTuz1TZvPXyK9lTtxZGKHDNpuJ8Tv8HJ4fvaZEnh8+9yW2V
	 wzXCOcdpA68AYatsQQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [74.10.39.157] ([74.10.39.157]) by web-mail.gmx.net
 (3c-app-mailcom-bs11.server.lan [172.19.170.179]) (via HTTP); Thu, 7 May
 2026 20:23:25 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <trinity-2f1dd3ff-4c75-4085-86ae-cca1d09aa83f-1778178205524@3c-app-mailcom-bs11>
From: Dutch Ingraham <stoa@gmx.us>
To: Matt DeVillier <matt.devillier@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, Harin Lee <me@harin.net>, Thorsten
 Leemhuis <regressions@leemhuis.info>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Linux kernel regressions list
 <regressions@lists.linux.dev>, Linux Sound System
 <linux-sound@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [regression] ctxfi: no speaker output when headphones connected
 on >=7.0.x
Content-Type: text/plain; charset=UTF-8
Date: Thu, 7 May 2026 20:23:25 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAFTm+6AfeXKf=b2frG4xC5yC4jjM9TkD6c8+dOWWFw6BDjDESw@mail.gmail.com>
References: <36875d66-f601-4d18-9654-bd86b60918e8@leemhuis.info>
 <87bjett3ud.wl-tiwai@suse.de>
 <7929c116-ff2e-413b-ae73-e7d19e846e0f@harin.net>
 <87v7czrasg.wl-tiwai@suse.de>
 <trinity-c85da660-f130-434c-a64c-a076180ce5c0-1778158023623@3c-app-mailcom-bs03>
 <87qznnpd2p.wl-tiwai@suse.de>
 <CAFTm+6Bj_dWdSifUoS7hZ3kfVambXK_=7jyGuHp33RZoSEGVUA@mail.gmail.com>
 <87cxz7p8b3.wl-tiwai@suse.de>
 <CAFTm+6AfeXKf=b2frG4xC5yC4jjM9TkD6c8+dOWWFw6BDjDESw@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:l26MezC93hGVrr35rlKZGT//UG/4BaA8MiMQevn+nK3q7N7BM94K1qrX7pBL5oFV0PRMG
 W6q1bJjpDi3hxaJxqxBVDlPhm6tDXkRN0kJ/eMetGUV+hOG3kGYSIOgFaV6b7bXCm7m30w/KB/jB
 mjFNfWe9Cso1Giaao8jUh1s1GDu6VdywibHp/iO0CmOQBI833+rmZ/qNf2nX8AQw5BkjvXK5jStq
 afb8mdmL9oWxwohJl/gmP29LPMoOxEjGLBW1Gv14toiBR31xbJtZAyOxzV2V/lMNO3jgjXlZnTO5
 p8=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A2XoJZhIc3Q=;bVzSoVrYORoFQaplqqU1CnyUPKG
 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



> Sent: Thursday, May 07, 2026 at 10:12 AM
> From: "Matt DeVillier" <matt=2Edevillier@gmail=2Ecom>
> To: "Takashi Iwai" <tiwai@suse=2Ede>
> Cc: "Dutch Ingraham" <stoa@gmx=2Eus>, "Harin Lee" <me@harin=2Enet>, "Tho=
rsten Leemhuis" <regressions@leemhuis=2Einfo>, "Jaroslav Kysela" <perex@per=
ex=2Ecz>, "Takashi Iwai" <tiwai@suse=2Ecom>, "Linux kernel regressions list=
" <regressions@lists=2Elinux=2Edev>, "Linux Sound System" <linux-sound@vger=
=2Ekernel=2Eorg>, "LKML" <linux-kernel@vger=2Ekernel=2Eorg>
> Subject: Re: [regression] ctxfi: no speaker output when headphones conne=
cted on >=3D7=2E0=2Ex
>
> On Thu, May 7, 2026 at 10:07=E2=80=AFAM Takashi Iwai <tiwai@suse=2Ede> w=
rote:
> >
> > On Thu, 07 May 2026 17:02:14 +0200,
> > Matt DeVillier wrote:
> > >
> > >
> > > On Thu, May 7, 2026 at 8:24=E2=80=AFAM Takashi Iwai <tiwai@suse=2Ede=
> wrote:
> > >
> > >     On Thu, 07 May 2026 14:47:03 +0200,
> > >     Dutch Ingraham wrote:
> > >     >
> > >     > > Sent: Thursday, May 07, 2026 at 1:30 AM
> > >     > > From: "Takashi Iwai" <tiwai@suse=2Ede>
> > >     > > To: "Harin Lee" <me@harin=2Enet>
> > >     > > Cc: "Takashi Iwai" <tiwai@suse=2Ede>, "Thorsten Leemhuis" <
> > >     regressions@leemhuis=2Einfo>, "Jaroslav Kysela" <perex@perex=2Ec=
z>, "Takashi
> > >     Iwai" <tiwai@suse=2Ecom>, "Linux kernel regressions list" <
> > >     regressions@lists=2Elinux=2Edev>, "Linux Sound System" <
> > >     linux-sound@vger=2Ekernel=2Eorg>, "LKML" <linux-kernel@vger=2Eke=
rnel=2Eorg>,
> > >     stoa@gmx=2Eus
> > >     > > Subject: Re: [regression] ctxfi: no speaker output when head=
phones
> > >     connected on >=3D7=2E0=2Ex
> > >     > >
> > >     > > On Thu, 07 May 2026 00:06:11 +0200,
> > >     > > Harin Lee wrote:
> > >     > > >
> > >     > > > On 5/6/26 4:05 PM, Takashi Iwai wrote:
> > >     > > > > On Wed, 06 May 2026 08:24:36 +0200,
> > >     > > > > Thorsten Leemhuis wrote:
> > >     > > > >>
> > >     > > > >> Hi! Just FYI, I noticed a regression report in bugzilla=
:
> > >     > > > >>
> > >     > > > >> https://bugzilla=2Ekernel=2Eorg/show_bug=2Ecgi?id=3D221=
461
> > >     > > > >>
> > >     > > > >> To quote:
> > >     > > > >>
> > >     > > > >>> Dutch Ingraham 2026-05-03 18:12:49 UTC
> > >     > > > >>>
> > >     > > > >>> Kernels >=3D7=2E0=2E1 contain a regression as to Creat=
ive Sound
> > >     Blaster Z SE
> > >     > > > >>> discrete pci sound card, but not integrated=2E Kernels=
 7=2E0=2E1,
> > >     7=2E0=2E2, and
> > >     > > > >>> 7=2E0=2E3 tested; 7=2E0=2E0 not tested=2E Reverting to=
 any 6=2E18=2Ex or
> > >     6=2E12=2Ex does
> > >     > > > >>> not present the issue=2E
> > >     > > > >>>
> > >     > > > >>> Specifically, using pipewire managed by pavucontrol, o=
n both
> > >     Gentoo and
> > >     > > > >>> Arch Linux, when both external speakers and headphones=
 are
> > >     connected,
> > >     > > > >>> all sound is routed through the headphones regardless =
of
> > >     whether settings
> > >     > > > >>> are set to Line Out/Speaker or Line Out/Headphones; th=
ere is no
> > >     speaker
> > >     > > > >>> output=2E If headphones are disconnected, without rebo=
ot,
> > >     speakers work;
> > >     > > > >>> reconnect headphones, without reboot, sound reverts to
> > >     headphones=2E
> > >     > > > >>>
> > >     > > > >>> Kernel: 7=2E0=2E3, Gentoo compiled from source using o=
lddefconfig
> > >     on 6=2E18=2E24
> > >     > > > >>>               =2Econfig; Arch standard release
> > >     > > > >>> 'lspci -nnk | grep -i audio' attached
> > >     > > > >>> 'dmesg | grep -i audio' for 7=2E0=2E3 and 6=2E18=2E24 =
attached
> > >     > > > >>> pipewire-1=2E6=2E4 on both Gentoo and Arch Linux
> > >     > > > >>> alsa-firmware-1=2E2=2E4 on both Gentoo and Arch Linux
> > >     > > > >>> 'cat /proc/sys/kernel/tainted' returns 0 for both Gent=
oo and
> > >     Arch Linux
> > >     > > > >>>
> > >     > > > >>> Processor             :       AMD Ryzen7 5700G
> > >     > > > >>> Motherboard           :       Asus Prime X570-Pro
> > >     > > > >>> RAM                           :       Patriot Viper St=
eel DDR-4
> > >     @3200mHz
> > >     > > > >>> Graphics        :   ASRock AMD Radeon RX 7600 Challeng=
er 8GB OC
> > >     > > > >>> Sound Card      :   Creative Sound Blaster Z SE
> > >     > > > >>>
> > >     > > > >>>
> > >     > > > >>> Expected outcome: ability to choose output to either s=
peakers
> > >     or head-
> > >     > > > >>> phones while both are plugged-in to sound card=2E
> > >     > > > >>>
> > >     > > > >>> Workaround: none known=2E
> > >     > > > >>
> > >     > > > >> See the ticket for more details=2E One of them: 7=2E1-r=
c2 is
> > >     affected as
> > >     > > > >> well=2E Reporter is CCed=2E Forwarded this to ensure th=
is report
> > >     makes it to
> > >     > > > >> the interested parties, as bugzilla might not have forw=
arded
> > >     this=2E
> > >     > > > >>
> > >     > > > >> Dutch Ingraham: if nobody within a few days has an idea=
 why this
> > >     > > > >> happens, you will likely have to use a git bisection to=
 get this
> > >     resolved=2E
> > >     > > > >
> > >     > > > > As there have been many significant changes in ctxfi sin=
ce 6=2E18,
> > >     it's
> > >     > > > > hard to tell what broke=2E  Please go git bisect=2E
> > >     > > > >
> > >     > > > >
> > >     > > > > thanks,
> > >     > > > >
> > >     > > > > Takashi
> > >     > > > >
> > >     > > >
> > >     > > > Creative Sound Blaster Z-series uses the snd_hda_codec_ca0=
132
> > >     driver,
> > >     > > > not snd_ctxfi=2E The dmesg logs in the bugzilla shows only=
 ca0132
> > >     > > > entries=2E
> > >     > >
> > >     > > Ah, sorry, then it's easier=2E  The only major change is the
> > >     > > commit 778031e1658d206a52bf9491c91ae5d4f4a2509d
> > >     > >     ALSA: hda/ca0132: Set HP/Speaker auto-detect default fro=
m
> > >     headphone pin verb
> > >     > >
> > >     > > Try to revert this one=2E
> > >     > >
> > >     > >
> > >     > > thanks,
> > >     > >
> > >     > > Takashi
> > >     > >
> > >     >
> > >     > I can confirm this seems like a good candidate=2E I built and =
tested
> > >     6=2E19=2E14
> > >     > and 7=2E0=2E On 6=2E19=2E14, speakers work as expected; on 7=
=2E0, speakers are
> > >     not
> > >     > working as expected and the offending patch is included in the=
 7=2E0
> > >     patchset=2E
> > >     >
> > >     > Thank you all for your work on this issue=2E
> > >
> > >     OK, then let's put Matt to the party=2E
> > >     Matt, could you help for debugging the regression?
> > >
> > >     Takashi
> > >
> > > I can confirm the regression here on my 2013 Chromebook Pixel w/CA01=
32=2E
> > >
> > > Looking more closely, the issue is that tVNID_HP_ASEL and VNID_HP_SE=
L are
> > > mutually exclusive selection sources in ca0132_select_out() /
> > > ca0132_alt_select_out(),
> > > and auto-detect always "wins=2E" So, enabling auto-detect effectivel=
y disabled
> > > user
> > > override=2E
> > >
> > > While reverting would fix this problem, it would reintroduce the pro=
blem of
> > > jack-detect being
> > > ignored completely=2E A better solution would be to default to auto-=
detect, but
> > > allow manual selection
> > > to override=2E Here's a quick patch I whipped up that should resolve=
 the issue
> > > (untested though):
> > > ---
> > > From: Matt DeVillier <matt=2Edevillier@gmail=2Ecom>
> > > Date: Thu, 7 May 2026 09:58:41 -0500
> > > Subject: [PATCH] ALSA: hda/ca0132: Disable auto-detect on manual out=
put
> > > select
> > >
> > > Commit 778031e1658d ("ALSA: hda/ca0132: Set HP/Speaker
> > > auto-detect default from headphone pin verb") enables HP/Speaker
> > > auto-detect by default when the headphone pin supports presence dete=
ct=2E
> > >
> > > With auto-detect enabled, ca0132_select_out() and ca0132_alt_select_=
out()
> > > choose the output from jack presence instead of the manual HP/Speake=
r
> > > selection=2E This means selecting speaker output while headphones ar=
e
> > > plugged in updates the control state, but audio still routes to the
> > > headphones=2E
> > >
> > > Treat an explicit manual output selection as a request to leave
> > > auto-detect mode=2E Clear the HP/Speaker auto-detect switch before a=
pplying
> > > the manual selection, and notify userspace so the auto-detect contro=
l
> > > state is updated in mixers=2E Do this for both the normal HP/Speaker
> > > Playback Switch and the alternate Output Select control used by desk=
top
> > > cards=2E
> > >
> > > This keeps auto-detect enabled by default for devices with jack pres=
ence
> > > detection, while preserving the expected behavior that a manual outp=
ut
> > > choice takes effect immediately=2E
> > >
> > > Fixes: 778031e1658d ("ALSA: hda/ca0132: Set HP/Speaker auto-detect d=
efault
> > > from headphone pin verb")
> > > Signed-off-by: Matt DeVillier <matt=2Edevillier@gmail=2Ecom>
> > > ---
> > >  sound/hda/codecs/ca0132=2Ec | 44 +++++++++++++++++++++++++++++++---=
----------
> > >  1 file changed, 31 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/sound/hda/codecs/ca0132=2Ec b/sound/hda/codecs/ca0132=
=2Ec
> > > index ad533b04ab29=2E=2Ebe565ffaade0 100644
> > > --- a/sound/hda/codecs/ca0132=2Ec
> > > +++ b/sound/hda/codecs/ca0132=2Ec
> > > @@ -5498,6 +5498,30 @@ static int zxr_headphone_gain_set(struct hda_=
codec
> > > *codec, long val)
> > >   return 0;
> > >  }
> > (snip)
> >
> > It looks like that the patch is malformed by your mailer=2E
> > For avoiding unneeded troubles, please fix the setup or give an
> > attachment, too=2E
> >
> >
> > thanks,
> >
> > Takashi
>=20
> My apologies, forgot to ensure text-mode sending when I replied=2E
> Hopefully better this time=2E
>=20
> regards,
> Matt
>=20

Patched against originally non-working v7=2E0=2E Now, works as expected; c=
an
choose Line Out / Speaker or Line Out / Headphones and default holds
across reboots=2E

Thank you Matt and all others who gave your attention to this issue=2E
