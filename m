Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDCE2586C7
	for <regressions@lists.linux.dev>; Thu, 15 May 2025 17:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747331605; cv=none; b=N9TULJhEH+CSBgYtYH5Z71ICZ815YRmO4pvgfg2zMKTjuP5nkP/O4piZod5n3POQSZDUKNSZ0vIOWufNJwoMjOo+OCWBQ7VUSo9VczzF1FJNVa8ftIhwMEjZ/qd7e2oKVQ89s/PygLiRJjEoziI8FhZXnud2MvrxU2Cw8U0h2a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747331605; c=relaxed/simple;
	bh=wUfB25Z6DjgPNVxGmXlzpAkbXQRJJQpijp0/dUMP8+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tRPFdfLAyrbz2ZMi1Drp7MI0508aeTIKUvxaIPuMnQAxBdjeh5n6Epnutgs0IWwZdNu6nWhSEO4AK0EKiSFJ9jADm+3FKCQ+ToOq6VvBaof8+P0BsyJmdHsVyDz0oDba0piUOnCYYQDigeC9dGQwjp65/GSq0/UTenpUP+3egSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSIrYhJu; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSIrYhJu"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30a9718de94so1295122a91.0
        for <regressions@lists.linux.dev>; Thu, 15 May 2025 10:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747331603; x=1747936403; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54fguFj5SD0Kvvv9NyED44yQjf3eGCVtUMb2jdU2xJ4=;
        b=bSIrYhJuYHt8RcK9kF2GXfP5CMOHOmkMVyjEl62VSa0AoHtFNGvM/dRNkkT15x7K+r
         HmkszBBn3OkGcGsUXDw89jaRpvezXoClPliBT+wiflQet8hhGxbdBsTaJSuNRV8ehzDR
         Pw+kFsktG3+FrACa7fMjqcc3faUWeAbErLCEvml5v1wdTUMBn0t+j1Px+xJrjfFqE4VP
         HwEKH2uM2uyqfs92FmaWfACFNGvjJ7IPqsEVavOMsnso67rlTiVGvHvGpYE0E43fHmpJ
         39YKTFOL5b2fZJK9t3ts7sfpXF/yKqpk+wAWw4K5Rx7nY3tkis+/8t/HNUpDDjNG2Bwy
         wB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747331603; x=1747936403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54fguFj5SD0Kvvv9NyED44yQjf3eGCVtUMb2jdU2xJ4=;
        b=A4yNAZIAsN/YrhFwI+0ZjRs4zL3/zuSPvLsY5qoNkDV5qWMW4ARqF6pjYSAHgtvlfM
         m1n9sIEdQagx3t+B0LuGlrO7YxyWWweYjC9j8fKpgN97YTxHi2ZZpTgY34MsH4NIFPQp
         CSbht3hz+73dKnGet/2GsyQfygM5LGr50/PR4phLdvP1+i9CHp+bBw2VcaKpiROzsXy2
         fhS/ZUb5MMRkRe0oW/XdHUUcjLJE4ICL/mAeN931ZPqZ0UHSuhkGihDbfQ0eWaTySp/L
         aMf8jOrSzczrOjrqT6gL7QU9eR2LKZtR5+L3EadszbtzV8IziY4Srh6Tsc7VhhCCo9fa
         TCww==
X-Forwarded-Encrypted: i=1; AJvYcCVmdsvGDQ5zB7JrfFSzTPxwinIlJlqdZ/nPgdO64Zs8qHcOs8qz6uZH+RLtZtQNZmEfZXQiIB5rXyDM+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOLVz6Z0nQqX6bkd+AxuaR+HuJSpo5O0GVThsXpNpq3vmD0YKo
	5DjaSILkHqCCPKHf1R+/aeGe5jOCrKFhhBe1nRSIQRoxLRtGFIWLPXXk7Hj62xP5TMXxbKdeY7O
	OuY4oh5cXercQSteX2WrEu4jAfFNENGM=
X-Gm-Gg: ASbGncviVppRx4t33ost3OP359/lAssVGRrP6JfMxxB4Su4NpX1DIwrtU4WhzmCeUat
	F1aG/EbMjYgkP25N9UxSHWg9BQjd6wTlHaya/jPYVxxDwCEVVFE/HPr1IM0pC6kypkGXlbs6GpV
	KmbOH1qK7ADIhUon/UXOaxjncF8ghYUgPZYhaSz2EvJ0PAE7f/
X-Google-Smtp-Source: AGHT+IHL17I+NPoYgpEtbfBy6dbR6YRLDhqI/LlE4JZevZnvZpbndJacxlHQ01gcFFUzfoGL6d9/8LE8xRDWqjvXXBw=
X-Received: by 2002:a17:90b:3e8e:b0:30a:fe:140f with SMTP id
 98e67ed59e1d1-30e7d5ac5eemr431874a91.28.1747331602926; Thu, 15 May 2025
 10:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250515-bpf-verifier-slowdown-vwo2meju4cgp2su5ckj@6gi6ssxbnfqg>
 <C66C764E-C898-457D-93F0-A680983707F0@kernel.org> <202505150911.1254C695D@keescook>
 <20250515171821.6je7a4uvmttcdiia@desk> <202505151039.DAA202A@keescook>
In-Reply-To: <202505151039.DAA202A@keescook>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 15 May 2025 10:53:10 -0700
X-Gm-Features: AX0GCFttxkh9zWvmT_O0s4tiVH_OWTb-CIz6U-4nojzu3dXqjUGIWuP0S5kbsAM
Message-ID: <CAEf4Bzb4LZK5p08t1y-32wAFDGoRGKR1w1T_je6+a_EOE2uSYQ@mail.gmail.com>
Subject: Re: [REGRESSION] bpf verifier slowdown due to vrealloc() change since 6.15-rc6
To: Kees Cook <kees@kernel.org>
Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Shung-Hsi Yu <shung-hsi.yu@suse.com>, 
	bpf@vger.kernel.org, linux-mm@kvack.org, Andrii Nakryiko <andrii@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>, Uladzislau Rezki <urezki@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	regressions@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Eduard Zingerman <eddyz87@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 10:41=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Thu, May 15, 2025 at 10:18:21AM -0700, Pawan Gupta wrote:
> > On Thu, May 15, 2025 at 09:51:15AM -0700, Kees Cook wrote:
> > > On Thu, May 15, 2025 at 07:51:26AM -0700, Kees Cook wrote:
> > > > On May 15, 2025 6:12:25 AM PDT, Shung-Hsi Yu <shung-hsi.yu@suse.com=
> wrote:
> > > > >There is an observable slowdown when running BPF selftests on 6.15=
-rc6
> > > > >kernel[1] built with tools/testing/selftests/bpf/{config,config.x8=
6_64}.
> > > > [...]
> > > > Where can I find the .config for the slow runs?
> > >
> > > Oops, I can read. :) Doing a build now...
> > >
> > > > And how do I run the test myself directly?
> > >
> > > I found:
> > > https://docs.kernel.org/bpf/bpf_devel_QA.html
> > >
> > > But it doesn't seem to cover a bunch of stuff (no way to prebuild the
> > > tests, no info on building the test modules).
> > >
> > > This seems to be needed:
> > >
> > > make O=3Dregression-bug -C tools/testing/selftests/bpf/test_kmods
> > >
> > > But then the booted kernel doesn't load it (missing signatures?)
> > >
> > > Anyway, I'll keep digging...
> >
> > After struggling with this for a while, I figured vmtest.sh is the easi=
est
> > way to test bpf:
> >
> > ./tools/testing/selftests/bpf/vmtest.sh -i ./test_progs
>
> I can't even build the test_progs. :(
>
> $ make test_progs
> ...
>   CLNG-BPF [test_progs] bpf_iter_tasks.bpf.o
> progs/bpf_iter_tasks.c:98:8: error: call to undeclared function 'bpf_copy=
_from_user_task_str'; ISO C99 and later do not support implicit function de=
clarations [-Wimplicit-function-declaration]
>    98 |         ret =3D bpf_copy_from_user_task_str((char *)task_str1, si=
zeof(task_str1), ptr, task, 0
> );
>       |               ^
> 1 error generated.
>

BPF selftests expect that there was a successful kernel build done
before that. So generally speaking:

0) cd <linux/repo/path>
1) export O=3D/path/to/build
2) cat tools/testing/selftests/bpf/config >> /path/to/build/.config
3) make O=3D/path/to/build -j$(nproc) oldefconfig all
4) cd tools/testing/selftests/bpf # everything is built within this
directory, we don't support KBUILD_PATH or O for BPF selftests build
artifacts
5) make O=3D/path/to/build -j$(nproc)

step #5 will search for vmlinux image across O, KBUILD_PATH or in
current linux source repo (in that order), and will generate necessary
vmlinux.h header out of BTF information embedded in vmlinux, which is
necessary for tests

You might need some dependent packages (libelf-devel, zlib-devel,
maybe some other, don't remember) to build everything, but if you are
on recent enough Clang (19? might work with a bit older one), you
should be good.

But tbh, if the above causes you problems, I don't think you need to
spend that much time trying to build BPF selftests, given you know
what the issue is and you are fixing it.

>
> --
> Kees Cook
>
