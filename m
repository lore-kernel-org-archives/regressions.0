Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9557146F4A8
	for <regressions@lists.linux.dev>; Fri, 14 Aug 2026 13:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714082; cv=pass; b=X/kJsxnVOpTgTfyN0gt4tdUa0CjUQWgm/uLGC8kTJxyDLLTA74eWJYfmypdbV7HbKHitf4mbAzQhiHy4oRcQjWZendbTgclbvBMoYliJ+HsMC3KdAZAn1nBgPRODcPCGfZzxlNQgs1qTzBB75yyQYTb5ueV/DshMqFJGeFKzxp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714082; c=relaxed/simple;
	bh=NGHLL/ABkOXx1vELv3bo8fnqMxeTKC+QivYhqJ9lNco=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Uxe4BheQxOUT1M2IwW1QELC5l26LVnTg8kDcOoYaCl9tiRZeokhUENoy5KI1FhghY9vjUkWFMqRMCIc6A1rSWLw07h30xYrEKHLM11l4f9RQ0kxYt2CSkhssP/UUd4QQADnAPmhG8iUq9Jvy2k/z/G6Hbx07nbqatHstI3jr158=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=aHAkLLHT; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="aHAkLLHT"
ARC-Seal: i=1; a=rsa-sha256; t=1786714077; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bkwKvXknGKsAjEmGeWwiGZUIYaJsB+/ZiqWVAo2oGFSghXRN9lR6YgCNjSlZyJt1smqTOpIvtqLkf5Mm6wtbk6zCuzX2UaYbdq2ozQ9wHSXV++rlSNlx01qjwbXHIqhnINdcbrreCOAwC3ur4jCW6PbbyvTabrjYu4shl+1v7Bk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786714077; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6152O/Z7SY5R1C8x+4i+6+bgS5vJdAFFvd542sdS2zw=; 
	b=g+XVdb0qnM5aVYRP8KvDE6lvxoNAPuDQo9m6aYZzs79sPOVDXrWJZj4PJV88CTxT4RNi9B2NOcC294iXMKHT7Ng71SEEe0uLmUy3OGABAqDq/BVTrScdbPz4D0dXk2A0kkJRgW4mJmBhc2oOAOw9rdZIVsydNIoQRHrtOYxfjCs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786714077;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=6152O/Z7SY5R1C8x+4i+6+bgS5vJdAFFvd542sdS2zw=;
	b=aHAkLLHTq07V25TCP1LZ2aoiTjIs+Z1TWcVOTqURTA9WENrdO7MBrHDr8aXNOLI3
	f8VUhSnJukNbw6U56FtokBcztXZwIIzvuiq7gnzhbAZMU9qW0lRfEeX2MfTThJiqeto
	i/YL2azzBfGHttcNyYNKwpmeTt10PiDJ3/JIM7aIJo5Gcvoi7daBmOIBsl/Fp0e+exl
	3RL8nXLcnN+UVI3IQdowZfgcoDKEU/AbAAdRJ+2Xw3X5aS9fSwtNzQBDgcNhipDdiGd
	lK4d8CT7+EeVYXCZ9IlnH7nWnCE1ONH0YheDPnHJd6jIt2XHj805XZX+ATJK0AiykWQ
	jNs8P++cdw==
Received: by mx.zohomail.com with SMTPS id 1786714074528832.1471927222016;
	Fri, 14 Aug 2026 06:27:54 -0700 (PDT)
Message-ID: <52a4329e21027a2724a25918802b2bf71d68ebaf.camel@rong.moe>
Subject: Re: [PATCH] ALSA: usb-audio: Fix Logitech PRO X Wireless volume
 control
From: Rong Zhang <i@rong.moe>
To: Alexander Niemeyer <adventureFAN@gmx.de>, linux-sound@vger.kernel.org
Cc: tiwai@suse.com, perex@perex.cz, regressions@lists.linux.dev
In-Reply-To: <833d894c-002d-4be4-a799-cdb1c20fc8ec@gmx.de>
References: <833d894c-002d-4be4-a799-cdb1c20fc8ec@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 21:22:46 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Alexander,

On Fri, 2026-08-14 at 14:35 +0200, Alexander Niemeyer wrote:
>   The Logitech PRO X Wireless headset (046d:0aba) advertises a UAC1
> playback volume range from -64 dB to 0 dB in 1 dB steps. The -64 dB
> endpoint is not effective, and GET_CUR reflects effective SET_CUR
> changes only after roughly 50 ms.
>=20
> Since commit 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky
> mixers"), the probe-time sticky mixer check writes the advertised
> minimum or maximum value and immediately reads it back. On this device
> that falsely classifies the working playback volume control as sticky
> and removes it, leaving only the PCM Playback Switch control.
>=20
> Clamp the unusable minimum to the next step (-63 dB) for Feature Unit 2
> volume control and skip the probe-time sticky/resolution checks for this
> control.
>=20
> With the quirk applied, ALSA exposes PCM Playback Volume again and the
> physical headset volume wheel updates ALSA and PipeWire/KDE system
> volume normally.
>=20
> Tested on Linux 7.1.5 with Logitech PRO X Wireless 046d:0aba.
>=20
> Fixes: 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky mixers")
> Cc: stable@vger.kernel.org
> Assisted-by: ChatGPT:GPT-5.6-Sol
> Signed-off-by: Alexander Niemeyer <adventureFAN@gmx.de>
>=20
> ---
>   sound/usb/mixer.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>=20
> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -1299,6 +1299,21 @@ static int get_min_max_with_quirks(struct=20
> usb_mixer_elem_info *cval,
>           if (cval->res =3D=3D 0)
>               cval->res =3D 1;
>=20
> +        /*
> +         * Logitech PRO X Wireless advertises a non-functional
> +         * -64 dB minimum and delays GET_CUR updates.
> +         */
> +        if (cval->head.mixer->chip->usb_id =3D=3D
> +            USB_ID(0x046d, 0x0aba) &&
> +            cval->head.id =3D=3D 2 &&
> +            cval->control =3D=3D UAC_FU_VOLUME) {
> +            usb_audio_info(cval->head.mixer->chip,
> +                       "Logitech PRO X Wireless: applying "
> +                       "playback volume quirk\n");
> +            cval->min =3D -16128; /* -63 dB */
> +            goto no_checks;
> +        }
> +

Adding a device-specific quirk here made me uncomfortable. If my proposed
improvement to the sticky check works for you (after me finishing it and
you testing it), it'd better adding the quirk to volume_control_quirks().

Thanks,
Rong

>           if (cval->min < cval->max) {
>               int saved;
