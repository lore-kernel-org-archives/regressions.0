Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E3628CF77
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 17:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776966085; cv=none; b=GWhdMI24yQxpCOfhMjLZ45fuERUwKFT8c2sMd+ijngKQRSVbJU0ZSheuTzKiNrVEqBcocRvcv65yTdz3lRngnNA9ydFc0E83EnxN1Cht982XUOBGHsUa98kG+ydCHGyKN23/GjXmnYa1fS82/0IvZE4Uj4IryznCyIsPOF/rCg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776966085; c=relaxed/simple;
	bh=DrbejZ4Uc9HRuEF/M64xURSVJusANRX/YkvHD2XUWhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eWCliWAMOsvM6+6SezySh9UXwU/XEn8WYGBmPgWCPir/7BrKjnnQwWf0GPn87wzLXAMSHM5wwVqlsqJxsvxsOzrdyPsLFWAqeHMiKAe9mVSp+9vfg9fBHnh1vZHCWuup+uuSeRy8H/qKSX/b6h8InofiFVU/Sbtg+JpwiGpZKSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IUvz96WO; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IUvz96WO"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-672c12e95e9so9948559a12.2
        for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 10:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1776966081; x=1777570881; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MtCO+j49oRtYrCNOBMxnRW4knEbb/1y7Mt3UWY7TQfE=;
        b=IUvz96WOwYBZDNAeH0Tvzk27Mswl+7q1Ly99CZtjAzoDbH5iuMmba/1vRKVJURTt51
         xPPOVj8wcsQaDqc2EMR0bDwWRvvCYFr6UP3eZyV7geKuolx9ZIjj0fOwJXdlOMr0QYQC
         yz8BePANcfBRYhu5nIo3nu4MknzbRnRTrvqzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776966081; x=1777570881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MtCO+j49oRtYrCNOBMxnRW4knEbb/1y7Mt3UWY7TQfE=;
        b=B6wiUMLWb2hNIDsEGGSOqPaPky9uoOeXLveursHAnn0N5//MjuYmKx/HsfD41fs1/b
         htBO7qrcKvgOl5LJ9/DV3d3qAixOr1G1Ed1vnO/xcrZbP0iMthKcBWGJzZBHu7rBuP8J
         Z6okRNqcnLjjdyh1o993dG2yLFfRdGcw9woaZiKAQHtymgSMWkUAx7WzemHzkV/0iuK2
         DKzrgyknAEkb+t/nhLMbmw0XdKiaYWqGgkFAs7yxLLtMO0iGpEdRei1ONudb3IN8++eE
         jPC9cDDyH1xMBeU6YE64ZIIPOJQlMca8mYY6SWOH/phqDB8bdQS28HsEKqMqj0vDy8R6
         aa8g==
X-Forwarded-Encrypted: i=1; AFNElJ+fyZkktBsLLqXrGTWwc1TAw9ts+gIHsRJQzcsPqtYTFDPRTKD9virT0VXV7ngk/Jz1Nxvg7QQ3Zo1OJg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu1PMisAwQPQrc3O7mP3TpExrjzsbwks+CPOALNiUMx6FUxsd8
	DqXV6+XMCuM0xsQuka8d+AFDy3B7lIp5euWef/0gFWMufOKp0odo+cv09wjM/uUi6wcw3X9TUVs
	pcr6fBHY=
X-Gm-Gg: AeBDiet+rkMBIdRrFoP2J1D8Q4LcJnAl2ZykHaXgMk+rttkWRBtmXXFDiYA27jnDapD
	CDJUeaZgZxhwXj+JV+QtKW4wwbxbcZIOdHz7XUNz4NvF0qaOeUV3bQb2P7HKbaqolSylY0BMze1
	GKKiv1v6WNvaj7dqDnhK0EIZC98/m7re9ByX1nrGb0PQxg8GEON+IPcAFU0wJsF3/sThGK5FJWu
	8DP9jd5M99aO29MTMFdtpI9unLzRaqVhq4VDhf0ZgcapEaXVCMNOnIbNAExegW/nVXbQ1huxbRc
	xiFRI96cNAYkwa21W6aiyYtBwULwAVvd8aJZkJXdglnigdYg+s3WJ2X30jeruK4F5pqGrT0dg2N
	Eka13kkvscEEBhl+DlurJP935HQKXVBc/54XZU3nGLhz33dVRuCXd3MIR9c/xk4MYg6M3KH5/p5
	OOUHR70RLk7KxXY4XfDKnWnkccozW/4gsBzbr8FKN3MoNy6sXoS4E+OY/RyvZ5VDrxIEryhLfEo
	J+WVW2c3LU=
X-Received: by 2002:a05:6402:5514:b0:677:1d09:56e7 with SMTP id 4fb4d7f45d1cf-6771d095898mr3357287a12.23.1776966081336;
        Thu, 23 Apr 2026 10:41:21 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6743fba7321sm3815913a12.0.2026.04.23.10.41.19
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 10:41:20 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-671c5eb7fb0so8577746a12.3
        for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 10:41:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9lSTiVbK+vOKoImyuvRmOjU5FHoKaVJxRZDWcpfhr9ZL/mj9vUIXF/dcs6mOaM+yGc25huKNJECLj8Yw==@lists.linux.dev
X-Received: by 2002:a05:6402:21c9:b0:672:522d:8f90 with SMTP id
 4fb4d7f45d1cf-672bfd736fbmr12735589a12.4.1776966079746; Thu, 23 Apr 2026
 10:41:19 -0700 (PDT)
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
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Apr 2026 10:41:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
X-Gm-Features: AQROBzBzEOcvm7qbXfrxaRw14oufW4aJ2ixiz_9tNE7BqF1Jnabsdo_EuiA-ypA
Message-ID: <CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Thomas Gleixner <tglx@kernel.org>
Cc: Mathias Stearn <mathias@mongodb.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Chris Kennelly <ckennelly@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Apr 2026 at 10:19, Thomas Gleixner <tglx@kernel.org> wrote:
>
>   C) Declare that this is not a regression because the ABI guarantee is
>      not violated and the RO property has been enforcable by RSEQ
>      debugging since day one.

No, if this actually hits real users, that is not an option. If real
users never used RSEQ debugging options, those options are simply
irrelevant.

Regression rules have never been about "it wouldn't have worked in
some other configuration". That's like saying "that code would never
have worked on another architecture". It may be true, but it's
irrelevant for the people whose binaries no longer work.

We will have to fix this.

This is not some kind of gray area. It clearly violates our regression rules.

The only "ABI guarantee" is what people actually see and use, not some
debug option that wasn't enabled.

And I just checked - it's not enabled in at least the Fedora distro
kernels. Presumably other distros don't enable it either. So no actual
non-kernel developer would *ever* have hit it, and claiming it is
relevant is just garbage.

IOW, that debug option was always a complete no-op except for kernel developers.

In fact, that debug option is actively *hidden* - you have to enable
EXPERT to even see it. Soi it really is not a real option for normal
people AT ALL.

Christ, even *I* don't enable EXPERT except for build testing. It's
literally something that only embedded people doing odd things should
do.

If that rule was actually an important part of the ABI, it shouldn't
have been a debug thing.

So:

 (a) the debug code in question needs to just be removed, since it's
now actively detrimental, and means that any kernel developer who
*does* enable it can't actually test this case any more. It's checking
for something that has been shown to not be true.

 (b) we need to fix this (revert if it can't be fixed otherwise)

I see some patches flying around, but am not clear on whether there
was an actual patch that make this work again?

             Linus
