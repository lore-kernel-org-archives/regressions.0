Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656F12FB6
	for <regressions@lists.linux.dev>; Wed, 19 May 2021 16:11:49 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id f12so16301527ljp.2
        for <regressions@lists.linux.dev>; Wed, 19 May 2021 09:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n38yI3oq9hOs0w7+qSvFPZKuNPxOuHm402NSUUthZyA=;
        b=BrlJyx9AUrw2lHOaGBlhvxuHGUWn4JGwoZHMIip/Cz5zCwjc3amf34js0LZtyhhYg/
         Kn+CAL4R8ueE98Wxql/NUDPbmhynUChlJlPuL8SRI4i/0L7ZpSD6YwBgZXhGhOewPA/3
         td+EVvuvVWxSislyyclLVv2EpK7SiWO5zda0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n38yI3oq9hOs0w7+qSvFPZKuNPxOuHm402NSUUthZyA=;
        b=HtRypNBc7U65OAlch5Xws2rWH9JQSiBfqPJJ8ScSCIx9xq6rywpAsY9RODNuSikxhO
         W1tc+qM91GRsd0CxEKDu1DgRQDr+S2SpXJjL/kZHwA9EWld0FywrKHGq/Y1jeNGE6Q+9
         1qceHvS+exhqzosITfK/GaH0nKrT5G3/sh1G8n/Gzzv7MNcER/jaKjKybu4GvPImdWUX
         i5EB4UTG9WRapHD3eBpgtuqOVQNbHmZzT2bEYgh/gWpjZU21fVJsklQjDi/uWhLXozbK
         PMjA2Oi7G5xh7x/v1yGJn0u+98nLTkkfg5syL0xl/fPFU/sYcLQvnc4+l5Wk1uO256TZ
         hIyw==
X-Gm-Message-State: AOAM53303i0Ir7y11222Adxhm5IdbRzCNfp4YK3YDqoC7Ckxwf6uKeQa
	PI/TDgFeWGRiNqZV+QTTHkLxW8cuBsht8qgt+rE=
X-Google-Smtp-Source: ABdhPJxrvjTwnlPf5dFyghX9CT4iieoNRLx/0HLEO3UX2YPGfFuRCxNRX7dA4DqpzF8irLTM2zol5Q==
X-Received: by 2002:a2e:2e12:: with SMTP id u18mr32153lju.200.1621440707163;
        Wed, 19 May 2021 09:11:47 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id j5sm12989lfb.101.2021.05.19.09.11.44
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 09:11:45 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id x19so19931578lfa.2
        for <regressions@lists.linux.dev>; Wed, 19 May 2021 09:11:44 -0700 (PDT)
X-Received: by 2002:a05:6512:36c5:: with SMTP id e5mr157954lfs.41.1621440704505;
 Wed, 19 May 2021 09:11:44 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210519024322.GA29704@xsang-OptiPlex-9020> <CAHk-=whcr5M=4Mz2ydu4XtxTL_34WkXPnmFmA4f8r+ELXDC6hg@mail.gmail.com>
 <20210519133330.GA14452@lst.de> <87y2ca6a69.fsf@tynnyri.adurom.net>
In-Reply-To: <87y2ca6a69.fsf@tynnyri.adurom.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 19 May 2021 06:11:28 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgYqF3bffW0EPmVTUFcoV0jXECu-A_dyWZ0ZwUwhCHi+A@mail.gmail.com>
Message-ID: <CAHk-=wgYqF3bffW0EPmVTUFcoV0jXECu-A_dyWZ0ZwUwhCHi+A@mail.gmail.com>
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

On Wed, May 19, 2021 at 5:00 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Christoph Hellwig <hch@lst.de> writes:
>
> > On Tue, May 18, 2021 at 04:58:31PM -1000, Linus Torvalds wrote:
> >>
> >> I'd be inclined to revert the commits as "not ready yet", but it would
> >> be better if somebody can go "yeah, this should be done properly like
> >> X".
> >
> > I think reverting just this commit for now is the best thing.
>
> Yes, please revert it if there's no quick fix. On my Dell XPS 13 9310
> laptop (with Debian 10) X won't start until I revert commit
> b12d691ea5e0, so this is a major issue.

Reverted.

                 Linus
