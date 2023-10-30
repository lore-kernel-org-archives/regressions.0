Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BEB806
	for <regressions@lists.linux.dev>; Mon, 30 Oct 2023 02:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i3IBE5jj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021A1C433C7
	for <regressions@lists.linux.dev>; Mon, 30 Oct 2023 02:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698632307;
	bh=vBhYCrB7uo32w29lilqFBXGynaKlYU5cTQVKUZVOMlk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i3IBE5jjuibJjVzCg78xJ6nB8d58AEkjFRdHbtBO5cn3JOuNhd0HOoFhU/c5mjAAk
	 5i/KG1kU9fZwtqooprCj12e3iTYfd0p98DOhuekMFdXoUZxCgByF3Ut7OP+p9Y5W81
	 rNNRAotSoCO604gGYVlPf2YRhFRzP6ZUZaA0Gxdmn5bvG5xgjwR2sMKa4ftZsQ3yYZ
	 Xrcx6W3M0W2hnnPlrV5sqrCkYO5Tc2o4zwNM/S7ThDczuz2CwKKqchfIccP0TQDNDb
	 iUvWQ9ZU2KCOowycirFnMPT2gyiPp9m/V/mh62pOYbqy80KJgeJzgkccOkQidkMw2b
	 3QFnC3xdanrpA==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9c2a0725825so633020366b.2
        for <regressions@lists.linux.dev>; Sun, 29 Oct 2023 19:18:26 -0700 (PDT)
X-Gm-Message-State: AOJu0YzQu9I2SnMUWTaPCxqLNhYGRSod5sMXS9ynYeUdm/NL+p/Sq3Fo
	vSVLF+1ablqOdbuXedJUHvn/Hw6eV/jvcoHQidw=
X-Google-Smtp-Source: AGHT+IEfBoRT8aQJno8c4MqSJvGgsjkiwSNLO1n01eIcCtb+2522q9XLCrnjcES/+IpTRADhSoSTFigKqQZH9007VJk=
X-Received: by 2002:a17:907:94cf:b0:9ce:ed5:d902 with SMTP id
 dn15-20020a17090794cf00b009ce0ed5d902mr5942597ejc.1.1698632305406; Sun, 29
 Oct 2023 19:18:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169858752781.1095326.10615907253726224231@leemhuis.info> <CAHk-=wgEHNFHpcvnp2X6-fjBngrhPYO=oHAR905Q_qk-njV31A@mail.gmail.com>
In-Reply-To: <CAHk-=wgEHNFHpcvnp2X6-fjBngrhPYO=oHAR905Q_qk-njV31A@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 30 Oct 2023 10:18:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4DXYm+nEV8zrfMMPvqstHV+FsQaFB8s1_rNu_ENC-q7g@mail.gmail.com>
Message-ID: <CAAhV-H4DXYm+nEV8zrfMMPvqstHV+FsQaFB8s1_rNu_ENC-q7g@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2023-10-29]
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>, 
	Javier Martinez Canillas <javierm@redhat.com>, LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Linus,

On Mon, Oct 30, 2023 at 1:19=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sun, 29 Oct 2023 at 03:52, Regzbot (on behalf of Thorsten Leemhuis)
> <regressions@leemhuis.info> wrote:
> >
> >                          One of the remaining ones is new:
> > module loading trouble on some laptops. Not nice, but likely nothing
> > many users will encounter. The quota compilation oddity problem from
> > Andy is also still around (unless it was fixed without me noticing); an=
d
> > a memleak, too.
>
> The quota thing remains unexplained, and honestly seems like a timing
> issue that just happens to hit Andy. Very strange, but I suspect that
> without more reports (that may or may not ever happen), we're stuck.
>
> > * There was another report about a blank screen during boot on a Lenovo
> > laptop because simpledrm (that users apparently had enabled without
> > problems beforehand) started to support those machines due to
> > 60aebc9559492c ("drivers/firmware: Move sysfb_init() from
> > device_initcall to subsys_initcall_sync"). I suggested a revert, but th=
e
> > developers disagree (to quote: "From my point of view, this is not a
> > regression, 60aebc9559492c doesn't cause a problem, but exposes a
> > problem.")
>
> Honestly, "exposes a problem" is pretty much the *definition* of a
> regression. So that excuse is particularly bad.
>
> The whole point of "regression" is "things that used to work no longer wo=
rk".
>
> And no, "there's another bug that needs to be fixed" is _not_ the
> answer - not unless you have that fix in hand.
>
> That said, this already went into 6.5, so I'm not going to revert it
> now just before the 6.6 release. That would be more dangerous than
> just letting things be. But yes, a revert is likely the right thing to
> do, unless people have figured out what is wrong with simplefb.

We are investigating and hope the simpledrm problem can be fixed in
some days [1], and the blank screen seems not a very harmful problem
(maybe I'm wrong but I think most of people are using GUI now). So,
can we keep the commit 60aebc9559492c at this time?

[1] https://lore.kernel.org/dri-devel/CAAhV-H7UTnTWQeT_qo7VgBczaZo37zjosREr=
16H8DsLi21XPqQ@mail.gmail.com/T/#t

Huacai

>
>                  Linus
