Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807C968
	for <regressions@lists.linux.dev>; Mon,  8 Nov 2021 13:21:25 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id bu18so36264181lfb.0
        for <regressions@lists.linux.dev>; Mon, 08 Nov 2021 05:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Abd0jR/GPc/ldbm03xGS4P3FzSYysNQiB55mYY9QSlI=;
        b=JG+cUBs7S17n3hphaRbLhvQyaVVV36L9W3d71xuxF6617lSpj5AKftKe9ZL+Zw3jdP
         V96ese14N0oFfYwi4wPuOHDT1kMdfYugvoLeBN4EHL/O7u1zm6Ah0L0gQDOzl1ijwymd
         YSGDY4dCnM/r4hehRC+iNqr4dlzSxGOJSJc5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Abd0jR/GPc/ldbm03xGS4P3FzSYysNQiB55mYY9QSlI=;
        b=vNWduPH1SjgpVNdQ6bfwFAfFHWIeCok5aB8k+ZeP3WR2Yhb2V74r7HYOq9HJbYa48Z
         jvJ34Ls1MR5NWRqOK+EChJNSVQ0Gw1n8IvWcdp3Dng1e0sTASqu8kT6o7dYpjPgkVd80
         MuDrCowZP5/Fwy9XUKNG3CT13SuY26NT7D93qBNUw8R/x7eDrJLP1YQiQ8zc8kjP5LLK
         gCn2kPdoz03KSHAMQdCJhbZagt1JvmZcDijGcJKOZ1993zvQAmoI6KTQ2JT5SYRgRwt8
         GeTy6+KYdq39m/ipqtqGMkMs9RsifGlBk8wIggwR6NwXKxu8EdxjspuOdG8evqN0R7J0
         Npww==
X-Gm-Message-State: AOAM533drTOJShvxtKI81CVbeCrFJobKEXrdUcFwR6dFEIoBPAoSrOja
	maqoOFebOjFNEFV72xailXqCseZdo8CN4t2cPhUtzQ==
X-Google-Smtp-Source: ABdhPJx3CZ1C3FEwWHMZdrX5gLKGvFgimTH/KuyL0Oj9c/IAXYyKqiqpkx/ApsVDqPEI+EScogLC095PkUdJlo3XxB4=
X-Received: by 2002:a19:5e42:: with SMTP id z2mr40235736lfi.102.1636377683518;
 Mon, 08 Nov 2021 05:21:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACAyw99hVEJFoiBH_ZGyy=+oO-jyydoz6v1DeKPKs2HVsUH28w@mail.gmail.com>
 <CAADnVQKsK_2HHfOLs4XK7h_LC4+b7tfFw9261Psy5St8P+GWFA@mail.gmail.com>
 <CACAyw9_GmNotSyG0g1OOt648y9kx5Bd72f58TtS-QQD9FaV06w@mail.gmail.com> <20211105194952.xve6u6lgh2oy46dy@ast-mbp.dhcp.thefacebook.com>
In-Reply-To: <20211105194952.xve6u6lgh2oy46dy@ast-mbp.dhcp.thefacebook.com>
From: Lorenz Bauer <lmb@cloudflare.com>
Date: Mon, 8 Nov 2021 13:21:12 +0000
Message-ID: <CACAyw99KGdTAz+G3aU8G3eqC926YYpgD57q-A+NFNVqqiJPY3g@mail.gmail.com>
Subject: Re: Verifier rejects previously accepted program
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, kernel-team <kernel-team@cloudflare.com>, 
	bpf <bpf@vger.kernel.org>, regressions@lists.linux.dev, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Nov 2021 at 19:49, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Fri, Nov 05, 2021 at 10:41:40AM +0000, Lorenz Bauer wrote:
> >
> > bpf-next with f30d4968e9ae on top:
> >
> >     works!
>
> Awesome.
>
> > commit 3e8ce29850f1 ("bpf: Prevent pointer mismatch in
> > bpf_timer_init.") (found via bisection):
> >
> >     BPF program is too large. Processed 1000001 insn
> >
> > commit 3e8ce29850f1^ ("bpf: Add map side support for bpf timers."):
> >
> >    works!
>
> So with just 3e8ce29850f1 it's "too large" and with parent commit it works ?
> I've analyzed offending commit again and don't see how it can be causing
> state pruning to be more conservative for your asm.
> reg->map_uid should only be non-zero for lookups from inner maps,
> but your asm doesn't have lookups at all in that loop.

I misattributed the problem to the loop, since it was really prominent
in the verifier output. We use nested maps extensively, most likely
those are what's causing the problem.

> Maybe in some case map_uid doesn't get cleared, but I couldn't find
> such code path with manual code analysis.
> I think it's worth investigating further.
> Please craft a reproducer.

I've started with some verifier log analysis to narrow the problem down.

* Same test case as before
* Dump verifier output with log_level=2 for both 3e8ce29850f1 and 3e8ce29850f1^
* Use diff to find the first non-matching line

3e8ce29850f1 makes the verifier do a lot more work on our code. Some
later commit then drops the complexity below what the verifier will
accept, probably the more precise scalar spill tracking.

3e8ce29850f1^:                  295498 insns
3e8ce29850f1:                > 1000000 insns
be2f2d1680df + bd479d103883:    450161 insns

Trace from 3e8ce29850f1^ (working):

1033: R0=map_value(id=0,off=0,ks=4,vs=36,imm=0) R1_w=invP0
R3_w=map_value(id=0,off=0,ks=4,vs=36,imm=0) R6=ctx(id=0,off=0,imm=0)
R7=inv(id=0) R8=pkt(id=0,off=18,r=38,imm=0) R9=inv0 R10=fp0
fp-24=mmmmmmmm fp-32=mmmmmmmm fp-40=mmmm00m0 fp-48=mmmm0000
fp-56=00000000 fp-64=00000000 fp-72=0000mmmm fp-80=mmmmmmmm
fp-88=map_value fp-96=pkt_end fp-104=map_value fp-112=pkt fp-120=fp
fp-128=map_value
1033: (16) if w1 == 0x0 goto pc+43
1077: safe
1178: R0=inv0 R1=map_ptr(id=0,off=0,ks=4,vs=4,imm=0) R2_w=inv0
R3=inv2388976653695081527 R4=inv-8645972361240307355 R5=inv(id=6898)
R6=ctx(id=0,off=0,imm=0) R7=inv(id=0) R8=pkt(id=0,off=18,r=38,imm=0)
R9=inv0 R10=fp0 fp-24=mmmmmmmm fp-32=mmmmmmmm fp-40=mmmm00m0
fp-48=mmmm0000 fp-56=00000000 fp-64=00000000 fp-72=0000mmmm
fp-80=mmmmmmmm fp-88=map_value fp-96=pkt_end fp-104=map_value
fp-112=pkt fp-120=fp fp-128=map_value
1178: (63) *(u32 *)(r10 -32) = r7
<...>
processed 295498 insns (limit 1000000) max_states_per_insn 29
total_states 14527 peak_states 1322 mark_read 53

Trace from 3e8ce29850f1 (broken):

1033: R0=map_value(id=0,off=0,ks=4,vs=36,imm=0) R1_w=invP0
R3_w=map_value(id=0,off=0,ks=4,vs=36,imm=0) R6=ctx(id=0,off=0,imm=0)
R7=inv(id=0) R8=pkt(id=0,off=18,r=38,imm=0) R9=inv0 R10=fp0
fp-24=mmmmmmmm fp-32=mmmmmmmm fp-40=mmmm00m0 fp-48=mmmm0000
fp-56=00000000 fp-64=00000000 fp-72=0000mmmm fp-80=mmmmmmmm
fp-88=map_value fp-96=pkt_end fp-104=map_value fp-112=pkt fp-120=fp
fp-128=map_value
1033: (16) if w1 == 0x0 goto pc+43
1077: R0=map_value(id=0,off=0,ks=4,vs=36,imm=0) R1_w=invP0
R3_w=map_value(id=0,off=0,ks=4,vs=36,imm=0) R6=ctx(id=0,off=0,imm=0)
R7=inv(id=0) R8=pkt(id=0,off=18,r=38,imm=0) R9=inv0 R10=fp0
fp-24=mmmmmmmm fp-32=mmmmmmmm fp-40=mmmm00m0 fp-48=mmmm0000
fp-56=00000000 fp-64=00000000 fp-72=0000mmmm fp-80=mmmmmmmm
fp-88=map_value fp-96=pkt_end fp-104=map_value fp-112=pkt fp-120=fp
fp-128=map_value
1077: (79) r2 = *(u64 *)(r10 -128)
1078: R0=map_value(id=0,off=0,ks=4,vs=36,imm=0) R1_w=invP0
R2_w=map_value(id=0,off=0,ks=4,vs=32,imm=0)
R3_w=map_value(id=0,off=0,ks=4,vs=36,imm=0) R6=ctx(id=0,off=0,imm=0)
R7=inv(id=0) R8=pkt(id=0,off=18,r=38,imm=0) R9=inv0 R10=fp0
fp-24=mmmmmmmm fp-32=mmmmmmmm fp-40=mmmm00m0 fp-48=mmmm0000
fp-56=00000000 fp-64=00000000 fp-72=0000mmmm fp-80=mmmmmmmm
fp-88=map_value fp-96=pkt_end fp-104=map_value fp-112=pkt fp-120=fp
fp-128=map_value
1078: (79) r1 = *(u64 *)(r2 +0)
<...>
(truncated)

Trace from be2f2d1680df ("libbpf: Deprecate bpf_program__load() API")
with bd479d103883 ("bpf: Do not reject when the stack read size is
different from the tracked scalar size") cherry picked:

processed 450161 insns (limit 1000000) max_states_per_insn 19
total_states 19452 peak_states 1319 mark_read 53

r2 is the result of a lookup from a per-CPU array, ts_metrics in the
snippet below:

struct bpf_map_def traffic_set_metrics_map __section("maps") = {
    .type        = BPF_MAP_TYPE_PERCPU_ARRAY,
    .key_size    = sizeof(traffic_set_id_t),
    .value_size  = sizeof(traffic_set_metrics_t),
    .max_entries = SET_BY_USERSPACE,
};

    traffic_set_metrics_t *ts_metrics =
bpf_map_lookup_elem(&traffic_set_metrics_map, &meta->ts_id);
    if (ts_metrics == NULL) {
        return XDP_ABORTED;
    }

   <...>

   if (meta->from_plurimog) {
        ts_metrics->packets_total_plurimog_ingress++;
    } else {
        ts_metrics->packets_total_main++; // insn 1078
    }

Lorenz

-- 
Lorenz Bauer  |  Systems Engineer
6th Floor, County Hall/The Riverside Building, SE1 7PB, UK

www.cloudflare.com
