Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2F019A
	for <regressions@lists.linux.dev>; Sat,  8 Jul 2023 22:36:28 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-57a4a476bbfso37705807b3.2
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 15:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688855787; x=1691447787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GM81ytcQAbvY1rpHjBMQS8O2py0eRXT0atPhQXgjA54=;
        b=Jg/dnV7WFpsjyNkLXFSJxvrYIbV5y67MbDJvmLrUOpsSl1LalBxzIJWHJrFfJSep+L
         kfZUq9UEYRlcCIgngXW54qsHIAzed494k22aoeQDCFY4ti+EvUlIb1BGsWldwxkxHI+Z
         T0O1rSIqZmQLXjw0ciOxBZnryw5KfH13QEmjeIwQpMHYqnDxWeFqRwsi0j+AkxhDt5Db
         PubOIUcLGyJx197rF2uJfbZ9Yjwt9Z7yJB0/yJIrVGW9K8Wcc2dwI+q9RUKuLpMhIfMV
         0O1pGeVudSwRXlE5gEeIlz84wqdwxg/t6UU9/nN9EWZGGgMME7nrCyrW+oIZPuLQydV4
         +a4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688855787; x=1691447787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GM81ytcQAbvY1rpHjBMQS8O2py0eRXT0atPhQXgjA54=;
        b=Sj4XZvIZW0wUZxEEgePmQeTb3JLhrMUsYsYKolrpKvRX7HaUUyDASmE2scmRIybP/x
         XrNLtpPk9AOWwxHxvtcvC46ngpZjPQwyfY5S37bdX4QaGou4Lq+6Y4CluNdKLIJJL/Pl
         3NwLHues163KXXQ9+tuUdx4/vzFGHOTGM4PvCoV7yZGwPxBecHkXI0AQlR4RW0J1UlnV
         0qv0VbuLv2zsO2KCMpP0Ky2Kotx5eSyz8+iakPV5mvwDPKhE8NRtCUKuhCPOsmXDOnQg
         RsIl4FI73CJHAZfBUis9LcOKPMOHoEEAHGeReVOx/Ay5XNklyibKkoL9KH19rmPK1UU/
         61wQ==
X-Gm-Message-State: ABy/qLZWCPsLoEQPpErrGGgaQzkyEBmJK0AzirMEm17vuRKUcxJNKtic
	Y9XzcREstbyi3Ut+LwtsbMVBRejn5hfbpI0rBWU0zw==
X-Google-Smtp-Source: APBJJlE9QX36fmJ1qqEKpR7UCT26mt3D5smIFQ/5C5ArBlb6gmqPuqIREas9VSsGWwWtUdtNurt1pOKbRKnjQvM5CU8=
X-Received: by 2002:a81:7741:0:b0:570:63d3:9685 with SMTP id
 s62-20020a817741000000b0057063d39685mr7997297ywc.25.1688855787129; Sat, 08
 Jul 2023 15:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <CAHk-=whhXFQj0Vwzh7bnjnLs=SSTsxyiY6jeb7ovOGnCes4aWg@mail.gmail.com>
In-Reply-To: <CAHk-=whhXFQj0Vwzh7bnjnLs=SSTsxyiY6jeb7ovOGnCes4aWg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 8 Jul 2023 15:36:15 -0700
Message-ID: <CAJuCfpHuFc1P=Wo6Oy0T0u-H1B_JsbRgqhVJxY7D64ZY1zh7Cg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: akpm@linux-foundation.org, regressions@leemhuis.info, bagasdotme@gmail.com, 
	jacobly.alt@gmail.com, willy@infradead.org, liam.howlett@oracle.com, 
	david@redhat.com, peterx@redhat.com, ldufour@linux.ibm.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	gregkh@linuxfoundation.org, regressions@lists.linux.dev, 
	Jiri Slaby <jirislaby@kernel.org>, =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 8, 2023 at 2:18=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, 8 Jul 2023 at 12:12, Suren Baghdasaryan <surenb@google.com> wrote=
:
> >
> >  kernel/fork.c | 1 +
> >  1 file changed, 1 insertion(+)
>
> I ended up editing your explanation a lot.
>
> I'm not convinced that the bug has much to do with the delayed tlb flushi=
ng.
>
> I think it's more fundamental than some tlb coherence issue: our VM
> copying simply expects to not have any unrelated concurrent page fault
> activity, and various random internal data structures simply rely on
> that.
>
> I made up an example that I'm not sure is relevant to any of the
> particular failures, but that I think is a non-TLB case: the parent
> 'vma->anon_vma' chain is copied by dup_mmap() in anon_vma_fork(), and
> it's possible that the parent vma didn't have any anon_vma associated
> with it at that point.
>
> But a concurrent page fault to the same vma - even *before* the page
> tables have been copied, and when the TLB is still entirely coherent -
> could then cause a anon_vma_prepare() on that parent vma, and
> associate one of the pages with that anon-vma.
>
> Then the page table copy happens, and that page gets marked read-only
> again, and is added to both the parent and the child vma's, but the
> child vma never got associated with the parents new anon_vma, because
> it didn't exist when anon_vma_fork() happened.
>
> Does this ever happen? I have no idea. But it would seem to be an
> example that really has nothing to do with any TLB state, and is just
> simply "we cannot handle concurrent page faults while we're busy
> copying the mm".
>
> Again - maybe I messed up, but it really feels like the missing
> vma_start_write() was more fundamental, and not some "TLB coherency"
> issue.

Sounds plausible. I'll try to use the reproducer to verify if that's
indeed happening here. It's likely there are multiple problematic
scenarios due to this missing lock though.
Thanks,
Suren.

>
>             Linus
