Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D409A2110E
	for <regressions@lists.linux.dev>; Thu,  3 Oct 2024 05:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727933933; cv=none; b=G35yDbY71ofDOv4LTUL1BoKqENt/Fee1Dqz4OA62JCs/2S9oFqUZbYzvqWnfOCpvk+yb7BCitb5J4NxT4jurODaG7gJN5ZevSYSSgkCHN9v7HS38x0047ap72tpJ6EDU2ktir0OiEurPdqgkL2wulKzWvgJXTCulgt2q/PBLmPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727933933; c=relaxed/simple;
	bh=oe0+JV1VGmH2Oziz0rDxTc69NeKMoL9ldZaw4FEpcBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N6VG01vJY7cW4rpgZtAsry15wZjeEv/KU9OBxpgMHeia9Lk+R+ZZOiN40ymmdbNvO2iCuJdo99jOPM9pAkmDt1TOVtYL0UMs4BeVrzqhADYUIJOPA1qhCS5jc/xvX1C4tLNuYLRjZvoxiaRWdR9/VjpwgkK62TwK9GzP9GO99xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PSW7lTOw; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PSW7lTOw"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-84e873a454fso150518241.0
        for <regressions@lists.linux.dev>; Wed, 02 Oct 2024 22:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727933931; x=1728538731; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f5vUbpgAuf4ukV4d+K3A2JqlzY0GqMqBxJh0u41jQac=;
        b=PSW7lTOwcx+/7rrh8RMvGWW7BHCTXf6s/U4iCM42mhBHVYTemSz8KRWhz/pfLHqlQR
         y04QK1ramFYr9Kpko9w+tRQCNY/rVcxoSafPi7GEE1wyu1EZkVd5Gg4ssmjYpCZOD95u
         I7YzaBDBtvOS0jnzeJsRmTmUBNeOYMTICOFE+GDjJws4L4oxSb6MFGWnB/WQYKE2qvp8
         FP8uLt64XQ8cXewTuqRF+nppMPjzbhczPeTg4B+r4cw+UxC8UVXVBm6yt8Yc8vhlyQAx
         vaPbX5tyMYF6ctoa7nE9kbkbqQIwq2AzQ5IK6XQqlNxokPmh0U2dODDV6uahbuVsaKf/
         aOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727933931; x=1728538731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5vUbpgAuf4ukV4d+K3A2JqlzY0GqMqBxJh0u41jQac=;
        b=ooF/9mNa3/20O4LCRYevjY8gPCqmr0xJuiMdip/thj79L/VQ5sMsNAyvYJhFpG2UZo
         xWa5Z9/gV+q4yQUIzhESFrm9e5VT1vHZnE66gZnl8n+9O1IS8znf5c6mh28cH8twipVq
         sMLGazakKSY5IPucT4mKqyC69mMnqDNWh8wjDW8SNSJDKq8LUMx3za1Ub3qObfFmv+2V
         0Wb2w++f6+R+3RLQ+V/pHmlSR2fDaVe218spJueeg5OvnWr6ZFTLmtgjpB4UvNBoLHi+
         2sffMh5Ce/zG7uavH8Tg2QGLrveIFTRiN+FDB8OYiuUHrkAlMpz+DNdgMESsAGqdgSjt
         tYZw==
X-Forwarded-Encrypted: i=1; AJvYcCWVW4As7CVY+kKm0XPb7mWZVj5ZlvtqLdN7LjnGz/IL9LNUUru7VbiwgXHGbpIewWbq20xrXsbGaAd5og==@lists.linux.dev
X-Gm-Message-State: AOJu0YxW7PasGLbqdgtTMLqxnMlvhKQyekswe3lvD467ceh9SS+d2mr7
	OWK9aLq5LDmqlVq69nIsKBd6GJoxZ50siyGAXkoAGg4Rgp1QFGkMrssvYy0AyWGTflhPtS8L7SJ
	IdZMCT8N7TETVGrg2D7wZfRpCJ+fmqJ2QIOb2g9N8XIzTReuV
X-Google-Smtp-Source: AGHT+IE/udGm3ds/9p2RO6rOSEFkpb2M7UEn+Fb2vf0HPMu89AA8Y6YrRw6hQK0Vrjj2Jj6Mauzen3zuBjj6b49BXG0=
X-Received: by 2002:a05:6102:c46:b0:4a3:cfa9:6c84 with SMTP id
 ada2fe7eead31-4a3e680c40dmr4484322137.3.1727933930644; Wed, 02 Oct 2024
 22:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvo5npQ3o_vgiOX2guHtgafRoFPL__4O8Kcwg2=ssXmKg@mail.gmail.com>
 <e718bc99-e63b-4adb-9e40-2379f48301f5@stanley.mountain> <b22dbfe2-dd29-40de-a4a3-4a0d6b55cd65@stanley.mountain>
 <62a65418-2393-40ec-b462-151605a5efcf@stanley.mountain>
In-Reply-To: <62a65418-2393-40ec-b462-151605a5efcf@stanley.mountain>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 3 Oct 2024 11:08:39 +0530
Message-ID: <CA+G9fYvdzY+vWhPKPmyPDJNDqvH7AaU4HfKTFtgUwU+KTrD9_Q@mail.gmail.com>
Subject: Re: next-20241001: WARNING: at mm/list_lru.c:77 list_lru_del
 (mm/list_lru.c:212 mm/list_lru.c:200)
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Kairui Song <kasong@tencent.com>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	linux-mm <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Oct 2024 at 16:58, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Wed, Oct 02, 2024 at 02:25:34PM +0300, Dan Carpenter wrote:
> > On Wed, Oct 02, 2024 at 02:24:20PM +0300, Dan Carpenter wrote:
> > > Let's add Kairui Song to the  CC list.
> > >
> > > One simple thing is that we should add a READ_ONCE() to the comparison.  Naresh,
> > > could you test the attached diff?  I don't know that it will fix it but it's
> > > worth checking the easy stuff first.
> > >
> >
> > Actually that's not right.  Let me write a different patch.
>
> Try this one.
>

Thanks for the patch,

I have applied this patch and testing is in progress.
From last night the tests running in a loop did not find the reported warning.


> regards,
> dan carpenter
>
> diff --git a/mm/list_lru.c b/mm/list_lru.c
> index 79c2d21504a2..2c429578ed31 100644
> --- a/mm/list_lru.c
> +++ b/mm/list_lru.c
> @@ -65,6 +65,7 @@ lock_list_lru_of_memcg(struct list_lru *lru, int nid, struct mem_cgroup *memcg,
>                        bool irq, bool skip_empty)
>  {
>         struct list_lru_one *l;
> +       long nr_items;
>         rcu_read_lock();
>  again:
>         l = list_lru_from_memcg_idx(lru, nid, memcg_kmem_id(memcg));
> @@ -73,8 +74,9 @@ lock_list_lru_of_memcg(struct list_lru *lru, int nid, struct mem_cgroup *memcg,
>                         spin_lock_irq(&l->lock);
>                 else
>                         spin_lock(&l->lock);
> -               if (likely(READ_ONCE(l->nr_items) != LONG_MIN)) {
> -                       WARN_ON(l->nr_items < 0);
> +               nr_items = READ_ONCE(l->nr_items);
> +               if (likely(nr_items != LONG_MIN)) {
> +                       WARN_ON(nr_items < 0);
>                         rcu_read_unlock();
>                         return l;
>                 }

- Naresh
