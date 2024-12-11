Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2AC225A52
	for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 12:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733920686; cv=none; b=qv6WuGCh4yBM9JHW+H/s5/tw/Jf16yRwXCd2Nb2u//RQj4Kmia8CpgypVRDOw8JaDMk0KbYkh17FeevhMg80hfTpLUhEzHVmU+s32TVtHoju6UJQYHBzfvQTeTmQXyRJxdXx3Y2CCzzqQLLI/94os16ep0Co/cFFQ08yUDDzN5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733920686; c=relaxed/simple;
	bh=6A/dn3jhCarDUX1HaOcKFvjQuIdb9vSoHfumK815F90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCur0wtg7wYo8DP99YeqsYNnp5X2XgQMAyLyXn3cJR+Z40jQ2BFO0xsEVBLlxzy/TZHh+p9imw2j5PY54PpgR5c/wTfscqZICkMWAv2OSfzQCG1mX1PsYgoY/53XzDi35UviiV0Mn2WGDAFJpQ6FJS/Nm8+v65KDiyXmCAq77ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q4DSz1GL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4DSz1GL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6ABC4CEE2
	for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 12:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733920686;
	bh=6A/dn3jhCarDUX1HaOcKFvjQuIdb9vSoHfumK815F90=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q4DSz1GLCbO8+y0aP5+TQn+JjZKD3ctl3GQzExXHYIGHidHL7mAXgTvSucnbISs3A
	 uLFE4RwEqMyU3BH2GzAeSvtYS3n8goBVm08DdxqEhH2bf6HkTHTeiSe3DkrplF7F9z
	 CB4DlVQmKTKRyWVPwAomyA63vGwAa+y0GZ9oOZrz7WkCRVWKQS7JTib8/P6sEc4dtS
	 s82zbC5xFXIVoDQsiAZJZtjNmqcw71X+IQ2KFj77WCggvT5zhBz20C3QtKU/bjDmax
	 /blejr9s+lXe7vJEBZAI9JCOtkiwnOV8fiKXhEs+yGs+dfZcYWazx1LGfnTuPAYGp1
	 QCLHJY2AI5gHA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3022598e213so28209931fa.0
        for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 04:38:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXlCXA5QN2OCPMuUbT7BPmXmA36j3oVzAr/4umVKlWLsDqKqVJfYtyXu7Fwy3cTZeBMBJPsZm6l/BHVaw==@lists.linux.dev
X-Gm-Message-State: AOJu0YypCu4QK1JOL0201emQHaULwhmJSRKa3IRo1jaKW1zkkchNJqzB
	xfCnn9OnQ30dxUE59uG5zjkRJ1J8gx05hP9Y4fIsCecftBpKv8/5E1hSkmpv0vdXJxyhDGv/wIP
	auxa1UzTFDz4gtas3oCZ8NZrddG0=
X-Google-Smtp-Source: AGHT+IG209dne0Tl3T71dc7VTtvkNHUQ3p5KRJK5FqQ+uJfsXMe55P5rmszraCwAe9lOAQ+gFW57du1YR1C48KbWC1I=
X-Received: by 2002:a2e:bc25:0:b0:300:1aa5:4938 with SMTP id
 38308e7fff4ca-30240cfb89amr8571701fa.18.1733920684444; Wed, 11 Dec 2024
 04:38:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z1l6XbHP6BTTZSwr@mail-itl> <fe8db5b2-7524-49ea-ab8e-21f831dc009f@suse.com>
 <CAMj1kXHSiCo7FH0Mo-_R9HjxhthddPUZfgm5c8yj7vjGvgfTPg@mail.gmail.com> <Z1mF0UZPNLjYAJI7@mail-itl>
In-Reply-To: <Z1mF0UZPNLjYAJI7@mail-itl>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 11 Dec 2024 13:37:52 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFVd+2n1fRoOriwmAPH8yX22gSy7_m_1SVjtoG3r_=-Tw@mail.gmail.com>
Message-ID: <CAMj1kXFVd+2n1fRoOriwmAPH8yX22gSy7_m_1SVjtoG3r_=-Tw@mail.gmail.com>
Subject: Re: [REGRESSION] Linux 6.6.64 crashes when booting as PVH domU
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, 
	Jason Andryuk <jandryuk@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, regressions@lists.linux.dev, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(cc Greg)

On Wed, 11 Dec 2024 at 13:30, Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Wed, Dec 11, 2024 at 01:24:08PM +0100, Ard Biesheuvel wrote:
> > On Wed, 11 Dec 2024 at 12:53, J=C3=BCrgen Gro=C3=9F <jgross@suse.com> w=
rote:
> > >
> > > Jason, Ard,
> > >
> > > I guess there are some prereq patches missing in stable 6.6.y branch?
> > >
> > >
> > > Juergen
> > >
> > > On 11.12.24 12:41, Marek Marczykowski-G=C3=B3recki wrote:
> > > > Hi,
> > > >
> > > > With Linux 6.6.64 I get the following crash on domU boot:
> > > >
> > > > (XEN) d5v0 Triple fault - invoking HVM shutdown action 1
> > > > (XEN) *** Dumping Dom5 vcpu#0 state: ***
> > > > (XEN) ----[ Xen-4.19.0  x86_64  debug=3Dn  Tainted:  M     ]----
...
> > > >
> > > > Linux 6.6.63 works fine.
> > > >
> > > > Looking at the changes, I suspect one of those:
> > > >
> > > >      83d123e27623 x86/pvh: Call C code via the kernel virtual mappi=
ng
> > > >      f662b4a69e1d x86/pvh: Set phys_base when calling xen_prepare_p=
vh()
> > > >
> >
> > The second patch shouldn't have been backported. It is unnecessary,
> > given that in the old situation, the kernel image needs to be loaded
> > at a fixed address. And it assumes  that %rbp is set to the physical
> > load offset, but those patches were not backported.
>
> It has this tag:
>
>     Stable-dep-of: e8fbc0d9cab6 ("x86/pvh: Call C code via the kernel vir=
tual mapping")
>

That was added by the stable maintainers - someone grabbed a patch
from the middle of an unrelated series to make e8fbc0d9cab6 apply
without lexical conflicts.

> Does it mean neither of them should be backported?
>
> But then, the e8fbc0d9cab6 has "Fixes:" tag (pointing at very old
> commit).
>

If someone thinks e8fbc0d9cab6 should be backported, they should
rebase it onto v6.6.y, not backport random other patches until
git-apply stops complaining. And ideally, someone would build and boot
the result to check whether it works.

For now, it would be better to revert both.
