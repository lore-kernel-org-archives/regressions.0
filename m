Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB7E179AD
	for <regressions@lists.linux.dev>; Sat,  1 Jun 2024 06:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717223653; cv=none; b=k7UIZxC6KEOf3EhMFDfeLZ6K7KT8IakRfK+lTbsZ+opos7bU4+mHl19HSLVxUZ+YTbSyHNWM/c4Spk8aO3fvpSsoN7ZvkHMZx9aSYTwXciHw1I4uzQpCDBaK+0rN6nk0XV5onlTD1P/6N6SDmWI99TIWE3tBKcLddiV0oQKflas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717223653; c=relaxed/simple;
	bh=EEzU5dGaHU9UQkrHXJaNA4lg0FFzlwxUvS1ydOAxB50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBAvuutUbieKSQlEzrkyajskSOT55svru90R8VxzWjYaa72wbVdun9BNEG/gOnQtHA0SsWc7AknXykey3epl6yhNHHa2x9/JveAIJBU8eM+0JlUQARbs3smvtiy6Z+6dY9n+zuOGPOkND9V9BPKPDYJ9n0TSBIcTlrFOr8STMP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=05bGu4sw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="05bGu4sw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C48C116B1;
	Sat,  1 Jun 2024 06:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717223652;
	bh=EEzU5dGaHU9UQkrHXJaNA4lg0FFzlwxUvS1ydOAxB50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=05bGu4swaVZhwATYytBEYpGFYHkJRtGe4LQYqn2XcOZ5zgJzeOlt5p9wq+tD24YCH
	 AA9kfPDTxr86r36CueyR9lUGEeEyDspaGaqO97MTkr7af6XqkMrrFSxSqrpdillLXC
	 7g1wdYjYb/MPr9Slpwgkw8f1CumSmsqD6mEBemNo=
Date: Sat, 1 Jun 2024 08:34:09 +0200
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
Message-ID: <2024060155-chemicals-carrot-ea58@gregkh>
References: <34d848f4-670b-4493-bf21-130ef862521b@xenosoft.de>
 <93f42bc8-f0ae-4f7f-8f25-a4e9faf8664b@xenosoft.de>
 <87zfs731jn.fsf@mail.lhotse>
 <87plt22w1k.fsf@mail.lhotse>
 <f4559641-2a64-4a1d-a00c-0f5ed85f3354@leemhuis.info>
 <2024053128-pueblo-skid-585e@gregkh>
 <2024053145-tapered-kleenex-d647@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024053145-tapered-kleenex-d647@gregkh>

On Fri, May 31, 2024 at 12:16:50PM +0200, Greg KH wrote:
> On Fri, May 31, 2024 at 12:02:15PM +0200, Greg KH wrote:
> > On Fri, May 31, 2024 at 11:19:34AM +0200, Thorsten Leemhuis wrote:
> > > On 31.05.24 11:03, Michael Ellerman wrote:
> > > > Michael Ellerman <mpe@ellerman.id.au> writes:
> > > >> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
> > > >>> On 28.05.24 22:00, Christian Zigotzky wrote:
> > > >>>> Hi All,
> > > >>>>
> > > >>>> Xorg doesn't start anymore since the RC1 of kernel 6.10. We tested it 
> > > >>>> with the VirtIO GPU and with some Radeon cards.
> > > >>>>
> > > >>>> Another error message: Failed to start Setup Virtual Console.
> > > >>>>
> > > >>>> Maybe this is the issue: + CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y
> > > >>>>
> > > >>>> Tested with FSL P5040, FSL P5020, and PASEMI boards.
> > > >>>>
> > > >>>> Could you please test Xorg on your PowerPC machines?
> > > >>>>
> > > >>>> Thanks,
> > > >>>> Christian
> > > >>> I tested the RC1 in a virtual e5500 QEMU PowerPC machine with Bochs VGA 
> > > >>> (-device VGA,vgamem_mb=256) and Xorg doesn't start either.
> > > >>>
> > > >>> Error message: xf86OpenConsole: KDSETMODE KD_GRAPHICS failed 
> > > >>> Inappropriate ioctl for device.
> > > >>
> > > >> That is presumably because of this:
> > > >>   https://lore.kernel.org/all/0da9785e-ba44-4718-9d08-4e96c1ba7ab2@kernel.org/
> > > > 
> > > > Attempting to regzbot this.
> > > > 
> > > > #regzbot introduced: 8c467f330059
> > > > #regzbot monitor: https://lore.kernel.org/all/0da9785e-ba44-4718-9d08-4e96c1ba7ab2@kernel.org/
> > > 
> > > Thx, I already had an eye on this, but thought tracking would not be
> > > needed, as Greg (now CCed) wanted to revert 8c467f3300591a ("VT: Use
> > > macros to define ioctls") two days ago:
> > > https://lore.kernel.org/all/2024052901-police-trash-e9f9@gregkh/
> > > 
> > > But that commit is not yet in -next afaics. :-/
> > > 
> > > /me meanwhile wonders if it would be wise to fix this before -rc2
> > 
> > I do, sorry, been traveling this week with geen vrije tijd.  Will get to
> > it tomorrow.
> 
> Ugh, sorry for the dutch, I have "no free time" because I am studying
> the language this week.  It is bleeding over here into my emails now...

Pull request now sent:
	https://lore.kernel.org/r/Zlq8yMiUBTOisuWp@kroah.com
