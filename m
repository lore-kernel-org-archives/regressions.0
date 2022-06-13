Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB0AED1
	for <regressions@lists.linux.dev>; Mon, 13 Jun 2022 09:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2693BC34114;
	Mon, 13 Jun 2022 09:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1655111360;
	bh=C1GGeLLqOUP1Uqq8a/peVbcxO+P4+4GcrUo/KiI3Qho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ndETvf67eaf8wDSVVW656Fwc0PXIVLlTImp90yGwbget1ivItbtQt7YZwP9PzJfl0
	 4sqjN5u8ZHr6ZGrOEEajXzMjkPOBoMmhCLblogDnX+egVQKd8kt4AqUTOlZddO4EH3
	 MK3051CEIvy0UBaEtty9higVxiDgBFnLV9qZ7Xew=
Date: Mon, 13 Jun 2022 11:09:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yerong Li <yerong.li@outlook.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: external monitor no signal with HDMI port apple-gmux.c
Message-ID: <Yqb+vtXP5DzVK+dz@kroah.com>
References: <SG2PR03MB41529020102E6D613A0E651CFFA69@SG2PR03MB4152.apcprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SG2PR03MB41529020102E6D613A0E651CFFA69@SG2PR03MB4152.apcprd03.prod.outlook.com>

On Fri, Jun 10, 2022 at 02:57:37PM -0500, Yerong Li wrote:
> Hi there:
> 
> I am using debian 11 linux with a macbook pro 2013 15-inch. i7-3740QM CPU
> (NIVIDIA-GPU switch)
> 
> I think on my macbook pro the HDMI port with external monitor is not working
> while the DP port /thunderbolt 2 is working. (Actually one of my 2 DP port
> is working the other is not) These three ports work under MacOS system:
> 
> https://forums.developer.nvidia.com/t/external-monitor-not-working-nvidia-optimus/216573/2
> 
> Many users met similar issues: HDMI got detected by xrandr while the
> external monitor got no signals. Could you help us?
> 
> https://forums.developer.nvidia.com/t/no-signal-with-hdmi-or-dp-0-ports-on-macbookpro10-1-gt-650m-only-dp-1-works/49777/5
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/apple-gmux.c#n311

I do not think this is a regression with the kernel as it never has
worked before.

Please contact the graphics developers so that they can help you out
with this.

Good luck!

greg k-h
