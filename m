Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B929E539D
	for <regressions@lists.linux.dev>; Fri, 24 Feb 2023 14:25:21 +0000 (UTC)
Date: Fri, 24 Feb 2023 14:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1677248719;
	bh=dZi9kxGc5dBklS0ESvRLJ0gpRNKig54XVYburYPqEUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=olYubdHzBRIBGcY3V0rvmMWBXr+USWB/OqpOgBysdpPbF9AoBq+PEQPn5cpcdp1QC
	 jQLCCHl6oGpJZFOuewjspYbTfuWglVqF2fRCCSunDFwDrUr0v4koxhiogPR+Ee+mmI
	 TZ/wCVibmr/1otEyN7x5evEGtXOIyubtbmz0uOAU=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: regressions@lists.linux.dev
Cc: regressions@leemhuis.info
Subject: Re: Bug with /dev/vcs* devices
Message-ID: <6685c2ab-fffe-4eb7-b8df-1019f68a5d5d@t-8ch.de>
References: <Y/KS6vdql2pIsCiI@hotmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/KS6vdql2pIsCiI@hotmail.com>

On Sun, Feb 19, 2023 at 04:21:46PM -0500, Storm Dragon wrote:
> Howdy,
> 
> This is my first time ever submitting a kernel bug, so I apologize if this is the wrong place. As per the instructions I found, I first filed a bug in Arch Linux:
> 
> https://bugs.archlinux.org/task/77575
> 
> I will add the contents of the response here:
> 
> For the record, here are the 2 associated mailing list threads [1][2].
> The reason why it affects both LTS and current linux is because it appears a security patch was applied to both trees to fix a UAF (use after free) bug.
> If that patch is problematic, you should report it upstream to the kernel folks. Maybe even email the patch author directly. It's this patch [3]. Please let us
> know what you find out.
> [1] https://lists.archlinux.org/archives/list/arch-general%40lists.archlinux.org/thread/EOSHIVGUZLNAD7BPHSUGOXFYSAFWDYH7/
> [2] https://lists.archlinux.org/archives/list/arch-general%40lists.archlinux.org/thread/S6R6UDUMX2LWL4HJ74MFNYOES45UBFLF/
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/tty/vt/vc_screen.c?h=v5.15.94&id=fc9e27f3ba083534b8bbf72ab0f5c810ffdc7d18
> 
> ----------End Response ----------
> 
> Methods for reproducing the bug are included in the link to the bug above. But I will include one of them here as well. As root:
> 
> [root@mjollnir ~]# cat /dev/vcsa1
>    cat: /dev/vcsa1: No such device or address
> 
> The contents is displayed very briefly before the No such device or address error.
> 
> Thank you,
> Storm

#regzbot title: vc_screen: unexpected ENXIO on read
#regzbot introduced: 226fae124b2dac217ea5436060d623ff3385bc34 ^
