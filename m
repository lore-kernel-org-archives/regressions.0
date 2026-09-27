Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480D02EEE92
	for <regressions@lists.linux.dev>; Sun, 27 Sep 2026 22:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790549448; cv=pass; b=d4N1D1hIlG2IXSWm4ubbIsoVmhByDWpaQ1Oig9vBTPYIUukgg/3wlVEIdRR8onNR48mV/KhCbZF0Hw44c7Nztfk5TeIQe6lIobuKcqypdAVwlcNq0Ss04r+9nLnTNV/8iTIpxb+3FsiRblKzgfKqvYv3qY6f6ZEImcxuyAHUldo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790549448; c=relaxed/simple;
	bh=Ifx1yTX0L1801X3uiipDGm66k2wMyQhOYEC1lY1zW3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GEuvnU84vGmv7GlDFpe1KRjV4fPXMT9pRm1kPU2OKbI2VhQ3p5jJchJqljF19eo6RbIP7OsLSlBCyWx6n9+aWJ7jc1vPjmTconmYZHM5BlG53XS8FpAgxcEPmDwz/IZYK+WXDPD0gEiOMljDC0ZZHvPN0gUrv6Nk98jVv0KeUxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=I4Qg4vl8; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="I4Qg4vl8"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2dc50c6edfso89670066b.1
        for <regressions@lists.linux.dev>; Sun, 27 Sep 2026 15:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790549444; cv=none;
        d=google.com; s=arc-20260327;
        b=p+V2Jq7Ba87t3o8yLskX3kddESGU6XEQsKxNy+pPupkMIyR5SGrDcs9cGWYSMRQmEt
         zezp+tR/Yy6Gec4d5Ni4rFGWFwfUmKtjqqs0CxVwQcm3amP6+lTceYJTmgA7qG6LYrEx
         PDDqKL3XvbYHK7uWcYWeOWVdcX1z4wV8W5r4SMWcI7IOGz7RqF+I7TWxjEKUZjM3Tfwa
         hzN2sOLDDWu9gyaViYwwBqsAvyExh1PXlZIFLq73VvNOGlYo2pgHZEoa1IGGMnq1uLOj
         rEAplWW24VZao0QL7XhTVnv3x1tAUa2Mz2mZEAQm2R6w/BRylE5iSDIGHoAa6iu59Cj4
         DvtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ifx1yTX0L1801X3uiipDGm66k2wMyQhOYEC1lY1zW3Q=;
        fh=Lbap4FKNERTbvWePlsOdix7Uf+YzDtdvx/a7n+YW4aY=;
        b=JSuKj9b6ccnXkPPvH168MrDRUNWhHQErstgg5fh2MPl8DSbWHXhp0BwsHS6nxeJSbu
         PMBbfQC/+sGabjeXiJv/+/IikAYx5o7aL/LhUHtpq4es1Nelt8AyeW61IE7DKxnrXLQ4
         xLXfTxXdSCXslISX8N79KLPZwOCt+1yzz40LauXXcoPqHeOtnGsHUGUOaFbXZlRaGVeD
         PHw8J1zKCdVXs7UhZScnEms283uWj0k8Xf+Ff1oj/hHWsMLq5Qg0rqUpoLZ71E2weLiD
         wzwrmtpPx9Z8EAEk7k16C8LBiU64Kc4m8aHQGgxye/1PxH1CY0DGYsyVgYmpk99dynXQ
         h22g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1790549444; x=1791154244; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ifx1yTX0L1801X3uiipDGm66k2wMyQhOYEC1lY1zW3Q=;
        b=I4Qg4vl8MeZEfQBOvsinuDVhzRtNFCviswMeRfSwnSKe/7f6/ozLV0oBYmDNlFDC/r
         0GuXKlSxTa3RkHkrZdOTgSfM9fmtZ3zyI1DmnlcBdxLZ16Yg4dwc+ZuDg/Jk+NMFhrjW
         OXhmYGiuuAenuT2Gtlhb3kK61237+6+xKPl9cPABByNKqZKuhIGWM7kI34UoyG8+yf6c
         AASf4mX9ProBGwNYTfzeUWdgUKovtbPLYMYIH56rq8dHLMtERYlpSFC/QnpgLz23xwNE
         EGtnw4RkqCl44a+ntJ+vOylD+0VZ+FevkqmWiHMzi+eGQ6x867lm6ywkIIMy915koDsf
         RX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790549444; x=1791154244;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ifx1yTX0L1801X3uiipDGm66k2wMyQhOYEC1lY1zW3Q=;
        b=dM8k8UcPZNAkSHn9KQ9k2BrYGJVmLVO3ziH2RBuXZsulEv2lAASn/MPvDe/2/fFkbZ
         R5Z/+1bts4MniererO5XSYpoGX4bBoUTt0waLVnwTR9YGSD/jzF2I9J/yQ1T3+ZkeqAs
         k5ayQ50SzQiY0Fayb7QZrXRs0cozbb8OVcx/PkzfO2GCxGQyXpTpuPPUvCB+0nOHq+FX
         LdUPhKeM05Xn4KnBMsL1kXF55vySNpnthYxZgfar6spNOfUy/uqgZBG1sVrLmF97/fyO
         joq5fC8scO/c3w3q3UFO2xTtO1+Mb2J1T9rmuIEcFsJlSk6hKXOOc/j6eRomv7/hpDYd
         2ZWw==
X-Forwarded-Encrypted: i=1; AKwUvBxaJIW1gVGByL784LvOItHeg/MmuEMMNcuylAgzkjIsxwQa/2rFik8+Tfqr/INo0tj/GDzWI766/eNylw==@lists.linux.dev
X-Gm-Message-State: AFuF++nVKXIdcAbKxsDP6rAhrdPP96yz/xoW1bzZDJS7SI4ze7TxWqyr
	eWaL4ju3lM555RtXdIXqcZUZnedW2qi7PQXooDBvOFQJ8O7FfE/UYuI5t7sXQhgVYes4rQ7gwLQ
	SMa2ttXpUXgBzAktJn9HOlmgu0nV48Z5q2ZtaFFCIm/FGtLs=
X-Gm-Gg: AYBFou1A3NPK++NQ/kYzozmA/1E78a91WjWtXu7uJTS5mdV2U5vgjbYurrPQjgOEl/a
	9RMFCh7JBJZc7bfhiUGm7K9WypkN3DHe9dqDvP5SaQ/ziZGdbRcxs2+NfPhhGIo0ofpC8XWXyRn
	TVk3CkT0bIzporeGRcYPINrM5HWAL+BiUwsGmJdUwB5L1YwpBlJ6gu52V74j7kcGV47EZp8L/oR
	ZIL9lq2pfZiv22xRZN78O0aDpYOJ3Hx3TWaVVTi6AzoB6mkMDnaYtTnfg27hYl5rif5/QT/acQo
	Y7K8klBhM6JYwE1Gb1/r5GNeGC1G7OZs44QTsz7XmGh8jMbgOniDi0tZSXtwrgqvsZAZM3SApJg
	/2DIrrrPJHzBHdKPJRtnXGOFrpgTH2VYNVBmyaSviL8TR0dE08WTXkGGJI0340X7U3FkzqzS6kb
	Elh+R9fssLXK5SO1w=
X-Received: by 2002:a17:907:7b8c:b0:c2d:c33d:a9d4 with SMTP id
 a640c23a62f3a-c2dc33dada2mr233426266b.10.1790549444303; Sun, 27 Sep 2026
 15:50:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANBVYRCL=8QdLxGg4S6qrahrFtwJxhv-aSGpW7-1S=+iOe4ZGA@mail.gmail.com>
 <2026-09-27-daily-reply-0001-re-audient-evo4-mixer-put-errors@kernel.org>
In-Reply-To: <2026-09-27-daily-reply-0001-re-audient-evo4-mixer-put-errors@kernel.org>
From: Faaris Ansari <faarisansari@googlemail.com>
Date: Sun, 27 Sep 2026 23:50:33 +0100
X-Gm-Features: AclHuK-yRwoG3EWnoCvNFcLc3JE7YWNDmy2zbYPYkBL_ZtPL-UpCyDcrqmqvJWY
Message-ID: <CANBVYRAr_ShKGmrt2NoqsDsDEbTXa5DWJbq2oP6wKLWJQpLRWw@mail.gmail.com>
Subject: Re: [REGRESSION] Audient EVO4 hardware volume control now requires quirk
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	linux-sound@vger.kernel.org, 
	=?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

It seems you're right. Reverting that change has fixed the volume
control with my interface - I made sure to remove the quirk flags
whilst testing.

What are the next steps here? Is there a problem with that patch, or
do we need to add a quirk for the EVO4 in the kernel?

Faaris

On Sun, 27 Sept 2026 at 15:27, Sasha Levin <sashal@kernel.org> wrote:
>
> > I was able to work around the issue by adding extra modprobe config to
> > my system, specifically the below:
> >
> > options snd_usb_audio quirk_flags=2708:0006:ignore_ctl_error
> >
> > Does this quirk need to be added to the snd_usb_audio module or is
> > there an underlying fix somewhere else?
>
> The likely cause is 87a6f2fa6e6c ("ALSA: usb-audio: Propagate write errors
> in generic mixer put callbacks"). It is in 7.2 and was backported to 6.18.53
> and 6.12.111. Before it, a failed SET_CUR in the mixer put callbacks was
> ignored and userspace saw success. Now the error is returned unless
> ignore_ctl_error is set, which is exactly what your workaround does. It is
> the only functional change to sound/usb/mixer.c between 7.1.13 and 7.2.5.
>
> Could you confirm by reverting just that commit on 7.2.y or 6.18.y and
> testing without the quirk_flags option?
>
> --
> Thanks,
> Sasha
