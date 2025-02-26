Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FC02192FF
	for <regressions@lists.linux.dev>; Wed, 26 Feb 2025 14:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740579277; cv=none; b=PvLU2CfFVqyoFFZ7ndWfuQBF9X0H2U+QChxfBXVSVqbaX8uYq1uFVP/5kvHDMLXaus/JwnoZylybpUT/aG8rG5STB7IUF2SPvKnae1iNmyahNdKW/6+KGBrFoNb4WFZ8HpOtdHoCNjEb9S2AKK4I4u6Dah0ite0aODq+0B1dWUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740579277; c=relaxed/simple;
	bh=LX2XSUIj2bqmtXIFEbc/wRFdKzgVtWlqUTiSBuY3DCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kq0hYMkB3mODo8OTOpcGNp5BoQAuUjRfHECtw53szMRhWlH/Ems4PkW+UpjHx8JdWQvxIqQDA3/+2jKNrVwa6zYKb1AJBHowuugk3X5OEeCXeMmwZ5Tf2mQi+21KishM5cvRPeTM9TVAYor3pnAgmtWsJme86opGMb//+gqyy9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KACvSZvB; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KACvSZvB"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e5ddd781316so5628536276.2
        for <regressions@lists.linux.dev>; Wed, 26 Feb 2025 06:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740579275; x=1741184075; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LX2XSUIj2bqmtXIFEbc/wRFdKzgVtWlqUTiSBuY3DCk=;
        b=KACvSZvBMQGnl84zNIkyoPEcW7WVo/AtBu/xHoZXmUeBzp1T/CfyOt+PxYNhA3xfRB
         1dx6vnAlhZkDIQ96Fsb5xl+i9IGy77Guwk0T0De9BlmwurrJupjKVrY2jPu0gOHw/6PA
         MMV9mzEQcfbGi1nW0mENI0qsowXmVoDCxpPwGbpfIroxUyaiVins8kskazBP+0B/HO6p
         B5LsbeecAtZ5iOUckA93tjbiCQXp0k0x4BDQ72pWZTaORHWQ+ZR9Ai374KuCIdN2hnIR
         YEI/5x0OrTcsCTsWZp1U8cQ1waZbzSKGkYo1QvdVMB/XaDY0Y9q5jxnUBJ6HxAOXz/e7
         q6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740579275; x=1741184075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LX2XSUIj2bqmtXIFEbc/wRFdKzgVtWlqUTiSBuY3DCk=;
        b=blzSTO8TzLTkiUQfKskewPT0pxnYdRgZdXAZ9ij5DZ03X2YTTuliECAIn+Y271OLfo
         id64ojyrgPqXNChUtwkJzL0zJtRnNt9UVlrI6bYUwgcp5WxMfoXSOjIomwdNXSkyE1H2
         05zHHezj2wqozTZSagSzqvq2P/hrDGjzzPaLLyNOPA9jXQWuMds48dyo/R68D7ivgpeX
         ytqsBgmXLHcZKVDI8ifPZYBPOSxjhGRoN9gmpBKpIQNZQIHEEGGJZmZ3SvKg5qttM8H0
         /L8AcKxO1ulpRRCVkSCt6p7WzHAxv17W4UrpLdHXpIfm2tqSALMk7jRVgK1sXG41kixa
         +gHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGEZVHNvUyAzXK+E2nxmIruVYUb17rG8+s1u3RosX8ld216gz9OyzShhKyFN2nGsSDXsa2w82tm3l5PA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrG4R2e2j5zpZpUaVyoQjWm2t1kTJJIR4osd47d8W731PUldbv
	e9g0/wRHbqLcQ/m/APGT/c25ONftlQLctDGRsvKIy5y1LVr0d/5OF/29OiRGm/q27yrOoLKAvJI
	354T0R4f4urePeDN/eJkdT/+CrYE1+IgMasfwcA==
X-Gm-Gg: ASbGncsJX1hljONlnoX7e2RYYgXCkd7xkgUWH8qZ2ViAQgRfn/fyZd1s9plHOqLTG4b
	RqCpY6mkAv3/dkLSytHRfKpJ7WpMDLvHdU6A7h2rC0WcdMgvKajcyLBL1KvezmNFll1BQHbusm0
	ngdwKxVaKfjIJLgjdfgp9aVsmMObF8dZSgpuhg
X-Google-Smtp-Source: AGHT+IEX4wu5j82nOLm5VM0kOISrbX4gSyb4L+WcDmjP1Qsdn6b72+IZdtPz57qGabsSe+EpTHSUCTQhwXW8UuTpO28=
X-Received: by 2002:a05:6902:2607:b0:e5d:fd9c:f4d with SMTP id
 3f1490d57ef6-e5e8afc4b41mr15466365276.11.1740579275247; Wed, 26 Feb 2025
 06:14:35 -0800 (PST)
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
In-Reply-To: <Z78bUPN7kdSnbIjW@black.fi.intel.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 26 Feb 2025 15:14:24 +0100
X-Gm-Features: AWEUYZnbMeCHev03p9RWQPC8yVSoQaBwao4RL0MRMqRWnB_wlBGnSpwb4oA7_tQ
Message-ID: <CACMJSevxA8pC2NTQq3jcKCog+o02Y07gVgQydo19YjC9+5Gs6Q@mail.gmail.com>
Subject: Re: Linux logs new warning `gpio gpiochip0: gpiochip_add_data_with_key:
 get_direction failed: -22`
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, brgl@bgdev.pl, 
	Paul Menzel <pmenzel@molgen.mpg.de>, linux-gpio@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Feb 2025 at 14:47, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Feb 26, 2025 at 03:37:47PM +0200, Andy Shevchenko wrote:
> > On Tue, Feb 25, 2025 at 10:25:00PM +0100, Linus Walleij wrote:
> > > On Mon, Feb 24, 2025 at 9:51=E2=80=AFAM <brgl@bgdev.pl> wrote:
> > >
> > > > In any case: Linus: what should be our policy here? There are some =
pinctrl
> > > > drivers which return EINVAL if the pin in question is not in GPIO m=
ode. I don't
> > > > think this is an error. Returning errors should be reserved for rea=
d failures
> > > > and so on. Are you fine with changing the logic here to explicitly =
default to
> > > > INPUT as until recently all errors would be interpreted as such any=
way?
> > >
> > > Oh hm I guess. There was no defined semantic until now anyway. Maybe
> > > Andy has something to say about it though, it's very much his pin con=
troller.
> >
> > Driver is doing correct things. If you want to be pedantic, we need to =
return
> > all possible pin states (which are currently absent from GPIO get_direc=
tion()
> > perspective) and even though it's not possible to tell from the pin mux=
er
> > p.o.v. If function is I2C, it's open-drain, if some other, it may be co=
mpletely
> > different, but pin muxer might only guesstimate the state of the partic=
ular
> > function is and I do not think guesstimation is a right approach.
> >
> > We may use the specific error code, though. and document that semantics=
.
>
> Brief looking at the error descriptions and the practical use the best (a=
nd
> unique enough) choice may be EBADSLT.
>

In any case, I proposed to revert to the previous behavior in
gpiochip_add_data() in my follow-up series so the issue should soon go
away.

Bart
