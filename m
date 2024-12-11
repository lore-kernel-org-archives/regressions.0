Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFA9246356
	for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 15:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733930533; cv=none; b=owFMy8Y5cpc0Qa01mxQQ3EZRoP+8SsQL0jWxO7wo3WIBiWe6Mf7qtJtKoxbNaw79gMuqYirO1Q1jc+vw/A421G9wjejvRYCA7xk4ZRFKph0TPRBPBMe+DsGGRo7bWT7TPcJ8Lch/EC8q7O6g17+q3rq/bzWeHO6eARhdiDCAScU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733930533; c=relaxed/simple;
	bh=BEajb66fv5ISU7KilfoMDfuQLWj5xAaw+py5oQe1/W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tC2YuGfycSbbes0Aa6DHn24xLZ2cshf0d/MNeJA5PuAbx2JgXUU2tLCJQ5qHPzGd3Gik1dapNCdr1HL26JN04p9na4J/FFTwSr4WeO3rSbpu0b9hH2LFTbXBbAz/gt8qK1YX3MG8hVuaWmh/aYSRkcXeSrHNSaNWLqG+mwlaccY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fUbWkepL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fUbWkepL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92019C4CED2;
	Wed, 11 Dec 2024 15:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733930533;
	bh=BEajb66fv5ISU7KilfoMDfuQLWj5xAaw+py5oQe1/W4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUbWkepLV+LvQ9ZJmV1jXtKTVaCWlN1PgyVS5eI08vUwVVAgUk947VGQX9z6mVkt8
	 slCkliHvlasyaWO3AUG2ngh47HTBaQLpx6ERAygN/4NI9iTFmdJAUB05XhYi/SO5rM
	 gUfy1epuGFgChomDRY0bRcYUVK2QIQzD7FsnJblk=
Date: Wed, 11 Dec 2024 16:22:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	=?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	regressions@lists.linux.dev,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [REGRESSION] Linux 6.6.64 crashes when booting as PVH domU
Message-ID: <2024121131-blip-container-01ce@gregkh>
References: <Z1l6XbHP6BTTZSwr@mail-itl>
 <fe8db5b2-7524-49ea-ab8e-21f831dc009f@suse.com>
 <CAMj1kXHSiCo7FH0Mo-_R9HjxhthddPUZfgm5c8yj7vjGvgfTPg@mail.gmail.com>
 <Z1mF0UZPNLjYAJI7@mail-itl>
 <CAMj1kXFVd+2n1fRoOriwmAPH8yX22gSy7_m_1SVjtoG3r_=-Tw@mail.gmail.com>
 <Z1mWFcm_036BrvEq@mail-itl>
 <2024121144-false-playtime-968e@gregkh>
 <CAMj1kXEH4jaFyFMMN41UqdkjfSrN19cwJsiAYnX6jETvDagF-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMj1kXEH4jaFyFMMN41UqdkjfSrN19cwJsiAYnX6jETvDagF-g@mail.gmail.com>

On Wed, Dec 11, 2024 at 04:10:11PM +0100, Ard Biesheuvel wrote:
> On Wed, 11 Dec 2024 at 14:46, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Dec 11, 2024 at 02:39:33PM +0100, Marek Marczykowski-Górecki wrote:
> > > On Wed, Dec 11, 2024 at 01:37:52PM +0100, Ard Biesheuvel wrote:
> > > > (cc Greg)
> > > >
> > > > On Wed, 11 Dec 2024 at 13:30, Marek Marczykowski-Górecki
> > > > <marmarek@invisiblethingslab.com> wrote:
> > > > >
> > > > > On Wed, Dec 11, 2024 at 01:24:08PM +0100, Ard Biesheuvel wrote:
> > > > > > On Wed, 11 Dec 2024 at 12:53, Jürgen Groß <jgross@suse.com> wrote:
> > > > > > >
> > > > > > > Jason, Ard,
> > > > > > >
> > > > > > > I guess there are some prereq patches missing in stable 6.6.y branch?
> > > > > > >
> > > > > > >
> > > > > > > Juergen
> > > > > > >
> > > > > > > On 11.12.24 12:41, Marek Marczykowski-Górecki wrote:
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > With Linux 6.6.64 I get the following crash on domU boot:
> > > > > > > >
> > > > > > > > (XEN) d5v0 Triple fault - invoking HVM shutdown action 1
> > > > > > > > (XEN) *** Dumping Dom5 vcpu#0 state: ***
> > > > > > > > (XEN) ----[ Xen-4.19.0  x86_64  debug=n  Tainted:  M     ]----
> > > > ...
> > > > > > > >
> > > > > > > > Linux 6.6.63 works fine.
> > > > > > > >
> > > > > > > > Looking at the changes, I suspect one of those:
> > > > > > > >
> > > > > > > >      83d123e27623 x86/pvh: Call C code via the kernel virtual mapping
> > > > > > > >      f662b4a69e1d x86/pvh: Set phys_base when calling xen_prepare_pvh()
> > > > > > > >
> > > > > >
> > > > > > The second patch shouldn't have been backported. It is unnecessary,
> > > > > > given that in the old situation, the kernel image needs to be loaded
> > > > > > at a fixed address. And it assumes  that %rbp is set to the physical
> > > > > > load offset, but those patches were not backported.
> > > > >
> > > > > It has this tag:
> > > > >
> > > > >     Stable-dep-of: e8fbc0d9cab6 ("x86/pvh: Call C code via the kernel virtual mapping")
> > > > >
> > > >
> > > > That was added by the stable maintainers - someone grabbed a patch
> > > > from the middle of an unrelated series to make e8fbc0d9cab6 apply
> > > > without lexical conflicts.
> > > >
> > > > > Does it mean neither of them should be backported?
> > > > >
> > > > > But then, the e8fbc0d9cab6 has "Fixes:" tag (pointing at very old
> > > > > commit).
> > > > >
> > > >
> > > > If someone thinks e8fbc0d9cab6 should be backported, they should
> > > > rebase it onto v6.6.y, not backport random other patches until
> > > > git-apply stops complaining. And ideally, someone would build and boot
> > > > the result to check whether it works.
> > > >
> > > > For now, it would be better to revert both.
> > >
> > > I can confirm that reverting both commits fixes the issue.
> >
> > Ok, thanks, let me go rip all of these out and do a new release now to
> > fix the issue.  Sorry about that, and thanks so much for the testing and
> > letting us know!
> >
> 
> I guess 6.11 is beyond repair?

6.11.y is end-of-life for a week or so now, sorry.  Hopefully no one is
still using it (I did hear that Fedora is using it, so I don't know...)

greg k-h
