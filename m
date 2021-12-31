Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFF329CA
	for <regressions@lists.linux.dev>; Fri, 31 Dec 2021 18:34:09 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id v22so24752622qtx.8
        for <regressions@lists.linux.dev>; Fri, 31 Dec 2021 10:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=chIrXbAW4TfhrO5he8oILwySDJLdwg5wZwlWDgXPoIE=;
        b=aQy0+JXHD5iO7KS1vulcTYPjF7Gh91M8cAedph9OEgjYd+EGqkXPuVYMKOwMb9sFBb
         gHL4tIh4Qsz0P22eLJCLc6tLdX8MKg+xg9Zt9Pt4h3jjrxDHAMQySleDIO4LJIAwNs0K
         cs8av8QfsM6/ffBv/hM2oyaVVkn34QVCUdCPorj+Ugg+c1Uu8UWIp1NHgMcNK9HCZMFw
         mIcOxtXMHRmzyqbZSA7fNwtYNJcIDBE0d+eHjrbYzkEUaReYo3ojqyX5M3W09qPxM6PY
         fn3+3HLq02aI6gmZgzv4fFI5Y84EHPhHd5K/vx1bN1UwGKmCi5P1QD6MAllPn89JJ8Le
         PmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=chIrXbAW4TfhrO5he8oILwySDJLdwg5wZwlWDgXPoIE=;
        b=dsoF6UiJO/c+6qqDyXz0oOQszYq9G0fmnCrbHqq/2MCX+AAgiJij0zvuIlv5nXuv0Q
         CiJtlBYq47Zq/K+ZPDg1zj4UCbCbq1mEHiqEUxux00aIOsgTrGhjYMWIv7l2CvzJ2wcg
         E3lHFmaXtdYifbB5igOIlBWmayGzE23FKntlBgAdKXnx9Ghl8cHIXdH4QFioMZ0WhfDB
         JIim03wSjSk9rm0IYMFKSHsIeM8oRrEr4ACKsIRf1mH4IPn1Wi2wRvzueKPvdhtJqOTN
         xpJPpH/TCanhimvURqCmzSEAiuOjKBSosq96PVGxD6zX68LanHz+1X1d+VlDkYOodLwb
         oJfw==
X-Gm-Message-State: AOAM531J4F+CPPVb0uhPqxJ+x8OiWwtqZlxim8i7rxy/vaKG6QuvyOaA
	d0AJthqc4eOR8jBFWeCzJ6x2QA==
X-Google-Smtp-Source: ABdhPJwzttjh3Sf66opnp0RLm4sijT1/d1cr8WMTzMj53jBU4Q58cQaA8yND+kiQl26koDSfbOOXIw==
X-Received: by 2002:a05:622a:1d4:: with SMTP id t20mr31621686qtw.84.1640975648648;
        Fri, 31 Dec 2021 10:34:08 -0800 (PST)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id o5sm17781740qkl.95.2021.12.31.10.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Dec 2021 10:34:08 -0800 (PST)
Date: Fri, 31 Dec 2021 10:33:55 -0800 (PST)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To: Andrew Morton <akpm@linux-foundation.org>
cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
    Mel Gorman <mgorman@techsingularity.net>, Mark Brown <broonie@kernel.org>, 
    Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>, 
    Alexey Avramov <hakavlad@inbox.lv>, Rik van Riel <riel@surriel.com>, 
    Mike Galbraith <efault@gmx.de>, Darrick Wong <djwong@kernel.org>, 
    regressions@lists.linux.dev, Linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
    Linux-MM <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, 
    Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v4 1/1] mm: vmscan: Reduce throttling due to a failure
 to make progress
In-Reply-To: <5c9d7c6b-05cd-4d17-b941-a93d90197cd3@leemhuis.info>
Message-ID: <d11ab9e-c258-a766-baa5-f11e56b7285@google.com>
References: <20211202150614.22440-1-mgorman@techsingularity.net> <caf247ab-f6fe-a3b9-c4b5-7ce17d1d5e43@leemhuis.info> <20211229154553.09dd5bb657bc19d45c3de8dd@linux-foundation.org> <5c9d7c6b-05cd-4d17-b941-a93d90197cd3@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 31 Dec 2021, Thorsten Leemhuis wrote:
> On 30.12.21 00:45, Andrew Morton wrote:
> > On Tue, 28 Dec 2021 11:04:18 +0100 Thorsten Leemhuis <regressions@leemhuis.info> wrote:
> > 
> >> Hi, this is your Linux kernel regression tracker speaking.
> >>
> >> On 02.12.21 16:06, Mel Gorman wrote:
> >>> Mike Galbraith, Alexey Avramov and Darrick Wong all reported similar
> >>> problems due to reclaim throttling for excessive lengths of time.
> >>> In Alexey's case, a memory hog that should go OOM quickly stalls for
> >>> several minutes before stalling. In Mike and Darrick's cases, a small
> >>> memcg environment stalled excessively even though the system had enough
> >>> memory overall.
> >>
> >> Just wondering: this patch afaics is now in -mm and  Linux next for
> >> nearly two weeks. Is that intentional? I had expected it to be mainlined
> >> with the batch of patches Andrew mailed to Linus last week, but it
> >> wasn't among them.
> > 
> > I have it queued for 5.17-rc1.
> > 
> > There is still time to squeeze it into 5.16, just, with a cc:stable. 
> > 
> > Alternatively we could merge it into 5.17-rc1 with a cc:stable, so it
> > will trickle back with less risk to the 5.17 release.
> > 
> > What do people think?
> 
> CCing Linus, to make sure he's aware of this.
> 
> Maybe I'm totally missing something, but I'm a bit confused by what you
> wrote, as the regression afaik was introduced between v5.15..v5.16-rc1.
> So I assume this is what you meant:
> 
> ```
> I have it queued for 5.17-rc1.
> 
> There is still time to squeeze it into 5.16.
> 
> Alternatively we could merge it into 5.17-rc1 with a cc:stable, so it
> will trickle back with less risk to the 5.16 release.
> 
> What do people think?
> ```
> 
> I'll leave the individual risk evaluation of the patch to others. If the
> fix is risky, waiting for 5.17 is fine for me.
> 
> But hmmm, regarding the "could merge it into 5.17-rc1 with a cc:stable"
> idea a remark: is that really "less risk", as your stated?
> 
> If we get it into rc8 (which is still possible, even if a bit hard due
> to the new year festivities), it will get at least one week of testing.

My vote is for it to go into rc8: for me, 5.16-rc reclaim behaves too
oddly without it, so I've simply added it into whatever testing I do
ever since Mel posted - no regressions noticed with it in (aside from
needing the -fix.patch you already added a few weeks ago).

Hugh

> 
> If the fix waits for the next merge window, it all depends on the how
> the timing works out. But it's easy to picture a worst case: the fix is
> only merged on the Friday evening before Linus releases 5.17-rc1 and
> right after it's out makes it into a stable-rc (say a day or two after
> 5.17-rc1 is out) and from there into a 5.16.y release on Thursday. That
> IMHO would mean less days of testing in the end (and there is a weekend
> in this period as well).
> 
> Waiting obviously will also mean that users of 5.16 and 5.16.y will
> likely have to face this regression for at least two and a half weeks,
> unless you send the fix early and Greg backports it before rc1 (which he
> afaics does if there are good reasons). Yes, it's `just` a performance
> regression, so it might not stop anyone from running Linux 5.16 -- but
> it's one that three people separately reported in the 5.16 devel cycle,
> so others will likely encounter it as well if we leave it unfixed in
> 5.16. This will likely annoy some people, especially if they invest time
> in bisecting it, only to find out that the forth iteration of the fix
> for the regression is already available since December the 2nd.
> 
> Ciao, Thorsten
