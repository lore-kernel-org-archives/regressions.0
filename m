Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A023CA4B2
	for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 09:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455351; cv=pass; b=QNsuuZcnArZViCn727EbafSd7h/5f92Yh8tEXAT/0uNHhfdyHwEoakAXrGvjmCLRnEgaaCfzdkF+WkzqaPMTUg5+R5sVduJdkTvlEVuCYjNx2fPqfBhdH8SeZXP3HyYz4bSWPw+dQ8EFsxsXDu/zOQfOvGDdVZbkNBvwlcCyeuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455351; c=relaxed/simple;
	bh=R0OvMTCArEa6VcQHf94Bjb5fVmkI+2ZMgw6rEAreSHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJIxCd9uSycYcKr45bekJvoOu2FdzddozvHRfzU6sBZVF3Iat6HENzgYhDtrp87fDH7Q6y1XUskJO824mEdFjurIaDlLO4QFdvxEJEoPy16SbUe4SLZFDdUEm+u2kaWhZlXAHc6gZwPljvFas0O7LpstK1vX+xBguxcVAJNV3b0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IXwHXHIp; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IXwHXHIp"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38e9653b580so137832091fa.2
        for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 02:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777455348; cv=none;
        d=google.com; s=arc-20240605;
        b=OLJKGKsxEJcKWGJ98MEBQ2v17GL61QxgVPySUdfEhzH3jiZsFNj8zxKzM7lI9zA96U
         0JoUPx9FuBg2hlEowOydL5CVXY71epjKZ79ZNoa7kJZVZkTwmjmX+K1xXDL+Yb7nk8mG
         QskpqSbyWSbM1mxBWPI1l7Xo91xfL5ndpmUTMZ64dEaajpFN7Wfn9VyjE3uW/3FmM++R
         1FncjQgB0QWr5TWaLbUpDP/IMZJ6qbmKuL697T1CVSceNa5luIUMLNySKmBG26KJD7WF
         QmOU2Ilpkc+GzYPx6afoMUi9VMwl3NeLfDmuggdLrPAg0DZyYb4k19MJT2xnz7hx8jhT
         hAGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=euQZZG6zQp/9wRvxqq+lTd5t7Vj1Lm8yoSr7I+5xZqI=;
        fh=vPNH6Xq2q8VBlgl0UUzrN+wsD+rL7EFrsVFTJnHkF6w=;
        b=DplyUi3e/uy9Tu5RRM5cl+VPtHZMEnVWuVZS0oQSKISNbNdaYtMlZNJU/5seU7EuGu
         Y0cUrGk31670E0O1wT7AUfokKPvZmcU5MiPIZt2uGAq+qQSzlHnWdL0KABcyFnCHF3rf
         QtOx5U2KfY6FQ+hueCGfo58XG75qploQPxoWZjZXg0Myc2mJhZWhOU6BM78AKNZgK5Hw
         aArS+d+Wc3Yjbg59yT9pm3KF/7e6r6TjHohZIWxnYtDgkgdgqVtKFvefcKfuSfl86t0+
         aiRTchh0nSLny4EROB6O15YMj9MTHvpM1SygcK2F3a/IqMABE9uqiDLtbuKjZ8PHvjTg
         zdCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777455348; x=1778060148; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=euQZZG6zQp/9wRvxqq+lTd5t7Vj1Lm8yoSr7I+5xZqI=;
        b=IXwHXHIpSDaYd5rNxthoKrFXwYD9MUL23zGjSvN0JtSaOhTstpMJhHgzRmtYsAnF0M
         L1efZULaDfaqSlfnOtY8eIPDcYrQogBh9kowVooOkic9AHbOyyfClabeT+A7PgZZeT5l
         NADESCaedcUdoyhhm2M84IZmbz3FgAVMeyLimFjMGabF0KMu5V6cEV8/N9aimGQXwfZ5
         P6taCTVHn3KxtlT8US+Jpzu+MnClk4CQYFC7dCfY7E7iTt/alhdf2NNYx8SKxnT1PmSZ
         ZyrErFBMiXI3BA2yRZznut1yfIhfEUhu+/qlyQHdTp56j49FYNyTXquFhonGSIzV4t0I
         ix3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455348; x=1778060148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euQZZG6zQp/9wRvxqq+lTd5t7Vj1Lm8yoSr7I+5xZqI=;
        b=Uui7+Bhxf7tEWcIFt1bHSTPW4qG+HMOTONxw12k6+DYF6cKXipf+sYCDty2ZlhHrlY
         jmMKlkYZRDRfTscmEWLT0NRkUcDpPwI95nwZHKlL+X0thIgguT/C4bz5RuYlrNTe7PeM
         ZrHzkeOuwU7LW0rp14WumWmsUnV5bMQMJRTLXP9kacN0qctuH0hdYOqKEzRwmD0ySE0l
         2PLijF4g9V8E++T6n0BfQEzLPfWWeFzET4cBaK8GE0/RtvXN6dnQT8Yx/Mvu25kMoZ4P
         3sfUYiHducgILZAV6CvQrbJkc58vgHqiN4N3TlY8mW2f7+yObq1Wk6AmXhiZ69zEZDza
         qhBw==
X-Forwarded-Encrypted: i=1; AFNElJ9/WqkhwCNqQHA+wguCzOqcvwrRASWcdXXX0583WPNMXr7QEyC+Frothl/dpvmf0dtCF03l+TS6zyMxbg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/XsN7YUmUNW/FeOfvcHSx58uUUxtG+no5qP43YGv2qJvvJiyX
	+0OlKx2A29PcpdsGId0wf7eKXd/xHRSW6XKrgQDIPVk/6huQd+jxqEkbkQx2ARTfYyaonapUTWC
	nY8DN6cR0k2ZtXBsT8fu8TmdVWVEGRMho53HGerDK
X-Gm-Gg: AeBDieuOc/f7NYCX4GpR1sYDX6b5yOqJSeM21WEDykKte1OPUTdmQDrG2qCpMZpmtU/
	lWOHbPmf4jmgUtvP5QZgWDjhN6mU+KT52ZuRHyyg5YmdSJTrnBpypMrJzM1FTC6tsmhC18L0WPB
	WFuweAptPHR0ImLjhGdPTiXf1YGoBPL3W+kSKj1S8LfWPOUUt6FrUOlyMAbxdZ3neeuR3XqAP+J
	zGFje87XTa5dMra4itUpbB0ljv0WXnbK3zafl17xdaEztMLt1vVtdbKXONhoYdPF3j/xIyIGK45
	oGQs+B3ZD2YuACt58ZdVavk7WTAw32mZRSKknArrKvfY41I2sW1IePL8onZoHlwiLU7iTjxDHU1
	PcXSBstJUYFKTdnVOHrSjetAV3sj5
X-Received: by 2002:a2e:bc11:0:b0:38e:b7ba:106e with SMTP id
 38308e7fff4ca-3924bd35c34mr13008161fa.31.1777455347704; Wed, 29 Apr 2026
 02:35:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428221058.149538293@kernel.org> <20260428224428.009121296@kernel.org>
In-Reply-To: <20260428224428.009121296@kernel.org>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 29 Apr 2026 11:35:35 +0200
X-Gm-Features: AVHnY4JZrVwQtMXb6Hn_c8EdH4qaAGhGec_kmcU19r2l_sbiixjINIDQ5dbikno
Message-ID: <CACT4Y+ZVmKfHiMCSM6gbRXcc=n-cgCJWUGsxLmg-oV-HGXGMgg@mail.gmail.com>
Subject: Re: [patch 10/10] selftests/rseq: Expand for optimized RSEQ ABI v2
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
> Update the selftests so they are executed for legacy (32 bytes RSEQ region)
> and optimized RSEQ ABI v2 mode.
>
> Fixes: d6200245c75e ("rseq: Allow registering RSEQ with slice extension")
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: stable@vger.kernel.org

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
>  tools/testing/selftests/rseq/Makefile              |    7 ++-
>  tools/testing/selftests/rseq/check_optimized.c     |   17 +++++++++
>  tools/testing/selftests/rseq/param_test.c          |   22 +++++++----
>  tools/testing/selftests/rseq/run_param_test.sh     |   39 +++++++++++++++++++++
>  tools/testing/selftests/rseq/run_timeslice_test.sh |   14 +++++++
>  tools/testing/selftests/rseq/slice_test.c          |    2 -
>  6 files changed, 89 insertions(+), 12 deletions(-)
>
> --- a/tools/testing/selftests/rseq/Makefile
> +++ b/tools/testing/selftests/rseq/Makefile
> @@ -17,11 +17,11 @@ OVERRIDE_TARGETS = 1
>  TEST_GEN_PROGS = basic_test basic_percpu_ops_test basic_percpu_ops_mm_cid_test param_test \
>                 param_test_benchmark param_test_compare_twice param_test_mm_cid \
>                 param_test_mm_cid_benchmark param_test_mm_cid_compare_twice \
> -               syscall_errors_test slice_test legacy_check
> +               syscall_errors_test slice_test legacy_check check_optimized
>
>  TEST_GEN_PROGS_EXTENDED = librseq.so
>
> -TEST_PROGS = run_param_test.sh run_syscall_errors_test.sh run_legacy_check.sh
> +TEST_PROGS = run_param_test.sh run_syscall_errors_test.sh run_legacy_check.sh run_timeslice_test.sh
>
>  TEST_FILES := settings
>
> @@ -62,3 +62,6 @@ include ../lib.mk
>
>  $(OUTPUT)/slice_test: slice_test.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
>         $(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
> +
> +$(OUTPUT)/check_optimized: check_optimized.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
> +       $(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
> --- /dev/null
> +++ b/tools/testing/selftests/rseq/check_optimized.c
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: LGPL-2.1
> +#define _GNU_SOURCE
> +#include <assert.h>
> +#include <sched.h>
> +#include <signal.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/time.h>
> +
> +#include "rseq.h"
> +
> +int main(int argc, char **argv)
> +{
> +       if (__rseq_register_current_thread(true, false))
> +               return -1;
> +       return 0;
> +}
> --- a/tools/testing/selftests/rseq/param_test.c
> +++ b/tools/testing/selftests/rseq/param_test.c
> @@ -38,7 +38,7 @@ static int opt_modulo, verbose;
>  static int opt_yield, opt_signal, opt_sleep,
>                 opt_disable_rseq, opt_threads = 200,
>                 opt_disable_mod = 0, opt_test = 's';
> -
> +static bool opt_rseq_legacy;
>  static long long opt_reps = 5000;
>
>  static __thread __attribute__((tls_model("initial-exec")))
> @@ -481,7 +481,7 @@ void *test_percpu_spinlock_thread(void *
>         long long i, reps;
>
>         if (!opt_disable_rseq && thread_data->reg &&
> -           rseq_register_current_thread())
> +           __rseq_register_current_thread(true, opt_rseq_legacy))
>                 abort();
>         reps = thread_data->reps;
>         for (i = 0; i < reps; i++) {
> @@ -558,7 +558,7 @@ void *test_percpu_inc_thread(void *arg)
>         long long i, reps;
>
>         if (!opt_disable_rseq && thread_data->reg &&
> -           rseq_register_current_thread())
> +           __rseq_register_current_thread(true, opt_rseq_legacy))
>                 abort();
>         reps = thread_data->reps;
>         for (i = 0; i < reps; i++) {
> @@ -712,7 +712,7 @@ void *test_percpu_list_thread(void *arg)
>         long long i, reps;
>         struct percpu_list *list = (struct percpu_list *)arg;
>
> -       if (!opt_disable_rseq && rseq_register_current_thread())
> +       if (!opt_disable_rseq && __rseq_register_current_thread(true, opt_rseq_legacy))
>                 abort();
>
>         reps = opt_reps;
> @@ -895,7 +895,7 @@ void *test_percpu_buffer_thread(void *ar
>         long long i, reps;
>         struct percpu_buffer *buffer = (struct percpu_buffer *)arg;
>
> -       if (!opt_disable_rseq && rseq_register_current_thread())
> +       if (!opt_disable_rseq && __rseq_register_current_thread(true, opt_rseq_legacy))
>                 abort();
>
>         reps = opt_reps;
> @@ -1105,7 +1105,7 @@ void *test_percpu_memcpy_buffer_thread(v
>         long long i, reps;
>         struct percpu_memcpy_buffer *buffer = (struct percpu_memcpy_buffer *)arg;
>
> -       if (!opt_disable_rseq && rseq_register_current_thread())
> +       if (!opt_disable_rseq && __rseq_register_current_thread(true, opt_rseq_legacy))
>                 abort();
>
>         reps = opt_reps;
> @@ -1258,7 +1258,7 @@ void *test_membarrier_worker_thread(void
>         const int iters = opt_reps;
>         int i;
>
> -       if (rseq_register_current_thread()) {
> +       if (__rseq_register_current_thread(true, opt_rseq_legacy)) {
>                 fprintf(stderr, "Error: rseq_register_current_thread(...) failed(%d): %s\n",
>                         errno, strerror(errno));
>                 abort();
> @@ -1323,7 +1323,7 @@ void *test_membarrier_manager_thread(voi
>         intptr_t expect_a = 0, expect_b = 0;
>         int cpu_a = 0, cpu_b = 0;
>
> -       if (rseq_register_current_thread()) {
> +       if (__rseq_register_current_thread(true, opt_rseq_legacy)) {
>                 fprintf(stderr, "Error: rseq_register_current_thread(...) failed(%d): %s\n",
>                         errno, strerror(errno));
>                 abort();
> @@ -1475,6 +1475,7 @@ static void show_usage(int argc, char **
>         printf("        [-D M] Disable rseq for each M threads\n");
>         printf("        [-T test] Choose test: (s)pinlock, (l)ist, (b)uffer, (m)emcpy, (i)ncrement, membarrie(r)\n");
>         printf("        [-M] Push into buffer and memcpy buffer with memory barriers.\n");
> +       printf("        [-O] Test with optimized RSEQ\n");
>         printf("        [-v] Verbose output.\n");
>         printf("        [-h] Show this help.\n");
>         printf("\n");
> @@ -1602,6 +1603,9 @@ int main(int argc, char **argv)
>                 case 'M':
>                         opt_mo = RSEQ_MO_RELEASE;
>                         break;
> +               case 'L':
> +                       opt_rseq_legacy = true;
> +                       break;
>                 default:
>                         show_usage(argc, argv);
>                         goto error;
> @@ -1618,7 +1622,7 @@ int main(int argc, char **argv)
>         if (set_signal_handler())
>                 goto error;
>
> -       if (!opt_disable_rseq && rseq_register_current_thread())
> +       if (!opt_disable_rseq && __rseq_register_current_thread(true, opt_rseq_legacy))
>                 goto error;
>         if (!opt_disable_rseq && !rseq_validate_cpu_id()) {
>                 fprintf(stderr, "Error: cpu id getter unavailable\n");
> --- a/tools/testing/selftests/rseq/run_param_test.sh
> +++ b/tools/testing/selftests/rseq/run_param_test.sh
> @@ -34,6 +34,11 @@ REPS=1000
>  SLOW_REPS=100
>  NR_THREADS=$((6*${NR_CPUS}))
>
> +# Prevent GLIBC from registering RSEQ so the selftest can run in legacy and
> +# performance optimized mode.
> +GLIBC_TUNABLES="${GLIBC_TUNABLES:-}:glibc.pthread.rseq=0"
> +export GLIBC_TUNABLES
> +
>  function do_tests()
>  {
>         local i=0
> @@ -103,6 +108,40 @@ function inject_blocking()
>         NR_LOOPS=
>  }
>
> +echo "Testing in legacy RSEQ mode"
> +echo "Yield injection (25%)"
> +inject_blocking -m 4 -y -L
> +
> +echo "Yield injection (50%)"
> +inject_blocking -m 2 -y -L
> +
> +echo "Yield injection (100%)"
> +inject_blocking -m 1 -y -L
> +
> +echo "Kill injection (25%)"
> +inject_blocking -m 4 -k -L
> +
> +echo "Kill injection (50%)"
> +inject_blocking -m 2 -k -L
> +
> +echo "Kill injection (100%)"
> +inject_blocking -m 1 -k -L
> +
> +echo "Sleep injection (1ms, 25%)"
> +inject_blocking -m 4 -s 1 -L
> +
> +echo "Sleep injection (1ms, 50%)"
> +inject_blocking -m 2 -s 1 -L
> +
> +echo "Sleep injection (1ms, 100%)"
> +inject_blocking -m 1 -s 1 -L
> +
> +./check_optimized || {
> +    echo "Skipping optimized RSEQ mode test. Not supported";
> +    exit 0
> +}
> +
> +echo "Testing in optimized RSEQ mode"
>  echo "Yield injection (25%)"
>  inject_blocking -m 4 -y
>
> --- /dev/null
> +++ b/tools/testing/selftests/rseq/run_timeslice_test.sh
> @@ -0,0 +1,14 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0+
> +
> +# Prevent GLIBC from registering RSEQ so the selftest can run in legacy
> +# and performance optimized mode.
> +GLIBC_TUNABLES="${GLIBC_TUNABLES:-}:glibc.pthread.rseq=0"
> +export GLIBC_TUNABLES
> +
> +./check_optimized || {
> +    echo "Skipping optimized RSEQ mode test. Not supported";
> +    exit 0
> +}
> +
> +./slice_test
> --- a/tools/testing/selftests/rseq/slice_test.c
> +++ b/tools/testing/selftests/rseq/slice_test.c
> @@ -124,7 +124,7 @@ FIXTURE_SETUP(slice_ext)
>  {
>         cpu_set_t affinity;
>
> -       if (rseq_register_current_thread())
> +       if (__rseq_register_current_thread(true, false))
>                 SKIP(return, "RSEQ not supported\n");
>
>         if (prctl(PR_RSEQ_SLICE_EXTENSION, PR_RSEQ_SLICE_EXTENSION_SET,
>
