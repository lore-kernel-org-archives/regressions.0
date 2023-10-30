Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2F2364
	for <regressions@lists.linux.dev>; Mon, 30 Oct 2023 02:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QQNKbrtP"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-507a98517f3so5578247e87.0
        for <regressions@lists.linux.dev>; Sun, 29 Oct 2023 19:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1698634382; x=1699239182; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8i9IJ6qcHJ07vn+dkRJ2At4ErXDFAqXeJ+j8E+g0On8=;
        b=QQNKbrtPCXg47GLP6Oh6nsqH7qe64K2U7goYfG5X7KJCTLVHkE5S3Zx9hqux8XQDCd
         QAoWFd6YPrlL8lIVqkaqbmUaCpPLqsDlyoNLjzAsW1331qxAE6mDp65v4HaZbgaHFjEw
         z9qFDeNJTOwc+NtiyKWNU8mzlf82oKlbUO/h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698634382; x=1699239182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8i9IJ6qcHJ07vn+dkRJ2At4ErXDFAqXeJ+j8E+g0On8=;
        b=o6V6R7K5XpKUyi/VyIVjuzfpVL5qyzQWSHZNFGBPigQPum1QvDld+moAD76nvBiH5g
         vxSpqkf4IVuxCt9LIKhHT0ze4wKzUKbk9kqmYfq4qVxNH1vlM+LF+6cQF+yqbkN4Bnzz
         /EXxj2uQS+z92+zXOX0zRkH/SQDiSVNKGQgXawkv7CPZrd2pR9phUKUCNwkK7pnyI2Tx
         vY29tQBUo/bGjYPjwfWdRIHDmoJlZM8zR5Zyfh0RuGFjMz0WEI8fom3Cuo2zTFAoHEv1
         zcTi57ImarhhSYG0zSG242UbobMznfTcXQKIJcOEt9g/RC3gVFSmT1EJw1yaGrN3G4DK
         8UYQ==
X-Gm-Message-State: AOJu0Yzxghcf0sLrJe4AmmWacuhAsUWbJDQ+TN866MUJz+7QMhphZMZP
	6+VJRs3gSwlpQonYDYLUK0psRUI+KsD7Pj0c5/xs6Q==
X-Google-Smtp-Source: AGHT+IF24ze5H1EZJMcq9i0HqCxohpi+NWmHk71rw6mqX2qWqg768msyUvSho90McwFYX6hho0/0kw==
X-Received: by 2002:ac2:4850:0:b0:507:a1e0:22f4 with SMTP id 16-20020ac24850000000b00507a1e022f4mr5953351lfy.29.1698634380888;
        Sun, 29 Oct 2023 19:53:00 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id cf17-20020a170906b2d100b00997d7aa59fasm5292131ejb.14.2023.10.29.19.52.59
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Oct 2023 19:52:59 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-98377c5d53eso595450766b.0
        for <regressions@lists.linux.dev>; Sun, 29 Oct 2023 19:52:59 -0700 (PDT)
X-Received: by 2002:a17:906:dace:b0:9a1:680e:8c54 with SMTP id
 xi14-20020a170906dace00b009a1680e8c54mr7002213ejb.71.1698634379204; Sun, 29
 Oct 2023 19:52:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169858752781.1095326.10615907253726224231@leemhuis.info>
 <CAHk-=wgEHNFHpcvnp2X6-fjBngrhPYO=oHAR905Q_qk-njV31A@mail.gmail.com> <CAAhV-H4DXYm+nEV8zrfMMPvqstHV+FsQaFB8s1_rNu_ENC-q7g@mail.gmail.com>
In-Reply-To: <CAAhV-H4DXYm+nEV8zrfMMPvqstHV+FsQaFB8s1_rNu_ENC-q7g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 29 Oct 2023 16:52:42 -1000
X-Gmail-Original-Message-ID: <CAHk-=wiX0j=8DB0EbCheAAfcx2z99QUZMTeJUxSBGpb0J5pjVg@mail.gmail.com>
Message-ID: <CAHk-=wiX0j=8DB0EbCheAAfcx2z99QUZMTeJUxSBGpb0J5pjVg@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2023-10-29]
To: Huacai Chen <chenhuacai@kernel.org>
Cc: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>, 
	Javier Martinez Canillas <javierm@redhat.com>, LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, 29 Oct 2023 at 16:18, Huacai Chen <chenhuacai@kernel.org> wrote:
>
> We are investigating and hope the simpledrm problem can be fixed in
> some days [1],

I don't understand your "some days".  The original report was two+
weeks ago, and the link you point to does not seem to have a suggested
patch for the problem either.

So where does the "some days" come from?

The WHOLE POINT of the "no regressions" rule - and the reason it came
to be in the first place - was that we used to have these endless "one
step forward, two steps back" things with suspend/resume in
particular, where people fixed one device, but then broke a random
number of other devices, and kept saying " but I fixed something".

No. If you broke something else, YOU DIDN'T FIX ANYTHING AT ALL.

This is literally why we have that "no regressions" rule. No amount of
"but it's a fix" is valid at all if something else breaks. And no
amount of "I will fix the thing I broke in the future"  is valid
either.

If you don't have a fix for it, it's broken. And I don't even see a
*suggested* fix for people to try out.

> and the blank screen seems not a very harmful problem
> (maybe I'm wrong but I think most of people are using GUI now). So,
> can we keep the commit 60aebc9559492c at this time?

At least the email from Evan Preston seems to imply it's a blank
screen that doesn't go away.

  "Upgrading from Linux 6.4.12 to 6.5 and later results in only a
blank screen after boot and a rapidly flashing device-access-status
indicator"

And no, "most people using GUI" doesn't matter. You are supposed to be
able to upgrade your working kernel, and it's supposed to keep
working. That's *important*, because it's really really important that
people *trust* that they can upgrade the kernel and not end up with
something non-working, because that's how people then dare do kernel
updates and dare test new kernels.

If people then stop testing new kernels because they think new kernels
might break their setup, we have lost something truly important.

And yes, there are always exceptions. At some point, devices are just
too old legacy and there is no way of testing. Or we've had some
interface that was *so* mis-designed that it was a fundamental
security issue or something like that.

But no, this does not seem to be one of those issues.

Now, I'm not going to revert it just before releasing v6.6 (which I
have locally tagged, but not pushed out yet). And I'll have the merge
window for 6.7 opening tomorrow. But if this is not fixed by -rc1,
we'll just revert it.

                    Linus
