Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7103AE718
	for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 08:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777450871; cv=pass; b=bQC70Vg2H+9+3dHJVPDf2pZTWomMzc5fnBQKPfy84I+x8QFtuHiAL/8r6jOVys9I/9G3XznXkh8rSyqq+ZlaLm4O+24mIGxKdlhK1xlAL1tSH1M6V0Kqv/jCw/JEySD8eEjPtYMj/C3fhdor9ouCuAFjyGeqbCvvPitgRSd02W8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777450871; c=relaxed/simple;
	bh=13XwfqhLUv9YD2+OITsa1SDRM9/48Gva02HT41TUdvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lYhIJv8yiIvsTqofMYn3IFhoTuOx5/oYFZ5OCi294/SXcTp2LfVGxq51ALclX46ToStHRTdrEbUt8DV5cmJIm66qaNx5w8Jg8OVDJ5lglt2/aQ/PvAHzJAeh6oQ08kxFpNFWavbWRPHi3PhU9Levy6KFKy8QFVhgdsuthmmPlSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DdnrE+T5; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DdnrE+T5"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38def541b0bso106299421fa.1
        for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 01:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777450868; cv=none;
        d=google.com; s=arc-20240605;
        b=PvYEH0CIDRpNXl4k05fyHkk11RmGP5jTz/uI8IdINbt9e8BsSKN2nULqelHX8PZJ8R
         bGYNjGQkwhQ7r94NB33BOC7KKtdnW7nNIO8dRMNVFVxgHx6vJ1swcjTt1aWxmuTGDM5N
         nwPzcuU0dZ7q5H7ld81WIhD/bPBB+Rd8amIVkX3378SD927sycnD5oVQSZFGglss8+39
         5qZh5QYEVmM5g8F10253eFDNSbT+9c0wIFx+3VbEkzkKy6wJ7OkkXdbBcT7/G5V8rjqA
         eGUENP818yLPniE+USKjM5CGt7M4rpRknDFkJvSDLvBSmjUSAPjBdt+xsQ+LvYOH/AQS
         PHbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Bu2VePOZ3zS8zvijxyqOnbIickAo3bdhMuuKFWMT/hQ=;
        fh=MGVEbsT8EjI+StPropsodOBLzvie+YsXuil9eY3SC5Q=;
        b=UIdZni8m/SthRU3qhv0yQy22K4EIf4a/KFQ/I5rLBcx2C7kDL6DLK2uxVJH8sh9pCK
         uG+oeYmxDHPWQylpzLg3lNbDzmHgoEwFY6WEIfXY94809WqaayMvS/GTbX+wgsPqN9O0
         abu9WRGWbKcj7wuCnqpiWmkah5J0bZp4xhoBl8A7k3IzdJdHX4VDpXe/kTmrDm+5rNlV
         HkuSjGDLYwDqVZrYZnTXwjDe+qg6vAjdp4a7ss43kBgJF9/qkJ+lpBLrS3wAGYd0+UKg
         e5bKHpTWl6FKp3iD8Ma97tHyhduBgnFPNFT7aSmQ/OGfGShhKMm+0uTBBNj5b0kr3pGb
         Wrmw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777450868; x=1778055668; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bu2VePOZ3zS8zvijxyqOnbIickAo3bdhMuuKFWMT/hQ=;
        b=DdnrE+T5Vc2T+PWfKmvUK4cWnMuZLXmDttjbUjF3SMTJPJjQ/HLMU5GoW2bUeu483K
         BVYNjcBEYloTL8NYD1yToX1fy30fEs73Aqcz6KsQQzzNrlhFAePAcBg5R1Cd4PcbntVV
         NSK+fyIn7LHPXKZBYJu1ffF+M1afXNF2xvPRNd1ErtNXD7VmbAlj2KPKAnvdIHCqneMY
         74nDPXxpdnN7ViAqeuqH7kB8nLd7Q/Q9vhswa9UmFbxMOb9IgXLSvoGYXZOK6BSPU8bn
         uzi9Bu1tYtGOtr9erp5fv4UcSVTRFsFxqHfaYxVddMn3Njq41c4QmwdNbiY9zyp6lq0p
         Hqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777450868; x=1778055668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bu2VePOZ3zS8zvijxyqOnbIickAo3bdhMuuKFWMT/hQ=;
        b=MY6QPbslLgga4WLAdhwrO1UjZjM46WGwx03YI7Y5cZI8SADO/EmxWyk6waP2iiUQtM
         CZGw7wseZcpY4NcQn+mYW3qERH7qdaq3Z96YxpgNtkTPo0gGmhTeB6PBf5rG5/OyJCTn
         ZcLzjdpJT5AxHw33Dagnfl+jgvEfJi/fcxl3C/Y4hZG1eTdm4hYoM8RRLfpEttYy8Z8N
         RymwmJh+1PRGLc0NApIRHTfjLVgvbR86+ooBxaRtMUdaOz5kTSMAMMrgs+/27Ty5g6zR
         XPc8JDecRl0c4q/N05xiMglODzIikHwaD8xI36+Haa6a8ZtyXGtRF8TmgsHW+b3WWY5q
         dTbg==
X-Forwarded-Encrypted: i=1; AFNElJ/nmeJAcTtChvJ/l4Nh1XuzXETyrHY3G5iOTstGyZ18WtaDvini6WQ2Bb05XOwkEggpeQq9EQxhQfURsg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGhHlIZfpQy4Xi6e66Or1FdidRLvOlaoMdgb6Xp30A+ra5sfWp
	eDn/YSwHa9rS2RZNi47/pCnap+ITtRppyHp25PRr+oLwz8RQCnTZcQL2mLjTV71DBhZ+9bdnaeV
	O+xPAc8MKdxe4CsPhD69ZJnAL6Ec4pKC2j2MEWbGp
X-Gm-Gg: AeBDievMSGqL6ZVM/EEp0zRC1OVku/kP78UHKc5yEiyy7bcGo9MTj/xnZKM/Cks5nIm
	Y9srd8rKtg8NLEHhUumxDOEmvBQ+ue0V5BRh0iuTfV4YVkles2CpeNmZcuNi2JCoc9W3x9TrrkR
	gp/3pEG1jIdAElG5BsO9cCYRs6XHz4Hlb3ScUYmIOi/2L0AZ/L7F8ZGJdNT6m+h/c4M0Ry0byuI
	m13biD2X1z5yt52ct/cLjK0l+tVTWyxFntwpDjUn/MZbuOfDR/BpVLH17MmGPuArV/raCt5xXjW
	8HZdOjk9e2t41e24lC0F07593OrzBJeHoG+TqD0ACxbjOyleYF/yLk6PtiUp6/Fz0YMsQxPwY4W
	kY9EVzu8Nj51gGA1wHQ==
X-Received: by 2002:a2e:ad03:0:b0:38e:d64d:a511 with SMTP id
 38308e7fff4ca-39240cacf0bmr24624591fa.6.1777450867868; Wed, 29 Apr 2026
 01:21:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428221058.149538293@kernel.org> <20260428224427.271566313@kernel.org>
In-Reply-To: <20260428224427.271566313@kernel.org>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 29 Apr 2026 10:20:54 +0200
X-Gm-Features: AVHnY4LaZJdd5XY_GbpBSDdNvmEl_dFGYyC97Ez6Bh5Frtx4kV_iigaasCfnRwc
Message-ID: <CACT4Y+YtK3+=nK1LDqwnFCMc60VDk7LZtcmEJQz4AGbTqb6NXA@mail.gmail.com>
Subject: Re: [patch 01/10] rseq: Set rseq::cpu_id_start to 0 on unregistration
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
> The RSEQ rework changed that to RSEQ_CPU_UNINITILIZED, which is obviously
> incompatible. Revert back to the original behavior.
>
> Fixes: 0f085b41880e ("rseq: Provide and use rseq_set_ids()")
> Reported-by: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: stable@vger.kernel.org

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
>  kernel/rseq.c |   20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>
> --- a/kernel/rseq.c
> +++ b/kernel/rseq.c
> @@ -236,11 +236,6 @@ static int __init rseq_debugfs_init(void
>  }
>  __initcall(rseq_debugfs_init);
>
> -static bool rseq_set_ids(struct task_struct *t, struct rseq_ids *ids, u32 node_id)
> -{
> -       return rseq_set_ids_get_csaddr(t, ids, node_id, NULL);
> -}
> -
>  static bool rseq_handle_cs(struct task_struct *t, struct pt_regs *regs)
>  {
>         struct rseq __user *urseq = t->rseq.usrptr;
> @@ -384,19 +379,22 @@ void rseq_syscall(struct pt_regs *regs)
>
>  static bool rseq_reset_ids(void)
>  {
> -       struct rseq_ids ids = {
> -               .cpu_id         = RSEQ_CPU_ID_UNINITIALIZED,
> -               .mm_cid         = 0,
> -       };
> +       struct rseq __user *rseq = current->rseq.usrptr;
>
>         /*
>          * If this fails, terminate it because this leaves the kernel in
>          * stupid state as exit to user space will try to fixup the ids
>          * again.
>          */
> -       if (rseq_set_ids(current, &ids, 0))
> -               return true;
> +       scoped_user_rw_access(rseq, efault) {
> +               unsafe_put_user(0, &rseq->cpu_id_start, efault);
> +               unsafe_put_user(RSEQ_CPU_ID_UNINITIALIZED, &rseq->cpu_id, efault);
> +               unsafe_put_user(0, &rseq->node_id, efault);
> +               unsafe_put_user(0, &rseq->mm_cid, efault);
> +       }
> +       return true;
>
> +efault:
>         force_sig(SIGSEGV);
>         return false;
>  }
>
