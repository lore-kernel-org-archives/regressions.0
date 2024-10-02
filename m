Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503281D1F44
	for <regressions@lists.linux.dev>; Wed,  2 Oct 2024 18:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727895518; cv=none; b=oBHCsTGHhBbVwnRyHyQ0jlmFSoE28tDaZL8BUf6PyWzEWddsycg1Y48ZkERg3XeGiEPr9GTYYkWo/2Yz67a8bNsPPaI3FA2nHGWFr9t9lBaTkITT0Qhc6tgOYjEZL9cW8TKQr3aHIL1xqoyewvfj/ZS//AoDFpqXtdmKvHRmyWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727895518; c=relaxed/simple;
	bh=HdVxj2tTqKMeexd/LoAX7UMbVSiPUees+wGzRpjW6MM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kdt+j2Gvou8exqNbFX0zhuoSMi9Oxr7RG6Vw38VaAqwduQReBWyett2R0by2q/NkQdxSHb06gVMNKCWqMFN4CBa16r/PvyOGmJADoge57o11lATDWn2sbG+bOLRjrM83jzrkVGka7FgN431dspD15oE8Eh8Uo32/GV7DRhKA2xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9K3ipw6; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9K3ipw6"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fac3f20f1dso1405401fa.3
        for <regressions@lists.linux.dev>; Wed, 02 Oct 2024 11:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727895515; x=1728500315; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJihvFLY+/PB1Gfvqw4s7qDkzZW2UtDYa8qi2yTs9+c=;
        b=W9K3ipw6XnnEcjZ3m/5gv85RGjW3oYNQyH8Hk7huE42dF89b3FHh6i9kNEZEaTcT7C
         7//EXrTfRv6qht3LOYV1o085ICWOIBoe73HvbKvYHfzk3zl4VCJns8mtIEP8cSfAELBJ
         KipXP5hq34fTglcJqIwj6/eUSc6ZBkFfH8Lv1VCDyFgbd5F1chpUHHv9NK+kvYALnbxC
         ALPLtyqfeJaPGJYvS1eSb4ee0WF9W3LBc61d3IGrJmtHx4UMwcMfkqeoUByIB1zkT/5+
         7cPlikySJEt67EbNOBNBOLy7+B6Ih5jyWY7JMgo0WJlvOI8tdU71AzPulP+YFF1FCTKj
         zmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727895515; x=1728500315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJihvFLY+/PB1Gfvqw4s7qDkzZW2UtDYa8qi2yTs9+c=;
        b=R2g+qTPfkD9/1QN9MISj8WHICj5hVlPRbQeg4whyF2y5bMRp1OjHpJzpa+00ckj0DJ
         cC5Lsz212gzPuMd8vbfaU/X4RqxCXRo9prYhenoAJcrEjg/ZMzbrKh4P6mBXseYsLSW2
         lX6EYdkUw+zzAsrOqVoyhD/tmg03lLKe/+0bdk5ntG43kRYiSGp2f6K3P2wRS4Vp8jUo
         lLwa42H13XxoE7h8cLTDmPurht0g6rlrE3h5u4CyuwMoEKvssnXyyiunur4YSB6MtL6i
         WJTdG5egaSuDCRitlyBEq4WEG4Jdef9AvIEYvT3XvYIWZSV88tKMxByuyE4gWRvSaYfu
         4NjA==
X-Forwarded-Encrypted: i=1; AJvYcCXb21Gmx2cvFk1Lsl3BvpQxxqUy+/KZe0fnbopyxjnuJ2yWP2OskS6tiKueE/myuE3f+wzfFF3pAFPcrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRzJYhoDBG74tqHPse8NFuHW/9XSqwBGGuY0m82Q5RwDnoGze9
	8ogVDJ7Q8SICHD/jw2zOqjkOlCVzfjuBSblvHHMK4PJLUG+OtnaS/qElFgfZGi2bUQZQSxPwL5T
	sAgWweFcWH/6LsaExPbYl7K2rawM=
X-Google-Smtp-Source: AGHT+IH8MpcRdjd9DhqsAwLkZKoQVw1e6Q6fMrgqRcM0MtqUumsbTF1Cw4qA/fQw5PWFfIakZctyS6QFiOvCg1HPfV8=
X-Received: by 2002:a2e:e09:0:b0:2fa:ded3:f6aa with SMTP id
 38308e7fff4ca-2fae1023cccmr21302301fa.20.1727895515241; Wed, 02 Oct 2024
 11:58:35 -0700 (PDT)
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
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 3 Oct 2024 02:58:19 +0800
Message-ID: <CAMgjq7CapiW2h2pzcKQBhwf_5rs5fgMGHw1E2YJYwEiY6zc=LQ@mail.gmail.com>
Subject: Re: next-20241001: WARNING: at mm/list_lru.c:77 list_lru_del
 (mm/list_lru.c:212 mm/list_lru.c:200)
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	linux-mm <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 7:28=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Wed, Oct 02, 2024 at 02:25:34PM +0300, Dan Carpenter wrote:
> > On Wed, Oct 02, 2024 at 02:24:20PM +0300, Dan Carpenter wrote:
> > > Let's add Kairui Song to the  CC list.
> > >
> > > One simple thing is that we should add a READ_ONCE() to the compariso=
n.  Naresh,
> > > could you test the attached diff?  I don't know that it will fix it b=
ut it's
> > > worth checking the easy stuff first.
> > >
> >
> > Actually that's not right.  Let me write a different patch.
>
> Try this one.
>
> regards,
> dan carpenter
>
> diff --git a/mm/list_lru.c b/mm/list_lru.c
> index 79c2d21504a2..2c429578ed31 100644
> --- a/mm/list_lru.c
> +++ b/mm/list_lru.c
> @@ -65,6 +65,7 @@ lock_list_lru_of_memcg(struct list_lru *lru, int nid, s=
truct mem_cgroup *memcg,
>                        bool irq, bool skip_empty)
>  {
>         struct list_lru_one *l;
> +       long nr_items;
>         rcu_read_lock();
>  again:
>         l =3D list_lru_from_memcg_idx(lru, nid, memcg_kmem_id(memcg));
> @@ -73,8 +74,9 @@ lock_list_lru_of_memcg(struct list_lru *lru, int nid, s=
truct mem_cgroup *memcg,
>                         spin_lock_irq(&l->lock);
>                 else
>                         spin_lock(&l->lock);
> -               if (likely(READ_ONCE(l->nr_items) !=3D LONG_MIN)) {
> -                       WARN_ON(l->nr_items < 0);
> +               nr_items =3D READ_ONCE(l->nr_items);
> +               if (likely(nr_items !=3D LONG_MIN)) {
> +                       WARN_ON(nr_items < 0);
>                         rcu_read_unlock();
>                         return l;
>                 }
>

Thanks. The warning is a new added sanity check, I'm not sure if this
WARN_ON triggered by an existing list_lru leak or if it's a new issue.

And unfortunately so far I can't reproduce it locally on my ARM
machine, it should be easily reproducible according to the
description. And if the WARN only triggered once, and only during
boot, mayce some static data wasn't initialized correctly? Or the
enablement of memcg caused some list_lru leak
(mem_cgroup_from_slab_obj changed from returning NULL to returning
actual memcg, so a item added to rootcg before will be attempt removed
from actual memcg, seems a real race). If it's the latter case, then
it's an existing issue caught by the new sanity check.

The READ_ONCE patch may be worth trying, I'll also try to do more
debugging on this and try to send a fix later.
