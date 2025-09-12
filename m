Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF942E172B
	for <regressions@lists.linux.dev>; Fri, 12 Sep 2025 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672621; cv=none; b=IezS8z1sXM0qrzHUcFIOZmktkHVpRumXmvv/U1YjyV+WqI/VXDbzUecSZGit3IkC98cofO2Z9VwMRoTK0l4Dllziwx1vsC9oekH2jHVi1jxgrWrVm1CDlg88QABWw41/ElqS88Osw9P3fhmX0SxkCR4t4mSs4/Y5SKln4t/ZaME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672621; c=relaxed/simple;
	bh=L8+Vfsd5NRO7vLKj/WDn0QKcl6cnx+8yrLmAU9BNATI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NQPSJPFrgOsEp1aPqofiWlZ0CVyak2aKCDf5gBxpzr7bXB1X8vmN2re1Q99ziFERT4QAtsTKfUuAviT2WceeRCKRmfgjwBH/FQr/POP23uTLFbeygsrvNzZ1+gdS9dXnmaRDYF6oUy05iMINLC85E+fuCct3+f4jWJpjvJoT3TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TAtZe3Eh; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TAtZe3Eh"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-24cb39fbd90so15220495ad.3
        for <regressions@lists.linux.dev>; Fri, 12 Sep 2025 03:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757672619; x=1758277419; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxaMEqYA6uym+Ir6zcrN22UPH27k/nnjzDJpTYQxN6I=;
        b=TAtZe3EhA8aGK9fvBW4BOBVrRyA7QwU16IM4fZI8pHd2B7SkLoakPvULs4ijbq6im5
         YvNkdTTLfC3QUZyfWFKiU96Pr7S+T1aT5XiUKQUDo+QU556luq8h9H5tg4QYDGr96F5Z
         Sk8qFU+bUdRpPsM8dmrj7xzpuzEDIMnX/l1ATcWrBRvCsxmaQx6afb6g5dbmlJMtPzLt
         hMACB54i1YMu0ia1JePbP1ewcf904FEjjpMQxdJpsuh2R7dkHjovqp28rpPsY3zmhfUM
         1NGJ+mebC8xy1ZheChTrlUfC3DHT7NApz5kq1a9cZYFDXNhasBiQjbQKz2w86PslWPXA
         gLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757672619; x=1758277419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxaMEqYA6uym+Ir6zcrN22UPH27k/nnjzDJpTYQxN6I=;
        b=nftcKOo0KfjG68LEphV5/Uvos4Mgv5S5ohAcH8Z00EWTtgqGS46MfUWG5WnFVWFQVf
         NLCCcDS4WD4IckOk0r2lp4HOEvWmbjLOtP3GjBtJQeZVpK3VG/uBRQ0gLcxHgpgBxKd6
         Xyfeo6zEalqrv2wEnTw3o8X9/A/f7HSrEqXoJdwKjDHz86llt/Th1RBxH4RAMv6MSRQH
         moHW5Y1PfV2mClEtnUdNfCw3LRWeHfKg6PYxmNAPmIw8NVuciYtD5/snRbiyXUT9mcjS
         wk4c9qF/Vw/c4a4Mgh9kr1x3/2A2E614xkJhSf4Z3calHdgqgUqb8tlf76t6ohchjr4s
         vnMw==
X-Forwarded-Encrypted: i=1; AJvYcCWtHzpZbuwzvqTvZGcASM/54gzAQ8DxfuWr4rl9eWAQLSIFzDXqhtkM8HrUHIzHD9gPViaUcREDp0ZdOg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvZc/LRS7ee/j6KSWNY/s658pToPf1EbwMn8yqKuNSIOARfDKD
	V8PqYQsikY9uBXvMb/J+159eJLjYURZqJyeZ1SD/eKoBc6v0wzF7FtTztAYvD0y7OPSRw1sjmFG
	xfodjyjbIRyQFIqT9E67Ijr5zPFK+ekQYllqtBGpopA==
X-Gm-Gg: ASbGnct1SIgYzx4KZCssOL8LNg7ly/OfspEsDiDeqYWZ42KP87oLsb2ek8fBWJ8wp0W
	IS4BlXzNo+FuwIWfsm0fDVuOHyxITYtckLsb3FXN1A980KrQnWy8KCi35vXcjUk32QA07a8d5V0
	oJpRKFfoz+3grDnqaIBtNHJDgKVRwDRKmczMrmMiKNoa4P4Y1LyAUG/JsfYNI2idbL4gy+GXJDV
	845ToYUANRm/u3ZOO8/7MLoF3eM8czHZ/7ywgpLc7CukV+cC5Y1GTzi6sk/JGFYHXLA8UjvUHBW
	+czMiKM=
X-Google-Smtp-Source: AGHT+IFnlh7Lcvev/z+g8geBZVyzuCDqftK69x/3dM4A4/rPwhVxriJu5LaQAhPmA/dUWQDP37JDEPq7LkU6t/uT414=
X-Received: by 2002:a17:903:2407:b0:240:3c51:1063 with SMTP id
 d9443c01a7336-25d2576f18bmr30549565ad.23.1757672618671; Fri, 12 Sep 2025
 03:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv77X+kKz2YT6xw7=9UrrotTbQ6fgNac7oohOg8BgGvtw@mail.gmail.com>
 <1e331ebb-3315-4cbe-b194-ccbeeaded4da@t-8ch.de>
In-Reply-To: <1e331ebb-3315-4cbe-b194-ccbeeaded4da@t-8ch.de>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 12 Sep 2025 15:53:26 +0530
X-Gm-Features: AS18NWBiNtyoZJdw5AR77Ehen6tmbxWoHZEhVULSIr8zN1kPljDdD8rhs__pSZI
Message-ID: <CA+G9fYvrcRNBbg15UEcaZuYgs1pHU2i7h=zvJ2yHNo5i4fZ_nA@mail.gmail.com>
Subject: Re: next-20250909: selftests/arm64/gcs/basic-gcs.c:390:30: error: use
 of undeclared identifier 'HWCAP_GCS'
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Mark Brown <broonie@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Fri, 12 Sept 2025 at 12:00, Thomas Wei=C3=9Fschuh <linux@weissschuh.net>=
 wrote:
>
> Hi Naresh,
>
> On 2025-09-12 00:48:47+0530, Naresh Kamboju wrote:
> > The following build warnings / errors noticed on arm64 defconfig
> > with clang-20 and gcc-13 toolchains on the Linux next-20250909
> > till next-20250911 tag while building selftests/arm64.
> >
> > Regression Analysis:
> > - New regression? Yes
> > - Reproducibility? yes
> >
> > First seen on  next-20250909
> >  Good: next-20250908
> >  Bad: next-20250909 till next-20250911
> >
> > Test regression: next-20250909:
> > selftests/arm64/gcs/basic-gcs.c:390:30: error: use of undeclared
> > identifier 'HWCAP_GCS'
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > ## Build log
> > selftests/arm64/gcs/basic-gcs.c:390:30: error: use of undeclared
> > identifier 'HWCAP_GCS'
> >   390 |         if (!(getauxval(AT_HWCAP) & HWCAP_GCS))
> >       |                                     ^
> > 1 error generated.
> >
> > The suspected commit pointing to,
> >   kselftest/arm64/gcs: Use nolibc's getauxval()
> >   a985fe638344492727528e52416211dda1c391d5
>
> That suspicion looks correct. I am wondering a bit how this works for
> the other selftests which use this symbol.
>
> Can you give this one a try:
>

I have applied this patch and tested and reported build regressions
got fixed.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

> diff --git a/tools/testing/selftests/arm64/gcs/gcs-util.h b/tools/testing=
/selftests/arm64/gcs/gcs-util.h
> index c99a6b39ac14..816b497634d6 100644
> --- a/tools/testing/selftests/arm64/gcs/gcs-util.h
> +++ b/tools/testing/selftests/arm64/gcs/gcs-util.h
> @@ -26,6 +26,10 @@ struct user_gcs {
>  };
>  #endif
>
> +#ifndef HWCAP_GCS
> +#define HWCAP_GCS (1UL << 32)
> +#endif
> +
>  /* Shadow Stack/Guarded Control Stack interface */
>  #define PR_GET_SHADOW_STACK_STATUS     74
>  #define PR_SET_SHADOW_STACK_STATUS      75

--
Linaro LKFT
