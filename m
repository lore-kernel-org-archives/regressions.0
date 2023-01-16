Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1983023A8
	for <regressions@lists.linux.dev>; Mon, 16 Jan 2023 14:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC35C433F0
	for <regressions@lists.linux.dev>; Mon, 16 Jan 2023 14:03:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="pIS0Y2kJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1673877810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c/usgNs9pfu7FbT7iKyXt726LjP2SjSeWRrj88OxrK8=;
	b=pIS0Y2kJOFlyBy+3owpL+w9RGvRxsW9XGj+nuaeBDIlxDlzFh1crQ9/ELkttC+WpQVZ9oT
	XH8dx6x4ZvTJ9XQS1twTh/BJU+elwgB8rGo1Z3+08vP1Zc4kZ2lBPoxeDlqQlLYbcxNuLB
	B2eL++kLNkUse6wmRlNUt18gm+bJVm0=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9e39e585 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <regressions@lists.linux.dev>;
	Mon, 16 Jan 2023 14:03:30 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id v19so24474963ybv.1
        for <regressions@lists.linux.dev>; Mon, 16 Jan 2023 06:03:29 -0800 (PST)
X-Gm-Message-State: AFqh2kqCKDzzO4Xj17NYdP0r1SfFXkO6JjkYjbz8ftoRoiGew26JoJCm
	ml2NZjAA5O3oBFgE0MPyTftd4yPGarkvB0y2tto=
X-Google-Smtp-Source: AMrXdXs6GZpmdrfgweNbQS8/0Y8RCAaey/orcLg0xTcwW9Lkwr5FCig6Y6BbUhGpPa1tiDm7gXovA9Lmm+NFJz34R64=
X-Received: by 2002:a25:5189:0:b0:7bf:d201:60cb with SMTP id
 f131-20020a255189000000b007bfd20160cbmr1958247ybb.365.1673877808634; Mon, 16
 Jan 2023 06:03:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y7dPV5BK6jk1KvX+@zx2c4.com> <20230106030156.3258307-1-Jason@zx2c4.com>
 <Y8UG77zvJeic7Cyc@kernel.org>
In-Reply-To: <Y8UG77zvJeic7Cyc@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 16 Jan 2023 15:03:17 +0100
X-Gmail-Original-Message-ID: <CAHmME9oj5V9eWNtVPZ0HF6Kx0but-4KW-+yQnt_gyGj8w5QPbg@mail.gmail.com>
Message-ID: <CAHmME9oj5V9eWNtVPZ0HF6Kx0but-4KW-+yQnt_gyGj8w5QPbg@mail.gmail.com>
Subject: Re: [PATCH v2] tpm: Allow system suspend to continue when TPM suspend fails
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Peter Huewe <peterhuewe@gmx.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jan Dabros <jsd@semihalf.com>, regressions@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, linux-integrity@vger.kernel.org, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Johannes Altmanninger <aclopte@gmail.com>, stable@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"

Hi Jarkko,

On Mon, Jan 16, 2023 at 9:12 AM Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
> > index d69905233aff..6df9067ef7f9 100644
> > --- a/drivers/char/tpm/tpm-interface.c
> > +++ b/drivers/char/tpm/tpm-interface.c
> > @@ -412,7 +412,10 @@ int tpm_pm_suspend(struct device *dev)
> >       }
> >
> >  suspended:
> > -     return rc;
> > +     if (rc)
> > +             pr_err("Unable to suspend tpm-%d (error %d), but continuing system suspend\n",
> > +                    chip->dev_num, rc);
> > +     return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(tpm_pm_suspend);
> >
> > --
> > 2.39.0
> >
>
> Let me read all the threads through starting from the original report. I've
> had emails piling up because of getting sick before holiday, and holiday
> season after that.
>
> This looks sane

No, not really. I mean, it was sane under the circumstances of, "I'm
not going to spend time fixing this for real if the maintainers aren't
around," and it fixed the suspend issue. But it doesn't actually fix
any real tpm issue. The real issue, AFAICT, is there's some sort of
race between the tpm rng read command and either suspend or wakeup or
selftest. One of these is missing some locking. And then commands step
on each other and the tpm gets upset. This is probably something that
should be fixed. I assume the "Fixes: ..." tag will actually go quite
far back, with recent things only unearthing a somewhat old bug. But
just a hunch.

Jason
