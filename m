Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAB11841
	for <regressions@lists.linux.dev>; Fri, 27 May 2022 03:43:14 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id n22so990145eda.5
        for <regressions@lists.linux.dev>; Thu, 26 May 2022 20:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SPBb+g0viJg5NqTEyDBHqBkftk1kmk7JjYgXXaPHViY=;
        b=QU3l08rm3NqbUG4rASTLaS9tNuaMKT998BWPJJS6SNMsHt6Nj82cqHJ09FZe56QEYz
         ItovWKnHQvkgOX0S9uKQ5o+SRbcNcwsRrja5IRwjub0+ItN6yzbgpTUB4iWoPPAH/viN
         iWBtDpLr0KpZjXTH6wz7YJOUUEkerlOMA+sxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SPBb+g0viJg5NqTEyDBHqBkftk1kmk7JjYgXXaPHViY=;
        b=Birds4PMSJZAslttYg6wUBl2EjGZpTcjnWKXwfU/Wtp0jGbOVs6DhmjJLXIMuGBuXB
         s8lZspLJhjgZ8nBsvtJH16KNOpxYIuej9OS3ck8e/aHnc3s7E+DWt+vOuCYTm/eSKiHY
         JBrvSi5XimSjZW+fc4bmPIg86QFTjjp/auislwesbzpoTYn9h9SFfM+YaLL0Td8u44Ko
         OeDgWDrHpsbXaehuBeRveuSAfqfc5xK9dft7JstM2QNvJk+NRTiTRfy/+hMrgfumH0tn
         E5rWmJf8xJ7pQQr2hvdvkdPskhvDPMQhkd5oCo7cG8dNCMoD4rIgfGkZ8siFb+ul23r7
         KCBw==
X-Gm-Message-State: AOAM533oscJKIOykN9TL0f14/7fCsmGd+oeZYvx/drb+9eH+yxPyWeql
	Hnu8DbNeSrhfCnM5uHhsE+T4Iqfi/irzqk/nBPo=
X-Google-Smtp-Source: ABdhPJyHpme8gkTpvCQAv3ljkLk6Bouf9t1lAX23PKFj1eDim0TQJuhrAp1VDrMl8t50Ok9obbVT2Q==
X-Received: by 2002:a05:6402:12da:b0:42b:ddcc:6ba9 with SMTP id k26-20020a05640212da00b0042bddcc6ba9mr5518450edx.393.1653622992551;
        Thu, 26 May 2022 20:43:12 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id mf17-20020a170906cb9100b006fecf74395bsm1047042ejb.8.2022.05.26.20.43.11
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 20:43:11 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id e2so4302670wrc.1
        for <regressions@lists.linux.dev>; Thu, 26 May 2022 20:43:11 -0700 (PDT)
X-Received: by 2002:a5d:6152:0:b0:210:1864:2fbc with SMTP id
 y18-20020a5d6152000000b0021018642fbcmr753156wrt.97.1653622990694; Thu, 26 May
 2022 20:43:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtDBZaBGkEp5tRMM5C1xHEKeyyNK1S4WoKvrOoFxGm4KQ@mail.gmail.com>
 <ac245d62-2295-8cf6-6808-4a6eb6bdbd21@linux.alibaba.com>
In-Reply-To: <ac245d62-2295-8cf6-6808-4a6eb6bdbd21@linux.alibaba.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 May 2022 20:42:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjgGW_jsjZxKLcKCf4Di22vzJU6K56j0Oe8Td6RgKrc+A@mail.gmail.com>
Message-ID: <CAHk-=wjgGW_jsjZxKLcKCf4Di22vzJU6K56j0Oe8Td6RgKrc+A@mail.gmail.com>
Subject: Re: mm: change huge_ptep_clear_flush() to return the original pte
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 26, 2022 at 8:36 PM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> That is caused by commit:
>
> 00df1f1a133b ("mm: change huge_ptep_clear_flush() to return the original
> pte")
>
> interacting with commit:
>
> fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from get_clear_flush()")
>
> And Catalin has fixed the conflict with below changes [1], not sure why
> it is not merged.

Argh. Nobody informed me (or if they did, I clearly missed it).

> Linus, should I send a proper patch to fix this conflict for you?

Yeah, somebody please send me a proper tested fix-up patch with commit
message etc.

Thanks,

              Linus
