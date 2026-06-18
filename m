Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA96535838A
	for <regressions@lists.linux.dev>; Thu, 18 Jun 2026 10:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778757; cv=none; b=DG0BlSH2Ta9CV5Cx3p6VsjHm6QAlW20MBOhmPdIhve+1CVTobfyJ+5ucHo1ogpjCN69QVgrviJXgWTUfbzf/QOlydrNxc7DASV9fboE3wpH5VJvYYac1NGJ7Al46ZvgOOIp7LOhGkXTLZIiCsbzKM41jiedXs7BNffKB1WZcXxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778757; c=relaxed/simple;
	bh=vwsitVN7ozdKpgBSF4h9WVQoKxMhPysr7paPs2RYr+E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MYMYF6xR7H0viJlf9RKmV8lf7yZ/W/N9938Q62yNGZ29RViUYBMNEAhdgGeqRtkB4CID5XPDQne6WjPgN0yMUf+gGqDVcxbTZqgB0rDG154RKZ5IhU6vHKTpfQrUXdbBfmsUag6wBaE2+0zYblOU4aUrJlH1ZJPZ9txBhflCTVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfZVGCgs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfZVGCgs"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso8612335e9.2
        for <regressions@lists.linux.dev>; Thu, 18 Jun 2026 03:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781778752; x=1782383552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inqN7YwVEl5wZ+Codcae/bocVL29CD4f5KlLdUvEZRU=;
        b=EfZVGCgsaU7DHZyTzc82IvyHH0mBVLEXugWjNoxkYzHd8jIZ3t5jLr0QGcqfuCRq4b
         RB6ZB4JT85XaqkuRHV1gOYDttzyx/J+uqNs3fFaYLRyVoKW0zOlaZ7ErpeOU3MEJdS05
         htT8dMgIw+z3X5jS04XK7EvwoNJ5dzAcu4yMJShvNMBqVyojcYC3LGb1Cyv3n3iLOo/W
         Vf0U4HmRxd3RkYMXW32vkVfwKbb3p01aGayzVAQbimmYiKvMt8rM6t5W2pJ9+3ATxZdv
         5hTnJsGpfMsAqe4OJBgCtPQBXAT2etokilPj3DJxA7d5yaxnmB2t2/4768fKbjtFwq21
         Jiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781778752; x=1782383552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=inqN7YwVEl5wZ+Codcae/bocVL29CD4f5KlLdUvEZRU=;
        b=DHaQYvsrRXcEWodq+878gNTfnftvuripzGg0FB0FprSlp4BbvzU3myOmW48og2jmuE
         GM8OESmDlovaaJJl1QgldlN+3URKcOkXnf90CX7uKWOKfcVeXTVxxFzfQOLxBwQGSIsQ
         k22vu606RumSAl9aqTfts9NQdoppr6oD+96SkE6CqeOIKZ1RKIBz+tuLrgC7wn0QwOFV
         pLZz3YEBWrofTZ8D8ibERmXBPJd9rHh8XhwehA/t15lGC/UYjYikdYWWd2mSIBfmgPG2
         TJDi729daNlASn6tuMOyMUFWvYSuZQzS2PtiBAsy7cbCmBjTigwGkLs9xuIGYfsx2Voq
         33AQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7sr/8Z6YqizANxed5dA0mSMlF90CXRWBM95zF9Of2uluU+4Rd/QCUmitBIdoc4+RX6qY0kTrN8gQ4lA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw81pbig3lZrEyrQiugHkfAWQk7J431yeBm9KvFhzFPnON4Gaew
	xog9gH8vW6Fed5tPK+BNyIhxNvObd1by+enKOz7NJPq0skxwz0j+h9ZC
X-Gm-Gg: AfdE7cmh/2coR5OvwckeNmTSvNBUZveBdHKqmmaMBNbqvqxNeZM1Qc+KRpcxn0H6k0V
	p5bWrXSjJYO/4D6uFQFFUTXGOEgsJejriPJCAcp+1idyE/JVF+LPyAF3cxBKJD7tOL6B5Vy/MC6
	8vla8hZ4H8hICCPoaXwcNqTuzwPbJDHglfPXZxQE6mei3f08B8FjD2J2qCbKCqE4tJ05i5gLveC
	FL7U8DFdT/KCfBQVy/tyQSzOgDiJGbPhqltTscJm3T56yEhNamcW6qe+A+Nf4+vSaRnpT8YkIz0
	AyX7pSR8CEyT7rMwrUfzQGpjrcbea2FUYikGX8qzyjzzCIFQQ+hC5TL7zzdhNoI0f4bvLP2jSQg
	086jRUyQdxi2RIScP0/FkANI6YTHn6KmKTcR8PJOl0Pp1Sbgc2NceHM3ByC/zUWqYLmjEJg4k8k
	cQGSJrGr6cFdZ8dSEqD2uOIiFsiifXPhUBbocGkZzK8Y9NKmGDPVEpyMw3redy
X-Received: by 2002:a05:600c:e547:20b0:490:3c15:7146 with SMTP id 5b1f17b1804b1-49238226380mr33567315e9.19.1781778751719;
        Thu, 18 Jun 2026 03:32:31 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa3a4easm266778845e9.3.2026.06.18.03.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:32:31 -0700 (PDT)
Date: Thu, 18 Jun 2026 11:32:29 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Andreas Larsson <andreas@gaisler.com>
Cc: Andreas Larsson <andreas.larsson@gaisler.com>, Tony Rodriguez
 <unixpro1970@gmail.com>, davem@davemloft.net, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, thuth@redhat.com,
 regressions@lists.linux.dev, glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH 1/1] sparc64: unify thread stack sizing and add explicit
 32KB stack
Message-ID: <20260618113229.7f1e51b3@pumpkin>
In-Reply-To: <d634e2f2-daf0-4328-bf16-7f5bff6fe851@gaisler.com>
References: <20260519075809.8993-1-unixpro1970@gmail.com>
	<20260519075809.8993-2-unixpro1970@gmail.com>
	<03111ac5-0055-425f-a7f2-54d4f2bb4988@gaisler.com>
	<20260616205851.428ca70c@pumpkin>
	<d634e2f2-daf0-4328-bf16-7f5bff6fe851@gaisler.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 18 Jun 2026 07:53:02 +0200
Andreas Larsson <andreas@gaisler.com> wrote:

> On 2026-06-16 21:58, David Laight wrote:
...
> > That whole logic is impenetrable.
> > Why not set the 'desired thread size' in kB, then work out how many
> > pages that ends up being based on the page size, and finally get the actual
> > stack size.
> > I'm not sure, but with vmalloc()ed stacks and 8k pages can't you have 24kB?  
> 
> No, the next step up is 32 KiB as the stack allocation is sized by
> THREAD_SIZE_ORDER.

Maybe, but there is probably no reason why that has to be the case.
I'm sure I've seem other architectures increasing the stack size by 4k.

	David

> 
> Cheers,
> Andreas
> 

