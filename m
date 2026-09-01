Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F6735CBD7
	for <regressions@lists.linux.dev>; Tue,  1 Sep 2026 11:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262000; cv=pass; b=Lw0VP8dPHhKT9mLX5VYZhvIMKB7vjxRkkIJSD2Eqa9LYxdbzRFnBjthLiVCgE0mdxRk9zokvYQjV0tGdPezA2GFcP+mQccdo5ISwiXtEQfwQ2Fu+h2UM9kcSv4w3zQ7MuJ3RXhmRxybPqfSL8RIwmloDpAqCrEebNjjYq16hn4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262000; c=relaxed/simple;
	bh=giTslEtXGSQwPV9RRaIioNPE/e48tpcU8ObIsZM9aC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UStqJF73ESzPkpT0LLPGHqGXdcHMWeTSXfDKWRTCOyGyz2dSljlzMO5XqRYoMbQNeewWWW8HFGFtqrNCzWlQAEMbETledroNWwDTSDggeuxk8nP9S6Xp1Ks7GdJY/lXq/CPuEr78w9ovpE2aApG2QzTJryXJnuzi7FLEMLoAAAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OM+5XzUv; arc=pass smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OM+5XzUv"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9391252b5caso276183985a.3
        for <regressions@lists.linux.dev>; Tue, 01 Sep 2026 04:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788261998; cv=none;
        d=google.com; s=arc-20260327;
        b=qJ5jSHPUTHDSz+BPpEq3yuQHHnE/aR4Tcnkyrg8FsKDJHGEbmUzpUzdKLuuqTqg1MV
         N9FHqdsSuvM8iG6FI14D/jHkR3Vg77Q1A90jQ0VKZR13nz3DaQXILlGqComR8/4XrcXd
         h27+/yOM5jwX5yIwItPB4jAfkFHLgw41Mt9fKxekTNhyB6aENP8iEiwcgiIRyAtey+Z/
         DRh+zbfkwqs8U3GUxoLVug1hdPudQ0jtOy2JG7u2A/2QaI2SIaSNf0MhuocBrGDkdH4H
         djUmPbKhpvD3Tr3aohrJKb2YhtQP2bypYIWMxL2RjMFIJaHTzSPcG53BmClZY3BenVk+
         ZoDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=giTslEtXGSQwPV9RRaIioNPE/e48tpcU8ObIsZM9aC8=;
        fh=rEkCV8EfY3477UmDzRrmg7g1YjCrZEjx/q6fm02Z4TE=;
        b=aTxdvA1Rff1M6p1YWFyB8rpiQX/Pyu6GgQVgHBmIzgFCaVpkalo+I8bDa2sQmqbZHF
         5A6JIVm6v3E2yNqDDxCOq7OKtLoaUxCby0+KYALR61+X39Jv2orE/yW6fTICWBe1v7oW
         m/W4etUzw69ump5YyvSAwNHb2gD/L3UwSpndzPiuVjUWFfIJYdFnJSW8hmhCPUISsQX3
         xA2KOtvXkDcY0/bORVYMTYosTqrqzhPFOa/U1lptnL+MnhIrn0AsYaHzjYEKdJSKYtIU
         lwzwmoMTfyRBf5vwx6H5u0zfmz4wlgV150Ky7n8YApTJ9/jrAsYQaaSVCG6suLGzYt7e
         lIfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788261998; x=1788866798; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=giTslEtXGSQwPV9RRaIioNPE/e48tpcU8ObIsZM9aC8=;
        b=OM+5XzUvQKwxTII4JFCXo3IswstsVcXvm5me1mq148sDtPUYVVCDC/4ZkSleKeLVbO
         Sc6BKENy7Nmmb5OV3yDmOmOKK14p0Y/j1FfSBU6e0WoHjQlzf31SZW41jmg/XV7c63Gr
         E7w2YE0nj1U8w+Rk1dDevb/5wAILZHpmRopnbR9nNFVw/mR4+ioofpyOpfv1EFij4Mra
         RYy8HFfoyPnWeTT0HTU3wMvSNRwmDiaXqDWLnjFgJbl+2Jho0tNEOibBnMg7epigBRVy
         d/T6+SO2KRHFXb3KphEL1h2/BULWWPXBfp3erh1AC/iAvwRZ7MCBbYq3ETHKeoiT+5e5
         hDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261998; x=1788866798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=giTslEtXGSQwPV9RRaIioNPE/e48tpcU8ObIsZM9aC8=;
        b=Vjfro1zxxVwO0+1/ewQrykW8/V33deuQ8nl+6/HFfbDwOJtWYCGmi3wIB84hTCSjMF
         JRvjZ/tv/YmiW6uKm3UEZfVBmFOQJg9IfVNjrfshWzbEqtDLP37P6k8jtX6RmkgGMybE
         qlSMq/ukfPxMDigeFR8h2oRYv6vZd/osFon1LMTzIM35lx1fSlKKdVKmraTc6Zd1At7s
         eIf5V/TpqSehNAZtDQGQgtV7WONZC+zFM1Yp2rjZ/V/IRgzhJZglCFni7aBB+irdcvTH
         cQ3IL5FjgxhEtixZCL1nINAXFyLuRjwa1bX+o9xt3Z5JEEYcDqjGx2BnX5foD4TSJt2/
         iP7A==
X-Forwarded-Encrypted: i=1; AHgh+RpN4mJbMIz9T+alBOjfpVvreJ7eumHFgvAy4aFccBfEg5sZOddPzbSDpyDM4wxhCmlCl2ZqtlLw8fsUPw==@lists.linux.dev
X-Gm-Message-State: AFuF++nR13PZia31Y70RHz8wxQsX1F2ru2Sg9kC6xB5bKkBEsBzPDQyf
	UhjqdJkzcjcBMIKhpwJR0IP09f2h4sDCM4Sqiayb0fOGN1KqF7lSnInqik+DsEkUn5skOFgs6Vr
	Ggmw9kHj43hn2LBAS5hHrsjTAOYYoJAaBUMQ=
X-Gm-Gg: AR+sD11iiGJFD/jOGOFwwhQyEX96pvIX87P+goGARVWf3hHoeHYpAZaXiFcz0QDUvnD
	Chn/+r5n1mNpqtz0mWtniWft5GH9wEOOYILLkEvYbfR0Bx3XW0lgudITY3PgkEtsag2jd2brELL
	P0QtiGyoCXEkwzXL19l0nbtdNa2QwNWMnlTP1tN06bVOvcZPyyKgZUgQ7niiibSWlGmmM3wd2YY
	rm5IW04lRfcZ0sh/5zcLV++snbwJUj4vBcYUj0iSxdNBj4FKByGK2vjI/UFd8UF+UOopYuLH8Qx
	UJX7eXYDRpOGK2nR5PNeJYJzCk6oR+DJYIDRJs0I297z
X-Received: by 2002:a05:620a:440b:b0:939:5551:1e09 with SMTP id
 af79cd13be357-9395551236emr206040185a.29.1788261997538; Tue, 01 Sep 2026
 04:26:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANkdJ2VvJQSBzyOq=LgSW1=Z8-YiN_r9Py2iJ0UJDo55+dbfuA@mail.gmail.com>
 <83f89e11-b265-4d12-97c0-f158e0b5b82d@leemhuis.info>
In-Reply-To: <83f89e11-b265-4d12-97c0-f158e0b5b82d@leemhuis.info>
From: Robson Candido dos Santos Alves <robsonalves.us@gmail.com>
Date: Tue, 1 Sep 2026 08:26:00 -0300
X-Gm-Features: AcwNN1UAl4fHdpkC9IMZ4Sd1yE0VyhaIPoDKzGW1bUu8pkc_c8sFdn5XOcj-MY8
Message-ID: <CANkdJ2Xv-RrTGYt-YyBH4ShE+h05tj_J4ipw5s9X8UdLd1HnWA@mail.gmail.com>
Subject: Re: [REGRESSION] amdgpu: "pixel format with alpha exposed but blend
 mode not setup" warnings introduced in v7.3-rc1
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

Thank you for the quick check and for linking the fixing patch set!

Good to know the warning is safe to ignore. I will keep an eye on the
series and test it once it lands.

Best regards,
Robson

Em ter., 1 de set. de 2026 =C3=A0s 04:16, Thorsten Leemhuis
<regressions@leemhuis.info> escreveu:
>
> On 8/31/26 15:46, Robson Candido dos Santos Alves wrote:
> >
> > After updating from kernel v7.2.2 to v7.3-rc1, several DRM plane
> > warnings regarding unset blend modes for pixel formats with alpha
> > channels started appearing in dmesg during initialization.
> >
> > Good Version:
> > - Kernel: 7.2.2-070202-generic
> > - Display Core: v3.2.384
> > - Result: Driver initializes cleanly without plane/blend mode warnings.
> >
> > Bad Version:
> > - Kernel: 7.3.0-070300rc1-generic
> > - Display Core: v3.2.392
> > - Result: Driver emits the following warnings in dmesg:
> >
> > [drm] [PLANE:44:plane-0] pixel format with alpha exposed but blend
> > mode not setup. Please fix.
> Thx for the report. Not my area of expertise, but I guess that is caused
> by 9813e158d13d ("drm/drm_blend: allow blend mode property without
> PREMULTI") and will be fixed by the patch set "drm/atomic-state-helper:
> fixes for blend-mode-prop warning":
> https://lore.kernel.org/all/20260826104143.39077-1-mwen@igalia.com/
>
> That patches are afaics scheduled for inclusion in 7.4 -- but afaik the
> the warning is safe to ignore.
>
> Ciao, Thorsten
>
> #regzbot introduced: 9813e158d13d
>
