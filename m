Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE862472BA
	for <regressions@lists.linux.dev>; Mon, 27 Oct 2025 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761570788; cv=none; b=IMyrqOJ/aULcoNM7O/y5Ise71FOBr9CE1rPs7grkmJLICmPbKgUzqmXFsEluKjF9igcOtbDv/dkH6Zt0iYCzefPG70JI3htzxE/7uvelJbPb1Nz129fGvgXGaGuBi9avWrHgnW59czEVXmuuES8sf/S3eQVbZgcu8L38VZk0KmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761570788; c=relaxed/simple;
	bh=4JRsrZ0EyNC76Kj9eXHalnnSKN5mK3A52nSIdisFktY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyj2aj23LbmZBFZV72NP2xhTCSPKL2m+ys6PqLOpGYPaVR+aaXilBdxAsNj9J8TWek3TBn7nA6Dtyi+ar+m5iONKw74wfl8Q384Uv61yZSLjHHUL03dlfYEhlslxUx3Zt4/xOYwobUCxshMfYzGdEO+vHWyLcces5OwpixvplaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AgKZzRNr; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AgKZzRNr"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b6a225b7e9eso3323147a12.0
        for <regressions@lists.linux.dev>; Mon, 27 Oct 2025 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761570785; x=1762175585; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gNEXNCM0epFMr+RmcnWLYaOFdjohrZT8knavBi/MqIo=;
        b=AgKZzRNrhywOvm494U42cPYKIyg8Zo8XKBL6DeUko/zqL+YGctMkKbxGKeR7G0vX8d
         CxAtOCMpC7aXVyRbxj4oQnA6x6ahdDsDfUIGPfhcLBICobNEZVDxRuDZbK2QAs0ChZ/J
         8vKmjGzFMxu5AnpH0xD30Cj4Ivaj8bJOx4yTgGtwQAH3YyvFmlmaV6RHu8KIH6Tyw64h
         7MA2RMLEEbrlYelqwjRXYZkmqRwFMiY0yuAQRxvK8eKWqW979MF43V4VAnpDYRbxyK8V
         JhqbhTdCWPgaRUOPjxi/uwN2JdriEJYPtTEcfosJWZCp+seY7tIDsZOCyKJLU3GxmVFL
         3lMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761570785; x=1762175585;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gNEXNCM0epFMr+RmcnWLYaOFdjohrZT8knavBi/MqIo=;
        b=qICcGX1jIGTgSw0OXDSi+9TS+CVuCwXfd0DTDWmtDVNCzUZh1q7PjXJ0MP99+3JIsg
         VfsfYvOC9qk8O1sqKJpZgC1uQ/XjAr5bVMHAcBlngYRvKeT4BqTd0hJ7ttiC6+INK7EY
         HIquemYoj6+XT08t8NxljdK79kYkhysvXBBuWM3nw/KIVmEkjHaJt5+gi259ZjDoEtDs
         GbaBKrFEhDKMTmt8BMRtD+TZHRZbzFhzCzK2fd1zRahdzHJlS+RaVIfz/cYn1fpbmakS
         6mSvBesozl+TjQqjbaN6Z4WW/LUiP5E/defd8EjSaJ1DE5uyd/UbCZC0vr+fD6f7uZi0
         jF+A==
X-Forwarded-Encrypted: i=1; AJvYcCU2KXQ1uaOHdz5g40JUzVSuNG1+PEhBDzE0JUWLJr65hdp4FxoBdebjvrRzf6iiJuZsvqBhasu7cxkFfw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv6XOCay5BZ7wkblDqVAogvFtHp4abL09D8Mbbs7dzbU/nHPap
	IO9RJVOM0yeLEAqstkUErp5l9xblBcN9bJR3+ohab+9cZGae6FT17M8Tcb+vCrss1j46TJBL3U+
	E3fHmvbpixvtwwRoLuiKlMupEXnLg7aPzEkN1PJ1Zjw==
X-Gm-Gg: ASbGncteeG65WxpMpjDFHbh+1KlAXzEzfj53PPNpnoxo8jYkPoDmZJBuA+GNt/4Pod2
	LRmuKeOnZBzMhHC2NLlDSsFjPt0Tk+b3OblNtjr0P8jrAzrBlqQxUN2dY1Y/TFN9pwrxEwPQ2s2
	FwmoD3jYhqp7h6y8piyD0bFViv0meJvRUIj+4Apuu4dSERhQhFAIW6qirhNcfTwfoiiEAEVTXth
	yHfElb6HsVcsOQrmYOXuIFurdXUM6CL6OjzC3AoBLccZ3i8ktUPIkd7DzlPqWiMrvoVrf/A2oTI
	hJ8Ml0mMQ+hZ2drFDQ/33MaAb0WIpXp+r95JWtx3AC+T30KFIIVviXhuNdqN
X-Google-Smtp-Source: AGHT+IEsdKc9R+4FlPyXgvJuUVfiubltPDZcJsLUDaYs1stlCo1Np2u3tQ9qE9+t58mdLnukcLVSUInlftA70xiEIvo=
X-Received: by 2002:a17:902:c412:b0:24b:25f:5f81 with SMTP id
 d9443c01a7336-2948b9758e0mr149025505ad.17.1761570785234; Mon, 27 Oct 2025
 06:13:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYsL+w_XaOPaBaN5xMr6Ssrq_hh2_g8AgNxNmu0jCpjwxg@mail.gmail.com>
In-Reply-To: <CA+G9fYsL+w_XaOPaBaN5xMr6Ssrq_hh2_g8AgNxNmu0jCpjwxg@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 27 Oct 2025 18:42:53 +0530
X-Gm-Features: AWmQ_bmY-i51q19AYcQpT-sEvBW1BPIqo1n5TQLSYT-9iYht4pVG5wgMSRv46e4
Message-ID: <CA+G9fYvzg-shL5LMmdJjJEGi6NvxHFdwbC5jQwtbFxkOFPnc4A@mail.gmail.com>
Subject: Re: next-20251027: s390: pf1550-onkey.c:154:12: error:
 'pf1550_onkey_resume' defined but not used [-Werror=unused-function]
To: Samuel Kayode <samuel.kayode@savoirfairelinux.com>, linux-s390@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sean Nyekjaer <sean@geanix.com>, Lee Jones <lee@kernel.org>, Heiko Carstens <hca@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Oct 2025 at 14:26, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The following S390 allyesconfig build regressions noticed on the
> Linux next-20251027 tag with gcc-14.
>
> * S390, build
>   - gcc-14-allyesconfig
>
> First seen on next-20251027
> Good: next-20251024
> Bad: next-20251027
>
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
>
> Build regression: next-20251027: pf1550-onkey.c:154:12: error:
> 'pf1550_onkey_resume' defined but not used [-Werror=unused-function]
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Anders bisected this down to,
  9acb215cbebd ("Input: pf1550 - add onkey support")

>
> ## Build error
> drivers/input/misc/pf1550-onkey.c:154:12: error: 'pf1550_onkey_resume'
> defined but not used [-Werror=unused-function]
>   154 | static int pf1550_onkey_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~
> drivers/input/misc/pf1550-onkey.c:133:12: error:
> 'pf1550_onkey_suspend' defined but not used [-Werror=unused-function]
>   133 | static int pf1550_onkey_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[6]: *** [/builds/linux/scripts/Makefile.build:287:
> drivers/input/misc/pf1550-onkey.o] Error 1
>
>
> ## Source
> * Kernel version: 6.18.0-rc2-next-20251027
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git describe: next-20251027
> * Git commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
> * Architectures: S390
> * Toolchains: gcc-14
> * Kconfigs: allyesconfig
>
> ## Build
> * Test log:  https://storage.tuxsuite.com/public/linaro/lkft/builds/34dKrowtK5wNPnem1T5LSEjjq5o/build.log
> * Test details:
> https://regressions.linaro.org/lkft/linux-next-master/next-20251027/log-parser-build-kernel/gcc-compiler-_drivers_input_misc_pf-onkey_c_error_pf_onkey_resume_defined_but_not_used/
> * Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/34dKrowtK5wNPnem1T5LSEjjq5o
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/34dKrowtK5wNPnem1T5LSEjjq5o/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/34dKrowtK5wNPnem1T5LSEjjq5o/config
>
> --
> Linaro LKFT
