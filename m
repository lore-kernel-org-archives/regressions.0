Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87767E
	for <regressions@lists.linux.dev>; Sat, 21 Jan 2023 00:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A019C433EF;
	Sat, 21 Jan 2023 00:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674259631;
	bh=p3Y079nnkl3K5cMAQ/Y53zKuPpFrZ5vU9hR0A7lmpqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YELDPd1k9OyyD5e4D/rOONQPFPMDNok955AbR4Zgm2U5vhyJy8sg44W4YO/E92Una
	 hCXxltJOYLqdhoVvJAsTFT52PYG25MDOtQFSZ0BJskTyh4A0/oR3nyoz+Imz6RXRP/
	 AKsotEJ/KiBui8rBDxjyifweSTDzkG4dObOzfupoKA/tJepmJBzQyU1vp50XboctRB
	 HV8zJ3Ytu5z4cgmmKOvUq84ZrjN9i1vO8dfKpyTD52tIbSACo0icjst2YFyyyQxZfc
	 MpTnapVsEV/6HbuUi0ZZHwxuOTuddbzOJ5+iOssbDEqgDuiCiki3qsDVAShRbxOv6c
	 LaHwJ+u0lRIpw==
Date: Sat, 21 Jan 2023 00:07:08 +0000
From: Jarkko Sakkinen <jarkko@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jan Dabros <jsd@semihalf.com>, regressions@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	linux-integrity@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Johannes Altmanninger <aclopte@gmail.com>, stable@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v2] tpm: Allow system suspend to continue when TPM
 suspend fails
Message-ID: <Y8ssrKlWh9rsptKe@kernel.org>
References: <Y7dPV5BK6jk1KvX+@zx2c4.com>
 <20230106030156.3258307-1-Jason@zx2c4.com>
 <Y8UG77zvJeic7Cyc@kernel.org>
 <CAHmME9oj5V9eWNtVPZ0HF6Kx0but-4KW-+yQnt_gyGj8w5QPbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9oj5V9eWNtVPZ0HF6Kx0but-4KW-+yQnt_gyGj8w5QPbg@mail.gmail.com>

On Mon, Jan 16, 2023 at 03:03:17PM +0100, Jason A. Donenfeld wrote:
> Hi Jarkko,
> 
> On Mon, Jan 16, 2023 at 9:12 AM Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > > diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
> > > index d69905233aff..6df9067ef7f9 100644
> > > --- a/drivers/char/tpm/tpm-interface.c
> > > +++ b/drivers/char/tpm/tpm-interface.c
> > > @@ -412,7 +412,10 @@ int tpm_pm_suspend(struct device *dev)
> > >       }
> > >
> > >  suspended:
> > > -     return rc;
> > > +     if (rc)
> > > +             pr_err("Unable to suspend tpm-%d (error %d), but continuing system suspend\n",
> > > +                    chip->dev_num, rc);
> > > +     return 0;
> > >  }
> > >  EXPORT_SYMBOL_GPL(tpm_pm_suspend);
> > >
> > > --
> > > 2.39.0
> > >
> >
> > Let me read all the threads through starting from the original report. I've
> > had emails piling up because of getting sick before holiday, and holiday
> > season after that.
> >
> > This looks sane
> 
> No, not really. I mean, it was sane under the circumstances of, "I'm
> not going to spend time fixing this for real if the maintainers aren't
> around," and it fixed the suspend issue. But it doesn't actually fix
> any real tpm issue. The real issue, AFAICT, is there's some sort of
> race between the tpm rng read command and either suspend or wakeup or
> selftest. One of these is missing some locking. And then commands step
> on each other and the tpm gets upset. This is probably something that
> should be fixed. I assume the "Fixes: ..." tag will actually go quite
> far back, with recent things only unearthing a somewhat old bug. But
> just a hunch.
> 
> Jason

See my response to Vlastimil:

https://lore.kernel.org/linux-integrity/Y8sr7YJ8e8eSpPFv@kernel.org/

Can you try what happens if you do not call tpm_add_hwrng()?

BR, Jarkko
