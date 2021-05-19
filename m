Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8502A71
	for <regressions@lists.linux.dev>; Wed, 19 May 2021 16:31:52 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id b12so9127317ljp.1
        for <regressions@lists.linux.dev>; Wed, 19 May 2021 09:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nZLJNKKc9VMDuwm5nqmO6Jk46MY22hPJLYhiTwehgjY=;
        b=BNo+5FL4MivuGXFJyBkyugMfiR2R6b/DtPSISTGhZNn4jxyVfn/H1Bhhfies2dDfMC
         HS84WMm9VY40kL6qVL0Hio+ns0+CoOCx6ZliKWYhjgK7jiyiwDBzY5ZryuWAa/ES2tv2
         j8iTrJhzTO8SCATTMs8IBSRU33TSJL2dOxGLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nZLJNKKc9VMDuwm5nqmO6Jk46MY22hPJLYhiTwehgjY=;
        b=tqjqdQptVPspZ2/1ftm42FeOPBYdBM2fFOTiMtBSTyElg+RhLQ0zfgxsrmA8ONK4B+
         whJt0rluX1OgmmYnNtJ/G9OTq9aPMSfY6yUDg6L6mkuin15zZarCCPErNF5nHPrVyt71
         +3rIU5/mP6/XI+wxDMd6muzBdlvgYYa+9jNcBubNMrZXDZKtzufmi2c++IPePJmC5nzu
         /5otst9h4Op/zPJmAqoH9N02rqj2eevbF9CDTb6zme1GjNbLtQmjhlwuZbcJ7jEDYq6O
         0uMVmPUkw7gnOR1ugJAG7bu+ET/d24lu1d1u1+b1arQugwQMMguH52ljQ0DijuSNUd7l
         8DGA==
X-Gm-Message-State: AOAM531D3KXGOlL6P7CXNqTN4AmRTGun30/UIqvo6swhuPQXJMTy9UZ4
	hxp6jnXFJwptravvSI+YMAuJbL+ZyLUHUxyJ2oY=
X-Google-Smtp-Source: ABdhPJyYesGL7Bw5AyItLtADFHdYxe9V/a7oowCkwzrJTxlU2Ap2GP9byV7frj3/gS3EWOS6jz4I3A==
X-Received: by 2002:a2e:9e90:: with SMTP id f16mr50264ljk.437.1621441910583;
        Wed, 19 May 2021 09:31:50 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id h25sm16229lfe.268.2021.05.19.09.31.48
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 09:31:48 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id v8so15018371lft.8
        for <regressions@lists.linux.dev>; Wed, 19 May 2021 09:31:48 -0700 (PDT)
X-Received: by 2002:a05:6512:36c5:: with SMTP id e5mr244603lfs.41.1621441907825;
 Wed, 19 May 2021 09:31:47 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210519024322.GA29704@xsang-OptiPlex-9020> <CAHk-=whcr5M=4Mz2ydu4XtxTL_34WkXPnmFmA4f8r+ELXDC6hg@mail.gmail.com>
 <20210519133330.GA14452@lst.de> <87y2ca6a69.fsf@tynnyri.adurom.net> <CAHk-=wgYqF3bffW0EPmVTUFcoV0jXECu-A_dyWZ0ZwUwhCHi+A@mail.gmail.com>
In-Reply-To: <CAHk-=wgYqF3bffW0EPmVTUFcoV0jXECu-A_dyWZ0ZwUwhCHi+A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 19 May 2021 06:31:31 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgEZrsY9tsyC=+2sXVVuBDiZDTSMxt-X5LgwvSQqs_a6w@mail.gmail.com>
Message-ID: <CAHk-=wgEZrsY9tsyC=+2sXVVuBDiZDTSMxt-X5LgwvSQqs_a6w@mail.gmail.com>
Subject: Re: [i915] b12d691ea5: kernel_BUG_at_mm/memory.c
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Christoph Hellwig <hch@lst.de>, kernel test robot <oliver.sang@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Serge Belyshev <belyshev@depni.sinp.msu.ru>, Chris Wilson <chris@chris-wilson.co.uk>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	LKML <linux-kernel@vger.kernel.org>, lkp@lists.01.org, 
	kernel test robot <lkp@intel.com>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, May 19, 2021 at 6:11 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, May 19, 2021 at 5:00 AM Kalle Valo <kvalo@codeaurora.org> wrote:
> >
> > Christoph Hellwig <hch@lst.de> writes:
> >
> > > On Tue, May 18, 2021 at 04:58:31PM -1000, Linus Torvalds wrote:
> > >>
> > >> I'd be inclined to revert the commits as "not ready yet", but it would
> > >> be better if somebody can go "yeah, this should be done properly like
> > >> X".
> > >
> > > I think reverting just this commit for now is the best thing.
> >
> > Yes, please revert it if there's no quick fix. On my Dell XPS 13 9310
> > laptop (with Debian 10) X won't start until I revert commit
> > b12d691ea5e0, so this is a major issue.
>
> Reverted.

Oh, and Christoph - there were a couple of preparatory patches before
that one. They all looked syntactic to me, but it might be best to
check that reverting just this one commit is ok?

                   Linus
