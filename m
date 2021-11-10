Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7612C82
	for <regressions@lists.linux.dev>; Wed, 10 Nov 2021 16:50:46 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id m14so3155328pfc.9
        for <regressions@lists.linux.dev>; Wed, 10 Nov 2021 08:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MTkkm4STzfLeQGO2eYxN4eBscqcirw4na3sDo/Nz/4o=;
        b=MsQzJCvkG2lhp0Qh/udsBcJtbKwldUtePjuLe6KVfPtOgVtyLuBWjy7j+tgB4dI2vJ
         i1AGVQjDdtKfdDMs2W4zPCz+5BLKraWRmEN4jdB2CFqmT+5bszsq94YduNlcLOaCINYz
         DabhRkXoRyK5iB7gFa/u7nghKsG0RwJR4pJDaVInBwm9Hr8rvW+iwcvChagbDCw3swOP
         C4hJWrXoo648ZCvbcVdMkjoittCLM6Q893SP+wFezJA8dEoNKyLcTyvENIpiXBm7hvrQ
         87/KoN589FC8E42+rhMyir0ecQxD3zfMjnS6XTGZZr/ggu9R2XHV1UNUI+oesGBJz0g4
         0Vlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MTkkm4STzfLeQGO2eYxN4eBscqcirw4na3sDo/Nz/4o=;
        b=5G7+ZFSyGj1T2UL5KgLYGoDGPqMRYNuRS+fkDuFitYZJlvb8BePzlbPTwRs8o8OWw8
         zyYaqIhRmh38cTfpHeNe3PqNszghzXcmKbo2LXDZWALYBo4hKgZkjHOy2KP0BwzAyb8w
         mv9gErUc/9cI/hwwO9rmulb5JInNHdtLGqHNRoi8Q0WrqO0RuOwYT1D+9YBKGdU2hzuQ
         ly0Fqkwj57QmGj5sG02ur54BR6BAS35lrphQvujavTWRBdquvC3LqxjLrahZRLfcwB3a
         va/Ijrye2QBY5aqczH2nQMYrW4e8pr5mMmJhTjdP6rtF6c3/a9oLHK+LNLIpnO4938+U
         SK1g==
X-Gm-Message-State: AOAM530Aa7y72dlfzcygzIUXlfH5n49Y2WIMB3gVs6Aix5m9f+aGBOEk
	zkFNuvBZGYuRuzOkvEwM0nA=
X-Google-Smtp-Source: ABdhPJx5PH0LoEUnKqC2tRzlJeD+dOcIbI2nqtILIl3kAh4hQ+1vaIG/duODu2h7ygsp7/gjjrUW7A==
X-Received: by 2002:aa7:88cb:0:b0:49f:ad17:c08 with SMTP id k11-20020aa788cb000000b0049fad170c08mr453109pff.19.1636563046530;
        Wed, 10 Nov 2021 08:50:46 -0800 (PST)
Received: from ast-mbp.dhcp.thefacebook.com ([2620:10d:c090:400::5:7abd])
        by smtp.gmail.com with ESMTPSA id k1sm244282pfu.31.2021.11.10.08.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 08:50:46 -0800 (PST)
Date: Wed, 10 Nov 2021 08:50:44 -0800
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: Lorenz Bauer <lmb@cloudflare.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	kernel-team <kernel-team@cloudflare.com>, bpf <bpf@vger.kernel.org>,
	regressions@lists.linux.dev, Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: Verifier rejects previously accepted program
Message-ID: <20211110165044.kkjqrjpmnz7hkmq3@ast-mbp.dhcp.thefacebook.com>
References: <CACAyw99hVEJFoiBH_ZGyy=+oO-jyydoz6v1DeKPKs2HVsUH28w@mail.gmail.com>
 <CAADnVQKsK_2HHfOLs4XK7h_LC4+b7tfFw9261Psy5St8P+GWFA@mail.gmail.com>
 <CACAyw9_GmNotSyG0g1OOt648y9kx5Bd72f58TtS-QQD9FaV06w@mail.gmail.com>
 <20211105194952.xve6u6lgh2oy46dy@ast-mbp.dhcp.thefacebook.com>
 <CACAyw99KGdTAz+G3aU8G3eqC926YYpgD57q-A+NFNVqqiJPY3g@mail.gmail.com>
 <20211110042530.6ye65mpspre7au5f@ast-mbp.dhcp.thefacebook.com>
 <CACAyw9-s0ahY8m7WtMd1OK=ZF9w5gS9gktQ6S8Kak2pznXgw0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACAyw9-s0ahY8m7WtMd1OK=ZF9w5gS9gktQ6S8Kak2pznXgw0w@mail.gmail.com>

On Wed, Nov 10, 2021 at 11:41:09AM +0000, Lorenz Bauer wrote:
> 
> uid changes on every invocation, and therefore regsafe() returns false?

That's correct.
Could you please try the following fix.
I think it's less risky and more accurate than what I've tried before.

From be7736582945b56e88d385ddd4a05e13e4bc6784 Mon Sep 17 00:00:00 2001
From: Alexei Starovoitov <ast@kernel.org>
Date: Wed, 10 Nov 2021 08:47:52 -0800
Subject: [PATCH] bpf: Fix inner map state pruning regression.

Fixes: 3e8ce29850f1 ("bpf: Prevent pointer mismatch in bpf_timer_init.")
Signed-off-by: Alexei Starovoitov <ast@kernel.org>
---
 kernel/bpf/verifier.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 1aafb43f61d1..3eddcd8ebae2 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -1157,7 +1157,8 @@ static void mark_ptr_not_null_reg(struct bpf_reg_state *reg)
                        /* transfer reg's id which is unique for every map_lookup_elem
                         * as UID of the inner map.
                         */
-                       reg->map_uid = reg->id;
+                       if (map_value_has_timer(map->inner_map_meta))
+                               reg->map_uid = reg->id;
                } else if (map->map_type == BPF_MAP_TYPE_XSKMAP) {
                        reg->type = PTR_TO_XDP_SOCK;
                } else if (map->map_type == BPF_MAP_TYPE_SOCKMAP ||
--
2.30.2

