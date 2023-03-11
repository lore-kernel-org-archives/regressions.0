Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C143A23;
	Sat, 11 Mar 2023 12:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D02C433D2;
	Sat, 11 Mar 2023 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678537809;
	bh=2UnpI/uHgbFeseZ6WJQHzE4N7+CfviWl8IBFeSiIEiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uS6DLm5UPUhxRtPariV7SNAOO1a8pr1NgTwDTl8oE/XZrKVfIv4bRT8BSItVZhwPT
	 PO4X5imccCh4TQZ52oXXSHDDz+AToomtjCJZfyG/fxUbUmbANKot4EGMf7A9Ez3Kxm
	 3ODQ267kuCmBOIiHrUSHhXIcIrpjsnh6ZMJlkbmU=
Date: Sat, 11 Mar 2023 13:30:05 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Hector Martin <marcan@marcan.st>,
	Alexander Wetzel <alexander@wetzel-home.de>,
	linux-wireless@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>, johannes@sipsolutions.net,
	stable@vger.kernel.org, Asahi Linux <asahi@lists.linux.dev>,
	Ilya <me@0upti.me>, Janne Grunau <j@jannau.net>,
	LKML <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev
Subject: Re: [REGRESSION] Patch broke WPA auth: Re: [PATCH v2] wifi:
 cfg80211: Fix use after free for wext
Message-ID: <ZAx0TWRBlGfv7pNl@kroah.com>
References: <20230124141856.356646-1-alexander@wetzel-home.de>
 <d6851c2b-7966-6cb4-a51c-7268c60e0a86@marcan.st>
 <02ba45eb-1970-791a-d922-7b325ea51146@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02ba45eb-1970-791a-d922-7b325ea51146@redhat.com>

On Sat, Mar 11, 2023 at 12:03:44PM +0100, Hans de Goede wrote:
> Hi Hector,
> 
> On 3/11/23 10:55, Hector Martin wrote:
> > Hi,
> > 
> > This broke WPA auth entirely on brcmfmac (in offload mode) and probably
> > others, including on stable 6.2.3 and 6.3-rc1 (tested with iwd). Please
> > revert or fix. Notes below.
> > 
> > Reported-by: Ilya <me@0upti.me>
> > Reported-by: Janne Grunau <j@jannau.net>
> > 
> > #regzbot introduced: 015b8cc5e7c4d7
> > #regzbot monitor:
> > https://lore.kernel.org/linux-wireless/20230124141856.356646-1-alexander@wetzel-home.de/
> 
> I can confirm this bug, I was seeing broken wifi on brcmfmac with 6.3-rc1
> and I was about to start a git bisect for this this morning when I saw
> this email.
> 
> Reverting 015b8cc5e7c4d7 fixes the broken wifi. Hector, thank you, you
> just saved me from a bisect on somewhat slow hardware :)

Great, can someone submit the revert patch to the networking tree so we
can get this resolved quickly?

thanks,

greg k-h
