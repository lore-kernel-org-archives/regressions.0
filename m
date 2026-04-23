Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F3D2E54D1
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 10:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776941512; cv=pass; b=B2fj6uU1zM9p9Bx8Siz6+LLwP2VVyQ8eYJVuIRPWKDRDqM1jQiu4Ze7VaMK0H7XYdlrp/7qXqt4TbIJAHAKPmRDwQxtzWHn7R27K2SsjEaXEwjb75p6wUzTT6ejn01vG9UJgecWTUe7q0iMEN1oefaF+00TeFRKy/eAi2/MwdGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776941512; c=relaxed/simple;
	bh=HwJeUPIs3Q9zE26Fm/1dIX8r2a7GFCDoFLztB0f7WGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NkNCH2de65u+Y1y4L5Z9RVdR1HFw48iJUbxxV1XZPAw3gvdVhL4o09R01UhdkKeZhkU1RMxwxXTW6+Xd+UnlDTa21Ty61HaR1Vs6YyoBQEQ4Hzlk2Z44Z/xOEom/Vi2RJ57xfqXFFcmR01KYWohDDT/a9kZf/h9++fMxm9TSh+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mongodb.com; spf=fail smtp.mailfrom=mongodb.com; dkim=pass (1024-bit key) header.d=mongodb.com header.i=@mongodb.com header.b=eadaW2A0; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mongodb.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mongodb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mongodb.com header.i=@mongodb.com header.b="eadaW2A0"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so78439666b.1
        for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 03:51:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776941510; cv=none;
        d=google.com; s=arc-20240605;
        b=LOHWgBf3+/SIywFOGUkQVWFO3DZJGxK8zHlFiFvy8zX8FwtQTxWuJKDdVcvctivNtp
         JEwPq5FafxTWtjegS4VrukFX8uisTVNhWpjS7LdKfop+Us/fx2Mmy6i2JfaciSF7S6uM
         lnSLpTVXiusB2xtIbahST8oQbAeMlp9IIW0s0Gt91+Oqn+pzAS6DIwda63zhZYizoJ9R
         nMIj7buLjuHlK7ZgEhmyt1pvZUfwn52BT2ycKtW/6gvhjFiP+98W5OSMeDwy1O4O0BhL
         An9+fF1ZEIcDDBX8rYEglP3IU2HeBFfrCLOkBx2FpFqOigbaPo3bXCArn6PxVbaAnyw7
         r7sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4u0NLqUbLY9OPqLjh5qipvi/NJ3ZqeW6p4Eergru/hM=;
        fh=R6dlK+MLy8DfZwQL9qrVkXONzKwyfRJKzjKY9NOIDBg=;
        b=W7EDHtVO0t1YoxOX75Pww9W2x/ujZz+x4OpbR8OvNCpOgZeKc6uKBy0oTiHeItrlIl
         kVp844228sTXC8/LZdqO2djz3Asyx/sC7lo5jeEnos5ALedkkgJl9WxrzXyP/avHETiU
         NtIXryoCWTQUPV3nU5Twm2ZvPW6jSPtVditW8183f3sUuUOuST+GUjxVQUvfJwOvSaa/
         6KGUU+8eaVYYzqombOP14Bnza5E2f1WodSpebVX78sEN+vp0SRnyI+Tvjd8uWHFgarKJ
         BahrS8w2h4n5N3EbTKiJNri5ZqkzUIc0uSsM+GLzYwn5cgFyN0hzoa6/G8W6anUuCSQG
         2H4w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mongodb.com; s=google; t=1776941510; x=1777546310; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4u0NLqUbLY9OPqLjh5qipvi/NJ3ZqeW6p4Eergru/hM=;
        b=eadaW2A0Pf8t0b3onaz1svmBYWOQnYZRffwzJ7DuNLqrhr7tmmemtcV5JPMh/oqFuF
         fUE44IAe4giYaBnxGsre1ArLKEOA4mGBVgkoINiU6PyDz+Louce9ihXA/S+jxaevxJnt
         wdmcGtlXCYVK8RC2RH7ApSGYojbVaM9YDORM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776941510; x=1777546310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4u0NLqUbLY9OPqLjh5qipvi/NJ3ZqeW6p4Eergru/hM=;
        b=CDYaFbgbc2tkQAD3iIRrX1T8OiC98ukHAVAa56tqRD1AIdZerJNEGTzhN8qeXAuY5e
         qMRg3bD6suZq7BcymHD3mwEyD61uRYN3Qae9wY129luIaOmdnYcEaEIWAqpDzlL561bp
         sijXzxQO2SjieAQ6tBApMsHXdIBkmrt/4juHYLM4jiMKtHiPln99BGl6d8w52VaTNT42
         pP9Q71BeF8nybK7VZbXh7vGWrBSmOfViJSJambJIoIgvZqzOT1/SCrYpVJlwJq9r6GTI
         4/ks0yl8tSyvotbKvx28tOjYYACFabaCKE/5ekU5utVv6t3lK9xHxu1TLZpXFBg00XsO
         cL1A==
X-Forwarded-Encrypted: i=1; AFNElJ9mP1IQq6hD4RKIZa7rgp99xwceBdTzzgSSdUiWnupL7l6oQUmA2txXQX1yqfUVtpo5VH/qwNj7R8eJiw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsINznCiS1Ywsr1us2IleUrbhnH0L9ZMOtr4Jxng/NIyjExS/B
	IB0xW0ewlKE3x4f3Rr13vyysQggwy1aFF9GVJnjx9stU+htABzoeo6iYlHdv6NSMzStdUeXHRwL
	xu38FkGPTTb01+mfPNjT+rJEAbNomZynt7J0pnQ2ZMQ==
X-Gm-Gg: AeBDietD7/HajxdvFErHyTLyTzw7rqoSB9eInZtMB6C8/YHZaxENfix4SCsDkES943u
	JpVWp7V/BW1bsgLPPMsABCavV7Mf1LWsIKWr4bw16FHYL9OJ9iK3ZwjlQvfDXrrzR25gN1woxqI
	BRWUyLGQLFuiFpEroOR86xI49jdQsiC3xJNp83zv+HQG8Z+RjbYyXQxoLwsU8P7KoDlxKvLTrc6
	09O9zseZwclxv3O6pVdZZ1j09pG85Rcl0exEg9QE316azsnEFjXQ37RyfkbpGZjNAsNyt7kkCV3
	IJIhllpmM+iLBynRhji6uI8zcwI=
X-Received: by 2002:a17:907:6c0e:b0:ba5:216c:56e6 with SMTP id
 a640c23a62f3a-ba5216c6068mr1253044166b.0.1776941509520; Thu, 23 Apr 2026
 03:51:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com> <87wlxy22x7.ffs@tglx>
 <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com> <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <87ik9i0xlj.ffs@tglx>
In-Reply-To: <87ik9i0xlj.ffs@tglx>
From: Mathias Stearn <mathias@mongodb.com>
Date: Thu, 23 Apr 2026 12:51:22 +0200
X-Gm-Features: AQROBzA3iSwpg4ayUbVJtTBbvtVziiX6iVRBdfeBowQbJ9gb9fUCrFN004zqE30
Message-ID: <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Dmitry Vyukov <dvyukov@google.com>, Jinjie Ruan <ruanjinjie@huawei.com>, linux-man@vger.kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Chris Kennelly <ckennelly@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 12:39=E2=80=AFPM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
> The kernel clears rseq_cs reliably when user space was interrupted and:
>
>     the task was preempted
> or
>     the return from interrupt delivers a signal
>
> If the task invoked a syscall then there is absolutely no reason to do
> either of this because syscalls from within a critical section are a
> bug and catched when enabling rseq debugging.
>
> The original code did this along with unconditionally updating CPU/MMCID
> which resulted in ~15% performance regression on a syscall heavy
> database benchmark once glibc started to register rseq.

Just to be clear TCMalloc does not need either rseq_cs to be cleared
or cpu_id_start to be written to on syscalls because it doesn't do
syscalls from critical sections. It will actually benefit (slightly)
from not updating cpu_id_start on syscalls.

It is specifically in the cases where an rseq would need to be aborted
(preemption, signals, migration, and membarrier IPI with the rseq
flag) that TCMalloc relies on cpu_id_start being written. It does rely
on that write even when not inside the critical section, because it
effectively uses that to detect if there were any would-cause-abort
events in between two critical sections. But since it leaves the
rseq_cs pointer non-null between critical sections, so you dont need
to add _any_ overhead for programs that never make use of rseq after
registration, or add any overhead to syscalls even for those who do.
