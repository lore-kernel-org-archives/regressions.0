Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2472A185C
	for <regressions@lists.linux.dev>; Sat,  8 Jul 2023 21:18:49 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4faaaa476a9so5021229e87.2
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 14:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688851128; x=1691443128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NYkpMcCqLkVQ1Acc1vLb6z5Gk8ZLjHpR5RYSSOrvZGs=;
        b=Nb3QCbvkIpeTDcpUQ65nqxbIAfPmInaCnV0Kn+S1p+cWlTmFngKhFoWR/L/+W5m6f1
         AyBgaXE9ZNr/xXLKhklSQHcGCB0KoKMN5zQd8RVI6cKw9IyADeXsgg7JxiRDExhiBOiL
         X/3IXLdza+9v4CmV3u+di3BhkYQFm7NBZzYrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688851128; x=1691443128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYkpMcCqLkVQ1Acc1vLb6z5Gk8ZLjHpR5RYSSOrvZGs=;
        b=Y3Uw1XiPW+NMsFl1mL9p5dqOQ0Ici4nTwyyUzjHnwYjUvfKkGx6EPxxBWSKQRQqoU5
         SC3saQrh6XsOMb7jrrj5nsFFFBGgoayt7eRE5y24npFw8F63NM44RQ1BTzWeApv93Ay8
         hdZA7O6NcpeoEj1OyEbhtnrICa5kruVzS59uV4Mc8usBtqbttrcTLo1EbnM0k+oiPLQG
         xFU33YzBYW2a+0sHWt/vtvO2ruF5bUhBfp6bcS+hvVLbwJW5ePjQwcEz5r3MhP/6rcWE
         4IELiGLvjPP0HvSSZrJ5kkfeAnGK6EbTZe/W0MiEzqiwExj5U1aBpV3oOnhhQrvTzMPb
         Ab0w==
X-Gm-Message-State: ABy/qLbpi8gNpBVGTO5ORjSLeHp2EfBKXEBMpyg1y6gw1tgc2E8cyTL8
	sWf4E7lGZF49Fo2fJdVYWSJQB9i7KIBNSrdNL+PyTfQa
X-Google-Smtp-Source: APBJJlHH0HJ4Lwxm7znkmzujmgYmB5SKFb0CG5Q4X1lWU14ha02hqYY/1bnMKe643APHI3q/lCfmGA==
X-Received: by 2002:a05:6512:2820:b0:4f8:4512:c846 with SMTP id cf32-20020a056512282000b004f84512c846mr6950643lfb.49.1688851127798;
        Sat, 08 Jul 2023 14:18:47 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id v3-20020a197403000000b004fbad6bc93dsm1115788lfe.136.2023.07.08.14.18.46
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jul 2023 14:18:46 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4faaaa476a9so5021206e87.2
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 14:18:46 -0700 (PDT)
X-Received: by 2002:a19:670b:0:b0:4f8:742f:3bed with SMTP id
 b11-20020a19670b000000b004f8742f3bedmr6097080lfc.37.1688851126226; Sat, 08
 Jul 2023 14:18:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
In-Reply-To: <20230708191212.4147700-3-surenb@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 8 Jul 2023 14:18:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=whhXFQj0Vwzh7bnjnLs=SSTsxyiY6jeb7ovOGnCes4aWg@mail.gmail.com>
Message-ID: <CAHk-=whhXFQj0Vwzh7bnjnLs=SSTsxyiY6jeb7ovOGnCes4aWg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, regressions@leemhuis.info, bagasdotme@gmail.com, 
	jacobly.alt@gmail.com, willy@infradead.org, liam.howlett@oracle.com, 
	david@redhat.com, peterx@redhat.com, ldufour@linux.ibm.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	gregkh@linuxfoundation.org, regressions@lists.linux.dev, 
	Jiri Slaby <jirislaby@kernel.org>, =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 8 Jul 2023 at 12:12, Suren Baghdasaryan <surenb@google.com> wrote:
>
>  kernel/fork.c | 1 +
>  1 file changed, 1 insertion(+)

I ended up editing your explanation a lot.

I'm not convinced that the bug has much to do with the delayed tlb flushing.

I think it's more fundamental than some tlb coherence issue: our VM
copying simply expects to not have any unrelated concurrent page fault
activity, and various random internal data structures simply rely on
that.

I made up an example that I'm not sure is relevant to any of the
particular failures, but that I think is a non-TLB case: the parent
'vma->anon_vma' chain is copied by dup_mmap() in anon_vma_fork(), and
it's possible that the parent vma didn't have any anon_vma associated
with it at that point.

But a concurrent page fault to the same vma - even *before* the page
tables have been copied, and when the TLB is still entirely coherent -
could then cause a anon_vma_prepare() on that parent vma, and
associate one of the pages with that anon-vma.

Then the page table copy happens, and that page gets marked read-only
again, and is added to both the parent and the child vma's, but the
child vma never got associated with the parents new anon_vma, because
it didn't exist when anon_vma_fork() happened.

Does this ever happen? I have no idea. But it would seem to be an
example that really has nothing to do with any TLB state, and is just
simply "we cannot handle concurrent page faults while we're busy
copying the mm".

Again - maybe I messed up, but it really feels like the missing
vma_start_write() was more fundamental, and not some "TLB coherency"
issue.

            Linus
