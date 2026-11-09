Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251840;
	b=JQsMQc5dcKzC/RSR30+ppWwp7hJq5OTq5+DpVn18eJHSRQGLb+woCtmM3RWAeiuOSUe9
	 l1rlGVnPQnJdBUsP0CCcvdfIT8NamKgwa5cC/Ew4rC4wxsxTsXSji0wncTlb8aeRXolvM
	 6xVdDVgTkwLvru7NdfU107LTBZscWIhMSvKFLzDphnxTBaadEes/3KUbJVshqZMslbRRx
	 8we1qHKPON5rYv67Ar421IyzH9SWNRWwce3rFAG8Dc8VjCxO1VUsd91hrGcoIfYz08g3i
	 0VlxHXYC6742m40bNycPiTfkAYh/2t1IFkDmgv7IT0lMCdFw4GuFYqh1XhPq33fijEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251840;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=y+BdlheRsyR4jfO0p47tfdZo32wxj5cS+L/8cTEsyT4=;
	b=Y7xVkbpXXw70lVIag4NA1NjOxfo12eUpGOFerugliefW6tVmFpRoHHfUntfnehaWdUZc
	 N31Ul9fCRXlAtFEmC2+Wb+ogGjFmVn6HxTFKh9X+9KE+MDHwa8PQ/GiVmK2s9ZahYb5Yw
	 gGt+FRh7IkNxiLWuHJ44tRHJ58jPfp+XEa0fnR9xGM2wUPJxyHAVN4sxkAq7qxZIrS6e0
	 mAw6Tur1pZbGzNnoxXRTy90ZG9bm8WXHEMd/Oa28PCPvolt+xRz2LtQudT9KSmzVEVeaZ
	 TY1o90gzWAPV5dAISap8gHjE1C6OqlQAXavcJPp5x+hvTbn0BdBtkJ0OfojTo6i1EhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=R6g+V218;
	arc=none smtp.remote-ip=185.70.43.19
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49624606A321
	for <regressions@lists.linux.dev>; Mon,  9 Nov 2026 19:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49624606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=R6g+V218
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794251836; x=1794511036;
	bh=y+BdlheRsyR4jfO0p47tfdZo32wxj5cS+L/8cTEsyT4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=R6g+V218ArGGVMVEvPWz901WI6v8hz/TYo/qyRE5/M/+6nLX4WsOi1IvZgVFA0OnS
	 S4E1vrY+N6Oi/ga08FFG/QNNO5bIGWDMQIB2ZDVIerFnhz5dUksz/tUx41JiFcGlDa
	 L3Hvzc6QA0GkkQTHTUPMn4VcXOGL5LolDK2X/jXbR0zxsijTiWG6d2v/3jXWQ+6rxW
	 DePrIIxsUxIB3WQaijihWyHDLggy9YZpAxGUeR7inc9L6pQ7uKt6X+82r3732ycB2z
	 PgmMEoJmr+ySaG0LTf9c4SxUuR2va7h7EZg9Kj0rCSpv25Pga1YHbGdPBwwnvAMsCg
	 iIsT6fOVJ327Q==
Date: Mon, 09 Nov 2026 19:17:10 +0000
To: Thorsten Leemhuis <regressions@leemhuis.info>
From: Rujbin <rujbin@proton.me>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Alain Cousinie <alain.cousinie@laposte.net>, Linux Sound System <linux-sound@vger.kernel.org>, regressions@lists.linux.dev
Subject: Re: [REGRESSION] Linux 7.4-rc2: Intel Meteor Lake SOF/HDA audio fails with ASoC route errors (-19)
Message-ID: <A2lXWpWj7wjBwPNTvCOh2-bCqRbX0Pb7od1dICr4c6SegAilwp8dERHk6riu7tj1b3XUMgcLnDDSP_8AoZAyj9VHm3NUkBB1NW2YPQfZLYY=@proton.me>
In-Reply-To: <1c28b5e3-7ddb-4e3d-a61b-a96aedd6eb50@leemhuis.info>
References: <mAZY9HZuXAXUf7zv8tqXquMtquf7iW2CIZB7WhU-SnwWp-Rpr0e8yixTsb3lAeQsO64PwwWlOao8aMjQ4hTKOQ6grCiNmaWZmFRXMdPICD8=@proton.me> <318f1745-acd7-430f-818b-c961987fe108@laposte.net> <1c28b5e3-7ddb-4e3d-a61b-a96aedd6eb50@leemhuis.info>
Feedback-ID: 45446246:user:proton
X-Pm-Message-ID: 62af71f2486319e4160033d4ceeddb9459aac624
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Thorsten, Alain, and everyone,

I investigated the regression further with the help of Codex.

Source analysis points strongly to commit 4dd10fbbeb9c ("treewide: Convert =
devm_kmalloc() family to the devm_kmalloc_obj() family").

In soc_new_pcm_runtime(), devm_kzalloc_flex() appears to initialize rtd->nu=
m_components to the allocated array capacity, while ASoC expects this field=
 to count the number of populated components.

Consequently, snd_soc_rtd_add_component() may write beyond the allocated ar=
ray, while component iteration encounters an empty first entry. This would =
explain the missing SOF/HDA component probes and subsequent ASoC route fail=
ures.

A proposed minimal fix is to reset rtd->num_components to zero immediately =
after allocation in sound/soc/soc-core.c.

The modified source compiled successfully against the installed 7.4-rc2 bui=
ld headers.

**This is not yet hardware-confirmed.** I have not booted a patched kernel.

Would this explanation match what the ASoC maintainers expect?




Sent with Proton Mail secure email.

On Monday, November 9th, 2026 at 19:49, Thorsten Leemhuis <regressions@leem=
huis.info> wrote:

> Lo! Sending this just to add the skl_hda_dsp_generic maintainers to this
> discussion below -- maybe they have an idea what's wrong here. Alain,
> Rujbin: if not, one of you will most likely have to run a git bisection
> to identify the culprit. Ciao, Thorsten
>=20
> On 11/9/26 19:22, Alain Cousinie wrote:
> > On 11/9/26 17:57, Rujbin wrote:
> >>
> >> I'm reporting an audio regression between Linux 7.4-rc1 and 7.4-rc2 on=
 a Lenovo laptop running Fedora 44.
> >>
> >> Last known good kernel:
> >> 7.4.0-rc1.vanilla.fc44.20261103210439475307
> >>
> >> First known bad kernel:
> >> 7.4.0-rc2.vanilla.fc44.20261109132241085802
> >>
> >> Hardware:
> >>
> >> -   Intel Meteor Lake-P HD Audio Controller (8086:7e28)
> >>
> >> -   Lenovo subsystem (17aa:50e6)
> >>
> >> -   SOF driver: sof-audio-pci-intel-mtl
> >>
> >> -   Conexant SN6140 codec
> >>
> >>
> >> Regression:
> >>
> >> With 7.4-rc1, audio works normally and ALSA registers the `sof-hda-dsp=
` sound card.
> >>
> >> With 7.4-rc2, ALSA reports no sound cards and PipeWire exposes only a =
dummy output.
> >>
> >> The SOF firmware boots successfully in both versions (2.14.1.1), but 7=
.4-rc2 fails during ASoC route initialization.
> >>
> >> Relevant kernel errors:
> >>
> >>     skl_hda_dsp_generic: ASoC: Failed to add route Analog In -> Codec =
Input Pin1(*)
> >>     skl_hda_dsp_generic: ASoC: Failed to add route Analog CPU Playback=
(*) -> Analog Codec Playback(*)
> >>     Analog Playback and Capture: fail to add hda routes, ret -19
> >>     Analog Playback and Capture: ASoC error (-19): at snd_soc_link_ini=
t()
> >>
> >> On 7.4-rc1, the kernel successfully loads `sof-hda-generic-2ch.tplg`, =
initializes the Conexant SN6140 codec, and registers the audio devices.
> >>
> >> On 7.4-rc2, this initialization does not complete.
> >>
> >> Steps to reproduce:
> >>
> >> 1.  Boot Linux 7.4-rc2 on the affected machine.
> >>
> >> 2.  Run `aplay -l`.
> >>
> >> 3.  Observe that no sound cards are available.
> >>
> >> 4.  Reboot into 7.4-rc1 and confirm audio works.
> >>
> >>
> >> This appears to be a regression in the SOF/HDA or ASoC initialization =
path. The responsible commit has not yet been identified.
> >>
> >> Full kernel logs from both the working 7.4-rc1 and broken 7.4-rc2 boot=
 sessions are attached.
> >>
> >> Thanks!
> >
> >
> > I can confirm the same regression in 7.4-rc2 on:
> > HP Spectre x360 2-in-1 Laptop 14-eu0xxx/8C15, BIOS F.17 04/20/2026 (i7 =
155h)
> >
> > [    6.737799] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to=
 add route Analog In -> Codec Input Pin1(*)
> > [    6.737802] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to=
 add route Digital In -> Codec Input Pin2(*)
> > [    6.737803] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to=
 add route Alt Analog In -> Codec Input Pin3(*)
> > [    6.737804] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to=
 add route Codec Output Pin1(*) -> Analog Out
> > [    6.737805] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to=
 add route Codec Output Pin2(*) -> Digital Out
> > [    6.737806] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to=
 add route Codec Output Pin3(*) -> Alt Analog Out
> > [    6.737806] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to=
 add route Analog CPU Capture(*) -> codec0_in(*)
> > [    6.737807] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to=
 add route Analog Codec Capture(*) -> Analog CPU Capture(*)
> > [    6.737808] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to=
 add route Digital CPU Capture(*) -> codec1_in(*)
> > [    6.737809] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to=
 add route Digital Codec Capture(*) -> Digital CPU Capture(*)
> > [    6.737809] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to=
 add route Alt Analog CPU Capture(*) -> codec2_in(*)
> > [    6.737810] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to=
 add route Alt Analog Codec Capture(*) -> Alt Analog CPU Capture(*)
> > [    6.737811] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to=
 add route Analog CPU Playback(*) -> Analog Codec Playback(*)
> > [    6.737811] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to=
 add route codec0_out(*) -> Analog CPU Playback(*)
> > [    6.737812] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to=
 add route Digital CPU Playback(*) -> Digital Codec Playback(*)
> > [    6.737813] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to=
 add route codec1_out(*) -> Digital CPU Playback(*)
> > [    6.737813] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to=
 add route Alt Analog CPU Playback(*) -> Alt Analog Codec Playback(*)
> > [    6.737814] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to=
 add route codec2_out(*) -> Alt Analog CPU Playback(*)
> > [    6.737815]  Analog Playback and Capture: fail to add hda routes, re=
t -19
> > [    6.737815]  Analog Playback and Capture: ASoC error (-19): at snd_s=
oc_link_init() on Analog Playback and Capture
>=20
>=20
>=20
> 
