Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FF62F23
	for <regressions@lists.linux.dev>; Thu, 10 Feb 2022 04:50:01 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id v17-20020a4ac911000000b002eac41bb3f4so4980164ooq.10
        for <regressions@lists.linux.dev>; Wed, 09 Feb 2022 20:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=4Jobq+qDCn0DLQoMGzu/G3IUm/o1eD+lCYxdsTeODFA=;
        b=eMQ6xiBu0oXza2qERH659vL16F0VUyIma1jeN615rGln+fqxBmCvgJJMDQMpXj3Htz
         fqLKpO5zBluZw2dRoGTBPQtmBFe4gZnJVBAnVVpAfqJopBJNTvEyFCzXz+IvT8WtBEb/
         TOIZCormeBiQNpmgjl+n2DuK73sIO21Fn1TzPbb7A8ret3wM0uhdcemHRSLVjgW5TmUm
         I3i/LGF4q+4DjouvSdpz7/mdm7wsBA7dS0fQv3FN+x/XV225OQ+B+F6VK6PbZ+tCLEkI
         03w/SzLpNEUp8GilFe8L/bbelpC6iLr+fX2fUhUUFwPdwm3rtP76uBmUWBA852LybRZt
         aG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=4Jobq+qDCn0DLQoMGzu/G3IUm/o1eD+lCYxdsTeODFA=;
        b=DpDRJ8GsfQNgxpgR6DzgZkvPg03cqsBDiTN6idl2hWuf3ImSQ/mJ31mDOldI0a7U6m
         /knSnvmpoY4PE4dtK/N/XyUnBS6rnQylpbHlDg75U28xjUMGy/Qa7zYtJtqGN7UkqAHO
         4sjhSKyp0Wujh+Sous+vy0h9s8vchpD+owMQs1et5bG7Qrktk7JocUn9uYq6MiS54wua
         5X9R4KhBBdeFi72acG0jNzaB2JQHVRiOEabR8oMKWF4XS4IsJKv4ba/PJDmRfbGEBmZ2
         XjlEhrsgFHx3qceDRLK5I66V0x9arPcinoZUxlWlANn/r149dgbDgmpK4A2aQMy3oxxw
         jECQ==
X-Gm-Message-State: AOAM533iwzoo518t6YvM7oWDDt4vAox5vpsX/dBfIiqYeQEUdd3f7BMZ
	ItpcRJSzXtWy4OUZJSs7IgLIFg==
X-Google-Smtp-Source: ABdhPJwwSZhmnjDZ7pgSMs76EZBfUaAKepRAPpZCVge1mXkMwftDxRWUj7/PT0YJkxPBtJj+Gy2HCw==
X-Received: by 2002:a05:6871:583:: with SMTP id u3mr254881oan.189.1644468600735;
        Wed, 09 Feb 2022 20:50:00 -0800 (PST)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id f21sm7364939otq.4.2022.02.09.20.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 20:49:59 -0800 (PST)
Date: Wed, 9 Feb 2022 20:49:57 -0800 (PST)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To: Naresh Kamboju <naresh.kamboju@linaro.org>
cc: open list <linux-kernel@vger.kernel.org>, 
    Linux-Next Mailing List <linux-next@vger.kernel.org>, 
    regressions@lists.linux.dev, lkft-triage@lists.linaro.org, 
    Hugh Dickins <hughd@google.com>, Alistair Popple <apopple@nvidia.com>, 
    David Hildenbrand <david@redhat.com>, Greg Thelen <gthelen@google.com>, 
    Johannes Weiner <hannes@cmpxchg.org>, 
    "Kirill A. Shutemov" <kirill@shutemov.name>, 
    Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@suse.com>, 
    Rik van Riel <riel@surriel.com>, Shakeel Butt <shakeelb@google.com>, 
    Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
    Yu Zhao <yuzhao@google.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: mm/munlock: mlock_page() munlock_page() batch by pagevec
In-Reply-To: <CA+G9fYv_ssRhvYi4mM1ZeGCL2meFwRsakpADp_Cz3bNDZz2zSA@mail.gmail.com>
Message-ID: <5d63a397-96e-7e9a-eb9f-289904f9998@google.com>
References: <CA+G9fYv_ssRhvYi4mM1ZeGCL2meFwRsakpADp_Cz3bNDZz2zSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Feb 2022, Naresh Kamboju wrote:
> The following build regression noticed while building Linux next 20220209
> arm/riscv/sh of allnoconfig and tinyconfig builds failed with gcc-10,
> gcc-11 and clang-13.
> 
> clang: warning: argument unused during compilation: '-march=armv7-m'
> [-Wunused-command-line-argument]
> mm/swap.c:637:2: error: implicit declaration of function
> 'mlock_page_drain' [-Werror,-Wimplicit-function-declaration]
>         mlock_page_drain(cpu);
>         ^
> 1 error generated.
> make[2]: *** [scripts/Makefile.build:289: mm/swap.o] Error 1
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Thanks Naresh, Geert had already reported, and SeongJae sent a fix in

https://lore.kernel.org/lkml/20220209094158.21941-2-sj@kernel.org/

Turns out that a !CONFIG_MMU CONFIG_SMP config will need one more stub,
I just sent a v2 update to SJ's patch in that thread.

Hugh
