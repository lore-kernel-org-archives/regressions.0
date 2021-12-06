Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E7B2C9D
	for <regressions@lists.linux.dev>; Mon,  6 Dec 2021 06:06:40 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id z7so22620178lfi.11
        for <regressions@lists.linux.dev>; Sun, 05 Dec 2021 22:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vv0znKZkXJZMzsECckGi47A2Z/lLUzawdx8IEXbnGWk=;
        b=YsEjqepZeQvUbFx/aqXDHvbDkAi16fxHMOFnyDNfNhyWoBQvVeaAjLcoFIxE4ZFE6r
         e0yQfiOvKFKism80QUNMHwZJ/aTzVLwEFwZDAcQPSazF2BXWGCty9K4kE/czm/gV7K2b
         EDOROzNqqQ8qBhibAUtJLEvyY41oVBjI+P1L2+9UXkZ2DCdoXFZKq1ZOfD4Kf8h/dVZM
         qrCUT+zK0Tv6UuPUZOdNPB6trOKeGiPcBuTHEiSqIX6vKVgROLoDvg0UYEzkiE60Gb8g
         sHVTe99J9n1ZhiZsQ2Zy53UpR3egvHVWiTHfjNrcDWwqID3ak8hZG3fO/BVdjAuQWo/5
         8x6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vv0znKZkXJZMzsECckGi47A2Z/lLUzawdx8IEXbnGWk=;
        b=pr2zIT5p1TT5FYWwdhjaB1Rl9tnKpvguFPB/VpPofiJYTamHy70IgWmaXkzY7tI922
         CgDkUD8TXWLRz00wZt2u6QbJyjn9pe/quqb15li21qhK0OEQD+l+R4iwswlJ5rJgtHrz
         Y3kYEQEdC7+CBvu7J2feipDUjnlcwz2iKgtQfk39PvudxUgNUALhQT+l76rsMnyCg8Xr
         rfu8XyCzDOjTjCXeVHp8f/xY4Pa3cpiZ+hQ8aUMjR27OWZlyp+jlxt+x7QQisQjV1LYq
         dOEK6ElIZvOA/T6cUFC38IGx0yxoCmox7D1/9TyFVfRNj+j9QMTdDfbNF+TUU7H+ZZm2
         9NSg==
X-Gm-Message-State: AOAM5303kBHurrPjkLyPXQ8rDBaQxaLdAfSXHuTqeBdeoOvjnAteHFc8
	yapvaEIxOebjXLLqR+2qPgDOL6JEHQ4vEb0RckyfiQ==
X-Google-Smtp-Source: ABdhPJzDUE/FOglwH1X1yflrVsaHq5ki2OSiI7rH+J6rd9KuybYkMfGkVUfJ+ZsNJDQKf6M+bs18NYyHI8A9InkI0es=
X-Received: by 2002:a05:6512:1113:: with SMTP id l19mr33552043lfg.184.1638770798873;
 Sun, 05 Dec 2021 22:06:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211202150614.22440-1-mgorman@techsingularity.net>
 <CALvZod6am_QrZCSf_de6eyzbOtKnWuL1CQZVn+srQVt20cnpFg@mail.gmail.com>
 <20211202165220.GZ3366@techsingularity.net> <CALvZod5tiDgEz4JwxMHQvkzLxYeV0OtNGGsX5ZdT5mTQdUdUUA@mail.gmail.com>
 <20211203090137.GA3366@techsingularity.net> <CALvZod46SFiNvUSLCJWEVccsXKx=NwT4=gk9wS6Nt8cZd0WOgg@mail.gmail.com>
 <20211203190807.GE3366@techsingularity.net>
In-Reply-To: <20211203190807.GE3366@techsingularity.net>
From: Shakeel Butt <shakeelb@google.com>
Date: Sun, 5 Dec 2021 22:06:27 -0800
Message-ID: <CALvZod5BmFVdosG=e2NcEzeuzv0W9WifSBmeD48xnn1k+SNRKg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] mm: vmscan: Reduce throttling due to a failure to
 make progress
To: Mel Gorman <mgorman@techsingularity.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Alexey Avramov <hakavlad@inbox.lv>, Rik van Riel <riel@surriel.com>, 
	Mike Galbraith <efault@gmx.de>, Darrick Wong <djwong@kernel.org>, regressions@lists.linux.dev, 
	Linux-fsdevel <linux-fsdevel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 3, 2021 at 11:08 AM Mel Gorman <mgorman@techsingularity.net> wrote:
>
[...]
> > I am in agreement with the motivation of the whole series. I am just
> > making sure that the motivation of VMSCAN_THROTTLE_NOPROGRESS based
> > throttle is more than just the congestion_wait of
> > mem_cgroup_force_empty_write.
> >
>
> The commit that primarily targets congestion_wait is 8cd7c588decf
> ("mm/vmscan: throttle reclaim until some writeback completes if
> congested"). The series recognises that there are other reasons why
> reclaim can fail to make progress that is not directly writeback related.
>

I agree with throttling for VMSCAN_THROTTLE_[WRITEBACK|ISOLATED]
reasons. Please explain why we should throttle for
VMSCAN_THROTTLE_NOPROGRESS? Also 69392a403f49 claims "Direct reclaim
primarily is throttled in the page allocator if it is failing to make
progress.", can you please explain how?
