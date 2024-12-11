Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF35823FD22
	for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 12:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733921186; cv=none; b=L8TxnkHFYBAdVn/PxpsWcgW9xSljd+NAjME0CYC70kT6Z786NwQYgc3jFhJmPOt3S6NaB2yLNI7INNTggCxvYwYsD1F3xvMQTgEYQIqaQ08eUJeiiPbM6dOLW3WSYHHOY3bYSd9rL2dP3EPvRmtA1XcUj9qRB9yhktVSb8yNQbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733921186; c=relaxed/simple;
	bh=ljytafcL4yuL6A3mBTqsDzIsfHaoog36bhny0bY+VLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M1Q6qg5HNA4oi4Vt9s97d1I/Vqgx6HB7far7Vo2obKfGnSY4K5f+PjIyQurMFCbGh6BeVb7yUCMaCrPInWPJX6sxxZxKd1OYXkRgJ5Z4JpEtpuoH/TL4bHF+2wUSd6XfkuxA5ETeOX9RRYhJJ7tDtlJ3jsm/4aiLiEAONt7IJCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=M/YrYZUa; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="M/YrYZUa"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-300479ca5c6so37152401fa.3
        for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 04:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733921183; x=1734525983; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMRrLT8PBkUb9uwSo3UZOKSbeLIunajxVCGqM67QreU=;
        b=M/YrYZUawpD3IXPeJjOMeOcgMx0fae/7lHD2HBC7yLbf31qYhvL2NoP/4ech3Vwums
         IjrjzOB+CtpDvea8RhX/qX1HXJ5RxQNp2c0emSTsB2NLf5PZnScNu8BYrOwtdDUi1BH5
         UEkihtcLov5RoJDTWaRJfsfyWWaVP1t9QZxVFyTfFPd/PPZvUmsZvpuMOI2Fx6HKgHjv
         nxhZzPAh6HZlDnDCjKszuh+UqRN9XSCsDL0Wn+pZrrwQRF+yn/8W1H9dM1m3TLTZi1qi
         zGIpvqTAq0hpqBZfDdLFs16eRZr/7h20nqO5m8eDAr9b3lWyo311zaL7xI8/SQ2sDqdZ
         1cYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733921183; x=1734525983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMRrLT8PBkUb9uwSo3UZOKSbeLIunajxVCGqM67QreU=;
        b=p1S8+GzrdJk7wWqj6EZP7vFhflxNJJD19fYHu5Ls7ghrPh9Rn/FEfoQ1yyktBbwWpJ
         Gdb4XRcOUYR1s4Ea/TLDWr0GSBPnF5EeIFiIP6DtPKPN10Y+lsEV3uN0IL4KUJppIflD
         yz0LMG0vnJK2LDcIwhGGytgkEFxw3agAesTHyk+sR0T7ItqLpsf4q8NFi8kRdpRHMR4W
         MEZc8PfeHSGPO4AevoXCdRUnKXdMk6M24YdMK2TRPrHYO+52UTXmsGwoUu76Z0JI9M8m
         deXcloiKYImZFmY2GG1FrMiPM+Lyjl6MrprxKw7TTdKbu7aQujqczOE+P7Cd1zStKAo5
         hbKg==
X-Forwarded-Encrypted: i=1; AJvYcCUrSXY01uM0z1E6a0ClY80AmF8gKqjFuYVTGFpqm49glxYaQygA0dkI89tLT0nlfrsdPPCRKLWHV0iSAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzPIJBkNl0xBRUckyMDS1Mxa4Ou7joC+Grur1bWmMeIGdjfhEc
	DzNbpsle/4sq52Z1y+uKzRMkeP8WrktZGEarBS4cE0XVChhohnF2s+kL8fXh+jXaLxRSJFJxUuc
	TBAf5ZAj/XGNj27YrIO383WQzHicdpD8xRZMbuw==
X-Gm-Gg: ASbGncuO1tlEd3XRRf/sYnQoaAxmE+hPy4ReiCG7YrrPoQRjuw//rX/OcH+G6Izb/ej
	kRNUZ8WVrQUY6vL5NtBwu7SDTTnJcMZ3g2xU2X0GSUbVhkJC3pRPRh04nc4DmC3kTNMpEPA==
X-Google-Smtp-Source: AGHT+IGSGpq67S3KPhxv0QaGyYpi7Ds7VIRtelTKmN8kUlCb5EZQ5DwEZ8oJuL//LObkvog2EV/g3poagrgtfeFDHng=
X-Received: by 2002:a2e:9fcb:0:b0:302:2620:ec89 with SMTP id
 38308e7fff4ca-30240cfb673mr9672121fa.19.1733921182952; Wed, 11 Dec 2024
 04:46:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYsT34UkGFKxus63H6UVpYi5GRZkezT9MRLfAbM3f6ke0g@mail.gmail.com>
 <8dde5a62-4ce6-4954-86c9-54d961aed6df@stanley.mountain> <CA+G9fYv5gW1gByakU1yyQ__BoAKWkCcg=vGGyNep7+5p9_2uJA@mail.gmail.com>
 <bd95d7249ff94e31beb11b3f71a64e87@AcuMS.aculab.com>
In-Reply-To: <bd95d7249ff94e31beb11b3f71a64e87@AcuMS.aculab.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Dec 2024 13:46:11 +0100
Message-ID: <CAMRc=Mf8CmKs-_FddnLFU7aoOAPU6Xv8MqyZo8x9Uv-Eu+hs_g@mail.gmail.com>
Subject: Re: arm64: include/linux/compiler_types.h:542:38: error: call to
 '__compiletime_assert_1050' declared with attribute error: clamp() low limit
 min greater than high limit max_avail
To: David Laight <David.Laight@aculab.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>, 
	Linux Regressions <regressions@lists.linux.dev>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Johannes Berg <johannes.berg@intel.com>, 
	"toke@kernel.org" <toke@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	"kernel@jfarr.cc" <kernel@jfarr.cc>, "kees@kernel.org" <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2024 at 3:20=E2=80=AFAM David Laight <David.Laight@aculab.co=
m> wrote:
>
> From: Naresh Kamboju
> > Sent: 05 December 2024 18:42
> >
> > On Thu, 5 Dec 2024 at 20:46, Dan Carpenter <dan.carpenter@linaro.org> w=
rote:
> > >
> > > Add David to the CC list.
> >
> > Anders bisected this reported issue and found the first bad commit as,
> >
> > # first bad commit:
> >   [ef32b92ac605ba1b7692827330b9c60259f0af49]
> >   minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
>
> That 'just' changed the test to use __builtin_constant_p() and
> thus gets checked after the optimiser has run.
>
> I can paraphrase the code as:
> unsigned int fn(unsigned int x)
> {
>         return clamp(10, 5, x =3D=3D 0 ? 0 : x - 1);
> }
> which is never actually called with x <=3D 5.
> The compiler converts it to:
>         return x < 0 ? clamp(10, 5, 0) : clamp(10, 5, x);
> (Probably because it can see that clamp(10, 5, 0) is constant.)
> And then the compile-time sanity check in clamp() fires.
>
> The order of the arguments to clamp is just wrong!
>
>         David
>

The build is still failing with today's next, should the offending
commit be reverted?

Bartosz
