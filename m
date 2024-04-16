Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E72129E9C
	for <regressions@lists.linux.dev>; Tue, 16 Apr 2024 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713271350; cv=none; b=fz/r9TucHVm3ISa2iNJzwKMCFzlCwpYA5y4Toew3WxcBTgVgmrJjKiry+nUcJ+Q6tpb9rzA42mU5vrv29rdITerDqfmvST6yj9L+jH28ZgFg/BbJvT+QzDv7zKACN2Zn9nGLGzDJfEOQxDwW0f3yF+C0uZ5gCbx/mLn0rd1+C88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713271350; c=relaxed/simple;
	bh=7vKkklm2j+8MBw3agiSUc9CHX8zKs9lEzFNQV7tgc7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXuozQHVcXaAw+n7AQ623Pycc4SjduzrcKzAiHl2H1qVVR/yTPk4B/epoyrd/ifGyp8/ixBKCzvMen+8OfGXL6zthzJCNYQpY7Vn0h1UlyqYE963X7XjSNiXP45v6lUbr/TaXfcEy+nsZuft8xmX8+WGd60f+esCFn/hX7NDI/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KcJCCbRd; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KcJCCbRd"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56e6a1edecfso6926986a12.1
        for <regressions@lists.linux.dev>; Tue, 16 Apr 2024 05:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713271347; x=1713876147; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mUOtU228tYtJyPue/rn/IW891GZXpSSOmG4AvHGZ5go=;
        b=KcJCCbRd9qjgVE3mXciCag3j7x/Eb2atC0r/l4/puSRUbDnQIT7UyNRX4RqyjleQrj
         e5UfMxT3TSFfEUq4esmZbjS2fRNunJ1nJyHnFGtsk5QZztgE7tyYilXa0BPP7TedITjL
         yZE1uL1HsCqua76DdPAmjIgD3iIZAI6ahfjfo9c1OnggyjJlFgIfZ18Tnfm0T7Izc1ms
         6Nm39zg06ibeAoAOmaGDUn1LfSlRc70ZnCmlFLBM9COTHoLH33HVcL6MFYLDY4H6Le1w
         mP9mYZgOhlxyk14ywCCS5EuiKSoq93GdZ1BSZqkRbga5bXkNTdIPhM5NMTsG4Ovz3m89
         HseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713271347; x=1713876147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUOtU228tYtJyPue/rn/IW891GZXpSSOmG4AvHGZ5go=;
        b=HStmCrnkqMv2xXZhuYqrkTZrW8kVkSdS6wsLZV8wuz58SPK4VT75uojGfyN5EbLMSb
         Ns4eIv14G54TdMMNbDPqHY9bVGkCZ7rn5rv8o62ImBUbsd1OrNWJ6iSMGu3wP33U4Vhg
         Cq++v3KgcYBNH0UWEYHRFj2Gb+DUWvYAR5Ih00oLMH/mxKfswHCuVTgJ1ktO88vQeK9A
         ysorBBvkPKhDPX5fdciIa2pBMVwiLZD9J33zcwtNYTk+O0bqjBghyqxeI2Nnrq1fI9Kh
         QV91tkso546fFDSAe5UpI49Cs9E04RvIwuwXqGF18gdiY7D3UCt+fl4aPDB1wQDf4Aoc
         DCPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3sPyCvtEnfD4u0rTAjRQRvrMZdjkQp8LdBwTfkx2A/tYh3FCrhfrdcIEIpNwrvicbse4Q5piHDCYHNcHc3MuupjLQ8j2sVXYwtRc=
X-Gm-Message-State: AOJu0YyhvPSrcKfP5RAwSlmxUX4Q0WxZJ6Y84RkUfPmaK3dHMwYMQe7f
	zThILc5iL/0kvIgBU3pBpJRd39wEeVy/4EhYifT4LC1Pnewk0hPAX9OAjq7XrNs=
X-Google-Smtp-Source: AGHT+IFJ6u/xajiCUpxE33tmeqjHHiAL2wmL+dnoci+VQnEehXgtJ/Q5xPBX57jTU1Obt4QXb9tI5g==
X-Received: by 2002:a17:907:940e:b0:a52:277d:c1c9 with SMTP id dk14-20020a170907940e00b00a52277dc1c9mr12180603ejc.50.1713271347185;
        Tue, 16 Apr 2024 05:42:27 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id go36-20020a1709070da400b00a51fea47897sm6775453ejc.214.2024.04.16.05.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 05:42:26 -0700 (PDT)
Date: Tue, 16 Apr 2024 15:42:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	clang-built-linux <llvm@lists.linux.dev>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: powerpc: io-defs.h:43:1: error: performing pointer arithmetic on
 a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
Message-ID: <402a5e3b-bdb5-40a4-8a44-2de497849c3f@moroto.mountain>
References: <CA+G9fYtEh8zmq8k8wE-8RZwW-Qr927RLTn+KqGnq1F=ptaaNsA@mail.gmail.com>
 <3d139886-9549-4384-918a-2d18480eb758@app.fastmail.com>
 <f7d8cd55-5a14-4391-884f-0b072790fa41@app.fastmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7d8cd55-5a14-4391-884f-0b072790fa41@app.fastmail.com>

On Tue, Apr 16, 2024 at 01:55:57PM +0200, Arnd Bergmann wrote:
> On Tue, Apr 16, 2024, at 13:01, Arnd Bergmann wrote:
> > On Tue, Apr 16, 2024, at 11:32, Naresh Kamboju wrote:
> >> The Powerpc clang builds failed due to following warnings / errors on the
> >> Linux next-20240416 tag.
> >>
> >> Powerpc:
> >>  - tqm8xx_defconfig + clang-17 - Failed
> >>  - allnoconfig + clang-17 - Failed
> >>  - tinyconfig + clang-17 - Failed
> >>
> >> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > I'm not sure why this showed up now, but there is a series from
> > in progress that will avoid this in the future, as the same
> > issue is present on a couple of other architectures.
> >
> 
> I see now, it was introduced by my patch to turn on -Wextra
> by default. I had tested that patch on all architectures
> with allmodconfig and defconfig, but I did not test any
> powerpc configs with PCI disabled.

I think this warning is clang specific as well...  (Maybe clang was
included in all architectures but I'm not sure).

regards,
dan carpenter

