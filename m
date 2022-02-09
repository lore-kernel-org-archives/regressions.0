Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3622F26
	for <regressions@lists.linux.dev>; Wed,  9 Feb 2022 14:58:08 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id x136so4918460ybe.11
        for <regressions@lists.linux.dev>; Wed, 09 Feb 2022 06:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ECpUMaTdm+yyS+IRsgx6JK+2PJOAWfEZbqpS8KRUZVM=;
        b=HtziXKNwy97T5nE4WySc3JUaj9CPpnWW5FC5nbT/LagHDXn71TVCpQ4AS2gUP0TTbO
         0pF5q+D+Cdr+w69NbcO9hAMYvbTDBmXooJN6jICUEcfd2fjNPhg3jr/Rnp0c3+CSV/l1
         vBfoGUMqkinuBVs3wgp44GH+BE6Qm/r63QstwFYosJR8ivZBa4UI1nwStTkGYZLUmHW1
         LKgIgIAhr5n4grPxJaztFFvrqjIAiW1p/LxmHBNIvz/Ffo22R0kCpRx4LBHRxP+AsXqE
         DG3opXXZKhg5P9yNB+RRXwDsUvg1cR75gRgbMAI0YejwfBwWcLG+/dsrAw+SABPIBWrn
         A7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ECpUMaTdm+yyS+IRsgx6JK+2PJOAWfEZbqpS8KRUZVM=;
        b=JiREcbgzvkK3ze5sXjzZHFsYYJAIwItVLFJ7HOL3gKXiNitGrwOeW/V6Dg0c5oRbRB
         lZyWkHvX0LPl7muRcoUFZC5sBsyBATfJAz2gmW+fO1e0OvSqPqTwEyg0U9oE7H1Pvne7
         Ohcpri8qZhKJ0LoCc+/lsBsEQ/Rw/2HcgbMUi9iCHY2lCe1niCNyd1diOus1+cn06zrf
         n2tWLxD9xifgKFO6nFY6+R/yb93N044vwcuFls/KGwChGC7P/05PjJYW5GFrfKeydQ+n
         r5rqv+ewkVkcLsKXRuU6O3eHJr5XiGvlIFmLWI5umKUYd69n8WfXi9cfcYKeBb8L3oqF
         ZcEQ==
X-Gm-Message-State: AOAM532bzZLIblWvW/864GRNMbSvo7b7FtmUqYIenmH7sXPD8Rom+LYp
	ixWvae6Y/eUkXzqxHGG9N4VxbDTal08P1j1AdeVupQ==
X-Google-Smtp-Source: ABdhPJx6k/2CaivTOLnv01Uwjtg/gSghQiwECY/vFRnpXknpD8tKFEXHMvirvryWKGLl396E5KSyDbgKusErY0jh9FY=
X-Received: by 2002:a25:6b45:: with SMTP id o5mr2446049ybm.704.1644418687758;
 Wed, 09 Feb 2022 06:58:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 9 Feb 2022 20:27:56 +0530
Message-ID: <CA+G9fYv_ssRhvYi4mM1ZeGCL2meFwRsakpADp_Cz3bNDZz2zSA@mail.gmail.com>
Subject: Re: mm/munlock: mlock_page() munlock_page() batch by pagevec
To: open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org
Cc: Hugh Dickins <hughd@google.com>, Alistair Popple <apopple@nvidia.com>, 
	David Hildenbrand <david@redhat.com>, Greg Thelen <gthelen@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, "Kirill A. Shutemov" <kirill@shutemov.name>, 
	Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, 
	Shakeel Butt <shakeelb@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Yu Zhao <yuzhao@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

The following build regression noticed while building Linux next 20220209
arm/riscv/sh of allnoconfig and tinyconfig builds failed with gcc-10,
gcc-11 and clang-13.

clang: warning: argument unused during compilation: '-march=armv7-m'
[-Wunused-command-line-argument]
mm/swap.c:637:2: error: implicit declaration of function
'mlock_page_drain' [-Werror,-Wimplicit-function-declaration]
        mlock_page_drain(cpu);
        ^
1 error generated.
make[2]: *** [scripts/Makefile.build:289: mm/swap.o] Error 1

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org
