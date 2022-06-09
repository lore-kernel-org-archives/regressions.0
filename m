Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4073A33EF
	for <regressions@lists.linux.dev>; Thu,  9 Jun 2022 19:12:25 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-313aa142909so11888287b3.5
        for <regressions@lists.linux.dev>; Thu, 09 Jun 2022 12:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=FSSm+9bvhgEmW3qoBTTPNjVhREVEJPEtoEmaPEajWR0=;
        b=rheQX3q5gm+JqSEPnyXRm/4V7W847eNbvPvWjho1z5A7iYu9qZG/QjrtIcm4n1niXG
         rJROrAAjr6HekwElPZeErWzAOok/nOt063R5M8MoppcY4F4jY+4KzKSc6gk2rAS4IuQ6
         b0l47RWbk1Z/tTPflBmxlJKWLgVes51IP+opL/9jJT5IyyreMc+B5NLAjeh1RnODi91E
         0xZdl4+3VAXQH7OmL+yCPxVxcx6yJ2kEGSaqY8kSJWQ7YY2h1RdKTHdEXHPeBPXQxhE9
         sDpJ3yJwReNTK8lhgDhf7cTLR/6tuDelqot4KYeJjucgP8LFzBg0+UgnNy2626a5sz+U
         /Qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=FSSm+9bvhgEmW3qoBTTPNjVhREVEJPEtoEmaPEajWR0=;
        b=nDHv+MeLs8muldfwZt4jglotvnjRidCsAREYnOizbCI65XoPmNSAztLFFFPmogXwcR
         D4CFdi+pWPU8U3Rd/aTs/4nJnjhdP4SY1XgdAp7Q/vx/4BCy0LwYeFzg2n3TsNW6ff4i
         9VyKlkr0Lx9+WnxYQ9rLRfFe/DcwOlvza+rS+uEGPSgV/QVXLxWcQGRDwRssa/+wBBKN
         feCfEt5yWl8tra8cKXlnpjo16n+p8tI9Le5SJPrM6+Q6F1wdJQKq1VlhkwOZhB/Ah7kp
         Qsh4AF1hC3Hlj5Kpw85PCe6QflAgBu1IVGlVPi9OQ7/YJQ33EUbsYqZ6SL9a//+cfozR
         LBNw==
X-Gm-Message-State: AOAM531TiIGAi6mWo37PrY9lYcypgfLOiAQ4ORpYx9m5FRojdJ1dKU9Z
	Vffdvs/K+FQyKne7MN/jjgblyaeQO+hMxA==
X-Google-Smtp-Source: ABdhPJw9v05gr7h/UJrl5rkXxevCDgUr4Asf4N2CtmyR5iQlnR4H5kPQPxLJNhwA7fsw2jUyVZVcUJ8whLMNQA==
X-Received: from shakeelb.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:28b])
 (user=shakeelb job=sendgmr) by 2002:a25:d803:0:b0:663:3da5:9813 with SMTP id
 p3-20020a25d803000000b006633da59813mr29071178ybg.530.1654801944110; Thu, 09
 Jun 2022 12:12:24 -0700 (PDT)
Date: Thu, 9 Jun 2022 19:12:21 +0000
In-Reply-To: <YqI0OYwNzxGo4XRo@carbon>
Message-Id: <20220609191221.rv3lqbhipnvvzt67@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CA+G9fYv7fESqpGoeKmHoJsst6wfRNMi2wQLGm+PsjbLDuDjdMQ@mail.gmail.com>
 <CA+G9fYsJThWFAxXTbAcJmjshx+oYxVVd+gMM680hS0X1z37+FQ@mail.gmail.com>
 <YqItYKEIvsw4Yzjx@carbon> <CALvZod6ojDd8Bc0VcyFEk-ZrdkFezvQPUvbGg3wyzae+NOp_4A@mail.gmail.com>
 <YqI0OYwNzxGo4XRo@carbon>
Subject: Re: [next] arm64: boot failed - next-20220606
From: Shakeel Butt <shakeelb@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mm <linux-mm@kvack.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Raghuram Thammiraju <raghuram.thammiraju@arm.com>, 
	Mark Brown <broonie@kernel.org>, Will Deacon <will@kernel.org>, Vasily Averin <vvs@openvz.org>, 
	Qian Cai <quic_qiancai@quicinc.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 09, 2022 at 10:56:09AM -0700, Roman Gushchin wrote:
> On Thu, Jun 09, 2022 at 10:47:35AM -0700, Shakeel Butt wrote:
> > On Thu, Jun 9, 2022 at 10:27 AM Roman Gushchin <roman.gushchin@linux.dev> wrote:
> > >
> > [...]
> > > +struct mem_cgroup *mem_cgroup_from_obj(void *p)
> > > +{
> > > +       struct folio *folio;
> > > +
> > > +       if (mem_cgroup_disabled())
> > > +               return NULL;
> > > +
> > > +       if (unlikely(is_vmalloc_addr(p)))
> > > +               folio = page_folio(vmalloc_to_page(p));
> > 
> > Do we need to check for NULL from vmalloc_to_page(p)?
> 
> Idk, can it realistically return NULL after is_vmalloc_addr() returned true?
> I would be surprised, but maybe I'm missing something.

is_vmalloc_addr() is simply checking the range and some buggy caller can
provide an unmapped address within the range. Maybe VM_BUG_ON() should
be good enough (though no strong opinion either way).
