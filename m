Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ABF1A254E
	for <regressions@lists.linux.dev>; Fri, 14 Mar 2025 12:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741954786; cv=none; b=ftqHCNuyt784q7UGf3Mp7nExJK0IrbwTQT1uyM66JJaXjCy5TmGbl6Lwxch/nsGfmK3cpn9pNI3g+uRVRefIcmuuLtLDSqri8QymU9tVjHWOWXLKrJoijN9aHVDSHlXLfTU9N8R+P6D+giAdD15vVd7tvDTYyvaC9mBb50SVoiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741954786; c=relaxed/simple;
	bh=h1hX18KbVpNPmbTOpsFY+DB6uWmqCs+Nff2SCawByGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8FvKMym+EI2F/yoHFsJU3FZcR1Bg2gL3n+vdsGFCPQ622PZVzVfVKcIFR6y5sINF6z3q8c7wiULamSYTRuuBpsJQLnsmC6fhlPxoIrMzo4Pb3jWBQQ1JGQq3QDZMz2S5erQrwTMmRVrzprJkgYWg1EDB5WMfDdvfiB2WjbQnwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mDL5/H5s; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mDL5/H5s"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-543d8badc30so2348407e87.0
        for <regressions@lists.linux.dev>; Fri, 14 Mar 2025 05:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741954783; x=1742559583; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1hX18KbVpNPmbTOpsFY+DB6uWmqCs+Nff2SCawByGA=;
        b=mDL5/H5sfyPdSYPXuYWvNKQBrBgUeLjxuEqJjUAFN3YanvzvuJo0j4NCAH34ZWNAu3
         LdeH4QbSuv8NSlvzHQ2tP7sHpfathDwOz+qku7+IqU9G+KEyTg3c1gEaOSGsu0Q0Ucsd
         NWMreAdr7O/53QTbwpQHM4u/Weq0SXrdBFu2rNiyGKfSGL20pIfn86ONyfocXAaHlL92
         dCK3JXDoCBuaCXi5itc3NjRW0e51KGQCjbZdBBbwiQBvTlnl1KRJTcP/5jGoV+QDYEYr
         aEIPoX1eWVM9h+H6AlI4V2fa6FdnYh2EsXrDoHPL1Xrb4Vokq/BMyxpe+EPdjBKDzPV2
         ntWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741954783; x=1742559583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1hX18KbVpNPmbTOpsFY+DB6uWmqCs+Nff2SCawByGA=;
        b=qtViSLSHM8xMZydELLhCF6BW0iPo4at3/+gdMzj4e+U1eMReHwZKGygY1iasktYo67
         KzbZJLdEdLuJmdsDPoDRUcpIPcd4MTr9gvGbU1putz4sAUpE5TXISFIR60zb5tie1dYo
         tOeJt/eL6xtC8qGHeXwd+aBhswFHKMxJ/n1WBp+GfGbSElgi9o/sOEa26CueEeDle4pu
         4oZUTrKnvDlm7FOc+Cs9c2o465mT8K8dGPo/hTziiWVOCaYEdFljnFToOo2hzY/0Fwja
         W7wfEfbUF0wSuhFKnzZuxDOtu/Lkl4mdaD7QjUuVBUJ9lZO7ityLAOLEo7772aIs70wa
         7moQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsbBUGRsnYwg/ZAvv4HL5qsram5/63KE3sIdZrCr13MuRkT2wAZ6XP8HA6uNOPze1h+VnvCt9lzhZxeA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3Gyb3hXzd9qsEUcky0YgOGjkDZvA7Y+Ib98+1Cm+X2a0YLkok
	gEufs+ShS4TTUveV/pp+hDpFHgniM5kDkwPzd4ErRYGdyiJfHoheCUch4eD/gqTO7C3b3oY6xPy
	6O68Cok3YuDxUDQYMMNQbe80OulFCH6YCVKrynQ==
X-Gm-Gg: ASbGnctfUMlmNhf17NMeDWFyNAT9F1LEDgYGJg3Vq7DI/sSHcp7/gScRsYs3/QhOl4z
	lr8Nvwu6NSVAl2aJI8CfuBp4JFFfeGcodB/rBwKCxFKvh4qmUuZQJQoEBSydQnNXVH1fvAEIDFd
	EBVNVX40jOe/iv4wmUpSuN2mtRYG20R1xoIxW6nU33zKf6tkYPbFLIvLwMdQ==
X-Google-Smtp-Source: AGHT+IHUlazwgUqlZgFfrZNU11dRALAC2f4jB8FB+3YipRbXUqsYKKBJIph8mnoYZoKAXAmHTbx2wTkl6nphw9smOAw=
X-Received: by 2002:a05:6512:2387:b0:549:4e7b:dcf7 with SMTP id
 2adb3069b0e04-549c38f5976mr919503e87.3.1741954783089; Fri, 14 Mar 2025
 05:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9ded85ef-46f1-4682-aabd-531401b511e5@molgen.mpg.de>
 <CAMRc=McJpGMgaUDM2fHZUD7YMi2PBMcWhDWN8dU0MAr911BvXw@mail.gmail.com>
 <36cace3b-7419-409d-95a9-e7c45d335bef@molgen.mpg.de> <CAMRc=Mf-ObnFzau9OO1RvsdJ-pj4Tq2BSjVvCXkHgkK2t5DECQ@mail.gmail.com>
 <a8c9b81c-bc0d-4ed5-845e-ecbf5e341064@molgen.mpg.de> <CAMRc=MdNnJZBd=eCa5ggATmqH4EwsGW3K6OgcF=oQrkEj_5S_g@mail.gmail.com>
 <CACRpkdZbu=ii_Aq1rdNN_z+T0SBRpLEm-aoc-QnWW9OnA83+Vw@mail.gmail.com>
 <Z78ZK8Sh0cOhMEsH@black.fi.intel.com> <Z78bUPN7kdSnbIjW@black.fi.intel.com>
 <CACMJSevxA8pC2NTQq3jcKCog+o02Y07gVgQydo19YjC9+5Gs6Q@mail.gmail.com>
 <Z78jjr8LMa165CZP@smile.fi.intel.com> <dd9d62d5-54fc-4e7e-8508-1b8e22ac28d5@molgen.mpg.de>
In-Reply-To: <dd9d62d5-54fc-4e7e-8508-1b8e22ac28d5@molgen.mpg.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 14 Mar 2025 13:19:32 +0100
X-Gm-Features: AQ5f1Jpc8BQLbO5f_ziXu7q9Ni5SWD-3N0tS5a8gYVuR7dGbfwA8ldlQAZqteb0
Message-ID: <CAMRc=Mez_3F0NifXLb18_XNH+-Q7D47HVOrYNt37EWsO9z0zgg@mail.gmail.com>
Subject: Re: Linux logs new warning `gpio gpiochip0: gpiochip_add_data_with_key:
 get_direction failed: -22`
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	linux-pci@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 12:54=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.de=
> wrote:
> >>>
> >>> Brief looking at the error descriptions and the practical use the bes=
t (and
> >>> unique enough) choice may be EBADSLT.
> >>
> >> In any case, I proposed to revert to the previous behavior in
> >> gpiochip_add_data() in my follow-up series so the issue should soon go
> >> away.
> >
> > Yes, I noted. The above is a material to discuss. We can make that sema=
ntics
> > documented and strict and then one may filter out those errors if/when
> > required.
>
> I am still seeing this with 6.14.0-rc6-00022-gb7f94fcf5546. Do you know,
> if the reverts are going to be in the final 6.14 release?
>

linux-next should probably be a better point of reference. I'm about
to send out my PR to Linus so it'll be in 6.14-rc7 alright.

Bartosz
