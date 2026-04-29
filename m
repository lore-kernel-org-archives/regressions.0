Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681AF3C456F
	for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455318; cv=pass; b=laQCWqhK8MfWjplTCWct/2tGmBPhT+zJe913s5dZwBKlNz/TiKIZV0olfWJUQ9E9txQCIkz1ibrq15n0bUqG4ENL2SmxC9YNCyItiNAt7QiC4kDsdlhcvWp9Yl7mLQomcvgOdtAMxZeXTiAtGLGeQewGme72TltNEzYGfAckZo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455318; c=relaxed/simple;
	bh=jZK37VZshc9OTqRuTuWNDdNF5ufm1Ubrk/MXTADk71w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCmUWAOKxI6e7dGJ6Hg6uO1+Jt9kqtRfqUQwW36Vsf6uDQ32qZdmhOuOgSPD9wZAqAvSLSkvI6jIjSxfOfHezFwxDrkHyGtBlZbPU68ucfU6b6uUN3EomIDjg+1NNUuHLGzqMxZmpYNtUZ6uWBOeyIMJ+Uivg0rSrsZxTxoSrkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CjjQKGE+; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CjjQKGE+"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38be5e86918so138347841fa.3
        for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 02:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777455315; cv=none;
        d=google.com; s=arc-20240605;
        b=EDCsHtsFoOGBYMFQyFM9YkxDvhId0LQkZp5rMJ6nAZjkp3gPc9ba3Bf7qEv7fp800g
         +Bqd0J8gfncGp+QqzZIzAd9CrOFbcx6v2SUTOobD8gL/NbDp4xPlt1wrJ0x3DpkY9Q+n
         604nXgJxGbfJbx0BHaJfL1qEBUP36R1izdZhKXMsyyFFTi/0n3OrQA11OfXINIvShx9I
         lWmjzm/YnlEicgZzxlfe/9YqwbQ/VfzBxVOd//VqkdUgQBf6JRoYzzmbkM0XlifaW7z9
         E0F0FjyqYamOL1JqTy3QWe+6TTxETGMVkTNCQhNl1nJFPP1uUQKFgIW1t3Lw99hgkYU6
         BZ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CTqPTZBHD/9uChXCry7snoC28fLQYhte0n0Yls8tPQA=;
        fh=6uYZJZgax3wm4v185DUGyX55bwD/aSWZd2p8fHQuNjE=;
        b=i3GRGqWaRe2yFfS9rNyBFlMmDDSzHOYkLQm8P9M0sGeA2iuzcINm1J5pp2RFVxT7kL
         69eDMH0R3f+6yALAPgOjmm90jGqbTY8BfYsHQGdTIOV+8O4unIlTEIeMy9hIB0QpZigg
         FU1GnwfDrBt0jeUYkMCu/2oov3avB/UWA1EwG2sZHRsUVGRmD7LsZ9lD5XVoRrBTrnYq
         mKW18JJ0AeK9StyPXTAi+tagoVsVZlVyZsAUZvYQxp7OJEXgrhgEUogk2UB560xROJgL
         LNonKiucn2Gv08lcliFhavlTmkc28lCYmO46P1ibiMUEhcW+PQXPWnQmzpJ+mcfXeQP6
         jxxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777455315; x=1778060115; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CTqPTZBHD/9uChXCry7snoC28fLQYhte0n0Yls8tPQA=;
        b=CjjQKGE+yBWLVc5Pn8ZpEBK+9f0wmKPBFPwjoyaiW7wgd+VdNMQj07goRLrvz8Fa0S
         7aYPd6Z1bQBCGrY6m5OTAHzIkpGMBrN/lh4nNPubSO5rY7Xom4olToFX+N5UEYFDQQBh
         txC2WuOFl1Bd/Os6MHYZlMVHte58n+GSnIzpBRAifPUoCkAYXMjv5efdjbq207oYAkEi
         ntfU5S9zaguSLfPe7nQJSRQn5yDgLkAsH05TTheSzMvI2T9ja48M6oVp8WwHUKq2BSI6
         dzF3gyHGRRAljhxHPymnk0c5vw8SlSvTF/oPPToKdh67BHGL6woGhGgzWQWsLCN13xp7
         LK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455315; x=1778060115;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTqPTZBHD/9uChXCry7snoC28fLQYhte0n0Yls8tPQA=;
        b=VrGu1nGxVObAkMELVaA0gDDj5bBt142+iRSs9/99j4uuKrtrw+aIf022wGQNUH4KK3
         rSiJt6bhdlvfcmxIzUDw+4VXqflxQqNu8MOi3L/9PkJ5kxuSLgBWsWOTMXFt48OF37c6
         EAzGqZ76vaPG0XIJsB2Sd5D7Xn7+MwthhyzgeingF3vgsYAjxYEjBZLQIG1OFDmmmKaR
         h6leUcrfOFCnHUbmBX6nD100/cGMmlV04PhVnvJhs4wiMfX+NZ6cJYVIqarUj38CVSBW
         WYVcfGPcAtfw1o92/fmeI9tHikFOgaR/YFdCSz4dH0F/tf86wT3SPosR1LTgNrYTHGNQ
         kgVA==
X-Forwarded-Encrypted: i=1; AFNElJ9wapy5Sl7Zs4oUO2z1QNHWEyzLDrQe4tA6lfMOfPT8x5J2XP6xxiUjBS20TNcUFmBJ+xtabQSkTkKtQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsbaWWDAGK2nNI3zcEiEvv8IdQkrXC1fuUOuuh3lLnCdEGtXTL
	lWBbXl6sWmCUl569VoYudMoDhUWvwh9nXlsNyuivxdwZDX0mTqL5Y8ELuSXgkR6Ny8V2R3DNEVs
	3DtPJLgoPk3/98Yx6HjgM2ffUYbBdZLBY9Fm+vrPE
X-Gm-Gg: AeBDieuztB5eruesFL9YWlxK3Yerms8dzV/4Tn5/Q+Sk3GNxis3CdiSV0nsro+wiwE8
	pAWyu6DpDDOlc8ufhi1LmFy701aUxo9PrlsG6Lra8/3OTmCn0SdfLPb4s3kA3aMoWoRb0xwKx2M
	7/FogfYFa/cM5WjqsrYnWzFVX+EbA3II47ymw6jVpyFBXmty1XYa7io+7nPVkWpWhRxlWHaWASB
	Jzkotqeo1Ree0Q3Wi/ecquCZWX7fjEwIbjAoAsue2qi/E4mYius44p63NSSNpHGLIP+A4VvSU1y
	GcwWqkZ0gVXO/KPS87t9OOKjqB0DWrvxk/NqcgLnvUf4KcsNo5CiH8/Hs896g5hU50KvgnXuxxI
	bAuIb9cp9YkgHbrbtTQ==
X-Received: by 2002:a2e:be26:0:b0:38e:85a3:fdf5 with SMTP id
 38308e7fff4ca-3924bcb5941mr14376271fa.18.1777455314041; Wed, 29 Apr 2026
 02:35:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428221058.149538293@kernel.org> <20260428224427.764705536@kernel.org>
In-Reply-To: <20260428224427.764705536@kernel.org>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 29 Apr 2026 11:35:02 +0200
X-Gm-Features: AVHnY4IMP8uHm-SXEy98XanPm7zT4kZoyO_P9yeQ1Vn6pCoq6MY0VbVg44eXqdU
Message-ID: <CACT4Y+YEyR9X0D6ap94ttUv3byM7gSn+zJUsfGQ69-eSREnBPw@mail.gmail.com>
Subject: Re: [patch 07/10] selftests/rseq: Validate legacy behavior
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
> The RSEQ legacy mode behavior requires that the ID fields in the rseq
> region are unconditionally updated on every context switch and before
> signal delivery even if not required by the ABI specification.
>
> To ensure that this behavior is preserved for legacy users in the future,
> add a test which validates that with a sleep() and a signal sent to self.
>
> Provide a run script which prevents GLIBC from registering a RSEQ region,
> so that the test can register it's own legacy sized region.
>
> Fixes: 566d8015f7ee ("rseq: Avoid CPU/MM CID updates when no event pending")
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: stable@vger.kernel.org

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
>  tools/testing/selftests/rseq/Makefile            |    4 -
>  tools/testing/selftests/rseq/legacy_check.c      |   65 +++++++++++++++++++++++
>  tools/testing/selftests/rseq/run_legacy_check.sh |    4 +
>  3 files changed, 71 insertions(+), 2 deletions(-)
>
> --- a/tools/testing/selftests/rseq/Makefile
> +++ b/tools/testing/selftests/rseq/Makefile
> @@ -17,11 +17,11 @@ OVERRIDE_TARGETS = 1
>  TEST_GEN_PROGS = basic_test basic_percpu_ops_test basic_percpu_ops_mm_cid_test param_test \
>                 param_test_benchmark param_test_compare_twice param_test_mm_cid \
>                 param_test_mm_cid_benchmark param_test_mm_cid_compare_twice \
> -               syscall_errors_test slice_test
> +               syscall_errors_test slice_test legacy_check
>
>  TEST_GEN_PROGS_EXTENDED = librseq.so
>
> -TEST_PROGS = run_param_test.sh run_syscall_errors_test.sh
> +TEST_PROGS = run_param_test.sh run_syscall_errors_test.sh run_legacy_check.sh
>
>  TEST_FILES := settings
>
> --- /dev/null
> +++ b/tools/testing/selftests/rseq/legacy_check.c
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#ifndef _GNU_SOURCE
> +#define _GNU_SOURCE
> +#endif
> +
> +#include <errno.h>
> +#include <signal.h>
> +#include <stdint.h>
> +#include <unistd.h>
> +
> +#include "rseq.h"
> +
> +#include "../kselftest_harness.h"
> +
> +FIXTURE(legacy)
> +{
> +};
> +
> +static int cpu_id_in_sigfn = -1;
> +
> +static void sigfn(int sig)
> +{
> +       struct rseq_abi *rs = rseq_get_abi();
> +
> +       cpu_id_in_sigfn = rs->cpu_id_start;
> +}
> +
> +FIXTURE_SETUP(legacy)
> +{
> +       int res = __rseq_register_current_thread(true, true);
> +
> +       switch (res) {
> +       case -ENOSYS:
> +               SKIP(return, "RSEQ not enabled\n");
> +       case -EBUSY:
> +               SKIP(return, "GLIBC owns RSEQ. Disable GLIBC RSEQ registration\n");
> +       default:
> +               ASSERT_EQ(res, 0);
> +       }
> +
> +       ASSERT_NE(signal(SIGUSR1, sigfn), SIG_ERR);
> +}
> +
> +FIXTURE_TEARDOWN(legacy)
> +{
> +}
> +
> +TEST_F(legacy, legacy_test)
> +{
> +       struct rseq_abi *rs = rseq_get_abi();
> +
> +       ASSERT_NE(rs, NULL);
> +
> +       /* Overwrite rs::cpu_id_start */
> +       rs->cpu_id_start = -1;
> +       sleep(1);
> +       ASSERT_NE(rs->cpu_id_start, -1);
> +
> +       rs->cpu_id_start = -1;
> +       ASSERT_EQ(raise(SIGUSR1), 0);
> +       ASSERT_NE(rs->cpu_id_start, -1);
> +       ASSERT_NE(cpu_id_in_sigfn, -1);
> +}
> +
> +TEST_HARNESS_MAIN
> --- /dev/null
> +++ b/tools/testing/selftests/rseq/run_legacy_check.sh
> @@ -0,0 +1,4 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +GLIBC_TUNABLES="${GLIBC_TUNABLES:-}:glibc.pthread.rseq=0" ./legacy_check
>
