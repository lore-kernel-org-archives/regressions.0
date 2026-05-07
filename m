Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5CB3B4EA2
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 15:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778166340; cv=pass; b=rrqIPg6At5oO1fEdKXW5rRUa7jyHSuCADLaKPKX2yUmTHMdzIIzSCfGjbPMFBeJVImmVqCvGJr5fqx1bQKCj8J9fIxSqmewkjp7jJhiZoeZXCRE0ajfq6Lqei23OqAjeEWqnd4ALuUFeYZgPCpyAXuxp12CSso7Tbr4drGaQN7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778166340; c=relaxed/simple;
	bh=K0NiWPNqm2cSvY4eAZTTZRlIjAifEq7Bne9AkD9/RwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=to8R+F7VLBXV4aK+e0fqD9O5iv8U9Pd4drBJS0JXIhIkSAQ2dBjj8SP9lMdo3KTU3l76uJlKcNzvHxOSWJpQuSD6KrQmTinsRn2N1fzZ7iWgrWzpmFFB/qemzhEDIhD2GBPGZGZ9v3qKLdGWbvWhFE/RH3sb33peYpc2scLncBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSznxQj4; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSznxQj4"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ba6485d219so6778475ad.3
        for <regressions@lists.linux.dev>; Thu, 07 May 2026 08:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778166338; cv=none;
        d=google.com; s=arc-20240605;
        b=V0pLtQdW3RKAFMLYjkx0nFQcon2smbgmd7FDAUc35QHSEz2iMu1jshGxBSUcpis/bu
         vhwxdvaTzVMMpBl44L5p7KgH8E3/0C64r1/gDDscTcbDwy+/4XR0awsk/oHrh+pnEdhN
         HdsGsiBYWRWje7z1JRiX7Slh2wS/WUnGxfyq1pERsmF3SRHFL8lBY6ereKW0dzVUaH5B
         EpgQNK42BcC2UNYSxsEfpCXMUzAeJSBO6EP+3nvYljkfHLdDxcu95hwu+oSGPEeUs/cQ
         XMlnzmIHqn3xeyota5iBaClSQsbB9qpDe53DStOP203liRMZSKawGHwDwr7yXq1WCJ63
         d0MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WlXk1xvZJKso2Hfg4lKi3OPDMAcCJczZRsXxWL2O5yU=;
        fh=hxBMaMFM58hsv2/bGxcK7RFxP/UdlWHmpbwdL/IN8Ww=;
        b=LIZ66yoHhuj0tG8EciLX2m93SQcbpqIyChol4z09/W9W0EhYptcYZvCNXDvHbGKvHa
         pHdjD8RwiKlNtzl22N4Rjze51j6B7ajIqgMEKGmFzPReQ3i8O1h2g9odPMuAVwBU7Bae
         Yi/5hHHnKv5dJ2Nezx25pgBJ49hjdzh4P+7INL+mxV/KKcFlAqUqKO7iZYBQ4RgziHJv
         f5PKQlrR0KZ7T9NwtN06Snv682sQUjQ6AjbWn6P1BiozTjgiZ+c02zw2rqvo6CnDjiMp
         p7hdXbTUnXPnOw0UYlydeSXQgdWV4dD1A+L821twlxKYB4y5qSz+WfuGW83Jyt4KYerc
         A1UQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778166338; x=1778771138; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlXk1xvZJKso2Hfg4lKi3OPDMAcCJczZRsXxWL2O5yU=;
        b=LSznxQj4+RXVUEiVItauVBtzF7FFZ5PCPttXKQkL2OLAtQgqaA3IxTBsuc7ewJMzxW
         HUFbAIY4XLvLRX9pHRCpd3fNkc7gd0Z2RpRkUnMQP7FzIBBdRD9JYqQNZ8e1XVRAgFpx
         /qV7u4ZPtNFb10k8p1G8jIf2VzsZFEYdFpuCB0Nhsg3OX3aXtcjdBVCnyrkuk/XdGFl5
         Id+A/EiCDfvl8b147El86pr1ui3CLA8qOsj8Td0g/1xoL22AScsmKAsSre9aeR2r37mg
         ENH6amc7nuh8Pc6iM8Z52SFWC9FC5ffPbzMjwgk/v5I5eBBBQBSJFmdoywHYxD1FTZzo
         HeIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778166338; x=1778771138;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WlXk1xvZJKso2Hfg4lKi3OPDMAcCJczZRsXxWL2O5yU=;
        b=i9K4A9pYC0+zUYKESri70A9aGBT2k+ZFNzDEzijuTN3KOzi/1zOWlI5uzshwBCWtFC
         mk8/rLPtYRVH+0qKufTZQtVwt0+9rJL+7ddMyj/zxTQbPtJRCO78LHqSqNmVqChIiAyo
         3FvAlB0O6M75D6Dgom4fGUXIM3rpTtaewyHvLBeSKc3YjEZWdY5C4KRhgq1yhq/YelIy
         Elrq94T+zuQchPKcKXVF7i0U7fEU+uO6yKcpjoYxPUIintHT1hHn3gZkkcC3Vrohzonx
         yOiV//puRI+cwbRuckVacORAl+385kolbOwhJ8smOFIgh6oUGozt0eQA+pKmODj2nJJc
         zvaQ==
X-Gm-Message-State: AOJu0YxBmqLWxGzU5QCanMcCZH5F9n33+sRbO+eYHwtaJvKUQIChlxrP
	e7hGryXBHuL02GELgqhumRecuCRSk25r9ILaf5lA5OPM6mbVSGwcqHj5CxqVWhzYnHKMaTrQZSA
	EJtXlmR+LG7SOtjM49fc9FPYIGIoYsP+Efg==
X-Gm-Gg: AeBDietlf6CX7YIHABywUWNwnmQpUojVzpUtj+epBu4Vcw4efEZ2FaeUm7trLPrTJp7
	/yEPxiQA47WDGBgGeZ2XhDmMJ9SGKEUdfuCrq6ncPJKc0j2FzqU7l47mm7XElvcw0krBZqGRd0t
	VOwgk0CvfnujDJqkq2Q+tY1GaXltIF4wQ47jj95uhWHOu5MwoZmg1YJgU1v4XeAUetEn7Ll3GOf
	7bp5kOi/QKqAJ6j2zlRC8fMIHD855/y48sTXV99B/i9sXfZHRZaaiAowvAeyHm88KRxmmFMsZce
	YfQiPx2hvsFNBKZr
X-Received: by 2002:a17:902:cf4c:b0:2b7:88d8:efde with SMTP id
 d9443c01a7336-2ba78f4e986mr79586585ad.7.1778166338000; Thu, 07 May 2026
 08:05:38 -0700 (PDT)
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
In-Reply-To: <CAFTm+6Bj_dWdSifUoS7hZ3kfVambXK_=7jyGuHp33RZoSEGVUA@mail.gmail.com>
From: Matt DeVillier <matt.devillier@gmail.com>
Date: Thu, 7 May 2026 10:05:26 -0500
X-Gm-Features: AVHnY4JbhzIrb0QVTsRshnWS7g2Ew_o6XmQR3rxwnKn3GWlBk5pyqjlM4NV7qiE
Message-ID: <CAFTm+6Dtsc8z7s4Gj+6A9zGpXyj93tQEbkzQLu13S36SmhB8Zw@mail.gmail.com>
Subject: Re: [regression] ctxfi: no speaker output when headphones connected
 on >=7.0.x
To: regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 8:24=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 07 May 2026 14:47:03 +0200,
> Dutch Ingraham wrote:
> >
> > > Sent: Thursday, May 07, 2026 at 1:30 AM
> > > From: "Takashi Iwai" <tiwai@suse.de>
> > > To: "Harin Lee" <me@harin.net>
> > > Cc: "Takashi Iwai" <tiwai@suse.de>, "Thorsten Leemhuis" <regressions@=
leemhuis.info>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@s=
use.com>, "Linux kernel regressions list" <regressions@lists.linux.dev>, "L=
inux Sound System" <linux-sound@vger.kernel.org>, "LKML" <linux-kernel@vger=
.kernel.org>, stoa@gmx.us
> > > Subject: Re: [regression] ctxfi: no speaker output when headphones co=
nnected on >=3D7.0.x
> > >
> > > On Thu, 07 May 2026 00:06:11 +0200,
> > > Harin Lee wrote:
> > > >
> > > > On 5/6/26 4:05 PM, Takashi Iwai wrote:
> > > > > On Wed, 06 May 2026 08:24:36 +0200,
> > > > > Thorsten Leemhuis wrote:
> > > > >>
> > > > >> Hi! Just FYI, I noticed a regression report in bugzilla:
> > > > >>
> > > > >> https://bugzilla.kernel.org/show_bug.cgi?id=3D221461
> > > > >>
> > > > >> To quote:
> > > > >>
> > > > >>> Dutch Ingraham 2026-05-03 18:12:49 UTC
> > > > >>>
> > > > >>> Kernels >=3D7.0.1 contain a regression as to Creative Sound Bla=
ster Z SE
> > > > >>> discrete pci sound card, but not integrated. Kernels 7.0.1, 7.0=
.2, and
> > > > >>> 7.0.3 tested; 7.0.0 not tested. Reverting to any 6.18.x or 6.12=
.x does
> > > > >>> not present the issue.
> > > > >>>
> > > > >>> Specifically, using pipewire managed by pavucontrol, on both Ge=
ntoo and
> > > > >>> Arch Linux, when both external speakers and headphones are conn=
ected,
> > > > >>> all sound is routed through the headphones regardless of whethe=
r settings
> > > > >>> are set to Line Out/Speaker or Line Out/Headphones; there is no=
 speaker
> > > > >>> output. If headphones are disconnected, without reboot, speaker=
s work;
> > > > >>> reconnect headphones, without reboot, sound reverts to headphon=
es.
> > > > >>>
> > > > >>> Kernel: 7.0.3, Gentoo compiled from source using olddefconfig o=
n 6.18.24
> > > > >>>               .config; Arch standard release
> > > > >>> 'lspci -nnk | grep -i audio' attached
> > > > >>> 'dmesg | grep -i audio' for 7.0.3 and 6.18.24 attached
> > > > >>> pipewire-1.6.4 on both Gentoo and Arch Linux
> > > > >>> alsa-firmware-1.2.4 on both Gentoo and Arch Linux
> > > > >>> 'cat /proc/sys/kernel/tainted' returns 0 for both Gentoo and Ar=
ch Linux
> > > > >>>
> > > > >>> Processor             :       AMD Ryzen7 5700G
> > > > >>> Motherboard           :       Asus Prime X570-Pro
> > > > >>> RAM                           :       Patriot Viper Steel DDR-4=
 @3200mHz
> > > > >>> Graphics        :   ASRock AMD Radeon RX 7600 Challenger 8GB OC
> > > > >>> Sound Card      :   Creative Sound Blaster Z SE
> > > > >>>
> > > > >>>
> > > > >>> Expected outcome: ability to choose output to either speakers o=
r head-
> > > > >>> phones while both are plugged-in to sound card.
> > > > >>>
> > > > >>> Workaround: none known.
> > > > >>
> > > > >> See the ticket for more details. One of them: 7.1-rc2 is affecte=
d as
> > > > >> well. Reporter is CCed. Forwarded this to ensure this report mak=
es it to
> > > > >> the interested parties, as bugzilla might not have forwarded thi=
s.
> > > > >>
> > > > >> Dutch Ingraham: if nobody within a few days has an idea why this
> > > > >> happens, you will likely have to use a git bisection to get this=
 resolved.
> > > > >
> > > > > As there have been many significant changes in ctxfi since 6.18, =
it's
> > > > > hard to tell what broke.  Please go git bisect.
> > > > >
> > > > >
> > > > > thanks,
> > > > >
> > > > > Takashi
> > > > >
> > > >
> > > > Creative Sound Blaster Z-series uses the snd_hda_codec_ca0132 drive=
r,
> > > > not snd_ctxfi. The dmesg logs in the bugzilla shows only ca0132
> > > > entries.
> > >
> > > Ah, sorry, then it's easier.  The only major change is the
> > > commit 778031e1658d206a52bf9491c91ae5d4f4a2509d
> > >     ALSA: hda/ca0132: Set HP/Speaker auto-detect default from headpho=
ne pin verb
> > >
> > > Try to revert this one.
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > >
> >
> > I can confirm this seems like a good candidate. I built and tested 6.19=
.14
> > and 7.0. On 6.19.14, speakers work as expected; on 7.0, speakers are no=
t
> > working as expected and the offending patch is included in the 7.0 patc=
hset.
> >
> > Thank you all for your work on this issue.
>
> OK, then let's put Matt to the party.
> Matt, could you help for debugging the regression?
>
>
> Takashi


I can confirm the regression here on my 2013 Chromebook Pixel w/CA0132.

Looking more closely, the issue is that tVNID_HP_ASEL and VNID_HP_SEL are
mutually exclusive selection sources in ca0132_select_out() /
ca0132_alt_select_out(),
and auto-detect always "wins." So, enabling auto-detect effectively
disabled user
override.

While reverting would fix this problem, it would reintroduce the
problem of jack-detect being
ignored completely. A better solution would be to default to
auto-detect, but allow manual selection
to override. Here's a quick patch I whipped up that should resolve the
issue (untested though):
---
From: Matt DeVillier <matt.devillier@gmail.com>
Date: Thu, 7 May 2026 09:58:41 -0500
Subject: [PATCH] ALSA: hda/ca0132: Disable auto-detect on manual output sel=
ect

Commit 778031e1658d ("ALSA: hda/ca0132: Set HP/Speaker
auto-detect default from headphone pin verb") enables HP/Speaker
auto-detect by default when the headphone pin supports presence detect.

With auto-detect enabled, ca0132_select_out() and ca0132_alt_select_out()
choose the output from jack presence instead of the manual HP/Speaker
selection. This means selecting speaker output while headphones are
plugged in updates the control state, but audio still routes to the
headphones.

Treat an explicit manual output selection as a request to leave
auto-detect mode. Clear the HP/Speaker auto-detect switch before applying
the manual selection, and notify userspace so the auto-detect control
state is updated in mixers. Do this for both the normal HP/Speaker
Playback Switch and the alternate Output Select control used by desktop
cards.

This keeps auto-detect enabled by default for devices with jack presence
detection, while preserving the expected behavior that a manual output
choice takes effect immediately.

Fixes: 778031e1658d ("ALSA: hda/ca0132: Set HP/Speaker auto-detect
default from headphone pin verb")
Signed-off-by: Matt DeVillier <matt.devillier@gmail.com>
---
 sound/hda/codecs/ca0132.c | 44 +++++++++++++++++++++++++++++++------------=
-
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index ad533b04ab29..be565ffaade0 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -5498,6 +5498,30 @@ static int zxr_headphone_gain_set(struct
hda_codec *codec, long val)
  return 0;
 }

+/*
+ * Manual output selection (HP/Speaker Playback Switch or alt Output Selec=
t)
+ * is meaningful only when HP/Speaker auto-detect is disabled, since the
+ * select_out path always prefers jack presence when auto-detect is on. Wh=
en
+ * the user explicitly chooses an output, turn auto-detect off so the manu=
al
+ * choice actually takes effect, and notify userspace so the auto-detect
+ * control reflects the new state.
+ */
+static void ca0132_disable_hp_auto_detect(struct hda_codec *codec)
+{
+ struct ca0132_spec *spec =3D codec->spec;
+ struct snd_kcontrol *kctl;
+
+ if (!spec->vnode_lswitch[VNID_HP_ASEL - VNODE_START_NID])
+ return;
+
+ spec->vnode_lswitch[VNID_HP_ASEL - VNODE_START_NID] =3D 0;
+ kctl =3D snd_hda_find_mixer_ctl(codec,
+      "HP/Speaker Auto Detect Playback Switch");
+ if (kctl)
+ snd_ctl_notify(codec->card, SNDRV_CTL_EVENT_MASK_VALUE,
+       &kctl->id);
+}
+
 static int ca0132_vnode_switch_set(struct snd_kcontrol *kcontrol,
  struct snd_ctl_elem_value *ucontrol)
 {
@@ -5510,14 +5534,11 @@ static int ca0132_vnode_switch_set(struct
snd_kcontrol *kcontrol,
  int auto_jack;

  if (nid =3D=3D VNID_HP_SEL) {
- auto_jack =3D
- spec->vnode_lswitch[VNID_HP_ASEL - VNODE_START_NID];
- if (!auto_jack) {
- if (ca0132_use_alt_functions(spec))
- ca0132_alt_select_out(codec);
- else
- ca0132_select_out(codec);
- }
+ ca0132_disable_hp_auto_detect(codec);
+ if (ca0132_use_alt_functions(spec))
+ ca0132_alt_select_out(codec);
+ else
+ ca0132_select_out(codec);
  return 1;
  }

@@ -5978,7 +5999,6 @@ static int ca0132_alt_output_select_put(struct
snd_kcontrol *kcontrol,
  struct ca0132_spec *spec =3D codec->spec;
  int sel =3D ucontrol->value.enumerated.item[0];
  unsigned int items =3D NUM_OF_OUTPUTS;
- unsigned int auto_jack;

  if (sel >=3D items)
  return 0;
@@ -5988,10 +6008,8 @@ static int ca0132_alt_output_select_put(struct
snd_kcontrol *kcontrol,

  spec->out_enum_val =3D sel;

- auto_jack =3D spec->vnode_lswitch[VNID_HP_ASEL - VNODE_START_NID];
-
- if (!auto_jack)
- ca0132_alt_select_out(codec);
+ ca0132_disable_hp_auto_detect(codec);
+ ca0132_alt_select_out(codec);

  return 1;
 }
--=20
2.51.0
