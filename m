Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB873BE624
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 21:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776979739; cv=none; b=h0fWyylDIsQEhZ82YF8JXgrZqKcVh6AVAtUQQs9SpQg32ZMLySjOu1J1Rx7yxAkF1Y+Lol3Ro93k/8rBPc4Vdlz7EC3TcLuLeyhLdtOOgFDRGbmiz+Axsqaaey9nUy7NxUFV2geqJQn3QsLYvYDiON6Vm2ZRe+/1xvpiZGrXFFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776979739; c=relaxed/simple;
	bh=7snuCMxeA+rl6rRgvSmrzcNSD+sv0ZfCVLNnaCjJ6RM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fCJ6uxqi9a+GtkYwCX+YwMVU6uKOLavQ44iGS7VP/KK3TevgrBMGp7wpLQqYs+O+e5K1QjLclJrvWd044v3fd0ayVrmEIxYSuZMEoRdcwHapEO3dqFo+lMjbBLNa61cFLGUuYE2eV9axsmPNnSId3jKJu/0nnj8G0wncff2R1Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Nw7I0NcX; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Nw7I0NcX"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9d9971d059so1052781666b.2
        for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 14:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1776979736; x=1777584536; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wfwFwCIldVr0cgNNRvDZvVTUO/qPdGSASw66Babpmsw=;
        b=Nw7I0NcXlXPBQcFrQz33Aqoh8PUQsUZnjFnU6ZYXCjbhKg/4TcNYixsK32cbgFknFS
         InviXCLTD8UMvjWTtjVguBon6IBu+Seq0lPPgjpkKBvbtfJw2UznHfrce6bVnysiTSJE
         mZ4v7HI1D758FeIkaKrbQPXKofwuWziyaKf4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776979736; x=1777584536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfwFwCIldVr0cgNNRvDZvVTUO/qPdGSASw66Babpmsw=;
        b=kdQmBHDYcV4iWmZoNPRvQNPfN6l3a85GWJ1dXylD5nCox04/zvVLQHLQpAc4vo80EI
         c3HJ/gaYo9UaGQf4RmjXMs/SH25ZfIEG8qOnsyu6T9rgPYuJFzu6d+aZhTNcH5t83ItJ
         AJNhVGtIk4tFrc8TPhnawWhx1XdaZBtnuOX9HV0RAYp3s9W+lGncGWpoltf1doEK4tYK
         j1XsO2f3VzNlnzOV7VcioFUPDcTvqVHw+FuKk5Doqdxey3tPJBrFGsnDaWU7Epo/FHvi
         1J3AbpekxiZs68sDf0t/IaXBylGTWjtGKfgAwoepANSSFbwUs+yPubW18E28624SZkmX
         CXFw==
X-Forwarded-Encrypted: i=1; AFNElJ8pbaEdZphmv2yw/RIvygY8gN+MibTOMjAStWhCvMajjcKeGhVbbBHPOrs76o/HuslSnbm1IkK4sj59ww==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVCRH+cfJyRa4yo4Nq0/HNRxgdrS/aqiIrMgCS67NEZHFXLA05
	mXgp4FAD+kInNkxWinuHG0Ay7aRom94N+1BQxn7M8VvuZ5IxwFHZpgU10gJECDjyEmQrz8xoh7h
	dwVIm51JdkQ==
X-Gm-Gg: AeBDieuURhG0N1M+Yo/cIA0qU9JiPbMefiVmm63npEvB1Hz3ZLyZKDozPzGXlLFRE9h
	6hvQMfoyO/1fvMXuXbqFMfN4pDCfLD2DKTeAP0L5Ja3SeTy0g6Ezz0DdSSewSnph6zG6CPxJ5Vf
	SvLNqGxrVe3ki3exTwH7Yr/Z25Tj0rbcP/qSTIeSk1g2shHulEJoOa6HJECOmAe+KX9eHTSVzvD
	rBCZRpgBvcnHHKrjWv3DwrluMXO8CY5FapPF+ujwww8gupgQtHjWrlpid83o2wZUXK+2B1ZuvT5
	tW115p52y/usZu758ILINg6EkEkv2SALBskQmFgpBg4lXEHL1VkxF4F7e5bRvnY+YIUYP9lV//Q
	DWQC3OWsWdejRNGeSeVqz67lsmo24BXJUanbR0IfaE8R6GQVlr2EIGdKb3p36a18BW67sNwA0Gg
	AJJQN07vayR7PiehH2NS66Jq1PERNE1fQ+A3IOC2hSEOJFy9xHsOdEJrRyjsz66IeLFJMb1Kqx4
	ZPAD/uyklI=
X-Received: by 2002:a17:907:9687:b0:bab:812f:a894 with SMTP id a640c23a62f3a-bab812fa9e4mr432352866b.20.1776979735931;
        Thu, 23 Apr 2026 14:28:55 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1b379sm678151366b.39.2026.04.23.14.28.54
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 14:28:55 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so5769462a12.1
        for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 14:28:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9vT7r1Pb0rOthIjKp9DAIAIyubZpyaYtcZBSKO+07fdGh+ARTUTgcNbPedBHdQHb3K/wwkwungB3e3Wg==@lists.linux.dev
X-Received: by 2002:a05:6402:5188:b0:676:c526:b5cd with SMTP id
 4fb4d7f45d1cf-676c526b6ebmr6097033a12.11.1776979734312; Thu, 23 Apr 2026
 14:28:54 -0700 (PDT)
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
 <874il11jac.ffs@tglx>
In-Reply-To: <874il11jac.ffs@tglx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Apr 2026 14:28:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh=B3fqU9AaBsyViZR=eVTG5qa2CGyN=qxPROVxu9Gctg@mail.gmail.com>
X-Gm-Features: AQROBzDPHxpB7P5JMMu78wlgnLqIXy2iv6n4729bVTOgWr52y0l_Hq-q_YmDm2Y
Message-ID: <CAHk-=wh=B3fqU9AaBsyViZR=eVTG5qa2CGyN=qxPROVxu9Gctg@mail.gmail.com>
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

On Thu, 23 Apr 2026 at 14:03, Thomas Gleixner <tglx@kernel.org> wrote:
>
>      Feel free to enforce it, but be aware that you thereby set a
>      precedence that a single abuser can then rightfully own a general
>      shared interface of the kernel forever and force everybody else to
>      give up.

That's not a new precedent. That is *literally* the rule we have always had.

This is why system calls and ABI's need to have hard rules that they
actually check, because if they don't, they are stuck with the
semantics that people assume.

And no, "documented behavior" is BS. It has absolutely no relevance.
All that matters is hard harsh reality.

Yes, this has led to issues before.

Most new system calls have learnt their lesson, and they check for
unused bits in flags etc, and error out on bits that the lernel
doesn't really care about being randomly set - so that one day we
*can* extend on things and start caring about them.

But they do it because we've been burnt so many times before because
we haven't checked those bits, and then we were forced to just live
with the fact that people passed in random values.

>     // Note: this makes __rseq_abi.cpu_id_start unusable for its original purpose.
>
>     Do you seriously want to proliferate that?

Absolutely.

That's how clever hacks work - they take advantage of things past
their design parameters. "If it works, it's not stupid".

We don't then turn around and say "you were clever, and we did
something stupid, so now we'll hurt you".

This is all 100% on the RSEQ kernel code, not on users who took advantage of it.

                Linus
