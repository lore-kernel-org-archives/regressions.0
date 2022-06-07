Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37A87C
	for <regressions@lists.linux.dev>; Tue,  7 Jun 2022 06:37:02 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id f9so3564351plg.0
        for <regressions@lists.linux.dev>; Mon, 06 Jun 2022 23:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RPy1vRYX875/GqkTt8ngXPSVHhf5IBO6TQDfdYyr/ik=;
        b=qTTWQagnTxOownb+q9+ji78HVjHIiaZkav+VM4+0IUqgsdOPKCDsDMNxMqH4/uCLJT
         6ebXsJWPDEA9TfeatTvk6PYLnnhIAaqeKppqhggZeOoTnzNLYakX8+Une88JzLh5k388
         OOPyZUTN7K7cedesqAD1o1Q5EANs13I+dlITktlzgJqWbm3pb+CyDD35fn8F57k0OMsX
         OhLx6ajixuaEhk6aiCtAvDrMihX2z0BhOFYfYta4dfeOh+TA/9Hi0SXU24eSoklpIXbN
         Npu+hkh5um+gu4ELjdsR/qkOcHJW1AS+qYrY9snf3qh9bQL3djh2W3e7EjWwPwSPNzpc
         DbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RPy1vRYX875/GqkTt8ngXPSVHhf5IBO6TQDfdYyr/ik=;
        b=OqcqOMrqLYd5O50g7WbIgwDl+xegIWtkGZpDD3Bz38AHnEtZKE25zjzEILepN6ze2G
         9hIT9eHr+kTZWFAHwJb3CfwMVrJjYIoyMKbBiyM/80uJIL3MMhIPDOEuNaywP+oY2Pzz
         RzXoMKhaYb0tb0X4oPGFxiX0S26o9fSlgmXytc0ylU6ebYNi7aPcMtdWKsP9rUNwyXOV
         k1cDrMjS/4nFUnNCH8q6mre92zDbU0gzUGkYlM1su1+d1OV5iQ/khJ3lyes/k03MOQzt
         li8oyoZC8Skq5T4HjniNtNodNsUbu1DOlOpE5IGibOXaG/QQZ1RTSaYoxDek3heMxX//
         rs6A==
X-Gm-Message-State: AOAM532KyK2DxkGg+5ZpY2ZU/IttsCQuinGbvhohfDzaB8YSeBEnnlco
	GkVw2gR7KqEAxUAX4JSv02kgCKITaBVvRWDIFYHw0g==
X-Google-Smtp-Source: ABdhPJxVvgt2hIXvmLPGVFVhfbxEgZL0vuvlRmPPHO4jvH8UPfAtY7DZVGdOhaRYFs3imdKenmDuePTQJQSVLGnznSs=
X-Received: by 2002:a17:903:2cb:b0:14f:4fb6:2fb0 with SMTP id
 s11-20020a17090302cb00b0014f4fb62fb0mr27311276plk.172.1654583821901; Mon, 06
 Jun 2022 23:37:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv7fESqpGoeKmHoJsst6wfRNMi2wQLGm+PsjbLDuDjdMQ@mail.gmail.com>
 <CA+G9fYsJThWFAxXTbAcJmjshx+oYxVVd+gMM680hS0X1z37+FQ@mail.gmail.com> <20220607162504.7fd5a92a@canb.auug.org.au>
In-Reply-To: <20220607162504.7fd5a92a@canb.auug.org.au>
From: Shakeel Butt <shakeelb@google.com>
Date: Mon, 6 Jun 2022 23:36:50 -0700
Message-ID: <CALvZod5XBjw7MZfYSNv-UnE7pHMKTquUNomqyC5T05Qu_ef6Zw@mail.gmail.com>
Subject: Re: [next] arm64: boot failed - next-20220606
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mm <linux-mm@kvack.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Raghuram Thammiraju <raghuram.thammiraju@arm.com>, Mark Brown <broonie@kernel.org>, 
	Will Deacon <will@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Vasily Averin <vvs@openvz.org>, Qian Cai <quic_qiancai@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 6, 2022 at 11:25 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Naresh,
>
> On Tue, 7 Jun 2022 11:00:39 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > On Mon, 6 Jun 2022 at 17:16, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > > Linux next-20220606 arm64 boot failed. The kernel boot log is empty.
> > > I am bisecting this problem.
> > >
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > >
> > > The initial investigation show that,
> > >
> > > GOOD: next-20220603
> > > BAD:  next-20220606
> > >
> > > Boot log:
> > > Starting kernel ...
> >
> > Linux next-20220606 and next-20220607 arm64 boot failed.
> > The kernel panic log showing after earlycon.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Can you test v5.19-rc1, please?  If that does not fail, then you could
> bisect between that and next-20220606 ...
>

This is already reported at
https://lore.kernel.org/all/Yp4F6n2Ie32re7Ed@qian/ and I think we know
the underlying issue (which is calling virt_to_page() on a vmalloc
address).
