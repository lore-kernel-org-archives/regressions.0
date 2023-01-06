Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C095A2770E
	for <regressions@lists.linux.dev>; Fri,  6 Jan 2023 17:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033B5C433EF
	for <regressions@lists.linux.dev>; Fri,  6 Jan 2023 17:16:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="fv/e3TIg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1673025393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=13qVFvzj+JoRi8+CvI6HYB6uSTn1bytbuVR6Q3H6GEE=;
	b=fv/e3TIgpppYWi/CEi7b6BQrIg5X6Kp+1Li9pjjlcrd4SXzjD4kcdBtWDOESGsdGHe8231
	LOkJOmBZb7KsQgCAJl2PrLjRtFkcDBffflAJWC8MeuXfw4qtB3hBQTmP7xvGmD4Gq5YoeE
	ZRmVxDzWZlsHmJ1MyipFsOvH963NrG8=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id aeea3e7c (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <regressions@lists.linux.dev>;
	Fri, 6 Jan 2023 17:16:33 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id r26so3094505edc.5
        for <regressions@lists.linux.dev>; Fri, 06 Jan 2023 09:16:33 -0800 (PST)
X-Gm-Message-State: AFqh2krxspP3N7cD+WuoYgIeZBT7Md8BaAcyaFSJbWGe56iLT2P72z1B
	gskSEd7Q/Q+NBuBr/Z2aawgq2gJBXcl/Jx4GdLE=
X-Google-Smtp-Source: AMrXdXsOo0zAqxZ998Wih8ahYgW4gf0ivgvhe+bP0n7y8cElI+fRQWdIBw3TWxXjrERiCHQLHXqTwXOD50gJpMIQKx8=
X-Received: by 2002:aa7:cb13:0:b0:48e:ae51:464d with SMTP id
 s19-20020aa7cb13000000b0048eae51464dmr1649004edt.341.1673025391232; Fri, 06
 Jan 2023 09:16:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y7dPV5BK6jk1KvX+@zx2c4.com> <20230106030156.3258307-1-Jason@zx2c4.com>
 <Y7hF5vG8rWjbCLyL@zx2c4.com> <CAA25o9RGVbiXS6ne53gdM1K706zT=hm5c-KuMWrCA_CJtJDXdw@mail.gmail.com>
In-Reply-To: <CAA25o9RGVbiXS6ne53gdM1K706zT=hm5c-KuMWrCA_CJtJDXdw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Jan 2023 18:16:19 +0100
X-Gmail-Original-Message-ID: <CAHmME9pwUZ+rOLEB=zLTUObAv0At=_n5vs=xQfB=Kw_hwA03Tg@mail.gmail.com>
Message-ID: <CAHmME9pwUZ+rOLEB=zLTUObAv0At=_n5vs=xQfB=Kw_hwA03Tg@mail.gmail.com>
Subject: Re: [PATCH v2] tpm: Allow system suspend to continue when TPM suspend fails
To: Luigi Semenzato <semenzato@chromium.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Peter Huewe <peterhuewe@gmx.de>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Jan Dabros <jsd@semihalf.com>, 
	regressions@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	linux-integrity@vger.kernel.org, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Johannes Altmanninger <aclopte@gmail.com>, stable@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, tbroch@chromium.org, 
	dbasehore@chromium.org, keescook@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 6, 2023 at 6:04 PM Luigi Semenzato <semenzato@chromium.org> wro=
te:
>
> I worked a fair amount on TPM 1.0 about 10 years ago and I even vaguely r=
emember suspend-related problems.  I'd be happy to take a look.  The linked=
 thread shows that Peter Huewe was copied.  I know Peter well, his opinion =
can be trusted.  Unfortunately I don't immediately see a link to a patch, c=
an you help?

Sorry, I should have included that:
https://lore.kernel.org/lkml/20230106030156.3258307-1-Jason@zx2c4.com/
Instead of blocking system suspend when TPM_ORD_SAVESTATE fails, it
just lets the system sleep anyway. This means that presumably the
system might sleep without having called TPM_ORD_SAVESTATE. Trying to
figure out how bad that is.

And yes, Peter Huewe certainly knows about TPMs, especially as he
maintains the code in Linux, but the maintainers haven't been so much
available, unfortunately. This bug happens to intersect with something
mostly related that I work on (the rng), so I'm motivated to at least
prevent the worst of the breakage, but I otherwise don't know anything
about the Linux TPM driver.

Jason
