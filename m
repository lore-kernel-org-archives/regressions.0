Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5292C82
	for <regressions@lists.linux.dev>; Wed, 10 Nov 2021 17:05:39 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id t11so6605358ljh.6
        for <regressions@lists.linux.dev>; Wed, 10 Nov 2021 09:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hqzKE5VrumOYjBZRF/0KDu9fqmayCuHmlrDhbS9LDIA=;
        b=LaD49Db1ONpmpv5DnlCP/A+5MKdYbvbBzS1omUEko1WaTvV0v+284QMnraFzzsegEH
         E73JJYZ7qM/LgrxMAyNQij8Q9PdIfKHFwzEmrTQvuGys9oJh6VH85OkdzQntMpen2q33
         mGCQdw/1YZmDSFx9zTr+ruV0aCHYlhLPDo09U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hqzKE5VrumOYjBZRF/0KDu9fqmayCuHmlrDhbS9LDIA=;
        b=CMpoHg+2tc7q1pI8SwHzoXIQGtVb0SlyB4tkezdePzKn+y8S2Rv/GDAKKaa4V40ffy
         vHuRcKA/BTCJ1pG+YL44q8zZKi+yppE4dH/zPGf+YuyrS7LfpuCAnSg/jHbKWQPX0CB/
         iMxtW7gf046zOUamxNkZRRkTSks9+8UVbqkvP27RxiW//FQdtf9ITunbwv+4KoLVZGOs
         QAb7OPPFoU63M8FjCUbxG1zI/1otN57MIXvkKOiTFIv2FJqIV3cqs7qDlUylyOUVku4n
         o/R5Y8ym5Hskp4+5n57m1NzV0zEafwhL37fvciTN2DTHLxpWMZRSifm8ei/ZpAkKW3XK
         SpOQ==
X-Gm-Message-State: AOAM5332VfQMhjJjG/tdEaKgRbGzoWvIx1ESR7UTkQHy5VhwHr7SKe0I
	rpNwdsyBeEZOXyJ+FpE49S2621tc4J3aUGxnsUgXgQ==
X-Google-Smtp-Source: ABdhPJz9GknRVtWbNK5reBVqYogR6Wg5uk6NF7TiSJJM3ZETzsPZlkbrQrYl4hqfz2VwdWAO7qm1hAeyHQ5PKKOviw4=
X-Received: by 2002:a05:651c:160a:: with SMTP id f10mr513334ljq.212.1636563937663;
 Wed, 10 Nov 2021 09:05:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACAyw99hVEJFoiBH_ZGyy=+oO-jyydoz6v1DeKPKs2HVsUH28w@mail.gmail.com>
 <CAADnVQKsK_2HHfOLs4XK7h_LC4+b7tfFw9261Psy5St8P+GWFA@mail.gmail.com>
 <CACAyw9_GmNotSyG0g1OOt648y9kx5Bd72f58TtS-QQD9FaV06w@mail.gmail.com>
 <20211105194952.xve6u6lgh2oy46dy@ast-mbp.dhcp.thefacebook.com>
 <CACAyw99KGdTAz+G3aU8G3eqC926YYpgD57q-A+NFNVqqiJPY3g@mail.gmail.com>
 <20211110042530.6ye65mpspre7au5f@ast-mbp.dhcp.thefacebook.com>
 <CACAyw9-s0ahY8m7WtMd1OK=ZF9w5gS9gktQ6S8Kak2pznXgw0w@mail.gmail.com> <20211110165044.kkjqrjpmnz7hkmq3@ast-mbp.dhcp.thefacebook.com>
In-Reply-To: <20211110165044.kkjqrjpmnz7hkmq3@ast-mbp.dhcp.thefacebook.com>
From: Lorenz Bauer <lmb@cloudflare.com>
Date: Wed, 10 Nov 2021 17:05:26 +0000
Message-ID: <CACAyw98qviPmc1rWCkm8WXDwFN-JLKzXeUTAz27OVLK_9B7DQA@mail.gmail.com>
Subject: Re: Verifier rejects previously accepted program
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, kernel-team <kernel-team@cloudflare.com>, 
	bpf <bpf@vger.kernel.org>, regressions@lists.linux.dev, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Nov 2021 at 16:50, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Wed, Nov 10, 2021 at 11:41:09AM +0000, Lorenz Bauer wrote:
> >
> > uid changes on every invocation, and therefore regsafe() returns false?
>
> That's correct.
> Could you please try the following fix.
> I think it's less risky and more accurate than what I've tried before.

It works!

processed 295498 insns (limit 1000000) max_states_per_insn 29
total_states 14527 peak_states 1322 mark_read 53

Thanks for looking into this without a reproducer!

Lorenz


-- 
Lorenz Bauer  |  Systems Engineer
6th Floor, County Hall/The Riverside Building, SE1 7PB, UK

www.cloudflare.com
