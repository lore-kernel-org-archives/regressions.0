Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C569348471
	for <regressions@lists.linux.dev>; Thu, 23 Oct 2025 19:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761247221; cv=none; b=LR5SAkY1D2UX00HPGnJQ7QLzgp4fLFpfuCMziEB5GBvhMR40+xseglxDSMEHHTMmPgRFDQZfW4GjbVYm8jZlMpSIcTKKVBtXHfJdTekt8khuP2G7hyzqOFyEngP/StfeYAmn6wv4YzUjn/cqk0KT4gjsO8zyRNfzLHdzR8l48x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761247221; c=relaxed/simple;
	bh=SpBV0oAtNIOIUcUxfTe6GOHXwqQoTjBsdOw0X372+0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SqQDttMeygCanSUItgsdCXTPNfAPPbJjYJGeoUIDT3c7gHHXNvEbBS8v4ZYHUGL/7ciZiPSNcxrtCDxjJzHL8x9DRMNPeZweQrvyh7s69VVoekKsnz69rAXjyZeUExllZhis62PQVzOYU/Eh6rCOKyGLa7R4HHlVmdtdO8ufGoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rs/vZA3h; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rs/vZA3h"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-78f5d692d09so2105746d6.3
        for <regressions@lists.linux.dev>; Thu, 23 Oct 2025 12:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761247219; x=1761852019; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7Jc2L0p0jcJ2tGUUd6Ppdki3QU4yD7rPhAK5dStwsA=;
        b=Rs/vZA3hjr0eKS+caCaAXAZo7EULGfbqtpKd8vxs6krqAiZeNXrP8Iz4ch0kSl/YGq
         cX4kBm8iLZ5HRELSmROcVRWDD1qgQuRf9nzfDaxLO6unmCwlqpREwGc7X9keLs6gOckr
         kSTHdr8CetWZxaGvi9H/R1yj0h6weM6TN7/zBUBdFTZaHdN6yl7LESq+kZw9VjfSpj1f
         FBhbFUrOb2SChTp8QZClKcfKF6EFn4wMUvUlrppp4sqnep4UL1iGnp5089UeS6UPLttr
         d7Oj2tt8TM663V/X50Lg5G6Nig26zSl835xRJczxBm/fkGz4AvksdyIughoqm5QFegzC
         1AVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761247219; x=1761852019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7Jc2L0p0jcJ2tGUUd6Ppdki3QU4yD7rPhAK5dStwsA=;
        b=J0Z+Xr1yGpluuBastoXN9agLyGFqVkv5lWA+S6gY3JBEVX8Gq3UozGdi+mKOPwobD1
         jyCkAdCferideFcl3jJiJ5nVbwRuoCsAkyDS4VhXNMiu4N1B0ZCX84T6YgQ8z/DmZYU+
         YDZXQdpuls06Ph1GF5TqCqjiZxIpmM9xDKCjvWP+kSFe87jQoaGXEdUyncdQY7LU1OUM
         rBv52GjP1z5kF4/cj1rW6uuqMgeRZSj9FxunL2uYttJOPTc5UTmGEEbZjLFPU3IQ+wzb
         wd4X1juV5QZELrszSYf5ZKITlqMkcI7NzLMr3xhbrPOHp11AxSwSGjoKWU110++R6pyL
         3AFw==
X-Forwarded-Encrypted: i=1; AJvYcCXi2lkCDroy//xuGPNJxBfeBMStao9AIIeEAYYnsdFxoEBE0eAy4ml3rRR0qXNzc8meXMJeMFOJnDT4EA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ3OTZzTp6xBMb66KcmXQcqSWHn9rbJcQVJXghE6M+iIwb1Mr2
	P5qGk/m6ID8t91LLrLnexfMnvGuPnxaW3vVM2fHZKrb6XOXFrsGNqU3smQxU3Uoyk0iFCnjxgwT
	s2hRVLHG3x37mqeajgEfEraZyjq1Ka1lav8cvddBspQ==
X-Gm-Gg: ASbGncs7eMwIxS30nLVjKXIwIZJS73O2dwg/CT+PI0MhFvwcxj+p4MGlemhZRxKdOLb
	Q5wL5Wfluw1xMZ7av5qaZ3soKEtY7pf7mnKYxXPCfMMGGDBukWOjOaAj7eXmLxv00soTiXhwL7T
	cKYt8KIomQVpoRaCMNYEwtVXH3D/6LlMF+jIyymyY2w9+UWwU4FeAvIKGrbhdiPqFPHHduugV7n
	koCaCLt+5SF/3Fl2B0xZwTQZFptDl4QTsnJBHjlGXzFj1zGfKwE1pc5KT7zmqa1/5lgXw==
X-Google-Smtp-Source: AGHT+IGkQvnw+P4oceXyA5t5qG3cgWb0laXxzyqv1FiNzsffgaXuAVfp39vbfz48HT80gEehZCMHTKqYfeFUsV9baTU=
X-Received: by 2002:ad4:5b87:0:b0:87c:21db:cbbf with SMTP id
 6a1803df08f44-87de714bf08mr100164216d6.4.1761247219089; Thu, 23 Oct 2025
 12:20:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251023164401.302967-1-naresh.kamboju@linaro.org>
In-Reply-To: <20251023164401.302967-1-naresh.kamboju@linaro.org>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 23 Oct 2025 21:20:06 +0200
X-Gm-Features: AWmQ_bm15EalXbAnjLs4CmLjdIsxVVIbblnMfG02uQMZQ8ouizbiUwGmA3HVblI
Message-ID: <CADYN=9J1xAgctUqwptD5C3Ss9aJZvZQ2ep=Ck2zP6X+ZrKe81Q@mail.gmail.com>
Subject: Re: [PATCH v2] ioctl_pidfd05: accept both EINVAL and ENOTTY as valid errors
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: ltp@lists.linux.it, lkft@linaro.org, arnd@kernel.org, 
	dan.carpenter@linaro.org, pvorel@suse.cz, jack@suse.cz, brauner@kernel.org, 
	chrubis@suse.cz, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	regressions@lists.linux.dev, aalbersh@kernel.org, arnd@arndb.de, 
	viro@zeniv.linux.org.uk, benjamin.copeland@linaro.org, 
	andrea.cervesato@suse.com, lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 18:44, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Newer kernels (since ~v6.18-rc1) return ENOTTY instead of EINVAL when
> invoking ioctl(pidfd, PIDFD_GET_INFO_SHORT, info_invalid). Update the
> test to accept both EINVAL and ENOTTY as valid errors to ensure
> compatibility across different kernel versions.
>
> Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Verified this on arm64, and the test passed now.

Tested-by: Anders Roxell <anders.roxell@linaro.org>


Cheers,
Anders

> ---
>  testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c b/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
> index d20c6f074..744f7def4 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
> @@ -4,8 +4,8 @@
>   */
>
>  /*\
> - * Verify that ioctl() raises an EINVAL error when PIDFD_GET_INFO is used. This
> - * happens when:
> + * Verify that ioctl() raises an EINVAL or ENOTTY (since ~v6.18-rc1) error when
> + * PIDFD_GET_INFO is used. This happens when:
>   *
>   * - info parameter is NULL
>   * - info parameter is providing the wrong size
> @@ -14,6 +14,7 @@
>  #include "tst_test.h"
>  #include "lapi/pidfd.h"
>  #include "lapi/sched.h"
> +#include <errno.h>
>  #include "ioctl_pidfd.h"
>
>  struct pidfd_info_invalid {
> @@ -43,7 +44,12 @@ static void run(void)
>                 exit(0);
>
>         TST_EXP_FAIL(ioctl(pidfd, PIDFD_GET_INFO, NULL), EINVAL);
> -       TST_EXP_FAIL(ioctl(pidfd, PIDFD_GET_INFO_SHORT, info_invalid), EINVAL);
> +
> +       /* Expect ioctl to fail; accept either EINVAL or ENOTTY (~v6.18-rc1) */
> +       int exp_errnos[] = {EINVAL, ENOTTY};
> +
> +       TST_EXP_FAIL_ARR(ioctl(pidfd, PIDFD_GET_INFO_SHORT, info_invalid),
> +                       exp_errnos, ARRAY_SIZE(exp_errnos));
>
>         SAFE_CLOSE(pidfd);
>  }
> --
> 2.43.0
>
