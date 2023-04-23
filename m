Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C022D2918
	for <regressions@lists.linux.dev>; Sun, 23 Apr 2023 15:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA166C433EF;
	Sun, 23 Apr 2023 15:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682264061;
	bh=DuWcZ8Ufpqix6AGju65ri+2BRYftUvhxEIwzm6NEAso=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=slZTVFbLQyx6CNX8Li67ohcNIbdE533otTVdexrwqUOsdpTxpVagp2SofdXZxRdI2
	 nJV4+Wsyl0Sqrq+ltn5X8F2Tda/fGEerUPQs9s3NmLsxQj+mP2xjx2tGZiw+QjQk3a
	 ScLwJWffrrBMkvAtA8Bt02F71ksoCF/jdI3Q1dds5WSNqF8GEWuBhzmUUXxZ8dqH5v
	 G9UMPERRRfbwFyu1mxvdxJrQo2XHdsm7TWXJPe9CXFNv/sTZrk+zD2qghphOXTRy5L
	 FlDow6mGoU0EptwYca2lF1UEgVglYS6wq+UBFjN2Ixtdmc6uygaFht8T9UVjlZCY38
	 KmNVBSNT/cDEg==
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Apr 2023 18:34:16 +0300
Message-Id: <CS48U6SYIBVB.V05DUEX5I01F@suppilovahvero>
Subject: Re: [REGRESSION] suspend to ram fails in 6.2-rc1 due to tpm errors
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
In-Reply-To: <CAHmME9q9DZyYo7G__ks=XSrS4kS8sUUZ+eF3c1VSnGCAvfBR+Q@mail.gmail.com>

On Fri Apr 21, 2023 at 9:27 PM EEST, Jason A. Donenfeld wrote:
> Did you use the patch I sent you and suspend and resume according to
> the instructions I gave you? If not, I don't have much to add.

Finally, I got it reproduced at my side with TPM 1.2:

[    0.379677] tpm_tis 00:00: 1.2 TPM (device-id 0x1, rev-id 1)
[   32.453447] tpm tpm0: tpm_transmit: tpm_recv: error -5
[   33.450601] tpm tpm0: Unable to read header
[   33.450607] tpm tpm0: tpm_transmit: tpm_recv: error -62

I'll look at this further after I've sent v6.3 PR.

BR, Jarkko
