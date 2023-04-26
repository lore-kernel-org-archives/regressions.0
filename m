Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B6F4C97
	for <regressions@lists.linux.dev>; Wed, 26 Apr 2023 16:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E3AC4339B;
	Wed, 26 Apr 2023 16:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682525226;
	bh=MtdltU0gId4xiQS9pBYRsib3cwgvWJxO+NqnGQqu2vM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H7r9VsvZreCFlc+MHRmUOvuUsDXVcks2Q/e7B+wnn+0tuHK2O7dPNtfFcFbyB8Msk
	 2rib2E5XuVZ0n3ZXHisfJQkJi8nmvPJegXx73MK1ufwAZ6SAN/pHGjfbCsWvpIU0VZ
	 rzfHi41OPYzHwp2PmEP1fRLSBx4ep0vb9JNH4q1mNED4vk7zXWxPSFwrq52NZvvK4J
	 LeP9O5Ckh+8Zo6Ajhy/B5FetnjHkDCPLeErRXKkeR8Vjsql55S/WEq43MHiBBH8oIU
	 M1nhck9oIfacvQfZiY2CNV9PvCZUXMaCFina+WZK7N/NDSDDrNAd2egH5CFvElGdti
	 edn8Fqk6KiQvg==
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Apr 2023 19:07:01 +0300
Message-Id: <CS6TEW6NY7FJ.39VTQYTEN8FBH@suppilovahvero>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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
In-Reply-To: <CAHmME9o3HK2ju-HBYpSbB_7-9x5A2rD0ev3gaiLLjB_J8-Ju4Q@mail.gmail.com>

On Wed Apr 26, 2023 at 4:32 AM EEST, Jason A. Donenfeld wrote:
> Nice work! Happy that you got it figured out. That trace seems
> consistent with what I was seeing in my traces, so I think you've
> spotted the right bug.
>
> Jason

Unfortunately there might be two bugs. Unless I interpreted logs
incorrectly also hwrng can race with resume (sorry, I forgot to
save it).

Looking at drivers/char/hw_random/core.c there seems to be no
binding to the PM so I guess that this it supports what I'm
observing [*].

So there's two ways to fix the issue:

1. Unregister hwrng for the course of suspend
2. Add something like TPM_CHIP_SUSPENDED, which is set by suspend and
   cleared by the resume.

I try the 2nd option first because I see it less complicated.
Probably would make sense to turn chip flags as atomic while
at it.

[*] https://elixir.bootlin.com/linux/latest/source/drivers/char/hw_random/c=
ore.c

BR, Jarkko
