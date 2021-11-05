Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484482C99
	for <regressions@lists.linux.dev>; Fri,  5 Nov 2021 04:14:02 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id b11so6689771qvm.7
        for <regressions@lists.linux.dev>; Thu, 04 Nov 2021 21:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3M3QCeS4mDVaZbFZVmiYltyQSCr5+JmL57wgUpkLXzc=;
        b=md78SNnjftmzk9x0OP18x3OKM1/zcRfllCvoiYkXwVPQxWqsQFGv7KyMKOZltNXt12
         tWST/FUQ4vLhvOxrPNupUTBYEAsg0c1M+pBOHHxlKz1GOU+xdYbak1rt42IAKO2cFnfP
         baVzyFh0U1u9q4GsAWFSjmTmZb7LreqHRN0/UkCXffzm9WleUtgxzBsNnC/zwt0t4iPT
         ngsoZarnsjJEAVEfBlGLhakgO+kQQxOuIyRr4ihD3hh0TXsQLcq6LmxIHHnPUtCYQIjb
         67+fsU0m76xWj4npj66rBAr+3Lb0I1JP2/Gy4/1yyJkn1g8LXyFCQDauC7+EwTTkBnkO
         tsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3M3QCeS4mDVaZbFZVmiYltyQSCr5+JmL57wgUpkLXzc=;
        b=qp77VA7nc5zCObbJMWeIARI1yRouUvWu1Ea4uCh0HFLgbLIBR1fvbweGwolkBHm7Us
         w4RhAYWdiX4qZNE9eVJdZaOkilA9gjPC7gAM8L1v31/d1aK6H9CIGPBpXEgdqqscErth
         TBMGWqmrMSBOGB/8SliPf4rxf0m8lty62nVwlAs5Bu1Gjd6ZcC3p4Vhb2WxFKbCw7e34
         wYvL3BoP98rqBKy5ptQ5gBQ0LJRt4TTtRWeFSutSdo2jLuqZyx8byyHgXbKP5rQdoJU6
         zF8p3oojASvzkwxPbBLtcgfi2eiKIukacokKRjUcdIqzXJKDwPbZ2+C5s0ujA4MvS7pr
         CyLw==
X-Gm-Message-State: AOAM533iUtaWPN+r3KpdwovigA4kiVpByGglaCl1JPRAODHgCaRHTcU6
	NAwkTxfV3zNIArp3+50StROtrWFBd6RbOVg40BkO/w==
X-Google-Smtp-Source: ABdhPJwyGLgLfawjP8mPQhzHhmlLccn9z4+gou+vIr5wopKBjsNtsKAVudRS164QrP3cmG2cs0krmKoq562JK21jfOM=
X-Received: by 2002:ad4:53a1:: with SMTP id j1mr53150339qvv.25.1636085641031;
 Thu, 04 Nov 2021 21:14:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACAyw99hVEJFoiBH_ZGyy=+oO-jyydoz6v1DeKPKs2HVsUH28w@mail.gmail.com>
 <CAADnVQKsK_2HHfOLs4XK7h_LC4+b7tfFw9261Psy5St8P+GWFA@mail.gmail.com>
 <YYRtFp7GOEAi7vQH@google.com> <CAADnVQ+ox52jub6naAoN7dfB4UC+D01r28ubt2Qrf+Q+g26Mmg@mail.gmail.com>
In-Reply-To: <CAADnVQ+ox52jub6naAoN7dfB4UC+D01r28ubt2Qrf+Q+g26Mmg@mail.gmail.com>
From: Stanislav Fomichev <sdf@google.com>
Date: Thu, 4 Nov 2021 21:13:50 -0700
Message-ID: <CAKH8qBskFaK9NE7XBuLLHqhh7RMHgWJL0_C+v+xKV74WCpCXxA@mail.gmail.com>
Subject: Re: Verifier rejects previously accepted program
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Lorenz Bauer <lmb@cloudflare.com>, Alexei Starovoitov <ast@kernel.org>, 
	kernel-team <kernel-team@cloudflare.com>, bpf <bpf@vger.kernel.org>, 
	regressions@lists.linux.dev, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 4, 2021 at 6:20 PM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Thu, Nov 4, 2021 at 4:30 PM <sdf@google.com> wrote:
> >
> > On 11/04, Alexei Starovoitov wrote:
> > > On Wed, Nov 3, 2021 at 4:55 AM Lorenz Bauer <lmb@cloudflare.com> wrote:
> >
> > > > #pragma clang loop unroll(full)
> > > >     for (int b = 1 << 10; b >= 4; b >>= 1) {
> > > >         if (start + b > end) {
> > > >             continue;
> > > >         }
> > > >
> > > >         // If we do 8 byte reads, we have to handle overflows which is
> > > > slower than 4 byte reads.
> > > >         for (int i = 0; i < b; i += 4) {
> > > >             csum += *(uint32_t *)(start + i);
> > > >         }
> > > >
> > > >         start += b;
> > > >     }
> > > >     if (start + 2 <= end) {
> > > >         csum += *(uint16_t *)(start);
> > > >         start += 2;
> > > >     }
> > > >     if (start + 1 <= end) {
> > > >         csum += *(start);
> > > >     }
> >
> > > Thanks for flagging!
> > > Could you craft a test case that we can use a repro and future
> > > test case?
> >
> > > > fp-88=map_value fp-96=mmmmmmmm fp-104=map_value fp-112=inv fp-120=fp
> > > ...
> > > > I've bisected the problem to commit 3e8ce29850f1 ("bpf: Prevent
> > > > pointer mismatch in bpf_timer_init.") The commit seems unrelated to
> > > > loop processing though (it does touch the verifier however). Either I
> > > > got the bisection wrong or there is something subtle going on.
> >
> > > I stared at that commit and the example asm.
> > > I suspect the bisect went wrong.
> >
> > > Could you try reverting a single
> > > commit 354e8f1970f8 ("bpf: Support <8-byte scalar spill and refill")
> > > ?
> > > The above fp-112=inv means that the verifier is tracking scalar spill.
> > > That could be the reason for bounded loop logic seeing different
> > > stack state on every iteration.
> > > But the asm snippet doesn't have the store to stack at [fp-112]
> > > location, so it could be a red herring.
> >
> > > Are you using the same llvm during bisect?
> > > The commit 354e8f1970f8 should be harmless
> > > (when commit f30d4968e9ae ("bpf: Do not reject when the stack read
> > > size is different from the tracked scalar size"))
> > > is also applied. That fix is in bpf tree only, so far.
> > > The tracking of 8-byte spill is the most useful with the latest llvm
> > > that was taught to use 8-byte aligned stack for such spills.
> >
> > > Without being able to repro it's hard to investigate much further.
> >
> > Not to derail the conversation, but we do actually see a problem
> > with commit 354e8f1970f8 ("bpf: Support <8-byte scalar spill and
> > refill"). Program that passed without it now gets:
> >
> >   R0=inv(id=0) R1_w=invP0 R2_w=invP0 R5_w=inv0 R6=ctx(id=0,off=0,imm=0)
> > R7=map_value(id=0,off=0,ks=4,vs=9616,imm=0) R8=inv(id=0)
> > R9_w=map_value(id=0,off=0,ks=4,vs=9616,imm=0) R10=fp0 fp-8=mmmm????
> > fp-16=mmmmmmmm fp-24=00000000 fp-32=inv fp-40=00000000 fp-48=inv
> > fp-56=mmmmmmmm fp-64=mmmmmmmm
> > 479: (79) r1 = *(u64 *)(r10 -32)
> > corrupted spill memory
> > processed 970 insns (limit 1000000) max_states_per_insn 2 total_states 73
> > peak_states 73 mark_read 24
>
> Stan,
> please read the 2nd part of my sentence above and try again with that patch.

Ah, sorry, I've missed that part. It does indeed fix it for me, thank you!
