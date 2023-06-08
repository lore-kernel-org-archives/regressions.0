Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3D4168CE
	for <regressions@lists.linux.dev>; Thu,  8 Jun 2023 19:36:46 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-3f9a81da5d7so296281cf.0
        for <regressions@lists.linux.dev>; Thu, 08 Jun 2023 12:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686253005; x=1688845005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/9rcr4cOQBqXolDSETy4vJh+qHPOC8JUf2wSjIeiXI=;
        b=r/CLk2x/MAiwtT34jx28j8dudj2ty3X7Z6AW/HNLRvlNgNmfiqkDQ0/NNutw4FHBXb
         0GxcudHIGySJJKR07rp//Sz8EQ8ZFfhocTJk00ey3mc5OjDl2IZWod798Lpi2zvx7U1V
         eeLJFrRsGd57HAlXrUnxfBEJ71W8PCIYWJAvxBTO4VOPK+cVTh/LUUkPCLYCD4Vjp8X6
         JIMzSaDm7kpV42dMdfQEedA2k8yLvpDmj9vjD5yzKOYwPinSm/gwrlJWic3mfMndf033
         sQHo8QrFG8aQwEaHW3hC8QOa+z/1temgzuPpED9PsDc4bQrb6wVCZrr40eFtB+46siaW
         7ueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686253005; x=1688845005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/9rcr4cOQBqXolDSETy4vJh+qHPOC8JUf2wSjIeiXI=;
        b=KhS94rRk3rULF4tmplGRJzXlBGp+zHXTXAXGTvjv7fztcLlx0cSQGAPyak1c601KBT
         mQf1aWpR2iUiQSmlo9RD+9rrOm0+75hCmzaP6Bd4IuT1jU+cFXnYZM63r8IHLCqwN3n8
         EMeOzEXdbqxtqhKNiLTOQFxSWttub0Flhkyb6LF5l5ldlhGis/mzaAoFZYV6bZGHdCAn
         B+RRFD/TTbDYkNdpVw7pku3ySnXZHfDJWt40KMf++/76WWtOSwZSc3FMf24g+GygTDY0
         0/W8njzRz0EC0GzVTiBCNWpToXPap2koTdmZiq1lmucexZ1A0al0nnniKjbClUjS/SII
         ho+w==
X-Gm-Message-State: AC+VfDyBwyWEmwMKIhB+b7ILS9OVB+2gixO1zTahJZI70rSXA8CF9NT4
	agdCnaXF6l0vLVNsxlh5K1lMQkAE2SgVK+JbMzGAXg==
X-Google-Smtp-Source: ACHHUZ4NMOg5fkuw5/WDThm2yIjlXlvQVqU1jaFR4IjPDZ+0uJvzlIRYOFqBOQTPtHistpqXx/ZVgwuR4r+QEAJARu8=
X-Received: by 2002:ac8:5888:0:b0:3ef:2f55:2204 with SMTP id
 t8-20020ac85888000000b003ef2f552204mr330245qta.6.1686253004843; Thu, 08 Jun
 2023 12:36:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221024052841.3291983-1-shakeelb@google.com> <20230608111408.s2minsenlcjow7q3@quack3>
 <20230608173700.wafw5tyw52gwoicu@google.com> <ZIInlxGIl8mS-iRk@V92F7Y9K0C.corp.robot.car>
In-Reply-To: <ZIInlxGIl8mS-iRk@V92F7Y9K0C.corp.robot.car>
From: Shakeel Butt <shakeelb@google.com>
Date: Fri, 9 Jun 2023 00:36:33 +0500
Message-ID: <CALvZod44XVAqL6zEDmHMdHzcgHaBnyFAb=MbJf7hbO+5G2TQxw@mail.gmail.com>
Subject: Re: [PATCH] mm: convert mm's rss stats into percpu_counter
To: Dennis Zhou <dennisszhou@gmail.com>
Cc: Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, mhocko@suse.cz, vbabka@suse.cz, 
	regressions@lists.linux.dev, Yu Ma <yu.ma@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 9, 2023 at 12:10=E2=80=AFAM Dennis Zhou <dennisszhou@gmail.com>=
 wrote:
>
> Hi Shakeel and Jan,
>
> On Thu, Jun 08, 2023 at 05:37:00PM +0000, Shakeel Butt wrote:
> > On Thu, Jun 08, 2023 at 01:14:08PM +0200, Jan Kara wrote:
> > [...]
> > >
> > > Somewhat late to the game but our performance testing grid has notice=
d this
> > > commit causes a performance regression on shell-heavy workloads. For
> > > example running 'make test' in git sources on our test machine with 1=
92
> > > CPUs takes about 4% longer, system time is increased by about 9%:
> > >
> > >                        before (9cd6ffa6025)  after (f1a7941243c1)
> > > Amean     User         471.12 *   0.30%*     481.77 *  -1.96%*
> > > Amean     System       244.47 *   0.90%*     269.13 *  -9.09%*
> > > Amean     Elapsed      709.22 *   0.45%*     742.27 *  -4.19%*
> > > Amean     CPU          100.00 (   0.20%)     101.00 *  -0.80%*
> > >
> > > Essentially this workload spawns in sequence a lot of short-lived tas=
ks and
> > > the task startup + teardown cost is what this patch increases. To
> > > demonstrate this more clearly, I've written trivial (and somewhat stu=
pid)
> > > benchmark shell_bench.sh:
> > >
> > > for (( i =3D 0; i < 20000; i++ )); do
> > >     /bin/true
> > > done
> > >
> > > And when run like:
> > >
> > > numactl -C 1 ./shell_bench.sh
> > >
> > > (I've forced physical CPU binding to avoid task migrating over the ma=
chine
> > > and cpu frequency scaling interfering which makes the numbers much mo=
re
> > > noisy) I get the following elapsed times:
> > >
> > >          9cd6ffa6025    f1a7941243c1
> > > Avg      6.807429       7.631571
> > > Stddev   0.021797       0.016483
> > >
> > > So some 12% regression in elapsed time. Just to be sure I've verified=
 that
> > > per-cpu allocator patch [1] does not improve these numbers in any
> > > significant way.
> > >
> > > Where do we go from here? I think in principle the problem could be f=
ixed
> > > by being clever and when the task has only a single thread, we don't =
bother
> > > with allocating pcpu counter (and summing it at the end) and just acc=
ount
> > > directly in mm_struct. When the second thread is spawned, we bite the
> > > bullet, allocate pcpu counter and start with more scalable accounting=
.
> > > These shortlived tasks in shell workloads or similar don't spawn any
> > > threads so this should fix the regression. But this is obviously easi=
er
> > > said than done...
> > >
> >
> > Thanks Jan for the report. I wanted to improve the percpu allocation to
> > eliminate this regression as it was reported by intel test bot as well.
> > However your suggestion seems seems targetted and reasonable as well. A=
t
> > the moment I am travelling, so not sure when I will get to this. Do you
> > want to take a stab at it or you want me to do it? Also how urgent and
> > sensitive this regression is for you?
> >
> > thanks,
> > Shakeel
> >
> >
>
> I _think_ I could probably spin you a percpu_alloc_bulk() series in a
> couple days for percpu_counters. Let me try and find some time, unless
> you had something different in mind.
>

That would be awesome and thanks a lot.
