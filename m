Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C8939A802
	for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 09:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455301; cv=pass; b=nFSnlpr19NOJlB5GZLW2Oo/1lAZP3tnk1ABgJgBfpRFCnrgABorlvwYKg7lY6QwJIq+wLo9fp0sRTzOe+3U/67GL5sP2IFY80ad6kWmqDKBqd8UXd258YCPFwI4/raPsCQoRM/Pt0xmO/bP36C8iqauIa+rncKOZ0Qkw6NKSDbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455301; c=relaxed/simple;
	bh=WFPXOdUfUhcQJaT3wQld7jY48Pzs+QBJm0E36HjZ4kE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kp/eK2Hn7DbcJl4vrFZgSaG+c2RFdLdzJRsBWsa2OWquyWFAfxjpaGIAPgwPkm8kqbcPnTE0ZIW04b0v0La0b4245B9AZQjFkX/FmG4ib/IVLdbFjLhP1bL4jIsrDtWIUEOp3KTCoAIU3sdtfw/nYE5s97W7bIc8j9d7cHEbH1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ljJkes/u; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ljJkes/u"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a3d1561e38so10215565e87.0
        for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 02:34:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777455298; cv=none;
        d=google.com; s=arc-20240605;
        b=Wc/66mK41GFLpl1AclGByhb64UnaZ41EVFEjrFEnQK+zqRqGmH31plSY36LThSfMja
         f+7oqgf5VfEI4Y2VtzJDmgTymOqynJm1+g9KUSnkgZtZUWRtVZJ1WVFPvF6HvIjDBC60
         I9uByE5Snn5hvaQX86DSqKcm6X2ytn4/01Ooki7vt1Lbxh5EIxX3OrNOpBR1FxwGYlGl
         AVZzNFQWaOIDnZEgvkVaLBj08FNV+QJMg6nu8vEvAj6t2FkMFxIXtNBsST1pp+mKnUwF
         uVwcYFd4Y1uh2oZSacfiBYcFj9uWEB35y6ezBL3sjLkxBnMRkv2EAgni1WePdDJ1HC0O
         AGFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=w1xdBKoNA4HLEY1i+Fc9mPzzBOsyjz9NyeijIXVfvpM=;
        fh=K/hMpmTO64ZBNPZdvdETOdcZ32fhr+iI8xPhcGhU54k=;
        b=VgqYEGkAWsmrEqtiTUfaLr5LmPv9+l50s+WQwrJbbiV968eF7OVp9W330n3/J0bxTt
         JiVGnNoaADPppvmKgs3EnvUlk8pxWLIBHlQUPGxC4ed26ni2egBckTemdFizEb7lQE9h
         adt/2AcZtIAIZdFbBRJcxluDqGuUESWGJjvHgDl+FZNyg/EqKMVxaWgP9qmR8jTbkN+b
         ERf3N9HHPMfCj+E9/+Jb2BwPC1ZIi/s+OjU36kSeCqfDOKgZNkAFEwCHf3oHhmLdqJvN
         zxmSlr82WMSuf7Fi56UrieOj4GJD6zkqrU3nSFWrqcLaDL4OspJZPQCwb0Mn68MP64ae
         WlkQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777455298; x=1778060098; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w1xdBKoNA4HLEY1i+Fc9mPzzBOsyjz9NyeijIXVfvpM=;
        b=ljJkes/uQDBa8ODNY9pAx+39TN2pcw1VgozZDavTerkUIDVUlXWbQBpk0Cdfo5nnjs
         FaKiz9vsZmaLNxmKv4jN3+nJ45HZBW2cS5aBrplyY7vnn4/PtHFEn+382ZkXt0FdgEvn
         QSTd9z/c882G1wwKYUDvqUGJHfheRR4dXZ2V2oO5NejxBnSqvupnFZEAWWyNqvmDXPUL
         jsOyt4prpEbBU6z9xsm7+yifpVaukStQi5G3NvfqTRGjXkC0Hp035Vlt+60iWc9NNSb5
         bbeEB7Pbo51L/kCIkRWk8UgkT9psTbrEdvx2ifQYNCjgdUIwHMZfnefSBfzHtvSALG9H
         3DFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455298; x=1778060098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1xdBKoNA4HLEY1i+Fc9mPzzBOsyjz9NyeijIXVfvpM=;
        b=BlYUN5wUEm5gKj5qVo3Ga7ECUjDFgtK8Ol3rQOLJBmzQOSYF+W6OKKBLC+N3gcpHzU
         CBbunHSCkqI3vqBDxGwJTXjixY2mHCD5uyNARvQzgAWg19+5Z79ibzG48BysOdNsKv98
         tGhQ1mS3tZSk9uJwimRsVNwkxaqOK1m4fX+MPdNptqiwkKXYFz31HFD0tFb1+KbjHEuo
         gUd+qwx1M/DPmFdAEsNRtY4Iwc1Y8IHVuk/EPVL/dQW+ODetnmd7QJrukrWg2W/c8SFi
         WvmxoulVEEpmwgOktqMHYYo8IQoex0MSbJespKBtC4lyxhHHCAqa4cswpgwkTBvb//Xd
         jqJg==
X-Forwarded-Encrypted: i=1; AFNElJ+nPHPkfYo/N3dAELmytP1fWkDI6Os78m6R4scea5GFXxVjGLg+eGgmWUUeQJZxRxpnqaQ8XuwrI7k1Lg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqKUDD9INdskQiiAPNFKgxE7I2v0GX4Q+VXBOHDZ67FGARqkUv
	huHpTdwKevoO4UUTrEic0yWuWBe7BTXveDuDGDERV/Zrk3AR6/IPcUqQN6M2KxoN+JI/fYwpeQw
	HeXR3iuHGNOH0QNnrNGSmH0w8/BeEHoMk1a0T7IE6
X-Gm-Gg: AeBDievpLlqS2rSabWWnPhTNGld78z9/Xw39gz46p4+uKXcXKTxrnSrJuNUwVVuMpXM
	HgC/YP27wKOpWOvTQkFj9pqTy+tbz1PfpBRHL+pU+sUnoz80r/85HjvDV9qx9faCkZ6vDNWaN4o
	BgEJNSvqN9E+54Sebk79AeQblaUqyhd5j1glD7K6ZYhXY6E+/t4+cXHNW96SKziJ3oNlFPazoqJ
	j2c9wu4DzuoCuWvSKBvXAB6A6WFnY3Sxm6Hk3o8/G9PLXIAAoAQLc+xs7szTmaPOm6E7ROlgab2
	O1VpqTFQp3lb/zld62mmV1iPz75Nz2b3s8fdG5ps+R+f/gbtgg7WwNLCpAf4HIYjLRxidlaOBN/
	/vuQJoSQM+68b4uRkHA==
X-Received: by 2002:a05:6512:1252:b0:5a4:10b5:624c with SMTP id
 2adb3069b0e04-5a749d1682dmr1067228e87.23.1777455297409; Wed, 29 Apr 2026
 02:34:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428221058.149538293@kernel.org> <20260428224427.597838491@kernel.org>
In-Reply-To: <20260428224427.597838491@kernel.org>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 29 Apr 2026 11:34:45 +0200
X-Gm-Features: AVHnY4KJd4U7ViczoZaXlFVyX0WX1LNEwyKWM4VUnvWQAXUjM1EuSCHIjvhHzY8
Message-ID: <CACT4Y+YG6u=PzvcvDHdG9FZ-QCdVTjnkevp6FJAXuiFoCq9AcA@mail.gmail.com>
Subject: Re: [patch 05/10] selftests/rseq: Skip tests if time slice extensions
 are not available
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
> Don't fail, skip the test if the extensions are not enabled at compile or
> runtime.
>
> Fixes: 830969e7821a ("selftests/rseq: Implement time slice extension test")
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: stable@vger.kernel.org

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
>  tools/testing/selftests/rseq/slice_test.c |   12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> --- a/tools/testing/selftests/rseq/slice_test.c
> +++ b/tools/testing/selftests/rseq/slice_test.c
> @@ -124,6 +124,13 @@ FIXTURE_SETUP(slice_ext)
>  {
>         cpu_set_t affinity;
>
> +       if (rseq_register_current_thread())
> +               SKIP(return, "RSEQ not supported\n");
> +
> +       if (prctl(PR_RSEQ_SLICE_EXTENSION, PR_RSEQ_SLICE_EXTENSION_SET,
> +                 PR_RSEQ_SLICE_EXT_ENABLE, 0, 0))
> +               SKIP(return, "Time slice extension not supported\n");
> +
>         ASSERT_EQ(sched_getaffinity(0, sizeof(affinity), &affinity), 0);
>
>         /* Pin it on a single CPU. Avoid CPU 0 */
> @@ -137,11 +144,6 @@ FIXTURE_SETUP(slice_ext)
>                 break;
>         }
>
> -       ASSERT_EQ(rseq_register_current_thread(), 0);
> -
> -       ASSERT_EQ(prctl(PR_RSEQ_SLICE_EXTENSION, PR_RSEQ_SLICE_EXTENSION_SET,
> -                       PR_RSEQ_SLICE_EXT_ENABLE, 0, 0), 0);
> -
>         self->noise_params.noise_nsecs = variant->noise_nsecs;
>         self->noise_params.sleep_nsecs = variant->sleep_nsecs;
>         self->noise_params.run = 1;
>
