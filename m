Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F5433F2
	for <regressions@lists.linux.dev>; Sun,  4 Jun 2023 12:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66BDC433D2;
	Sun,  4 Jun 2023 12:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685882432;
	bh=GBORFx6NZf+SmGL2+6CkgHcVVNLUpOpIAqVqVfbfRS0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gW4+HLoVIrumo4kp1p0NRGQ34x9aXqQi//3YhN1Ampaqpsk/KuuO0uzLRlXbz928V
	 r/AU6kb9wlj/+LuyTnLGUk/jrGHwCKwZ7lFh9btigIM0PBBFQOzAz4WjaTb9AKYYwR
	 uHVdAYOrYp2SSIrbRmgguHtx5GHw+TTi8/BFvH/+p3/Nx6Fhj4nP6GaX3YgAgU02iG
	 b4U0AAf/9oTGKHIX0KUEvC/NaNC/jGMeazMVgb3/vQvV05ubcvpRANSYfPo9PwVrv/
	 w4WHVieRmAuv0uPtpDgRFvMz3oumITfrTi+b0jdxb58PkFQiYOimc02fy3HNxtIezZ
	 GPpg2kZkxNMlw==
Date: Sun, 4 Jun 2023 13:40:27 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Linux regressions mailing list
 <regressions@lists.linux.dev>
Subject: Re: Linux regressions report  for mainline [2023-06-04]
Message-ID: <20230604134006.7c5c3f63@sal.lan>
In-Reply-To: <168588069830.1422846.3733273600224627850@leemhuis.info>
References: <168588069830.1422846.3733273600224627850@leemhuis.info>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun,  4 Jun 2023 12:13:57 +0000
"Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info> escreveu:

> Hi Linus. Nothing much to report for mainline, all business as usual. I
> had hoped Mauro would sent a pull with the media fixes, as they would
> contain one fix[1] for a bug that at least two people hit, but I guess
> it can wait another week.
> 
> Ohh, and in case you care: the Logitech HID bug[3] from the 6.3 cycle
> was not really fixed[4] by commit 6199d23c91c or we dealt with two
> problems all the time (I guess it's the latter). But that will take a
> few days to sort out.
> 
> [1] 14b4bd01f8e ("media: verisilicon: Additional fix for the crash when
> opening the driver")

We opted to use a different approach for the same bug [1]: 
14b4bd01f8e5 ("media: verisilicon: Additional fix for the crash when opening the driver")

[1] https://lore.kernel.org/linux-media/e674cfcb-6b1b-8052-7f29-e0e97bdda3be@xs4all.nl/T/

Patch is already at linux-next. I'm sending the pull request in
a few, together with other fixes.

I was planning to send this earlier, but I got sick and had to take
some days off to recover my health.

Regards,
Mauro
