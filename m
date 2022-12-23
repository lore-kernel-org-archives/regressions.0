Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344858476
	for <regressions@lists.linux.dev>; Fri, 23 Dec 2022 14:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C29C433D2;
	Fri, 23 Dec 2022 14:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1671805510;
	bh=bSqJ7HcxpsttK/hyQGKkiIamfM+v5bCaZMyEdaGuXDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z0RdYyRIXYQPqy5f0h7kUevWHWLzJd7pII+PjQFdMrDlFUIKONxDUPP6Of2g5tmRX
	 +VJEXVpwGORHDof8ZVE9ma4NbJh7evc01U8EcKh1SRxrCoyiO8rVknzEBqQb1wYHtf
	 cwxOs3PHkzRQGh8+G8fTSyN2xKc4QIh3CryR5/Xo=
Date: Fri, 23 Dec 2022 15:25:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergio Callegari <sergio.callegari@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Possible regression with kernel 6.1.0 freezing (6.0.14 is fine)
 on haswell laptop
Message-ID: <Y6W6Qxwq94y9QGFl@kroah.com>
References: <cb697d4e-406b-169b-c595-6521f8481304@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb697d4e-406b-169b-c595-6521f8481304@gmail.com>

On Fri, Dec 23, 2022 at 03:13:57PM +0100, Sergio Callegari wrote:
> Hi,
> 
> just a short note to report regular freezes with kernel 6.1.0 on a haswell
> laptop quad core Intel Core i7-4750HQ (-MT MCP-) with integrated graphics.
> 
> - system only freezes when launching the desktop environment (working on a
> text console while having the sddm login screen up, without logging in, does
> not seem to cause the issue);
> 
> - freezes happens a few seconds to a few minutes after getting to the
> desktop environment (that uses opengl and composition). Freeze happens both
> on X11 or Wayland.
> 
> - freeze seems to cause data loss (system not able to complete writes when
> the freeze occurs, data structures on disk get corrupted, e.g. system
> complained on broken btrfs snapshots made by timeshift-like app).
> 
> - system on freeze ceases responding to ping from the outside;
> 
> - upon reboot I cannot find any trace of any issue in the journal;
> 
> - on the same system booting kernels up to 6.0.14 is OK.

Can you use 'git bisect' to find the offending commit?

thanks,

greg k-h
