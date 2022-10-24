Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C08809
	for <regressions@lists.linux.dev>; Mon, 24 Oct 2022 11:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131A5C433C1;
	Mon, 24 Oct 2022 11:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666610869;
	bh=K48NBAqgWRo1mETUSlqGN+xaE/Pq/ZahWJY6fwSb5EA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T56euOfBdEzjb+7ecAQnQL6UYh4mtgXlASkJmeiRtnBSCVX1odBlUG03sdqb0BjAh
	 mGxZH7FIH56a9eHvffUiIa/Pl8ai+HV5TK3ebKF16V0VcqOtCTw0+1wn7DpNXovgPj
	 UhzsVx4Xcu5lnaWnKhEu3i1eU0KFehGLs/fLErYs=
Date: Mon, 24 Oct 2022 13:27:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Andreas <andreas.thalhammer@linux.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	Javier Martinez Canillas <javierm@redhat.com>,
	ML dri-devel <dri-devel@lists.freedesktop.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Sasha Levin <sashal@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [Regression] CPU stalls and eventually causes a complete system
 freeze with 6.0.3 due to "video/aperture: Disable and unregister sysfb
 devices via aperture helpers"
Message-ID: <Y1Z2sq9RyEnIdixD@kroah.com>
References: <bbf7afe7-6ed2-6708-d302-4ba657444c45@leemhuis.info>
 <668a8ffd-ffc7-e1cc-28b4-1caca1bcc3d6@suse.de>
 <958fd763-01b6-0167-ba6b-97cbd3bddcb6@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <958fd763-01b6-0167-ba6b-97cbd3bddcb6@leemhuis.info>

On Mon, Oct 24, 2022 at 12:41:43PM +0200, Thorsten Leemhuis wrote:
> Hi! Thx for the reply.
> 
> On 24.10.22 12:26, Thomas Zimmermann wrote:
> > Am 23.10.22 um 10:04 schrieb Thorsten Leemhuis:
> >>
> >> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> >> kernel developer don't keep an eye on it, I decided to forward it by
> >> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216616  :
> >>
> >>>   Andreas 2022-10-22 14:25:32 UTC
> >>>
> >>> Created attachment 303074 [details]
> >>> dmesg
> > 
> > I've looked at the kernel log and found that simpledrm has been loaded
> > *after* amdgpu, which should never happen. The problematic patch has
> > been taken from a long list of refactoring work on this code. No wonder
> > that it doesn't work as expected.
> > 
> > Please cherry-pick commit 9d69ef183815 ("fbdev/core: Remove
> > remove_conflicting_pci_framebuffers()") into the 6.0 stable branch and
> > report on the results. It should fix the problem.
> 
> Greg, is that enough for you to pick this up? Or do you want Andreas to
> test first if it really fixes the reported problem?

This should be good enough.  If this does NOT fix the issue, please let
me know.

thanks,

greg k-h
