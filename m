Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E630C72
	for <regressions@lists.linux.dev>; Wed, 10 Nov 2021 19:16:54 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 188so3094215pgb.7
        for <regressions@lists.linux.dev>; Wed, 10 Nov 2021 11:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/RXq1qB/rHnOoJKPinntNIPHQAA7cSWx22w33fl3PNA=;
        b=VZcdqKN2AG/3VK8Sk6NtH17em49FemMxiWyhW6RIznoeZtkAt9MKh7zSbnzTiUM6CX
         gPe+/9mLEIpCv55ACeScybaY12N5i1bVatVYo5cX6JU+UMfIu9mqgmHl5FH0SEL8+64A
         xbASPWx1s4s2TIFJ6f5VMVWoA7r86CTWEJEiENQA2jZkDc9FciMmwKGTav2IcKKxHA8r
         mW65S5d2SdPrPABaFPWYSssllMkC88Y86ND4/H8kwM0jEx3OhxeOIOwQEhFNyIFVcY2n
         pRw0MLEOp0VRWenSo6Z7jp8uDNfvZby8YJLFbwKCnepAAXYODyHmJ1+xlrN1RFBq03N7
         J1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/RXq1qB/rHnOoJKPinntNIPHQAA7cSWx22w33fl3PNA=;
        b=bFGFwqS3gP6VXmsxondel4vnM9BqViW9Qz5VFCtjBE3KLKckSSyYI++ndeAel0u59s
         TJ0XtvTTwBvE7+Wn7UOWZkV2ngpTacgo8lyk08oT8OB1MW00OmmCJrzU//Sb9wYEXz2D
         VjVPcasRfiZkbPEM+fg1ocFxmv6JGt5a+69aUsf5T9BQf6AN5AmLCpw+Sy1Z6j/e5mkG
         iuybQgMfjuNWPCIJO/9Cl+4xX8GLlF3js74JeDPd5DPhoUelKHws06mqmekm+3UTCMlg
         0AG6r+WPm2BiED4/kAkcS20NJQJs7ZmzAdc9iI9lKcuxbn3PNy5lClx6erAm1gntpSRQ
         bNMw==
X-Gm-Message-State: AOAM533hU0sAXgXpKmVq5A2G7rFc1tMci84tXkfUhaQle1YYIyuz4ZkG
	up+rLWQIScQdZoQlbxxyhUNVj0fVRUmtYj4MXLk=
X-Google-Smtp-Source: ABdhPJydQ1SDenCDX0QpQyIqAlW3DNgZBC/keXnmZBefQFfbfIhQcbShcNzmc6DHQMeBFQg55uTgAv2lK9x3l/inDaA=
X-Received: by 2002:a05:6a00:1583:b0:49f:dc1c:a0fe with SMTP id
 u3-20020a056a00158300b0049fdc1ca0femr1481646pfk.46.1636571814372; Wed, 10 Nov
 2021 11:16:54 -0800 (PST)
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
 <CACAyw9-s0ahY8m7WtMd1OK=ZF9w5gS9gktQ6S8Kak2pznXgw0w@mail.gmail.com>
 <20211110165044.kkjqrjpmnz7hkmq3@ast-mbp.dhcp.thefacebook.com> <7e7f180c-6cf6-ba86-e8fd-49b3b291e81e@leemhuis.info>
In-Reply-To: <7e7f180c-6cf6-ba86-e8fd-49b3b291e81e@leemhuis.info>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 10 Nov 2021 11:16:43 -0800
Message-ID: <CAADnVQ+1xY2fGKH2=VxeukSwBUc0D=+6ChqCgwEMPGMPKeKiOA@mail.gmail.com>
Subject: Re: Verifier rejects previously accepted program
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Lorenz Bauer <lmb@cloudflare.com>, Alexei Starovoitov <ast@kernel.org>, 
	kernel-team <kernel-team@cloudflare.com>, bpf <bpf@vger.kernel.org>, 
	regressions@lists.linux.dev, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 10, 2021 at 10:01 AM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
>
>
> On 10.11.21 17:50, Alexei Starovoitov wrote:
> > On Wed, Nov 10, 2021 at 11:41:09AM +0000, Lorenz Bauer wrote:
> >>
> >> uid changes on every invocation, and therefore regsafe() returns false?
> >
> > That's correct.
> > Could you please try the following fix.
> > I think it's less risky and more accurate than what I've tried before.
> >
> >>From be7736582945b56e88d385ddd4a05e13e4bc6784 Mon Sep 17 00:00:00 2001
> > From: Alexei Starovoitov <ast@kernel.org>
> > Date: Wed, 10 Nov 2021 08:47:52 -0800
> > Subject: [PATCH] bpf: Fix inner map state pruning regression.
> >
> > Fixes: 3e8ce29850f1 ("bpf: Prevent pointer mismatch in bpf_timer_init.")
> > Signed-off-by: Alexei Starovoitov <ast@kernel.org>
>
> Thanks for working on a fix for this regression. There is one small
> detail that afaics could be improved (maybe you left that for later, if
> that's the case please simply stop reading and ignore this mail):
>
> The commit message would benefit from a link to the regression report.
> This is explained in Documentation/process/submitting-patches.rst, which
> recently was changed slightly to make this aspect clearer:
> https://git.kernel.org/linus/1f57bd42b77c

I don't think you're familiar with bpf process of applying patches.
Please take a look at bpf tree.
The 'Link:' exists for every commit.
