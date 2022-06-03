Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA925A5B
	for <regressions@lists.linux.dev>; Fri,  3 Jun 2022 07:40:27 +0000 (UTC)
Received: from mail-yw1-f174.google.com ([209.85.128.174]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N6Kl7-1nhE9I25rV-016euq for <regressions@lists.linux.dev>; Fri, 03 Jun 2022
 09:40:25 +0200
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-30ce6492a60so74065147b3.8
        for <regressions@lists.linux.dev>; Fri, 03 Jun 2022 00:40:25 -0700 (PDT)
X-Gm-Message-State: AOAM530+yhX5NPLqb92ZyAhZU2XXGAkSabmf9f+GNVqvuQfoN4MtmWEk
	7B95XQg+DEfub6ojwhA6UyZXPmLaRBbyCmQZrQ0=
X-Google-Smtp-Source: ABdhPJyoKcG7HwT0epHhqyR9k2OLyyQ8Z+fyvWxq+MyNtBds3sgzOpMUe6hXdU1GhLplGXey9+/vbRa+obzDhQ1F3gk=
X-Received: by 2002:a81:745:0:b0:30f:b172:9efb with SMTP id
 66-20020a810745000000b0030fb1729efbmr10200079ywh.495.1654242024298; Fri, 03
 Jun 2022 00:40:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYts-KH-R5EkBpz2u6H_Cx6YTXus1JKJS6yBxGhb0O2qQQ@mail.gmail.com>
In-Reply-To: <CA+G9fYts-KH-R5EkBpz2u6H_Cx6YTXus1JKJS6yBxGhb0O2qQQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 3 Jun 2022 09:40:07 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3QKWxqGore3+_DJnWo7bJgvDhkZjtkyg5EUg4_D=mE2w@mail.gmail.com>
Message-ID: <CAK8P3a3QKWxqGore3+_DJnWo7bJgvDhkZjtkyg5EUg4_D=mE2w@mail.gmail.com>
Subject: Re: gcc-12: build errors: arch/arm64/kernel/setup.c:225:56: warning:
 array subscript -1 is outside array bounds of 'char[]' [-Warray-bounds]
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	John Donnelly <john.p.donnelly@oracle.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Hildenbrand <david@redhat.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:G0nCfJ+yABukPQeQiXEhmGNOQdLubR8FTKXkW9pemEk4/59sc0B
 TgqR89MucdtxCNqA2HN6ljuZoEfVWqQpjXAK6GPZD3vv0/ajYgxHo5aImdpzL2Gn6RUrRHl
 YnkJ1FmdmSXyK2i4WPeupqVD67ycIX7u4Cgg/pCL7kTbFRzio83jy4nXMwmlV9gwY0gic4X
 gj9GVdqN92BZzUkTpYdqw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MXKUqwfaiAI=:pqzutE4OJgNqOhq1kdQZ9v
 1RZaWlKADYXVc+Ny2l24vZSJ7phx5La6HKntaoUDX6oJGcAJdPnbtbD+0H7ypi3puqmZRQUs7
 YUhDt9Nw1mHqq+d/CJN3egUZbL4McIhtwohGoPgQUCdgJJtu2Ick03Kla28pNIL328umcQPlO
 h+baYBdzTy6MM3AqDoi9aSg2dAt3Ku5otxXCyYVH1pG6K/AS6X0pS6NAM2HQ1Gh/XSedYnVl2
 GPo36wqFam9XdXHziqGKWG+ka7Zs08mbFUFFfXxK+oVqw5DUgq13kqwpwc47mzEg+bQuFw1hf
 mGA4ADorQUpX7uIRCAJvTXVoHbI4DVc3TngbfI7qKmmnuyR5KJqNTOGSpEuKxgJ0YVDPIlXUE
 RRb8kQyLPAUo9sUFXA8kLMfCMzXF+e0pRWW2QRe0V7Djry9woHdAEw5cq8JaQPv+67siXL+5j
 ZJKHhgmd+nrXdmHWXcPhtsWR5+RoSMcgrLu2k57vXNieXXf7A7o++/txKJ6k4eg3334hCoigz
 lW0XdA9iLirXmWDpfZbzqo0pY7dAqc5aM3h0pPmhuAgf6fOc1h9E4m8K1UxXYlb6RY+q5/l/u
 NgSMFDFyNMsNr90IY4bMFOozOQ0pPEBgpl/+QMq6OD8F3yN/MM76Z8mcOV6OMwADQgSGbL0Od
 N+8WPUaFFXuWgCM4NYJUMPJMrdRhJQB05+UiL4KKJKst3nLRfS1y9BsYKHqG8RTk8c04fcEpF
 MP1MOMLKYEudorO+IfcIZiR7HK6NjpSxnm0B9A==

On Fri, Jun 3, 2022 at 4:03 AM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>     inlined from 'setup_arch' at arch/arm64/kernel/setup.c:350:2:
> arch/arm64/kernel/setup.c:225:56: warning: array subscript -1 is
> outside array bounds of 'char[]' [-Warray-bounds]
>   225 |         kernel_code.end     = __pa_symbol(__init_begin - 1);
>

Is this the only warning of this type that you get for arm64?

I think the easy fix would be to reword this line to

       kernel_code.end     = __pa_symbol(__init_begin) - 1;


        Arnd
