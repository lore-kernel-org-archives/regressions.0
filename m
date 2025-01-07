Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630201DED74
	for <regressions@lists.linux.dev>; Tue,  7 Jan 2025 11:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736250078; cv=none; b=dJooBCThK5vswFC8I2Yeo0SMUCIpoPJg3P3yhOEpcP07mmUF0NkvpRahiWcHIIxsWqx0xEvocfBd8ZVIjKAu+W6Js9c29pL5dgy/Yk/j3Tgkyb79vDfQHltT7CHHcopGoEsqsSSxX25Sq+RwYN8rSfH4R7OgVz7aW5KfobNVvCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736250078; c=relaxed/simple;
	bh=0pza3bwk5VB8BW9/XtO0Too3nId4ZFh7bd0shAKjjR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/FiR8YJVasFpmpX1idl11BOFxyIha6H59Hgxhcn+ipXFCuAMCieLeRenUhkwxhwiqlrHpDcsAGxhBzUaDCvc568Ga3LhZZ+iWuLdlGGUh1f+CwrioisN1jbBHy45RLby5+Lr/y2anyCN0WBCrYhKeaw9Gx4C3Jtxt/D93ayANU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vQigwj9D; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vQigwj9D"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4b10dd44c8bso4331924137.3
        for <regressions@lists.linux.dev>; Tue, 07 Jan 2025 03:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736250073; x=1736854873; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p0U6xR+KMJ/ZDNg9k+5YwQ1r7WvfsnOjA6ep33rXvR4=;
        b=vQigwj9DX9WBlZ74UIr40WTr6mUyLd92netrL6pI16ymNpyueily6B1SrIah5ALEUm
         JA2JQ/wOUoQFtbMws0xJ2zPZOV8OsANAaSWg3U7vTlV0PqXsB/n1bgq+tuyabDr8RZaP
         SEmuXNOMdqItHJKtsjqWnvZYdOssYHr32L4IHBu84MXnD4BvGUG2pmq6bCZ2nzX9ka+L
         8z3/IWuKsdxNui9KKrcB9B4KOZ1HD2QZc6sM6AnWcDj37P5NOUiO6uX01/m+l/aulJlz
         INQiBs44XnADb8QZPbA6mmha8RocaQJ0brYExafoYNndJL/kM4t42M3t3J5PVDA8daPr
         ieFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736250073; x=1736854873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0U6xR+KMJ/ZDNg9k+5YwQ1r7WvfsnOjA6ep33rXvR4=;
        b=OPQ7U5MufJBSJ+MWlYqEWqz4ayRZsDw7rhKo75tJjK6fCwLY27iPz3DC+L5ZzV88u0
         ApDzkBAcEOYpeGY7msZrIXfP8Y3Gz2uozGhjx/nlVIVn1QX7ZtYLfxFEd79A6pvtUrc2
         rOeqUCXwdS507vcO+Uc+FSGY4GLbHcqJaSHD75ypeAvgLBQlQBqYMO/KvKfHYi/FA3dQ
         vy/HbRZICj9bJBReRRm9fkjp9Gh/8993ObsQa6CiG17S9Ue2rB1gcn4MT+jxqZmCjnfg
         L0ruby7HtLIF3ZIzhkVuFOzdYhFRF+oELh9K+un2qHcC8MHDulLVbzfq7fVEpjug6xjq
         Kvjg==
X-Forwarded-Encrypted: i=1; AJvYcCW+Tr9jMTZgl8Spc8EsvocJrbDeD671orGxSi7Buzb11CnfHRn1/7vZe0SO83NPbq+iENFxVvhwVKl9Mw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZiuzrezzXK2Y9VpBJMEW3BX15Q4fpS3vVrp4SZd6A8lWpuW1R
	pY5Kt0pg9asVzwAiAYV87UzrA5yVyhZ++H7F27cbr48euguh7W53pQb1Md0Z1hHqlesZmxE3Ebu
	isOA+DCmmZajZNm5ZU5iWMXHKhPpnUNXtKI3WUg==
X-Gm-Gg: ASbGncu3VY3BTPq4fWgzh4gfKYw4K9yack4hMGoGZiJLv4vGhwnRReuyAV1vJcJ+BSh
	8NZOo7+FRjNaZAfNVHrEnyC0G/9OS6zD/ZCI4gGw=
X-Google-Smtp-Source: AGHT+IFlrZGEmTLCdRSkS8bxaWr/+Iy+4mFrJw/0APd/FQcIexe2OfzgbAXEcUybds18TRaa22+7xMfF3e2oAA6kj8A=
X-Received: by 2002:a05:6102:50a7:b0:4b2:cbe5:fbc5 with SMTP id
 ada2fe7eead31-4b2cc462478mr48491328137.20.1736250073246; Tue, 07 Jan 2025
 03:41:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYsQmFT3m1J0uGfWGJjci8MQoB7BNcmhBR175PAbxx9fBg@mail.gmail.com>
In-Reply-To: <CA+G9fYsQmFT3m1J0uGfWGJjci8MQoB7BNcmhBR175PAbxx9fBg@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 7 Jan 2025 17:11:02 +0530
X-Gm-Features: AbW1kvYCfezhjbMbtQ_nJkahyeD4N9-Jae2I7ouGzU7ede-dxwkC-kxAeSWqs4M
Message-ID: <CA+G9fYt3KUxWNkUbYaDtEL+Nj7fwKRq2eWj-KdVi7+AWFzrJ2Q@mail.gmail.com>
Subject: Re: WARNING: CPU: 1 PID: 23 at kernel/workqueue.c:4317 enable_work
 (kernel/workqueue.c:4317 (discriminator 1) kernel/workqueue.c:4488
 (discriminator 1))
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-mm <linux-mm@kvack.org>
Cc: Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Jan 2025 at 23:45, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The following warnings have been noticed on today's Linux next kernel
> on the arm64, x86 and arm devices.
>
> This is first seen on next-20250106.
> GOOD: next-20241220
> BAD: next-20250106
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Boot warnings logs:
> ===============
> [    0.132875] workqueue: work disable count underflowed
> [    0.137989] WARNING: CPU: 1 PID: 23 at kernel/workqueue.c:4317
> enable_work (kernel/workqueue.c:4317 (discriminator 1)
> kernel/workqueue.c:4488 (discriminator 1))
> [    0.146001] Modules linked in:
> [    0.149098] CPU: 1 UID: 0 PID: 23 Comm: cpuhp/1 Not tainted
> 6.13.0-rc5-next-20250106 #1
> [    0.157180] Hardware name: Thundercomm Dragonboard 845c (DT)
> [    0.162892] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.169918] pc : enable_work (kernel/workqueue.c:4317
> (discriminator 1) kernel/workqueue.c:4488 (discriminator 1))
> [    0.173886] lr : enable_work (kernel/workqueue.c:4317
> (discriminator 1) kernel/workqueue.c:4488 (discriminator 1))
>

Anders bisected this regression and found the bad commit,

# first bad commit:
    [adcfb264c3ed51fbbf5068ddf10d309a63683868]
     vmstat: disable vmstat_work on vmstat_cpu_down_prep()

Git bisect log,
-----------
# bad: [9d89551994a430b50c4fffcb1e617a057fa76e20] Linux 6.13-rc6
# good: [fc033cf25e612e840e545f8d5ad2edd6ba613ed5] Linux 6.13-rc5
git bisect start 'v6.13-rc6' 'v6.13-rc5'
# good: [ee063c23e48212a6af163f8d45560a92fcaec125] Merge tag
'nios2_update_for_v6.14' of
git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux
git bisect good ee063c23e48212a6af163f8d45560a92fcaec125
# good: [a984e234fcdce25a276be882c799e5fda1b32812] Merge tag
'io_uring-6.13-20250103' of git://git.kernel.dk/linux
git bisect good a984e234fcdce25a276be882c799e5fda1b32812
# good: [7a5b6fc8bd70cbb22b1e9eacd7edaf5626e9fc74] Merge tag
'clk-fixes-for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux
git bisect good 7a5b6fc8bd70cbb22b1e9eacd7edaf5626e9fc74
# good: [d0e6983a6d1719738cf8d13982a68094f0a1872a] mm: shmem: fix
incorrect index alignment for within_size policy
git bisect good d0e6983a6d1719738cf8d13982a68094f0a1872a
# bad: [0210d251162f4033350a94a43f95b1c39ec84a90] scripts/sorttable:
fix orc_sort_cmp() to maintain symmetry and transitivity
git bisect bad 0210d251162f4033350a94a43f95b1c39ec84a90
# bad: [8debfc5b1aa569d3d2ac836af2553da037611c61] mm/damon/core: fix
new damon_target objects leaks on damon_commit_targets()
git bisect bad 8debfc5b1aa569d3d2ac836af2553da037611c61
# bad: [adcfb264c3ed51fbbf5068ddf10d309a63683868] vmstat: disable
vmstat_work on vmstat_cpu_down_prep()
git bisect bad adcfb264c3ed51fbbf5068ddf10d309a63683868
# good: [d77b90d2b2642655b5f60953c36ad887257e1802] mm: shmem: fix the
update of 'shmem_falloc->nr_unswapped'
git bisect good d77b90d2b2642655b5f60953c36ad887257e1802
# first bad commit: [adcfb264c3ed51fbbf5068ddf10d309a63683868] vmstat:
disable vmstat_work on vmstat_cpu_down_prep()

- Naresh
