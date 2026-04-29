Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E65A3A6B6B
	for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455328; cv=pass; b=S+xXRR09ZsHrfgxQ3Wk5sARf2pzsBbj7DGIiIvX/tcyjAf7bgvvTUU45+Eq7BaCCWZ7i+9FXkPWDU2di3m8okVqQY0SIBCvOxSNaLThTpB+HZNKOdvVErUUbkI1Cbxvv2bsdYwnCdr+1uS1WehInngIa5qaVxMMTqW0w6BYZDxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455328; c=relaxed/simple;
	bh=yWRy3/rX4HlGUwt43yKWLOR1TvgC7BCQHNThoCg9RDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKdN8Pc9nokNF29WtYoyxKw/tsxxhqeyzpDr5K+3pL1Woiy2ZvCy8/ws0hdhtylww1uOiSM1EIE+RgV0WNJ1Ab6nWUcJwxMsr3EOxQQCHj5SxaGY1GB3TMoT3r1QZN/CX80nOPYcUTQ9J9hef0eBQV7iwQYoYGA6PbPKlZ/8qXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p/oDHB8P; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p/oDHB8P"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a2c500750dso14164975e87.1
        for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 02:35:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777455325; cv=none;
        d=google.com; s=arc-20240605;
        b=GwqfZ2CqU6BIZQyI99nmI5iYCo6omm84G1NxjmIn0ht9owG1biiCgExK7cXuPh+vXi
         djGb10SMdjQ3sn7xCa3f6Q0h2TdoQ6lVtrvwRjNlT82FH7XMx7T7I/zmLDk+FtBqPA2E
         6O1itjQLE9fS3eMcEGYoiStPsABvKpGOIrV9w+uiWClDGiLesN4Cgia9AbvOyOHaJDup
         X76CV6dQk5nQYnfM6bAL17mTEO2vriKszZFZKLoaDRTBifaY7j+Ea/VoQP4YoYHt1cuH
         TsIroPEH4yF0Ge39uMxza5u16r5QsX9X3lRO3hGqo4P0GG9QsWhGI++tQRfhd02gONNt
         NSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3AwfjorQ+tMEORsUtmbNIUNVt8zfCtFt99rh3uL24tk=;
        fh=zf9JAWyi1ZwjLxBUAw3/a0sd7jr3otdnFs70lejPCXY=;
        b=PjP5IX7t2gwbYPv+B23/sYJ8TWJdNrN5b+JVUzlF8OJzEAyk9BjcpJ1nB+8RoOKEWF
         PBFpJMzUl7JQWvMHFCCAOsQhwco0lZrnagjioiofD8acJ9Nl3zTwJdTVO07Kx3Rl/Yt0
         p4Z0xRR8WTgrAc2vGK2WJ5FqU1tOv+RSNzUJL8pW9bPE7s5l1DKBUcDix8yYg1elfZD+
         9GzUzN2k151IrTx+9zP2yAvd8rhxGahhfy57qTh7I6/OGFxwb10MtUZ5P6IE8kVsXLB2
         IR/jSEfa9H/yHRt6y7gNOuLdhP779o6ZZHlJ4yqAxI91p5IVtedBSLXmbDi9rXldWjU6
         555Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777455325; x=1778060125; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3AwfjorQ+tMEORsUtmbNIUNVt8zfCtFt99rh3uL24tk=;
        b=p/oDHB8PX1yJYy9VzXI2tYqpr65G3FGfmapVB0ssx1Jvg5jP1RqkE2ldo+94tKMwM7
         PQC3ZR1QyJKLXeSkj7/vunvu3ew/CJFkQQgOCGzcjk7u8RUH8OMR3z7zgEeIj7i9IdSw
         KMvlPHvgxd9SOckeaoT0CBevms+thWewHI8e/pnxqzQEjLYQeFalcA/PbmTwFttz3/2J
         FyAPanMrciqIQ5P5v4nnCHDH8JHiHdLIeQr2EyVR+Q+B8G8z16PnCnNgyPpip6TLb249
         OA5oN/i6/4j0ObUgetdDPZG6Cd0GrfmLDJbzZo/uOO3LijKRuQxwQymfL8y2JffcanPq
         +OKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455325; x=1778060125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AwfjorQ+tMEORsUtmbNIUNVt8zfCtFt99rh3uL24tk=;
        b=Oy5nYUm2cYPRhf63QdPYEp6E9rtWzsZEntRQoJdKfsexjexBD/JYGilLslr8FDrwK1
         7OSEE+MfSAYrkOWj4jMwyyWySWRQr9ZwYVbo3Mk/PQBLSxTD6icSfvdN22+oZ9N5CDE8
         zXafr8ZoAw6dt+EsXW+AeMqojEJRK1WuYBShF/IYq8fU18FhM9kjaZwFeq1TRpPg4mD/
         L72c30iMI/reY4ghy8yuo501QSrWcgqhZ3l0ytGDmZhgrZ7GIVEO6xJJspe8qmAFeqHu
         SBQDw1IRp4dHn0MNV1LrCzrvNvfAmYSqeG/iMkRNf3hxE+at1LYIhEuhU1O5nRemNpl7
         W2tg==
X-Forwarded-Encrypted: i=1; AFNElJ/cPJA2ve/LE8oObgx1IS77Ajil4jj2T9lo5T8fmR+wfdfuc5PwL847j9SCCXnF8npHTIm2QpA2HnfhyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjXCl1uny7NtDhJcZZiUvWqfvrO/CZxdP/IHtP+bY04zHtkuGV
	EYFw9cszlwBfVQWLPxr96SnqoSQcuaAt4p5BcMLSjdJgG+NjiHJFz2vnATMFvZy2eK5kLJ3Q7RW
	C72mDAtYXO0lDbSLKGSyid8kFU+X2MMx/5fherC1T
X-Gm-Gg: AeBDieux/SD46vDcoX3RBbstoxQW6QR8PJ7kG6kmkWrePKcWCRsMtSUUUPPOENJVPLv
	fLwE3ayOJNGB4x1LrQZy4waVqdBvWImFCVgea62UPUgvBFlo6X2jZtosmhdaANrSXlePWalkMg/
	nQfV1+9/T6gbPTHqudwfxlr0JORHCwkPQJfRIMtKB/EnWzYH0RSdLfznSoV67IJpagDfInjGvrP
	4txskvtdnPhxWfamj6aXCCYgIz78/C7Ezg79NOlAoFgR5D5YVzRUwgvzyX9UxG5Qvhja5thmXkP
	dY531v2kNvqjXhJFZzLXIxZ4ZZMN+yJvzoLoFB9VsSV8MW8yLOPRckdd1KQucL5HQ/dx1XlgYNc
	PreBEAIUmplS+6AELpA==
X-Received: by 2002:a05:6512:3b82:b0:5a2:9635:b1e0 with SMTP id
 2adb3069b0e04-5a74640e40emr2689337e87.16.1777455325069; Wed, 29 Apr 2026
 02:35:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428221058.149538293@kernel.org> <20260428224427.845230956@kernel.org>
In-Reply-To: <20260428224427.845230956@kernel.org>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 29 Apr 2026 11:35:13 +0200
X-Gm-Features: AVHnY4IoVStYd0J6ExzzUtm9b73jfrUxpLXfek-vYcKQZwm9GgG4ZOv0vMQUzp4
Message-ID: <CACT4Y+bDX=766hTAAKus3-VYKFwmS0EeTKxW_S=DTiYp+QYECg@mail.gmail.com>
Subject: Re: [patch 08/10] rseq: Implement read only ABI enforcement for
 optimized RSEQ V2 mode
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
> The optimized RSEQ V2 mode requires that user space adheres to the ABI
> specification and does not modify the read-only fields cpu_id_start,
> cpu_id, node_id and mm_cid behind the kernel's back.
>
> While the kernel does not rely on these fields, the adherence to this is a
> fundamental prerequisite to allow multiple entities, e.g. libraries, in an
> application to utilize the full potential of RSEQ without stepping on each
> other toes.
>
> Validate this adherence on every update of these fields. If the kernel
> detects that user space modified the fields, the application is force
> terminated.
>
> Fixes: d6200245c75e ("rseq: Allow registering RSEQ with slice extension")
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: stable@vger.kernel.org

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
>  include/linux/rseq_entry.h |   71 +++++++++++++++++----------------------------
>  1 file changed, 28 insertions(+), 43 deletions(-)
>
> --- a/include/linux/rseq_entry.h
> +++ b/include/linux/rseq_entry.h
> @@ -248,7 +248,6 @@ static __always_inline bool rseq_grant_s
>  #endif /* !CONFIG_RSEQ_SLICE_EXTENSION */
>
>  bool rseq_debug_update_user_cs(struct task_struct *t, struct pt_regs *regs, unsigned long csaddr);
> -bool rseq_debug_validate_ids(struct task_struct *t);
>
>  static __always_inline void rseq_note_user_irq_entry(void)
>  {
> @@ -368,43 +367,6 @@ bool rseq_debug_update_user_cs(struct ta
>         return false;
>  }
>
> -/*
> - * On debug kernels validate that user space did not mess with it if the
> - * debug branch is enabled.
> - */
> -bool rseq_debug_validate_ids(struct task_struct *t)
> -{
> -       struct rseq __user *rseq = t->rseq.usrptr;
> -       u32 cpu_id, uval, node_id;
> -
> -       /*
> -        * On the first exit after registering the rseq region CPU ID is
> -        * RSEQ_CPU_ID_UNINITIALIZED and node_id in user space is 0!
> -        */
> -       node_id = t->rseq.ids.cpu_id != RSEQ_CPU_ID_UNINITIALIZED ?
> -                 cpu_to_node(t->rseq.ids.cpu_id) : 0;
> -
> -       scoped_user_read_access(rseq, efault) {
> -               unsafe_get_user(cpu_id, &rseq->cpu_id_start, efault);
> -               if (cpu_id != t->rseq.ids.cpu_id)
> -                       goto die;
> -               unsafe_get_user(uval, &rseq->cpu_id, efault);
> -               if (uval != cpu_id)
> -                       goto die;
> -               unsafe_get_user(uval, &rseq->node_id, efault);
> -               if (uval != node_id)
> -                       goto die;
> -               unsafe_get_user(uval, &rseq->mm_cid, efault);
> -               if (uval != t->rseq.ids.mm_cid)
> -                       goto die;
> -       }
> -       return true;
> -die:
> -       t->rseq.event.fatal = true;
> -efault:
> -       return false;
> -}
> -
>  #endif /* RSEQ_BUILD_SLOW_PATH */
>
>  /*
> @@ -519,12 +481,32 @@ bool rseq_set_ids_get_csaddr(struct task
>  {
>         struct rseq __user *rseq = t->rseq.usrptr;
>
> -       if (static_branch_unlikely(&rseq_debug_enabled)) {
> -               if (!rseq_debug_validate_ids(t))
> -                       return false;
> -       }
> -
>         scoped_user_rw_access(rseq, efault) {
> +               /* Validate the R/O fields for debug and optimized mode */
> +               if (static_branch_unlikely(&rseq_debug_enabled) || rseq_v2(t)) {
> +                       u32 cpu_id, uval, node_id;
> +
> +                       /*
> +                        * On the first exit after registering the rseq region CPU ID is
> +                        * RSEQ_CPU_ID_UNINITIALIZED and node_id in user space is 0!
> +                        */
> +                       node_id = t->rseq.ids.cpu_id != RSEQ_CPU_ID_UNINITIALIZED ?
> +                               cpu_to_node(t->rseq.ids.cpu_id) : 0;
> +
> +                       unsafe_get_user(cpu_id, &rseq->cpu_id_start, efault);
> +                       if (cpu_id != t->rseq.ids.cpu_id)
> +                               goto die;
> +                       unsafe_get_user(uval, &rseq->cpu_id, efault);
> +                       if (uval != cpu_id)
> +                               goto die;
> +                       unsafe_get_user(uval, &rseq->node_id, efault);
> +                       if (uval != node_id)
> +                               goto die;
> +                       unsafe_get_user(uval, &rseq->mm_cid, efault);
> +                       if (uval != t->rseq.ids.mm_cid)
> +                               goto die;
> +               }
> +
>                 unsafe_put_user(ids->cpu_id, &rseq->cpu_id_start, efault);
>                 unsafe_put_user(ids->cpu_id, &rseq->cpu_id, efault);
>                 unsafe_put_user(node_id, &rseq->node_id, efault);
> @@ -543,6 +525,9 @@ bool rseq_set_ids_get_csaddr(struct task
>         rseq_stat_inc(rseq_stats.ids);
>         rseq_trace_update(t, ids);
>         return true;
> +
> +die:
> +       t->rseq.event.fatal = true;
>  efault:
>         return false;
>  }
>
