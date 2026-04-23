Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AED23B2FDA
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 23:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776986066; cv=none; b=orOScdpNf/OrRKBDVMvj+jV7aYe/eFl24zpNjAseK5M4i7/kwbB1eGbooT252KDezxNMQHZPpGFyuyX+tX6zb3KjzgDxcguL6P8SQrDiQvvUlOmcnwlSoNSwT0JAaxoOobMLgpewH1sMS2ifoU+zm1tuV6VdEi76TYLY23JVMdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776986066; c=relaxed/simple;
	bh=bYFZrOG3Kvql/janNW5KwWm8sjNf0R+XieylcBh4SmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BecDOkRMAwzMTk+mE8/xjLqswcxMBy5BbBO2LRD6IlALJTuxchq8IVFMbdRgdv6gqj332RTs3w3XtHcCuaW5DVyXBIkJsqtjCA1pJrnQabl/DRZ8a3EfdJow1hGOoO5+8vXihLNwzAL2h/KKx+K0mUGtxnlpV9KPChEJjQQAlM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GiylyS+8; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GiylyS+8"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ba67b332bbaso804730966b.0
        for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 16:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1776986062; x=1777590862; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1IQQeWnAi/WmXsc0Jq8evNouVPa3nP74k+TBTX1EPI=;
        b=GiylyS+8S4KpCKy7VnCn3hbaUtJkA4KszezKsxHTtSLK969CSZSZgXu/lVogIrIQa5
         NX57USoIe7OqiJ8gNDc+INf93Hbvqi33qcOPl+qBmsgEK+z1zHQN6u004FteOwlML9AD
         b2Ew7E8anLC8Ct+oAEcg4vr7oJPPhoeTWpWVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776986062; x=1777590862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N1IQQeWnAi/WmXsc0Jq8evNouVPa3nP74k+TBTX1EPI=;
        b=k8qcaHz2rxXiuGGoFvxch/KS4U9yJ9PF2/4MGw6ptDrZvt1cIaf5AurNP+CM9july9
         /pDzm0Dn+8dZfIFMwlYWm3qa8SOy0F3rUZF24b/fp0IEpR/IJdeuIby2j3dTbjoKIlv+
         sIxtGsdlyxxXKrbSKdneNNvYzXt8HhBtTWNPLWnpDjYECaf+FnwmEDBf+Jv8SbS8TTkp
         bcRzTiw5aFblAaPuoJaaU/gHE5/Wm4ErKymVgR6wJtrn2eyTtPnmvumtw1KPUE4kB4LC
         mu2h1NaB7dkv6NXs4CM47NNpK5sZloMZxMmCwmO2qw2maazL52vwxjQddzmwJ8taRy+F
         Q4oA==
X-Forwarded-Encrypted: i=1; AFNElJ84YYxTqMvje0Y3li/WXeLJu8zz+A13Hn+sjpm7OfPx44y+wuuJnytaSjPzj5mKIzwba7DcuGrxoyQdrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzagHGcNJwC/C84w6cZs9gYu+uX1H/zNtrCkwteYPv/8FgiVdkk
	JKStfm93sf1VeUZNL/txOoy1m2lgRf6/QnxwXBlVLA/mi1Hdod56oznhqpiYCvfCCa7zPuxwDu/
	aQDPVWDjWlg==
X-Gm-Gg: AeBDieuY7AQlUfJVYTQ3dJqkyynCd/cghBzoNz8ihxun1OXPgJwoNUXDHt/e44nRGvJ
	8tb/DhUbAqiTNunDE57Yld1SLJucoVbuwZTSDhAn2n1L1GQQTz+v0NqRQ4WY7OfCw/cgd+xtRgl
	joBGWOmxgt1hUvG6JI8948pFi+VuJYkRrWZVF38PK0sk+g5+fYwbfo5D2D/KdMdt+n/OtAeubbt
	SjjSR5UwGki210uCKglzY++ihQDMmveiBftxevQBvZQgFlbGrswLIl3CaBZJnOYRXCIOVdxlm2A
	1Yqm6hUfpFWZcLJ83O57zLMxYIQ61BpFFoZl7Lz1G/UXgXYyTeHGQ5DkHKysLrdpd4c2guDe8Ec
	nhh03pCcKFGtyAI1Vjn01T/0kMVXv+iNffCrauE4WupFR15cPMlHsn5/Epjw97cQdNn38mucyov
	C+rf9QHTh7E/bGByflf1+nNc9PAMIrFcwVrrHu/FC2vHtu414dUWoBZwv0f0ddzXLm+Wpwb8sXi
	g7wHlQxuFvvRbLws/IsMA==
X-Received: by 2002:a17:907:a19e:b0:ba2:4338:e9fb with SMTP id a640c23a62f3a-ba41adf91d9mr952220966b.32.1776986062498;
        Thu, 23 Apr 2026 16:14:22 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba538429115sm661990566b.15.2026.04.23.16.14.22
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 16:14:22 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9358bc9c50so970378866b.1
        for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 16:14:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9gcTx4oAGQgiSeiZ9wz010TZC1lbQdJ0B5++XP91iGI7slQ1Nox66l1dHjQUXIrUOpmSy70aSPOW3IjQ==@lists.linux.dev
X-Received: by 2002:a17:907:9407:b0:bad:9363:901c with SMTP id
 a640c23a62f3a-bad93639641mr39954666b.17.1776985720966; Thu, 23 Apr 2026
 16:08:40 -0700 (PDT)
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
In-Reply-To: <CAHk-=wh=B3fqU9AaBsyViZR=eVTG5qa2CGyN=qxPROVxu9Gctg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Apr 2026 16:08:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgd-QaWjFvumdX0BPga8ntZYwo=e4ZJr9Cb+sg=BCgtDQ@mail.gmail.com>
X-Gm-Features: AQROBzDxtByE_zL0yeL09a8qRHzmOD6033ygRjIYzuhDNj41DscorVUQ0eIqXEA
Message-ID: <CAHk-=wgd-QaWjFvumdX0BPga8ntZYwo=e4ZJr9Cb+sg=BCgtDQ@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Apr 2026 at 14:28, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> This is all 100% on the RSEQ kernel code, not on users who took advantage=
 of it.

Side note: when RSEQ was merged, the *primary* documented use case was
literally user space allocators with percpu caches. That's what I was
told at the time.

Now I think it was jemalloc(), not tcmalloc, but it's not like
tcmalloc is some odd minor use-case.

We are pretty much talking about the raison d'=C3=AAtre of the whole rseq
feature, not some odd small corner case.

               Linus
