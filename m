Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F104629CA
	for <regressions@lists.linux.dev>; Fri, 31 Dec 2021 19:15:13 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id z9so41603846edm.10
        for <regressions@lists.linux.dev>; Fri, 31 Dec 2021 11:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HRhip54+JnwF8oKsLs20EY47pxmh2riYZm3Qc8IBRcM=;
        b=V7WaTtf3U2sm9T7zwDPV1eYMgoM0U1SemKSgiUC1NGMfC0pOm+NL58I/hVlSHS2kuP
         nH+9Fjukx33me0dTQKe90FOa9nT9rVcfx4lUU4XO5OR1f4ZQOxOT0O+VQ7baOGx4MnGw
         YgS3srfJCUf1l5EREBzfqYvFTwBO8Ho+bG7iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HRhip54+JnwF8oKsLs20EY47pxmh2riYZm3Qc8IBRcM=;
        b=TVTqUTo4YpNf0N99pp0MhUxTRFyUuANzXuQ2RPSYqJmKAb3pTsGOL7IC/uV95biDxS
         CZrr4WI+261QpjhkiQQfZw4Oz5oPsy40o8cnVteXJlfUrCV742NuSy5FxHiIgcAaCoPw
         iEWPniPsCFq2gjQXo83g3TLfNT7NYfjkrxbiTMhSi/EJXU7AX0CKqhhrU7OFGY9Ewi56
         6k8hYp4Ux6bKUli8tdNrwvpeH1l0Key/FP8k1N3wjrMjCsAN/tH42CO5KfI7qkHximCY
         RFJZRGIXuRXogSBScakJhqo2reT6l5pb9epBD9j20XPXN7DvsYfcHyLB8babJpwYbq25
         M4Qw==
X-Gm-Message-State: AOAM531ZD7W/1mSdWQupulw2tSjo8Mm9WOo6l6jGdoCLFFKhpPgmc6CP
	E6E98b5vb0Uyg7ydxmZTxbzhPP2ojInHQhMG
X-Google-Smtp-Source: ABdhPJxjZ2TlD/0ozcu3sREad5E3CXa0a1N0qyASYX6n4gRaGt3E6ED58uP36vZ9hf1xV0LI5npriw==
X-Received: by 2002:a17:907:33d0:: with SMTP id zk16mr28677311ejb.165.1640978111849;
        Fri, 31 Dec 2021 11:15:11 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id f5sm10781697edu.38.2021.12.31.11.15.09
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Dec 2021 11:15:10 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id r17so57306295wrc.3
        for <regressions@lists.linux.dev>; Fri, 31 Dec 2021 11:15:09 -0800 (PST)
X-Received: by 2002:a05:6000:10d2:: with SMTP id b18mr29861213wrx.193.1640978109225;
 Fri, 31 Dec 2021 11:15:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211202150614.22440-1-mgorman@techsingularity.net>
 <caf247ab-f6fe-a3b9-c4b5-7ce17d1d5e43@leemhuis.info> <20211229154553.09dd5bb657bc19d45c3de8dd@linux-foundation.org>
 <5c9d7c6b-05cd-4d17-b941-a93d90197cd3@leemhuis.info>
In-Reply-To: <5c9d7c6b-05cd-4d17-b941-a93d90197cd3@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 31 Dec 2021 11:14:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi3z_aFJ7kkJb+GDLzUMAzxYMRpVzuMRh5QFaFJnhGydA@mail.gmail.com>
Message-ID: <CAHk-=wi3z_aFJ7kkJb+GDLzUMAzxYMRpVzuMRh5QFaFJnhGydA@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] mm: vmscan: Reduce throttling due to a failure to
 make progress
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, 
	Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Alexey Avramov <hakavlad@inbox.lv>, Rik van Riel <riel@surriel.com>, Mike Galbraith <efault@gmx.de>, 
	Darrick Wong <djwong@kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	Linux-MM <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 31, 2021 at 6:24 AM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> If we get it into rc8 (which is still possible, even if a bit hard due
> to the new year festivities), it will get at least one week of testing.

I took it with Hugh's ack from his reply to this, so it should be in rc8.

I'm not sure how much testing a week in rc8 will actually get, but
next week is likely to be at least a _bit_ more active than the
current week has been. And it's been tested by the people reporting it
(and apparently Hugh too).

                   Linus
