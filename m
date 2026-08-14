Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23B661FCE
	for <regressions@lists.linux.dev>; Fri, 14 Aug 2026 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786713501; cv=pass; b=M00z81Qog1IBAAYRiJ936UltBElUJtyX93jH62Gj8wX+8QpzgZtjc8/HlhvmVdV71/cszEgwZo4/libXXN8SsATWtKDxEjJMkbe/hHMBte5KZUMUy1ZVqblAERe6jLc3/YTy6cIGOFZr6WUhPWg55+7voR2qdHIo+Vra1oNKmdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786713501; c=relaxed/simple;
	bh=Dsq9KMOLLue374v3eqlpr9uw2RIKLQkjVAeBHF7Dobw=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gw2RXyw/rx6SVpJpTzLHfC1y8uWmuwoU35alJv/oqJqyYerFamJHqr2Wmsi5DIoowe8O5kL9NhBSlpUJllt2x1XWzQWKDkGn8p+UdQm0jp8Luswip9PNqDnG/ythrFfcxKmLfKP00IbB2mt5VXqThZXKT9tmdC3OC7NfMsP9G8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=FyesSO48; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="FyesSO48"
ARC-Seal: i=1; a=rsa-sha256; t=1786713485; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bWE8zBIIyGs7qQtUPCmCkFd5ymSjYCnSF6qjAVd+DxI9cyBCSrwEXT2aXW5yvHbmbkQkuy7cAyiS2IOZ1GMaU68UC2xEJEft0cXnvZKDMG0a5tZW4PE0ZjC6H7gSa1ZdyaVnG6hExufCnZG0Id34HJvAN41YnQ/LNg4c3m2SZRA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786713485; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XX4+KdUjyI8wxXEp7ZL2LByIvoHp4C65jXxEE8NETdM=; 
	b=WqQTZ6SWYMV4KRXSwu1slQvP+mERBeDWkA9KlaSIyodkY/YtAbEBxkXU8uWQYk3Y7S1FEUC+QRVlRxuQHoZbE6+ju3U7YxTOU66nqu7XNg+gKE0/bDlUZ6MGAv5bZrr6ah0m6DMD0hXX5AB3FRAIy0xxYZQyahgXz1ROV9cwaJU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786713485;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=XX4+KdUjyI8wxXEp7ZL2LByIvoHp4C65jXxEE8NETdM=;
	b=FyesSO48ckFPWVYicPH8h8ushhYiVcNo3vfXCCaCTK00dx5yjN4bdxAaxKI57fWg
	cGDa0uRqVwo52y7Hmx3h1dT5DSDseX8CGK0qlrziLrk5wI5qDNn1xLFUbfyufvofS+K
	doc+dpwfpBMgfnap0cfxhVhm/8OPQtJ+KrtcW18LSqD/gHnWr4otG0YDy6RuGaGQ1u3
	d18uIHLZN+9DxhHGnCNVAXcMD0vbkF6TFTmYoRofsHEyLSZZdjFOXgyaL2FV/kfdfD5
	KIr3VDw/nO0yGuVWm7t0/1DeuSLw/jK4fvoOh1taF1ocnt2/veUUn/cv5exe++NNahc
	lWU9IXoOjQ==
Received: by mx.zohomail.com with SMTPS id 178671348289917.956569172568265;
	Fri, 14 Aug 2026 06:18:02 -0700 (PDT)
Message-ID: <c61e9568284fd0cd1580eb2b568700074c73e123.camel@rong.moe>
Subject: Re: [REGRESSION] ALSA: usb-audio: Logitech PRO X Wireless
 046d:0aba playback volume rejected as sticky
From: Rong Zhang <i@rong.moe>
To: "Alexander N." <adventureFAN@gmx.de>, linux-sound@vger.kernel.org
Cc: regressions@lists.linux.dev, tiwai@suse.de, perex@perex.cz
In-Reply-To: <6262cbbd-d1f2-4c9d-a1c7-9c5d12636f4b@gmx.de>
References: <6262cbbd-d1f2-4c9d-a1c7-9c5d12636f4b@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 21:17:23 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Alexander,

Thanks for the report.

On Fri, 2026-08-14 at 12:41 +0200, Alexander N. wrote:
> Hello,
>=20
> I found a regression in snd-usb-audio affecting the Logitech PRO X
> Wireless Gaming Headset (USB ID 046d:0aba).
>=20
> The device has a valid UAC1 playback volume control, but the sticky mixer
> detection introduced by commit 86aa1ea1f15c ("ALSA: usb-audio: Do not
> expose sticky mixers") rejects it.
>=20
> Hardware
> =3D=3D=3D=3D=3D=3D=3D=3D
>=20
>  =C2=A0 Logitech PRO X Wireless Gaming Headset
>  =C2=A0 USB ID: 046d:0aba
>=20
> Observed kernel
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>  =C2=A0 7.1.5-ogc5.1.fc44.x86_64
>  =C2=A0 Bazzite/Fedora 44 OGC kernel
>=20
> The OGC patch for this kernel does not modify sound/usb, and the relevant
> mixer.c code matches upstream Linux 7.1.5.
>=20
> I have not hardware-tested current mainline 7.2-rc7, but current upstream
> mixer.c still contains the same immediate SET_CUR -> GET_CUR sticky mixer
> test and I could not find a device quirk for 046d:0aba.
>=20
> Symptom
> =3D=3D=3D=3D=3D=3D=3D
>=20
> Without a workaround, ALSA only exposes:
>=20
>  =C2=A0 Simple mixer control 'PCM',0
>  =C2=A0 =C2=A0 Capabilities: pswitch pswitch-joined
>=20
> There is no PCM Playback Volume control.
>=20
> The kernel logs:
>=20
>  =C2=A0 usb 1-10: 2:0: sticky mixer values (-16384/0/256 =3D> -3840), dis=
abling
>=20
> I have also observed the same message ending in "=3D> 0", depending on th=
e
> hardware volume at probe time.
>=20
> Because the playback volume control is removed, the physical volume wheel
> changes the headset's hardware volume independently of the PipeWire/KDE
> system volume.
>=20
> USB Audio control behavior
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>=20
> The device is UAC1.
>=20
> Feature Unit 2 exposes a master playback volume control.
>=20
> Direct control requests, after temporarily unbinding AudioControl
> interface 0 from snd-usb-audio, report:
>=20
>  =C2=A0 GET_MIN =3D -16384=C2=A0 (-64.00 dB)
>  =C2=A0 GET_MAX =3D=C2=A0 =C2=A0 =C2=A0 0=C2=A0 (=C2=A0 0.00 dB)
>  =C2=A0 GET_RES =3D=C2=A0 =C2=A0 256=C2=A0 (=C2=A0 1.00 dB)
>=20
> GET_CUR and SET_CUR both work, but the device has two quirks relevant to
> the new sticky detection.
>=20
> 1. GET_CUR reflects normal SET_CUR changes with a delay of roughly 50 ms.

Interesting.

>=20
> Measured from 0 dB:
>=20
>  =C2=A0 target=C2=A0 =C2=A0 =C2=A0result=C2=A0 =C2=A0first visible GET_CU=
R change
>=20
>  =C2=A0 =C2=A0-1 dB=C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A081.3 =
ms
>  =C2=A0 =C2=A0-2 dB=C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A051.9 =
ms
>  =C2=A0 =C2=A0-4 dB=C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A047.3 =
ms
>  =C2=A0 =C2=A0-8 dB=C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A047.1 =
ms
>  =C2=A0 -16 dB=C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A051.7 ms
>  =C2=A0 -32 dB=C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A047.2 ms
>=20
> 2. The advertised minimum value -64 dB is not functional.
>=20
> A direct SET_CUR to -64 dB returns success, but GET_CUR remains at 0 dB
> even after 1000 ms.
>=20
> This appears to cause a false positive in check_sticky_volume_control():
>=20
> - cval->min is -16384 (-64 dB)
> - cval->max is 0
> - if the saved value is 0, max is skipped
> - SET_CUR(min) returns success
> - an immediate GET_CUR still returns the saved value
> - the mixer is classified as sticky and is not registered

Super interesting.

Maybe some previously reported devices were broken because of the same
reason.

I think, the sticky check could be more precise in this manner:

   res =3D (cval->max - cval->min) / 16; /* Check approximately 16 values. =
*/
   if (res < cval->res)
   	res =3D cval->res;
   else
   	res =3D roundup(res, cval->res);
  =20
   for (i =3D cval->min; i+=3D res; i < cval->max) {
   	if (i =3D=3D saved)
   		continue;
   	SET_CUR(i);
   	check =3D GET_CUR(i);
   	if (check !=3D saved)
   		break;	/* Fast path. */
   	/*
   	 * Wait for asynchronous mixers. This sleeps for no more than 160ms
   	 * in total, which should provide some time for the mixer to change
   	 * its value.
   	 * Note that there is no need to wait between SET_CUR and GET_CUR,
   	 * as we don't care whether the GET_CUR value matches the SET_CUR one.
   	 * What we expect is just a GET_CUR value differing from the saved one.
   	 * It this manner, most devices should go through the fast path without
   	 * extra sleep.
   	 */
   	msleep(10);
   }
   [...]

This should classify your device as non-sticky.

I will find some time to write a patch for that. I would be grateful if
you can test it then.

Thanks,
Rong

>=20
> mixer_get_cur_broken is not appropriate
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> I tested the mixer_get_cur_broken quirk.
>=20
> GET_CUR on this device is not broken or constant. It correctly reports
> host SET_CUR changes after the device delay, and it also reports volume
> changes caused by the physical headset wheel.
>=20
> Using an internal-only cached value would therefore lose useful hardware
> state.
>=20
> Local proof-of-concept fix
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>=20
> I built a local snd-usb-audio.ko against the running 7.1.5 kernel.
>=20
> For this specific device, Feature Unit 2, UAC_FU_VOLUME, I:
>=20
> - clamp the unusable minimum from -64 dB to -63 dB
> - skip the probe-time sticky/resolution checks for this control
>=20
> With that module, ALSA exposes:
>=20
>  =C2=A0 Simple mixer control 'PCM',0
>  =C2=A0 =C2=A0 Capabilities: pvolume pvolume-joined pswitch pswitch-joine=
d
>  =C2=A0 =C2=A0 Playback channels: Mono
>  =C2=A0 =C2=A0 Limits: Playback 0 - 63
>=20
> /proc/asound/card*/usbmixer shows:
>=20
>  =C2=A0 Unit: 2
>  =C2=A0 =C2=A0 Control: name=3D"PCM Playback Volume", index=3D0
>  =C2=A0 =C2=A0 Info: id=3D2, control=3D2, cmask=3D0x0, channels=3D1, type=
=3D"S16"
>  =C2=A0 =C2=A0 Volume: min=3D-16128, max=3D0, dBmin=3D-6300, dBmax=3D0
>=20
> Most importantly, no userspace workaround is required once the mixer
> control is restored.
>=20
> Example before rotating the physical headset wheel:
>=20
>  =C2=A0 ALSA:=C2=A0 =C2=A0 =C2=A0-27 dB / 57%
>  =C2=A0 PipeWire: 0.35
>=20
> After rotating the headset wheel:
>=20
>  =C2=A0 ALSA:=C2=A0 =C2=A0 =C2=A0-11 dB / 83%
>  =C2=A0 PipeWire: 0.65
>=20
> KDE system volume follows the physical wheel as expected.
>=20
> I attached the proof-of-concept diff and the measured results. I am happy
> to test a maintainer-preferred implementation or additional diagnostics.
>=20
> My suspicion is that this device exposes two assumptions in the sticky
> mixer probe that are not universally safe:
>=20
> 1. GET_CUR is assumed to reflect SET_CUR immediately.
> 2. advertised min/max values are assumed to be usable test values.
>=20
> Thanks.
>=20
> #regzbot introduced: 86aa1ea1f15ce6b56ac1b4c0d9b88a07a5b9bf03
