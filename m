Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDD8173
	for <regressions@lists.linux.dev>; Fri, 31 Dec 2021 21:18:30 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id f5so112221726edq.6
        for <regressions@lists.linux.dev>; Fri, 31 Dec 2021 13:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DyekG4kFjnr+PJmkJt2my9Q9IwijxrDikfprPRjgUB0=;
        b=I5RBhHI6Fk4znjKVzEGRQq7L/KIfGQBjt1zOGbjgwZJCRL/LGtR6UgIe0z3Fc9FipS
         fcId7ZLwJ++9KoZ7D84Kj1l7M5k/OMtDUiz1hpNTc+6N9jrL4yxMpBk7Ib4WUdM/mtMD
         jVoOLnqLDEyPuenZk2xfAkKtwiZz0SHDpR7Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DyekG4kFjnr+PJmkJt2my9Q9IwijxrDikfprPRjgUB0=;
        b=Lzr6irrqX+/CeCmVrzyunLtPycqXRuds7wn4RfUwuq9wCnGyE+Gk/FebyEMD2+oby3
         U+/wJSjWs+V4H6m5J7zCr08wvewqBkFbDPAHLyrYeIJdKzJOb2dCcjabT4eYaGjwXniO
         Oi+xcRwiGe1vaJRxpwNQMtJHdDlz2FV4z1CL3Z5nZDail9+lSrTAe+Sap8mTJ3xa4ETX
         5wnqMjzjfy9xdStNhe3A02NWlLP6oISx7pRYYA8yHZdsnRe/ogx46FCyrsgQR6HXY348
         cL581jhMlBHX85TzphVqd3sACQBTKhxQQVajrYI9C8lLjEDFoc5dSLVXIjLTxO4l9LXj
         SJJw==
X-Gm-Message-State: AOAM532i/RoZY0REb7xz63e1JZOW2svxYjv7fbrSWu81ZF6Lwq5zLl9M
	rzrmOKUbD/eLFXLJmogk4/nIZAZ67rJMh+duEYA=
X-Google-Smtp-Source: ABdhPJzx3dtM4vtLeW0UT1Xc9eqrzh3XfiWmav1pQyhR96Yy1iy3Pg0sCJ3Y9X/6rIYhcBolrpa9sg==
X-Received: by 2002:a05:6402:1908:: with SMTP id e8mr35923445edz.22.1640985508606;
        Fri, 31 Dec 2021 13:18:28 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id n3sm10867146edw.58.2021.12.31.13.18.28
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Dec 2021 13:18:28 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id r17so57683719wrc.3
        for <regressions@lists.linux.dev>; Fri, 31 Dec 2021 13:18:28 -0800 (PST)
X-Received: by 2002:adf:f54e:: with SMTP id j14mr29913691wrp.442.1640985507933;
 Fri, 31 Dec 2021 13:18:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211202150614.22440-1-mgorman@techsingularity.net>
 <caf247ab-f6fe-a3b9-c4b5-7ce17d1d5e43@leemhuis.info> <20211229154553.09dd5bb657bc19d45c3de8dd@linux-foundation.org>
 <5c9d7c6b-05cd-4d17-b941-a93d90197cd3@leemhuis.info> <CAHk-=wi3z_aFJ7kkJb+GDLzUMAzxYMRpVzuMRh5QFaFJnhGydA@mail.gmail.com>
 <CAHk-=whj9ZWJ2Fmv2vY-NAB_nR-KgpzpRx6Oxs=ayyTEN7E8zw@mail.gmail.com> <20211231130427.2239793015906a1c1ede44a4@linux-foundation.org>
In-Reply-To: <20211231130427.2239793015906a1c1ede44a4@linux-foundation.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 31 Dec 2021 13:18:11 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjvmT-Gx875NvvZfZau+7Vx5h9VhBwdoLnw_Et_HyKfWg@mail.gmail.com>
Message-ID: <CAHk-=wjvmT-Gx875NvvZfZau+7Vx5h9VhBwdoLnw_Et_HyKfWg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] mm: vmscan: Reduce throttling due to a failure to
 make progress
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Mel Gorman <mgorman@techsingularity.net>, 
	Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Alexey Avramov <hakavlad@inbox.lv>, Rik van Riel <riel@surriel.com>, Mike Galbraith <efault@gmx.de>, 
	Darrick Wong <djwong@kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	Linux-MM <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 31, 2021 at 1:04 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> Needs this fixup, which I shall tweak a bit then send formally
> in a few minutes.

Thanks, applied.

           Linus
