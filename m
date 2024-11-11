Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E042D19E7ED
	for <regressions@lists.linux.dev>; Mon, 11 Nov 2024 13:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731332551; cv=none; b=BKtelumaG3m1sVDFra25u7aazNF9bgh0GsPF8Rt5TmUjo5QR4RIOlgp+uapiDEODbr/PiSS49698BxIow/sG0CXAM7Onowu7NlU3c4VD7I1kMQ/nZLRWZ73+71zBRbq7LmAHZn6VM6kTA7yWV3f4zNh/gOfmy8SpMOziCG9uLtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731332551; c=relaxed/simple;
	bh=TOVU60syZuDHp0JNrqJ7EWmh83zOgByqn90mAhZeuHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQzhPGxew/q7/ZG0VqERPjF7ckYfGas4bLYoFOlM7T31qRrmRQYHMmhDHE58YSXi+jvGiKtUZWjmpVtliGoRTWU5OTfFdPoyGhqZYYGulqQE6xITy8G4Q1SRpn9tiuHoYr5B+aO2KEdDiq03cK/Sa1D5zFYj/m+okf/WyJSU2rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9iRNEFQ; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9iRNEFQ"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ea053b5929so34119697b3.0
        for <regressions@lists.linux.dev>; Mon, 11 Nov 2024 05:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731332549; x=1731937349; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOVU60syZuDHp0JNrqJ7EWmh83zOgByqn90mAhZeuHI=;
        b=A9iRNEFQKtPEXHIqzTfnnmvW617MTTqntrWvcPpL5Y1bOCYDsk+JIm62SChcVM4JYG
         G79lrwzjIYsplZFBas/Oafb0KBW8HRx+Tqn6dJ0BkwB9JpSott5oJeBu8zTJGntvUcvQ
         dEIlMdPdQqDvXtXR/t+Oud0bYzS67nocAoD30infB326HHt7+EI1F0UizmXK9BmtGhLn
         Ml4TLSCDNJJ/MMV2W0ZJcIgCuquZPLOrjkFGRlg7/fAXLbLcL4XE44Vr1csNygOG/eGe
         J5/hlp/U/SRIMrQRPebGVf+VbMFJmoMWqUdC/OCVCD3YXOLw0cGTMGPWVEFQQDdGFcCi
         O0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731332549; x=1731937349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOVU60syZuDHp0JNrqJ7EWmh83zOgByqn90mAhZeuHI=;
        b=AhfnTR45Q8ufT7lUOF/zOFBeYGyq1ZqPtviVB1dWlUzKT8M7scUqoO5uITRoM5vJRY
         RLc2ORudMK4Og+zS5FCU2vDgV6OaavCGzQllqxO1KJ2pqQ6Om7AwKdXbBjZult6XvZyJ
         VZX1XrPdcFmeSUcCqwPz1hWMZHZJI1yXW4fFFlH1TGp45TtzEEV2IWix+uUVLlcuPHaN
         +aCH1n6djql9ps20f3jdA/4pj+nBIvYT2xssRG9+/G5OMuoqeJK1p6oghD77YSOZJIM6
         KRsCT14PPEr7wkxE01seK96A7rV/Oe/ZpFVb8Nw7NfkM8WGNtxsaXv8CH/Zvy2S9/6E1
         ZQ6w==
X-Forwarded-Encrypted: i=1; AJvYcCVSfEnotZdrpeOwO3GJZueumRptIHXdfthYBVkPL0pqDNSMJxjFx5ptF4FtsScra3+gbzT9wK2P6xWOVw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyN/98ep6RHS4vi2nOOkW1ZVCP4RADD8qyCUHSLimwvyhMVeIb
	RhVF5KemDO6pGzN7iG/+YL+vxb6H91ZWor/hRfulWMguCwuQ319dVpljYDk+N0vz8nDLSKlive0
	rBfq3niEOdvvk6jvOiOHkaFzk/70=
X-Google-Smtp-Source: AGHT+IEvkAyFNa0HaZCEuLW8IXvn4B7Ev3wlVuFC2U6An17+S2XLaxjQuC63dbErNk+gcYBt8OjC0lWJedOAoiUZG6A=
X-Received: by 2002:a05:690c:c96:b0:6ea:4b85:7a13 with SMTP id
 00721157ae682-6eaddd861d2mr115856877b3.3.1731332548770; Mon, 11 Nov 2024
 05:42:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220621104617.8817-1-tzimmermann@suse.de> <CAEXMXLR55DziAMbv_+2hmLeH-jP96pmit6nhs6siB22cpQFr9w@mail.gmail.com>
 <d2562174-eebe-4462-9a9a-03936b3bcf89@leemhuis.info> <b4d28b98-a85c-4095-9c1b-8ebdfa13861c@suse.de>
In-Reply-To: <b4d28b98-a85c-4095-9c1b-8ebdfa13861c@suse.de>
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Mon, 11 Nov 2024 13:42:16 +0000
Message-ID: <CAEXMXLQEJPVPyqLpH6C7R6iqhhKBpdNS9QeESbEdcmxB70goSA@mail.gmail.com>
Subject: Re: drm/fbdev-dma: regression
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, dri-devel@lists.freedesktop.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux Framebuffer <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 1:22=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> The patch in question changes the whole memory management of the
> affected code. It's also noteworthy that most of it has been reworked
> for the upcoming v6.12. Maybe this already fixed the problem. Kernel
> v6.11-rc7 added commit 5a498d4d06d6 ("drm/fbdev-dma: Only install
> deferred I/O if necessary"), which possibly fixes the problem as well.
>
> But there's no explicit fix for this problem and I have not seen any
> other related reports. Any further information is welcome.

Issue was present since 5ab91447aa13b8b98bc11f5326f33500b0ee2c48 and
tested until 6.12-rc3.
Is there any suggestion on how to dig down?

Thanks
