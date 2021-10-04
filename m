Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD823FC7
	for <regressions@lists.linux.dev>; Mon,  4 Oct 2021 11:36:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E47EF6120C;
	Mon,  4 Oct 2021 11:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1633347385;
	bh=gV/is5J7Ori0jb6QW/AxWkI7dbnpUWepXCUfHcc1sBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=z+7Nq0xVEgr8wkGANd3gcPOp51AupCwqO3JkD0X/dPdRHpSfLtcIY56ddAcTF+c+g
	 M+B2X7enU+/+01DagsBfoAsdyFLOq1BQzMa2uOjNfv5zROX+cM8bTenQCWIFm1R4Cd
	 87pFzK823ExOSd4rrdM/+fN2REoEho+C4CcA5M+c=
Date: Mon, 4 Oct 2021 13:36:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] nvme: code command_id with a genctr for
 use-after-free validation crashes apple T2 SSD
Message-ID: <YVrnN3pnmr/MOx/v@kroah.com>
References: <cjJiSFV77WM51ciS8EuBcdeBcv9T83PUB-Kw3yi8PuC_LwrrUUnQ3w5RC1PbKvSYE72KryXp3wOJhv4Ov_WWIe2gKWOOo5uwuUjbbFA8HDM=@protonmail.com>
 <438d711b-094b-fcfd-79e3-69f03a14df21@leemhuis.info>
 <637b0f3f-ac23-1e32-db7f-c696a04c1c73@leemhuis.info>
 <YVrI9rb4mnIs6RnF@kroah.com>
 <a5349810-aed0-3f35-654c-bfd89b2fc285@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5349810-aed0-3f35-654c-bfd89b2fc285@leemhuis.info>

On Mon, Oct 04, 2021 at 12:11:43PM +0200, Thorsten Leemhuis wrote:
> On 04.10.21 11:27, Greg KH wrote:
> > On Mon, Oct 04, 2021 at 11:17:21AM +0200, Thorsten Leemhuis wrote:
> >> On 26.09.21 07:59, Thorsten Leemhuis wrote:
> >>> On 25.09.21 15:10, Orlando Chamberlain wrote:
> >>>> Commit e7006de6c238 causes the SSD controller on Apple T2 computers to crash
> >>>> and prevents linux from booting.
> >>>>
> >>>> This commit implemented a counter that is stored within the NVMe command_id,
> >>>> however this counter makes the command_id higher than normal, causing a panic
> >>>> on the T2 security chip that functions as the SSD controller, which then
> >>>> causes the system to power off after a few seconds.
> >>>>
> >>>> This was reported on bugzilla here:
> >>>> https://bugzilla.kernel.org/show_bug.cgi?id=214509 but it was not originally
> >>>> classified as NVMe (when the report was created it was unknown what was
> >>>> causing it), so I don't know if it notified the NVMe mailing list when it
> >>>> was later reclassified to NVMe. Sorry if you've already seen this issue.
> > [...]
> >>> Feel free to ignore this message. I write it to make regzbot track above
> > [...]
> >> FWIW, this is just for the record: the fix for this landed in mainline,
> >> but didn't refer to this thread or the one montitored, hence I need to
> >> write this mail to make regzbot mark this regression as resolved:
> >>
> >> #regzbot monitor
> >> https://lore.kernel.org/all/20210927154306.387437-1-kbusch@kernel.org/
> > 
> > Thanks for tracking this, I'll go queue it up for 5.10.y and 5.14.y now.
> 
> Nice to hear that regzbot is helpful even while still in the early stage
> of field testing. FWIW, this regression made me consider adding two things:
> 
> * guess it would be a good idea if regzbot would simply export a
> parseable list with commit IDs of still unresolved mainline regressions,
> as your backports script then could simply consult it and put such
> commits on hold

That would be nice, but that's not a normal thing that happens often.

> * it afaics should even be possible to make regzbot detect "hey, this
> commit was backported, but the fix was not yet, so lets add it to the
> list of regressions in stable and longterm kernels and notify the stable
> team about it.

If a commit has a Fixes: tag in it, our scripts will pick this up.  But
this commit did not have a Fixes: tag in it, so it missed it :(

Ideally all regression fixes will have a fixes: tag in them, and then
you don't have to add any new scripting.

thanks,

greg k-h
