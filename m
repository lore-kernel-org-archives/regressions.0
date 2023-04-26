Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C793FC2
	for <regressions@lists.linux.dev>; Wed, 26 Apr 2023 17:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA04C433D2;
	Wed, 26 Apr 2023 17:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682528418;
	bh=MHqWRvkl5Cm+oF+SgyhqgDdM1Q4M/yDXHwZMMADe8N0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=hNecQijVZZORG15ytwJCNNM5O9bn8FYhmGWYhiICBh2STfG07xDCjy46L6FysE1Bj
	 WTaU/9GDnboVILfS0vvG0rmGoW67jP6T1Yr5GOwRD0mwbAWxW8/eFONzxAWRlu2P3r
	 BbqJ0YrOsmuH5cNKOuQSYzQOUnVdhu08O+MMDJdLLPmB9KHvwMZXmCnvQ1FdTsl2Ri
	 Z9G6NcIJ8ZTwVktb8NYdW6HKK4wEB+sLRqpCiknzbEVuiZVYpaDqOrsrV0quamwfLq
	 DDUVLaCX0Zq+6bHnC8wTEzK6lYcv1KzxnUgNKCWtYzqKzovH/NNM7+8O4CnK2Vvi8s
	 rKE54/gww4ImA==
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Apr 2023 20:00:14 +0300
Message-Id: <CS6UJMSTVA4L.FRQ5VL1I1EF4@suppilovahvero>
Cc: "Thorsten Leemhuis" <regressions@leemhuis.info>, "James Bottomley"
 <James.Bottomley@hansenpartnership.com>, "Vlastimil Babka"
 <vbabka@suse.cz>, "Peter Huewe" <peterhuewe@gmx.de>, "Jason Gunthorpe"
 <jgg@ziepe.ca>, "Jan Dabros" <jsd@semihalf.com>,
 <regressions@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>,
 <linux-integrity@vger.kernel.org>, "Dominik Brodowski"
 <linux@dominikbrodowski.net>, "Herbert Xu" <herbert@gondor.apana.org.au>,
 "Linus Torvalds" <torvalds@linux-foundation.org>, "Johannes Altmanninger"
 <aclopte@gmail.com>
Subject: Re: [REGRESSION] suspend to ram fails in 6.2-rc1 due to tpm errors
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
X-Mailer: aerc 0.14.0
References: <Y60RoP77HnwaukEA@zx2c4.com>
 <7ebab1ff-48f1-2737-f0d3-25c72666d041@leemhuis.info>
 <Y7w74EBYP3+FHlkw@zx2c4.com>
 <4268d0ac-278a-28e4-66d1-e0347f011f46@leemhuis.info>
 <ZBBmVhwsTf/URoqs@kernel.org>
 <CAHmME9rxeE32g7nKqeVLwRodDNM8QyZUNd54cyE6mZW7FcqD-g@mail.gmail.com>
 <ZBBxMl5rVjY9FGS9@kernel.org> <ZBBxxftnXHVOjm92@kernel.org>
 <ZBB8R9H3CyQnNfCt@zx2c4.com> <ZBCDeleGG/fFlkt+@kernel.org>
 <ZEKlzaQhjd8sbE7I@kernel.org>
 <CAHmME9q9DZyYo7G__ks=XSrS4kS8sUUZ+eF3c1VSnGCAvfBR+Q@mail.gmail.com>
 <CS48U6SYIBVB.V05DUEX5I01F@suppilovahvero>
 <CS68AWILHXS4.3M36M1EKZLUMS@suppilovahvero>
 <CAHmME9o3HK2ju-HBYpSbB_7-9x5A2rD0ev3gaiLLjB_J8-Ju4Q@mail.gmail.com>
 <CS6TEW6NY7FJ.39VTQYTEN8FBH@suppilovahvero>
In-Reply-To: <CS6TEW6NY7FJ.39VTQYTEN8FBH@suppilovahvero>

On Wed Apr 26, 2023 at 7:07 PM EEST, Jarkko Sakkinen wrote:
> On Wed Apr 26, 2023 at 4:32 AM EEST, Jason A. Donenfeld wrote:
> > Nice work! Happy that you got it figured out. That trace seems
> > consistent with what I was seeing in my traces, so I think you've
> > spotted the right bug.
> >
> > Jason
>
> Unfortunately there might be two bugs. Unless I interpreted logs
> incorrectly also hwrng can race with resume (sorry, I forgot to
> save it).
>
> Looking at drivers/char/hw_random/core.c there seems to be no
> binding to the PM so I guess that this it supports what I'm
> observing [*].
>
> So there's two ways to fix the issue:
>
> 1. Unregister hwrng for the course of suspend
> 2. Add something like TPM_CHIP_SUSPENDED, which is set by suspend and
>    cleared by the resume.
>
> I try the 2nd option first because I see it less complicated.
> Probably would make sense to turn chip flags as atomic while
> at it.
>
> [*] https://elixir.bootlin.com/linux/latest/source/drivers/char/hw_random=
/core.c

OK, so I implemented fix also for hwrng and now I get a clean
resume. I'll add all necessary tags etc. and send for review.

BR, Jarkko
