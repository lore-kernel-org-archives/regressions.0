Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F2EB665
	for <regressions@lists.linux.dev>; Sat, 26 Oct 2024 00:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729902208; cv=none; b=XPNCIT/bG93K8eTRI6TeFuWBI62BYJnuLd4ravoE3X6i3H0jvJ1upGyr6ooyG6PwIVKWd0bYjUGIZcdOzDX2EvSrr5smIWch1aeaBjEMPwmA66BSmUEddG3y1H9zzMKQ0FPMoXyGra0jLmb1tsIFqyi0EkcJeOOQGqmAC4CRThA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729902208; c=relaxed/simple;
	bh=kHhUUsS7acJboSqyOaR4b0wxr2z4CQuptpcP3cOxPOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a1MhVMZcrIzYMi/YsF4YQiB8a3u+7VOPz4tY++oaLNLdo+eHjOPSZnGmzO3m/jSmgh07NNoTMpIxqX0qwHBQnKrQnJS8dADvS40DaCQF1dIU52zejRy9Pu7F4H9eSFfEg5AeKqJOUdcFxMhSzRmyhNJAbuipW64xVWlmfGtHSdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=utexas.edu; spf=pass smtp.mailfrom=utexas.edu; dkim=pass (2048-bit key) header.d=utexas.edu header.i=@utexas.edu header.b=Y9bESGcW; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=utexas.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=utexas.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=utexas.edu header.i=@utexas.edu header.b="Y9bESGcW"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e3686088c3so1899802a91.0
        for <regressions@lists.linux.dev>; Fri, 25 Oct 2024 17:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=utexas.edu; s=google; t=1729902205; x=1730507005; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kHhUUsS7acJboSqyOaR4b0wxr2z4CQuptpcP3cOxPOA=;
        b=Y9bESGcWeZ5ZgBPDtWztWdrh5iThKjZBEeGEwOL0iWtDbRDpsu8e0DZOFMO7ZAXA65
         8oRCZKsCPuuU8JHLQqtqriIFDUr0FlS+4ha3IY2IUMtlQaPqIs/257isWQ6mH7qWTTsM
         Pwt+AmcwxGgi7m73zvLYVPfwKmnSM5FyklzGesz3a7B7f/15QTAIzlZKOw7NuTxwrFeg
         XjsStSbkGbiJ9t4WC/Vy9SVTv+uI4dPd1sjcVW9GJo9b1AieEjLlqctungE36pT1KKGv
         Nqo66hXRZidZrNe43ymLrTTEbdTu1RnE5EPr1GUFtf2DT+J+6q5GjZ+XRQKUpvUgmaht
         HEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729902205; x=1730507005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHhUUsS7acJboSqyOaR4b0wxr2z4CQuptpcP3cOxPOA=;
        b=l2vsdgVjjtW36Uajxg25kaXIgMiv7KLAg10riBwdXSkZ8ig/7LxIOeOPeMYH6JzTNp
         /m/8PpxlttPnQq/wLDCVOyZPgUDHCAeJLg3vVxxNiMmQhNVeF5OfoTiJJ/HU9H/ZoG2n
         SV8WXdzUkEYSdB3K+kUS1jiJ8gvCxBHk81ne9/ZKgVdEUXzmuViU3J9W1NU/JDmNyY2S
         09z+Vs4ayKg4W/GyQvMQZDoVGAD2xzyzM24tc8dx6aJYQWqWvqXBFGze4P7yHHPJ4BrL
         XE+YtLkTpEqljlwWHOzOk4/8ubqL+6Wb7sK2O+lz39yWCKh0aUKGwGpxbFa1e6C1+gaz
         NBNA==
X-Forwarded-Encrypted: i=1; AJvYcCUe5VIkkAp77UlD/Vx+NSqHSfcUW/6M3SsMQhVtCW0TslaC1fOhk12y3wMIkVpobd4YT9aKIVIK/LYFLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVcc7FVmGk98ehNM8GNM6oROerNGQD1zRAz7uRKS4bPqKyKW8h
	no3BhcZRv/IHyPvMregm8j7CSWYAe9036gGmFS4MPls3tu88mFiDLrpVqDBf40C/825fjigm9lx
	f5gnPbxPAU/AH74HA3GtjWre0qXuGG3Uf0Oo2zg==
X-Google-Smtp-Source: AGHT+IF+e3IRvBmjVpfJ/vxYU8vFlrWmYswc5pBL+hm7q7VnV/9ycdn4zyZKiMu8ons8xjFulaoKdAI1FVJ/t9ECa/c=
X-Received: by 2002:a17:90b:3849:b0:2e0:ab57:51ec with SMTP id
 98e67ed59e1d1-2e8f11a82c9mr1465674a91.30.1729902205319; Fri, 25 Oct 2024
 17:23:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEkK70Tke7UxMEEKgRLMntSYeMqiv0PC8st72VYnBVQD-KcqVw@mail.gmail.com>
 <2024101613-giggling-ceremony-aae7@gregkh> <433b8579-e181-40e6-9eac-815d73993b23@leemhuis.info>
 <87bjzktncb.wl-tiwai@suse.de> <CAEkK70TAk26HFgrz4ZS0jz4T2Eu3LWcG-JD1Ov_2ffMp66oO-g@mail.gmail.com>
 <87cyjzrutw.wl-tiwai@suse.de> <CAEkK70T7NBRA1dZHBwAC7mNeXPo-dby4c7Nn=SYg0vzeHHt-1A@mail.gmail.com>
 <87ttd8jyu3.wl-tiwai@suse.de> <CAEkK70RAWRjRp6_=bSrecSXXMfnepC2P2YriaHUqicv5x5wJWw@mail.gmail.com>
 <87h697jl6c.wl-tiwai@suse.de> <CAEkK70TWL_me58QZXeJSq+=Ry3jA+CgZJttsgAPz1wP7ywqj6A@mail.gmail.com>
 <87ed4akd2a.wl-tiwai@suse.de> <87bjzekcva.wl-tiwai@suse.de>
 <CAEkK70SgwaFNcxni2JUAfz7Ne9a_kdkdLRTOR53uhNzJkBQ3+A@mail.gmail.com>
 <877ca2j60l.wl-tiwai@suse.de> <43fe74e10d1d470e80dc2ae937bc1a43@realtek.com>
 <87ldyh6eyu.wl-tiwai@suse.de> <18d07dccef894f4cb87b78dd548c5bdd@realtek.com>
 <87h6956dgu.wl-tiwai@suse.de> <c47a3841cd554c678a0c5e517dd2ea77@realtek.com>
 <CAEkK70SojedmjbXB+a+g+Bys=VWCOpxzV5GkuMSkAgA-jR2FpA@mail.gmail.com> <87ldyctzwt.wl-tiwai@suse.de>
In-Reply-To: <87ldyctzwt.wl-tiwai@suse.de>
From: Dean Matthew Menezes <dean.menezes@utexas.edu>
Date: Fri, 25 Oct 2024 19:22:48 -0500
Message-ID: <CAEkK70RAek2Y-syVt3S+3Q-kiriO24e8qQGDTrqC-Xt4kHzbCA@mail.gmail.com>
Subject: Re: No sound on speakers X1 Carbon Gen 12
To: Takashi Iwai <tiwai@suse.de>
Cc: Kailang <kailang@realtek.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Linux Sound System <linux-sound@vger.kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

I get the same output: axiom /home/dean # hda-verb /dev/snd/hwC0D0
0x5a SET_COEF_INDEX 0x00
nid = 0x5a, verb = 0x500, param = 0x0
value = 0x0
axiom /home/dean # hda-verb /dev/snd/hwC0D0 0x5a GET_PROC_COEF 0x00
nid = 0x5a, verb = 0xc00, param = 0x0
value = 0x0

On Fri, 25 Oct 2024 at 02:16, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 25 Oct 2024 03:22:38 +0200,
> Dean Matthew Menezes wrote:
> >
> > I get the same values for both
> >
> > axiom /home/dean/linux-6.11.3/sound/pci/hda # hda-verb /dev/snd/hwC0D0
> > 0x5a SET_COEF_INDEX 0x00
> > nid = 0x5a, verb = 0x500, param = 0x0
> > value = 0x0
>
> Here OK, but...
>
> > axiom /home/dean/linux-6.11.3/sound/pci/hda # hda-verb /dev/snd/hwC0D0
> > 0x5a SET_PROC_COEF 0x00
>
> ... here run GET_PROC_COEF instead, i.e. to read the value.
>
>
> thanks,
>
> Takashi
