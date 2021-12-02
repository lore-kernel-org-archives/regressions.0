Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87932C9D
	for <regressions@lists.linux.dev>; Thu,  2 Dec 2021 16:31:04 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id k2so786900lji.4
        for <regressions@lists.linux.dev>; Thu, 02 Dec 2021 08:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yGi7LIeuTdgZBFGen8AUJZNWTMwudrol6LbQe/Ktdd4=;
        b=kx1WWPNOnTyu2Su02F81AoeoOYfuXh7LGJ97vrlfiXWYVAACw5Sf0CY23J47o6lDP3
         EJpIk2t5t4/CXvC0UBUUa9sHppwc8pum5zDupnF2RJbwfR0wdkvg44koDf/TcHB9sMbh
         B0NpBbDIE896MiT2sev9n1Wwm85WCsoZBMjX4tLBZXuFCHoQrpONMPh7WPU1Vs9Dh686
         VBksvf1VEilgKBupFH7Nvx4l/NNfPVS5+yoHqKZ+IYBYMoON4xKYgxJ443leQwbyf9WP
         RmzV3gPk/toknMAUaV0JCjyan1Fz1btLii2S8vSXk4fkucpMQGYfrfMiWCE7n0vW1z/9
         WMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yGi7LIeuTdgZBFGen8AUJZNWTMwudrol6LbQe/Ktdd4=;
        b=SzZbMmFn0234Ychap/PeI1Tc4lUEP0jW8N3WuhXiofvFg7Wxx6BPD9i7ly/ErVv/K9
         8skl+th24ievGSXuI9VJoWrpgvFHUuocIXO7hyWzdGElbqw5StcNV+3YKCDnjpH/IU0y
         RMttEbcM4w3rrhPUzj4NNOmI6bWcceoFeZpNg4XX+qGiZ5S/AHOHBM3EsxcCCPr4k4KI
         P/XcD6aAbwG546SB1dGQC63js5YY8yBkPX/JhO2OwKaDz4f96OKzJitRSUVZ7re3GMXy
         7+FN48+ewQWpWbJNnrqUZHIRmu7EmqycaDT8vdtOqSAlqIjs96r43ZNW88bBmk5ha1aK
         QUOw==
X-Gm-Message-State: AOAM531uZGL/no/G79xdSEWtDZLG97QHULanD2jwMAMSPlAp5yL/kREb
	m/VuIvtm4RvjoE/ThJz4yeq7n+z6ohr1ffzTd0sK8Q==
X-Google-Smtp-Source: ABdhPJydE37/YC3YcGsTbHv6XoqsBV4zF8xWP0hW8aluolTigJtBPrZTQ54xcXdEgBBd2cEWf/4xlCJqVwEekjJ0BDo=
X-Received: by 2002:a2e:bc1b:: with SMTP id b27mr12957864ljf.91.1638462662631;
 Thu, 02 Dec 2021 08:31:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211202150614.22440-1-mgorman@techsingularity.net>
In-Reply-To: <20211202150614.22440-1-mgorman@techsingularity.net>
From: Shakeel Butt <shakeelb@google.com>
Date: Thu, 2 Dec 2021 08:30:51 -0800
Message-ID: <CALvZod6am_QrZCSf_de6eyzbOtKnWuL1CQZVn+srQVt20cnpFg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] mm: vmscan: Reduce throttling due to a failure to
 make progress
To: Mel Gorman <mgorman@techsingularity.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Alexey Avramov <hakavlad@inbox.lv>, Rik van Riel <riel@surriel.com>, 
	Mike Galbraith <efault@gmx.de>, Darrick Wong <djwong@kernel.org>, regressions@lists.linux.dev, 
	Linux-fsdevel <linux-fsdevel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Mel,

On Thu, Dec 2, 2021 at 7:07 AM Mel Gorman <mgorman@techsingularity.net> wrote:
>
> Mike Galbraith, Alexey Avramov and Darrick Wong all reported similar
> problems due to reclaim throttling for excessive lengths of time.
> In Alexey's case, a memory hog that should go OOM quickly stalls for
> several minutes before stalling. In Mike and Darrick's cases, a small
> memcg environment stalled excessively even though the system had enough
> memory overall.
>
> Commit 69392a403f49 ("mm/vmscan: throttle reclaim when no progress is being
> made") introduced the problem although commit a19594ca4a8b ("mm/vmscan:
> increase the timeout if page reclaim is not making progress") made it
> worse. Systems at or near an OOM state that cannot be recovered must
> reach OOM quickly and memcg should kill tasks if a memcg is near OOM.
>

Is there a reason we can't simply revert 69392a403f49 instead of adding
more code/heuristics? Looking more into 69392a403f49, I don't think the
code and commit message are in sync.

For the memcg reclaim, instead of just removing congestion_wait or
replacing it with schedule_timeout in mem_cgroup_force_empty(), why
change the behavior of all memcg reclaim. Also this patch effectively
reverts that behavior of 69392a403f49.

For direct reclaimers under global pressure, why is page allocator a bad
place for stalling on no progress reclaim? IMHO the callers of the
reclaim should decide what to do if reclaim is not making progress.

thanks,
Shakeel
