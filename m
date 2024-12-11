Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7078023FD18
	for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 13:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733923307; cv=none; b=uORT3CMEAsSDv8S2b3OOM6rbRUBAwVBa4y1beehYFWxbluLh7pSl4/LcARNifeK7tPI+HLta50fd7atFozODXyBRcHQxtO9J3szhik+ZOnlQ6Tgi7YMhmVwECkW60INmotfxuVl1tOjjycIT3Epb7JGQWGBQNLXQgvk3w8nHumk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733923307; c=relaxed/simple;
	bh=RPEBjQP0OcwhX3nUIQE9WuQDD87s2+IGYDhtmJcS9js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbiK3drJpr+KnCP4ocog9e7Fsvj/oU76iGI4UAcB2pQdEpRaYLo90ThujxoxCqj6ylFZsgPIiby9X+5irCVlNBstMuBzcJMtST6RMYIEmMmrLXrXIqiHWYLIfF/bmrWT0St13EdO9LTWxNRX5KyUYDbPuTMnWHtAzj9ZYNkXoC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qil54uwa; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qil54uwa"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38637614567so2036350f8f.3
        for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 05:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733923304; x=1734528104; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9eKaWxEhhuVWvBsU53E8KZ6fOQTi8MzTOfznqa4xjH0=;
        b=Qil54uwauD1S0vS6QV3gj8R17TShAe7T0sLPYQtLgV7vVXL/A+xmKV3q+4FY64jeeU
         iABlEb+sZDoNnXZ4FG4wh0Bh6lZKv/6uZffXBX+fsyhTkMKNz8RexIgGQwZUChaGFJs9
         KFRbWsn3q4M9SoJbk7YkmooshwdTPkKyB5ee0i2wesOttmvMQVqodUB9Lot+F7v27ab/
         0Vjl1S+i6jm33Fb1YYpsawnL5OerFHSdjs0RqXReP3+eh2WUKpbOXdJQH58I1DbXKS5T
         gIIctKrduZpcIIxGnlOwa5+puKD25k26KPw1T0mnbRJlOrjQ2nAun5jJ0DI7ROh6vc2o
         JCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733923304; x=1734528104;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9eKaWxEhhuVWvBsU53E8KZ6fOQTi8MzTOfznqa4xjH0=;
        b=HBg8EznmgPXro/gizLi5DgjhHEYUdKrTOVoSdRRdL6xkPkTxFmugz3f5qN+NxAu/bY
         l0q35XvRc4mJ0/AukMK1ijgHRm9hWZNDMv3N1fyJdNKUyrm01XY2MFYe+jJMN4X2FDYi
         I8e9lXEFs6NJ6zqyexJ46Gf6VEHbbB8l0hx8+uqjcTVFaEC1a5mDhZc3QqOL4tNdqycT
         YOzRxMdnjXDiRWZytVxnacU1n6cVOgQaaRCkrAHOMkt/AUpsRtOlzoMilaBXcwgOKpcf
         3BO76TXnBi+6B6jGItXZXQJXldnvx9assF6bxBR4KNBUJ9qpex8rfoVRHkeZkKGS0Jkb
         zMOA==
X-Forwarded-Encrypted: i=1; AJvYcCXE1dvI+18G9gSt98FoImS2RYXaZ8FmUdJhJRunxs3felxihZcKIBzODebBuPA/QWqGg2qaaPv+e0EpwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyiuVJyNUFzbyL7/+nnY8oe0Bid+f5Cq14yrRuLxjMU3YqAyIII
	7e07YcfDu5GjqfxR762AQFxbsTRnCsYVcCICvDbrcbOKkPh4NfGehCL+Y9asX1I=
X-Gm-Gg: ASbGnctK/Z1Po+Y6bUB6612drkxf2VTwqgQV+h/+/IZmmEuAnz3Bvw7lU+mAs0R/YJb
	9mwPCuDc1dxDXzgGU5FABMmy+KaWoVYqHXwhQjacXGhvruexBw0A4KWSAz5Rw1WNRRi91p1m+2/
	fkfJRR5L39at70o3q/nwdn98bhF/Fru576nioimTkelEuus5YR9x79xFXYXwRdf+3FGF/2XcZDX
	k1v5L4xqv4eEbrFsFUyJ3ol81EgTd5bdQYl3isi+IoIlxC8X6IHqPnmr/k=
X-Google-Smtp-Source: AGHT+IFfC29j6czTll9rOLSqjnFeJosj8hGWZx1V8FqolEsDfwkRoQYubFcSENWm0L8tfipl6WqLzA==
X-Received: by 2002:a5d:6486:0:b0:386:4a60:6650 with SMTP id ffacd0b85a97d-3864cec5bd0mr2542328f8f.42.1733923303738;
        Wed, 11 Dec 2024 05:21:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514d97sm1260997f8f.64.2024.12.11.05.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 05:21:43 -0800 (PST)
Date: Wed, 11 Dec 2024 16:21:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: David Laight <David.Laight@aculab.com>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	open list <linux-kernel@vger.kernel.org>,
	"lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>,
	Johannes Berg <johannes.berg@intel.com>,
	"toke@kernel.org" <toke@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	"kernel@jfarr.cc" <kernel@jfarr.cc>,
	"kees@kernel.org" <kees@kernel.org>
Subject: Re: arm64: include/linux/compiler_types.h:542:38: error: call to
 '__compiletime_assert_1050' declared with attribute error: clamp() low limit
 min greater than high limit max_avail
Message-ID: <49a14c12-a452-4877-aedf-94bac6ed2b7b@stanley.mountain>
References: <CA+G9fYsT34UkGFKxus63H6UVpYi5GRZkezT9MRLfAbM3f6ke0g@mail.gmail.com>
 <8dde5a62-4ce6-4954-86c9-54d961aed6df@stanley.mountain>
 <CA+G9fYv5gW1gByakU1yyQ__BoAKWkCcg=vGGyNep7+5p9_2uJA@mail.gmail.com>
 <bd95d7249ff94e31beb11b3f71a64e87@AcuMS.aculab.com>
 <CAMRc=Mf8CmKs-_FddnLFU7aoOAPU6Xv8MqyZo8x9Uv-Eu+hs_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf8CmKs-_FddnLFU7aoOAPU6Xv8MqyZo8x9Uv-Eu+hs_g@mail.gmail.com>

On Wed, Dec 11, 2024 at 01:46:11PM +0100, Bartosz Golaszewski wrote:
> On Fri, Dec 6, 2024 at 3:20 AM David Laight <David.Laight@aculab.com> wrote:
> >
> > From: Naresh Kamboju
> > > Sent: 05 December 2024 18:42
> > >
> > > On Thu, 5 Dec 2024 at 20:46, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > > >
> > > > Add David to the CC list.
> > >
> > > Anders bisected this reported issue and found the first bad commit as,
> > >
> > > # first bad commit:
> > >   [ef32b92ac605ba1b7692827330b9c60259f0af49]
> > >   minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
> >
> > That 'just' changed the test to use __builtin_constant_p() and
> > thus gets checked after the optimiser has run.
> >
> > I can paraphrase the code as:
> > unsigned int fn(unsigned int x)
> > {
> >         return clamp(10, 5, x == 0 ? 0 : x - 1);
> > }
> > which is never actually called with x <= 5.
> > The compiler converts it to:
> >         return x < 0 ? clamp(10, 5, 0) : clamp(10, 5, x);
> > (Probably because it can see that clamp(10, 5, 0) is constant.)
> > And then the compile-time sanity check in clamp() fires.
> >
> > The order of the arguments to clamp is just wrong!
> >
> >         David
> >
> 
> The build is still failing with today's next, should the offending
> commit be reverted?
> 

It's a simple fix.  I've sent a patch.

regards,
dan carpenter

