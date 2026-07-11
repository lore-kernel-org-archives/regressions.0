Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78F4370AC1
	for <regressions@lists.linux.dev>; Sat, 11 Jul 2026 07:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783755888; cv=none; b=uDKFOzvONqj/J2g5bGP6BrAqudBJDsFgPCdgsDXlnM2s/6Ezpw5g579t3UwKmRY7NQ85b+5CVCbybUx3m5kE7fc9YRipndurYyH/ukDB9WRWED3JuYPuvUlY9nEmizvuINxaG7rd06GUeLjcCpg7InRFfX9hdg5yAYWejQydlt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783755888; c=relaxed/simple;
	bh=Nmwy8CSPyk/pQm1I/Q0EsES15oGXxoJXksotkTNmZ34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFMTI2P6Ktfp7kKI8XZM5wmLY6NfAS1WosHbdXn1BbpNscyMz4m+P8HEUPCoqDt1Arfmbmixu9CyNZAtJx5vQYw3ESDq+IpLU28yZHP6UqCbVWJydszqw+lADiJLxizM6nV3WTZs0yfvtUZuw4RLB8rq6GItmtIbLuaMqMC1BeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=S9457VnI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="S9457VnI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81CE1F000E9;
	Sat, 11 Jul 2026 07:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783755887;
	bh=WlxPlyYvhzimJz10H65yTFze0fPTm94Cj68yNtt5HZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S9457VnI0xNz9PzayWfMkgZmRi2IVlB3r+6tNFKU7u1SuDQ9M6bT5RzvMP6Msy3NH
	 Vm8W8JuLCw5ZF2Rj27t1/+b/UrexSXHhFTV9dip7FMXdul0xGhTZT7b5d3hV6TpVYU
	 UqyRVLKoADUSDkCBPSRw7m79+xJtbMn2r/9inEHA=
Date: Sat, 11 Jul 2026 09:43:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Papool Chaudhari <Papool@chaudharilaw.com>
Cc: regressions@lists.linux.dev
Subject: Re: [REGRESSION] 2017 =?utf-8?Q?Pixelbook_?=
 =?utf-8?Q?backlight_control_doesn=E2=80=99t?= work with 7.1 kernel
Message-ID: <2026071153-wrench-operating-e32d@gregkh>
References: <CALcz8n5nB=H8CZza-Pw==GfQWRViJwWK8N5PgafE-4pdUJL-LA@mail.gmail.com>
 <2026070936-geologist-yapping-31f4@gregkh>
 <CALcz8n6VtL5D20WCJEsiBRDRKOE6GsF+YPCc+XuS2xr-mqnSTg@mail.gmail.com>
 <2026071109-armchair-civil-7b62@gregkh>
 <CALcz8n4XCt8GK0X=JTDOkMn32Z73HpHKRNaRCdSf=mzr3+r27A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALcz8n4XCt8GK0X=JTDOkMn32Z73HpHKRNaRCdSf=mzr3+r27A@mail.gmail.com>

On Sat, Jul 11, 2026 at 01:11:06AM -0600, Papool Chaudhari wrote:
> I tried reverting commit b3793af3277f65d256d67f9949e760b434ff66dd on
> top of v7.1, but the resulting kernel completely hangs at 'Loading
> initial ramdisk'. Even when adding 'nomodeset' via GRUB, the crash
> happens so early that no kernel text or console output is ever
> printed. It appears this Intel THC merge cannot be cleanly isolated or
> reverted on v7.1 without causing an immediate early boot failure on
> this hardware.

A merge point is usually not a good place to revert, as that can be
"odd".  I also don't really see a diff at this point in time, so can you
try both sides of the merge to see if they both work, or not?

thanks,

greg k-h
