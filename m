Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2313A7F5F
	for <regressions@lists.linux.dev>; Fri, 14 Aug 2026 12:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710932; cv=none; b=KHB1hKQzS0judT//tdhhxwVOvf9Fdco9vlYEQ3zZLEoldq7mv3wdBkwELvsImbc8qy7fE07BpPV7V60Mqz/3p3Pq1UdSl2xRITji0i/oj8B29sOtCFLxS+0hWjfQQJZMJN9lg+qLo2mXIe+ebwCQJXjmt91HqPcSRlY4cm1O7gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710932; c=relaxed/simple;
	bh=MhCBOZTynJnxbXbsif+Al2d9dP3unICrD/U5aKH+i9I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=PHdt78QjIzEo6SRkiFeVq2o0GMxzJB+LkvNZhsAbKE1jCtnk2mX8qglaD4bm6V4ysQVasB2vPcUEIxyAkhgUoIQd04RWcxcb6d71QAVQiuFcPEqxeAnL5s54Iz/N744aD1RFvIjMvXXW4Oc/FwSKCgHcpYF8OU68oEn0NCCGI5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=adventurefan@gmx.de header.b=K6bbXjec; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=adventurefan@gmx.de header.b="K6bbXjec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1786710922; x=1787315722; i=adventurefan@gmx.de;
	bh=OOkAL8/a6XIZFq5QoiOppXsSHu1vGCqsAvcwSD5lBOs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=K6bbXjecoUfZyAmLCzKX1pnbTyW4/AKyysTGTlJm+26zSZUOvoTfmwCJMVhCefg7
	 B433Ssi32qkEp/tkC1ccDanx0BFCoMXF4gGxcL74WF4AXN00ozIWOazllE9gI3bYC
	 RHqrawDWfHiPibYKvlFhqAkpeJ+vVeNKoE6EJY6f+BOJJ4j3UPijqyCnn+eozx7Ub
	 XDgKVUHhCXra/AAK0aGM7Oq501SByCDCRHMITZJqRXmtQjjBi5DHQECw/911nLgtL
	 yk8cmPYzNmAdtz8lXO5ScLzyk+7PJ3guYvnFh4s2Jx4xL2lWNOEOW3iA1Y6FduEGt
	 AlYiIWEIbAyKdKw7Rg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7b6l-1wmtRn1c6P-000cqg; Fri, 14
 Aug 2026 14:35:22 +0200
Message-ID: <833d894c-002d-4be4-a799-cdb1c20fc8ec@gmx.de>
Date: Fri, 14 Aug 2026 14:35:21 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alexander Niemeyer <adventureFAN@gmx.de>
Subject: [PATCH] ALSA: usb-audio: Fix Logitech PRO X Wireless volume control
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com, perex@perex.cz, i@rong.moe, regressions@lists.linux.dev
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GYYtFI3i90PX+5+wrqYnTc+yrPzeifbEJeQQztkET00izSMKmSN
 VJ9HExJErbOs8QvpXSVzX1iEfMlmSgXB4trLZ4UGxNmLRH7/VL/gD6C8oLDSnvg9nsHTMKp
 3/ZCBq03c8zECPex8J1Zc93zBCJfzK943rz/kvQ8w6cYYoqCVT78Zz8LAVNVZ0r1Itsnrkz
 16OIsBNsTgiuQoBN+ZQXg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iSp/p008cDA=;5vmeRUb031LyInfJfMBLY8fwAwk
 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

  The Logitech PRO X Wireless headset (046d:0aba) advertises a UAC1
playback volume range from -64 dB to 0 dB in 1 dB steps. The -64 dB
endpoint is not effective, and GET_CUR reflects effective SET_CUR
changes only after roughly 50 ms.

Since commit 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky
mixers"), the probe-time sticky mixer check writes the advertised
minimum or maximum value and immediately reads it back. On this device
that falsely classifies the working playback volume control as sticky
and removes it, leaving only the PCM Playback Switch control.

Clamp the unusable minimum to the next step (-63 dB) for Feature Unit 2
volume control and skip the probe-time sticky/resolution checks for this
control.

With the quirk applied, ALSA exposes PCM Playback Volume again and the
physical headset volume wheel updates ALSA and PipeWire/KDE system
volume normally.

Tested on Linux 7.1.5 with Logitech PRO X Wireless 046d:0aba.

Fixes: 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky mixers")
Cc: stable@vger.kernel.org
Assisted-by: ChatGPT:GPT-5.6-Sol
Signed-off-by: Alexander Niemeyer <adventureFAN@gmx.de>

=2D--
  sound/usb/mixer.c | 15 +++++++++++++++
  1 file changed, 15 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
=2D-- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1299,6 +1299,21 @@ static int get_min_max_with_quirks(struct=20
usb_mixer_elem_info *cval,
          if (cval->res =3D=3D 0)
              cval->res =3D 1;

+        /*
+         * Logitech PRO X Wireless advertises a non-functional
+         * -64 dB minimum and delays GET_CUR updates.
+         */
+        if (cval->head.mixer->chip->usb_id =3D=3D
+            USB_ID(0x046d, 0x0aba) &&
+            cval->head.id =3D=3D 2 &&
+            cval->control =3D=3D UAC_FU_VOLUME) {
+            usb_audio_info(cval->head.mixer->chip,
+                       "Logitech PRO X Wireless: applying "
+                       "playback volume quirk\n");
+            cval->min =3D -16128; /* -63 dB */
+            goto no_checks;
+        }
+
          if (cval->min < cval->max) {
              int saved;
