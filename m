Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E92C1E52C
	for <regressions@lists.linux.dev>; Tue, 11 Jul 2023 19:44:16 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4036bd4fff1so4251cf.0
        for <regressions@lists.linux.dev>; Tue, 11 Jul 2023 12:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689104655; x=1691696655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSEbbHdSy2/6yMNHt5Jl2Q8DKG5onoGGlP2gwab29zg=;
        b=SeyA6AXpzijMHYXA7cjzccjTbzwZWoJYGstW61Xg9auwvLtgCrdRrgY1+rb4mj71zP
         kAS2JOoSuGreMHzZKF2SAOd8m8inSHMQZgSh0jbn1xWhgbEas4OlDao6V2S+bsSTFY2z
         uU6/VkjyeAF+R9FkqY3cTYdzrYNRhtU//Y/fgFb2hnacZ2I/Z5+XqSPPfv61v8zsEbwi
         8XX2N0+8VH/AfGGcFQLJslO5U0WDrchRnXwftY3cdzAWsPVuXSca9UUDTROL7eyfo70L
         tgvclsm/4/QPawY1PY0reLmxJ7efSbL/jmnI3m9zBBeGaMI/OXPA4hkzZTy8dDamPq9s
         uxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689104655; x=1691696655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSEbbHdSy2/6yMNHt5Jl2Q8DKG5onoGGlP2gwab29zg=;
        b=c3/4/AEAvvm888vSTtFwAEXJyn8IgKE+S8t3tC6i0tMNGKwwMdKefixn98yh7KyLUJ
         6PCJPV3zBWhwc/yhp75/ye9CMAXOyqF0UByu0IAlskM23tndfDVnsIqIKqBEbgjBIPEN
         IxrXg808Nxf65DVUsPejRcvYCNHh4Q7pIOzHXfihJ5ftkYYBkuekcZm5ynGHZFORj9rS
         vT8p85f4HmAqESoYYoLFudGDRKOXA/NUebtbwWmiomYzh/WUl67aKfT3Fh08S/758EBO
         383M+uiyBM+ljSL6LLNj7GbcSwZqgDrLfsn60nF0vZUx4N/GQJWMqCthNiur3fX+vz00
         83XQ==
X-Gm-Message-State: ABy/qLbNEGeSvQHX+Z7qXV0w6X1lLjIWKCahIb99IUtEc50SrwFccFo5
	6Tx8sFC5TTxMYV4qHRE4hC0eBkomwqvwUUcZhoay7A==
X-Google-Smtp-Source: APBJJlEMGrJhIDMpPTyu7e5avzS4Ytu2jD6E5EuDUDLHHML24qva5gPcogEF3c06DP35r+OQbQLaaRAwWhkADKINe28=
X-Received: by 2002:ac8:570d:0:b0:3f9:a770:7279 with SMTP id
 13-20020ac8570d000000b003f9a7707279mr28180qtw.9.1689104654972; Tue, 11 Jul
 2023 12:44:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230612153201.554742-1-catalin.marinas@arm.com>
 <CAMi1Hd04mu6JojT3y6wyN2YeVkPR5R3qnkKJ8iR8if_YByCn4w@mail.gmail.com>
 <ZKdfVSzbgOonR17A@google.com> <CAMi1Hd2f5GUnu_JGot=CqA9Vy4OD_V7FWYLOhNbJL1Pyd_EGMA@mail.gmail.com>
In-Reply-To: <CAMi1Hd2f5GUnu_JGot=CqA9Vy4OD_V7FWYLOhNbJL1Pyd_EGMA@mail.gmail.com>
From: Isaac Manjarres <isaacmanjarres@google.com>
Date: Tue, 11 Jul 2023 12:44:03 -0700
Message-ID: <CABfwK138ZbE5=J66esO-VG64tO+e9n1cRRBAE3wOKygJxd_xbw@mail.gmail.com>
Subject: Re: [PATCH v7 00/17] mm, dma, arm64: Reduce ARCH_KMALLOC_MINALIGN to 8
To: Amit Pundir <amit.pundir@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, 
	Robin Murphy <robin.murphy@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Ard Biesheuvel <ardb@kernel.org>, Saravana Kannan <saravanak@google.com>, Alasdair Kergon <agk@redhat.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Joerg Roedel <joro@8bytes.org>, Mark Brown <broonie@kernel.org>, 
	Mike Snitzer <snitzer@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, John Stultz <jstultz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 8, 2023 at 6:03=E2=80=AFAM Amit Pundir <amit.pundir@linaro.org>=
 wrote:
> Hi Issac, I can't reproduce this crash if I have slub_debug enabled
> https://bugs.linaro.org/attachment.cgi?id=3D1149.
>
> But I can still reproduce the crash, with the same build, if I just
> remove the slub_debug bootarg
> https://bugs.linaro.org/attachment.cgi?id=3D1150
>

Hey Amit,

Thanks for trying this out. John Stultz and I tried this out as well, and w=
e
couldn't reproduce the issue with slub_debug enabled either.

However, we were able to reproduce the issue you reported along with
KASAN enabled, which also helped us catch an out-of-bounds access
in the regmap-irq code. Once we fixed it, the memory corruption you
reported was also fixed. I've sent the patch [1] for review. Can you please
test it out and see if it works for you too?

[1]: https://lore.kernel.org/all/20230711193059.2480971-1-isaacmanjarres@go=
ogle.com/

Thanks,
Isaac
