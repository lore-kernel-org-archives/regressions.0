Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEFE181D0D
	for <regressions@lists.linux.dev>; Tue,  9 Jul 2024 15:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720539599; cv=none; b=QU6WzthQrdLaUYaa0KWmlfbMCmF2cj+H97ob0LXJ7sFIv0uKOfrqNH9PWIpj2ia+AoA0yLV2uPAaxp2EB3Yjhc/339K8S6F9i7BabzE/0asCFz4TYkhCcu/UOf4zSApDik+PMR2I5RMfQ/J39N7m77+VETs3HPZ/03Q/B526XYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720539599; c=relaxed/simple;
	bh=lO0EXZ8u0doWqiDCNT6UGt6hepafHZ/DVaQMdYvBbhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bj1OyQNQJ3OcYoO30LycieN9YlH3MEiHRp9hSh/02+Daed0i07iM9qRzm4nQH2MjSBPNiv22hE9PUSIPEIQscNKK5Jkup9f6XOixE4BadGJe6/Ug5Wng5nSJu1VX/r+3vFjb2WUGrZrjCWViDT9uIB0RksTpKaoR9NTSApLaA8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oHviAJ90; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oHviAJ90"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-36785e72a48so3141902f8f.3
        for <regressions@lists.linux.dev>; Tue, 09 Jul 2024 08:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720539596; x=1721144396; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ij3mKo3zmTBAVQWjsn142BPPHP7peJhFQ7Yp10RsABY=;
        b=oHviAJ90Fa8sbyP3vwQBSin2xVpOSact48JiS2Aw5LRk/WBP1SWKvAMnA3sK9oabcR
         iCp4MfxRtVGwLx0muunW0bGpIdnRVY+g8tDDtctrGBRWmjvDBTiXVqKXn5+N0M/R42qz
         1uqBMX7eJ5UsCQOFVxe5lOljm61Lua4t4Bo4vHgSvTXDcHiCTdLP/TBDO50tuhP4hyzC
         cOZ568P/qdpqV8irN5Rkmr8dJF/ZYwbs/Iz3b6+QoqHL+fpiyo6huNH0R5HG8FyvEQc7
         BAVE3hn7woJCFagduWbAqDBvDwxYdxpBJ1tBaObgKcvZpS1OSRRHpWIrYizeIPvvmUBJ
         jjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720539596; x=1721144396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ij3mKo3zmTBAVQWjsn142BPPHP7peJhFQ7Yp10RsABY=;
        b=ar6KNKffwwo6o/+kloVTK/yXOwy/8c3KbYMojdKkne6BnLCV0p6Q1nDrkNVJ0aAyRZ
         h8NUVwDFCYOVtf6Xzabt8vaVNw2XTb2pbJ5uTWZ4162uJ9nOwBrXz+D4u09PDWqAuAEV
         3q3wztfP1/a2WH6N/wd7BXfOYt26/OZ83kXpmKuMDJqXioDYZUNawl0BVnaZdmvs3j2S
         xGGTgpC0HfizqpyJzKrZCceKCXz4gLGt8XeBsyIMmeell/z47/Ws1nB5qyMH98kyhD22
         c9yMkaZPaP+lMD8LfO8T6tfP1x6SAfnNqQbcdHOAo4drmky3fYZqtwxHjVH7/bWC4zPp
         KvLw==
X-Gm-Message-State: AOJu0Yx01X1JxpZ5k5zw3hzJ9HwaBA//zKP34zxlRB7TQiCkr6/7+KgR
	X2UsMqkaHku2EKBdNym43Vr16l73/xjwPSoIdSV/AKudSCOvYi2KHFplP/ZiKKrplP7XjkM/21Y
	QuVYk6kEV/J6JF3LT21C3iNhSrItk/3SHuD82
X-Google-Smtp-Source: AGHT+IHSk95HdHi4c6PzxIf8LwZMhKckgawRZD8wEYRhn3wS21A6Qc/ITn2wPdNvMmb0d6hzatZvDLV43Jg0B8ADrLQ=
X-Received: by 2002:adf:f6cc:0:b0:367:9571:ceee with SMTP id
 ffacd0b85a97d-367cea8fa2emr2321977f8f.37.1720539595631; Tue, 09 Jul 2024
 08:39:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240612-master-v1-1-a95f24339dab@gmail.com> <CAADnVQJLgo4zF5SVf-P5U_nOaiFW--mCe-zY6_Dec98z_QE24A@mail.gmail.com>
 <270804d4-b751-4ac9-99b2-80e364288c37@leemhuis.info> <2c9089c9-4314-4e4a-a7e2-2dd09716962f@suse.cz>
In-Reply-To: <2c9089c9-4314-4e4a-a7e2-2dd09716962f@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 9 Jul 2024 08:39:40 -0700
Message-ID: <CAJuCfpFsKsA3vTZCPTCKL9-Xs9G+07b8vgr0PunqZzVSN1Lmmg@mail.gmail.com>
Subject: Re: [PATCH RESEND] bpf: fix order of args in call to bpf_map_kvcalloc
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	Mohammad Shehar Yaar Tausif <sheharyaar48@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Christian Kujau <lists@nerdbynature.de>, 
	=?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@intel.com>, 
	Lorenzo Stoakes <lstoakes@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 8:14=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wro=
te:
>
> On 7/8/24 10:20 AM, Linux regression tracking (Thorsten Leemhuis) wrote:
> > [CCing the regressions list and people mentioned below]
> >
> > On 12.06.24 16:53, Alexei Starovoitov wrote:
> >> On Wed, Jun 12, 2024 at 2:51=E2=80=AFAM Mohammad Shehar Yaar Tausif
> >> <sheharyaar48@gmail.com> wrote:
> >>>
> >>> The original function call passed size of smap->bucket before the num=
ber of
> >>> buckets which raises the error 'calloc-transposed-args' on compilatio=
n.
> >>>
> >>> Fixes: 62827d612ae5 ("bpf: Remove __bpf_local_storage_map_alloc")
> >>> Reviewed-by: Andrii Nakryiko <andrii@kernel.org>
> >>> Signed-off-by: Mohammad Shehar Yaar Tausif <sheharyaar48@gmail.com>
> >>> ---
> >>> - already merged in linux-next
> >>> - [1] suggested sending as a fix for 6.10 cycle
> >>
> >> No. It's not a fix.
> >
> > If you have a minute, could you please explain why that is? From what I
> > can see a quite a few people run into build problems with 6.10-rc
> > recently that are fixed by the patch:
> >
> > * P=C3=A9ter Ujfalusi
> > https://lore.kernel.org/bpf/363ad8d1-a2d2-4fca-b66a-3d838eb5def9@intel.=
com/
> >
> > * Christian Kujau
> > https://lore.kernel.org/bpf/48360912-b239-51f2-8f25-07a46516dc76@nerdby=
nature.de/
> > https://lore.kernel.org/lkml/d0dd2457-ab58-1b08-caa4-93eaa2de221e@nerdb=
ynature.de/
> >
> > * Lorenzo Stoakes
> > https://fosstodon.org/@ljs@social.kernel.org/112734050799590482
> >
> > At the same time I see that the culprit mentioned above is from 6.4-rc1=
,
>
> IIUC the order was wrong even before, but see below.
>
> > so I guess it there must be some other reason why a few people seem to
> > tun into this now. Did some other change expose this problem? Or are
> > updated compilers causing this?
>
> I think it's because of 2c321f3f70bc ("mm: change inlined allocation help=
ers
> to account at the call site"), which was added in 6.10-rc1 and thus makes
> this technically a 6.10 regression after all.

IIUC the above mentioned change reveals a problem that was there
before the change. So, it's a build regression in 6.10 because the bug
got exposed but the bug was introduced much earlier. The fix should be
marked as:

Fixes: ddef81b5fd1d ("bpf: use bpf_map_kvcalloc in bpf_local_storage")

> So what triggers the bug is
> AFAICS the following together:
>
> - gcc-14 (didn't see it with gcc-13)
> - commit 2c321f3f70bc that makes bpf_map_kvcalloc a macro that does
> kvcalloc() directly instead of static inline function wrapping it for
> !CONFIG_MEMCG
> - CONFIG_MEMCG=3Dn in .config
>
> The fix is so trivial, it's better to include it in 6.10 even this late.
>
> > Ciao, Thorsten
> >
> >>> [1] https://lore.kernel.org/all/363ad8d1-a2d2-4fca-b66a-3d838eb5def9@=
intel.com/
> >>> ---
> >>>  kernel/bpf/bpf_local_storage.c | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/kernel/bpf/bpf_local_storage.c b/kernel/bpf/bpf_local_st=
orage.c
> >>> index 976cb258a0ed..c938dea5ddbf 100644
> >>> --- a/kernel/bpf/bpf_local_storage.c
> >>> +++ b/kernel/bpf/bpf_local_storage.c
> >>> @@ -782,8 +782,8 @@ bpf_local_storage_map_alloc(union bpf_attr *attr,
> >>>         nbuckets =3D max_t(u32, 2, nbuckets);
> >>>         smap->bucket_log =3D ilog2(nbuckets);
> >>>
> >>> -       smap->buckets =3D bpf_map_kvcalloc(&smap->map, sizeof(*smap->=
buckets),
> >>> -                                        nbuckets, GFP_USER | __GFP_N=
OWARN);
> >>> +       smap->buckets =3D bpf_map_kvcalloc(&smap->map, nbuckets,
> >>> +                                        sizeof(*smap->buckets), GFP_=
USER | __GFP_NOWARN);
> >>>         if (!smap->buckets) {
> >>>                 err =3D -ENOMEM;
> >>>                 goto free_smap;
> >>>
> >>> ---
> >>> base-commit: 2ef5971ff345d3c000873725db555085e0131961
> >>> change-id: 20240612-master-fe9e63ab5c95
> >>>
> >>> Best regards,
> >>> --
> >>> Mohammad Shehar Yaar Tausif <sheharyaar48@gmail.com>
> >>>
>
