Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A6C1A9F8D
	for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 08:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777451835; cv=pass; b=ShEfvnjZyN3frXyYnJlM3jtr9BTUnPINN2y4iDIgLf/e9OsfGi4o+beHVLOm+K4VuyeIRuUWnuStUnUpJg29O3HgGvvrnger9/GatDTpegDu++wfTplJCmUspoARi3RTrVrDAvAhFy28VFM3GR/9qsPJeCRGD4jbMI71rcyDnfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777451835; c=relaxed/simple;
	bh=p+wBY0juLjY+wIPI3CEUuk+q//2kCqOjNQiqSgAGMYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kpJ/6jske21d12KCWkUPBnXaRzilaPUIFtLDpVo8zItWqCzQ3oAL3MV6TzRqqg/2M/W9zMXwQJNiGqiqym21oiZPWB8OSa1zkl9tLngpXPLm244hPxsWBwR2klogI7rfLFBOGo30dxjKrW4E2jDRQeWpoftcAarOLxBuVIpOopY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UxQYPXan; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UxQYPXan"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a40502e63bso11074635e87.0
        for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 01:37:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777451831; cv=none;
        d=google.com; s=arc-20240605;
        b=LBASVsk5tQs/INSrWZzaDz0Pb188MzVZAQw/JC/5+HMk9zfPT+7F8DPxvEXxFrS9T9
         tv1HsmkWJKq3uDpPxNs1cNZTfU87eSfDz7UVx/INPZXcvZn3pjJ5HHuk889MsGOUJ9LM
         nm7k+SqDzE6kGYf1QvheJ/+aEp8gpvXwkH1zaSo9w8CRVzR71q6mxM+5eImcL/3uGDNA
         OwJUF3Fi/7QGqx+u0+crMILhsJXUldMChXqn4wtev7sScITPJ6Snd/PsS+s8kppZIJ3W
         b+ycp+mWsVF3IAlJ6UsT655VRCNRxal9vzwxKFNLEdvK3juvebyK1gSfzuCGjA8A4J5g
         jVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TMm2b6fcDJ4VCBGYQ5BqcAM0hKQDzqSm7Hl9JCLIH6w=;
        fh=Tg6h8gCxmXvWS5ENSOE3MjUTW7e5s6yl9zw7J9eR4Oc=;
        b=gjcDrhU13sxCJzz5pwb7qaYqjp7jNitV1qclzctksvwzzen1xVhSs0nR8R4QaoCcTD
         KMT+wWaFNkJCouYz+LaiOJg+j8ZSyylJnWZoa0PAreg/x37gVCJ8kfPITX7cBD9XIo+r
         cfq2KSCmYZNvZuLzS8q+FVFZL4E1HhMJ0xI+i3m+U4XotUmUfRGJ6G/vOBaAiMU+ahlO
         PGucNfap2GbLJCevQVugUzgE8XZIPyiqwNCF82trfwM7no3lDKlF1Nl+1vAnTskQoEKY
         2ustBcrvX+DBFdpQy2YJTOci5cfJnV14BHHrOZMWiuFSv8KLNTEOmd1TspYS/v5Q0tt2
         yyiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777451831; x=1778056631; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TMm2b6fcDJ4VCBGYQ5BqcAM0hKQDzqSm7Hl9JCLIH6w=;
        b=UxQYPXanA8dhgDrC+pO3om5mejtUAvBMXuZM9fcFQriN99cU/wRIduY9Y/MvQIeUP5
         ghH89OJI7vY9T7vuTNhlba/NU9LP+ySlv6lNd3uievIVLKp2EiNet5HIsh5EKm90ya4I
         eqqWGeP4/qoFEx7nxABrzuKwJcws16sGmCGsXgIlb1oVwfUuvgTggQq1JTIjJRLY4Q4I
         ym/3kW6B8eFU4Xs9/zSL4FYYlaK1OqejsQA+m/Y6OUrKfmLz4L/3DddIExZYXLI+6X2k
         cV7puDHAC33PFyER3xGgwIyzLWPXO/ZbKy4Iv7YWkZqe6aTFI+rCrb8WPn6lEErwN6o6
         BPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777451831; x=1778056631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMm2b6fcDJ4VCBGYQ5BqcAM0hKQDzqSm7Hl9JCLIH6w=;
        b=eyUTPa/lAHTeN8c1FSiv+6DmVsMEw8PzAm8+Nc4s4ZsJaZ9079vnRnFnqGFRAQSNCb
         WkPdneFcSESyHYMlBYrJ3Azr1xGIIIsxLw9lhwna2O/Is+Gq9bT6n3aGdd1lxDwsamPx
         g2BEZnDMKoc+tXWEARkEtyd4gd34DYB+DMm/cCCb4WR7LcMycDDc7bDa6WWxMAAR8naE
         iQychZTt4TZP933SPTpD3MC0jQMShbQeXEMAinHhK4MXhzV4PnOugxbFYPmQBJ7YkStt
         JWQiD+L04LwPED4nUvTx/31+XPlVsDOinMZkhKGhZLZ5WLWc2f0xpnd+bkELkt1Y84wo
         jD9g==
X-Forwarded-Encrypted: i=1; AFNElJ9rBgZlVpH9chjOHvTa1DaOoiuV54MR7UYXx/cId4q4k4CiUnaxRF6qoOvV2tigQUf/QoAj3m5dxaNjBA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywniqb3mIeghCGZJtBuNGbJy+1vWFoGQFJzXgqyhJ623Y0sQ6hZ
	irBEWT30lVLZJr+FsG1kzE+eIfTPjZo0iuyYgcIVSUBPj1iuwNIlSmaJkktXXPfGAiwfckcMiRV
	X/GETq97wXUT9Wi8uEpQu+J8OwA43lMDWWCV8G3RJ
X-Gm-Gg: AeBDietG4ThqXUtnLk4Sk6jk8gpmdtppGwbHkETv7yQFg49azxi80rCdLx4Mv1wH0Dm
	NFmjUl/5CMXRClHHZdMV4QJDqwJe0K8FeQIg7wyKy+IKTQ+4KgoqMx6QAFTm5gNRfaE6TGoeWnY
	a+NflinDAd+7VlddhVojCa7HvjRIhwxsv5aZ8iHWk9w1jHpML4xzFtK6T98sMeMiocaluveQ7wy
	sBEWBPzxrJ/M9hf5mYdSFOCIYucS2wyBIVsfnP0unfF8XEN4SiHtyWMfDy1Z9Ias+VY7I1Z2xdi
	zFvKC2ENjUmwH7ivv7tXwsemVD3FXl4Qz63cuiiCZvzPB2z8zwQKvFOxLkRufWhRNvp+cxYj83I
	4yDaj8txNb/YOYgB2Pg==
X-Received: by 2002:a05:6512:10c7:b0:5a2:c05c:1199 with SMTP id
 2adb3069b0e04-5a749cf3cb3mr1165203e87.15.1777451830245; Wed, 29 Apr 2026
 01:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428221058.149538293@kernel.org> <20260428224427.437059375@kernel.org>
In-Reply-To: <20260428224427.437059375@kernel.org>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 29 Apr 2026 10:36:58 +0200
X-Gm-Features: AVHnY4Igk12Oy_shlJR0om__FeFvofb63SKKJnxwMZ7_ZWH22zkZb_Rsi2ddxN8
Message-ID: <CACT4Y+bQrTsZg1nzRsMzBcRcYrf8jW99UMKpmhtY30=5kV0vTA@mail.gmail.com>
Subject: Re: [patch 03/10] rseq: Dont advertise time slice extensions if disabled
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

On Wed, 29 Apr 2026 at 01:33, Thomas Gleixner <tglx@kernel.org> wrote:
>
> If time slice extensions have been disabled on the kernel command line,
> then advertising them in RSEQ flags is wrong.
>
> Adjust the conditionals to reflect reality, fixup the misleading comments
> about the gap of these flags and the rseq::flags field.
>
> Fixes: d6200245c75e ("rseq: Allow registering RSEQ with slice extension")
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: stable@vger.kernel.org

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
>  include/uapi/linux/rseq.h |    5 ++++-
>  kernel/rseq.c             |    9 +++++----
>  2 files changed, 9 insertions(+), 5 deletions(-)
>
> --- a/include/uapi/linux/rseq.h
> +++ b/include/uapi/linux/rseq.h
> @@ -28,7 +28,7 @@ enum rseq_cs_flags_bit {
>         RSEQ_CS_FLAG_NO_RESTART_ON_PREEMPT_BIT  = 0,
>         RSEQ_CS_FLAG_NO_RESTART_ON_SIGNAL_BIT   = 1,
>         RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE_BIT  = 2,
> -       /* (3) Intentional gap to put new bits into a separate byte */
> +       /* (3) Intentional gap to keep new bits separate */
>
>         /* User read only feature flags */
>         RSEQ_CS_FLAG_SLICE_EXT_AVAILABLE_BIT    = 4,
> @@ -161,6 +161,9 @@ struct rseq {
>          *      - RSEQ_CS_FLAG_NO_RESTART_ON_PREEMPT
>          *      - RSEQ_CS_FLAG_NO_RESTART_ON_SIGNAL
>          *      - RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE
> +        *
> +        * It is now used for feature status advertisement by the kernel.
> +        * See: enum rseq_cs_flags_bit for further information.
>          */
>         __u32 flags;
>
> --- a/kernel/rseq.c
> +++ b/kernel/rseq.c
> @@ -462,10 +462,11 @@ SYSCALL_DEFINE4(rseq, struct rseq __user
>                 return -EFAULT;
>
>         if (IS_ENABLED(CONFIG_RSEQ_SLICE_EXTENSION)) {
> -               rseqfl |= RSEQ_CS_FLAG_SLICE_EXT_AVAILABLE;
> -               if (rseq_slice_extension_enabled() &&
> -                   (flags & RSEQ_FLAG_SLICE_EXT_DEFAULT_ON))
> -                       rseqfl |= RSEQ_CS_FLAG_SLICE_EXT_ENABLED;
> +               if (rseq_slice_extension_enabled()) {
> +                       rseqfl |= RSEQ_CS_FLAG_SLICE_EXT_AVAILABLE;
> +                       if (flags & RSEQ_FLAG_SLICE_EXT_DEFAULT_ON)
> +                               rseqfl |= RSEQ_CS_FLAG_SLICE_EXT_ENABLED;
> +               }
>         }
>
>         scoped_user_write_access(rseq, efault) {
>
