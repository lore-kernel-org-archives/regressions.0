Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7573033DF
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 17:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776965920; cv=pass; b=MvjMJQbYCNA7Zk2md5+tVJak1xLYgUC5/Tlwt2K6yVkZxonMz9WE/QeHxcfzdukx60m1VmA7/BYMVzPxAkT0Fvdy/FDLyd3Bful7hKPAf3OHJc5CHGhcR6VENplTtILeyVAcDQDIqmqZC9S8nqgmcIa4ZwE0V8ZQb1fl50g8o5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776965920; c=relaxed/simple;
	bh=8Bxy5gWWjMiGidmGgthAIaOlO0wobAEFANsq9mcvodo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rHRcDTf6k2O9lrTkhbKFYyfG1aBOap+6S1EjsZnMku6BaDPegHx5K2X3je1VLq1pA6K4mduTMY3FhjDACJZ9ziaCYMGte88yUivtDbJ/dWCoHTMTegRBFAwFDcLtl9a5IBj70w4x4rrCCymYGK9e1EUPkKhCn2tGPWgm5EZocpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DCl4Wdbk; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DCl4Wdbk"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35fb16e56efso4586219a91.2
        for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 10:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776965918; cv=none;
        d=google.com; s=arc-20240605;
        b=S6/V7NfjI2AJ1pfwRl9U5tutHq5hyezNAeSDulRaYNRGOLRgSB7Hd+Q/7ofEk0zXim
         VgiYfDQOqdS+cIAyFvKiwcjJdTf5wcpr6WKEiumRYMENh2PKvIxtLdEOvIZ8GeXQV8w9
         SYZ8+StcLHokPvobot1kryiI8OMadriOvjLd+1EPrJxBKuPaw/0JdkaL3dgnvi5FCPbu
         CA9U3FmrpXbrxrOtXOFukU9PgEmuHJEhlkTDgP4faUmfk3zVx2uRMwvFvOkMfRfUQFv6
         OIkhLdl63rrvMorwcO5D4ORNzcoJJudtLhwo9MMfLDHTH9fVPgytJV0Z3oV/rhWWG9As
         /qUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hIPPDfLsh4fZuBB+5IBKjXnwvldEHr+c1t+Wm8HgqiA=;
        fh=J7ICPhXCOmONbweKvaewNobAcB0ibBgpv5P7Om8FS+A=;
        b=hwCl31lvOtwflRyuC7JdP4sK7mHfqCWtkUdRaD/AIKiQd7dOeKAmrej8i28C1bwN35
         5flcuj+HDGSnGwgQz+hdEEiTJpUSqGTQ76g9A6MDqNBAHR3eeqhwy4J5Ls8ngqKbt6zS
         u7ZmtpOHy1nN0ScT0NkEKPhCKgEnyumvOE/PYSf0GQkMC2iR8xx06dUi9Z/6yjeiy+wC
         oWghSE4jroQJNtjUmSpQeaTDg/wmaNEK9oaxh6qF6GiXqZ7AQHab51k8hr4G8WmVzckz
         kNm2mEgdJKCIDAKXVs6hQHv+kvJ5MiVIgcvtELLde4bUa5f3KeYWohSCsCxsIaW81cmu
         h4PA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776965918; x=1777570718; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIPPDfLsh4fZuBB+5IBKjXnwvldEHr+c1t+Wm8HgqiA=;
        b=DCl4WdbkuAWSGxnouusZRRUjrXw+0nt1RHIhO5MJ0Hs47GBZzIUR3ttVyJgiRKXASy
         gDeGEBz6YO6TJGiVT03yDKnvEYasf3vGJYgT93ob6AgI+5nqC5V/i3wIoywe7AYvRV51
         fmCEaW10d4fH+7gdguK5TInTfyJKO1HxRkIBfKawzKbEZHnEBdojQpudfhx3O646Uc1J
         0Yc/RKU9vuPFvu6v3/whmRSp5iqpvgmfsx9M1MlMtRJmA0zgmS1tTkRDTpTtChHLrH3U
         gUh9x/e6QGr7rfXPMPGNdmRx9fVJ2XDheGOOFekDk+2xBHMStrzvMfAl4RPzSU+8Twea
         S7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776965918; x=1777570718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hIPPDfLsh4fZuBB+5IBKjXnwvldEHr+c1t+Wm8HgqiA=;
        b=o5xALI0T2KpMq3Bn3fi+mTvhGAfrPSPBgT0NSve4GqyOILUEE7PDq/rmacW2m+ozEP
         69zrd1bmrUSdExw8nAeO/aFOtHSpEk0kSwoTYrgWUfsrSicqQZnQuX2hPubXJ1y8Pti1
         7cl4CLZ2DAOTHzpJNcPSUu/c+oc1KboDh3vAhHMdVxp+kBuu429IizHH5+v03ZK626Og
         Avn3GKC7NmQVDLoEin9Gj5uXuK11uPGevq9dQ7Rz4SjQjQ4gf/s1+hJPFL5NzNny9yHs
         9XLr9HoLe2THaRLBCQUG6F21N9fEaIAuj9Fz5+j1AiN+A41rxENsiYe65xtTWx5PlBZB
         YhPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ucErwXZWC9LaIpN8O0s1OEcqNnfxk36YR0wysOCrHl41IKUckHXBjs6CJmy/NItaKnmNLuY3EGrugbw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQWhlabt2EwBcwwjZj9HtyzezuilKGIvtL3qVxPgBTK9BX5PiV
	9ILz6/wrdL3WHr0TRSenbf2iJWjeU+10Kg+Z5sYrnQ+5WjyPQIWYCtmf7appijdzyUDErto7fj/
	0LcB6fW+ms3R64XKjvYV3MAJ4fIZXE9fX25moI1nF
X-Gm-Gg: AeBDies3czTeiEXGhGGarEHEiW2gTwSyhCgh1jPbFKeaChHVN3FT6pxYAsLAjoA1EEt
	yLVvDs0BqcdJDkQ1wDqNgQg/QxgxuaNDELfN323JtGW7BqZtI71jheotBqXKjvQ84sJbVnMpMxy
	I7jCttVmboDFiHb1UNpxgVeaXR2C+k3A4BT/Rp+JlETAhUeftvBfqaAzKhSbNzqhD7z54bzs5sy
	H7Dxds2YT1WDv1EAmGVCKmO+ZgGKKTnZ4AkYXlRiaIUdYi8+tZBRHllJSsoRBdUZpd+ZjrlLF6D
	QcmgbVitFT00WTpo5IkpHdiFviveC8GrXfbgGcBfpDR+G6c5fHTQhv+JgOIdew==
X-Received: by 2002:a17:90b:3d01:b0:35f:b75e:fff5 with SMTP id
 98e67ed59e1d1-3614048b7admr31930988a91.22.1776965917783; Thu, 23 Apr 2026
 10:38:37 -0700 (PDT)
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
 <87cxzp1tn6.ffs@tglx>
In-Reply-To: <87cxzp1tn6.ffs@tglx>
From: Chris Kennelly <ckennelly@google.com>
Date: Thu, 23 Apr 2026 13:38:20 -0400
X-Gm-Features: AQROBzDCR58aogsBZRg7gaWhk_b7-PMjg3xBOR1vzqWjWnl_6TQlM5lhko-1SuM
Message-ID: <CAEE+yb=rZFxxOhCw+6wsUt5PE6=ebbKjEggQ_j_G3qSkMQZsfg@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Thomas Gleixner <tglx@kernel.org>
Cc: Mathias Stearn <mathias@mongodb.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 1:19=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> On Thu, Apr 23 2026 at 14:11, Mathias Stearn wrote:
>
> Cc+ Linus
>
> > Of course, even if we make that change, it will only apply to _future_
> > binaries. That's why we prefer a kernel fix so that users will be able
> > to run our existing releases (or any containers that use them) on a
> > modern kernel.
>
> I understand that and as everyone else I would be happy to do that, but
> the price everyone pays for proliferating the tcmalloc insanity is not
> cheap either.
>
> So let me recap the whole situation and how we got there:
>
>   1) The original RSEQ implementation updates the rseq::cpu_id_start
>      field in user space more or less unconditionally on every exit to
>      user, whether the CPU/MMCID have been changed or not.
>
>      That went unnoticed for years because nothing used rseq aside of
>      google and tcmalloc. Once glibc registered rseq, this resulted in a
>      up to 15% performance penalty for syscall heavy workloads.
>
>   2) The rseq::cpu_id_start field is documented as read only for user
>      space in the ABI contract and guaranteed to be updated by the
>      kernel when a task is migrated to a different CPU.
>
>   3) The RO for userspace property has been enforced by RSEQ debugging
>      mode since day one. If such a debug enabled kernel detects user
>      space changing the field it kills the task/application.

The optimization in TCMalloc that you're describing has been available
since September 2023:
https://github.com/google/tcmalloc/commit/aaa4fbf6fcdce1b7f86fcadd659874645=
c75ddb9

I thought the RSEQ debug checks were added in December 2024:
https://github.com/torvalds/linux/commit/7d5265ffcd8b41da5e09066360540d6e07=
16e9cd,
but perhaps I misidentified the ones in question.

>
>   4) tcmalloc abused the suboptimal implementation (see #1) and
>      scribbled over rseq::cpu_id_start for their own nefarious purposes.
>
>   5) As a consequence of #4 tcmalloc cannot be used on a RSEQ debug
>      enabled kernel. Which means a developer cannot validate his RSEQ
>      code against a debug kernel when tcmalloc is in use on the system
>      as that would crash the tcmalloc dependent applications due to #3.
>
>   6) As a consequence of #4 tcmalloc cannot be used together with any
>      other facility/library which wants to utilize the ABI guaranteed
>      properties of rseq::cpu_id_start in the same application.
>
>   7) tcmalloc violates the ABI from day one and has since refused to
>      address the problem despite being offered a kernel side rseq
>      extension to solve it many years ago.

I know there was some discussion around a preemption notification
scheme, rseq_sched_state; but I thought the discussion moved in favor
of the timeslice extension interface that recently landed. Timeslice
extension solves some use cases, but I'm not sure it addresses this
one.

>
>   8) When addressing the performance issues of RSEQ the unconditional
>      update stopped to exist under the valid assumption that the kernel
>      has only to satisfy the guaranteed ABI properties, especially when
>      they are enforcable by RSEQ debug.
>
>      As a consequence this exposed the tcmalloc ABI violation because
>      the unconditional pointless overwriting of something which did not
>      change stopped to happen.
>
> Due to #4 everyone is in a hard place and up a creek without a paddle.
>
> Here are the possible solutions:
>
>   A) Mathias suggested to force overwrite rseq:cpu_id_start everytime
>      the rseq::rseq_cs field is cleared by the kernel under the not yet
>      validated theoretical assumption that this cures the problem for
>      tcmalloc.
>
>      If that's sufficient that would be harmless performance wise
>      because the write would be inside the already existing STAC/CLAC
>      section and just add some more noise to the rseq critical section
>      operations.
>
>      That would allow existing tcmalloc usage to continue, but
>      obviously would neither solve #5 and #6 above nor provide an
>      incentive for tcmalloc to actually fix their crap.
>
>   B) If that's not sufficient then keeping tcmalloc alive would require
>      to go back to the previous state and let everyone else pay the
>      price in terms of performance overhead.
>
>   C) Declare that this is not a regression because the ABI guarantee is
>      not violated and the RO property has been enforcable by RSEQ
>      debugging since day one.
>
> In my opinion #C is the right thing to do, but I can see a case being
> made for the lightweight fix Mathias suggested (#A) _if_ and only _if_
> that is sufficient. Picking #A would also mean that user space people
> have to take up the fight against tcmalloc when they want to use the
> RSEQ guaranteed ABI along with tcmalloc in the same application or use a
> RSEQ debug kernel to validate their own code.
>
> Going back to the full unconditional nightmare (#B) is not an option at
> all as anybody else has to take the massive performance hit.
>
> Oh well...
>
> Thanks,
>
>         tglx
