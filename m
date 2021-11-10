Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9BF2C80
	for <regressions@lists.linux.dev>; Wed, 10 Nov 2021 04:25:33 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id n15-20020a17090a160f00b001a75089daa3so739421pja.1
        for <regressions@lists.linux.dev>; Tue, 09 Nov 2021 20:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/7g9dxEw/DHYc528KeoSbI28xVSmQac5QGJUNydBMQE=;
        b=A/vkU0lhW7nZueduIWWRtJgqQS7hWjVJcsWmwQ6E21n/Dzk2nlJySrVlrNpmKEe/Wb
         APb++SQU58zxBZE4EMPUFDLa027VQiqjzAabMpIUiM2P7LgnXz9ln+uf+c5XaWBtNuQ1
         qDJpAXx7JiTNl/gsTea/ypW+Tf5KSruqzywsJh0vhpJoqUf+UdCmW6c2tp3cQzXH10Vb
         r3485GGs5Leh21wvR2kASNAJ36722ZZtMyZ9ICWC0DepJeSUQdE1jqG/qV7kKv1hOaCk
         HZZUJUeBQXwZj0NMGTsm5S4sDGzgwWyZLjfXVPIBqcl1EnGAx9trithEsNMoTYThjwMz
         5omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/7g9dxEw/DHYc528KeoSbI28xVSmQac5QGJUNydBMQE=;
        b=X1sWaHLEFMD/tL9oRlHL1uhUPOYgHOzNiO0IRkDRtkebpENDGWcfD0o/UGZainPspc
         eSC9WH2Maed/OLCnmqRRMOPBDboTxChTrFLICcLjcmkKY8mxQPimWrLP6/GTMTMX0lnr
         IjIN00IYqCZ6pFQ31mDmqYj/Ctgm4BEtihOFcyP+ZYxuCnI0ethzm/3CV316ajJv26by
         /5KUH8bjp9UOniogX99fXq0HPMZ2C4d9yqYU89XGgiuaFv07wx1lhkhLM2yCFp5rVOHx
         Pggpwq39EP/Fa1udJneIr4wLmI9+qxfNGYCb/yuAotI/T+zyI4J3s81IVBv+h2HODnXm
         e3hA==
X-Gm-Message-State: AOAM5334PVAfcxuqvlgFuiEsx2IZaywsz7UqaKdPAA09rs0zt/x6SLoM
	XHSK4lErX+NrMwrVKKFPJYzVkO26SGQ=
X-Google-Smtp-Source: ABdhPJxpUQYPkskilBTvPZdInItTvDQq3bccNp6BVpoVenXIfZnawTKPthzP24TRFfSoz5HSB1yqOg==
X-Received: by 2002:a17:90b:3b45:: with SMTP id ot5mr13238459pjb.235.1636518332989;
        Tue, 09 Nov 2021 20:25:32 -0800 (PST)
Received: from ast-mbp.dhcp.thefacebook.com ([2620:10d:c090:400::5:8f53])
        by smtp.gmail.com with ESMTPSA id w20sm329149pga.52.2021.11.09.20.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 20:25:32 -0800 (PST)
Date: Tue, 9 Nov 2021 20:25:30 -0800
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: Lorenz Bauer <lmb@cloudflare.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	kernel-team <kernel-team@cloudflare.com>, bpf <bpf@vger.kernel.org>,
	regressions@lists.linux.dev, Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: Verifier rejects previously accepted program
Message-ID: <20211110042530.6ye65mpspre7au5f@ast-mbp.dhcp.thefacebook.com>
References: <CACAyw99hVEJFoiBH_ZGyy=+oO-jyydoz6v1DeKPKs2HVsUH28w@mail.gmail.com>
 <CAADnVQKsK_2HHfOLs4XK7h_LC4+b7tfFw9261Psy5St8P+GWFA@mail.gmail.com>
 <CACAyw9_GmNotSyG0g1OOt648y9kx5Bd72f58TtS-QQD9FaV06w@mail.gmail.com>
 <20211105194952.xve6u6lgh2oy46dy@ast-mbp.dhcp.thefacebook.com>
 <CACAyw99KGdTAz+G3aU8G3eqC926YYpgD57q-A+NFNVqqiJPY3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACAyw99KGdTAz+G3aU8G3eqC926YYpgD57q-A+NFNVqqiJPY3g@mail.gmail.com>

On Mon, Nov 08, 2021 at 01:21:12PM +0000, Lorenz Bauer wrote:
> On Fri, 5 Nov 2021 at 19:49, Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Fri, Nov 05, 2021 at 10:41:40AM +0000, Lorenz Bauer wrote:
> > >
> > > bpf-next with f30d4968e9ae on top:
> > >
> > >     works!
> >
> > Awesome.
> >
> > > commit 3e8ce29850f1 ("bpf: Prevent pointer mismatch in
> > > bpf_timer_init.") (found via bisection):
> > >
> > >     BPF program is too large. Processed 1000001 insn
> > >
> > > commit 3e8ce29850f1^ ("bpf: Add map side support for bpf timers."):
> > >
> > >    works!
> >
> > So with just 3e8ce29850f1 it's "too large" and with parent commit it works ?
> > I've analyzed offending commit again and don't see how it can be causing
> > state pruning to be more conservative for your asm.
> > reg->map_uid should only be non-zero for lookups from inner maps,
> > but your asm doesn't have lookups at all in that loop.
> 
> I misattributed the problem to the loop, since it was really prominent
> in the verifier output. We use nested maps extensively, most likely
> those are what's causing the problem.
> 
> > Maybe in some case map_uid doesn't get cleared, but I couldn't find
> > such code path with manual code analysis.
> > I think it's worth investigating further.
> > Please craft a reproducer.
> 
> I've started with some verifier log analysis to narrow the problem down.
> 
> * Same test case as before
> * Dump verifier output with log_level=2 for both 3e8ce29850f1 and 3e8ce29850f1^
> * Use diff to find the first non-matching line
> 
> 3e8ce29850f1 makes the verifier do a lot more work on our code. Some
> later commit then drops the complexity below what the verifier will
> accept, probably the more precise scalar spill tracking.
> 
> 3e8ce29850f1^:                  295498 insns
> 3e8ce29850f1:                > 1000000 insns
> be2f2d1680df + bd479d103883:    450161 insns
> 
> Trace from 3e8ce29850f1^ (working):
> 
> 1033: R0=map_value(id=0,off=0,ks=4,vs=36,imm=0) R1_w=invP0
> R3_w=map_value(id=0,off=0,ks=4,vs=36,imm=0) R6=ctx(id=0,off=0,imm=0)
> R7=inv(id=0) R8=pkt(id=0,off=18,r=38,imm=0) R9=inv0 R10=fp0
> fp-24=mmmmmmmm fp-32=mmmmmmmm fp-40=mmmm00m0 fp-48=mmmm0000
> fp-56=00000000 fp-64=00000000 fp-72=0000mmmm fp-80=mmmmmmmm
> fp-88=map_value fp-96=pkt_end fp-104=map_value fp-112=pkt fp-120=fp
> fp-128=map_value
> 1033: (16) if w1 == 0x0 goto pc+43
> 1077: safe
> 1178: R0=inv0 R1=map_ptr(id=0,off=0,ks=4,vs=4,imm=0) R2_w=inv0
> R3=inv2388976653695081527 R4=inv-8645972361240307355 R5=inv(id=6898)
> R6=ctx(id=0,off=0,imm=0) R7=inv(id=0) R8=pkt(id=0,off=18,r=38,imm=0)
> R9=inv0 R10=fp0 fp-24=mmmmmmmm fp-32=mmmmmmmm fp-40=mmmm00m0
> fp-48=mmmm0000 fp-56=00000000 fp-64=00000000 fp-72=0000mmmm
> fp-80=mmmmmmmm fp-88=map_value fp-96=pkt_end fp-104=map_value
> fp-112=pkt fp-120=fp fp-128=map_value
> 1178: (63) *(u32 *)(r10 -32) = r7
> <...>
> processed 295498 insns (limit 1000000) max_states_per_insn 29
> total_states 14527 peak_states 1322 mark_read 53
> 
> Trace from 3e8ce29850f1 (broken):
> 
> 1033: R0=map_value(id=0,off=0,ks=4,vs=36,imm=0) R1_w=invP0
> R3_w=map_value(id=0,off=0,ks=4,vs=36,imm=0) R6=ctx(id=0,off=0,imm=0)
> R7=inv(id=0) R8=pkt(id=0,off=18,r=38,imm=0) R9=inv0 R10=fp0
> fp-24=mmmmmmmm fp-32=mmmmmmmm fp-40=mmmm00m0 fp-48=mmmm0000
> fp-56=00000000 fp-64=00000000 fp-72=0000mmmm fp-80=mmmmmmmm
> fp-88=map_value fp-96=pkt_end fp-104=map_value fp-112=pkt fp-120=fp
> fp-128=map_value
> 1033: (16) if w1 == 0x0 goto pc+43
> 1077: R0=map_value(id=0,off=0,ks=4,vs=36,imm=0) R1_w=invP0
> R3_w=map_value(id=0,off=0,ks=4,vs=36,imm=0) R6=ctx(id=0,off=0,imm=0)
> R7=inv(id=0) R8=pkt(id=0,off=18,r=38,imm=0) R9=inv0 R10=fp0
> fp-24=mmmmmmmm fp-32=mmmmmmmm fp-40=mmmm00m0 fp-48=mmmm0000
> fp-56=00000000 fp-64=00000000 fp-72=0000mmmm fp-80=mmmmmmmm
> fp-88=map_value fp-96=pkt_end fp-104=map_value fp-112=pkt fp-120=fp
> fp-128=map_value
> 1077: (79) r2 = *(u64 *)(r10 -128)

R2 loads a spilled map_value.

> 1078: R0=map_value(id=0,off=0,ks=4,vs=36,imm=0) R1_w=invP0
> R2_w=map_value(id=0,off=0,ks=4,vs=32,imm=0)
> R3_w=map_value(id=0,off=0,ks=4,vs=36,imm=0) R6=ctx(id=0,off=0,imm=0)
> R7=inv(id=0) R8=pkt(id=0,off=18,r=38,imm=0) R9=inv0 R10=fp0
> fp-24=mmmmmmmm fp-32=mmmmmmmm fp-40=mmmm00m0 fp-48=mmmm0000
> fp-56=00000000 fp-64=00000000 fp-72=0000mmmm fp-80=mmmmmmmm
> fp-88=map_value fp-96=pkt_end fp-104=map_value fp-112=pkt fp-120=fp
> fp-128=map_value
> 1078: (79) r1 = *(u64 *)(r2 +0)
> <...>
> (truncated)
> 
> Trace from be2f2d1680df ("libbpf: Deprecate bpf_program__load() API")
> with bd479d103883 ("bpf: Do not reject when the stack read size is
> different from the tracked scalar size") cherry picked:
> 
> processed 450161 insns (limit 1000000) max_states_per_insn 19
> total_states 19452 peak_states 1319 mark_read 53
> 
> r2 is the result of a lookup from a per-CPU array, ts_metrics in the
> snippet below:
> 
> struct bpf_map_def traffic_set_metrics_map __section("maps") = {
>     .type        = BPF_MAP_TYPE_PERCPU_ARRAY,
>     .key_size    = sizeof(traffic_set_id_t),
>     .value_size  = sizeof(traffic_set_metrics_t),
>     .max_entries = SET_BY_USERSPACE,
> };
> 
>     traffic_set_metrics_t *ts_metrics =
> bpf_map_lookup_elem(&traffic_set_metrics_map, &meta->ts_id);
>     if (ts_metrics == NULL) {
>         return XDP_ABORTED;
>     }
> 
>    <...>
> 
>    if (meta->from_plurimog) {
>         ts_metrics->packets_total_plurimog_ingress++;
>     } else {
>         ts_metrics->packets_total_main++; // insn 1078
>     }

but it goes into R2 from non-inner map which ruins all my theories.

I've tried to craft a test case based on a theory and so far couldn't do so.
Could you please try the following hack:
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 1aafb43f61d1..89b8f79b7236 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -665,9 +665,10 @@ static void print_verifier_state(struct bpf_verifier_env *env,
                                 t == PTR_TO_MAP_KEY ||
                                 t == PTR_TO_MAP_VALUE ||
                                 t == PTR_TO_MAP_VALUE_OR_NULL)
-                               verbose(env, ",ks=%d,vs=%d",
+                               verbose(env, ",ks=%d,vs=%d,uid=%d",
                                        reg->map_ptr->key_size,
-                                       reg->map_ptr->value_size);
+                                       reg->map_ptr->value_size,
+                                       reg->map_uid);
                        if (tnum_is_const(reg->var_off)) {
                                /* Typically an immediate SCALAR_VALUE, but
                                 * could be a pointer whose offset is too big
@@ -10509,8 +10510,11 @@ static bool regsafe(struct bpf_verifier_env *env, struct bpf_reg_state *rold,
                 */
                if (rcur->type != PTR_TO_MAP_VALUE_OR_NULL)
                        return false;
-               if (memcmp(rold, rcur, offsetof(struct bpf_reg_state, id)))
+               if (memcmp(rold, rcur, offsetof(struct bpf_reg_state, map_uid)))
                        return false;
+               if (rcur->map_uid)
+                       if (!check_ids(rold->map_uid, rcur->map_uid, idmap))
+                               return false;
                /* Check our ids match any regs they're supposed to */
                return check_ids(rold->id, rcur->id, idmap);
        case PTR_TO_PACKET_META:


The verbose() part will help to confirm that R2 in the above should be uid=0.

After that please try only with:
-               if (memcmp(rold, rcur, offsetof(struct bpf_reg_state, id)))
+               if (memcmp(rold, rcur, offsetof(struct bpf_reg_state, map_uid)))

It should resolve the regression, but will break timer safety check and makes
the map_uid logic not quite right (though no existing test will show it).
Hence the check_ids() part in the hunk above that should make map_uid correct again
and hopefully not repeat the infinite loop you're seeing.

Without a reproducer it's all wild guesses.

If offsetof(map_uid) doesn't help another guess would be:
@@ -10496,7 +10497,7 @@ static bool regsafe(struct bpf_verifier_env *env, struct bpf_reg_state *rold,
                 * it's valid for all map elements regardless of the key
                 * used in bpf_map_lookup()
                 */
-               return memcmp(rold, rcur, offsetof(struct bpf_reg_state, id)) == 0 &&
+               return memcmp(rold, rcur, offsetof(struct bpf_reg_state, map_uid)) == 0 &&
                       range_within(rold, rcur) &&
                       tnum_in(rold->var_off, rcur->var_off);
that's for PTR_TO_MAP_VALUE and that would be a different theory which makes even less sense.

If neither help the reproducer would be must have to make further progress.
