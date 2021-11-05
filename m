Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99972C9D
	for <regressions@lists.linux.dev>; Fri,  5 Nov 2021 19:49:55 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id t21so11714945plr.6
        for <regressions@lists.linux.dev>; Fri, 05 Nov 2021 12:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gXlN5FZf8wjatJCZa1cF2r5Z+UdMJg7+lQZ4SVQt93Q=;
        b=oTbQ0d/+lTXVt3GBVKXQT/pp6n7r3RqdQEjEw2JoDqFrPTYGX2FQVokdLUtDEsVZ40
         6qSS0kGc4WYQcSBq0r0SJN7kgc3ePYAI4H2FCJ6mEeZ6CJ6BML/ra3wBXUXWjqrMLQ9k
         VLvyOOj3KNOvrQ/noz1Am8T6a8+1qu6bzRfZKIjWh8Xp3tKbcTQXWcJgAwEBj2tRRhZI
         nQK9qzH+Qp66ipCPBTCaK4ED0BqcuN+4BkY25VPS1E63k8n1TeGknM5WN28vRFtu2Ms/
         BsyaU2DVJz6BjvhEw7etyuFA7Oizm4jALNXV5VS1vAonicz/NXulFY8b5noLBIVxtoZA
         Hl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gXlN5FZf8wjatJCZa1cF2r5Z+UdMJg7+lQZ4SVQt93Q=;
        b=Z01KW1eyPz5HN+sL5k8It1clYerkk5IvYhejUEuUtaPdF2Lp0S46Wc/rbRXzDAaHsz
         17pijXBq3b/wc0gCcjvQAfyG8A7uZvAK9v01NKKsnONk8Ct+UzowoKfeltsbaSk8L2Zx
         E9vOprAKVrxF2a3RMO8xDiwv5EdsVXc4JoyRmMRssz4JeC3Y7eybv0gQKwByypBxVrSX
         IahXtFB4VW+2sF5MXU8ZHl21CV5DXTiBgGS6MbBnAA60dHC4wkPSMO75dUO+Pko++2eG
         TiQVNVmfGl1QaEkR2oQi3iI/NFYhAT4RNcaiNAvDyzc4XOAxFjYaFHciWYZdUw08Qb4+
         BhNQ==
X-Gm-Message-State: AOAM531GqIESePwM17ZnFRucJJaJY2pw/Kgiab0ISD+Qi0nkm11EVrfq
	yqJ0jDPTy72BbN4za8OFILI=
X-Google-Smtp-Source: ABdhPJy1Jei+Ck+ketcco+bQgcpLPAwEzazIAeUVp/5E9QSv4AGBr/NiprU6POJCCiUC+Nuv4ORNvQ==
X-Received: by 2002:a17:90a:f182:: with SMTP id bv2mr32222695pjb.139.1636141795300;
        Fri, 05 Nov 2021 12:49:55 -0700 (PDT)
Received: from ast-mbp.dhcp.thefacebook.com ([2620:10d:c090:400::5:808])
        by smtp.gmail.com with ESMTPSA id mg12sm9813843pjb.10.2021.11.05.12.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 12:49:55 -0700 (PDT)
Date: Fri, 5 Nov 2021 12:49:52 -0700
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: Lorenz Bauer <lmb@cloudflare.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	kernel-team <kernel-team@cloudflare.com>, bpf <bpf@vger.kernel.org>,
	regressions@lists.linux.dev, Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: Verifier rejects previously accepted program
Message-ID: <20211105194952.xve6u6lgh2oy46dy@ast-mbp.dhcp.thefacebook.com>
References: <CACAyw99hVEJFoiBH_ZGyy=+oO-jyydoz6v1DeKPKs2HVsUH28w@mail.gmail.com>
 <CAADnVQKsK_2HHfOLs4XK7h_LC4+b7tfFw9261Psy5St8P+GWFA@mail.gmail.com>
 <CACAyw9_GmNotSyG0g1OOt648y9kx5Bd72f58TtS-QQD9FaV06w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACAyw9_GmNotSyG0g1OOt648y9kx5Bd72f58TtS-QQD9FaV06w@mail.gmail.com>

On Fri, Nov 05, 2021 at 10:41:40AM +0000, Lorenz Bauer wrote:
> 
> bpf-next with f30d4968e9ae on top:
> 
>     works!

Awesome.

> commit 3e8ce29850f1 ("bpf: Prevent pointer mismatch in
> bpf_timer_init.") (found via bisection):
> 
>     BPF program is too large. Processed 1000001 insn
> 
> commit 3e8ce29850f1^ ("bpf: Add map side support for bpf timers."):
> 
>    works!

So with just 3e8ce29850f1 it's "too large" and with parent commit it works ?
I've analyzed offending commit again and don't see how it can be causing
state pruning to be more conservative for your asm.
reg->map_uid should only be non-zero for lookups from inner maps,
but your asm doesn't have lookups at all in that loop.
Maybe in some case map_uid doesn't get cleared, but I couldn't find
such code path with manual code analysis.
I think it's worth investigating further.
Please craft a reproducer.
