Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA6C5689
	for <regressions@lists.linux.dev>; Fri, 21 Apr 2023 18:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA9AC4339E
	for <regressions@lists.linux.dev>; Fri, 21 Apr 2023 18:27:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="cy2E2wei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1682101630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3FB3B43eYjyBAM7IDYJSH0nqffg9h/A3cKDOQDAa8U0=;
	b=cy2E2weiOUbZb+vT2a6PJMO6rkRoCYHmSZl2wIfSUJmlXrwKWVGMFXPRwuTqCkTIW1IymQ
	0a4Lu7ZypmvfhJKzoPoNB3A1Nb/yLBX1S6MwO7GnrA+M/TOza15aqV92kszkfZrEWMcSDs
	D5t3QmLEKXiaZGRM+vj3dzLDLV97Pqs=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 32a86181 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <regressions@lists.linux.dev>;
	Fri, 21 Apr 2023 18:27:09 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-771d9ec5aa5so8282193241.0
        for <regressions@lists.linux.dev>; Fri, 21 Apr 2023 11:27:09 -0700 (PDT)
X-Gm-Message-State: AAQBX9foNzxb2NqHlR8Id7VZITYoFWc9RwPp0AcemWxX5hSvlRTZOY2C
	4ADBZWS/LlTdfhGBXb6UfsDxUGzngPa8d2W+7o0=
X-Google-Smtp-Source: AKy350Zha+rMVky/6DSggH+0NpteQqjJJloUu7qVQUIBSeFSBoua6JVr0i++DO9cdKalbSrUG3+c2kWyp7o5GrZMfqw=
X-Received: by 2002:a05:6102:1629:b0:430:b1f:56dc with SMTP id
 cu41-20020a056102162900b004300b1f56dcmr3773848vsb.1.1682101627919; Fri, 21
 Apr 2023 11:27:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ab0:6196:0:b0:75c:e750:ab with HTTP; Fri, 21 Apr 2023
 11:27:07 -0700 (PDT)
In-Reply-To: <ZEKlzaQhjd8sbE7I@kernel.org>
References: <Y60RoP77HnwaukEA@zx2c4.com> <7ebab1ff-48f1-2737-f0d3-25c72666d041@leemhuis.info>
 <Y7w74EBYP3+FHlkw@zx2c4.com> <4268d0ac-278a-28e4-66d1-e0347f011f46@leemhuis.info>
 <ZBBmVhwsTf/URoqs@kernel.org> <CAHmME9rxeE32g7nKqeVLwRodDNM8QyZUNd54cyE6mZW7FcqD-g@mail.gmail.com>
 <ZBBxMl5rVjY9FGS9@kernel.org> <ZBBxxftnXHVOjm92@kernel.org>
 <ZBB8R9H3CyQnNfCt@zx2c4.com> <ZBCDeleGG/fFlkt+@kernel.org> <ZEKlzaQhjd8sbE7I@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 21 Apr 2023 20:27:07 +0200
X-Gmail-Original-Message-ID: <CAHmME9q9DZyYo7G__ks=XSrS4kS8sUUZ+eF3c1VSnGCAvfBR+Q@mail.gmail.com>
Message-ID: <CAHmME9q9DZyYo7G__ks=XSrS4kS8sUUZ+eF3c1VSnGCAvfBR+Q@mail.gmail.com>
Subject: Re: [REGRESSION] suspend to ram fails in 6.2-rc1 due to tpm errors
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, Jan Dabros <jsd@semihalf.com>, 
	regressions@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	linux-integrity@vger.kernel.org, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Johannes Altmanninger <aclopte@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Did you use the patch I sent you and suspend and resume according to
the instructions I gave you? If not, I don't have much to add.
