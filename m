Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6F324634C
	for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733929825; cv=none; b=bwu4KSyioaTujrSXDDWqDAX5TL4B0HP0aQjqOiLFG31ASekwPqK5Lot3LDcyMYtP6uufIGxQi6Gl8ZPBwWpdXwUs2a/Rd752HhMEenAmp4icNR2IecalfyBi8uI1/UEvdw6dmU44HNXEKT0yXcZGNCAwOqX/ETfaYCqgFQNJgsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733929825; c=relaxed/simple;
	bh=vwMne/K0j8rrpH/mQjtZ5MhGf+oQP7w7hqp0euRGM1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YCm1vAoh1o08xSR+VhR42mkRKQrd2fuK+CboFRRYOu6nYorFbh7f7qqyH4l68PxpX5bkDXs/UL36Hv1vSxV25WK00YrwIjU32SXPjeKXIKyBiHgD+PHjkiPkqW7C/jP1EUfFno8wPv37cqKRsLZbD/Kgj+FaRM6CZm0DeWQGZZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQ4HLuF6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQ4HLuF6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D5DC4CED4
	for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 15:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733929824;
	bh=vwMne/K0j8rrpH/mQjtZ5MhGf+oQP7w7hqp0euRGM1A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RQ4HLuF6JC1GgROlngq5G+okeXtK0tEW3apDaBThJ0QNyKpSbvmg7ub2QP3HqD7wn
	 LlM7G257UsutNwKOFhQykFg5iBD/lrON/1NsXELZ1W+pph51V93njc9iN9WDE+RPq9
	 OMALZbBMLbB3M13ejgVoR02QfY427EQCoJB2ewZW33S+nAgom30xR/YE3FSgIgmyHv
	 t2qM99EvZF05QtiVhTkMu0d51lSozNW6KjahLY9Ok/lr/N6h+zmQ4K7/KzezxShm6x
	 08FOnQXin2lYT72wDaPHbIXkfP8jamHnTNKfAgXg7yYf9KPEbqEw2ETTskgFyG5tqO
	 yImVDjRRS/rEw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3022598e213so29720831fa.0
        for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 07:10:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWK7c2hBlP//n3FStPZjrawPKsiZJsIxqY+JYpUkC9buT/a24pHp9cwy620q7JNKfaByb9OJpZfPfZn+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBAEozuGzd++TYSrz4LuLoEFoA6rD8GeYl7u+9ZaWUYZEDIltN
	QegNTNcZy6emUHxCu4uq/rs1sJAUTarPOCrgdgAoI+61H+FbRe6Zk4Ra5kc6vrRWxcFskpik1Hd
	+I1k/J5jDkvhSgKo0NXH3YVspVeg=
X-Google-Smtp-Source: AGHT+IEH2haSPiKkqpS7Re3sKBMuXnJYr1qHANTQL7CO42YZMOsFAblQcWfjwoKqa/dgt/iFcSPfS+HSQCIAEOV6h6Q=
X-Received: by 2002:a2e:bcc4:0:b0:300:7f87:a6a with SMTP id
 38308e7fff4ca-30240ca0ad1mr13544001fa.7.1733929823030; Wed, 11 Dec 2024
 07:10:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z1l6XbHP6BTTZSwr@mail-itl> <fe8db5b2-7524-49ea-ab8e-21f831dc009f@suse.com>
 <CAMj1kXHSiCo7FH0Mo-_R9HjxhthddPUZfgm5c8yj7vjGvgfTPg@mail.gmail.com>
 <Z1mF0UZPNLjYAJI7@mail-itl> <CAMj1kXFVd+2n1fRoOriwmAPH8yX22gSy7_m_1SVjtoG3r_=-Tw@mail.gmail.com>
 <Z1mWFcm_036BrvEq@mail-itl> <2024121144-false-playtime-968e@gregkh>
In-Reply-To: <2024121144-false-playtime-968e@gregkh>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 11 Dec 2024 16:10:11 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEH4jaFyFMMN41UqdkjfSrN19cwJsiAYnX6jETvDagF-g@mail.gmail.com>
Message-ID: <CAMj1kXEH4jaFyFMMN41UqdkjfSrN19cwJsiAYnX6jETvDagF-g@mail.gmail.com>
Subject: Re: [REGRESSION] Linux 6.6.64 crashes when booting as PVH domU
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	=?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, 
	Jason Andryuk <jandryuk@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, regressions@lists.linux.dev, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Dec 2024 at 14:46, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Dec 11, 2024 at 02:39:33PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Wed, Dec 11, 2024 at 01:37:52PM +0100, Ard Biesheuvel wrote:
> > > (cc Greg)
> > >
> > > On Wed, 11 Dec 2024 at 13:30, Marek Marczykowski-G=C3=B3recki
> > > <marmarek@invisiblethingslab.com> wrote:
> > > >
> > > > On Wed, Dec 11, 2024 at 01:24:08PM +0100, Ard Biesheuvel wrote:
> > > > > On Wed, 11 Dec 2024 at 12:53, J=C3=BCrgen Gro=C3=9F <jgross@suse.=
com> wrote:
> > > > > >
> > > > > > Jason, Ard,
> > > > > >
> > > > > > I guess there are some prereq patches missing in stable 6.6.y b=
ranch?
> > > > > >
> > > > > >
> > > > > > Juergen
> > > > > >
> > > > > > On 11.12.24 12:41, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > With Linux 6.6.64 I get the following crash on domU boot:
> > > > > > >
> > > > > > > (XEN) d5v0 Triple fault - invoking HVM shutdown action 1
> > > > > > > (XEN) *** Dumping Dom5 vcpu#0 state: ***
> > > > > > > (XEN) ----[ Xen-4.19.0  x86_64  debug=3Dn  Tainted:  M     ]-=
---
> > > ...
> > > > > > >
> > > > > > > Linux 6.6.63 works fine.
> > > > > > >
> > > > > > > Looking at the changes, I suspect one of those:
> > > > > > >
> > > > > > >      83d123e27623 x86/pvh: Call C code via the kernel virtual=
 mapping
> > > > > > >      f662b4a69e1d x86/pvh: Set phys_base when calling xen_pre=
pare_pvh()
> > > > > > >
> > > > >
> > > > > The second patch shouldn't have been backported. It is unnecessar=
y,
> > > > > given that in the old situation, the kernel image needs to be loa=
ded
> > > > > at a fixed address. And it assumes  that %rbp is set to the physi=
cal
> > > > > load offset, but those patches were not backported.
> > > >
> > > > It has this tag:
> > > >
> > > >     Stable-dep-of: e8fbc0d9cab6 ("x86/pvh: Call C code via the kern=
el virtual mapping")
> > > >
> > >
> > > That was added by the stable maintainers - someone grabbed a patch
> > > from the middle of an unrelated series to make e8fbc0d9cab6 apply
> > > without lexical conflicts.
> > >
> > > > Does it mean neither of them should be backported?
> > > >
> > > > But then, the e8fbc0d9cab6 has "Fixes:" tag (pointing at very old
> > > > commit).
> > > >
> > >
> > > If someone thinks e8fbc0d9cab6 should be backported, they should
> > > rebase it onto v6.6.y, not backport random other patches until
> > > git-apply stops complaining. And ideally, someone would build and boo=
t
> > > the result to check whether it works.
> > >
> > > For now, it would be better to revert both.
> >
> > I can confirm that reverting both commits fixes the issue.
>
> Ok, thanks, let me go rip all of these out and do a new release now to
> fix the issue.  Sorry about that, and thanks so much for the testing and
> letting us know!
>

I guess 6.11 is beyond repair?
