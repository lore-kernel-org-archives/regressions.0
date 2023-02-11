Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC18D2F3F
	for <regressions@lists.linux.dev>; Sat, 11 Feb 2023 22:32:13 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id u21so8556930edv.3
        for <regressions@lists.linux.dev>; Sat, 11 Feb 2023 14:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dh9Mfj+GJ1EDtE88jqp5PZHXrchX7Kr3iI5S46RntLo=;
        b=ef3BEBDJzUmhAk4lbobcyVovew4ssFMQo3+OgYMkMwyjLreYQTqxte5LkLxtJPntii
         MDCGE6/rNX52nAy3smz5Ylt3YEECyBL7ovNUVv0eRFQ1dADmJkRTNqx0WlrYU0QOeWuN
         9/rYMJ5nC2TE4ZXIrWKHcpApr7fLFpkCR5OUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dh9Mfj+GJ1EDtE88jqp5PZHXrchX7Kr3iI5S46RntLo=;
        b=EvHWu1hc8Ss6qHLcnCfVIisgu29SFo3UQ5AKMh4i1HMHBULM2yV/Vku7GiGqylVhKc
         AlWmSmbbSkkpHygC1dmo5WaAIlnfdlvDqXepUe+sKQNDH139cLH91xQYoLzN1LFNTHss
         W8M1T+XTNAFGzyL/Rg5t4FQMdNM/DUD2fGB/9Ovedw3HdLR9UiddTObYXixpZ04Rtrtt
         xeFRahF4bpc3mHul9Vzi6MIGAZg+bqHjhoARgEQCuFKlHMwiXc6jh+7c5KkWJi7+iqBr
         KuJuMpDilmMoToevYdkmCznNcYLgL6uIizQs3Eeho2qdn1+Sze3oh9qgc9/GNyiZuQAV
         bpNw==
X-Gm-Message-State: AO0yUKWEOxtGK3JfMhAHbVdkJ2XaAMZHaFmggoGecFSB6x/5sWPR11gs
	l+T5jPvdLmJd9fRr6uPGZCHoP/ZWkgzzakA/msVYVQ==
X-Google-Smtp-Source: AK7set9lwjzhbYJ6wYO7AgDqGlmlLZDjttEufp+hzLCsLy/xmpFrThqJOIvboHXmEFdzyTf8CwkVeQ==
X-Received: by 2002:a50:a692:0:b0:4ab:24e4:ded7 with SMTP id e18-20020a50a692000000b004ab24e4ded7mr10268752edc.14.1676154731729;
        Sat, 11 Feb 2023 14:32:11 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id v1-20020a50a441000000b004aab66d34c7sm4375589edb.7.2023.02.11.14.32.10
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Feb 2023 14:32:11 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id gr7so23828243ejb.5
        for <regressions@lists.linux.dev>; Sat, 11 Feb 2023 14:32:10 -0800 (PST)
X-Received: by 2002:a17:906:fad2:b0:88d:d304:3424 with SMTP id
 lu18-20020a170906fad200b0088dd3043424mr2691969ejb.0.1676154730590; Sat, 11
 Feb 2023 14:32:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <167613641114.2124708.9785978428796571420@leemhuis.info> <CAHk-=wiEJa-R50PTYPyAQDs02OAyK+Oqr67x5nxns=OKXCEf6A@mail.gmail.com>
In-Reply-To: <CAHk-=wiEJa-R50PTYPyAQDs02OAyK+Oqr67x5nxns=OKXCEf6A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 11 Feb 2023 14:31:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=whncfNmZmWe4yh-M=DXYT6L6Eq1r=UYKdt57=4jUmKbTA@mail.gmail.com>
Message-ID: <CAHk-=whncfNmZmWe4yh-M=DXYT6L6Eq1r=UYKdt57=4jUmKbTA@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2023-02-11]
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	David Chen <david.chen@nutanix.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 11, 2023 at 1:39 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Or even just reverting the original commit e320d3012d25
> ("mm/page_alloc.c: fix freeing non-compound pages") and say that the
> (very rare) memory leak is much less dangerous than that hacky fix
> (that was buggy).
>
> Because it's a bit dodgy how commit e320d3012d25 ends up hooking into
> __free_pages(),

Actually, that's not the only dodgy thing about it.

It assumes that any multi-order page allocator user doesn't use the
page counts and only ever has a single "alloc" and a "free".

And apparently that assumption is correct, or we'd have seen a lot of problems.

But it *also* assumes that the speculative page alloc/free was for one
single page, and while that used to be true, the whole higher-order
folio code means that it's not necessarily true any more.

Or rather, I guess it *is* true in practice, but if you ever want to
enable 16kB folios on some filesystem, that commit e320d3012d25 is
just plain unfixably buggy.

Are we there yet? Clearly not, considering bugs like this. But it all
does make me go "Hmm, maybe we'd be better off with the outright
revert and accept the unlikely memory leak for now".

Willy?

               Linus
