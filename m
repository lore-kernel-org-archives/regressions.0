Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4163D34DB46
	for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 16:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306369; cv=none; b=NW7p0ibWmITTeApg/Kn4M2gZpvxOzH/R4OC12AG0pHje/zKLfx2U6qdfezzDqPSpmqLWzdmBfopjTEdHhCejhCbKU1+rDw2+RRsCOG/wz7ta6A8PFLjlXE2Rx1sZWLypmF7E3CcyeB1dp5U8rJOmDOBkStkLSMVlpmMpmeNAcP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306369; c=relaxed/simple;
	bh=JiG+a6OmNShmf/V9YM93PxwNMCHArtk4gJjadNuKmUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZwHxBD8ySpyOyypj2xX3N03RDn8Unw9hacnFbSI/Ao642p6DIcCB47qSj637Iscc3VARH6dsxBcojHlHNFBU6tAOLXIQmvp2tM/4nRLR+LR6YhOk2d6TJg/hn+aB2q3WtoFbtXNrzMHW1Y0yOrQmEs/VFgDHSapD+xEFf9/lsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Tz6graNs; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Tz6graNs"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9c3e2cf3c0so1772952866b.1
        for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 09:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777306366; x=1777911166; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JbhNNtkACDoe7xFvlMDxo1hg3mD7N2S9mOLV3kh/g2Q=;
        b=Tz6graNsldr8rtXMSVp68Kl55Di3tAh9ZTsO3sH+WYJN+SDYnaDMUPGDgkWX8MGe7J
         /GFmHLHG92+cmbvNO9Ah5EdHAjU+PTaa5T5Fkeklm4Xh4G6Q7Z4aVlChNwz1utRxnYt1
         cvOLrUoDEL9fHx0VCYJ35fwyUokcrPxi1L4zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777306366; x=1777911166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbhNNtkACDoe7xFvlMDxo1hg3mD7N2S9mOLV3kh/g2Q=;
        b=Z9xbl1zKb3xjQuQqKQLXQKSVtngle9dA/PbLPreqL3rLR4/MBLSCDUedCr2NeV58j2
         u3dOWTspp2+BNQ8YV0elihoo2gV08wxB30Pj0CV4RbTOwmVwWBuLrvHmuRKkNPd7FFE/
         V2FZWor801klxMeGZFHOfm+wgWsyWTtOUDPZHC5/NutAosxTm8AlU25OCG5luSmDusPu
         ydi9wCzyb3Wba5qtZ2xJjvuMCtIWE9eIVW6FZ3aNAL7Fup5Est9bESM7OzIYZY4bI99n
         F9DW8+pVb143303Zyux/+LVigZI9XmEgKSctqXtAETrDB23bYSS68f5AAZdU88myzsqa
         Oymw==
X-Forwarded-Encrypted: i=1; AFNElJ9MpsJocLBKcumTShNp4ozetCHyfF1lE9xTtsTLhzZ4vRPZU99cS9r5dCDXfcfWNJh222t7bkQCo8eefg==@lists.linux.dev
X-Gm-Message-State: AOJu0YznBa/ZFC/YQB5/Rmpc5LlpDnRtfaXmrDiK0h58TzHG0vrWjXVG
	D/9WoTIh05kUuN5ZcbpygEM7GwAAiRzpYrxzQYE//TT+6H+vG9fgCCmYJl0P0Uq9hYyr1WnSt23
	GA9tg7bE=
X-Gm-Gg: AeBDievcMIxghEfVBhfNK74ed1c8ljm4M6bnX/CnqCiGNy8k8ub8Hghj+CQKQMDOwVB
	U/5ZdEjxjlu7wdBpF2cP+boITx5dzXIh1edCikY7jH01HyZcMAgUC1Q9JWHyRxithtP9bxs9rVk
	KJt7EDP+ffiCanUjXFKolYupv9UIeUvYBhZbi+pFBlV9EOMjsmQvYaN9vC4AIGL533YZQTagBe2
	pRit/osrNjjEiDxVolEiLj+Vt5Wd6byOz7iI7+C/gDJXpgXP0Igsx07TzkdvzxdiFCHk8E79fqj
	PBPalphryPuveuA8i0NzmHbMqSjirrGTM1zs2KIZjJO0sYbxh9jjAXuB7mNq6ckZ3cP/QcW/HyA
	S6TtQYUj+7TpXM7jrdK0Rk7vs5CMVqHbarVr6yLmyeAyggq8J0DFBW7NSyQfwtqTtfp7ttMeQ0a
	D1qpXqgpX3RtevYcDzJS2wzOF28EiUuVXwA96Yc+yClwg2/RB3TtePqZ/LnBT6BnbXi4ulZvlAd
	1oamnL6+lk=
X-Received: by 2002:a17:906:4fc6:b0:bab:f5a8:1255 with SMTP id a640c23a62f3a-babf5b75850mr1015310266b.33.1777306366254;
        Mon, 27 Apr 2026 09:12:46 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bbb1sm1115827866b.38.2026.04.27.09.12.42
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 09:12:43 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-671c24f23b1so15280848a12.0
        for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 09:12:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8iYU7ENFiXwpUuHjhV2xlrXwbwaB+gFJb+1ex4V0Q7FW+IB7mCzfMMb+0vO7kXr5aIVfff2bT6oRMNAw==@lists.linux.dev
X-Received: by 2002:a05:6402:c46:b0:670:d548:da79 with SMTP id
 4fb4d7f45d1cf-672bfd87175mr18954968a12.3.1777306362462; Mon, 27 Apr 2026
 09:12:42 -0700 (PDT)
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
 <874il11jac.ffs@tglx> <CAHk-=wh=B3fqU9AaBsyViZR=eVTG5qa2CGyN=qxPROVxu9Gctg@mail.gmail.com>
 <lhuqzo051cq.fsf@oldenburg.str.redhat.com>
In-Reply-To: <lhuqzo051cq.fsf@oldenburg.str.redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 09:12:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiLdmz92CCfu2+-9_UrGSn6Pu6sUVvLs5gjyhGaEov-BA@mail.gmail.com>
X-Gm-Features: AVHnY4KSfM89JX8og5V5ge1wHnX-tp7SzfuRcYZnE_6XGeDyPM7Sz-28_HY9VRI
Message-ID: <CAHk-=wiLdmz92CCfu2+-9_UrGSn6Pu6sUVvLs5gjyhGaEov-BA@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Florian Weimer <fweimer@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Mathias Stearn <mathias@mongodb.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Chris Kennelly <ckennelly@google.com>, Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 at 00:06, Florian Weimer <fweimer@redhat.com> wrote:
>
> RSEQ was intended to be modular

You are entirely missing the point. "Intention" is immaterial.

All that matters is reality. Intentions are ephemeral farts in the wind.

There is *one* major rule in kernel development, and it is "we don't
break user space".

And user space is inconvenient, I know. Users do odd and strange
things. Sometimes on purpose, but quite often entirely accidentally.

The end result is the same as far as the kernel is concerned: we don't
break tools that people use.

This is simply not up for discussion. Any "intent" that isn't actually
enforced by _checking_ for it is only wishful thinking, and worth
nothing at all.

                   Linus
