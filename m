Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E133AC35
	for <regressions@lists.linux.dev>; Thu, 26 Oct 2023 19:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NlCl4aEI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B39C433C8;
	Thu, 26 Oct 2023 19:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698347695;
	bh=H+MsyQu8g5N65Gg9ktlkHBBwf6jTB93WldhBOhGiFMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NlCl4aEIUHF/LO1aEO5gRKQNSLdudW8Trwwhz0VuXh+cEW5OidNzlhWM6cqqHafWB
	 iU3/Zk+43lu1lCjRfngMpumTmDfDtyqkT5FQklsrK3zMsTk8ApAeRjskocd/zW/e/s
	 bA64d6nNVIVbYaD1r2DhCx7H71ADARShEFklvlX4=
Date: Thu, 26 Oct 2023 21:14:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: LihaSika <lihasika@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Linux kernel 6.1 - drivers/usb/storage/unusual_cypress.h "Super
 Top" minimum bcdDevice too high
Message-ID: <2023102630-enviable-stood-9b2d@gregkh>
References: <7bfd4f9e-9f8d-4102-ab03-7d0401f00513@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7bfd4f9e-9f8d-4102-ab03-7d0401f00513@gmail.com>

On Thu, Oct 26, 2023 at 06:32:02PM +0300, LihaSika wrote:
> Hi,	
> 
> in kernel 6.1 (maybe 5.x - 6.x) there's an ATACB setting for "Super Top USB
> 2.0 SATA Bridge" -devices, where the minimum bcdDevice version to match has
> been set to 1.60. It's in the file drivers/usb/storage/unusual_cypress.h:
> 
> """
> UNUSUAL_DEV( 0x14cd, 0x6116, 0x0160, 0x0160,
>  		"Super Top",
>  		"USB 2.0  SATA BRIDGE",
>  		USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),
> """
> 
> My old USB HDD with a "Super Top" bridge has bcdDevice version 1.50, thus
> the setting won't match and it will not mount.
> 
> I'm not sure when this changed (after kernel 4.x?), but it used to work
> before. Reading some earlier bug reports, it seems that the max version used
> to be 0x9999, which then caused corruption in "Super Top" devices with
> version >=2.20. So that's a reason for lowering the maximum value, but I
> wonder why the minimum value has also been set to 0x0160.
> 
> 
> I created a patch, changing 0x0160 to 0x0150 (though I should've left the
> max version as it was...):
> 
> """
> UNUSUAL_DEV( 0x14cd, 0x6116, 0x0150, 0x0150,
> """
> 
> Built, installed and rebooted; now the USB HDD can be mounted and works
> perfectly again. I did some write & read tests, checked with diff, cmp and
> md5sum - no corruption, everything OK 👍

Please submit a proper patch to the linux-usb@vger.kernel.org mailing
list and we will be glad to take it from there.

thanks,

greg k-h
