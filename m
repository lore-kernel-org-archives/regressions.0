Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82753DFC74
	for <regressions@lists.linux.dev>; Thu,  9 Jul 2026 07:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783583697; cv=pass; b=Kh4jEN/QRGiGTZbP9VwGPiIZrtPRZSM0b3Owe6sdWMzSa9O5GJi/ZY59DOXSyvjJK8IFAU40782KgPEws57fxIFri5DfroJnIJUsaz7nZCQYymBOjeGXdHvzVABXRE4wpp6KwINV0MRFRE3gYDI31AwWS4QQN+w+GOccxGyy11s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783583697; c=relaxed/simple;
	bh=Ma9hZYGKmWu+c4bk/cBfQ6DPevX5CRoMpK8Z9/3dTjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohQBXQQXEaOmwTCpt7EvzitckgfAC4J3VhMUEnILiAAwZkn/9T6YHl0TWvtfwhTzVIhtObHVT0jr0xKH5asFziw0CyB7pkmx4NM/UIJEFVYcNz+yxFBv1zTIkiTC6ieGTwgnZn7DsdVQvvyhcC9ac4rahEpC5Epm3+1ZX1Yrids=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbTcVFZe; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbTcVFZe"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e6b5737bb2so542883a34.1
        for <regressions@lists.linux.dev>; Thu, 09 Jul 2026 00:54:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783583694; cv=none;
        d=google.com; s=arc-20260327;
        b=kroGSrAKM2wZqnNnp5MBQBddFgooEXJyNNLdMMNZfO8j+vEVOmojdpbRQW40d4YhSQ
         ggGpCbaFN94PflzN9i844Rjb+sBHEXSZbS13wfKW8wdUicleQGv2QewOaurH/r/3HSi6
         7w22BuvWbJQk6i8f2LV7wSBKLDe5/ENjzr0Ir+KO8mT8Kc6RqF8MvJogF7QWX/W+8y6U
         1WeoptyKiY2E1fXYJ4zI8kGx89ZS3Pisd0U+1oPMq8EJ/UF2iUn47bkGfZr2FCZUnnTY
         l9hRUHJIY4Czer1Ijq81lRYVc8wYGiyhB2Evs15uY4ZmQSINeUz4FPjp+S1kA+bzd7nn
         jDJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FX00PmUaBGhdxGjtEcp4ojX6h8tPyR/nQ8Y5AXR41uM=;
        fh=hDuoOeOoYT+q45eo6YCPXnFwR9li1wrAtkEQJpzDsTU=;
        b=EGh8MlXczWmWY6Abo5Vl2+gzOmcbQ85f2ZWYaaNJbCUPJ+BRFY8aHiiGSn9uL07hHO
         GzGEvMY1n7oznExfKEM8ANMogJQHFCmyNG9zA8Wi21mhsMdxTS62irMCrmkPTUtAs/IS
         4c+Vt1rqxywOqFobjqwb3cLS72610AHTvIrkG1eTkO6Z5SGLAjXb4kQk2BJqCPuifmez
         zvPm2+kpIFaP33PVA8l1BYCnsJjmXW+zs2pOjC/lPvYb3mkaH+4vYBXGnElMQBw7iMw8
         wD4+9xOXJ2WPm6hSH+vLhLna6sdrcQwco9CCPGAIm+LqIFBp4aMfJoE9Me6/xNBR/ZJK
         /ETA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783583694; x=1784188494; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FX00PmUaBGhdxGjtEcp4ojX6h8tPyR/nQ8Y5AXR41uM=;
        b=gbTcVFZebwhPAMXghjKG9SJBjfu3mbNDWme77l0sZgeZuaxgEBRjHEAU+s7Zqj+04r
         Kd2fxauOaUttMk4s+oCA4cZWwFPDZWA+Nys/LgTjI5O/lwDnk7g+D9ia3JmsC/BN1d5I
         9dgaHqsiyEJgM1HdkiS18XnEcrSRKT7X1QXxQcxQA/+P73e8nAAhzVtbdt+SGy3nEcqE
         obLik31pQz/DR9n44sp62tWxq+cMEZrFCU77aQOQ54XWB4XzLgMkZyimODEaVk0NjDK/
         oLJywy9KcnLt7sYZp3W5U3rJLQ0YQb7PymFfp53s55RpmJ3Q6YPwVSTFWHJ7sddhW1mr
         1goQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783583694; x=1784188494;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FX00PmUaBGhdxGjtEcp4ojX6h8tPyR/nQ8Y5AXR41uM=;
        b=G9CuqfgE6WxIR/RU4t1hu7LDzcYGT1ar3pOr+aADz9s6LKoZurx80GRjmEbB5KFsJ4
         JyPfwDw12KT0wwoBS0viemibD093Ia6DqZM6G+c39foGbgVIyD/RaqENbPes7rK0qp+a
         p1HZSkijD6VJZdnrxgeU3YKuBKrcYpAvaVBEDHM5L1sS7D0pB6Uh1SUoAg7nEUdkZn44
         fdoGMk5zQNvbTQgNWXXz79M5/xN/BnSFXdW+jKW/zZYMDVi8txqTt6J6U8fPoAyAPSHO
         MLmzNVmHM8rEZav/xZEPp5eG8BDRE1aljijjfiEnZHPuafMsd641PXEPjCY3NfflGEg9
         2eOw==
X-Forwarded-Encrypted: i=1; AFNElJ8Tad+qR8k5ZcwjiioW4MsDuD/8q0v7AP/kEQL+g5Xe3n0mMfO0H+RW9m/n/fg6z2LJt8ZmIg8tR1d3Lg==@lists.linux.dev
X-Gm-Message-State: AOJu0YweaWzEf84wVCsbI+APLTVjzAZ5/irUBQ5JrBgnRxjZlPgjrvRO
	ZiWVxCpS5CaReg7bk0iiDhrjsfT50gBwNyDIj7QmBxF0woWI3DGsBuWHtKfwc933GPOaAlxNxjQ
	C39IlpqOjymWyj3HcbbF7sTWBahskpeg=
X-Gm-Gg: AfdE7cmFITdfssp9G3ufjhx/S6WUSmGFn6cWl2zqKQJSNlvyOD7loHTeb5/URgFG3uf
	XoH1t/BaWRlELUoQfCk2Z35rqkI75OgzhaHgHBXW39LGCEXrJZt/nU4EF6qt4ekHb52k7hzq3lz
	0E2iNavYYVU8ZO4NS9nhUiYEr7+5qbvpOWqmy/H+BZHA0Lq5XV4aUut4b+bXGWov1PZy45cIOLC
	Kim9tEdM1O0zfO1WvW1ZlS4fPTbdyHUTKCoypaFKyR6Yd5DRmBdtQMKvmIcCEYlgDV/7P9V1es=
X-Received: by 2002:a05:6830:82a8:b0:7e9:c8e3:4473 with SMTP id
 46e09a7af769-7ebd02a39famr4920086a34.16.1783583694520; Thu, 09 Jul 2026
 00:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOdyq+qFaqCh=tK_wNnA64hv5pQuA1Y09ANxQ=xK8yR-t4mf9Q@mail.gmail.com>
 <4A4C8B42-D8BB-44D1-BE0B-CB5B4617F29E@sonarnerd.net> <87bjcg4nyh.wl-tiwai@suse.de>
In-Reply-To: <87bjcg4nyh.wl-tiwai@suse.de>
From: Salvador Blaya <tiniebla6@gmail.com>
Date: Thu, 9 Jul 2026 09:54:43 +0200
X-Gm-Features: AVVi8CdD75YylWj7sWl9WVm_PTcKz4gGLBge_a1BeaeSo4zknRXfOV8Ydp_BhoI
Message-ID: <CAOdyq+ook_mDq_5wc_Na182bLvxZ1YJUJEchJ6MochU17QecQA@mail.gmail.com>
Subject: Re: [REGRESSION] snd-usb-audio: commit da3a7efff64e ("ALSA:
 usb-audio: Update for native DSD support quirks") breaks DSD playback on
 Musical Fidelity M6s DAC (2772:0502), plays ~8.8% fast
To: Takashi Iwai <tiwai@suse.de>
Cc: Jussi Laako <jussi@sonarnerd.net>, alsa-devel@alsa-project.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Thank you - that approach would fit this case well, and the risks you
mention are fortunately minimal here:

- The M6s DAC has been discontinued for years and the defect was first
  reported to the vendor (via their Windows ASIO driver users) back in
  2018, with no firmware fix ever published. I have an inquiry open
  with Musical Fidelity about firmware and will report back if
  anything changes.

- The only other model possibly sharing this ID, the M6sR successor,
  exhibits the same defect per the Roon thread in my original report,
  so an empty entry for 2772:0502 cannot break a working device. The
  current MF models known to work with native DSD (M3x, M6x) already
  worked before the vendor flag was added, so they use different IDs.

I'm happy to test the patch on my unit - both that native DSD is no
longer offered (MPD falling back to dsd2pcm as on 6.12.y) and that
normal PCM playback is unaffected. Just let me know.

Best regards,

Salvador

El jue, 9 jul 2026 a las 9:33, Takashi Iwai (<tiwai@suse.de>) escribi=C3=B3=
:
>
> On Thu, 09 Jul 2026 00:28:00 +0200,
> Jussi Laako wrote:
> >
> > Hi,
> >
> > I don=E2=80=99t think we currently have exclusion method for devices wi=
th buggy firmware, which claim to support native DSD, but do it incorrectly=
. And reverting with device specific white-listing is not a good approach f=
or future maintenance. Having to device-specific white-list each new device=
 appearing on the market from the manufacturer just because some old device=
 is broken is not really a sustainable model.
>
> While I fully agree that white-listing all needed devices won't scale,
> blacklisting the broken device might work.  We can an empty quirk
> entry for 2772:0502 for skipping the vendor match, something like
> below, as an ad hoc fix.
>
> Though, this blindly assumes that there aren't so many broken devices,
> and there will be no firmware fix or another model that works with the
> same ID.  If a model is relatively new and/or the vendor often updates
> the firmware, such an entry can be risky, too.
>
>
> thanks,
>
> Takashi
>
> -- 8< --
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2463,6 +2463,8 @@ static const struct usb_audio_quirk_flags_table qui=
rk_flags_table[] =3D {
>                    QUIRK_FLAG_DSD_RAW),
>         DEVICE_FLG(0x2708, 0x0002, /* Audient iD14 */
>                    QUIRK_FLAG_IGNORE_CTL_ERROR),
> +       DEVICE_FLG(0x2772, 0x0502, /* Musical Fidelity M6s DAC */
> +                  0), /* for avoiding QUIRK_FLAG_DSD_RAW with vendor mat=
ch */
>         DEVICE_FLG(0x2912, 0x30c8, /* Audioengine D1 */
>                    QUIRK_FLAG_GET_SAMPLE_RATE),
>         DEVICE_FLG(0x2a70, 0x1881, /* OnePlus Technology (Shenzhen) Co., =
Ltd. BE02T */
