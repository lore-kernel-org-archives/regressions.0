Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF61220F95
	for <regressions@lists.linux.dev>; Wed, 12 Jul 2023 17:34:25 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-991fe70f21bso903571366b.3
        for <regressions@lists.linux.dev>; Wed, 12 Jul 2023 10:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1689183263; x=1691775263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KC5NZX32e9wpP9t7OccUoxNgiPdVaAw53ZnY1DABzIo=;
        b=KJxUhEXVmviSKcdeI5emPEDV2aIFoyXu8hY8jI90gY5yOOStavHHjnYtw6jWoHU42G
         6EWqaao1s8cjDP6S1CH7SxiJrVwq/Fs5bcpIf6STIQ2ryh0cJe+YLoaPl9N/HxGYK+dI
         t8FqCE98pVD3tI1z6oE73yKjswRO6fgcHGaaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689183263; x=1691775263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KC5NZX32e9wpP9t7OccUoxNgiPdVaAw53ZnY1DABzIo=;
        b=kgUO5gBcPKiTyiTLBp3qACeQt6xesKzZsM19V2+2qM/tzoCxC+pRW36EvRHi2C/7xK
         r5/p9jPK4viCxwvVp1B0NuUq8ZrN3A1tDIpJJXT2kz10JJ1VehciH32KBOOLg/FBPJNM
         +AxnGU99wx1QfLGQvSCR4TLrlsy4bIuEXHW3vuiJkVm1jpxLoydkmHR94rLuhUKcMRiQ
         35Zj95GH4FnZS2CfJY/UgihinwEwibcnVkJzP+w2QnAyYEmb2p16DXC7FTrhl3yldBxO
         8WDxh6cCvaQbbjQ8ThGUP+I0OT48tlDQAP4OUXMdqnhpLfsAu2Awcxd+bd0u46brmObG
         WNgA==
X-Gm-Message-State: ABy/qLavLgDA91xACzqsS+qtftVY5r2JWZLIB3ONxZbHMJYWIWS5SFPn
	BwQuwBEqrVHxXFSH7/H182818aPk2B6Sz2towCuTSyxM
X-Google-Smtp-Source: APBJJlGzlvcThd59DMQfKnSTEtKDnNHemrgqZvOjAFKpxQ+GbWcyKVKX4Hmsud9vN/hbUqKM/ZPINA==
X-Received: by 2002:a17:906:7785:b0:991:b2a2:e424 with SMTP id s5-20020a170906778500b00991b2a2e424mr23075296ejm.76.1689183263668;
        Wed, 12 Jul 2023 10:34:23 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id d8-20020a170906370800b009929ab17be0sm2775443ejc.162.2023.07.12.10.34.23
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 10:34:23 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-51dec0b6fecso9196924a12.1
        for <regressions@lists.linux.dev>; Wed, 12 Jul 2023 10:34:23 -0700 (PDT)
X-Received: by 2002:aa7:dc0d:0:b0:50b:c693:70af with SMTP id
 b13-20020aa7dc0d000000b0050bc69370afmr19367439edu.2.1689183262818; Wed, 12
 Jul 2023 10:34:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZJsKBkPqoWzYyngS@kbusch-mbp.dhcp.thefacebook.com>
 <6f333133-2cc4-406a-d6c2-642ac6ccabca@leemhuis.info> <CGME20230710155902eucas1p2b464a29adc35e983c73b00d18ab5344c@eucas1p2.samsung.com>
 <ZKwqvTMPVmhnkZjS@kbusch-mbp.dhcp.thefacebook.com> <f0fdf86e-4293-8e07-835d-b5a866252068@samsung.com>
 <462e0e1e-98ea-0f3c-4aaa-8d44f0a8e664@leemhuis.info> <20230711120609.GB27050@lst.de>
 <CAHk-=whXh9sgLo24RO02JjfD0m3HE5NADRPWoEd+dW6bruFhVA@mail.gmail.com>
 <20230712164546.GA31434@lst.de> <CAHk-=whA9rmvNfo=8iKmtimayiA2Aus4XvPwcDrA53G2rfGP0w@mail.gmail.com>
 <20230712165721.GA31965@lst.de>
In-Reply-To: <20230712165721.GA31965@lst.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 12 Jul 2023 10:34:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgzetYEqj7phbJBE_ZshFq0=k3zWouJ8XyFyERgDX5sZg@mail.gmail.com>
Message-ID: <CAHk-=wgzetYEqj7phbJBE_ZshFq0=k3zWouJ8XyFyERgDX5sZg@mail.gmail.com>
Subject: Re: Fwd: Need NVME QUIRK BOGUS for SAMSUNG MZ1WV480HCGL-000MV
 (Samsung SM-953 Datacenter SSD)
To: Christoph Hellwig <hch@lst.de>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Pankaj Raghav <p.raghav@samsung.com>, 
	Keith Busch <kbusch@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Sagi Grimberg <sagi@grimberg.me>, "Clemens S." <cspringsguth@gmail.com>, 
	Martin Belanger <martin.belanger@dell.com>, Chaitanya Kulkarni <kch@nvidia.com>, 
	John Meneghini <jmeneghi@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux NVMe <linux-nvme@lists.infradead.org>, 
	Kanchan Joshi <joshi.k@samsung.com>, Javier Gonzalez <javier.gonz@samsung.com>, 
	=?UTF-8?B?67CV7KeE7ZmY?= <jh.i.park@samsung.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Jul 2023 at 09:57, Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Jul 12, 2023 at 09:51:52AM -0700, Linus Torvalds wrote:
> > Christoph, you are *literally* involved in a discussion where this is the case.
>
> Yes.  But that's not never ever.  Enterprise storage devices have been
> pretty very good at it, because it is part of the purchase specs.

Your basic logic is lacking.

"Humans are animals" and "Some animals have four legs" are both
undeniabvly true.

That still does *not* mean "Humans have four legs".

And yet hat is *literally* the kind of nonsense you are spouting.

I very much say that "some devices will not have UUID's".

That's a *FACT*.

You then say "Some devices have UUID's, so all devices must have UUIDs".

That's *STUPID*.

Can you really not tell the difference?

           Linus
