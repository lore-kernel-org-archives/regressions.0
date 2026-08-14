Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBAB2E173D
	for <regressions@lists.linux.dev>; Fri, 14 Aug 2026 14:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786716174; cv=none; b=NgZP/FN+dsiJ7PSTpHndUDneKMIIOKXWvd5P9eZotSUFwt4LWFuL1d2P1YEZIJRqDNXVMEAyA67KeDU3VkhXNey/OUBlRMXSvSaUSYTxPna/v+VLbveaLskcTHYNSDDG/D87o4h0V/5avl5SGCcEgoFbsRmbmN0sTt0fCDqn/us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786716174; c=relaxed/simple;
	bh=NefdXeeEwPT0k2zKIx1FG4lo5FFoduul7ECA+SzIXJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFepncxySzzNpltssqdHLN8FZZCXHh0r5dzc18eVHAvmf+Q5qFMbp6zHf3EzxepBaHaNomBXNtcg2JycvtJXe/SEFKL2noogYGtQxMdtg5np/l+Ou1uNOIob90+YLDmeiijXhYsZCj90Hsxz6WzcPMAVJczUR/1QJm0YDNjdm0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=adventurefan@gmx.de header.b=YAXX4c+O; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=adventurefan@gmx.de header.b="YAXX4c+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1786716166; x=1787320966; i=adventurefan@gmx.de;
	bh=FovSuPr7/ltIAoZoHHDkHv3epkWiEkqPoVy0CnVLmfg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YAXX4c+OSCV6EryYZj8/Os4MPHTFi4Q0Kp0kc2FmdzPaD/n5to0GB6joKUgiMUQX
	 TW71/24NlPOSVrgbaZDwa4FJWZ8GvZf9E8uvRwO+Tl1JwgeQSffuG9YfyG2TbAA6O
	 g0Xe1y8NN19B/FxsLJUYtrpp7LYcgc12lLNKQCezGFNtfTr99J/KJpnKA3Kol9Pb0
	 e/1ZJxJdQFfwGHYYUK9CFn70LecXPAS59UaHljvHzls+dNIdbk3TG+qvTJY1U2dzJ
	 SVVIxXT+cUrMRMKodRqoRexS9Vx5/Y1dOtiVeSIZJA75U51H9u2cyd2Jnq9qCzH1q
	 /PP7D2MFjtN4IPjdnw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mwfai-1x5YvU1m4g-00rKAt; Fri, 14
 Aug 2026 16:02:46 +0200
Message-ID: <defedf81-5f14-4a50-9237-cb180eaab39e@gmx.de>
Date: Fri, 14 Aug 2026 16:02:45 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ALSA: usb-audio: Logitech PRO X Wireless 046d:0aba
 playback volume rejected as sticky
To: linux-sound@vger.kernel.org
Cc: regressions@lists.linux.dev, tiwai@suse.de, perex@perex.cz
References: <6262cbbd-d1f2-4c9d-a1c7-9c5d12636f4b@gmx.de>
 <c61e9568284fd0cd1580eb2b568700074c73e123.camel@rong.moe>
Content-Language: en-US
From: Alexander Niemeyer <adventureFAN@gmx.de>
In-Reply-To: <c61e9568284fd0cd1580eb2b568700074c73e123.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OU8dfU5SvgY69XD8+XQ+hMCZHS6XBkK81hdS7+ybGlChNzNlT8z
 uHg7h71Ru/LGB13M/84xwD2wQfJAXZ1umbxSlEEXf9+/yJ6TTLB1KUAX8e2Dqq+Hk7JsbKn
 lFoVJxsTsoyzVowIBjKGyrgg/AOV179LewC6qWpmpWsKxgtrqPTIVVvvdCmU2yGwwEnBCwG
 fhShXHmIyIjRVLzBxxL7Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:M5qjpX2mawA=;P80J7vEF+FXGhC1CWVk3mlwvoiF
 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
 LRHmjko6lE=

Thanks Rong.
I'd be happy to test your patch on the Logitech PRO X Wireless as soon=20
as it's ready.

Am 14.08.26 um 15:17 schrieb Rong Zhang:
> Hi Alexander,
>
> Thanks for the report.
>
> On Fri, 2026-08-14 at 12:41 +0200, Alexander N. wrote:
>> Hello,
>>
>> I found a regression in snd-usb-audio affecting the Logitech PRO X
>> Wireless Gaming Headset (USB ID 046d:0aba).
>>
>> The device has a valid UAC1 playback volume control, but the sticky mix=
er
>> detection introduced by commit 86aa1ea1f15c ("ALSA: usb-audio: Do not
>> expose sticky mixers") rejects it.
>>
>> Hardware
>> =3D=3D=3D=3D=3D=3D=3D=3D
>>
>>   =C2=A0 Logitech PRO X Wireless Gaming Headset
>>   =C2=A0 USB ID: 046d:0aba
>>
>> Observed kernel
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>>   =C2=A0 7.1.5-ogc5.1.fc44.x86_64
>>   =C2=A0 Bazzite/Fedora 44 OGC kernel
>>
>> The OGC patch for this kernel does not modify sound/usb, and the releva=
nt
>> mixer.c code matches upstream Linux 7.1.5.
>>
>> I have not hardware-tested current mainline 7.2-rc7, but current upstre=
am
>> mixer.c still contains the same immediate SET_CUR -> GET_CUR sticky mix=
er
>> test and I could not find a device quirk for 046d:0aba.
>>
>> Symptom
>> =3D=3D=3D=3D=3D=3D=3D
>>
>> Without a workaround, ALSA only exposes:
>>
>>   =C2=A0 Simple mixer control 'PCM',0
>>   =C2=A0 =C2=A0 Capabilities: pswitch pswitch-joined
>>
>> There is no PCM Playback Volume control.
>>
>> The kernel logs:
>>
>>   =C2=A0 usb 1-10: 2:0: sticky mixer values (-16384/0/256 =3D> -3840), =
disabling
>>
>> I have also observed the same message ending in "=3D> 0", depending on =
the
>> hardware volume at probe time.
>>
>> Because the playback volume control is removed, the physical volume whe=
el
>> changes the headset's hardware volume independently of the PipeWire/KDE
>> system volume.
>>
>> USB Audio control behavior
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>>
>> The device is UAC1.
>>
>> Feature Unit 2 exposes a master playback volume control.
>>
>> Direct control requests, after temporarily unbinding AudioControl
>> interface 0 from snd-usb-audio, report:
>>
>>   =C2=A0 GET_MIN =3D -16384=C2=A0 (-64.00 dB)
>>   =C2=A0 GET_MAX =3D=C2=A0 =C2=A0 =C2=A0 0=C2=A0 (=C2=A0 0.00 dB)
>>   =C2=A0 GET_RES =3D=C2=A0 =C2=A0 256=C2=A0 (=C2=A0 1.00 dB)
>>
>> GET_CUR and SET_CUR both work, but the device has two quirks relevant t=
o
>> the new sticky detection.
>>
>> 1. GET_CUR reflects normal SET_CUR changes with a delay of roughly 50 m=
s.
> Interesting.
>
>> Measured from 0 dB:
>>
>>   =C2=A0 target=C2=A0 =C2=A0 =C2=A0result=C2=A0 =C2=A0first visible GET=
_CUR change
>>
>>   =C2=A0 =C2=A0-1 dB=C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A081=
.3 ms
>>   =C2=A0 =C2=A0-2 dB=C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A051=
.9 ms
>>   =C2=A0 =C2=A0-4 dB=C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A047=
.3 ms
>>   =C2=A0 =C2=A0-8 dB=C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A047=
.1 ms
>>   =C2=A0 -16 dB=C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A051.7 ms
>>   =C2=A0 -32 dB=C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A047.2 ms
>>
>> 2. The advertised minimum value -64 dB is not functional.
>>
>> A direct SET_CUR to -64 dB returns success, but GET_CUR remains at 0 dB
>> even after 1000 ms.
>>
>> This appears to cause a false positive in check_sticky_volume_control()=
:
>>
>> - cval->min is -16384 (-64 dB)
>> - cval->max is 0
>> - if the saved value is 0, max is skipped
>> - SET_CUR(min) returns success
>> - an immediate GET_CUR still returns the saved value
>> - the mixer is classified as sticky and is not registered
> Super interesting.
>
> Maybe some previously reported devices were broken because of the same
> reason.
>
> I think, the sticky check could be more precise in this manner:
>
>     res =3D (cval->max - cval->min) / 16; /* Check approximately 16 valu=
es. */
>     if (res < cval->res)
>     	res =3D cval->res;
>     else
>     	res =3D roundup(res, cval->res);
>    =20
>     for (i =3D cval->min; i+=3D res; i < cval->max) {
>     	if (i =3D=3D saved)
>     		continue;
>     	SET_CUR(i);
>     	check =3D GET_CUR(i);
>     	if (check !=3D saved)
>     		break;	/* Fast path. */
>     	/*
>     	 * Wait for asynchronous mixers. This sleeps for no more than 160ms
>     	 * in total, which should provide some time for the mixer to change
>     	 * its value.
>     	 * Note that there is no need to wait between SET_CUR and GET_CUR,
>     	 * as we don't care whether the GET_CUR value matches the SET_CUR o=
ne.
>     	 * What we expect is just a GET_CUR value differing from the saved =
one.
>     	 * It this manner, most devices should go through the fast path wit=
hout
>     	 * extra sleep.
>     	 */
>     	msleep(10);
>     }
>     [...]
>
> This should classify your device as non-sticky.
>
> I will find some time to write a patch for that. I would be grateful if
> you can test it then.
>
> Thanks,
> Rong
>
>> mixer_get_cur_broken is not appropriate
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> I tested the mixer_get_cur_broken quirk.
>>
>> GET_CUR on this device is not broken or constant. It correctly reports
>> host SET_CUR changes after the device delay, and it also reports volume
>> changes caused by the physical headset wheel.
>>
>> Using an internal-only cached value would therefore lose useful hardwar=
e
>> state.
>>
>> Local proof-of-concept fix
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>>
>> I built a local snd-usb-audio.ko against the running 7.1.5 kernel.
>>
>> For this specific device, Feature Unit 2, UAC_FU_VOLUME, I:
>>
>> - clamp the unusable minimum from -64 dB to -63 dB
>> - skip the probe-time sticky/resolution checks for this control
>>
>> With that module, ALSA exposes:
>>
>>   =C2=A0 Simple mixer control 'PCM',0
>>   =C2=A0 =C2=A0 Capabilities: pvolume pvolume-joined pswitch pswitch-jo=
ined
>>   =C2=A0 =C2=A0 Playback channels: Mono
>>   =C2=A0 =C2=A0 Limits: Playback 0 - 63
>>
>> /proc/asound/card*/usbmixer shows:
>>
>>   =C2=A0 Unit: 2
>>   =C2=A0 =C2=A0 Control: name=3D"PCM Playback Volume", index=3D0
>>   =C2=A0 =C2=A0 Info: id=3D2, control=3D2, cmask=3D0x0, channels=3D1, t=
ype=3D"S16"
>>   =C2=A0 =C2=A0 Volume: min=3D-16128, max=3D0, dBmin=3D-6300, dBmax=3D0
>>
>> Most importantly, no userspace workaround is required once the mixer
>> control is restored.
>>
>> Example before rotating the physical headset wheel:
>>
>>   =C2=A0 ALSA:=C2=A0 =C2=A0 =C2=A0-27 dB / 57%
>>   =C2=A0 PipeWire: 0.35
>>
>> After rotating the headset wheel:
>>
>>   =C2=A0 ALSA:=C2=A0 =C2=A0 =C2=A0-11 dB / 83%
>>   =C2=A0 PipeWire: 0.65
>>
>> KDE system volume follows the physical wheel as expected.
>>
>> I attached the proof-of-concept diff and the measured results. I am hap=
py
>> to test a maintainer-preferred implementation or additional diagnostics=
.
>>
>> My suspicion is that this device exposes two assumptions in the sticky
>> mixer probe that are not universally safe:
>>
>> 1. GET_CUR is assumed to reflect SET_CUR immediately.
>> 2. advertised min/max values are assumed to be usable test values.
>>
>> Thanks.
>>
>> #regzbot introduced: 86aa1ea1f15ce6b56ac1b4c0d9b88a07a5b9bf03
