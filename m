Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA34F13AD02
	for <regressions@lists.linux.dev>; Fri, 19 Apr 2024 19:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713553841; cv=none; b=Turo7xrHtqUYL0DmHCMS0A9u62xszIqmM3+KJusKDLngwY7SX5RleDKeUgpA+KdPmzhyolkr3pQpneW61PaJYaaHOTdXI6+89qF3doGeZfWANC0JAH+e+5uqciFQMaaDzeUJLvwPtVHBdUz5fP7ZjaBMzSnFsfz1D4SCtqx26NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713553841; c=relaxed/simple;
	bh=9nJp5X126w3GqvaWjUP/ZvbDKdqWMmW3+cyfWUwopzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lqPkORCOIsUbl834N3ucpv+m1dSBVqda32rnUP6C/ZBkUKoGNMMj/BZdIWBQ1Hs0E4B4ZtH/xnhvQKnmcsLUz9xvhQ133OGjG/ZaURYM4sXwcM7IaaHi4GOUcU4Nigo/YARUxu23XkiJ/K223/+NEC/Kekd1iM1kOdGcI7CoFBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ghu/RtsL; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ghu/RtsL"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a556d22fa93so279412166b.3
        for <regressions@lists.linux.dev>; Fri, 19 Apr 2024 12:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713553838; x=1714158638; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJFtcGdhGKjEBBpWXj+iy28DWazemVM0Sr/i5zcF/Xc=;
        b=ghu/RtsLmArcy85jq9LfG9TLP5+s01/78ELga8kSf+iW3j75a5kSBi4YdMoc0G5fbg
         7vakS6wD5h7tXmwaMTUVX2dxTjcy9wFNN4rMvI6dHGpNR79CBC0O81gZJstVfXOcL8bZ
         fv+W+NIaV5JoIIGxQkY8WTN/fsN337Ky0mOiQ8ChZN2YvOo1sRkrJUGLDLOycxRit1PR
         h7ERusQrwwQFeMZwDG1Sl0ANz4B53VejhjOkG3qC4X1ktBVgtDSCFFEt/ZY0xiobUF+h
         +7Pu3U9qITpuX9kB+UzwX3Ni6IsqsQgw/uszlJmw30Dv9aLaucOaw9mocQwgZrur7KaO
         ++Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713553838; x=1714158638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJFtcGdhGKjEBBpWXj+iy28DWazemVM0Sr/i5zcF/Xc=;
        b=Zf3CsITj8TsvpOOizWThfcFiYs64CWl4XDjaj7VxaRzoXQbDNYxuc1eJfPK+AItAHw
         1CM+iuiovceOK/dJxf6bvEHVGpcTGn6gXxgvEVDa6aQeYxLwEy4RBFRrRWbhESSGkgMe
         0A/5MxzIpjj8lxNijUi3G4HSmr3bvFD/hZZTPgX8cHgYGXztzG+LRaVgJgrfrxLmV8eN
         9l6JK+aZOGSrYR3Yq23vQO2/wcQENs9uNIFN/8E184xRWeZgqj/GIFjJNCet0AYuVEER
         Z48hltlL5AMoJOtt5UzzDv86I38V2Vm0cvKcM71aXvCdNtQehWh37JvBAA5L4ElQA6ll
         OTPg==
X-Forwarded-Encrypted: i=1; AJvYcCXw2HJUkdqCtdbroI4Az93GfBZKqrN0Q99TOvms5Cf3YWeg29QO9VXDWPTK3cW17+Ngn4QuO78V+y55jF4BAfcm65HuAH360Vt5Yk4=
X-Gm-Message-State: AOJu0Yx0F7nDuZS30dvonnPuQojX46C1EDTYrSuV7EtCQfd9zNMNFAVc
	i9Bp+ubprV5cnaXkEG4ZRLgl9v2Qy9912cI4Qv90BB0tQnsdRqtF0bXMaMR34+JXAam79I+jUn9
	ByLGnfhVTk0VjtW5BElQMekC5rFuewJmQ0ThY
X-Google-Smtp-Source: AGHT+IExSU2QtTRid0+YRFdGQUwOihOm+cSrHE8ZuZNDhhMB/hnR+BAgCzxr8bHrjtAfhnlbAyR5OdrGT+33PVZSQFc=
X-Received: by 2002:a17:907:2d25:b0:a55:358f:783c with SMTP id
 gs37-20020a1709072d2500b00a55358f783cmr2276033ejc.24.1713553837773; Fri, 19
 Apr 2024 12:10:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3iccc6vjl5gminut3lvpl4va2lbnsgku5ei2d7ylftoofy3n2v@gcfdvtsq6dx2>
 <CAKEwX=MZ3jTVpN4g-qrhTn2b0i0C6_M=8BtKt9KEPyFHb+4W2w@mail.gmail.com>
 <CAKEwX=NM1y-K1-Yw=CH3cM-8odER1PZBVoWo-rs7_OdjFG_puw@mail.gmail.com>
 <CAKEwX=MWPUf1NMGdn+1AkRdOUf25ifAbPyoP9zppPTx3U3Tv2Q@mail.gmail.com>
 <246c1f4d-af13-40fa-b968-fbaf36b8f91f@linux.dev> <20240417143324.GA1055428@cmpxchg.org>
 <4c3ppfjxnrqx6g52qvvhqzcc4pated2q5g4mi32l22nwtrkqfq@a4lk6s5zcwvb>
 <20240418124043.GC1055428@cmpxchg.org> <CAJD7tkaPMQqQtfxcLWraz-vnbAxZKxuJRJ7vKuDOCCXtpBSF1A@mail.gmail.com>
 <20240419142231.GD1055428@cmpxchg.org>
In-Reply-To: <20240419142231.GD1055428@cmpxchg.org>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Fri, 19 Apr 2024 12:10:01 -0700
Message-ID: <CAJD7tkYOwO-LLrboSfz-wLJC+FD+ctaJ2KuZoUfiL6S3t0y7ow@mail.gmail.com>
Subject: Re: [REGRESSION] Null pointer dereference while shrinking zswap
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Christian Heusel <christian@heusel.eu>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Nhat Pham <nphamcs@gmail.com>, Seth Jennings <sjenning@redhat.com>, 
	Dan Streetman <ddstreet@ieee.org>, Vitaly Wool <vitaly.wool@konsulko.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, David Runge <dave@sleepmap.de>, 
	"Richard W.M. Jones" <rjones@redhat.com>, Mark W <instruform@gmail.com>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 7:22=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
>
> On Thu, Apr 18, 2024 at 01:09:22PM -0700, Yosry Ahmed wrote:
> > On Thu, Apr 18, 2024 at 5:40=E2=80=AFAM Johannes Weiner <hannes@cmpxchg=
.org> wrote:
> > >
> > > On Wed, Apr 17, 2024 at 07:18:14PM +0200, Christian Heusel wrote:
> > > > On 24/04/17 10:33AM, Johannes Weiner wrote:
> > > > >
> > > > > Christian, can you please test the below patch on top of current
> > > > > upstream?
> > > > >
> > > >
> > > > Hey Johannes,
> > > >
> > > > I have applied your patch on top of 6.9-rc4 and it did solve the cr=
ash for
> > > > me, thanks for hacking together a fix so quickly! =F0=9F=A4=97
> > > >
> > > > Tested-By: Christian Heusel <christian@heusel.eu>
> > >
> > > Thanks for confirming it, and sorry about the breakage.
> > >
> > > Andrew, can you please use the updated changelog below?
> > >
> > > ---
> > >
> > > From 52f67f5fab6a743c2aedfc8e04a582a9d1025c28 Mon Sep 17 00:00:00 200=
1
> > > From: Johannes Weiner <hannes@cmpxchg.org>
> > > Date: Thu, 18 Apr 2024 08:26:28 -0400
> > > Subject: [PATCH] mm: zswap: fix shrinker NULL crash with cgroup_disab=
le=3Dmemory
> > >
> > > Christian reports a NULL deref in zswap that he bisected down to the
> > > zswap shrinker. The issue also cropped up in the bug trackers of
> > > libguestfs [1] and the Red Hat bugzilla [2].
> > >
> > > The problem is that when memcg is disabled with the boot time flag,
> > > the zswap shrinker might get called with sc->memcg =3D=3D NULL. This =
is
> > > okay in many places, like the lruvec operations. But it crashes in
> > > memcg_page_state() - which is only used due to the non-node accountin=
g
> > > of cgroup's the zswap memory to begin with.
> > >
> > > Nhat spotted that the memcg can be NULL in the memcg-disabled case,
> > > and I was then able to reproduce the crash locally as well.
> > >
> > > [1] https://github.com/libguestfs/libguestfs/issues/139
> > > [2] https://bugzilla.redhat.com/show_bug.cgi?id=3D2275252
> > >
> > > Fixes: b5ba474f3f51 ("zswap: shrink zswap pool based on memory pressu=
re")
> > > Cc: stable@vger.kernel.org      [v6.8]
> > > Link: https://lkml.kernel.org/r/20240417143324.GA1055428@cmpxchg.org
> > > Reported-by: Christian Heusel <christian@heusel.eu>
> > > Debugged-by: Nhat Pham <nphamcs@gmail.com>
> > > Suggested-by: Nhat Pham <nphamcs@gmail.com>
> > > Tested-By: Christian Heusel <christian@heusel.eu>
> > > Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
> >
> > Thanks for fixing this. A couple of comments/questions below, but anywa=
y LGTM:
> >
> > Acked-by: Yosry Ahmed <yosryahmed@google.com>
> >
> > > ---
> > >  mm/zswap.c | 25 ++++++++++++++++---------
> > >  1 file changed, 16 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/mm/zswap.c b/mm/zswap.c
> > > index caed028945b0..6f8850c44b61 100644
> > > --- a/mm/zswap.c
> > > +++ b/mm/zswap.c
> > > @@ -1331,15 +1331,22 @@ static unsigned long zswap_shrinker_count(str=
uct shrinker *shrinker,
> > >         if (!gfp_has_io_fs(sc->gfp_mask))
> > >                 return 0;
> > >
> > > -#ifdef CONFIG_MEMCG_KMEM
> > > -       mem_cgroup_flush_stats(memcg);
> > > -       nr_backing =3D memcg_page_state(memcg, MEMCG_ZSWAP_B) >> PAGE=
_SHIFT;
> > > -       nr_stored =3D memcg_page_state(memcg, MEMCG_ZSWAPPED);
> > > -#else
> > > -       /* use pool stats instead of memcg stats */
> > > -       nr_backing =3D zswap_pool_total_size >> PAGE_SHIFT;
> > > -       nr_stored =3D atomic_read(&zswap_nr_stored);
> > > -#endif
> > > +       /*
> > > +        * For memcg, use the cgroup-wide ZSWAP stats since we don't
> > > +        * have them per-node and thus per-lruvec. Careful if memcg i=
s
> > > +        * runtime-disabled: we can get sc->memcg =3D=3D NULL, which =
is ok
> > > +        * for the lruvec, but not for memcg_page_state().
> > > +        *
> > > +        * Without memcg, use the zswap pool-wide metrics.
> > > +        */
> > > +       if (!mem_cgroup_disabled()) {
> >
> > With the current shrinker code, it seems like we cannot get sc->memcg
> > =3D=3D NULL unless mem_cgroup_disabled() is true indeed. However, maybe
> > it's better to check if sc->memcg is not NULL directly instead?
> >
> > This would be more resilient in case the shrinker code changes and
> > passing sc->memcg =3D=3D NULL becomes possible in other cases (e.g. dur=
ing
> > global shrinking). It seems like other shrinkers do this, for example
> > see count_shadow_nodes() and deferred_split_count().
>
> Eh, I'm not sure it's better or worse, so it's a bit hard to care. We
> shouldn't get NULL here when memcg is enabled, and if somebody
> introduces that bug it's better to catch it early than run into subtle
> priority inversions when the kernel is deployed to millions of hosts.

No strong opinion here, I just thought consistency with other
shrinkers would be nice.

>
> > I am also wondering if we should also check !mem_cgroup_is_root()
> > here? We can avoid the expensive global flush and use the global stats
> > directly in this case. I could also send a follow up patch for this if
> > that's preferred.
>
> I'd rather not proliferate more memcg internals in this code. If this
> is a concern, optimizing it in the flush and stat functions would make
> more sense. Reclaim already flushes the subtree before getting here,
> so odds are good this is a no-op in most cases.

I agree that with per-memcg thresholding, it is very unlikely that
this flush does anything.

FWIW, if it turns out to be a problem, optimizing it in the flush
functions would not be as straightforward, because the memcg code is
not aware that zswap has up-to-date global versions of the stats.

Anyway, let's table this until someone actually complains, just seemed
to me like a low hanging fruit.
