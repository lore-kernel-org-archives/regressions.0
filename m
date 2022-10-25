Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310D5EA4
	for <regressions@lists.linux.dev>; Tue, 25 Oct 2022 10:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D3FC433C1;
	Tue, 25 Oct 2022 10:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666693490;
	bh=aWhab37o0d58jbf51v4tfoUAve0ajDV+KieMDKAFO2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q0rc2kn+fdPBHOu8J9QheTBoaJ0A70wU65V7xvNXbWX9m5c/eTeCpyCBXyGcRlhua
	 YlYmH+qZorvQ0RHD9MvDSJviJXj7QPrgrvwx2484CMg/jFHDLGvNvM+2SpMlSDtBPM
	 Qxh8ISjiVi1oWd1N4tUUsplRf3Z0sDRcqb3OVnIo=
Date: Tue, 25 Oct 2022 12:25:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: andreas.thalhammer@linux.com,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Sasha Levin <sashal@kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	ML dri-devel <dri-devel@lists.freedesktop.org>,
	Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [Regression] CPU stalls and eventually causes a complete system
 freeze with 6.0.3 due to "video/aperture: Disable and unregister sysfb
 devices via aperture helpers"
Message-ID: <Y1e5pondOG/ljf7M@kroah.com>
References: <bbf7afe7-6ed2-6708-d302-4ba657444c45@leemhuis.info>
 <668a8ffd-ffc7-e1cc-28b4-1caca1bcc3d6@suse.de>
 <958fd763-01b6-0167-ba6b-97cbd3bddcb6@leemhuis.info>
 <Y1Z2sq9RyEnIdixD@kroah.com>
 <51651c2e-3706-37d7-01e7-5d473a412850@suse.de>
 <70e16994-6f5b-d648-0848-2eb7e3ad641a@gmx.net>
 <ef862938-3e1a-5138-2bda-d10e9188f920@suse.de>
 <95953ffd-32db-62be-bbba-8d4a88cb1ca6@gmx.net>
 <2603b160-32cf-d2ae-d218-01e86d3d7ede@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2603b160-32cf-d2ae-d218-01e86d3d7ede@suse.de>

On Tue, Oct 25, 2022 at 11:21:57AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.10.22 um 10:45 schrieb Andreas Thalhammer:
> [...]
> > > Yeah, it's also part of a larger changeset. But I wouldn't want to
> > > backport all those changes either.
> > > 
> > > Attached is a simple patch for linux-stable that adds the necessary fix.
> > > If this still doesn't work, we should probably revert the problematic
> > > patch.
> > > 
> > > Please test the patch and let me know if it works.
> > 
> > 
> > Yes, this fixed the problem. I'm running 6.0.3 with your patch now, all
> > fine.
> 
> Thanks a lot for testing. If Greg doesn't already pick up the patch from
> this discussion, I'll send it to stable soonish; adding your Tested-by tag.

Please send it as a real patch.

thanks,

greg k-h
