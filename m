Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7A02C9B
	for <regressions@lists.linux.dev>; Fri,  5 Nov 2021 10:41:53 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id bq11so17806766lfb.10
        for <regressions@lists.linux.dev>; Fri, 05 Nov 2021 03:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xmnVTe46GHU0w7SZuBsP49gfSkv1JiBHvxo+85QBejA=;
        b=D1oFNgNWtAXahC9Ropy9GnV4qyoD19V0ZnFqtIhLWMErMeCbf9glfvlTdLap/jwYPK
         FiWGEeGAj4McGXuTdr8eX2qajJIomom1nltbBlDvI1C9reytaxZO2aZVasEUxai5U3/U
         9yfIOR141Y5HPPX0SqZgNuNclfsdYDQ0KQyH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xmnVTe46GHU0w7SZuBsP49gfSkv1JiBHvxo+85QBejA=;
        b=yfqpvjBabrBMbCvDW+3cft11kpv7H8wx/2jQu+40kKyUq4JXmTZh+LDLRBU5MQh6Ee
         jWr2wvYM+zb4BOe61BKBd1cAvy2rY77QqPnWUW1v0xsr1qaw6O6NdEYjhty6JtjvysMq
         8q+mkTVjWwQeddbsuA5G98cc31y6VLeWoS6TMJQCZIb1a5tHh3xTpW+fIPs9quZzDF9t
         D+qP4C6XIg9QUxW5EjYcQkjvb1HRJcXp9UYk44A3XcYGn2byqCdoPH7VP/4NfFEvUq7g
         1x9fpxto8BcAVkdnIhLUA0aDwPT5tIPgBUHTcOUMvEIpzuZ0VVlLOmlGLy21Q16pp0qA
         5UAA==
X-Gm-Message-State: AOAM533YW+KFctoP/B7DSRwqCmr35OI+H7JV2LlOGfFqlQEgmHQSZBJC
	30D5FPK7KQqjTeKyBVD+2Z22dh5XUaUpTr9HO9PesA==
X-Google-Smtp-Source: ABdhPJzCY/2nbNfnPQC6rAx7r/EojV40PjJF5NGf5GyKBDjLa2EMLPX0wO1XYpHpHfWsvaDkMAGcu88uRyBP7zrgFQ4=
X-Received: by 2002:a05:6512:39d6:: with SMTP id k22mr22986038lfu.39.1636108911882;
 Fri, 05 Nov 2021 03:41:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACAyw99hVEJFoiBH_ZGyy=+oO-jyydoz6v1DeKPKs2HVsUH28w@mail.gmail.com>
 <CAADnVQKsK_2HHfOLs4XK7h_LC4+b7tfFw9261Psy5St8P+GWFA@mail.gmail.com>
In-Reply-To: <CAADnVQKsK_2HHfOLs4XK7h_LC4+b7tfFw9261Psy5St8P+GWFA@mail.gmail.com>
From: Lorenz Bauer <lmb@cloudflare.com>
Date: Fri, 5 Nov 2021 10:41:40 +0000
Message-ID: <CACAyw9_GmNotSyG0g1OOt648y9kx5Bd72f58TtS-QQD9FaV06w@mail.gmail.com>
Subject: Re: Verifier rejects previously accepted program
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, kernel-team <kernel-team@cloudflare.com>, 
	bpf <bpf@vger.kernel.org>, regressions@lists.linux.dev, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Nov 2021 at 16:51, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> Thanks for flagging!
> Could you craft a test case that we can use a repro and future
> test case?

Yes, I'll give it a shot.

> > fp-88=map_value fp-96=mmmmmmmm fp-104=map_value fp-112=inv fp-120=fp
> ...
> > I've bisected the problem to commit 3e8ce29850f1 ("bpf: Prevent
> > pointer mismatch in bpf_timer_init.") The commit seems unrelated to
> > loop processing though (it does touch the verifier however). Either I
> > got the bisection wrong or there is something subtle going on.
>
> I stared at that commit and the example asm.
> I suspect the bisect went wrong.

I tried the parent of the offending commit, and it worked fine. Weird.
Could the problem be that there are multiple regressions? See below,
we also get hit with the corrupted stack spill.

> Could you try reverting a single
> commit 354e8f1970f8 ("bpf: Support <8-byte scalar spill and refill")
> ?
> The above fp-112=inv means that the verifier is tracking scalar spill.
> That could be the reason for bounded loop logic seeing different
> stack state on every iteration.
> But the asm snippet doesn't have the store to stack at [fp-112]
> location, so it could be a red herring.
>
> Are you using the same llvm during bisect?

I'm compiling the test case once and then invoke it via git bisect
run, so the BPF should be identical. clang-11.

> The commit 354e8f1970f8 should be harmless
> (when commit f30d4968e9ae ("bpf: Do not reject when the stack read
> size is different from the tracked scalar size"))
> is also applied. That fix is in bpf tree only, so far.

I did some more tests. TL;DR: commit 3e8ce29850f1 ("bpf: Prevent
pointer mismatch in bpf_timer_init.") is the first one that fails with
"BPF program too large", it's ancestor loads OK. commit 354e8f1970f8
("bpf: Support <8-byte scalar spill and refill") makes verification
fail earlier with "corrupted spill memory". The following solves both
issues:

    git checkout 354e8f1970f8 # "bpf: Support <8-byte scalar spill and refill"
    git cherry-pick f30d4968e9ae # "bpf: Do not reject when the stack
read size is different from the tracked scalar size"

I think you're on the money wrt scalar spill tracking. Maybe I
misattributed the problem to the wrong bit of code, instead of having
found the wrong commit?

Details:

bpf-next: commit be2f2d1680df ("libbpf: Deprecate bpf_program__load() API"):

    ; v = *pos++;
    1099: (79) r1 = *(u64 *)(r10 -72)
    corrupted spill memory
    processed 48649 insns (limit 1000000) max_states_per_insn 4
total_states 1305 peak_states 290 mark_read 53

bpf-next with f30d4968e9ae on top:

    works!

bpf-next with commit 354e8f1970f8 ("bpf: Support <8-byte scalar spill
and refill") reverted:

    2225: (05) goto pc+13
    BPF program is too large. Processed 1000001 insn
    processed 1000001 insns (limit 1000000) max_states_per_insn 28
total_states 40641 peak_states 1104 mark_read 53

commit 3e8ce29850f1 ("bpf: Prevent pointer mismatch in
bpf_timer_init.") (found via bisection):

    BPF program is too large. Processed 1000001 insn

commit 3e8ce29850f1^ ("bpf: Add map side support for bpf timers."):

   works!

commit 3e8ce29850f1 with commit 354e8f1970f8 ("bpf: Support <8-byte
scalar spill and refill") reverted:

   doesn't revert cleanly

commit 354e8f1970f8 ("bpf: Support <8-byte scalar spill and refill"):

    corrupted spill memory

commit 354e8f1970f8^ ("bpf: Check the other end of slot_type for STACK_SPILL"):

    2225: (05) goto pc+13
    BPF program is too large. Processed 1000001 insn
    processed 1000001 insns (limit 1000000) max_states_per_insn 28
total_states 40641 peak_states 1104 mark_read 53

commit 354e8f1970f8~2 ("selftests/bpf: Fix btf_dump __int128 test
failure with clang build kernel"):

    same as above

-- 
Lorenz Bauer  |  Systems Engineer
6th Floor, County Hall/The Riverside Building, SE1 7PB, UK

www.cloudflare.com
