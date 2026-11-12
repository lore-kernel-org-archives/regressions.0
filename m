Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794496797;
	b=pdNuVGZFNbcr3t7z8myZG8KWzQsavzCMPFWTVWyzZBhgd3c0nWOpca5sL2Ui3iXiPc1M
	 REKe5luhWxJJJzwRV4UhGmv7HetMe/3xpKWMBUb4vxGlml8msOx0nQ+/hcwFAAC9/igYB
	 iPbSpfSXOlHFP5lhPNurZ9tiyaPpCasIGznKEZxOPrKNVKOeExH4xWp6cksfG8vcats7L
	 Wev/qrc1Di2MWpIQfq0Hja3elLCc4iI41Rx/lUkgJcmnsoyp1RF33aU8SETkZV9Nj0Bg3
	 2aYfq6RXt7ML6PRgvDxlU2wv+H/HX8Wlmlbcd7YhchkroDbkiUgdZ7o3pfd/pPEqUfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=XCU5YMgEOGMwVe29N8gNhg5ChZqSGt6pfW7EISgqdek=;
	b=sdSYLH/jpGmwajke/7YhUux2jWxExCys/adqNqeDLcpwMxIxpNmisvLctQFKRiQYot3x
	 tbmG7XhtSHU2vltdhGOV8yNgZWz1NDyVDGGeioRTSPGImz3FujFfBC1pSsFzNpebXNc30
	 MRsAeyovzVYfOXJlwnl6cH3712C/vC2ZftVtU2r0X2OAxCX/dBDT/k1agXwSfbfJRb5YF
	 BtWP9LOJMgko4wrf1ptqaFhMJweCRsY1kWypLR6h6u1iYQowV+uSQ9yOCTeTgelwzktoU
	 vvwIlt0v6+a8pb2udFvlChbJJ9/kwtrrOjfI5+UIgPbHpOBlUejglN5a1eHR+LyI52Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I/ZwpZ6b";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA8F60A383A
	for <regressions@lists.linux.dev>; Thu, 12 Nov 2026 15:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA8F60A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I/ZwpZ6b
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so43546115e9.3
        for <regressions@lists.linux.dev>; Thu, 12 Nov 2026 07:19:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794496796; cv=none;
        d=google.com; s=arc-20260327;
        b=XUO7V+FuQr/aOD4qwQb7HZ3h++JGdELyMWYrPkoMhJWu87zQS4HjaPxFFdhcPErZb+
         BvLQqZda3pW4Moz20AAH/wPXrRpk0PmNzuBsxaUdeQU1WiZEJulrqAkQSJFX0ZZaO15b
         UT+RL6LJ2PBwse9lEjT95lQWNsReZj/ydKml/hhY/2fp5AFws/QCn4y4wY/yAHyvwoXR
         qKgeLStBWyiLIhPJLy5S2tTcNNTL2lUoj+9e4nAYDvG6GlRF4WG3TpTLksKrcSGng5J0
         g44iKalsHPtGtYcqpy+qXVa//aomtFAs4HS92qBjZ46PmLxd22vWRIjYyJca30Ungiug
         bppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XCU5YMgEOGMwVe29N8gNhg5ChZqSGt6pfW7EISgqdek=;
        fh=NOYk7KjRcx6oLc8VDWbzRLEpBWWYMEcJvyEM9YQtbfw=;
        b=EFhLlAk/MLWkVR8WkbLWqYqhg9pIFQV/KKpXdHr0IGnsU4t3EVA4jwkdlzQCLiSd1/
         bJsTPY9VddMPJcI3aBqqA4utbQ5Id+XHm64Or4P7w7X3q1QzUJd/ojiT1nsLBesj7hrL
         GqyK3TzUJDcb0uXz5aUbvEFwhnNp7dnpKZZ8UGI37xURRQB8bEWQMTaCJ+YZ2J8Pv6cc
         J3mPr5K+i030qOsfdE5YVo4QhgJxd8l5PEv/jCDRBeo25lqDyQrRyVexItwVw5n5HdLP
         peBf+Q2uPasZ9yQwukKnxjjlh7mF5s2mqCW+ttOrHba/VJ5GCPZaGxphGA3yDQiJnyeC
         9VKA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794496796; x=1795101596; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XCU5YMgEOGMwVe29N8gNhg5ChZqSGt6pfW7EISgqdek=;
        b=I/ZwpZ6b2NwrH9Zl/lAq6gMEseiOKQ9wMjae6DAfARKtVoNJ92PE9UioLgQjBxhTlp
         8hNvYOcqSv2PGDxmqmdwtudv1Bihk1Rmmyet5pCtxN/StDC9KPfGpS51qFsaRhaJwAy2
         E5FgDzMrMtMerdlKu17JPJf0Estdk1+2UDp2k5WmeT6GSo4BCl6X6M3UA3JbI2YtbLiu
         3v09hkVGiaF1rg0/WzgnLNNKG4eoPY4CeM5lo6lmC43DKXi98GnLSk9A1rjisJmn7QIY
         pIy7/k04vspADCIXEezzvJ80qcjTkX/iHVPARiKbL5P50LzqMe0OPXwBG2oeMUOlsjrL
         zAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496796; x=1795101596;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCU5YMgEOGMwVe29N8gNhg5ChZqSGt6pfW7EISgqdek=;
        b=rxKlIGk35evxcNl04IDsUnqJtnEsCjUILpEnWwEI5MfzEYhiMWRSQNS3M1I47d5VPO
         WO7tIo40JOOReQaWjqIfm+cJO2y8nqCZCjMW+vLjJZar1zsGqkDDyTudBnHokNWQXQv7
         4O0sXL0EAZC5rgmv5HGcAkRWS4k7LgzJJNi5tHw3EPxTyOhOD0OeiOMCF4gzUIyvh+JX
         bPG7IzP5yuCEEDR+BJHFFakX2Fe5Eqk5EcYKgLGYSwgRifLrvhUYGTkA/Pzr0Ll2y1JB
         s0GyKgvRSnvX0Y2NXOSGnKUr8gF05wIL/UwlNae3KM+BX5Y/XUU40tYq2DLj3mtowCtH
         ZleA==
X-Gm-Message-State: APuU4Z+9NRVWI3V6aLnFZdgbwBDdDAs3h7raoAF2hyhlNTZxLFhW9yC1
	83PaOtRgBPwGuaG+o8Xx+ygsfb+3NuNT2fH3sMoGdRvLSS46hIzWhJuz69SQsvd3m4WaX8sjOzs
	ZL9qIG5A4sb1wFCywTuuVPAupxT9ng8w=
X-Gm-Gg: AYBFou0khACrc1C/8M/M6UvNwX2CCD4VFpBuWMftuB7xnCsowz+//w+yBr9ZeQonFT+
	GvWmT5PmaAdZMc6vSsQPFDszmWTzpNcWb70U8IJO6OyupkIX3IonQ7HKHJCsG2FmwFaVwTESUJO
	y5nMfpG/AD7i9AgrE4Ys76CG2wDs0r4rORS8H6+ULrbk/u4PlKRNv/5vk1wY6ocmSJjWcEFrm58
	HgTEBUKG7V5lVdhVFLaS9pRznLnFJnSQeb4HMt3SdwrEWAYx+SjbpqtbckIbMTioHNOra9MZaEG
	LGZHew4HOasEzqvG9M34OeP5rZkrKMKkujn4LlzaqRlZWfSYhA8H4946GHzfMfuxGpG9wSZNhXm
	ly+QSvEbOd3NfLHNfYskpcC8oVlJBCTsVnde9tg==
X-Received: by 2002:a05:600c:4f84:b0:4a1:e92b:ae4a with SMTP id
 5b1f17b1804b1-4ba093b9a3cmr106590855e9.21.1794496795435; Thu, 12 Nov 2026
 07:19:55 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103-tas2781-v1-nocrc-fix-v1-1-a769c27f21ce@gmail.com>
 <7cd4c010f13ee085e3aa4396705b6b06ed58f7e1.camel@irl.hu> <504167422048bb8197a1ca3fac079cec9dea1ae7.camel@irl.hu>
 <CAN6p6iiFz-JXOt9iFUPa3x4Aqu2c96=ERf0AMZ6pPVWspd=jLw@mail.gmail.com>
In-Reply-To: <CAN6p6iiFz-JXOt9iFUPa3x4Aqu2c96=ERf0AMZ6pPVWspd=jLw@mail.gmail.com>
From: Mohamed Yassine JEBABLI <med.jebabli@gmail.com>
Date: Thu, 12 Nov 2026 16:19:43 +0100
X-Gm-Features: AclHuK-U1bKsRdqloiglORwVbHTYD3ELvn-XYZ_Olj9JVapFRVasjDHISUDa0vE
Message-ID: <CAN6p6ihogRNOPM4siK=QykMk_XDD_Essf04OW8d5Q52vORNA4A@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/tas2781: Only accept CRC-less V1 data if all
 entries are valid
To: Gergo Koteles <soyer@irl.hu>
Cc: regressions@lists.linux.dev, 
	Cristian Castellano <cristian.castellano@icloud.com>, stable@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gergo,

Regarding the Q27/Q31/Q58 formats: they are not from any
documentation; I inferred them from the data. Reading the first word
of each entry as Q27 gives a plausible speaker resistance (3.82 ohm on
my Legion Pro 7, 3.64 ohm on Cristian's Yoga Pro 9), and reading the
second word as Q31 gives exactly its reciprocal, within 1e-4, on both
machines. So, for a consistent entry, R0 =C3=97 InvR0 ~=3D 2^27 =C3=97 2^31=
 =3D
2^58.

The V2 dump from the ASUS ROG Xbox Ally X thread (with a valid CRC)
fits the same pattern: r0 =3D 0x3c5f7222 (~7.55 ohm in Q27) and invr0 =3D
0x10f615d5 (~0.1325 in Q31, i.e. 1/7.55).

My guess is Q5.27 and Q1.31, but I have no TI reference to confirm it.

Finally, all testing was done on my own hardware: the original patch
was tested on my Legion Pro 7 16IRX9H, and I reviewed and own the
changes.

Thanks,
Mohamed Yassine JEBABLI


Le jeu. 12 nov. 2026 =C3=A0 16:09, Mohamed Yassine JEBABLI
<med.jebabli@gmail.com> a =C3=A9crit :
>
> Hi Gergo,
>
> Regarding the Q27/Q31/Q58 formats: they are not from any documentation; I=
 inferred them from the data. Reading the first word of each entry as Q27 g=
ives a plausible speaker resistance (3.82 ohm on my Legion Pro 7, 3.64 ohm =
on Cristian's Yoga Pro 9), and reading the second word as Q31 gives exactly=
 its reciprocal, within 1e-4, on both machines. So, for a consistent entry,=
 R0 =C3=97 InvR0 ~=3D 2^27 =C3=97 2^31 =3D 2^58.
>
> The V2 dump from the ASUS ROG Xbox Ally X thread (with a valid CRC) fits =
the same pattern: r0 =3D 0x3c5f7222 (~7.55 ohm in Q27) and invr0 =3D 0x10f6=
15d5 (~0.1325 in Q31, i.e. 1/7.55).
>
> My guess is Q5.27 and Q1.31, but I have no TI reference to confirm it.
>
> Finally, all testing was done on my own hardware: the original patch was =
tested on my Legion Pro 7 16IRX9H, and I reviewed and own the changes.
>
> Thanks,
> Mohamed Yassine JEBABLI
>
>
> Le jeu. 12 nov. 2026, 15:43, Gergo Koteles <soyer@irl.hu> a =C3=A9crit :
>>
>> Hi,
>>
>> On Wed, 2026-11-04 at 16:55 +0100, Gergo Koteles wrote:
>> > Hi Mohamed,
>> >
>> > On Tue, 2026-11-03 at 10:27 +0100, Mohamed Yassine Jebabli via B4 Rela=
y
>> > wrote:
>> > > From: Mohamed Yassine Jebabli <med.jebabli@gmail.com>
>> > >
>> > > Commit 408249089c48 ("ALSA: hda/tas2781: Accept V1 calibration data
>> > > without CRC") only checked the first device entry. On machines where
>> > > the BIOS populates fewer entries than p->ndev, the remaining all-zer=
o
>> > > entries are applied and tas2781_cali_preproc() divides by zero on
>> > > playback open.
>> > >
>> > > Accept CRC-less V1 data only if every expected entry is non-zero and
>> > > self-consistent (R0 * 1/R0 close to 1.0), otherwise reject it as
>> > > before.
>> > >
>> >
>> > ...
>> >
>> > >
>> > > +/*
>> > > + * V1 data without CRC is only trusted if every expected device has=
 a
>> > > + * populated, self-consistent entry: R0 (Q27) * 1/R0 (Q31) must be
>> > > + * close to 1.0 in Q58.
>> > > + */
>> >
>> > Just out of curiosity, where do Q27, Q31, Q58 come from?
>> > I couldn't find anything about these.
>> >
>> >
>>
>> I think it would be good to be able to see which commits were generated
>> by an LLM. This way, people wouldn't have to scour the internet trying
>> to verify hallucinations. Furthermore, it would be possible to see what
>> percentage of the kernel consists of public domain/LLM code.
>>
>> Best regards,
>> Gergo
