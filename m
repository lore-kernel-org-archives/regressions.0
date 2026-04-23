Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8256D3AD529
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 18:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776969375; cv=pass; b=FcFxD4KG+i3OEDcp61TKHE0qXNA3VAenu1Q9hiqzhNitEmcpf1MiWD3sAe5+gcgieyngLOZqvEOba2QM4DdWL/JO1bqhUNldUJ8S1TAORQ1W1YFWfYIDXJpSZ1Qd+FSiW7U4bzCGAhMlrrK4HJRggKAEgB8uRuy4TnoDbBlffRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776969375; c=relaxed/simple;
	bh=HhfcT+9cbr0qsf+EDHUMpWxrrotFDPuW4se3HNE+Vn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XwdCrHKPnAnh53aeNsIDruTWbgEMPxibN30ihCVrNmjDrwGWyxgP7Wvhxf+RkyT3/QgHg+5SO5AOlv5zpI8ZVTsQizfVheRd231wV/Kjaugo4Sh8ynFS3f13Yl6M5aqe2f9VKZXCi4R4yInxGx2OwpkGuWgX7kTRwYdvyTWKKh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mongodb.com; spf=fail smtp.mailfrom=mongodb.com; dkim=pass (1024-bit key) header.d=mongodb.com header.i=@mongodb.com header.b=TMwR+F9y; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mongodb.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mongodb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mongodb.com header.i=@mongodb.com header.b="TMwR+F9y"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ba6838e76f2so662915166b.2
        for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 11:36:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776969373; cv=none;
        d=google.com; s=arc-20240605;
        b=kzjuSIk42pmxSkP0UOb7OeSP8uTeDXYEDTxxdxUf7A99pgaWvLsXfbUxEaXlwdb2/+
         GZd2kEhJp4hbXfbKxp3hgknQIJ/nAt+x+pX9+3QoPEGajEUljlT2qMnmFN+q9GnOXx1L
         Nh5LLDuyUN8EWBq7Q2GHsL0cA0rYtIzeWfTNxF79GgOaqa8d3xU24QGyBFfEwWu8AJp5
         qpw2OxuCWyaHdyEbQIfxJOhegl/blOOJI0bBNdbqWv3pF6ZfLypW/0Tsj8P+4bH4verm
         iBrP6qpFaLo7K761uocI+/9TFXT/e9Utl6B+ZtYBKrKX5vSNNqoeUrplBqMFP7s1/6Vj
         pPgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lMwWOP325Y+FxEfz24yq10d2Rgb+6ewllZMkA6avH7k=;
        fh=JGDKZgOAUWC/9ttpiASO1Zq6KozO4X1OfMbYUHHo/6g=;
        b=JCO3mwiNVzLs/kGt7NNQCgDBOV6Z54BOM6Epaq/zN69kk1xCDK6PdzJt8WutDdwlZJ
         p9E4iP1NYax3IeadWgGFPkOAtxv6RMBpaEfgDGwRFSCPmduKcEiBWtc5Daygnfl+7wbP
         LhkEjsdrFmgPBEpOC2mjXplhfrnSqvhEMzJP3rotNIwCpKHvFGp91fvepo8x/0lsm7jy
         rxWApHeNLlDscVkZR4VQgA3YE7y8hNkn5NiHCarnt0AayjWVyEw6fDcoG7cBhUDrjK8B
         SApDmS+7f3JuEacZXIYFjvUXy8BBZP3XKBM4Qxt+stf2ZeGokjZQokQiRW7hCSvtQeIT
         wgVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mongodb.com; s=google; t=1776969373; x=1777574173; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMwWOP325Y+FxEfz24yq10d2Rgb+6ewllZMkA6avH7k=;
        b=TMwR+F9yt5EBDk//s7KlbMgXroN3IUqh7mDP8HfjwRqhcKcCZ8OerT01j/Ap0tSeQx
         r4RTyeSYKHsG34WFVj0UoS4I0nkndy/Xoov3V5LTuS3YOSV5Bv4rV1kQEcn0ZA2hvkfU
         +7biw1DUcMbFM43FlCimTg88WFId+wNvT2Xrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776969373; x=1777574173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lMwWOP325Y+FxEfz24yq10d2Rgb+6ewllZMkA6avH7k=;
        b=O//wIiXQkEGa3AZqFZn2LVPtsM5Aie27/Y7t409X9LKwFhvNOcfmx3bC42ANrQTeo3
         mE+glnSvfXCJSMwGnTbZ1YX8Dh7J2bXcGvEU2WhpIP22BpCxwV5mVaKhlV0Z+V/1sSSH
         OUjkP+2UVwPixnfsba+BIFpnLHO1kcuYLZtTyFWKfW/YJEYXZHw1MXpxK9WUwLHSccIv
         ya182pG1jL3KVTvccWv5VSW0eQbNvBH6h5Cn1KmFFMw24W1iw7NLnqJIUX3/2I3n4i0V
         0OMWwOqGXFQ2DoydkcbpCTFg1578Sc15LTDxxxgdl/oRK6f7RlT3JzJ0XkRJwEPE/Dyv
         h7Rg==
X-Forwarded-Encrypted: i=1; AFNElJ857MggJF2AxYVUayobhygOBBitkZBnzyQ/WJtMG6G5dlzaO+8e+cfW7o9M07sJSCZj59JsMZjBLlyG/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YydvV8nCJZn2vCAS/KjegqqDMzka97yqhKzjgRB//T4ltyY0OaV
	ZSXGXmq352T9hm22yf3Mz73BZZFiKWQbf6KqrLxMCTdHl/WKI7lpraCBoUOoc296nAG1a6rImOK
	lOpsS+xm+Qu5+9/KP1nplsF93Eg6XaRa7Pc7cS8do3g==
X-Gm-Gg: AeBDieuqhkDNVe9nE4w+xDrX5TO9J986ckqIK2DgCfkW6IgbYOKXqVeSsL3bYt3ccoS
	/bbOkPZhOtAczpBjFOK0A8Fic6jLNFGlRawgbNmhjIzi/wI/6JoNLJrV/EZZyFrCly6fsdWVZGI
	nOmZZ/VHEHmc8RJ5OqYXxNMZDNRA+JPwzU5Wid0/c0lc0/+YTUp24tv7qkppMTlLXhyA6gS0I4j
	gNcG/alt7nj95e8CMp+aqirFWCjzMeJyBejLiIVX0jwoL+Im975/ehNGp1PlBOY58j6y6fkJ24p
	FQUMyfLNkl53AFwdjBP21/WbC9DSwLG8zjVn
X-Received: by 2002:a17:907:6d15:b0:b98:411a:116f with SMTP id
 a640c23a62f3a-ba419076c8emr1456311466b.2.1776969372808; Thu, 23 Apr 2026
 11:36:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
 <87fr4l28zn.ffs@tglx> <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
 <87cxzp1tn6.ffs@tglx> <CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
In-Reply-To: <CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
From: Mathias Stearn <mathias@mongodb.com>
Date: Thu, 23 Apr 2026 20:35:45 +0200
X-Gm-Features: AQROBzCU44qvM2n7u3bSSfOCODS7CRqJgwCnCmHvHQ6YyNUA9ZKN2DS8mq-0h7g
Message-ID: <CAHnCjA3aR1hLYK3DsXZV5AaLWe56+zLOS8ffpAMv9TBEkT-3nA@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Chris Kennelly <ckennelly@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 7:48=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> I see some patches flying around, but am not clear on whether there
> was an actual patch that make this work again?

Thomas's patch from upthread appears in initial testing to address the
arm64 preemption breakage. Thanks! I'm currently building with the
following patch on top of that and will test it once it is ready.

---

diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
index a36b472627de..e26bf249bbd8 100644
--- a/include/linux/rseq_entry.h
+++ b/include/linux/rseq_entry.h
@@ -300,12 +300,15 @@ rseq_update_user_cs(struct task_struct *t,
struct pt_regs *regs, unsigned long c

         /* Invalidate the critical section */
         unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);
+        /* TCMalloc kludge - it relies on cpu_id_start being overwritten *=
/
+        unsafe_put_user((u32)task_cpu(t),
&t->rseq.usrptr->cpu_id_start, efault);
         /* Update the instruction pointer */
         instruction_pointer_set(regs, (unsigned long)abort_ip);
         rseq_stat_inc(rseq_stats.fixup);
         break;
     clear:
         unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);
+        unsafe_put_user((u32)task_cpu(t),
&t->rseq.usrptr->cpu_id_start, efault);
         rseq_stat_inc(rseq_stats.clear);
         abort_ip =3D 0ULL;
     }
