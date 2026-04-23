Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7556636A035
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 12:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776947093; cv=none; b=R6kYNNPyWbjY8x6aiXpavsA/3CGHmpgzdliqph149KFjVXJ/li7Xh06jU+i5N6kBzKZM6mAUGxKWQkRWnhD6VCo+KCCPq6IRp9DKtSSPI1KiUvoyorjNy5z7w7e8G/E6rbbubEUAlr5yCv0E0A1/qufZ3fKkXWdK7IncQQmWkrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776947093; c=relaxed/simple;
	bh=22csvG9GRaf/BX6GuMwQHlvP8c0dhRAphlpB2jAkWO0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dUElTm+u3l56NrqLNtBVlySdtSXAMnGCw7HLtLgoCvg+QL2ZPeIWgGhsKsgrBLp+FuKs5B9vjCOXPXr5KUljALTydHP2zYdRxmaRdFsGvDUmya3zvkiU2vIJvC/n2Ps2Yyi3rmoyVgl11EF53br+gAO6TrPXqUmqPg9Pxm580uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqHM122L; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqHM122L"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d77f60944so5290054f8f.3
        for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 05:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776947088; x=1777551888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtlmVXsrBR7qEczShYHnYwWDm+M14LhdN7rkrKGVul8=;
        b=YqHM122L+CTkCd2GknAViHKTn7USfGHF0qqL+c1qVb1ewys9e7fmyJ6BS7kwbrC2tV
         CFooRGBgRHtloum4Ob0HXZpK5vXxPevUqmy/cttfJfcEVEecahlYGvXCcWgxBfG7Bxlj
         loAJwtRM3HOibIepSY8p+wz5+w1l2pKy7evB2YFxKz8uZqdFl/fy+VvE2pWE0bAU0nhD
         p899UPncfX2PJi67z5It1UmNCnZFCAQ+awndcF1bT7bfz4lG/lB3cYBayfALW67g9cbY
         6Ca67Vs+ZTq564M2MBKc95/mi5RCT0lW1xM1Xejy9YPJYB6+wXoabCMlkrHqnH1/OMYi
         a7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776947088; x=1777551888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VtlmVXsrBR7qEczShYHnYwWDm+M14LhdN7rkrKGVul8=;
        b=MsfUqkeZ9zRgmJkrYy8YSr4j/47aLEOtiITfJ8fdal+/Yy66ylf1EH5qK5L+Gdfgko
         hXYW8mrLWze997Nac09EBvQjJcaolZsR8VTQjQPxiUdgQcHpZGAGy+c0aVzSQL3rkMwM
         s/ukz7WqCtNHL2vRu5Nkyj82xc/shTz++W6hiX+NMxqD79f5sVGZsWo2z+aOjXfGDIaA
         1ie/qGIEUcx7m3W2LW+JNfG30x8ztckQRW1oSYpsgsmVZ2jfPtaNtXe3FkGbJGY0Z3cn
         QRphnjc1LoJ1Wdf08xKFNHe7xOJ0HO/CamEfPCN5x3lIOdnaDfyIpDZ9LWNMj57E+3cQ
         lt6w==
X-Forwarded-Encrypted: i=1; AFNElJ/rcudjm8SnIgvmSN3jLzQLNUUdnvPit7kkBE1Cs9y+9SUfpt/lFHrvvu0sVzEWsOejtQibShC+Vpd/3A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9yZ+pbqujUWIKHWG8+mBH20z2ayJT65lpG+GxFO/59SOZZWkr
	y53W1PNgT2U+waMbyOzJEdvYXHhQYIafK75MRfTQ1dxebhd2bIAk+KIS
X-Gm-Gg: AeBDietD34j+dYB/6I4pkCoWjASAPy4ctqByExZjGg6djQG0OnzXhIifdglOUlih6gw
	sZevvdW9ivqDX6ylOrvArEhr9oDF1Wu7FutVf3Z1yugDPvgv6v6aUJhRa22//szpyjphfq0g7IS
	yUUn62S+YG/wWYtaYKGIWQAx85rdxhQ/gJKGcyXqcDIGVWBUkeZSoRtfRdq7gW682yFcy0K+9eU
	wK/kgAZSAu/ghuJEf9TncL1RWYlLWytswITEzELX5VII7ReXF8qIOfFkocjmOM8et/0ezWZ3Gom
	7kqs+VD9+gSEiOw84OOqzDv13eaXhEMaEJXUNVNsmQrMvkwIrR5pkJwESl+Bha+uo5xYOY2+7ZM
	m1dpDrG9JqQgsqiKLQDxRsB+93/uoW3JDU023uCF+iM3z2OTed7cqtzCW2NGRc3iEclHoo3/q5f
	FGVU/Uf4YrTITq9dkDwTS50/3nEtZgugj/8GiXAQ+uot3XUqC6vO5Q5DXWA8v8rvJbkMrDl2pzN
	xo=
X-Received: by 2002:a05:6000:25c6:b0:43d:7af0:3a7c with SMTP id ffacd0b85a97d-43fe3e0d44emr40367257f8f.29.1776947088049;
        Thu, 23 Apr 2026 05:24:48 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a341sm57552815f8f.24.2026.04.23.05.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:24:47 -0700 (PDT)
Date: Thu, 23 Apr 2026 13:24:46 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mathias Stearn <mathias@mongodb.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov
 <dvyukov@google.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-man@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Blake Oler
 <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
Message-ID: <20260423132446.70478a78@pumpkin>
In-Reply-To: <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
	<aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com>
	<87zf2u28d1.ffs@tglx>
	<aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com>
	<87wlxy22x7.ffs@tglx>
	<c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com>
	<CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
	<87ik9i0xlj.ffs@tglx>
	<CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Apr 2026 12:51:22 +0200
Mathias Stearn <mathias@mongodb.com> wrote:

> On Thu, Apr 23, 2026 at 12:39=E2=80=AFPM Thomas Gleixner <tglx@linutronix=
.de> wrote:
> > The kernel clears rseq_cs reliably when user space was interrupted and:
> >
> >     the task was preempted
> > or
> >     the return from interrupt delivers a signal
> >
> > If the task invoked a syscall then there is absolutely no reason to do
> > either of this because syscalls from within a critical section are a
> > bug and catched when enabling rseq debugging.
> >
> > The original code did this along with unconditionally updating CPU/MMCID
> > which resulted in ~15% performance regression on a syscall heavy
> > database benchmark once glibc started to register rseq. =20
>=20
> Just to be clear TCMalloc does not need either rseq_cs to be cleared
> or cpu_id_start to be written to on syscalls because it doesn't do
> syscalls from critical sections. It will actually benefit (slightly)
> from not updating cpu_id_start on syscalls.
>=20
> It is specifically in the cases where an rseq would need to be aborted
> (preemption, signals, migration, and membarrier IPI with the rseq
> flag) that TCMalloc relies on cpu_id_start being written. It does rely
> on that write even when not inside the critical section, because it
> effectively uses that to detect if there were any would-cause-abort
> events in between two critical sections. But since it leaves the
> rseq_cs pointer non-null between critical sections, so you dont need
> to add _any_ overhead for programs that never make use of rseq after
> registration, or add any overhead to syscalls even for those who do.
>=20

That sounds like one long rseq sequence where the 'restart' path
detects that some of the operations have already been done.

	David
