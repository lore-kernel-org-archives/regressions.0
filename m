Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFE1AFC8
	for <regressions@lists.linux.dev>; Thu,  6 Apr 2023 20:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5D7C433EF;
	Thu,  6 Apr 2023 20:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680811777;
	bh=CGv8PsIq5008OGTHPB/cPp26RRoDEto6uYBj+XB3bRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FLWgOExiSN6rtU4cOJDLnFrEUwhkeYd/Zl/+UYI8u3uf29kjPwPnIv6u/iL8Xfc+E
	 5rD24b7SLsyg8rDOFYuCp2QijNGPP7WCEbcY2qeSOi4dujYk9ecD9znCDgLJXuaAOa
	 7f7t+84XeqV8R+hZyOJvQK5gEyxfjACbcwie/Qqg=
Date: Thu, 6 Apr 2023 22:09:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rainer Fiebig <jrf@mailbox.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	stable@vger.kernel.org, tim.huang@amd.com,
	Alex Deucher <alexander.deucher@amd.com>
Subject: Re: 6.1.22: Resume from hibernate fails; bisected
Message-ID: <ZC8m_gjbB4oVlO5t@kroah.com>
References: <b52bfd11-0d90-739b-be3e-058e246478f7@mailbox.org>
 <c87add10-3e8f-b17e-f3f5-067431a23e16@leemhuis.info>
 <d3ac4ff5-863f-2179-1120-191774d80a27@mailbox.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3ac4ff5-863f-2179-1120-191774d80a27@mailbox.org>

On Thu, Apr 06, 2023 at 05:39:07PM +0200, Rainer Fiebig wrote:
> Am 06.04.23 um 15:30 schrieb Linux regression tracking (Thorsten Leemhuis):
> > [CCing the regression list, as it should be in the loop for regressions:
> > https://docs.kernel.org/admin-guide/reporting-regressions.html]
> > 
> > On 06.04.23 14:06, Rainer Fiebig wrote:
> >> Hi! Since kernel 6.1.22 starting a resume from hibernate by hitting a
> >> key on the keyboard fails. However, if the PC was switched off and on
> >> again (or reset), the resume is OK. The APU  is a Ryzen 5600G.
> >>
> >> Bisecting between 6.1.21/22 turned up this:
> >>
> >>
> >> Author: Tim Huang <tim.huang@amd.com>
> >> Date:   Thu Mar 9 16:27:51 2023 +0800
> >>
> >>     drm/amdgpu: skip ASIC reset for APUs when go to S4
> >>
> >>     commit b589626674de94d977e81c99bf7905872b991197 upstream.
> >>
> >>     For GC IP v11.0.4/11, PSP TMR need to be reserved
> >>     for ASIC mode2 reset. But for S4, when psp suspend,
> >>     it will destroy the TMR that fails the ASIC reset.
> >> [...]
> >>
> >>
> >> Reverting the commit solves the problem.
> >> Thanks.
> > 
> > Please try 6.1.23 and report back, because from the thread
> > https://lore.kernel.org/all/20230330160740.1dbff94b@schienar/
> > it sounds a lot like "drm/amdgpu: allow more APUs to do mode2 reset when
> > go to S4" might be fixing this, which went into 6.1.23.
> Yes, 6.1.23 seems OK so far.
> 
> I think, however, that rc-kernels and LTS-kernels are different matters.
>  With a bleeding edge kernel, problems are to be expected.  But an
> LTS-kernel is chosen for stability.  And this is the second time within
> just a few weeks that I've been bitten by a time-consuming hibernate-bug
> caused by a backport of a commit in amdgpu.
> 
> So I'm asking the devs to either test their patches more thoroughly or
> to be a bit more conservative with what they recommend for backporting
> to LTS-kernels.  Thanks.

Please feel free to suggest better ways to have automated tests for
stuff like this, or to help provide testing for the -rc LTS/stable
kernel releases.

We can't do this alone :)

thanks,

greg k-h
