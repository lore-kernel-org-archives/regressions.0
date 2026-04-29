Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A8A3C5538
	for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455313; cv=pass; b=R4o2vPVTH92YGsFxrMfnTz32Xv0q8Qr1hFmrH7rAQidLIa8+qQzV9G8LkayxIACxNVgT5TN2uw6dDFqy2fK9wj/hEkw3xmIpg02nH38h8M15yfaMfsQkRJVwPuKBXsAYvuS2ue/kgSTBLQsJmAwJCiTg78OewNTv7ySNpL0EUk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455313; c=relaxed/simple;
	bh=S5MuuWSfoyw73iP1eJmsCjTDCgYri635RLzaXHFJZpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DHnXC+m6K6H8kVqWs2RCS9nf3d/oXP5rzLSU+OmLxdGgaEdLxbmC/lkUi0WvLKF7Lc13dpsWahg0U6GscqxAdCwUdtiUQaqpAUwMP5CYBc8b2F477n/fvH3uExtmqpXnTz92A7qDoHRbEYIKW2xTWB4z156HiGc0s9oAgYWs5fU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q5nF0Vvp; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q5nF0Vvp"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38c620f1699so109127761fa.0
        for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 02:35:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777455309; cv=none;
        d=google.com; s=arc-20240605;
        b=fokZS9Xjt8eaBVCnIXs4CJt4GEyIxDVCoRSPikePBkiUW356gX9BEs5/OfLDjYL0F0
         rH4EOtQMuDZvPDqtLvPDQ5JbGUDFAyYFozvqRKDhrbpyLJ3QEcDj5ICndNMJMeBxyNDa
         6NGGjxIuOHiTu8M1Ygs1b+1+vMnqE5OQi4TlA6nm2JLVw0fnV/sS9nQcpzX686p9eA/r
         h3eTvsKsxV4sYlHMQOUB/wBtpUP8rWmAVES0ViJv+ZWBrcki9erf9LaSjSOcamnc8Adx
         +Px2B3y7GknnHfPPtmIlSjdiUi322ub2/OoxPJ3Qrx6MmBnMUD8skE5wFtaIHxU5hlJB
         Sm2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=brWuWPY89CTfDNaEhrviElR2rVty0h6kwi+l19oN98E=;
        fh=ywzdzwu2fv6u+YtVUSic9cPPrwp1yV4Q8IzDQwjEFtg=;
        b=jifr7TLYK1MrkJ7QlIbZqh7ovqWPut/8K2NOindh/AaUY2UlLmvHVTbXZ78U2QY1Pi
         2uclI3wCvAUjsZ+uZ6UdL+OZwpgo2QNm9LC7BUKIvbMXP7O9cGoyL2QXsEsmn2FjuzHh
         IbFR00MB253DVJSafvTkUDWQCMBuAU5EXjiCavlwVsB16MJXtAyMaZuwUkr0CyClfNfB
         AXcOEa31eOeBOOVfgKLhdlZyCuYYON1GiQHqlgR96+qgkikFRIUjlA5SgMRLGtinuI2x
         O+h73scBUHEoYSsx0oLp4X+WFMhVe+rbc6w7Il8dJeyMSpapIJdvkEKFsVJGDpmkNd5P
         Ftvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777455309; x=1778060109; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=brWuWPY89CTfDNaEhrviElR2rVty0h6kwi+l19oN98E=;
        b=Q5nF0VvpcmUELU/XlhljWmX+dSarr4wI/zvlHgSqSS5SS9zcuTfvfbHE4DOlIVDjqr
         D1yaw0O8XZJZz3tF8AxpdRYGaibtP0KMMA5DLndEZ0rwq2jwji0mADhhn++uPBKVY7zC
         bXfEUUL0K8ppgsnQwu5so/vsu3ZpFtrA7zlod56S4o30wonBG2NRmBIiRVdsSX9yR9x5
         FPYyfFvN5skmCoCnSx+wuAac81hPT+jsdqOMLJQhmWLmgoHZ0JirtY3tlARpLXCY4DOC
         cJ4bZT0kry2hGZ2S7VgYjIOM+wZ5ljSjMjAW/aq3pJGCiNmGK4YYCIU+JlSIEFVyQwOg
         ebnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455309; x=1778060109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brWuWPY89CTfDNaEhrviElR2rVty0h6kwi+l19oN98E=;
        b=dxiaxZBZxKt4FgIFJFqA69DJxveSHRyPFmhst6j9uNxJMCc2jTiof99ovDaZUUGJ3T
         Pkmwh6ctqQt3fB92bNiEIjX/VwhevfYlouMe5rYwLucfLgFOje/aX2LbbFZlPCLsp8I2
         8SqCgVxOhuRHs2QTzGyJSLC7b2bmmlQ9L4zn7KpskhJ7wK4xqZ+MTp4Qm5kmvM0Zy91K
         AkEWhB+FAcYUTyNwauf2YvV+tcog9y1pi3hBCpmgWD3JyWv6fj+iR/CWtVWIX8h6VXQX
         8kJZfgmasc+6EsvgvZ4v8ianqTT8VW6Zg3V7nyR6mgNpal4/2U85nUUYDrZ4dXLIaZoW
         i0Rg==
X-Forwarded-Encrypted: i=1; AFNElJ87kvr6juZydPgao59x0a32EPiJBSuowpuNII3kxkMoHr7Oj5eEBY8tpkzJO2HUOhQjfUZhZONnEo/7FA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHbqCLv7neDJcHGI8+fWguU8JV3ewQQqAzv0mUn/MgOMhLhiSS
	b70n7OQejEwsKwNfkV0hm6oj3aNYE4JxjvzIgb+5qQp4TPwbDKvFUiypPdo8dykxMSZ0ZHi3RQ0
	KryVt/H6tgUT5vmG9N91qhLf1keEdedHcGM/6vQ0J
X-Gm-Gg: AeBDieto5IQ1OYhuUq+4196u8Uj+D1p19TDd84qG6OmaEDQ7+GaFlbbASurZubf3URS
	3RUdGrEeVUFA329mLdnpByi+5R46L+J04sheM6AKVAb48c5O2GDmOmrn+0ySqvowd0fjTEvpATW
	hd4kUYNhnvghANpW8/ejqB8renm25n5Sc44EjxtB0nOlv4hDLxoNNranxUoWj6fpbvOQPw/ToVI
	nVLmTYFwSb7JT3Gu23blwSER/umQgjBHItoTXd2hi6QFk4/ywvBWKeh6Peuv5Nx0f0JK0BzZ4Vj
	Ii5SCdOYLTKcow5cYEjDSQGjhQfE0q8vnEqGhv8YPqxI3T+JEgU1QWW/GdAUJwKnbaDTIFKS6IO
	KZIwL1zZsda9yBqh33A==
X-Received: by 2002:a05:651c:4408:20b0:383:7f85:8eef with SMTP id
 38308e7fff4ca-3924bcf8a65mr9455641fa.29.1777455309014; Wed, 29 Apr 2026
 02:35:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428221058.149538293@kernel.org> <20260428224427.677889423@kernel.org>
In-Reply-To: <20260428224427.677889423@kernel.org>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 29 Apr 2026 11:34:55 +0200
X-Gm-Features: AVHnY4KatYoOwo_YnhD-qXa2QQx_2AyGQ7G3pT4cdF8ID3U7__8a6VHgTjA9qg4
Message-ID: <CACT4Y+Z-KnUe2DUPUT7omLjqETNXQwOP3CxpsHua5yG3=dqbAA@mail.gmail.com>
Subject: Re: [patch 06/10] selftests/rseq: Make registration flexible for
 legacy and optimized mode
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Mathias Stearn <mathias@mongodb.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-man@vger.kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Chris Kennelly <ckennelly@google.com>, regressions@lists.linux.dev, 
	Ingo Molnar <mingo@kernel.org>, Blake Oler <blake.oler@mongodb.com>, 
	Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>, 
	Matthew Wilcox <willy@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Apr 2026 at 01:34, Thomas Gleixner <tglx@kernel.org> wrote:
>
> rseq_register_current_thread() either uses the glibc registered RSEQ region
> or registers it's own region with the legacy size of 32 bytes.
>
> That worked so far, but becomes a problem when the kernel implements a
> distinction between legacy and performance optimized behavior based on the
> registration size as that does not allow to test both modes with the self
> test suite.
>
> Add two arguments to the function. One to enforce that the registration is
> not using libc provided mode and one to tell the registration to use the
> legacy size and not the kernel advertised size.
>
> Rename it and make the original one a inline wrapper which preserves the
> existing behavior.
>
> Fixes: 566d8015f7ee ("rseq: Avoid CPU/MM CID updates when no event pending")
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: stable@vger.kernel.org

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
>  tools/testing/selftests/rseq/rseq-abi.h |    7 ++++-
>  tools/testing/selftests/rseq/rseq.c     |   39 ++++++++++++++------------------
>  tools/testing/selftests/rseq/rseq.h     |    8 +++++-
>  3 files changed, 31 insertions(+), 23 deletions(-)
>
> --- a/tools/testing/selftests/rseq/rseq-abi.h
> +++ b/tools/testing/selftests/rseq/rseq-abi.h
> @@ -192,9 +192,14 @@ struct rseq_abi {
>         struct rseq_abi_slice_ctrl slice_ctrl;
>
>         /*
> +        * Place holder to push the size above 32 bytes.
> +        */
> +       __u8 __reserved;
> +
> +       /*
>          * Flexible array member at end of structure, after last feature field.
>          */
>         char end[];
> -} __attribute__((aligned(4 * sizeof(__u64))));
> +} __attribute__((aligned(256)));
>
>  #endif /* _RSEQ_ABI_H */
> --- a/tools/testing/selftests/rseq/rseq.c
> +++ b/tools/testing/selftests/rseq/rseq.c
> @@ -56,6 +56,7 @@ ptrdiff_t rseq_offset;
>   * unsuccessful.
>   */
>  unsigned int rseq_size = -1U;
> +static unsigned int rseq_alloc_size;
>
>  /* Flags used during rseq registration.  */
>  unsigned int rseq_flags;
> @@ -115,29 +116,17 @@ bool rseq_available(void)
>         }
>  }
>
> -/* The rseq areas need to be at least 32 bytes. */
> -static
> -unsigned int get_rseq_min_alloc_size(void)
> -{
> -       unsigned int alloc_size = rseq_size;
> -
> -       if (alloc_size < ORIG_RSEQ_ALLOC_SIZE)
> -               alloc_size = ORIG_RSEQ_ALLOC_SIZE;
> -       return alloc_size;
> -}
> -
>  /*
>   * Return the feature size supported by the kernel.
>   *
>   * Depending on the value returned by getauxval(AT_RSEQ_FEATURE_SIZE):
>   *
> - * 0:   Return ORIG_RSEQ_FEATURE_SIZE (20)
> + *   0: Return ORIG_RSEQ_FEATURE_SIZE (20)
>   * > 0: Return the value from getauxval(AT_RSEQ_FEATURE_SIZE).
>   *
>   * It should never return a value below ORIG_RSEQ_FEATURE_SIZE.
>   */
> -static
> -unsigned int get_rseq_kernel_feature_size(void)
> +static unsigned int get_rseq_kernel_feature_size(void)
>  {
>         unsigned long auxv_rseq_feature_size, auxv_rseq_align;
>
> @@ -152,15 +141,24 @@ unsigned int get_rseq_kernel_feature_siz
>                 return ORIG_RSEQ_FEATURE_SIZE;
>  }
>
> -int rseq_register_current_thread(void)
> +int __rseq_register_current_thread(bool nolibc, bool legacy)
>  {
> +       unsigned int size;
>         int rc;
>
>         if (!rseq_ownership) {
>                 /* Treat libc's ownership as a successful registration. */
> -               return 0;
> +               return nolibc ? -EBUSY : 0;
>         }
> -       rc = sys_rseq(&__rseq.abi, get_rseq_min_alloc_size(), 0, RSEQ_SIG);
> +
> +       /* The minimal allocation size is 32, which is the legacy allocation size */
> +       size = get_rseq_kernel_feature_size();
> +       if (legacy || size < ORIG_RSEQ_ALLOC_SIZE)
> +               rseq_alloc_size = ORIG_RSEQ_ALLOC_SIZE;
> +       else
> +               rseq_alloc_size = size;
> +
> +       rc = sys_rseq(&__rseq.abi, rseq_alloc_size, 0, RSEQ_SIG);
>         if (rc) {
>                 /*
>                  * After at least one thread has registered successfully
> @@ -179,9 +177,8 @@ int rseq_register_current_thread(void)
>          * The first thread to register sets the rseq_size to mimic the libc
>          * behavior.
>          */
> -       if (RSEQ_READ_ONCE(rseq_size) == 0) {
> -               RSEQ_WRITE_ONCE(rseq_size, get_rseq_kernel_feature_size());
> -       }
> +       if (RSEQ_READ_ONCE(rseq_size) == 0)
> +               RSEQ_WRITE_ONCE(rseq_size, size);
>
>         return 0;
>  }
> @@ -194,7 +191,7 @@ int rseq_unregister_current_thread(void)
>                 /* Treat libc's ownership as a successful unregistration. */
>                 return 0;
>         }
> -       rc = sys_rseq(&__rseq.abi, get_rseq_min_alloc_size(), RSEQ_ABI_FLAG_UNREGISTER, RSEQ_SIG);
> +       rc = sys_rseq(&__rseq.abi, rseq_alloc_size, RSEQ_ABI_FLAG_UNREGISTER, RSEQ_SIG);
>         if (rc)
>                 return -1;
>         return 0;
> --- a/tools/testing/selftests/rseq/rseq.h
> +++ b/tools/testing/selftests/rseq/rseq.h
> @@ -8,6 +8,7 @@
>  #ifndef RSEQ_H
>  #define RSEQ_H
>
> +#include <assert.h>
>  #include <stdint.h>
>  #include <stdbool.h>
>  #include <pthread.h>
> @@ -142,7 +143,12 @@ static inline struct rseq_abi *rseq_get_
>   * succeed. A restartable sequence executed from a non-registered
>   * thread will always fail.
>   */
> -int rseq_register_current_thread(void);
> +int __rseq_register_current_thread(bool nolibc, bool legacy);
> +
> +static inline int rseq_register_current_thread(void)
> +{
> +       return __rseq_register_current_thread(false, false);
> +}
>
>  /*
>   * Unregister rseq for current thread.
>
