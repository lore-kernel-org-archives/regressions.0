Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CDD10941
	for <regressions@lists.linux.dev>; Mon,  3 Jul 2023 18:08:46 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5768a7e3adbso68068007b3.0
        for <regressions@lists.linux.dev>; Mon, 03 Jul 2023 11:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688407725; x=1690999725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjP+t63cmXLZ73zOjZVRIKi8PaFjf6acXyVJzs/mz5o=;
        b=35oM3+4s76Gmu0eP07vWHgS6Rk1tmz7OxtUeUPJT2hC5YGbhWy3+elQhg6NwyPjOgC
         M5zGqi2lKBWN4PdxjaMCXIIyyVAmd+jOB8Cyi2Ra59jlhyS1r2WxTzJaGA+WlAFGKg7x
         UAN6LJSmzeDRQvjEALRuAl699XjFjFLbfZ4vVLR5K+3GGUenIRNYaJhyQ0g/oQuHu6jN
         7b7Io6rtkhGFBOyeFVv0UpwjuK3CM3KJZFW5M0FVXmWcD6eRcW0JbeDlDssgckP6Ht3O
         ygvptCGOnz2qiBH7Wb7KL+uCmr3fzfEIK0VI707ZQLPwzcjlupIU/DlzVVNDLPHuwFkt
         z/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688407725; x=1690999725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjP+t63cmXLZ73zOjZVRIKi8PaFjf6acXyVJzs/mz5o=;
        b=KgKN9iVSG6PF9tPJzXp9QlL/CyZ3yZh/Xv5ts87gAv/uTqXmfX7/FLG1dGcQji5lAz
         +Ck+SvajBho99DFLVpsyb30JiqUJMj4g3vxWkkf01EA9DojsKI0Px4wikFnbxMCc7dUG
         qyRa4tLoGTwW/1KM3pIkkW28JOBlbnTdW9zgzSsj5yP7NMf6qMbDopRek+hIxzezzwpf
         fehBwnJYZ8EsEhKk0R5E+2uLNmSqedOwE8eP8gCc+LsnELbBy2ggyEMhx2KYshPPiGq6
         xoc+wpq2UAu11uCUZ0X5YhHs5lmf/U0Q5YmW1nggIQS9/yKiKV9pbONTTWQhqiKpuD8b
         2jSQ==
X-Gm-Message-State: ABy/qLaPRLeIXTmyMeDW6Oz5Y/BFMQ/wEH/MvHRzhHC4KEAde9CX77sN
	fk7lRLcbnY7ErWuWce83vYCsZOt39Qv3Upg8sh9M0h//zvF0j/dTxJTfug==
X-Google-Smtp-Source: APBJJlHqFAXrJx6IysDJ2T6WOUSv+vPO3CrUXTDQ+klQimcwHP1PCpSvjaq7m7khAiRcDXbb9/iNwUyOESsL1qgRn9o=
X-Received: by 2002:a25:1003:0:b0:c3a:8530:c8a9 with SMTP id
 3-20020a251003000000b00c3a8530c8a9mr12592615ybq.11.1688407724626; Mon, 03 Jul
 2023 11:08:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com> <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info>
In-Reply-To: <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 3 Jul 2023 11:08:33 -0700
Message-ID: <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jacob Young <jacobly.alt@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, 
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 3, 2023 at 2:53=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 02.07.23 14:27, Bagas Sanjaya wrote:
> > I notice a regression report on Bugzilla [1]. Quoting from it:
> >
> >> After upgrading to kernel version 6.4.0 from 6.3.9, I noticed frequent=
 but random crashes in a user space program.  After a lot of reduction, I h=
ave come up with the following reproducer program:
> > [...]
> >> After tuning the various parameters for my computer, exit code 2, whic=
h indicates that memory corruption was detected, occurs approximately 99% o=
f the time.  Exit code 1, which occurs approximately 1% of the time, means =
it ran out of statically-allocated memory before reproducing the issue, and=
 increasing the memory usage any more only leads to diminishing returns.  T=
here is also something like a 0.1% chance that it segfaults due to memory c=
orruption elsewhere than in the statically-allocated buffer.
> >>
> >> With this reproducer in hand, I was able to perform the following bise=
ction:
> > [...]
> >
> > See Bugzilla for the full thread.
>
> Additional details from
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217624#c5 :
>
> ```
> I can confirm that v6.4 with 0bff0aaea03e2a3ed6bfa302155cca8a432a1829
> reverted no longer causes any memory corruption with either my
> reproducer or the original program.
> ```
>
> FWIW: 0bff0aaea03 ("x86/mm: try VMA lock-based page fault handling
> first") [merged for v6.4-rc1, authored by Suren Baghdasaryan [already CCe=
d]]
>
> That's the same commit that causes build problems with go:
>
> https://lore.kernel.org/all/dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel.o=
rg/

Thanks! I'll investigate this later today. After discussing with
Andrew, we would like to disable CONFIG_PER_VMA_LOCK by default until
the issue is fixed. I'll post a patch shortly.

>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> #regzbot introduced: 0bff0aaea03e2a3
