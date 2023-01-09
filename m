Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD5733D6
	for <regressions@lists.linux.dev>; Mon,  9 Jan 2023 16:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F105BC433F0;
	Mon,  9 Jan 2023 16:05:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="XOaraKj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1673280333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z+niQef/oIp19ZPZkiD3NOHrMKlrLAG21vq0oN2bzI8=;
	b=XOaraKj2DB2VFDzDX60zwUrFOyOgbAtEalCGXgZoKcew8HXZkEKWbtoYI7BI5SJwRGAKwh
	Lo+oIg9AP89/Fp6cWVKILhFRly1Dpn3yCm1LoJH7SK+5GL2tqzWQL7dqz0rQXHXgNVRiqp
	YxjflGD7X2Q8pUHpjdn6R6yC1jpCAAA=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b1117af8 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 9 Jan 2023 16:05:33 +0000 (UTC)
Date: Mon, 9 Jan 2023 17:05:28 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Luigi Semenzato <semenzato@chromium.org>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jan Dabros <jsd@semihalf.com>, regressions@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	linux-integrity@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Johannes Altmanninger <aclopte@gmail.com>, stable@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>, tbroch@chromium.org,
	dbasehore@chromium.org, Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2] tpm: Allow system suspend to continue when TPM
 suspend fails
Message-ID: <Y7w7SMitXFkcR6Gb@zx2c4.com>
References: <Y7dPV5BK6jk1KvX+@zx2c4.com>
 <20230106030156.3258307-1-Jason@zx2c4.com>
 <CAHk-=wjin0Rn6j+EvYV9pzrbA0G2xnHKdp_EAB6XnansQ8kpUA@mail.gmail.com>
 <CAA25o9Sbkg=qD+DH-aqXY9H5R_oBtePcnqagwAGCgoUk8D-Vyg@mail.gmail.com>
 <CAHk-=wi60PhJRzaBJ9uvVCpOpqSsKy=oXkGDq7t844BJ6dRcmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wi60PhJRzaBJ9uvVCpOpqSsKy=oXkGDq7t844BJ6dRcmA@mail.gmail.com>

On Fri, Jan 06, 2023 at 02:28:00PM -0800, Linus Torvalds wrote:
> On Fri, Jan 6, 2023 at 12:04 PM Luigi Semenzato <semenzato@chromium.org> wrote:
> >
> > I think it's fine to go ahead with your change, for multiple reasons.
> 
> Ok, I've applied the patch (although I did end up editing it to use
> dev_err() before doing that just to make myself happier about the
> printout).

Thanks for fixing it up to use dev_err(). Final commit looks good to me.

Jason
