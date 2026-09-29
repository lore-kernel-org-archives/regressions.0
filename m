Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B551F51357A
	for <regressions@lists.linux.dev>; Tue, 29 Sep 2026 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679339; cv=none; b=k1KShViS61Wr/cpkfsGwZ10A2lE4kDr7bMS/3Djy6CM7ABIQLBUGE9Kqv16JnqCAYUKrh6iVyl69D45IvFZwRnefjjWEm5uW6MtkY6J1aHj5lRHTB37UxFT74c8gU6h9oUj07gawpO3iAMRjAjZ9T1y3WMufMv13UjLcGhGoBaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679339; c=relaxed/simple;
	bh=0TlOpqGIW0OKP8i4B9iB1TnWjwByJhoBrqpVjXAcBwg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=HZ3YSpb+z0JykGSVbMJG2eWMbaviCKxEfDTSSDF6dQagBpL2XTLO9DMvuGYEKtAzaBF3lXvcp9FUQK2pViytElbvd39qE3Ysn6yZjzHD55CHADymwPjXvv8ddQvzkGv1Lq8woXBO+M7pg/FuB43GKfVDFXJ39WTRWO3J+kqIWR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=jan.lentfer@web.de header.b=RL6vdQQu; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=jan.lentfer@web.de header.b="RL6vdQQu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1790679316; x=1791284116; i=jan.lentfer@web.de;
	bh=0TlOpqGIW0OKP8i4B9iB1TnWjwByJhoBrqpVjXAcBwg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RL6vdQQumhyuhXqeAc6fDUMkNZ1bi/T/DkGbMVYK5X1dzSrtLvVc3p2p4OynFC3l
	 km2juIRNK/mB/TTvJEJhI5OBlrsT7341y0UiaPeW24yU2il9dOcbCe6K8+kHt18FG
	 crxtAVd5mfv1/lwr6QOX9n9ODrDRLlmWcG5yGv6qLg9M/F7+jwluCg632gHtKBKau
	 KG/gW5qKUQDolBmQj9jFY7XgNfKFbUVB4urgtFIQkoKflqhPl04S23P46ACO7yhWw
	 tCxcAlTcdTz8oX2NFB5tQ+ovFtcNsxZDjT8GdC8NuTKg1iw1SDWd2pnri6RodwVFY
	 jAJE8ZHrQK6UTyacrg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M6YNJ-1x4bbJ1LNx-008xPJ; Tue, 29
 Sep 2026 12:55:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by vm-mailsrv.lan.net (Postfix) with ESMTP id AFDAAF133;
	Tue, 29 Sep 2026 12:55:15 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level:
Received: from vm-mailsrv.lan.net ([127.0.0.1])
	by localhost (vm-mailsrv.lan.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 73s2DN9pE500; Tue, 29 Sep 2026 12:55:12 +0200 (CEST)
Received: from [10.94.76.105] (ts-d20.lan.net [10.94.76.105])
	by vm-mailsrv.lan.net (Postfix) with ESMTPS id 431F3F12B;
	Tue, 29 Sep 2026 12:55:12 +0200 (CEST)
Message-ID: <e7087d42-5e74-4d85-b1c5-b11eff235d41@web.de>
Date: Tue, 29 Sep 2026 12:55:11 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de, regressions@lists.linux.dev
From: Jan Lentfer <jan.lentfer@web.de>
Subject: [REGRESSION] ALSA: usb-audio: Behringer USB-MIDI output stalls, since
 "Use strings in struct usb_dev for manufacturer & co"
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0NcQuFlIocb43X5Q8Ek30aPyGgcYJ7sGCpVYVFYV7shCwLaGIwH
 QW06l95Lp60tTCzzCBkw+kYGk0PmWocR8r7xExa1cpgEEEJ7K12fEfzfn9DNNYTQgHfgQ2P
 qD82PHAM0nzgZoQFyEG+HRGCt1d5l4l4zuqCELYX1h/fHJDDA3hIYVOfur+3xmiDDgpW58T
 7zXkB+XVecdkF9f692rJw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Fh6hVB6dibU=;5djBQ3X14GMG4ovOtDnDaQMO+N3
 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

Hi,

since 7.1, USB-MIDI output to several Behringer synths stalls completely
after the synth is switched on or re-plugged. I traced it to the missing
string-descriptor reads after SET_CONFIGURATION, which were removed by

 =C2=A0 "ALSA: usb-audio: Use strings in struct usb_dev for manufacturer &=
 co"
 =C2=A0 (Takashi Iwai, posted 2026-03-05)

The firmware of these devices evidently only starts accepting bulk-OUT
data after one more control request following SET_CONFIGURATION.
Until 7.0, snd-usb-audio happened to send two: the usb_string() calls
in usb_audio_make_shortname() / usb_audio_make_longname().

#regzbot introduced: v7.0..v7.1

Affected (class-compliant USB-MIDI 1.0, full speed, bulk EP 0x02 OUT /
EP 0x81 IN, one altsetting):
 =C2=A0 1397:1230=C2=A0 BEHRINGER K-2 MK II=C2=A0 =C2=A0 =C2=A0 (verified:=
 usbmon + workaround)
 =C2=A0 1397:1249=C2=A0 BEHRINGER KOBOL EXPANDER (same symptom; 7.0 good, =
7.1 bad)
 =C2=A0 1397:1256=C2=A0 BEHRINGER 2-XM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(same symptom on 7.2)
Not affected: Behringer PRO-800, Roland SE-02 (0582:0201).

Kernels: Liquorix builds of the stable releases, Debian 12 amd64.
7.0.14 is good; 7.1.12 and 7.2.4 - 7.2.8 are bad.
I have not run a vanilla build, but the usbmon diff below points
directly at the mainline change. Liquorix report:
https://github.com/damentz/liquorix-package/issues/233

Symptom
=2D------
After the synth is power-cycled while connected, the first 7 MIDI
messages leave the rawmidi buffer, and none of them reaches the synth.
After that the output is stuck:

 =C2=A0 /proc/asound/cardN/midi0:=C2=A0 Tx bytes: 21=C2=A0 =C2=A0Avail: 40=
21 (of 4096)
 =C2=A0 dmesg on close:=C2=A0 rawmidi drain error (avail =3D 4081, buffer_=
size =3D 4096)

usbmon shows 7 bulk-OUT URBs (=3D OUTPUT_URBS) submitted with correct
USB-MIDI packets and never completed (the device NAKs forever). No
error is logged. Once stalled, only a new control request (see below)
or booting a 7.0 kernel recovers it. A synth that was already working
keeps working across a reboot into 7.1+, because nothing re-enumerates
its firmware state; only a fresh power-on triggers the problem.

Ruled out: IRQ threading (same with nothreadirqs), RT IRQ priorities,
the shared IRQ line, hubs vs. root port, userspace (aplaymidi alone),
runtime PM, MIDI channel.

usbmon: power cycle of the K-2 MK II, 7.0.14 vs 7.2.8
=2D----------------------------------------------------
Byte-identical up to and including SET_CONFIGURATION. Then:

7.0.14:
 =C2=A0 S Co:3:021:0 s 00 09 0001 0000 0000 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0SET_CONFIGURATION 1
 =C2=A0 C Co:3:021:0 0 0
 =C2=A0 S Ci:3:021:0 s 80 06 0302 0409 00ff 255 <=C2=A0 =C2=A0 =C2=A0strin=
g 2 (product)
 =C2=A0 C Ci:3:021:0 0 20 =3D 14034b00 2d003200 ...=C2=A0 =C2=A0 =C2=A0 "K=
-2 MK II"
 =C2=A0 S Ci:3:021:0 s 80 06 0301 0409 00ff 255 <=C2=A0 =C2=A0 =C2=A0strin=
g 1 (manufacturer)
 =C2=A0 C Ci:3:021:0 0 20 =3D 14034200 65006800 ...=C2=A0 =C2=A0 =C2=A0 "B=
ehringer"
 =C2=A0 S Bi:3:021:1 -115 64 <=C2=A0 =C2=A0(x7)
 =C2=A0 S Bo:3:021:2 -115 4 =3D 09933c6e
 =C2=A0 C Bo:3:021:2 0 4 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0completes in ~0.2 =
ms
 =C2=A0 ... all further Bo complete

7.2.8:
 =C2=A0 S Co:2:022:0 s 00 09 0001 0000 0000 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0SET_CONFIGURATION 1
 =C2=A0 C Co:2:022:0 0 0
 =C2=A0 (no further control request to the device)
 =C2=A0 S Bi:2:022:1 -115 64 <=C2=A0 =C2=A0(x7)
 =C2=A0 S Bo:2:022:2 -115 4 =3D 09933c6e
 =C2=A0 ... 6 Bo submitted, none ever completes (capture ran > 60 s)

Proof / workaround
=2D-----------------
On 7.2.8, with the K-2 stalled (7 OUT URBs pending), I issued a single
GET_DESCRIPTOR(STRING, index 2, 0x0409) from userspace via usbfs
USBDEVFS_CONTROL. The pending URBs completed immediately (Tx 21 -> 96,
buffer drained), and all later MIDI output works.
As a stop-gap I now do that from a udev rule when the card appears:

 =C2=A0 ACTION=3D=3D"add", SUBSYSTEM=3D=3D"sound", KERNEL=3D=3D"controlC*"=
, \
 =C2=A0 =C2=A0 ATTRS{idVendor}=3D=3D"1397", \
 =C2=A0 =C2=A0 RUN+=3D"/usr/local/sbin/behringer-usbmidi-wake $attr{busnum=
}=20
$attr{devnum}"

With it, a power-cycled K-2 MK II works on 7.2.8 without manual steps.

Possible fix
=2D-----------
A quirk for these IDs (or all of 1397:*) that issues one standard
control request after SET_CONFIGURATION, e.g. reading a string
descriptor, before the MIDI endpoints are used. Alternatively, restore
an actual usb_string() read in the card-name path. I'm happy to test
patches, and I can send the full usbmon captures and descriptor dumps.

USB descriptors (K-2 MK II; Kobol Expander identical apart from strings):
- bcdUSB 2.00, full speed, bcdDevice 2.00, 1 configuration, self powered
- Interface 0: AudioControl, no endpoints
- Interface 1: MIDIStreaming, 1 altsetting, 2 endpoints
 =C2=A0 - EP 0x02 OUT bulk, 64 bytes, 1 embedded jack
 =C2=A0 - EP 0x81 IN bulk, 64 bytes, 1 embedded jack
- Host: Intel 82801JI (ICH10) EHCI, devices behind USB 2.0 hubs
 =C2=A0 (also seen on a UHCI root port)

Thanks,
Jan Lentfer

Disclaimer: analyzed and reported with AI support

