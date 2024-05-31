Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE801420A8
	for <regressions@lists.linux.dev>; Fri, 31 May 2024 10:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717150605; cv=none; b=Fp92ZPJsfJLD/Us6tvNso8sI6nBjIEaeYOICuv3A2NJRfGDjcMw+bLfK2Co2KiXrRSOIQjSr8vp42qQQjRssbIoxMeNDKTSU84ic5VRuzFWfCDj+JjSpVSFTWvsmmbWAhqCpHtXvNu9eV5/aG2OtAeibXVO0oLBWJpgB8Iu9sj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717150605; c=relaxed/simple;
	bh=9Ixc4uT40d9cWsVy5xUsgDt/qla9QUa27kCQYIFH2Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJuKKSesxPAjlCRmm8DDt5KdfJC8COKnJO1nagTciCElqiFI+uGhHy8rhCzhVWLKY+BtFc3/isLTB02KZLlAV2M/7ti85n6BzHO/e+ICWBQKA3MxnnoI4eSWFTE5TD/CrGlCIJkACefynOKFk035DKWVuUZkmXnjqcGC7+aKO2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j8chuz0s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j8chuz0s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790E5C32786;
	Fri, 31 May 2024 10:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717150604;
	bh=9Ixc4uT40d9cWsVy5xUsgDt/qla9QUa27kCQYIFH2Vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j8chuz0sgyEVg0cNWCbR2vwi+AQimOW4Ed+ig4uocQyDO+ji26vQnSNw8H+AbvsoW
	 7In1GM8WkQQFMwtLrKTkG6P5We1nH+cZds+OnEpYyWkgZwUeqpqB69CcOBTfPjddJ+
	 XcLIkfCZjmOSKoN1RJT1iR9JcCSN4eDbxOS94h/8=
Date: Fri, 31 May 2024 12:16:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	mad skateman <madskateman@gmail.com>,
	"R.T.Dickinson" <rtd2@xtra.co.nz>,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: Xorg doesn't start and some other issues with the RC1 of kernel
 6.10
Message-ID: <2024053145-tapered-kleenex-d647@gregkh>
References: <34d848f4-670b-4493-bf21-130ef862521b@xenosoft.de>
 <93f42bc8-f0ae-4f7f-8f25-a4e9faf8664b@xenosoft.de>
 <87zfs731jn.fsf@mail.lhotse>
 <87plt22w1k.fsf@mail.lhotse>
 <f4559641-2a64-4a1d-a00c-0f5ed85f3354@leemhuis.info>
 <2024053128-pueblo-skid-585e@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024053128-pueblo-skid-585e@gregkh>

On Fri, May 31, 2024 at 12:02:15PM +0200, Greg KH wrote:
> On Fri, May 31, 2024 at 11:19:34AM +0200, Thorsten Leemhuis wrote:
> > On 31.05.24 11:03, Michael Ellerman wrote:
> > > Michael Ellerman <mpe@ellerman.id.au> writes:
> > >> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
> > >>> On 28.05.24 22:00, Christian Zigotzky wrote:
> > >>>> Hi All,
> > >>>>
> > >>>> Xorg doesn't start anymore since the RC1 of kernel 6.10. We tested it 
> > >>>> with the VirtIO GPU and with some Radeon cards.
> > >>>>
> > >>>> Another error message: Failed to start Setup Virtual Console.
> > >>>>
> > >>>> Maybe this is the issue: + CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y
> > >>>>
> > >>>> Tested with FSL P5040, FSL P5020, and PASEMI boards.
> > >>>>
> > >>>> Could you please test Xorg on your PowerPC machines?
> > >>>>
> > >>>> Thanks,
> > >>>> Christian
> > >>> I tested the RC1 in a virtual e5500 QEMU PowerPC machine with Bochs VGA 
> > >>> (-device VGA,vgamem_mb=256) and Xorg doesn't start either.
> > >>>
> > >>> Error message: xf86OpenConsole: KDSETMODE KD_GRAPHICS failed 
> > >>> Inappropriate ioctl for device.
> > >>
> > >> That is presumably because of this:
> > >>   https://lore.kernel.org/all/0da9785e-ba44-4718-9d08-4e96c1ba7ab2@kernel.org/
> > > 
> > > Attempting to regzbot this.
> > > 
> > > #regzbot introduced: 8c467f330059
> > > #regzbot monitor: https://lore.kernel.org/all/0da9785e-ba44-4718-9d08-4e96c1ba7ab2@kernel.org/
> > 
> > Thx, I already had an eye on this, but thought tracking would not be
> > needed, as Greg (now CCed) wanted to revert 8c467f3300591a ("VT: Use
> > macros to define ioctls") two days ago:
> > https://lore.kernel.org/all/2024052901-police-trash-e9f9@gregkh/
> > 
> > But that commit is not yet in -next afaics. :-/
> > 
> > /me meanwhile wonders if it would be wise to fix this before -rc2
> 
> I do, sorry, been traveling this week with geen vrije tijd.  Will get to
> it tomorrow.

Ugh, sorry for the dutch, I have "no free time" because I am studying
the language this week.  It is bleeding over here into my emails now...

greg k-h
