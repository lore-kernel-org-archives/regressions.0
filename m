Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703DB29CA
	for <regressions@lists.linux.dev>; Mon,  4 Oct 2021 09:27:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 560BD61244;
	Mon,  4 Oct 2021 09:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1633339640;
	bh=b4ZYpyohqzeys0i/j4ALxrVGxw5Qvo3S9Ph4XAWQtvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QKLFEF9fLg1JzWM2kASPFt/eLVIsc6gAT6+Mw07h6+vYPy436S9Xt9/NWOSM35oVJ
	 9YOamDqgbmYP0aRZvRKxlguUEiTTT+ZQ7gFh7mRdADobuFF85PCZ0VdHexJNsxNwo6
	 YoMoZ72Na4g9Ux8uLMcFiGGP7iXACOyMbix8Lslc=
Date: Mon, 4 Oct 2021 11:27:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] nvme: code command_id with a genctr for
 use-after-free validation crashes apple T2 SSD
Message-ID: <YVrI9rb4mnIs6RnF@kroah.com>
References: <cjJiSFV77WM51ciS8EuBcdeBcv9T83PUB-Kw3yi8PuC_LwrrUUnQ3w5RC1PbKvSYE72KryXp3wOJhv4Ov_WWIe2gKWOOo5uwuUjbbFA8HDM=@protonmail.com>
 <438d711b-094b-fcfd-79e3-69f03a14df21@leemhuis.info>
 <637b0f3f-ac23-1e32-db7f-c696a04c1c73@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <637b0f3f-ac23-1e32-db7f-c696a04c1c73@leemhuis.info>

On Mon, Oct 04, 2021 at 11:17:21AM +0200, Thorsten Leemhuis wrote:
> 
> On 26.09.21 07:59, Thorsten Leemhuis wrote:
> > On 25.09.21 15:10, Orlando Chamberlain wrote:
> >> Commit e7006de6c238 causes the SSD controller on Apple T2 computers to crash
> >> and prevents linux from booting.
> >>
> >> This commit implemented a counter that is stored within the NVMe command_id,
> >> however this counter makes the command_id higher than normal, causing a panic
> >> on the T2 security chip that functions as the SSD controller, which then
> >> causes the system to power off after a few seconds.
> >>
> >> This was reported on bugzilla here:
> >> https://bugzilla.kernel.org/show_bug.cgi?id=214509 but it was not originally
> >> classified as NVMe (when the report was created it was unknown what was
> >> causing it), so I don't know if it notified the NVMe mailing list when it
> >> was later reclassified to NVMe. Sorry if you've already seen this issue.
> >>
> >> The T2 security chip (which is the SSD) has this line in its crash log (the
> >> rest of this log is in an attachment on the bugzilla report):
> >>
> >> panic(cpu 1 caller 0xfffffff028d884ec): ANS2 Recoverable Panic - assert failed: [7447]:command id out of range error (cid = 4120), status_reg: 0x2000 - Null(2)
> >>
> >> This is the entry in lspci -nn for the ssd:
> >>
> >> 04:00.0 Mass storage controller [0180]: Apple Inc. ANS2 NVMe Controller [106b:2005] (rev 01)
> >>
> >> This commit was included in 5.14.6 and backported to 5.10.67, but does not
> >> occur in 5.14.5 and 5.10.66. I am on a MacBookPro16,1, the crash has been
> >> reproduced on a MacBookPro16,2 as well. I have been able to reproduce on Arch
> >> Linux with vanilla kernel 5.10.67 (others have gotten it on 5.14.6) with no
> >> DKMS modules, and I bisected it to that commit
> >> (e7006de6c23803799be000a5dcce4d916a36541a).
> > 
> > Feel free to ignore this message. I write it to make regzbot track above
> > issue. Regzbot is the regression tracking bot I'm working on. It's still
> > in the early stages and this is still one of the first few regression I
> > make it track to get started and things tested in the field. That also
> > why I'm sending the mail just to the regressions list (it will do its
> > fully magic nevertheless). For details see:
> > https://linux-regtracking.leemhuis.info/post/inital-regzbot-running/
> > https://linux-regtracking.leemhuis.info/post/regzbot-approach/
> > 
> > #regzbot ^introduced e7006de6c23803799be000a5dcce4d916a36541a
> > 
> > #regzbot monitor
> > https://lore.kernel.org/lkml/CAHk-=wgML11x9afCvmg9yhVm9wi5mvnjBvmX+i7OfMA0Vd4FWA@mail.gmail.com/
> 
> FWIW, this is just for the record: the fix for this landed in mainline,
> but didn't refer to this thread or the one montitored, hence I need to
> write this mail to make regzbot mark this regression as resolved:
> 
> #regzbot monitor
> https://lore.kernel.org/all/20210927154306.387437-1-kbusch@kernel.org/

Thanks for tracking this, I'll go queue it up for 5.10.y and 5.14.y now.

greg k-h
