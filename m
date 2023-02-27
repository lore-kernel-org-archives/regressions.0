Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ECA746B
	for <regressions@lists.linux.dev>; Mon, 27 Feb 2023 16:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE739C433A1
	for <regressions@lists.linux.dev>; Mon, 27 Feb 2023 16:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677514493;
	bh=8y1wP8ao9lT9NxXbVgWN8G4sVkHAjiaIwmzuXKtq6QQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tMs0k8wwYcWOmMjV0FwbNDFJtNkNG8pCkwSaLLbzfqEtYVOxqbHzamcVYheJWyZfw
	 /96XSfRHd4o9quYr9SRFrVJldluyX3oI1WjgM8q96fe8eYMOXIMb02IPkhqxk+hz8O
	 pGSzIalACnf7Q2FEkQnSr8yAXNtf52hOq+hhUyuTNYYv4D3bVnmD4/7peqPYUuzzp1
	 LlWs4So9kr27r31XMWVH1aj7iZsRRz965JDs4+iW4NO7Q0viw04c4XDp7p8qA4a3Kb
	 i8SikUz0QaViqMvbENBLuk3t1UGmax6ax0tktqImtr0cZrCvDUwbp8ER7KJbFYpS+U
	 A/kUi5dHG2CGw==
Received: by mail-lj1-f181.google.com with SMTP id by8so7009239ljb.7
        for <regressions@lists.linux.dev>; Mon, 27 Feb 2023 08:14:53 -0800 (PST)
X-Gm-Message-State: AO0yUKXTtRIEI0UuAphXoJJyOuwXRBOiEraNavGtK37EXHtu2dliPR3r
	MNtDhCcXfVOEZTjGV4sDNCZtNmkJCS6qw4sazfs=
X-Google-Smtp-Source: AK7set9sp5QAYc3EmdqzyPc/Ct+of5EXMBxFQXq2LkRCmzwqZe9FAlb0wqUuyF7PhsO0BtKFHzP5F40zj0J1ewU86ts=
X-Received: by 2002:a05:651c:1682:b0:295:acb3:cb71 with SMTP id
 bd2-20020a05651c168200b00295acb3cb71mr2293634ljb.2.1677514491437; Mon, 27 Feb
 2023 08:14:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221227092634.445212-1-liushixin2@huawei.com>
 <b93ec55c-f6f0-274a-e7d6-edb419b4be8a@huawei.com> <20230129134147.f19ca0641f1133f3e3bc185b@linux-foundation.org>
 <20230131150644.GA2605@willie-the-truck> <20230131150750.GB2605@willie-the-truck>
 <CAMj1kXGaxehOcrQqFZNA+C3dTk_H8sBr_1wsN3_KN82nXVaG_g@mail.gmail.com>
 <20230207112940.GA12147@willie-the-truck> <8c287b1d-476c-7b00-27f6-76c3a1a5fd46@leemhuis.info>
In-Reply-To: <8c287b1d-476c-7b00-27f6-76c3a1a5fd46@leemhuis.info>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 27 Feb 2023 17:14:40 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGWEaQXoKj=DzG9XpVGi4t5zfE-RSG0BodVL-b47nsj-A@mail.gmail.com>
Message-ID: <CAMj1kXGWEaQXoKj=DzG9XpVGi4t5zfE-RSG0BodVL-b47nsj-A@mail.gmail.com>
Subject: Re: [PATCH RFC] arm64/vmalloc: use module region only for
 module_alloc() if CONFIG_RANDOMIZE_BASE is set
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Liu Shixin <liushixin2@huawei.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Feb 2023 at 16:08, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>
> On 07.02.23 12:29, Will Deacon wrote:
> > On Tue, Jan 31, 2023 at 05:03:32PM +0100, Ard Biesheuvel wrote:
> >> On Tue, 31 Jan 2023 at 16:07, Will Deacon <will@kernel.org> wrote:
> >>> On Tue, Jan 31, 2023 at 03:06:44PM +0000, Will Deacon wrote:
> >>>> On Sun, Jan 29, 2023 at 01:41:47PM -0800, Andrew Morton wrote:
> >>>>> On Sun, 29 Jan 2023 10:44:31 +0800 Liu Shixin <liushixin2@huawei.com> wrote:
> >>>>>> On 2022/12/27 17:26, Liu Shixin wrote:
> >>>>>>> After I add a 10GB pmem device, I got the following error message when
> >>>>>>> insert module:
> >>>>>>>
> >>>>>>>  insmod: vmalloc error: size 16384, vm_struct allocation failed,
> >>>>>>>  mode:0xcc0(GFP_KERNEL), nodemask=(null),cpuset=/,mems_allowed=0
> >>>>>>>
> >>>>>>> If CONFIG_RANDOMIZE_BASE is set, the module region can be located in the
> >>>>>>> vmalloc region entirely. Although module_alloc() can fall back to a 2GB
> >>>>>>> window if ARM64_MODULE_PLTS is set, the module region is still easily
> >>>>>>> exhausted because the module region is located at bottom of vmalloc region
> >>>>>>> and the vmalloc region is allocated from bottom to top.
> >>>>>>>
> >>>>>>> Skip module region if not calling from module_alloc().
> >>>>>
> >>>>> I'll assume this is for the arm tree.
> >>>>>
> >>>>> Acked-by: Andrew Morton <akpm@linux-foundation.org>
> >>>>
> >>>> This looks like the same issue previously reported at:
> >>>>
> >>>> https://lore.kernel.org/all/e6a804de-a5f7-c551-ffba-e09d04e438fc@hisilicon.com/
> >>>>
> >>>> where Ard had a few suggestions but, afaict, they didn't help.
> >>>>
> >>
> >> Thanks for the cc.
> >>
> >> So this is a bit clunky, and I wonder whether we wouldn't be better
> >> off just splitting the vmalloc region into two separate regions: one
> >> for the kernel and modules, and one for everything else. That way, we
> >> lose one bit of entropy in the randomized placement, but the default
> >> 48-bit VA space is vast anway, and even on 39-bit VA configs (such as
> >> Android), I seriously doubt that we come anywhere close to exhausting
> >> the vmalloc space today.
> >
> > That sounds like a good idea to me.
> >
> > Liu Shixin -- do you think you could have a go at implementing Ard's
> > suggestion instead?
>
> Liu Shixin, did you ever look into realizing this idea?
>
> Or was some progress already made and I just missed it?
>

This patch

https://lore.kernel.org/all/20230223204101.1500373-1-ardb@kernel.org/

should fix the issue.

> I'm asking, as the idea discussed afaics is not only supposed to fix the
> regression you tried to address, but also one that is now three months
> old and stalled since Mid-December -- which is really unfortunate, as
> that's not how regressions should be handled. :-/

Is it documented anywhere how regressions should be handled? The
mailing list is flooded with hard to reproduce reports from users as
well as automatic fuzzers and build bots, so I don't think it is
entirely unreasonable to move unresponsive reporters to the back of
the queue.

> But well, it afaik was
> caused by a patch from Ard, so it's obviously not your job to address
> it. But it seems you were working on it.
>

We are all working together here, so please refrain from telling
people what they should or should not be working on. (I am aware that
you probably did not mean it that way, but things tend to get lost in
translation very easily on the mailing list)

Liu, could you please check whether the linked patch addresses your issue?

Thanks,
Ard.
