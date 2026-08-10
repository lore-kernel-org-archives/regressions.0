Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D445339875
	for <regressions@lists.linux.dev>; Mon, 10 Aug 2026 11:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361512; cv=pass; b=b4e7UeaCuZjOgxu1prkD6PzhEPGZRUqz651qtCh/Q8Pa41LCNZ/IXvOKMHHfKESdlhSA2Uf4ipm2Fx4wJ6CUC0UOz/9STuIOGxva6RyBYkj1Lvj+J5PY+pyguiQmKZFC8nC+UQER+oE171xpW98WdcgBcQcYuaTRVgQrZq8QyNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361512; c=relaxed/simple;
	bh=VD4tYRxxv8tbQ8hahRY/ysVT3PqfH9iPQBMxS91ejUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJTNePDi1kXBROx5Yw7mnBWrHylpM6Ef8ZDlFLiDDGWNNfzYvnsFYvP86netAH7dyVaMf3sJt2o0dBxj3C12g/NDecNv/ZGp1EwoMSWmY5ol9FIbjzPDY3prawkHeugB8fL2aRGU8bMsOw2JOHhGEhgprBf0NwmR7Q1dBbtXrxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvlnCPDC; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvlnCPDC"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c167c58f2so12948001cf.0
        for <regressions@lists.linux.dev>; Mon, 10 Aug 2026 04:31:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786361510; cv=none;
        d=google.com; s=arc-20260327;
        b=k8LsJBQ61wYVGagdGRV7PCGzmsKBoZaip0uW6ZPNd+9keJIoonIGb+dpx9hqb1AULf
         XTQXq0KL9xn8yfPLsOPGFDzhm8op93MkOIcIHEFeSOuN9THCglJQDwN6SzaqDf+khIi1
         vfFCUQ3XbvOrbXTkCSclaiBrqk/cV+BwkUQoodp5T1crrgZBrFKdKBEAcoxIsML/DyHl
         3yjdmbapzjK3xoHKOQa9NmSmKIIdaGCy05x0TGVWUiDWUdAg7rCG68e1swS/QlBiqLdp
         z+F4dUUaxYKGA50UxKhiq3rh/Bl/VW4cZ20/oaEwKf4r1OGRKUAww+i3Q/qPqxFqHfq1
         VzCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j/3JP7ohaN8UlxNVSWWMrfpGwIDHl+syjR7z/n9+ClA=;
        fh=yZ/2gJXHRIpyIaoulc+OSQk6Oa40/XbDjBUQxrKR9s0=;
        b=XQ7VnE6NB+maqmXPrJKDjWtmEpCMnh3u64YkAFTHq9/jK5m0CC7GJMF4jXvcnANWT2
         zpsM3IT2NzkAgUqyBfcNTqGv/t92Pyt41YkBX7n1VRmBkm4Tz6pGIVLgDKyN/PSJsOQw
         z3TTlHZXSrpu8LMNMakObw87EmhHRjnq7j5ElHzlW9tAQoVnpmLGcEMoGuyQc1Z+FhoG
         z6n4QoL0hKvy0CEXRVHfH94k4uC7j1yQUIWBtdHEy674CJ7kqF113anV/yCgxvZYMoOA
         22aV23e/O4X5t1JKVCBc+B6KCnYG+yuggwKxQ6k2knKf8jCAU7pwKo7WZvWkrEVpiNZs
         9NQg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786361510; x=1786966310; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j/3JP7ohaN8UlxNVSWWMrfpGwIDHl+syjR7z/n9+ClA=;
        b=RvlnCPDCBBMl/9G3sJVTv9dD4NoDy0p2l1wA5FqcJuSXcDBs0oYcEJufecJhG+EUNY
         55unnVLGi2eLESQoM6SXjD4gTBIhQyomMZQKb9AhnzqpeELhkfd6LQs9W2DjvaN3kte6
         +LEzL/H6vE4vcPCiY+dKmzODTdcwWZOWN+uktZA0C4lYhxXYYiTsZk1EbFPRH5MdPQaX
         FVWSSPMUY4Z7YBX3CJSvKjlOQj3aXrL0ACtI9QTGdie4WF7Azn4dEZKcEEMjKeR0vmVp
         NHeUccwl8SOPE4GEYqMD1fLXNlbdR78Z3DhNfLNjo0/vEe+/kwGx+ZE2xFi+2kbdTP7H
         GxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786361510; x=1786966310;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j/3JP7ohaN8UlxNVSWWMrfpGwIDHl+syjR7z/n9+ClA=;
        b=hA46X4cpINZ1Gpk0LP+u5jYjaXX1tPEBfFFOhEeKPCF8X9II6Pc77fyuFxpw3M76zy
         3SI2QPEs4Ne/aS6HiH5vQ+90A1LASQGbNyfhli+5FSCUZIyLwx/RkFKIupCa3XGEpWX0
         g0j94AJOFlOdAUQyzHw9VRjgzk06nalq4v1DV11w63aCD087XlyuuQl5mRs7mFwVk4e3
         QiOjWnpXXW3DI72j/X/fNlZXxlp4j6usdPEmmvyk+5Exscl3QovEnE8JrcyOOM8y6cU6
         FYV70jAfnCs0dqFr+OQrrclXh5ei1HGciD9HWLc+NpvcFE9onI//9urAHsTY7xSyYUUy
         JHRQ==
X-Forwarded-Encrypted: i=1; AHgh+Romelmv2MF96PS5Bq1hFDhvoPgVsRS/y5cqPmhk7ITJGMVWgII24aGbJjqc720dsQFrmlOSKwxphPutYw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/iO6i1WIJGvHuRx61SQAtQ1Vrqd9gLi9HindxjiMwD/iBe8fB
	ldoTYPoKpACK8v8ABYROHuFen559bOWDc/fg05aLSTBa8iBtCP7UXSVE+Eus9pQiiNFHOghNTyf
	XPjnFPHORG07Vs3+LhpshG2ytM5yibr8=
X-Gm-Gg: AR+sD12Lt1jGoz4pIWm+cIoMzzNUgUPHjvsQzZQlGzUdAomyLmpIi2VF8WuvVj6T2oQ
	4WmvQsXXTuT4dqGZh/46rtsxA+4iTauZ4+Zz6EVsPTy9ZUEaD4mAor06GW6Cn45A9+Ouwj50vWA
	5Re01iqivG+1HXGCS0WDyqqunCbMkg2LAGaSHXnV+4gSFbvIu7a2oCAMTEyMBLf0FyHVFGBmdcI
	tT2mXCmeuHYqQ8b8gVEcZz6qpw09g5Fm8itrBN2YOtSIM3g0py9WfFm0mokqNawzUjj/eAx9Ev8
	nnSMtMrtH7uG0MsjpRnJ8+Yw6hny+YVtutooM7r5hCo+dxTWldQedMeHOJ4MF15ERhWDrrrEGfM
	yxQ==
X-Received: by 2002:a05:622a:c8c:b0:51c:19af:6341 with SMTP id
 d75a77b69052e-52ce61d2d25mr472639051cf.36.1786361510049; Mon, 10 Aug 2026
 04:31:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEQ1D3kdA3mkQx7ei9Kq0gwky0qroJqCLKrkvgfkqgTbeu086A@mail.gmail.com>
 <871pcbg3wr.wl-tiwai@suse.de> <CAEQ1D3ky_7+g6_1J7ymxGUq4DNrPyx8OCsQ8Z42j2-XncMW8ZQ@mail.gmail.com>
 <87ecgbecy8.wl-tiwai@suse.de>
In-Reply-To: <87ecgbecy8.wl-tiwai@suse.de>
From: Gert Burger <gertburger@gmail.com>
Date: Mon, 10 Aug 2026 12:31:38 +0100
X-Gm-Features: AUfX_mwBcEerPa1GxdXbV8JSwvecJm4xDVw8D0pPk8f29GgNAY0mOIddW_sxjQM
Message-ID: <CAEQ1D3kmssJk=ZFiiV1wLUpC9BTnu7RNjuLopYDU0XpocVNNCQ@mail.gmail.com>
Subject: Re: [REGRESSION] snd-usb-audio: SteelSeries Arctis Nova 5 mixer
 controls disabled as sticky
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Aug 2026 at 11:54, Takashi Iwai <tiwai@suse.de> wrote:
>
> Good to hear.  Could you try the patch below?  I'm going to submit it
> in anyway, but it'd be appreciated if you can test it beforehand.
>
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 3330eb604911..618baa80d2b7 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2363,6 +2363,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
>                    QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
>         DEVICE_FLG(0x1038, 0x1294, /* SteelSeries Arctis Pro Wireless */
>                    QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
> +       DEVICE_FLG(0x1038, 0x2232, /* SteelSeries Arctis Nova 5 */
> +                  QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
>         DEVICE_FLG(0x1101, 0x0003, /* Audioengine D1 */
>                    QUIRK_FLAG_GET_SAMPLE_RATE),
>         DEVICE_FLG(0x12d1, 0x3a07, /* HUAWEI USB-C HEADSET */
> --
> 2.55.0
>

Sorry for the late reply,

it does work on the mainline package i have.

Regards
