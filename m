Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8564F10E8
	for <regressions@lists.linux.dev>; Mon, 30 Oct 2023 03:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezHslCVo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE718C433C7
	for <regressions@lists.linux.dev>; Mon, 30 Oct 2023 03:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698635423;
	bh=TFMOp8TzxITL1T38IXFw5jxaPucw+UKxCq1ogDHX0+o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ezHslCVovDxqYyrUN3R6ud1mW+905ohpo1hVH1Jfl8DuAGd9lcos7+THpyGeLGwAQ
	 dlbWxXmGBD+gynza7Ox2CoiT4VtUSnPaJe5DNJNQOuUXtie20pk2yv2Zs8ITal801h
	 nMEapnXiDkkab9WkcNk3AznKAmLp5Iafr3L2OQWmgM+HNlWy/kCuf7/Q2W2CCIPuVn
	 hxXhrHco+Ht0t3oGJVvUak5wCBqDkn8XuFiARX/IdDKGM1SM3fpYRtVW6OzdgRVpjG
	 ouXcv7XaO9zEWzxxlnpDeh8atv3aJS6sLS4okzjNrZsxf2HEqgGPhp/LpUEAB+7ZO+
	 727jtP7pEofmQ==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9be02fcf268so591426366b.3
        for <regressions@lists.linux.dev>; Sun, 29 Oct 2023 20:10:22 -0700 (PDT)
X-Gm-Message-State: AOJu0YzR7BLJx+XldNn0dqL2Bo0MlcQ0mDuD0Srx2BuZv48gqi4bBUR3
	aV+Tr7l6JqN5orZtCnKP9Eb2rn0bsFMF6FaqNkw=
X-Google-Smtp-Source: AGHT+IGJrWtby1GutFekFhw5fGf6mylDk25rQb8iD/nOoRoHbwxcfcI9kcaJqNpGTN/jhEGiXrCib4X9oP5t+unxXpY=
X-Received: by 2002:a17:907:2da4:b0:9b2:7b89:8199 with SMTP id
 gt36-20020a1709072da400b009b27b898199mr7883603ejc.53.1698635421420; Sun, 29
 Oct 2023 20:10:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169858752781.1095326.10615907253726224231@leemhuis.info>
 <CAHk-=wgEHNFHpcvnp2X6-fjBngrhPYO=oHAR905Q_qk-njV31A@mail.gmail.com>
 <CAAhV-H4DXYm+nEV8zrfMMPvqstHV+FsQaFB8s1_rNu_ENC-q7g@mail.gmail.com> <CAHk-=wiX0j=8DB0EbCheAAfcx2z99QUZMTeJUxSBGpb0J5pjVg@mail.gmail.com>
In-Reply-To: <CAHk-=wiX0j=8DB0EbCheAAfcx2z99QUZMTeJUxSBGpb0J5pjVg@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 30 Oct 2023 11:10:09 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4Z_yiOvc_BxZvcb4TZW9uOqMfMcX8JHCaJsgawoabmXw@mail.gmail.com>
Message-ID: <CAAhV-H4Z_yiOvc_BxZvcb4TZW9uOqMfMcX8JHCaJsgawoabmXw@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2023-10-29]
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>, 
	Javier Martinez Canillas <javierm@redhat.com>, LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Linus,

On Mon, Oct 30, 2023 at 10:53=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sun, 29 Oct 2023 at 16:18, Huacai Chen <chenhuacai@kernel.org> wrote:
> >
> > We are investigating and hope the simpledrm problem can be fixed in
> > some days [1],
>
> I don't understand your "some days".  The original report was two+
> weeks ago, and the link you point to does not seem to have a suggested
> patch for the problem either.
>
> So where does the "some days" come from?
>
> The WHOLE POINT of the "no regressions" rule - and the reason it came
> to be in the first place - was that we used to have these endless "one
> step forward, two steps back" things with suspend/resume in
> particular, where people fixed one device, but then broke a random
> number of other devices, and kept saying " but I fixed something".
>
> No. If you broke something else, YOU DIDN'T FIX ANYTHING AT ALL.
>
> This is literally why we have that "no regressions" rule. No amount of
> "but it's a fix" is valid at all if something else breaks. And no
> amount of "I will fix the thing I broke in the future"  is valid
> either.
>
> If you don't have a fix for it, it's broken. And I don't even see a
> *suggested* fix for people to try out.
>
> > and the blank screen seems not a very harmful problem
> > (maybe I'm wrong but I think most of people are using GUI now). So,
> > can we keep the commit 60aebc9559492c at this time?
>
> At least the email from Evan Preston seems to imply it's a blank
> screen that doesn't go away.
>
>   "Upgrading from Linux 6.4.12 to 6.5 and later results in only a
> blank screen after boot and a rapidly flashing device-access-status
> indicator"
>
> And no, "most people using GUI" doesn't matter. You are supposed to be
> able to upgrade your working kernel, and it's supposed to keep
> working. That's *important*, because it's really really important that
> people *trust* that they can upgrade the kernel and not end up with
> something non-working, because that's how people then dare do kernel
> updates and dare test new kernels.
>
> If people then stop testing new kernels because they think new kernels
> might break their setup, we have lost something truly important.
>
> And yes, there are always exceptions. At some point, devices are just
> too old legacy and there is no way of testing. Or we've had some
> interface that was *so* mis-designed that it was a fundamental
> security issue or something like that.
>
> But no, this does not seem to be one of those issues.
>
> Now, I'm not going to revert it just before releasing v6.6 (which I
> have locally tagged, but not pushed out yet). And I'll have the merge
> window for 6.7 opening tomorrow. But if this is not fixed by -rc1,
> we'll just revert it.
OK, I know. I will try my best. Thank you.

Huacai

>
>                     Linus
