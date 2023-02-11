Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3529F7E5
	for <regressions@lists.linux.dev>; Sat, 11 Feb 2023 21:39:28 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id n33so228883wms.0
        for <regressions@lists.linux.dev>; Sat, 11 Feb 2023 13:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xBpfjQs53Z/vP4xVPdxfYKFH+U3LxXkK1o+VPt/Oi8g=;
        b=R7/eaeBH0rSwxf4SKitKDJkaCfR3iVTX5RrUHlBiDcKSvNxGfTwQ4NDa0SHQ0fdw25
         e4aK3jZWEhOLO5VXllmREs5e/c7egvzvskveANqSiMRDpiwuuRV7T25373fo/ckoqxt8
         wjCP+rZcngJDuPFNQB6bM4R+O/EFIZ/rruAfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xBpfjQs53Z/vP4xVPdxfYKFH+U3LxXkK1o+VPt/Oi8g=;
        b=USIpWp/Q6XglaoyRwc4SYrHBG+lpWCu8u3SQLWbDIO4zX2khwv768P38JK3LOJukXH
         0fxKQMqkSjtCw/2Hd9kF7weLDmMeYyyEthgDCdJnsYM/3pG1qEOHyr6PMxAVeNq4+f7b
         bceNxmUdTh6dkFBPLJOx0z+v8LFU268IS3GFWLiuMEIzYvszo+tyBbWlE8mlTqds/zi3
         vXqBfhUY438g8lA3lc0yq4cwLkKc/BaaOO8mS3RRBdemmVBWnOe1/Glsdc33YCoh5nK+
         CAqEx7RUBsz9WfkDiT+A0uQmTRF/tyX6KWZJPdTmXERaApHxoTuOqqVjw6UgMc93GYf5
         0WcQ==
X-Gm-Message-State: AO0yUKVFuB8+2+MtB2CfUPpF0Z5gHyDBO72pbhsx4AE6xCU/GwUsuFld
	V1Rv7rjho9A2Dibh57hsZ6hFsSdQEqdT/A51lNk=
X-Google-Smtp-Source: AK7set/x2O2Ul9Lvgmfk9vP1+jkvJfrum+UJR++DNIADJUNsByB026UayuGGMC9nkdzh4nybSLrNOQ==
X-Received: by 2002:a05:600c:601a:b0:3dc:42e7:f626 with SMTP id az26-20020a05600c601a00b003dc42e7f626mr15786620wmb.26.1676151565959;
        Sat, 11 Feb 2023 13:39:25 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id p6-20020a05600c468600b003dc36981727sm13550196wmo.14.2023.02.11.13.39.25
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Feb 2023 13:39:25 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id hx15so23588795ejc.11
        for <regressions@lists.linux.dev>; Sat, 11 Feb 2023 13:39:25 -0800 (PST)
X-Received: by 2002:a17:906:16c2:b0:8af:4100:28e5 with SMTP id
 t2-20020a17090616c200b008af410028e5mr2421071ejd.0.1676151564825; Sat, 11 Feb
 2023 13:39:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <167613641114.2124708.9785978428796571420@leemhuis.info>
In-Reply-To: <167613641114.2124708.9785978428796571420@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 11 Feb 2023 13:39:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiEJa-R50PTYPyAQDs02OAyK+Oqr67x5nxns=OKXCEf6A@mail.gmail.com>
Message-ID: <CAHk-=wiEJa-R50PTYPyAQDs02OAyK+Oqr67x5nxns=OKXCEf6A@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2023-02-11]
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	David Chen <david.chen@nutanix.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 11, 2023 at 9:28 AM Regzbot (on behalf of Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> * A patch to fix a page corruption caused by racy check in __free_pages
> emerged on Thursday. It's caused by a change merged for 5.10-rc1, but
> Vlastimil nevertheless said "That's nasty enough to go into 6.2, IMHO".
> Willy reviewed it, but Andrew didn't pick it up yet.
> https://lore.kernel.org/lkml/BYAPR02MB448855960A9656EEA81141FC94D99@BYAPR02MB4488.namprd02.prod.outlook.com/

Ugh. That's indeed nasty.

However, I'm now worried that the problem could be worse.

We do folio_ref_try_add_rcu() in the GUP code too (see try_get_folio()
in mm/gup.c).

I *think* that in that case we're good, because in that case the
underlying page is never really free'd (it's there in the page
tables), so all we can race with is the splitting.

We also do folio_try_get()n in mm/vmscan.c (see isolate_lru_folios()).
There we hold the lry lock and find the folio on the lru list, but if
that is all safe then why could the refcount be zero? I guess it's
because the count is decremented before the lru entry is removed..

So *hopefully* the only case where this can happen is the mm/filemap.c
cases, but this all smells to me.

Maybe we should just bite the bullet and say "page cache pages are
rcu-freed after removing them from the mapping", so that we don't need
the whole folio_try_get_rcu() at all.

I think Andrew (and probably other people too) has always worried
about that magical "tryget" thing forever, but I've always claimed it
was clever and safe. This whole thing clearly shows it was neither of
those things.

But yeah, for 6.2, I think that patch by David Chen is likely the safest thing.

Or even just reverting the original commit e320d3012d25
("mm/page_alloc.c: fix freeing non-compound pages") and say that the
(very rare) memory leak is much less dangerous than that hacky fix
(that was buggy).

Because it's a bit dodgy how commit e320d3012d25 ends up hooking into
__free_pages(), even though that's very much not the only thing that
can actually free memory (ie "put_folio()" itself does the same thing,
just for a different class of allocations).

I dunno.

                  Linus
